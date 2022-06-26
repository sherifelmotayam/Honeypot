import requests

url = "https://d7sms.p.rapidapi.com/secure/send"

payload = {"content": "Test Message","from": "D7-Rapid","to": "01020820065"}
headers = {
	"content-type": "application/json",
	"Authorization": "Basic enZ2bzkzNDk6bXRYalZmcm0=",
	"X-RapidAPI-Host": "d7sms.p.rapidapi.com",
	"X-RapidAPI-Key": "6de8695c5amsh2399d82bcfc7be3p1653c2jsn09d2d6640ae2"
}

response = requests.request("POST", url, json=payload, headers=headers)

print(response.text)