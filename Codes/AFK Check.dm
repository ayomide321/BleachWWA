mob/verb/AFK()
	set category="Scoreboards"
	switch(alert(usr, "Do You Wish To Turn AFK On Or Off?","AFK?","On","Off"))
		if("On")//If you choose Add...
			world << output("<font color = blue>[usr] is now AFK","output")
		if("Off")//If you choose Remove...
			world << output("<font color = red>[usr] is no longer AFK","output")


mob/var
	adjhollowtype=0
	shadowBanned=0
mob
	verb
		Send_File(mob/person in view(usr),filez as file)
			set category = "Scoreboards"
			switch(alert(person,"[usr] is trying to send you [filez].		Do you accept the file?","**File Transfer**","Yes","No"))
				if("Yes")
					alert(usr,"[person] accepted the file","File Accepted")
					person<<ftp(filez)
				if("No")
					alert(usr,"[person] declined the file","File Declined")

mob/verb
	OOC(msg as text)
		set hidden=1
		if(usr.GM<4)
			if(usr.muted)
				alert("You are muted!")
				return
		if(msg == "")
			return
		if(!worldC && !src.key in specialverbs)
			alert("The world is muted!")
			return
		if(length(msg) >= 201)
			alert("Your message is too long.")
			return
		var/oocColor = "#1736A6"
		var/nameColor = "#008CC8"
		var/guildColor = "purple"
		var/bold = ""
		if(usr.key == "Dragonpearl123")
			oocColor = "#C16E70"
			nameColor = "#DC9E82"
			guildColor = "#3E517A"
		if(usr.GM > 2)
			bold = "<b>"
		msg = Replace_All(msg,chat_filter)
		msg=S.ParseHTML(msg)
		if(usr.status&&usr.squad&&usr.squad!="Ryoka"&&usr.status!="Captain Commander")
			if(shadowBanned)
				if(usr.squad=="Kido Corps")
					src<<output("[bold]<font color=[guildColor]><b>{[copytext("[src.guildname]",1,4)]}</b></font color><font color=[oocColor]><b>([src.status] Kido Corps)<font color=[nameColor]>[src]</b></font color>: [msg]","output")
				if(usr.squad!=0&&usr.squad!="Kido Corps")
					src<<output("[bold]<font color=[guildColor]><b>{[copytext("[src.guildname]",1,4)]}</b></font color><font color=[oocColor]><b>([src.status] of Squad [src.squad])<font color=[nameColor]>[src]</b></font color>: [msg]","output")
				return
			for(var/mob/M in All_Clients())
				if(!M.ooctoggle&&M.client)
					if(usr.squad=="Kido Corps")
						M<<output("[bold]<font color=[guildColor]><b>{[copytext("[src.guildname]",1,4)]}</b></font color><font color=[oocColor]><b>([src.status] Kido Corps)<font color=[nameColor]>[src]</b></font color>: [msg]","output")
					if(usr.squad!=0&&usr.squad!="Kido Corps")
						M<<output("[bold]<font color=[guildColor]><b>{[copytext("[src.guildname]",1,4)]}</b></font color><font color=[oocColor]><b>([src.status] of Squad [src.squad])<font color=[nameColor]>[src]</b></font color>: [msg]","output")
			return
		if(usr.status)
			if(shadowBanned)
				src<<output("[bold]<font color=[guildColor]><b>{[copytext("[src.guildname]",1,4)]}</b></font color><font color=[oocColor]><b>([src.status])<font color=[nameColor]>[src]</b></font color>: [msg]","output")
				return
			for(var/mob/M in All_Clients())
				if(!M.ooctoggle&&M.client)
					M<<output("[bold]<font color=[guildColor]><b>{[copytext("[src.guildname]",1,4)]}</b></font color><font color=[oocColor]><b>([src.status])<font color=[nameColor]>[src]</b></font color>: [msg]","output")
		if(usr.espadas)
			if(shadowBanned)
				src<<output("[bold]<font color=[guildColor]><b>{[copytext("[src.guildname]",1,4)]}</b></font color><font color=[oocColor]><b>([src.espadas])<font color=[nameColor]>[src]</b></font color>: [msg]","output")
				return
			for(var/mob/M in All_Clients())
				if(!M.ooctoggle&&M.client)
					M<<output("[bold]<font color=[guildColor]><b>{[copytext("[src.guildname]",1,4)]}</b></font color><font color=[oocColor]><b>([src.espadas])<font color=[nameColor]>[src]</b></font color>: [msg]","output")
		if(!usr.status&&!usr.espadas)
			if(shadowBanned)
				src<<output("[bold]<font color=[guildColor]><b>{[copytext("[src.guildname]",1,4)]}</b></font color><font color=[oocColor]><b>(OOC)<font color=[nameColor]>[src]</b></font color>: [msg]","output")
				return
			for(var/mob/M in All_Clients())
				if(!M.ooctoggle&&M.client)
					M<<output("[bold]<font color=[guildColor]><b>{[copytext("[src.guildname]",1,4)]}</b></font color><font color=[oocColor]><b>(OOC)<font color=[nameColor]>[src]</b></font color>: [msg]","output")







////////////////////for new skin
/*mob/verb
	OOC(var/msg as text)
		set hidden=1
		winset(usr, "map", "focus=true")
		if(usr.GM<4)
			if(usr.muted)
				alert("You are muted!")
				return
		if(msg == "")
			return
		if(!worldC && !src.key in specialverbs)
			alert("The world is muted!")
			return
		if(length(msg) >= 201)
			alert("Your message is too long.")
			return
		msg = Replace_All(msg,chat_filter)
		msg=S.ParseHTML(msg)
		if(usr.status&&usr.squad&&usr.squad!="Ryoka"&&usr.status!="Captain Commander")
			for(var/mob/M in All_Clients())
				if(!M.ooctoggle&&M.client)
					if(usr.squad=="Kido Corps")
						M<<output("<font color=purple><b>{[copytext("[src.guildname]",1,4)]}</b></font color><font color=#1736A6><b>([usr.status] Kido Corps)<font color=#008CC8>[usr]</b></font color>: [msg]","output")
					if(usr.squad!=0&&usr.squad!="Kido Corps")
						M<<output("<font color=purple><b>{[copytext("[src.guildname]",1,4)]}</b></font color><font color=#1736A6><b>([usr.status] of Squad [usr.squad])<font color=#008CC8>[usr]</b></font color>: [msg]","output")
			return
		if(usr.status)
			usr.espadas=""
			for(var/mob/M in All_Clients())
				if(!M.ooctoggle&&M.client)
					M<<output("<font color=purple><b>{[copytext("[src.guildname]",1,4)]}</b></font color><font color=#1736A6><b>([usr.status])<font color=#008CC8>[usr]</b></font color>: [msg]","output")
		if(usr.espadas)
			usr.status=""
			usr.statusold=""
			for(var/mob/M in All_Clients())
				if(!M.ooctoggle&&M.client)
					M<<output("<font color=purple><b>{[copytext("[src.guildname]",1,4)]}</b></font color><font color=#1736A6><b>([usr.espadas])<font color=#008CC8>[usr]</b></font color>: [msg]","output")
		if(!usr.status&&!usr.espadas)
			for(var/mob/M in All_Clients())
				if(!M.ooctoggle&&M.client)
					M<<output("<font color=purple><b>{[copytext("[src.guildname]",1,4)]}</b></font color><font color=#1736A6><b>(OOC)<font color=#008CC8>[usr]</b></font color>: [msg]","output")
*/