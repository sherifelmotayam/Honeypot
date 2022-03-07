# Install Courier SDK: pip install trycourier
from trycourier import Courier

client = Courier(auth_token="pk_prod_25DJ5KZ8TYMYHCHX5HXBN0G5R0XG")

def send_alert(ip, continent, country, city, os, browser, session, time):
  resp = client.send_message(
  message={
    "to": {
      "email": 'mustafakhaleedd@gmail.com'
    },
    "content": {
      "title": "Attack Alert",
      "body": '''
      Dear sir,\n We want to inform you that there is an irregular behavior found with data below 
      \nIP: {} \nContinent: {} \nCity: {} \nOS: {} \nBrowser: {} \nSession: {} \nTime: {}
      '''
      .format(ip, continent, country, city, os, browser, session, time)

    },
  }  
)
  print("Response = ", resp)






