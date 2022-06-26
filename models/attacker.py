from abc import abstractmethod
from models.visitor import Visitor
from models.db_connection import DatabaseConnection

class Attacker(Visitor):
    db_connection = DatabaseConnection("fake_data_server")
    __conn = db_connection.get_conn()
    __cursor = db_connection.get_cursor()

    @abstractmethod
    def add_employee(self, fn, ln, email, pn, hd, jobId, salary):
        sql = "INSERT INTO employees (`FIRST_NAME`, `LAST_NAME`, `EMAIL`, `PHONE_NUMBER`, `HIRE_DATE`, `JOB_ID`, `SALARY`) VALUES (%s, %s, %s, %s, %s, %s, %s)"
        val = (fn, ln, email, pn, hd, jobId, salary)    
        self.__cursor.execute(sql, val)
        self.__conn.commit()
        print("add_employee added successfully")
    
    @abstractmethod
    def read_employees(self):
        sql = """SELECT * FROM employees e LEFT OUTER JOIN jobs j ON e.JOB_ID=j.JOB_ID"""
        self.__cursor.execute(sql)
        rows = self.__cursor.fetchall()
        self.__conn.commit()
        print("read_employees: ", rows) 
        return rows

    def insert_account(self, fn, ln, email, password):
        sql = "INSERT INTO accounts (`first_name`, `last_name`, `email`, `password`, `type`) VALUES (%s, %s, %s, %s, %s)"
        val = (fn, ln, email, password, '1')    
        self.__cursor.execute(sql, val)
        self.__conn.commit()
        print("insert_fake_account")

    def select_account_email(self, email):
        sql = """SELECT * FROM accounts WHERE email = %s"""
        self.__cursor.execute(sql, (email,))
        result = self.__cursor.fetchone()
        self.__conn.commit()
        print("select_account_email", result)
        return result

    def select_account(self, email, password):
        sql = """SELECT * FROM accounts WHERE email = %s AND password = %s"""
        self.__cursor.execute(sql, (email, password,))
        result = self.__cursor.fetchone()
        self.__conn.commit()
        print("select_account", result)
        return result    

    @abstractmethod
    def employees_count(self):
        sql = """SELECT EMPLOYEE_ID FROM employees"""
        self.__cursor.execute(sql)
        result = len(self.__cursor.fetchall())
        self.__conn.commit()
        print("employees_count: ", result) 
        return result

    @abstractmethod
    def managers_count(self):
        sql = """SELECT DISTINCT(MANAGER_ID) FROM employees"""
        self.__cursor.execute(sql)
        result = len(self.__cursor.fetchall())
        self.__conn.commit()
        print("managers_count: ", result) 
        return result

    @abstractmethod
    def total_salary(self):
        sql = """SELECT SUM(SALARY) FROM employees"""
        self.__cursor.execute(sql)
        result = self.__cursor.fetchone()
        self.__conn.commit()
        print("total_salary: ", result['SUM(SALARY)']) 
        return result['SUM(SALARY)']

    @abstractmethod
    def departments_count(self):
        sql = """SELECT DISTINCT(DEPARTMENT_ID) FROM employees"""
        self.__cursor.execute(sql)
        result = len(self.__cursor.fetchall())
        self.__conn.commit()
        print("departments_count: ", result) 
        return result