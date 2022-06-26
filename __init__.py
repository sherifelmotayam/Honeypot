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

