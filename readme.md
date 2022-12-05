# MyGES ICS Exporter - Dockerized 🐳 
MyGES ICS Exporter is a dockerized [version of this software](https://github.com/kidelag/agenda-ges). 
It will allow you to generate and serve an updated .ics file of your MyGES agenda, using your associated
credentials. Created by kidelag, the whole installation process, has been simplified,
and converted on a complete dockerized version.

## 🧰 Requirements
- MyGES active credentials (used to login at myges.fr portal) 
- x64 architecture based VM (no current ARM support) 
- Docker installed on your VM 
- Internet access on your VM
- Any free external port

## 🔑 Prepare our credentials
By default, all credentials are stored on myges.env file, located at root. 

Please edit this file, and add your credentials and any nickname.  It will be used to get your .ics file. 

```bash
docker NICKNAME=JohnDoe
MYGES_USERNAME=jdoe
MYGES_PASSWORD=MyStrongPassword
```

## 🚀 Launch our container
Simply run the following command: 
```
docker run --env-file myges.env -d -p 8282:80 tjorge/myges-ics-exporter:latest
``` 

Feel free to chose your port, and choose any other port than 8282. 

**⚠️ Warning: Don't modify 80 port!**

## 🔗 Access to our .ics file
By default, your ICS file, will be served at the following URL:
```http://yourHostIP:8282/agenda-ges?name=YourNickname```

Or your custom port and replace "YourNickname" by the one that you've defined on myges.env file.

## 📅 Add .ics file to any calendar app
Now that you're calendar will be served on an .ics file, and constantly updated, let's add it to your calendar. 
- Google Calendar:
https://support.google.com/calendar/answer/37100 
- MacOS/iCloud:
https://support.apple.com/en-us/HT202361 
- Nextcloud Cal:
https://docs.nextcloud.com/server/19/user_manual/pim/calendar.html 

Any other calendar app that support ICS import/subscription will work as expected.

# Credits
This container image is based on following software: 

- [httpdserver](https://hub.docker.com/_/httpd) by Apache Foundation/Docker Community
- [agenda-ges](https://github.com/kidelag/agenda-ges) by
[kidelag](https://github.com/kidelag)
