import requests

token = ""
uri = f"https://chat.magazord.com.br/hooks/{token}"
data = {
    "username": "Python Bot",
    "icon_emoji": ":banana:",
    "attachments": [
            {
               "title":"Rocket.Chat",
               "title_link":"https://rocket.chat",
               "text":"Rocket.Chat, the best open source chat",
               "color":"#764FA5"
            }
        ]
    }

res = requests.post(uri, data)
print(res.text)
