
import mysql.connector
from aifc import Error

def create_connection():
    global conn
    try:
        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="honeypot"
            )
        
        return conn
    except Error as e:
        print(e)
  
def update_or_create_page(c,data):
    sql = "SELECT * FROM pages where name=%s and session=%s"
    c.execute(sql,data[:-1])
    result = c.fetchone()
    conn.commit()
    if result == None:
        create_pages(c,data)
    else:
        print(result)
        update_pages(c, result[0])

def create_pages(c, data):
    print(data)
    sql = "INSERT INTO pages(name,session,first_visited) VALUES (%s,%s,%s)"
    c.execute(sql, data)
    conn.commit()
    print("1 row inserted successfully")

def update_pages(c, pageId):
    print(pageId)
    sql = "UPDATE pages SET visits = visits+1 WHERE id = %s"
    c.execute(sql, [pageId])
    conn.commit()
    
def create_session(c, data):
    sql = "INSERT INTO sessions(ip, continent, country, city, os, browser, session, created_at) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
    val = (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7])          
    c.execute(sql, val)
    conn.commit()
    print("1 row inserted successfully")
    
def select_all_sessions(c):
    sql = "SELECT * FROM sessions"
    c.execute(sql)
    rows = c.fetchall()
    conn.commit()
    return rows

def select_all_pages(c):
    sql = "SELECT * FROM pages"
    c.execute(sql)
    rows = c.fetchall()
    conn.commit()
    return rows

def select_all_user_visits(c, session_id):
    sql = """SELECT * FROM pages WHERE session = %s"""
    c.execute(sql, (session_id,))
    rows = c.fetchall()
    conn.commit()
    print("rowssss: ", rows)
   
    return rows

def total_sessions(c):
    sql = "SELECT * FROM sessions"
    c.execute(sql)
    result = len(c.fetchall())
    conn.commit()
    print("Sessions count : ", result)
    return result

def total_visitors(c):
    sql = "SELECT DISTINCT ip FROM sessions" 
    c.execute(sql)
    result = len(c.fetchall())
    conn.commit()
    print("Visitors count : ", result)
    return result   

def total_pages_view(c):
    sql = "SELECT * FROM pages" 
    c.execute(sql)
    result = len(c.fetchall())
    conn.commit()
    print("Pages view count : ", result)
    return result  

def unique_pages_view(c):
    sql = "SELECT DISTINCT session FROM pages" 
    c.execute(sql)
    result = len(c.fetchall())
    conn.commit()
    print("Unique pages view count : ", result)
    return result   

def login_user(c, username, password):
    sql = """SELECT * FROM accounts WHERE username = %s AND password = %s"""
    c.execute(sql, (username, password,))
    result = c.fetchone()
    conn.commit()
    return result

def exist_account(c, username):
    sql = """SELECT * FROM accounts WHERE username = %s"""
    c.execute(sql, (username,))
    result = c.fetchone()
    conn.commit()
    print("resss", result)
    return result

def register_user(c, username, password, email):
    sql = "INSERT INTO accounts (`username`, `password`, `email`, `type`) VALUES (%s, %s, %s, %s)"
    val = (username, password, email, 'user')    
    c.execute(sql, val)
    conn.commit()
  