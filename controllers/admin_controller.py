from flask import request, redirect, url_for
from flask import render_template, request, session, jsonify

from models.admin import Admin

class AdminController:

    __admin = Admin()

    def dashboard(self):
        if 'loggedin' in session and session['type'] == 2:
            sessions_count = self.__admin.total_sessions()
            visitors_count = self.__admin.total_visitors()
            pages_view_count = self.__admin.total_pages_view()
            unique_pages_count = self.__admin.unique_pages_view()
            return render_template('dashboard.html', sessions=sessions_count, visitors=visitors_count, pages=pages_view_count, unique_pages=unique_pages_count)
        else:
            return redirect(url_for('error403')) 

    def sessionPages(self, session_id):
        if 'loggedin' in session and session['type'] == 2:
            print("session id : ", session_id)
            result = self.__admin.select_all_user_visits(session_id)
            return render_template("dashboard-single.html",data=result)
        else: 
            return redirect(url_for('error403')) 

    def get_all_sessions(self):
        data = []
        dbRows = self.__admin.select_all_sessions()
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
    def get_all_blocked_ips(self):
        data = []
        dbRows = self.__admin.read_blocked_ips()
        for row in dbRows:
            data.append({
                'id' : row['id'],
                'ip' : row['ip'],
            })
        return jsonify(data) 

    def ip(self):
        if 'loggedin' in session and session['type'] == 2:
            ips = self.__admin.read_ips()
            blocked_ips = self.__admin.read_blocked_ips()
            return render_template('ip.html', ips=ips, blocked_ips=blocked_ips) 
        else:
            return redirect(url_for('error403')) 

    def blockAction(self):
        if request.method == 'POST' and 'ip' in request.form:
            ip = request.form['ip']
            self.__admin.add_blocked_ip(ip)
            print("{} entered in db".format(ip))
        return redirect(url_for('ip'))

    def unBlockAction(self):
        if request.method == 'POST' and 'ip' in request.form:
            ip = request.form['ip']
            self.__admin.remove_blocked_ips(ip)
        return redirect(url_for('ip'))  