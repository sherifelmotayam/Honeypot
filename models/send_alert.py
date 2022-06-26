# Install Courier SDK: pip install trycourier
from trycourier import Courier

client = Courier(auth_token="pk_prod_25DJ5KZ8TYMYHCHX5HXBN0G5R0XG")

class Alert:

  def __init__(self, ip, continent, country, city, os, browser, session, time, attackType):
    self.__ip = ip
    self.__continent = continent
    self.__country = country
    self.__city = city
    self.__os = os
    self.__browser = browser
    self.__session = session
    self.__time = time
    self.__attackType = attackType
  
  def send_alert(self):
    resp = client.send_message(
    message={
      "to": {
      "email": 'mustafakhaleedd@gmail.com'
    },
      "content": {
      "title": "Attack Alert",
      "body": '''
      Dear sir,\n We want to inform you that there is an irregular behavior found with data below 
      \nIP: {} \nContinent: {}\nCountry {}\nCity: {} \nOS: {} \nBrowser: {} \nSession: {} \nTime: {}\nAttack Type: {}
      '''
      .format(self.__ip, self.__continent,  self.__country, self.__city, self.__os, self.__browser, self.__session, self.__time, self.__attackType)

    },
  }  
)
    print("Response = ", resp)






