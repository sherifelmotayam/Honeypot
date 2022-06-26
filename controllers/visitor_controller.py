from models.admin import Admin
from models.brute_force_detector import BruteForceDetector
from models.visitor import Visitor
from models.send_alert import Alert
from models.ml_detect_xssi import CrosssiteScriptingInjectionDetector
# from models.ml_detect_sqli import SQLInjectionDetector
from models.fake_account_generator import FakeAccountGenerator

from models.normal_user import NormalUser
from models.attacker import Attacker

from flask import render_template, session, jsonify
from flask import request, redirect, url_for


from datetime import datetime
import httpagentparser
import urllib.request

import json

class VisitorController:

    __isAttacker = False
    __visitor = Visitor()
    __bf_detector = BruteForceDetector()
    __attacker = Attacker()
    __normalUser = NormalUser()
    __admin = Admin()
    # __sqlInjectionDetector = SQLInjectionDetector()
    __crosssiteScriptingDetector = CrosssiteScriptingInjectionDetector()

    def getAnalyticsData(self):
        
        userInfo = httpagentparser.detect(request.headers.get('User-Agent'))

        userOS = userInfo['platform']['name']
        self.__visitor.set_userOS(userOS)

        userBrowser = userInfo['browser']['name']
        self.__visitor.set_userBrowser(userBrowser)

        if(request.headers.getlist('X-Forwarded-For')):
            userIP = request.headers.getlist('X-Forwarded-For')[0]
            self.__visitor.set_userIP(userIP)
        else:
            userIP = request.remote_addr # 127.0.0.1
            self.__visitor.set_userIP(userIP)
        print(userIP)

        #? [API] to collect information about the visitor
        api = "https://www.iplocate.io/api/lookup/" + userIP
        try:                
            resp = urllib.request.urlopen(api)
            result = resp.read()
            result = json.loads(result.decode("utf-8"))                                                                                                     
            userCountry = result["country"]
            self.__visitor.set_userCountry(userCountry)

            userContinent = result["continent"]
            self.__visitor.set_userContinent(userContinent)

            userCity = result["city"]
            self.__visitor.set_userCity(userCity)
        except:
            print("Could not find: ", userIP)
        self.__visitor.getSession()
    
    """check the url for the whole system to check whether it contains xss or not"""
    def check_urls(self, url):
        result = self.__crosssiteScriptingDetector.calculate_features_and_predict(url)
        if(result > 0):
            print(f"Your payload {request.url} is malicious - 403 error\n")
            # self.__admin.add_blocked_ip(self.__visitor.get_userIP()) # get the user ip to be blocked

            alert = Alert(self.__visitor.get_userIP(), self.__visitor.get_userContinent(), self.__visitor.get_userCountry(), self.__visitor.get_userCity(), self.__visitor.get_userOS(), self.__visitor.get_userBrowser(), self.__visitor.get_sessionID(), str(datetime.now().replace(microsecond=0)), "Cross-site Scripting Attack")
            alert.send_alert()
            # return "<script>alert('document.cookie');</script>"
        else:
            print(f"Your payload {request.url} is safe 200 OK\n")

    """check the entry in the text fields"""
    def check_input(self, input):
        result = self.__crosssiteScriptingDetector.calculate_features_and_predict(input)
        if(result > 0):
            print(f"Your payload {input} is malicious - 403 error\n")
            # self.__admin.add_blocked_ip(self.__visitor.get_userIP()) # get the user ip to be blocked

            alert = Alert(self.__visitor.get_userIP(), self.__visitor.get_userContinent(), self.__visitor.get_userCountry(), self.__visitor.get_userCity(), self.__visitor.get_userOS(), self.__visitor.get_userBrowser(), self.__visitor.get_sessionID(), str(datetime.now().replace(microsecond=0)), "Cross-site Scripting Attack")
            alert.send_alert()
            return "<script>alert('document.cookie');</script>"
        else:
            print(f"Your payload {input} is safe 200 OK\n")

    def login(self):
        """check whether the ip is blocked or not"""
        blocked_ips = self.__admin.read_blocked_ips()
        print("blocked ips: ", blocked_ips)
        """check if the user is already blocked navigate him to forbidden page"""
        for i in range(len(blocked_ips)):
            if(self.__visitor.get_userIP() in blocked_ips[i]['ip']): 
                return redirect(url_for('error403'))

        print("url: ", request.url)
        self.check_urls(request.url)

    
        begin = self.__bf_detector.startTime()
        data = ['login', self.__visitor.get_sessionID(), str(datetime.now().replace(microsecond=0))]
        self.__visitor.parseVisitor(data)
        # Output message if something goes wrong...
        msg = ''
        # Check if "username" and "password" POST requests exist (user submitted form)
        if request.method == 'POST' and 'email' in request.form and 'password' in request.form:

            # Create variables for easy access
            email = request.form['email']
            password = request.form['password']

            # check_data = "this is a text"
            # res_email = self.__sqlInjectionDetector.Check_is_sql(email)
            # res_password = self.__sqlInjectionDetector.Check_is_sql(password)
            # print ("PROCCESSING: {} & {}".format(email, password))
            # print ("------------------------------")
            # print ("RESULT: ")
            # if(res_email == 1 or res_password == 1):
            #     print ("[SQL INJECTION DETECTED]")
            
            #     self.__admin.add_blocked_ip(self.__visitor.get_userIP()) # get the user ip to be blocked

            #     alert = Alert(self.__visitor.get_userIP(), self.__visitor.get_userContinent(), self.__visitor.get_userCountry(), self.__visitor.get_userCity(), self.__visitor.get_userOS(), self.__visitor.get_userBrowser(), self.__visitor.get_sessionID(), str(datetime.now().replace(microsecond=0)), "SQL Injection")
            #     alert.send_alert()
            
            #     self.__isAttacker = True
            #     session['loggedin'] = True
            #     session['id'] = ""
            #     session['email'] = ""
            #     session['type'] = 1
            #     return redirect(url_for('home'))
                
            # else:
            #     print ("[NO SQL INJECTION DETECTED]")
            #     self.__isAttacker = False

            """if the email found in the fake data server then it was bruteforced before [BRUTEFORCE ATTACK]"""
            account = self.__attacker.select_account(email, password)
            if(account):
                print("[ATTACK ON DOOR")
                self.__isAttacker = True
                session['loggedin'] = True
                session['id'] = account['id']
                session['email'] = request.form['email']
                session['type'] = 1
                alert = Alert(self.__visitor.get_userIP(), self.__visitor.get_userContinent(), self.__visitor.get_userCountry(), self.__visitor.get_userCity(), self.__visitor.get_userOS(), self.__visitor.get_userBrowser(), self.__visitor.get_sessionID(), str(datetime.now().replace(microsecond=0)), "Brute Force Attack")
                alert.send_alert()
                self.data(account)
                return redirect(url_for('home'))

            account = self.__visitor.login_user(email, password)
            
            # print('result account {}'.format(account['isAttacker']))
            # If account exists in accounts table in out database
            if(account and self.__visitor.get_user_type() == 1): # user

                # Create session data, we can access this data in other routes
                session['loggedin'] = True
                session['id'] = self.__visitor.get_user_id()
                session['email'] = self.__visitor.get_email()
                session['type'] = 1
                # Redirect to home page
                return redirect(url_for('home'))

            elif(account and self.__visitor.get_user_type() == 2):  # admin

                # Create session data, we can access this data in other routes
                session['loggedin'] = True
                session['id'] = self.__visitor.get_user_id()
                session['email'] = self.__visitor.get_email()
                session['type'] = 2
                # Redirect to home page
                return redirect(url_for('dashboard'))

            else:
                
                same_user = self.__bf_detector.attackSameUser(email)
                self.__bf_detector.numberOfFailedAttempts()
                print("[SAME USER CTR] : ", same_user)
                self.__bf_detector.passTaken(password)     
                end = self.__bf_detector.endTime()
                self.__bf_detector.timeList(begin, end)
                THRESHOLD_RESULT = self.__bf_detector.threshold()

                if(THRESHOLD_RESULT == 1):
                    print("[ATTACK ON DOOR]")
 

                    alert = Alert(self.__visitor.get_userIP(), self.__visitor.get_userContinent(), self.__visitor.get_userCountry(), self.__visitor.get_userCity(), self.__visitor.get_userOS(), self.__visitor.get_userBrowser(), self.__visitor.get_sessionID(), str(datetime.now().replace(microsecond=0)), "Brute Force Attack")
                    alert.send_alert()
                    """
                    check if this email in the fake data server has fake data or not
                    if it has data get it and enter the websie
                    if not generate fake data
                    """
                    account = self.__attacker.select_account_email(email)
                    print("account: ", account)
                    if account:
                        self.__isAttacker = True
                        session['loggedin'] = True
                        session['id'] = account['id']
                        session['email'] = request.form['email']
                        session['type'] = 1
                    else:
                        self.__isAttacker = True
                        session['loggedin'] = True
                        session['type'] = 1
                        self.__faker = FakeAccountGenerator(email)
                        account = self.__attacker.select_account_email(email)
                    self.data(account)
                    
                    return redirect(url_for('home'))
                else:
                    print("NO ATTACK")
                    self.__isAttacker= False

                # Account doesnt exist or username/password incorrect
                msg = 'Incorrect email/password!'
        # Show the login form with message (if any)        
        return render_template('index.html', msg=msg)

    def data(self, account):
        self.__visitor.set_user_id(account['id'])
        self.__visitor.set_first_name(account['first_name'])
        self.__visitor.set_last_name(account['last_name'])
        self.__visitor.set_user_email(account['email'])
        self.__visitor.set_user_password(account['password'])
        self.__visitor.set_type(account['type'])

    def profile(self):
        print("url: ", request.url)
        self.check_urls(request.url)

        data = ['profile', self.__visitor.get_sessionID(), str(datetime.now().replace(microsecond=0))]
        self.__visitor.parseVisitor(data)

        # Check if user is loggedin 
        if 'loggedin' in session and session['type'] == 1:
            # We need all the account info for the user so we can display it on the profile page
            first_name = self.__visitor.get_first_name()
            last_name = self.__visitor.get_last_name()
            email = self.__visitor.get_email()
            password = self.__visitor.get_password()
            if(first_name != None and last_name != None and email != None and password != None):
                fullname = first_name + " " + last_name
            else: 
                fullname = ""
                first_name = ""
                last_name = ""
                email = ""
                password = ""
                
            # Show the profile page with account info
            return render_template('profile.html', first_name=first_name, last_name=last_name, email=email, password=password, fullname=fullname)
        # User is not loggedin or another type redirect to login page
        return redirect(url_for('error403'))

    def home(self):
        print("url: ", request.url)
        self.check_urls(request.url)

        data = ['home', self.__visitor.get_sessionID(), str(datetime.now().replace(microsecond=0))]
        self.__visitor.parseVisitor(data)
        fn = self.__visitor.get_first_name()
        ln = self.__visitor.get_last_name()
        print("lnnnnnnnnnn", ln)

        if self.__isAttacker:
            employees_count = self.__attacker.employees_count()
            managers_count = self.__attacker.managers_count()
            total_salary = self.__attacker.total_salary()
            departments_count = self.__attacker.departments_count()
        else:
            employees_count = self.__normalUser.employees_count()
            managers_count = self.__normalUser.managers_count()
            total_salary = self.__normalUser.total_salary()
            departments_count = self.__normalUser.departments_count()

        if(fn != None and ln != None):
            fullname = fn + " " + ln
        else: 
            fullname = ""
        # Check if user is loggedin
        if 'loggedin' in session and session['type'] == 1:
            # User is loggedin show them the home page
            return render_template('home.html', fullname=fullname, employees_count=employees_count, managers_count=managers_count, total_salary=total_salary, departments_count=departments_count)
        # User is not loggedin redirect to login page
        return redirect(url_for('error403'))

    def logout(self):

        if self.__isAttacker:
            self.__admin.add_blocked_ip(self.__visitor.get_userIP()) # get the user ip to be blocked
        # Remove session data, this will log the user out
        session.pop('loggedin', None)
        session.pop('id', None)
        session.pop('email', None)
        session.pop('type', None)
        # Redirect to login page
        return redirect(url_for('login')) 

    def addEmployee(self):
        data = ['add employees', self.__visitor.get_sessionID(), str(datetime.now().replace(microsecond=0))]
        self.__visitor.parseVisitor(data)
        first_name = self.__visitor.get_first_name()
        last_name = self.__visitor.get_last_name()
        if first_name != None and last_name != None:
            fullname = first_name + " " + last_name
        else:
            fullname = ""
        if 'loggedin' in session and session['type'] == 1:
            return render_template('add-employee.html', fullname=fullname)
        else:
            return redirect(url_for('error403'))

    def addEmployees(self):
        msg=""
        if request.method == 'POST':
            fn = request.form['fn']
            ln = request.form['ln']
            email = request.form['email']
            pn = request.form['pn']
            hd = request.form['hd']
            jId = request.form['jid']
            salary = request.form['salary']
            
            if self.__isAttacker:
                self.__attacker.add_employee(fn, ln, email, pn, hd, jId, salary)
            else:
                self.__normalUser.add_employee(fn, ln, email, pn, hd, jId, salary)
        
            msg = "Employee added successfully"
            return redirect(url_for("addEmployees")) 
        return render_template("add-employee.html", msg=msg)

    def get_all_employees(self):
        data = []
        if self.__isAttacker:
            dbRows = self.__attacker.read_employees()
        else:
            dbRows = self.__normalUser.read_employees()
        for row in dbRows:
            data.append({
                'employeeId' : row['EMPLOYEE_ID'],
                'firstName' : row['FIRST_NAME'],
                'lastName' : row['LAST_NAME'], 
                'email' : row['EMAIL'], 
                'phoneNumber' : row['PHONE_NUMBER'], 
                'hireDate' : row['HIRE_DATE'], 
                'job' : row['JOB_TITLE'],
                'salary' : row['SALARY']
            })
        return jsonify(data)

    def about_us(self):
        data = ['about us', self.__visitor.get_sessionID(), str(datetime.now().replace(microsecond=0))]
        self.__visitor.parseVisitor(data)

        first_name = self.__visitor.get_first_name()
        last_name = self.__visitor.get_last_name()
        if first_name != None and last_name != None:
            fullname = first_name + " " + last_name
        else:
            fullname = ""
        
        if 'loggedin' in session and session['type'] == 1:
            return render_template('about-us.html', fullname=fullname)
        else:
            return redirect(url_for('error403'))

        
        # return render_template('about-us.html')