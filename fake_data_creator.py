from aifc import Error

import pandas as pd
# import uuid
from faker import Faker
import datetime
from datetime import date
import random
# import mysql.connector
from dbsetup import create_connection
faker = Faker()

def name_gen(gender):
    """
    Quickly generates a name based on gender
    """
    if gender == 'male':
        return faker.name_male()
    elif gender == 'female':
        return faker.name_female()

    return faker.name()

def random_dob(start, end, n):
    """
    Generating a list of a set number of timestamps
    """

    # The timestamp format
    frmt = "%Y-%m-%d"

    # Formatting the two time periods
    stime = datetime.datetime.strptime(start, frmt)
    etime = datetime.datetime.strptime(end, frmt)

    # Creating the pool for random times
    td = etime - stime

    # Generating a list with the random times
    times = [(random.random() * td + stime).strftime(frmt) for _ in range(n)]


    return times

def getID():
    return random.randint(10000, 11111)

def UNI_ID(e,id):
    todays_date = date.today()

    f = e.split("-")
    ConvertUserAge = int(f[0])
    CurrentAge = todays_date.year - ConvertUserAge
    CurrentYearUni = CurrentAge - 18
    StartUni = todays_date.year - (2000 + CurrentYearUni)
    converted_num = str(StartUni)
    ID = id
    converted_num1 = str(ID)
    start_uni=ConvertUserAge+18
    convert=str(start_uni)
    Whole_ID = convert +'/'+ converted_num1

    return Whole_ID

def Email_ID(dob,name,id):

    todays_date = date.today()

    f = dob.split("-")
    ConvertUserAge = int(f[0])
    CurrentAge = todays_date.year - ConvertUserAge
    CurrentYearUni = CurrentAge - 18
    StartUni = todays_date.year - (2000 + CurrentYearUni)
    converted_num = str(StartUni)
    ID = id
    converted_num1 = str(ID)
    Whole_ID = converted_num + converted_num1

    dom = "@miuegypt.edu.eg"

    name = name.lower().split(" ")


    new_email = name[0]+Whole_ID+dom

    # Further distinguishing the email if a duplicate was found
    return new_email

def randomtimes(start, end, n):
    """
    Generates random time stamps based on a given amount between two time periods.
    """
    # The timestamp format
    frmt = "%Y-%m-%d %H:%M:%S"

    # Formatting the two time periods
    stime = datetime.datetime.strptime(start, frmt)
    etime = datetime.datetime.strptime(end, frmt)

    # Creating the pool for random times
    td = etime - stime

    # Generating a list with the random times
    times = [(random.random() * td + stime).strftime(frmt) for _ in range(n)]

    return times

def getEducation(dob):
    """
    Assigns an education level based on the given date of birth
    """
    # Current date
    now = datetime.datetime.now()

    # Date of birth
    dob = datetime.datetime.strptime(dob, "%Y-%m-%d")

    # Subtracting the times to get an age
    age = int((now - dob).days / 365.25)

    # Returning education level based on age
    if age <= 18:
        return 'Error'
    elif age <= 22:
        return 'Student'
    elif age <= 25:
        return 'grad'
    else:
        return 'employed'

def connect(dob,gender,name,UNIID,Email,lastlogin,education):
    """ Connect to MySQL database """
    conn = None
    try:
        conn = create_connection()
        cursor = conn.cursor()

        sql = "INSERT INTO dummydata (UNI_ID, Name , Gender , Email ,DOB ,last_login , Education) VALUES (%s, %s, %s, %s, %s, %s, %s)"
        values = [(UNIID, name, gender, Email, dob, lastlogin, education)]
        cursor.executemany(sql,values)
        conn.commit()
        print(cursor.rowcount, "was inserted.")
        if conn.is_connected():
            print('Connected to MySQL database')
    except Error as e:
        print(e)

    finally:
        if conn is not None and conn.is_connected():
            conn.close()

def main():
   # connect()
    # creating the date object of today's date
    todays_date = date.today()
    num_users = 5

    # A list of 7 features
    features = [
        "dob",
        "gender",
        "name",
        'ID',
        'UNI_ID',
        "email",
        "last_login",
        "education",
    ]

    # Creating a DF for these features
    df = pd.DataFrame(columns=features)

    df['dob'] = random_dob("1995-01-01", "2005-01-01", num_users)

    genders = ["male", "female"]
    df['gender'] = random.choices(genders, weights=(47, 47), k=num_users)

    # Generating names for each user
    df['name'] = [name_gen(i) for i in df['gender']]

    #Generate ID that after start first year
    IDS=[]
    for p in df['ID']:
        id=getID()
        IDS.append(id)

    df['ID']=IDS

    UNI_IDS=[]

    for dob,id in zip(df['dob'],df['ID']):
        UNIID=UNI_ID(dob,id)
        UNI_IDS.append(UNIID)

    df['UNI_ID']=UNI_IDS

    emails=[]
    for dob,name,id in zip(df['dob'],df['name'],df['ID']):
        email=Email_ID(dob,name,id)
        emails.append(email)

    df['email']=emails

    df['education'] = [getEducation(i) for i in df['dob']]
    # Setting the start and end times

    start = "2021-08-01 00:00:00"
    end = "2021-08-24 00:00:00"
    df['last_login'] = randomtimes(start, end, num_users)


    # for dob,gender,name,UNIID,Email,lastlogin,education in zip(df['dob'],df['gender'],df['name'],df['UNI_ID'],df['email'],df['last_login'],df['education']):
    #     print('*******************')
    #     print("dob "+dob)
    #     print("gender "+gender)
    #     print("UNI-ID "+UNIID)
    #     print("Email ",Email)
    #     print("Last Login "+lastlogin)
    #     print("Education "+education)
    #     print('**********************')
    #     connect(dob,gender,name,UNIID,Email,lastlogin,education)

if __name__ == "__main__":
    main()