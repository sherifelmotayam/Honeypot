from flask import render_template

class ErrorsController:

    def error403(self):
        return render_template('403.html')