# from flask_mysqldb import MySQL
# import MySQLdb.cursors
import re
from tracemalloc import start
from flask import request, abort, redirect, url_for, current_app as app
from flask import Flask, render_template, request, session, jsonify
import urllib.request
from pusher import Pusher
from datetime import datetime
import httpagentparser
import json
import os
import hashlib
from dbsetup import add_blocked_ip, create_connection, create_session, exist_account, login_user, profile_user, read_blocked_ips, read_employees, read_ips, register_user, remove_blocked_ips, total_pages_view, total_sessions, total_visitors, unique_pages_view, update_or_create_page, select_all_sessions, select_all_user_visits
from flask_ngrok import run_with_ngrok
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address
# from ml_detect_sqli import *
from send_alert import *
from brute_force_detector import *

app = Flask(__name__)
app.secret_key = os.urandom(24)

limiter = Limiter(
    app,
    key_func=get_remote_address,
)

# Enter your database connection details below
# app.config['MYSQL_HOST'] = 'localhost'
# app.config['MYSQL_USER'] = 'root'
# app.config['MYSQL_PASSWORD'] = ''
# app.config['MYSQL_DB'] = 'honeypot'

# Intialize MySQL
# mysql = MySQL(app)

pusher = Pusher(app_id=u'1324185', key=u'435101e4bb9a726a3374', secret=u'd3c0ee2cb1920faf7527', cluster=u'mt1', ssl=True)

# Initialize Sqlite
# database = "./pythonsqlite.db"
conn = create_connection()
c = conn.cursor()

userOS = None
userIP = None
userCity = None
userBrowser = None
userCountry = None
userContinent = None
sessionID = None
time = None
block_list = []


def main():
    global conn, c

def parseVisitor(data):
    update_or_create_page(c,data)
    pusher.trigger(u'pageview', u'new', {
        u'page': data[0],
        u'session': sessionID,
        u'ip': userIP
    })
    pusher.trigger(u'numbers', u'update', {
        u'page': data[0],
        u'session': sessionID,
        u'ip': userIP
    })

@app.before_request
def getAnalyticsData():
    global userOS, userBrowser, userIP, userContinent, userCity, userCountry,sessionID 
    userInfo = httpagentparser.detect(request.headers.get('User-Agent'))
    userOS = userInfo['platform']['name']
    userBrowser = userInfo['browser']['name']
    if(request.headers.getlist('X-Forwarded-For')):
        userIP = request.headers.getlist('X-Forwarded-For')[0]
    else:
        userIP = request.remote_addr # 127.0.0.1
    print(userIP)
    api = "https://www.iplocate.io/api/lookup/" + userIP
    try:                
        resp = urllib.request.urlopen(api)
        result = resp.read()
        result = json.loads(result.decode("utf-8"))                                                                                                     
        userCountry = result["country"]
        userContinent = result["continent"]
        userCity = result["city"]
    except:
        print("Could not find: ", userIP)
    getSession()
    
def getSession():
    global sessionID
    time = datetime.now().replace(microsecond=0)
    if 'user' not in session:
        lines = (str(time)+userIP).encode('utf-8')
        session['user'] = hashlib.md5(lines).hexdigest()
        sessionID = session['user']
        pusher.trigger(u'session', u'new', {
            u'ip': userIP,
            u'continent': userContinent,
            u'country': userCountry,
            u'city': userCity,
            u'os': userOS,
            u'browser': userBrowser,
            u'session': sessionID,
            u'time': str(time),
        })
        data = [userIP, userContinent, userCountry, userCity, userOS, userBrowser, sessionID, time]
        # print('ip{}'.format(data[0]))
        create_session(c,data)
    else:
        sessionID = session['user']
    
@app.before_request
def block_method():
    result = True
    ip = request.headers.getlist('X-Forwarded-For')[0] # public ip of the user
    if ip in block_list:
      result = True
    else:
      result = False

    if (result):
        abort(403) #forbidden

run_with_ngrok(app)

@app.errorhandler(429) # maximum rate limit produce 429 status code
def ratelimit_handler(e):
    print(e)
    return redirect(url_for('about'))
    

@app.route('/', methods=['GET', 'POST'])
@limiter.limit("1/second")
def login():
    begin = startTime()
    data = ['login', sessionID, str(datetime.now().replace(microsecond=0))]
    parseVisitor(data)
    # Output message if something goes wrong...
    msg = ''
    # Check if "username" and "password" POST requests exist (user submitted form)
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form:

        # Create variables for easy access
        username = request.form['username']
        password = request.form['password']

        # check_data = "this is a text"
        # res_usr_name = Check_is_sql(username)
        # res_password = Check_is_sql(password)
        # print ("PROCCESSING: {} & {}".format(username, password))
        # print ("------------------------------")
        # print ("RESULT: ")
        # if(res_usr_name == 1 or res_password == 1):
        #     print ("[SQL INJECTION DETECTED]")
        #     send_alert(userIP, userContinent, userCountry, userCity, userOS, userBrowser, sessionID, str(datetime.now().replace(microsecond=0)))
        # else:
        #     print ("[NO SQL INJECTION DETECTED]")

        # Check if account exists using MySQL
        #cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        #cursor.execute('SELECT * FROM accounts WHERE username = %s AND password = %s', (username, password,))
        # Fetch one record and return result
        #account = cursor.fetchone()
        account = login_user(c, username, password)
        # print('result account {}'.format(account['type']))

        # If account exists in accounts table in out database
        if(account and account[4] == 'user'):
            # Create session data, we can access this data in other routes
            session['loggedin'] = True
            session['id'] = account[0]
            session['username'] = account[1]
            account = profile_user(c, session['id'])
            # Redirect to home page
            return redirect(url_for('home'))

        elif(account and account[4] == 'admin'):  
            # Create session data, we can access this data in other routes
            session['loggedin'] = True
            session['id'] = account[0]
            session['username'] = account[1]
            # Redirect to home page
            return redirect(url_for('dashboard'))

        else:
            
            same_user = attackSameUser(username)
            numberOfFailedAttempts()
            print("SAME USER CTR : ", same_user)
            passTaken(password)     
            end = endTime()
            timeList(begin, end)
            THRESHOLD_RESULT = threshold()

            if(THRESHOLD_RESULT == 1):
                print("ATTACK ON DOOR")
            else:
                print("NO ATTACK")

            # Account doesnt exist or username/password incorrect
            msg = 'Incorrect username/password!'
     # Show the login form with message (if any)        
    return render_template('index.html', msg=msg)

# http://localhost:5000/pythinlogin/profile - this will be the profile page, only accessible for loggedin users
@app.route('/profile')
def profile():
    data = ['profile', sessionID, str(datetime.now().replace(microsecond=0))]
    parseVisitor(data)

    # Check if user is loggedin
    if 'loggedin' in session:
        # We need all the account info for the user so we can display it on the profile page
        # cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        # cursor.execute('SELECT * FROM accounts WHERE id = %s', (session['id'],))
        account = profile_user(c, session['id'])
        # Show the profile page with account info
        return render_template('profile.html', account=account)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

# http://localhost:5000/pythinlogin/register - this will be the registration page, we need to use both GET and POST requests
@app.route('/register', methods=['GET', 'POST'])
@limiter.limit("1/second")
def register():
    data = ['register', sessionID, str(datetime.now().replace(microsecond=0))]
    parseVisitor(data)

    # Output message if something goes wrong...
    msg = ''
    # Check if "username", "password" and "email" POST requests exist (user submitted form)
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form and 'email' in request.form:
        # Create variables for easy access
        username = request.form['username']
        password = request.form['password']
        email = request.form['email']

        # Check if account exists using MySQL
        #cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        #cursor.execute('SELECT * FROM accounts WHERE username = %s', (username,))
        #account = cursor.fetchone()
        # If account exists show error and validation checks

        account = exist_account(c, username)

        if account:
            msg = 'Account already exists!'
        elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
            msg = 'Invalid email address!'
        elif not re.match(r'[A-Za-z0-9]+', username):
            msg = 'Username must contain only characters and numbers!'
        elif not re.match(r'[A-Za-z0-9]+', password):
            msg = 'Password must contain only characters and numbers!'
        elif len(password) < 6 :
            msg = 'Password must be at least 6 characters!'
        elif not username or not password or not email:
            msg = 'Please fill out the form!'
        else:
            # Account doesnt exists and the form data is valid, now insert new account into accounts table
            #cursor.execute('INSERT INTO accounts VALUES (NULL, %s, %s, %s)', (username, password, email,))
            #mysql.connection.commit()
            register_user(c, username, password, email)
            msg = 'You have successfully registered!'

    elif request.method == 'POST':
        # Form is empty... (no POST data)
        msg = 'Please fill out the form!'
    # Show registration form with message (if any)
    return render_template('register.html', msg=msg)

