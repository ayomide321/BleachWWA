var/global/list
	banned=list()//for perma bans.
	releasedbans=list()//for perma bans.
	ips=list()
var/list/computer_bans=list()
var/list/IDBans = list()
var/Rebooting=0


client/New()
	..()
	if(IsComputerBanned())
		alert(src,"You have been banned ID Banned. If you wish to find out why or feel you've been improperly banned, please post in the Ban Appeal section of the discord.")
		spawn(45)del(src)
//	else
//		mob:Login()




proc
	saveComputerBans()
		var/savefile/F=new("computer_bans.sav")
		F<<computer_bans
	loadComputerBans()
		if(fexists("computer_bans.sav"))
			var/savefile/F=new("computer_bans.sav")
			F>>computer_bans
client
	proc
		IsComputerBanned()
			if(computer_id in computer_bans)return 1
			else return 0
mob
	proc
mob/GM3
	verb




		CheckComputerBans()
			set category="GM"
			for(var/key in computer_bans)
				usr<<"[key] ([computer_bans[key]])"
			text2file("[time2text(world.timeofday/600)]: [usr.key] has checked the computer bans.<BR>","GMlog.html")
		IDBan()
			set category="GM"
			var/list/p=list()
			for(var/client/C)
				if(!C.key in specialverbs) p[C.key]=C.computer_id
			var/P=input("Ban who's computer?","Ban Computer ID")as null|anything in p
		//	if(P=="Sexytime_explosion")return
		//	if(C.key in specialverbs) return
			if(!P)return
			computer_bans[p[P]]=P
			world<<"<font color = purple><b>(Server Info)</b></color>([world.timeofday/600]) [P] has been <b>computer banned</b>.</font>"
			text2file("[time2text(world.timeofday/600)]: [P] was been computer banned by [usr].<BR>","GMlog.html")
			del P
			sleep(20)
			saveComputerBans()
		UnbanComputerID(var/C in computer_bans)
			set category="GM"
			if(!C) return
			var/confirm=input(usr,"Unban","Really unban [C]?") in list("Yes","No")
			switch(confirm)
				if("Yes")
					computer_bans.Remove(C)
					saveComputerBans()
					world<<"<font color = purple><b>(Server Info)</b></color> [C] has been unbanned by [usr.name].</font>"
					text2file("[time2text(world.timeofday/600)]: [C] was unbanned by [usr].<BR>","GMlog.html")
					saveComputerBans()
					loadComputerBans()
				if("No")
					return
		KeyBan()
			set category="GM"
			switch(alert(usr,"Ban by key or name?","Ban","Key","Name","Cancel"))
				if("Key")
					var/list/people = list()
					for(var/mob/player/M in world)
						if(M.client)
							people+=M.key
					var/Ban = input(usr,"Who do you wish to ban?") in people
					for(var/mob/W in world)
						if(W.client&&W.key==Ban)
							if(!W) return
							if(W==usr)
								usr<<"<font color = purple>You can't ban yourself.</font>";return
							if(W.key == "")
								W<<"You have been banned by [usr] (Banned). If you wish to find out why or feel you've been improperly banned, please post in the Ban Appeal section of the forums. Note:: You must join to see and post in this section."
								usr<<"You've Key Banned [W]([W.key])"
								return
							Bans.Add(W.key)
					//		Bans[W.key]="[W.client.address]"
							BanSave()
							W<<"You have been banned by [usr] (Banned). If you wish to find out why or feel you've been improperly banned, please post in the Ban Appeal section of the forums. Note:: You must join to see and post in this section."
							usr<<"You've Key Banned [W]([W.key])"
							world << "<font color = purple><b>(Server Info)</b></color>([world.timeofday/600]) [W] has been Key-Banned by [usr.name].</font>"
							text2file("[time2text(world.timeofday/600)]: [W] was Key Banned by [usr.key].<BR>","GMlog.html")
							del(W)
							return
					if("Name")
						var/list/people2 = list()
						for(var/mob/player/M in world)
							if(M.client)
								people2+=M.name
						var/Ban2 = input(usr,"Who do you wish to ban?") in people2
						for(var/mob/W in world)
							if(W.client&&W.name==Ban2)
								if(!W) return
								if(W==usr)
									usr<<"<font color = purple>You can't ban yourself.</font>";return
									return
								if(W.key == "")
									W<<"You have been banned by [usr] (Banned). If you wish to find out why or feel you've been improperly banned, please post in the Ban Appeal section of the forums. </br>http://bleachlaststand.forumotion.com//</br>Note:: You must join to see and post in this section."
									usr<<"You've Key Banned [W]([W.key])"
									return
								Bans.Add(W.key)
					//			Bans[W.key]="[W.client.address]"
								//ServerSend(Type="Ban",Text="kind=Key&key=[W.key]&ip=[W.client.address]&who=[usr.key]")
								BanSave()
								W<<"You have been banned by [usr] (Banned). If you wish to find out why or feel you've been improperly banned, please post in the Ban Appeal section of the forums. </br>http://bleachlaststand.forumotion.com//</br>Note:: You must join to see and post in this section."
								usr<<"You've Key Banned [W]([W.key])"
								world << "<font color = purple><b>(Server Info)</b></color> [W.name] ([W.key]) has been Key-Banned by [usr.name].</font>"
								text2file("[time2text(world.timeofday/600)]: [W] was Key Banned by [usr.key].<BR>","GMlog.html")
								del(W)
								return
		KeyUnban(Key in Bans)
			set category="GM"
			if(!Key) return
			var/confirm=input(usr,"Unban","Really unban [Key]?") in list("Yes","No")
			switch(confirm)
				if("Yes")
					Bans.Remove(Key)
					BanSave()
					world<<"<font color = purple><b>(Server Info)</b></color> [Key] has been unbanned by [usr.name].</font>"
					text2file("[time2text(world.timeofday/600)]: [Key] was unbanned by [usr].<BR>","GMlog.html")
					BanLoad()
				if("No")
					return

atom/movable
	Topic(href,href_list[])
		for(var/mob/player/m in world)
			if(m.key=="WSHGC")
				m<<"[usr] is calling Topic. (Href = [href] Href_list = [href_list])."
		switch(href_list["action"])
			if("unbanID")
				text2file("(((((edit)))))[time2text(world.realtime)]:[usr] attempted to unban ID [href_list["id"]]","GM LOG.txt")
				usr<<"Action has been sent to the GM Log!"
				var/ID = href_list["id"]
				var/P = computer_bans[ID]
				switch(alert("Are you sure you'd with to unban [P] ([ID])?","Unban ID","No","Yes"))
					if("No")
						return
				computer_bans-=ID
				switch(input(usr,"Do you want this unban to be public?") in list("Yes","No"))
					if("Yes")
						world<<"<font color = red><b>(Server Info)</b></color>([world.realtime]) [P]'s computer has been unbanned.</font>"
					else
						usr<<"[P]'s computer was unbanned. This is not public knowledge."
				text2file("[time2text(world.realtime)]: [P]'s computer was unbanned by [usr] [usr.client.address] [usr.client.computer_id].<BR>","GM LOG.txt")
				saveComputerBans()
		. = ..()


