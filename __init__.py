from flask import Flask, current_app as app

import os

from flask_ngrok import run_with_ngrok
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address


from controllers.visitor_controller import VisitorController
visitorController = VisitorController()

from controllers.admin_controller import AdminController
adminController = AdminController()

from controllers.errors_controller import ErrorsController
errorController = ErrorsController()

app = Flask(__name__)
run_with_ngrok(app)
app.secret_key = os.urandom(24) # to use sessions secret key is a must

"""using flask limiter to limit the number of accessing the webpage"""
limiter = Limiter(app,key_func=get_remote_address,)

# @app.errorhandler(403)
# def page_not_found(e):
#     # note that we set the 404 status explicitly
#     return render_template('404.html'), 404

@app.before_request
def getAnalyticsData():
    return visitorController.getAnalyticsData()

@app.route('/', methods=['GET', 'POST'])
@limiter.limit("1/second")
def login():
    return visitorController.login()

@app.route('/profile')
@limiter.limit("1/second")
def profile():
    return visitorController.profile()

@app.route('/addEmployee')
def addEmployee():
    return visitorController.addEmployee()

@app.route('/add-employee', methods=['GET', 'POST'])
@limiter.limit("1/second")
def addEmployees():
    return visitorController.addEmployees()

@app.route('/register', methods=['GET', 'POST'])
@limiter.limit("1/second")
def register():
    return visitorController.register()

@app.route('/home')
@limiter.limit("1/second")
def home():
    return visitorController.home()

@app.route('/dashboard')
def dashboard():
    return adminController.dashboard()

@app.route('/dashboard/<session_id>', methods=['GET'])
def sessionPages(session_id):
    return adminController.sessionPages(session_id)

@app.route('/logout')
def logout():
    return visitorController.logout()

@app.route('/get-all-sessions')
def get_all_sessions():
    return adminController.get_all_sessions()
    
@app.route('/get-all-employees')
def get_all_employees():
    return visitorController.get_all_employees()

@app.route('/get-all-blocked-ips')
def get_all_blocked_ips():
    return adminController.get_all_blocked_ips()   

@app.route('/ip')
def ip():
    return adminController.ip()

@app.route('/blockAction', methods=['GET','POST'])
def blockAction():
    return adminController.blockAction()

@app.route('/unBlockAction', methods=['GET','POST'])
def unBlockAction():
    return adminController.unBlockAction()  

@app.route('/403')
def error403():
    return errorController.error403()

@app.route('/aboutus')
def about_us():
    return visitorController.about_us()
    
if __name__ == '__main__':
    app.run()