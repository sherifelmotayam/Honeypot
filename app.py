from flask import request, abort, current_app as app
from flask import Flask, render_template, request, session, jsonify
import urllib.request
from pusher import Pusher
from datetime import datetime
import httpagentparser
import json
import os
import hashlib
from dbsetup import create_connection, create_session, update_or_create_page, select_all_sessions, select_all_user_visits, select_all_pages
from flask_ngrok import run_with_ngrok

app = Flask(__name__)
app.secret_key = os.urandom(24)

pusher = Pusher(app_id=u'1324185', key=u'435101e4bb9a726a3374', secret=u'd3c0ee2cb1920faf7527', cluster=u'mt1', ssl=True)

database = "./pythonsqlite.db"
conn = create_connection(database)
c = conn.cursor()

userOS = None
userIP = None
userCity = None
userBrowser = None
userCountry = None
userContinent = None
sessionID = None
ip_list = ['197.37.125.6', '156.213.217.255', '41.45.114.252', '197.57.240.214']
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
        userIP = request.remote_addr
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

@app.before_request
def block_method():
    x = True
    ip = request.headers.getlist('X-Forwarded-For')[0]
    if ip in ip_list:
      x = True
    else:
      x = False

    if (not x):
        abort(403)
    
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

run_with_ngrok(app)
@app.route('/')
def index():
    data = ['home', sessionID, str(datetime.now().replace(microsecond=0))]
    parseVisitor(data)
    return render_template('index.html')
    
@app.route('/about')
def about():
    data = ['about',sessionID, str(datetime.now().replace(microsecond=0))]
    parseVisitor(data)
    return render_template('about.html')
    
@app.route('/dashboard')
def dashboard():
    return render_template('dashboard.html')
    
@app.route('/dashboard/<session_id>', methods=['GET'])
def sessionPages(session_id):
    result = select_all_user_visits(c,session_id)
    return render_template("dashboard-single.html",data=result)
    
@app.route('/get-all-sessions')
def get_all_sessions():
    data = []
    dbRows = select_all_sessions(c)
    for row in dbRows:
        data.append({
            'ip' : row['ip'],
            'continent' : row['continent'],
            'country' : row['country'], 
            'city' : row['city'], 
            'os' : row['os'], 
            'browser' : row['browser'], 
            'session' : row['session'],
            'time' : row['created_at']
        })
    return jsonify(data)
    
if __name__ == '__main__':
    main()
    #app.run(debug=True)
    app.run()