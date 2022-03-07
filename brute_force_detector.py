
FAILED_ATTEMPTS_CTR = 0
SAME_USERNAME = ""
SAME_USERNAME_CTR = 0

TIME_LIST = []

PASSWORD_LIST = []
SEQUENCE_MATCHER_RESULT = []
AVERAGE_LIST = []   

import time
from difflib import SequenceMatcher
import random
from sklearn.preprocessing import MinMaxScaler
import numpy as np

# return number of failed attempts on login
def numberOfFailedAttempts():
    globals()['FAILED_ATTEMPTS_CTR'] += 1 # ctr will be used for brute force
    print("ctr of failed attempts : ",  globals()['FAILED_ATTEMPTS_CTR'])

# check if the failed attempts occur on same user
def attackSameUser(username):
    print("username : ", username)

    if(username != globals()['SAME_USERNAME']):
        globals()['FAILED_ATTEMPTS_CTR'] = 0
        globals()['SAME_USERNAME_CTR'] = 1
        globals()['SAME_USERNAME'] = username

        PASSWORD_LIST.clear()
        SEQUENCE_MATCHER_RESULT.clear()
        TIME_LIST.clear()
        AVERAGE_LIST.clear()
        
    elif(username == globals()['SAME_USERNAME']):
        globals()['SAME_USERNAME_CTR'] += 1

    return globals()['SAME_USERNAME_CTR']

# calc. the time between each attempt
# initial time
def startTime():
    begin = time.time()
    return begin

# end time
def endTime():
    end = time.time()
    return end    

def timeList(begin, end):
    TIME_LIST.append(end-begin)
    print("TIME_LIST", TIME_LIST)

# take the password
def passTaken(password):     
    pswrd = password.lower()
    print("password : ", pswrd)

    if(len(PASSWORD_LIST) == 0): 
        PASSWORD_LIST.append(pswrd)
    else:
        PASSWORD_LIST.append(pswrd)
        LIST_SIZE = len(PASSWORD_LIST)
        LAST_INDEX = LIST_SIZE - 1
        result = similar(LAST_INDEX)
        print("result : ", result)
        AVERAGE_LIST.append(result)

# seq. matcher
def similar(LAST_INDEX):
    return SequenceMatcher(None, PASSWORD_LIST[LAST_INDEX], PASSWORD_LIST[LAST_INDEX-1]).ratio()

 def average(): 
    SUM = 0
    for i in AVERAGE_LIST:
        SUM += i   
    AVERAGE = SUM / len(AVERAGE_LIST) 
    print("avg list : ", AVERAGE)
    return AVERAGE

smallest = 6
largest = 10

random_number = random.randint(smallest, largest - 1)

def timeAvg():
    # normalize the TIME LIST to be between 0 and 1
    data = np.array([TIME_LIST]).reshape(-1, 1)
    scaler = MinMaxScaler()
    scaler.fit(data)
    TIME_LIST_NEW = scaler.transform(data).flatten()

    print(scaler.transform(data).flatten())

    SUM = 0
    for i in TIME_LIST_NEW:
        SUM += i
    AVERAGE = SUM / len(TIME_LIST_NEW) 
    print("time avg : ", AVERAGE)
    return AVERAGE

# threshold func.
def threshold():
    print("random number :", globals()['random_number'])
    if(globals()['FAILED_ATTEMPTS_CTR'] == globals()['random_number'] and globals()['SAME_USERNAME_CTR'] == globals()['random_number']):

        SEQUENCE_MATCHER_AVERAGE = average()
        TIME_AVG = timeAvg()

        if(SEQUENCE_MATCHER_AVERAGE <= 0.5 and TIME_AVG <= 0.5):
            return 1
        else:
            globals()['FAILED_ATTEMPTS_CTR'] -= 2
            globals()['SAME_USERNAME_CTR'] -= 2
    else:
        return 0
