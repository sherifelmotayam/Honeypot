import mysql.connector
from aifc import Error

class DatabaseConnection:
    __host = "localhost"
    __user = "root"
    __password = ""
    __database = None

    def __init__(self, database):
        self.__database = database
        try:
            self.__conn = mysql.connector.connect(host=self.__host, user=self.__user, password=self.__password, database=self.__database)
            self.__cursor = self.__conn.cursor(buffered=True,dictionary=True)
        except Error as e:
            print(e)

    def get_conn(self):
        return self.__conn
    
    def get_cursor(self):
        return self.__cursor

    # def close_cursor(self):
    #     return self.__cursor.close()

    # def close_conn(self):
    #     return self.__conn.close()
