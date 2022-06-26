from models.visitor import Visitor
from flask import after_this_request
from models.db_connection import DatabaseConnection

class Admin(Visitor):
    db_connection = DatabaseConnection("real_data_server")
    __conn = db_connection.get_conn()
    __cursor = db_connection.get_cursor()

    def select_all_sessions(self):
        sql = "SELECT * FROM sessions"
        self.__cursor.execute(sql,)
        rows = self.__cursor.fetchall()
        self.__conn.commit()
        return rows

    def select_all_pages(self):
        sql = "SELECT * FROM pages"
        self.__cursor.execute(sql)
        rows = self.__cursor.fetchall()
        self.__conn.commit()
        return rows
  
    def select_all_user_visits(self, session_id):
        sql = """SELECT * FROM pages WHERE session = %s"""
        self.__cursor.execute(sql, (session_id,))
        rows = self.__cursor.fetchall()
        self.__conn.commit()
        print("select_all_user_visits: ", rows)
        return rows

    def total_sessions(self):
        sql = "SELECT * FROM sessions"
        self.__cursor.execute(sql)
        result = len(self.__cursor.fetchall())
        self.__conn.commit()
        print("total_sessions: ", result)
        return result

    def total_visitors(self):
        sql = "SELECT DISTINCT ip FROM sessions" 
        self.__cursor.execute(sql)
        result = len(self.__cursor.fetchall())
        self.__conn.commit()
        print("total_visitors: ", result)
        return result   

    def total_pages_view(self):
        sql = "SELECT * FROM pages" 
        self.__cursor.execute(sql)
        result = len(self.__cursor.fetchall())
        self.__conn.commit()
        print("total_pages_view: ", result)
        return result  

    def unique_pages_view(self):
        sql = "SELECT DISTINCT session FROM pages" 
        self.__cursor.execute(sql)
        result = len(self.__cursor.fetchall())
        self.__conn.commit()
        print("unique_pages_view: ", result)
        return result   
    
    def read_ips(self):
        sql = """SELECT DISTINCT ip FROM sessions WHERE status = 0"""
        self.__cursor.execute(sql)
        rows = self.__cursor.fetchall()
        self.__conn.commit()
        print("read_ips: ", rows) 
        return rows
        
    def add_blocked_ip(self, ip):
        sql = """UPDATE `sessions` SET `status` = 1 WHERE ip = %s"""
        self.__cursor.execute(sql, (ip,))
        self.__conn.commit()

    def read_blocked_ips(self):
        sql = """SELECT DISTINCT ip FROM sessions WHERE status = 1"""
        self.__cursor.execute(sql)
        rows = self.__cursor.fetchall()
        self.__conn.commit()
        print("read_blocked_ips: ", rows) 
        return rows

    def remove_blocked_ips(self, ip):
        sql = """UPDATE `sessions` SET `status` = 0 WHERE ip = %s"""
        self.__cursor.execute(sql, (ip,))
        self.__conn.commit()
        print("Deleted successfully")
