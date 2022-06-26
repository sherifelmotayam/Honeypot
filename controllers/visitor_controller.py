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