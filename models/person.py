from models.db_connection import DatabaseConnection

class Person:
    db_connection = DatabaseConnection("real_data_server")
    __conn = db_connection.get_conn()
    __cursor = db_connection.get_cursor()

    __user_id = None
    __first_name = None
    __last_name = None
    __email = None
    __password = None
    __type = None

    def exist_account(self, email):
        self.__email = email
        sql = """SELECT * FROM accounts WHERE email = %s"""
        self.__cursor.execute(sql, (self.__email,))
        result = self.__cursor.fetchone()
        self.__conn.commit()
        print("exist_account", result)
        return result  

    def register_user(self, password):
        self.__password = password

        sql = "INSERT INTO accounts (`email`, `password`, `type`) VALUES (%s, %s, %s)"
        val = (self.__email, self.__password, 'user')    
        self.__cursor.execute(sql, val)
        self.__conn.commit()  
        print("register_user")

    def login_user(self, email, password):
        self.__email = email
        self.__password = password

        sql = """SELECT * FROM accounts WHERE email = %s AND password = %s"""
        self.__cursor.execute(sql, (self.__email, self.__password,))
        result = self.__cursor.fetchone()
        self.__conn.commit()
        print("login_user", result)

        if(result != None):
            self.__user_id = result['id']
            self.__first_name = result['first_name']
            self.__last_name = result['last_name']
            self.__type = result['type']
        return result

    def add_employee(fn, ln, email, pn, hd, jobId, salary):
        pass

    def read_employee(self):
        pass

    def employees_count(self):
        pass

    def managers_count(self):
        pass

    def total_salary(self):
        pass

    def departments_count(self):
        pass
    
    def get_user_id(self):
        return self.__user_id
    
    def get_first_name(self):
        return self.__first_name

    def get_last_name(self):
        return self.__last_name
    
    def get_email(self):
        return self.__email

    def get_password(self):
        return self.__password

    def get_user_type(self):
        return self.__type

    def set_user_id(self, id):
        self.__user_id = id

    def set_user_email(self, email):
        self.__email = email
    
    def set_user_password(self, password):
        self.__password = password

    def set_first_name(self, firstname):
        self.__first_name = firstname

    def set_last_name(self, lastname):
        self.__last_name = lastname

    def set_type(self, type):
        self.__type = type