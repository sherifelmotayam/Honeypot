from models.db_connection import DatabaseConnection
from models.person import Person
from flask import session
from datetime import datetime
import hashlib
from pusher import Pusher

class Visitor(Person):
    db_connection = DatabaseConnection("real_data_server")
    __conn = db_connection.get_conn()
    __cursor = db_connection.get_cursor()

    __userOS = None
    __userIP = None
    __userCity = None
    __userBrowser = None
    __userCountry = None
    __userContinent = None
    __sessionID = None
    __visit_time = None

    pusher = Pusher(app_id=u'1324185', key=u'435101e4bb9a726a3374', secret=u'd3c0ee2cb1920faf7527', cluster=u'mt1', ssl=True)

    def set_userOS(self, userOS):
       self.__userOS = userOS

    def set_userIP(self, userIP):
        self.__userIP = userIP
    
    def set_userCity(self, userCity):
        self.__userCity = userCity
    
    def set_userBrowser(self, userBrowser):
        self.__userBrowser = userBrowser

    def set_userCountry(self, userCountry):
        self.__userCountry = userCountry
    
    def set_userContinent(self, userContinent):
        self.__userContinent = userContinent

    def getSession(self):
        self.__visit_time = datetime.now().replace(microsecond=0)
        if 'user' not in session:
            lines = (str(self.__visit_time)+self.__userIP).encode('utf-8')
            session['user'] = hashlib.md5(lines).hexdigest()
            self.__sessionID = session['user']
            self.pusher.trigger(u'session', u'new', {
                u'ip': self.__userIP,
                u'continent': self.__userContinent,
                u'country': self.__userCountry,
                u'city': self.__userCity,
                u'os': self.__userOS,
                u'browser': self.__userBrowser,
                u'session': self.__sessionID,
                u'time': str(self.__visit_time),
            })
            data = [self.__userIP, self.__userContinent, self.__userCountry, self.__userCity, self.__userOS, self.__userBrowser, self.__sessionID, self.__visit_time]
            # print('ip{}'.format(data[0]))
            self.create_session(data)
        else:
            self.__sessionID = session['user']

    def __exist_ip(self, ip):
        sql = """SELECT * FROM sessions WHERE ip = %s"""
        self.__cursor.execute(sql, (ip,))
        result = self.__cursor.fetchone()
        self.__conn.commit()
        print("exist_ip", result)
        return result 

    def create_session(self, data):
        result = self.__exist_ip(data[0])
        if result:
            status = result['status']
        else: 
            status = 0 
        sql = "INSERT INTO sessions(ip, continent, country, city, os, browser, session, created_at, status) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)"
        val = (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], status)          
        self.__cursor.execute(sql, val)
        self.__conn.commit()
        print("1 row inserted successfully")

    def parseVisitor(self, data):
        self.update_or_create_page(data)
        self.pusher.trigger(u'pageview', u'new', {
            u'page': data[0],
            u'session': self.__sessionID,
            u'ip': self.__userIP
        })
        self.pusher.trigger(u'numbers', u'update', {
            u'page': data[0],
            u'session': self.__sessionID,
            u'ip': self.__userIP
        })

    def update_or_create_page(self, data):
        sql = "SELECT * FROM pages where name=%s and session=%s"
        self.__cursor.execute(sql,data[:-1])
        result = self.__cursor.fetchone()
        self.__conn.commit()
        if result == None:
            self.create_pages(data)
        else:
            print(result)
            self.update_pages(result['id']) # json

    def create_pages(self, data):
        print(data)
        sql = "INSERT INTO pages(name,session,first_visited) VALUES (%s,%s,%s)"
        self.__cursor.execute(sql, data)
        self.__conn.commit()
        print("1 row inserted successfully")

    def update_pages(self, pageId):
        print(pageId)
        sql = "UPDATE pages SET visits = visits+1 WHERE id = %s"
        self.__cursor.execute(sql, (pageId,))
        self.__conn.commit()
        print('update_page')
    
    def get_userOS(self):
       return self.__userOS

    def get_userIP(self):
        return self.__userIP
    
    def get_userCity(self):
        return self.__userCity
    
    def get_userBrowser(self):
        return self.__userBrowser

    def get_userCountry(self):
        return self.__userCountry
    
    def get_userContinent(self):
        return self.__userContinent

    def get_sessionID(self):
        return self.__sessionID

    def get_visit_time(self):
        return self.__visit_time