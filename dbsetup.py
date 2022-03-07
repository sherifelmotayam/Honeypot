
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
  