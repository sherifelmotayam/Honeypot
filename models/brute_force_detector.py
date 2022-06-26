import time
from difflib import SequenceMatcher
import random
from sklearn.preprocessing import MinMaxScaler
import numpy as np

class BruteForceDetector:
    __FAILED_ATTEMPTS_CTR = 0
    __SAME_USERNAME = ""
    __SAME_USERNAME_CTR = 0

    __TIME_LIST = []

    __PASSWORD_LIST = []
    __SEQUENCE_MATCHER_RESULT = []
    __AVERAGE_LIST = [] 

    # return number of failed attempts on login
    def numberOfFailedAttempts(self):
        self.__FAILED_ATTEMPTS_CTR += 1 # ctr will be used for brute force
        print("ctr of failed attempts : ",  self.__FAILED_ATTEMPTS_CTR)

    # check if the failed attempts occur on same user
    def attackSameUser(self, username):
        
        print("username : ", username)

        if(username != self.__SAME_USERNAME):
            self.__FAILED_ATTEMPTS_CTR = 0
            self.__SAME_USERNAME_CTR = 1
            self.__SAME_USERNAME = username

            self.__PASSWORD_LIST.clear()
            self.__SEQUENCE_MATCHER_RESULT.clear()
            self.__TIME_LIST.clear()
            self.__AVERAGE_LIST.clear()
        
        elif(username == self.__SAME_USERNAME):
            self.__SAME_USERNAME_CTR += 1

        return self.__SAME_USERNAME_CTR

    # calc. the time between each attempt
    # initial time
    def startTime(self):
        begin = time.time()
        return begin

    # end time
    def endTime(self):
        end = time.time()
        return end    

    def timeList(self, begin, end):
        self.__TIME_LIST.append(end-begin)
        print("TIME_LIST", self.__TIME_LIST)

    # take the password
    def passTaken(self, password):     
        pswrd = password.lower()
        print("password : ", pswrd)

        if(len(self.__PASSWORD_LIST) == 0): 
            self.__PASSWORD_LIST.append(pswrd)
        else:
            self.__PASSWORD_LIST.append(pswrd)
            LIST_SIZE = len(self.__PASSWORD_LIST)
            LAST_INDEX = LIST_SIZE - 1
            result = self.similar(LAST_INDEX)
            print("result : ", result)
            self.__AVERAGE_LIST.append(result)

    # seq. matcher
    def similar(self, LAST_INDEX):
        return SequenceMatcher(None, self.__PASSWORD_LIST[LAST_INDEX], self.__PASSWORD_LIST[LAST_INDEX-1]).ratio()

    # calc. result avg.    
    def average(self): 
        SUM = 0
        for i in self.__AVERAGE_LIST:
            SUM += i   
        AVERAGE = SUM / len(self.__AVERAGE_LIST) 
        print("avg list : ", AVERAGE)
        return AVERAGE

    __smallest = 6
    __largest = 10

    __random_number = random.randint(__smallest, __largest - 1)

    def timeAvg(self):
        # normalize the TIME LIST to be between 0 and 1
        data = np.array([self.__TIME_LIST]).reshape(-1, 1)
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
    def threshold(self):
        print("random number :", self.__random_number)
        if(self.__FAILED_ATTEMPTS_CTR == self.__random_number and self.__SAME_USERNAME_CTR == self.__random_number):

            SEQUENCE_MATCHER_AVERAGE = self.average()
            TIME_AVG = self.timeAvg()
            # increased the TIME_AVG because we test manually 
            if(SEQUENCE_MATCHER_AVERAGE <= 0.5 and TIME_AVG <= 0.8):
                return 1
            else:
                self.__FAILED_ATTEMPTS_CTR -= 2
                self.__SAME_USERNAME_CTR -= 2
        else:
            return 0