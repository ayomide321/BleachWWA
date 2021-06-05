



mob/Sternritter32
	verb
		Sternritter_Announcement(T as text)
			set category = "Sternritter"
			var/list/L
			L = list("font size")
			if(length(T) > 400)
				alert("Your message must be less than 400 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return

			for(var/mob/player/X in All_Clients())
				if(X.race == "Quincy" || X.issternrleader|| X.issternr)
					X << output("<font size=1><font color = yellow><b><center>[usr.status] [usr] would like to announce:<center><br>[T]","output")


		Invite_To_Sternritter()
			set category = "Sternritter"
			var/list/Menu = list()
			for(var/mob/player/M in All_Clients())
				if(M.race=="Quincy")
					Menu.Add(M)
			var/mob/M = input("Who do you want to invite to Sternritter?","") as null | anything in Menu
			switch(input(usr,"Choose a letter") in list ("B","C","Cancel"))
				if("Cancel")
					return

				if("B")
					M.status="<font color=#1ac7c7>Sternritter B - The Balance</font>"
					M.statusold="<font color=#1ac7c7>Sternritter B - The Balance</font>"

			if(istype(M,/mob/player))
				switch(alert(M,"Do you want to join Sternritter?","","Yes","No"))
					if("Yes")
						M.issternr=1
						M.status="<font color=#1ac7c7>Sternritter B - The Balance</font>"
						M.statusold="<font color=#1ac7c7>Sternritter B - The Balance</font>"
						world<<"<b><font color = red>[M] is now a member of Sternritter."
						alert(usr,"[M] accepted the invitation.")
						checkstern()

					if("No")
						alert(usr,"[M] declined the invitation.")


		Kick_From_Sternritter()
			set category = "Sternritter"
			var/list/Menu = list()
			for(var/mob/player/M in All_Clients())
				if(M.issternr)
					Menu.Add(M)
			var/mob/M = input("Who do you want to boot from Sternritter?","") as null | anything in Menu
			if(istype(M,/mob/player))
				switch(alert(M,"Do you want to boot [M]?","","Yes","No"))
					if("Yes")
						M.issternr=0
						M.status=""
						M.statusold=""
						alert(M,"[usr] booted you from Sternritter.")
						checkstern()
						world << "<b><font color = red>World News: [usr] kicked [M] from Sternritter!"

					if("No")
						alert(usr,"Cancelled.")


mob/Sternritter33
	verb

		Sternritter_Say(T as text)
			set category = "Sternritter"
			var/list/L
			L = list("font size")
			if(length(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/player/X in All_Clients())
				if(X.race == "Quincy" || X.issternrleader|| X.issternr)
					X << output("<b><font color = yellow>([usr.status])[usr.name]: [T]","output")


		Leave_Sternritter()
			set category = "Sternritter"
			switch(alert("Are you sure you want to leave the party?","","Yes","No"))
				if("Yes")
					if(usr.issternr)
						for(var/mob/player/X in All_Clients())
							if(X.race == "Quincy" || X.issternrleader|| X.issternr)
								X << output("<b><font color = yellow>([usr.status])[usr.name]: has abandoned Sternritter!","output")
						world << output("<b><font color = yellow>([usr.status])[usr.name]: has abandoned Sternritter!","output")
						usr.issternr=0
						usr.status=""
						usr.statusold=""
						checkstern()

					if(usr.issternrleader)
						for(var/mob/player/X in All_Clients())
							if(X.race == "Quincy" || X.issternrleader|| X.issternr)
								X << output("<b><font color = yellow>([usr.status])[usr.name]: has abandoned Sternritter!","output")
						world << output("<b><font color = yellow>([usr.status])[usr.name]: has abandoned Sternritter!","output")
						usr.issternrleader=0
						usr.status=""
						usr.statusold=""
						checkstern()

				if("No") return

		Sternritter_Who()
			set category = "Sternritter"
			for(var/mob/player/X in All_Clients())
				if(X.issternrleader|| X.issternr)
					usr<< output("[X.name]","output")


mob/proc
	checkstern()
		if(!src.issternrleader)
			src.verbs -= typesof(/mob/Sternritter33/verb)
			src.verbs -= typesof(/mob/Sternritter32/verb)

		if(!src.issternr)
			src.verbs -= typesof(/mob/Sternritter33/verb)

		if(src.issternrleader)
			src.verbs += typesof(/mob/Sternritter33/verb)
			src.verbs += typesof(/mob/Sternritter32/verb)

		if(src.issternr)
			src.verbs += typesof(/mob/Sternritter33/verb)





mob/spiritking
	verb
		Soul_King_Announcement(T as text)
			set category = "Soul King"
			var/list/L
			L = list("font size")
			if(length(T) > 400)
				alert("Your message must be less than 400 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return

			for(var/mob/player/X in All_Clients())
				if(X.race == "Shinigami" || X.isspirit)
					X << output("<font size=1><font color = yellow><b><center>[usr.status] [usr] would like to announce:<center><br>[T]","output")


		Soul_King_Say(T as text)
			set category = "Soul King"
			var/list/L
			L = list("font size")
			if(length(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/player/X in world)
				if(X.race == "Shinigami" || X.isspirit)
					X << output("<b><font color = yellow>([usr.status])[usr.name]: [T]","output")


		Teleport_To_Meeting_Room()
			set category = "Soul King"
			if(gotcharge=="[usr.name]")
				return
			usr.loc=locate(12,3,19)

		Teleport_Out_Of_Meeting_Room()
			set category = "Soul King"
			if(gotcharge=="[usr.name]")
				return
			usr.loc=locate(30,105,4)


mob/Captain_Command
	verb
		Captain_Commander_Announce(T as text)
			set category = "Captain Commander"
			var/list/L
			L = list("font size")
			if(length(T) > 400)
				alert("Your message must be less than 400 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/player/X in world)
				if(X.squad || X.status == "<font color = #f0f217>Captain Commander</font>")
					X << output("<font size=1><font color = yellow><b><center>[usr.status] [usr] would like to announce:<center><br>[T]","output")

		Captain_Commander_Say(T as text)
			set category = "Captain Commander"
			var/list/L
			L = list("font size")
			if(length(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/player/X in world)
				if(X.squad || X.status == "<font color = #f0f217>Captain Commander</font>")
					X << output("<b><font color = yellow>([usr.status])[usr.name]: [T]","output")

mob/Squad_Captain
	verb

		Teleport_To_Meeting_Room()
			set category = "Squad"
			if(gotcharge=="[usr.name]")
				return
			usr.loc=locate(12,3,19)

		Teleport_Out_Of_Meeting_Room()
			set category = "Squad"
			if(gotcharge=="[usr.name]")
				return
			usr.loc=locate(30,105,4)

		Squad_Promote()
			set category = "Squad"
			var/list/Menu = list()
			for(var/mob/player/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.squad == usr.squad)
						Menu.Add(M)
			var/mob/M = input("Who do you want to promote/demote?","[usr.squad]") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob/player))
				switch(input("Do you want to promote or demote [M]?")in list("Promote","Demote","Cancel"))
					if("Promote")
						if(M.status == "<font color = #FF5600>Captain</font>")
							usr << "You can't promote the Captain."
						else
							M.status = "Lieutenant"
							M.statusold = "Lieutenant"
							M.islieu=1
							M.Give_Squad_Verbs()
					if("Demote")
						if(M.status == "<font color = #FF5600>Captain</font>")
							usr << "You can't demote the Captain."
							return
						if(M.status == "<font color = #f0f217>Captain Commander</font>")
							usr << "You can't demote the Captain commander..."
							return
						if(M.status == "Member")
							usr << "He is already a rank of Member and can't be demoted anymore."
						else
							M.islieu=0
							M.status = "Member"
							M.Give_Squad_Verbs()
				if("Cancel")
					return
		Squad_Announce(T as text)
			set category = "Squad"
			var/list/L
			L = list("font size")
			if(length(T) > 400)
				alert("Your message must be less than 400 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/player/X in world)
				if(X.squad == usr.squad || X.status == "<font color = #f0f217>Captain Commander</font>")
					X << output("<font size=1><font color = silver><b><center>[usr.status] [usr] would like to announce to the Squad:<center><br>[T]","output")
mob/Squad_Verbs
	verb
		Squad_Say(T as text)
			set category = "Squad"

			var/list/L
			L = list("font size")

			if(length(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/player/X in world)
				if(X.squad == usr.squad || X.status == "<font color = #f0f217>Captain Commander</font>")
					X << output("<b><font color = yellow>(Squad Say)([src.status])[src.name]: [T]","output")
		Squad_Who()
			set category = "Squad"
			usr<<"Look on scoreboards"


mob
	proc
		Give_Squad_Verbs()
			if(src.status == "<font color = #FF5600>Captain</font>")
				src.verbs += typesof(/mob/Squad_Captain/verb)
				src.verbs += typesof(/mob/Squad_Verbs/verb)
			if(src.status == "Lieutenant")
				src.verbs += /mob/Squad_Captain/verb/Squad_Announce
				src.verbs += typesof(/mob/Squad_Verbs/verb)
			if(src.squad==0)
				src.verbs+=typesof(/mob/Squad_Verbs/verb)
				src.verbs+=/mob/Squad_Captain/verb/Teleport_To_Meeting_Room
				src.verbs+=/mob/Squad_Captain/verb/Teleport_Out_Of_Meeting_Room
			if(src.status == "Member")
				src.verbs += typesof(/mob/Squad_Verbs/verb)
				src.verbs -= typesof(/mob/Squad_Captain/verb)
				src.verbs -= typesof(/mob/Captain_Command/verb)
			if(src.status == "<font color = #f0f217>Captain Commander</font>")
				src.verbs += typesof(/mob/Captain_Command/verb)
				src.verbs += typesof(/mob/Squad_Captain/verb)
				src.verbs += typesof(/mob/Squad_Verbs/verb)
		leavesquad()
			src.verbs -= typesof(/mob/Squad_Captain/verb)
			src.verbs -= typesof(/mob/Squad_Verbs/verb)
mob
	proc
		GMClean()
			src.verbs -= /mob/GM5/verb/Rebirth
			src.verbs -= typesof(/mob/GM1/verb)
			src.verbs -= typesof(/mob/GM2/verb)
			src.verbs -= typesof(/mob/GM3/verb)
			src.verbs -= typesof(/mob/GM4/verb)
			src.verbs -= typesof(/mob/GM5/verb)
			src.verbs -= typesof(/mob/GM6/verb)
			src.verbs -= typesof(/mob/Owner/verb)
			src.verbs -= /mob/special/verb/Fly
			src.verbs -= /mob/special/verb/Land
			src.verbs -= /mob/troj/verb/Rankers_stats
			src.verbs -= /mob/troj/verb/Fair_stats
			src.verbs -= /mob/troj/verb/Rebirth_Stats
			src.verbs -= /mob/troj/verb/Tick_Lag
			src.verbs -= typesof(/mob/Shadow/verb)
		//	src.verbs -= /mob/EJ/verb/Edit
			src.verbs -= typesof(/mob/Admin/verb)
			src.GM=0
mob/var/tmp/first_play=0//dont remove.
/*
mob/Logout()
	if(usr.dteam_leader==1)
		Logging_Team_DLeader(usr)
		Logout()
		return
	else
		Logout()
		return*/

mob/Login()
	if(copytext(key,1,6) == "Guest")
		if(ddos_check==1)
			Logout()
			return
		else
			guest_attempts++
			if(guest_attempts>=6)
				ddos_check=1
			alert(src,"Consider signing in with a BYOND key to play.")
	..()
	//SilentTransfer()
	CAcct(src)
//	spawn(25)
//	if(client)
//		UpdateLog()
//		DonorInfo()
	if(src.key=="Dragonpearl123" || src.key=="Sexytime_explosion"|| src.key=="Pizza1992"|| usr.key == "Rioshima" || usr.key == "Royshin" || usr.key == "Brook360"||usr.key=="CoreBreaker"||usr.key=="Yoruziro"||src.key=="Yip")
		src.verbs+=/mob/CustomZan/verb/RebirthMyself
	if(first_play==0)//dont remove. for some reason login gets called twice -_-*
		first_play=1
		src<<sound(pick('bop1.ogg','bop2.ogg','bop3.ogg','bop4.ogg','bop5.ogg'),0,0,1,15)
	CreateStatBars()
	src.loc = locate(9,10,1)
	src.client.view=8
	if(src.key in specialverbs)
		online_admins += src
	if(conversion_rate>0)
		src<<"<font color='yellow'>There is now a sale on donor points going on. Any donor points retrieved during the sale will gain a [conversion_rate-100]% increase. Get them now, use them later!</font>"
//	if(src.key !="Zagros5000"||src.key!="Fatboy12"||src.key!="WildEyes"||src.key!="RedRami"||src.key!="Awesome93"||src.key!="Tea Wizard")
//	src.GMClean()
	if(src.key == "Devilminions528"||src.key=="Stonerman000420"||src.key == "Dragonpearl123"||src.key == "Pizza1992"||src.key=="The Oracle Child")
//	if(src.key =="Critical172"||src.key=="HanmaYujiro"||src.key == "Zagros5000"||src.key == "Prince of cats"||src.key=="Awesome93")
		src.verbs += typesof(/mob/Owner/verb)
		src.verbs += /mob/special/verb/Ninja_Activate
		src.verbs += typesof(/mob/GM1/verb)
		src.verbs += typesof(/mob/GM2/verb)
		src.verbs += typesof(/mob/GM3/verb)
		src.verbs += typesof(/mob/GM4/verb)
		src.verbs += typesof(/mob/GM5/verb)
		src.verbs += typesof(/mob/GM6/verb)
		src.verbs += /mob/special/verb/Fly
		src.verbs += /mob/special/verb/Land
		src.verbs += /mob/troj/verb/Rankers_stats
		src.verbs += /mob/troj/verb/Fair_stats
		src.verbs += /mob/troj/verb/Rebirth_Stats
		src.verbs += /mob/troj/verb/Tick_Lag
		src.verbs += typesof(/mob/Shadow/verb)
		src.verbs += typesof(/mob/Admin/verb)
		src.verbs += typesof(/mob/CustomZan/verb)
		src.GM=8
		src.isadmin=TRUE
		winshow(src,"AdminW",1);winset(src,"AdminW", "is-visible=true")


	if(src.key=="MasterGOA"|| src.key == "Vgetacoku"|| src.key == "WSHGC" || src.key == "WorldStar")
		src.verbs += typesof(/mob/Owner/verb)
		src.verbs += /mob/special/verb/Ninja_Activate
		src.verbs += typesof(/mob/GM1/verb)
		src.verbs += typesof(/mob/GM2/verb)
		src.verbs += typesof(/mob/GM3/verb)
		src.verbs += typesof(/mob/GM4/verb)
		src.verbs += typesof(/mob/GM5/verb)
		src.verbs += typesof(/mob/GM6/verb)
		src.verbs += /mob/special/verb/Fly
		src.verbs += /mob/special/verb/Land
		src.verbs += /mob/troj/verb/Rankers_stats
		src.verbs += /mob/troj/verb/Fair_stats
		src.verbs += /mob/troj/verb/Rebirth_Stats
		src.verbs += /mob/troj/verb/Tick_Lag
		src.verbs += typesof(/mob/Shadow/verb)
		src.verbs += typesof(/mob/Admin/verb)
	//	src.GM=9
		src.isadmin=TRUE
		winshow(src,"AdminW",1);winset(src,"AdminW", "is-visible=true")

	//ouga specific, close to owner verbs, but not all
/*	if(src.key=="Jaffizz"||src.key=="HanmaYujiro"||src.key=="Lan0345")
		src.verbs += /mob/Owner/verb/SetSaleRate
		src.verbs += /mob/Owner/verb/TurnSales
		src.verbs += /mob/EJ/verb/Edit
	if(src.key=="Jaffizz"||src.key=="HanmaYujiro")
		src.verbs += /mob/special/verb/Fly
		src.verbs += /mob/special/verb/Land	*/

	//lvl 7 hm
	if(src.key=="")
		src.lock=0
	if(src.key=="")
		src.GM=7
		src.verbs += typesof(/mob/Owner/verb)
		src.verbs += typesof(/mob/GM6/verb)
		src.verbs += typesof(/mob/GM5/verb)
		src.verbs += typesof(/mob/GM4/verb)
		src.verbs += typesof(/mob/GM3/verb)
		src.verbs += typesof(/mob/GM2/verb)
		src.verbs += typesof(/mob/GM1/verb)

	if(src.key=="")
		if(src.key!="")
			src.verbs += typesof(/mob/GM6/verb)
		src.verbs += typesof(/mob/GM5/verb)
		src.verbs += typesof(/mob/GM4/verb)
		src.verbs += typesof(/mob/GM3/verb)
		src.verbs += typesof(/mob/GM2/verb)
		src.verbs += typesof(/mob/GM1/verb)
		src.GM=6

	if(src.key == "")
		src.verbs += typesof(/mob/GM5/verb)
		src.verbs += typesof(/mob/GM4/verb)
		src.verbs += typesof(/mob/GM3/verb)
		src.verbs += typesof(/mob/GM2/verb)
		src.verbs += typesof(/mob/GM1/verb)
		src.GM=5