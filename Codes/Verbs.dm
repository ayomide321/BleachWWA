var
	worldC=1
mob/var/OOC=0
mob
	verb
		Drop_Money()
			set hidden=1
			var/msg=input("How much money do you want to drop?","Drop Money")as num
			if(msg<=0||msg>usr.money)
				return
			else
				usr.money-=msg
				var/obj/k=new/obj/Money/big(usr.loc)
				spawn(2)
				k.mvalue=msg


		Track_Leaders()
			set category = "Commands"
			var/rank
			/*
			for(rank in shiniCaptainList)
				usr << output("<b><font color = yellow>[rank]: [activeRankList[rank]]","output")

				if(rank == "1")
					usr << output("<b><font color = yellow>Captain Commander: [shiniCaptainList[rank]]","output")
				if(rank != "Kido Corps" && rank != "1")
					usr << output("<b><font color = yellow>Captain of Squad [rank]: [shiniCaptainList[rank]]","output")
				if(rank == "Kido Corps Captain")
					usr << output("<b><font color = yellow>[rank] Caprain: [shiniCaptainList[rank]]","output")
					*/

			for(rank in activeRankList)
				if(rank == "Karakura Hero")
					usr << output("<b><font color = yellow>Number of [rank]'s: [activeRankList[rank]]","output")
				else
					usr << output("<b><font color = yellow>[rank]: [activeRankList[rank]]","output")


mob
	var
		canAlertGM=1
	verb
		GM_Help()
			set hidden=1
			if(!src.canAlertGM)
				src << "You've been temporarily blocked from this feature"
				return
			switch(input("This will send an alert to all GMs, if you use this verb without reason you will be punished. Are you sure you want to use this verb?", text) in list ("Yes","No"))
				if("Yes")
					var/msg=input("What do you want to say?","Alert")as text
					if(length(msg) >= 400)
						return
					usr << output("<b><font color = yellow>ALERT: You have alerted the GMs and the reason is [msg]!","output")
					for(var/mob/player/M in All_Clients())
						if(M.GM)
							M << output("<b><font color = yellow>ALERT: [usr] has alerted us and the reason is [msg]!","output")
mob
	verb
		OOC_Toggle()
			set hidden=1
			if(!src.ooctoggle)
				src.ooctoggle=1
				src<<"You are now blocking OOC"
				return
			else
				src.ooctoggle=0
				src<<"You can now listen to OOC"
				return
		Race_Say_Toggle()
			set hidden=1
			if(!src.rstoggle)
				src.rstoggle=1
				src<<"You are now blocking race say"
				return
			else
				src.rstoggle=0
				src<<"You can now listen to race say"
				return
		Change_Respawn()
			set hidden=1
			if(src.hollow)
				switch(input(src,"Where would you like to respawn", text) in list ("Hollow Motel(Default)","Las Noches","Lost Vaizard Forest"))
					if("Hollow Motel(Default)")
						src.rx=172
						src.ry=184
						src.rz=3
					if("Las Noches")
						src.rx=151
						src.ry=82
						src.rz=11
					if("Lost Vaizard Forest")
						src.rx=171
						src.ry=7
						src.rz=3
			if(src.shinip)
				switch(input(src,"Where would you like to respawn", text) in list ("Squad 4(Default)","Captain Room","Rukongai Lab"))
					if("Squad 4(Default)")
						src.rx=75
						src.ry=30
						src.rz=5
					if("Captain Room")
						src.rx=12
						src.ry=10
						src.rz=19
					if("Rukongai Lab")
						src.rx=48
						src.ry=10
						src.rz=19
			if(src.earth)
				switch(input(src,"Where would you like to respawn", text) in list ("Hospital","Bar","Quincy Tower","Karakura Lab","Vaizard Base"))
					if("Hospital")
						src.rx=44
						src.ry=187
						src.rz=1
					if("Bar")
						src.rx=49
						src.ry=133
						src.rz=1
					if("Quincy Tower")
						src.rx=89
						src.ry=149
						src.rz=1
					if("Rukongai Lab")
						src.rx=49
						src.ry=39
						src.rz=19
					if("Vaizard Base")
						src.rx=155
						src.ry=6
						src.rz=19

mob
	verb
		Stuck()
			set hidden=1
			if(src.lost)return
			if(src.gotthecharge&&portaltime)
				usr<<"You can't use this with the charge"
				return
			var/d=src.x
			var/c=src.y
			var/b=src.z
			src<<"Don't move for 30 seconds and you will be teleported"
			sleep(300)
			if(src.x==d&&src.y==c&&src.z==b)
				src.Respawn()
		Forum()
			set hidden=1
			usr<<link("http://soulwarz.forumotion.com/")//"http://s11.zetaboards.com/WWA/index/")
		Who()
			set hidden=1
			if(usr.who)
				return
			//var/tmp/C = 0
			//var/tmp/G = 0
			usr.who = 1
			/*usr << output("<font size=1><b><font color=blue><center>----------------------WHO------------------------","output")
			for(var/mob/M in world)
				if(M.client)
					C += 1
					if(M.GM>1)
						if(M.key!="Apple Monster"&&M.key!="Kavon172")
							usr << output("<font size=1><b><font color=white>[M.name]([M.key])-{[M.guild_name]}He is a GM","output")
							G += 1
					if(M.GM==1)
						usr << output("<font size=1><b><font color=green>[M.name]([M.key])-{[M.guild_name]}He is a Helper","output")
					if(!M.GM)
						usr << output("<font size=1><b><font color=green>[M.name]([M.key])-{[M.guild_name]}{[M.level]}","output")
			usr << output("<b><font color = yellow>[C] Players Online!","output")
			usr<< output("<b><font color = purple>[G] GMs Online!","output")
*/

			var/online=0
			var/G=0
			for(var/mob/player/M in All_Clients())
				if(M.key)
					online+=1
				if(M.GM>1)
					if(M.key!="Apple Monster"&&M.key!="Kavon172")
						G += 1
			var/whos
			whos+={"<STYLE>BODY {background: Black; color: White}IMG.icon{width:32;height:32} </STYLE> <tr align="center"><center><td colspan="6"><font size=3>Players Online:[online+2]</td></tr></table>"}

			whos+={"
<head><title>Players Online</title></head>
<br>
<table border="1" cellpadding="4">
<tr align="center"><th colspan="3"><font size=1>Name</th><th><font size=1>Guild Name</th><th><font size=1>Level</th></tr>"}
			for(var/mob/player/M in All_Clients())
				if(M.client)
					if(!M.GM || M.GM==9)
						if(M.key!=""&&M.key!="")
							whos+={"<tr align="center"><td colspan="3"><font size=2> [M.name]([M.key])</td><td><font size=2>{[M.guildname]}</td><td><font size=2>[M.level]</td></tr>"}
			for(var/mob/player/M in All_Clients())
				if(M.client&&M.GM)
					if(M.GM==1)
						whos+={"<tr align="center"><td colspan="3"><font color = purple><font size=3> [M.name]([M.key])</td><td><font size=3>{[M.guildname]}</td><td><font size=3>Helper</td></tr>"}
					if(M.GM>1)
						if(M.key!="Dragonpearl123"&&M.key!="")
							whos+={"<tr align="center"><td colspan="3"><font color = purple><font size=3> [M.name]([M.key])</td><td><font size=3>{[M.guildname]}</td><td><font size=3>GM</td></tr>"}
					if(M.key == "Dragonpearl123")
						whos+={"<tr align="center"><td colspan="3"><font color = purple><font size=3> [M.name]([M.key])</td><td><font size=3>{[M.guildname]}</td><td><font size=3>Owner</td></tr>"}
			//winshow(src, "browser-popup", 1)
			src<<browse(whos)
			sleep(10 SECONDS)
			usr.who = 0
mob
 var
		tmp/who = 0
mob
	var
		number
var
	snoboost=0
	snoslow=0
	snostun=0
	snoskill=0
	snomelee=0
	snomove=0
	challenger=null
	challengee=null
mob
	verb
		Challenge(mob/player/M in All_Clients())
			set hidden=1
			if(M == usr)
				usr<<"You can not Challenge yourself."
				return
			else
				snoboost=0
				snoslow=0
				snostun=0
				snoskill=0
				snomelee=0
				snomove=0
			/*	switch(input("Do you want to disable boosts?") in list("Yes","No"))
					if("Yes")
						snoboost=1
				switch(input("Do you want to disable slowdowns?") in list("Yes","No"))
					if("Yes")
						snoslow=1
				switch(input("Do you want to disable stuns?") in list("Yes","No"))
					if("Yes")
						snostun=1
				switch(input("Do you want to disable skills?") in list("Yes","No"))
					if("Yes")
						snoskill=1
				switch(input("Do you want to disable melee?") in list("Yes","No"))
					if("Yes")
						snomelee=1
				switch(input("Do you want to disable movement?(You will only be able to flashstep)") in list("Yes","No"))
					if("Yes")
						snomove=1	*/
				challengee = usr
				challenger = M
				world << "<b>Arena:</b>[M] has been Challenged by [usr]! You have 1 minute to respond!"
			/*	if(snoboost)
					world << "<b>Arena:</b>Boosts will be disabled"
				if(snoslow)
					world << "<b>Arena:</b>Slowdowns will be disabled"
				if(snostun)
					world << "<b>Arena:</b>Stuns will be disabled"
				if(snoskill)
					world << "<b>Arena:</b>Skills will be disabled"
				if(snomelee)
					world << "<b>Arena:</b>Melee will be disabled"
				if(snomove)
					world << "<b>Arena:</b>Only Flash steps are allowed"	*/
				(M) << sound(null)
				sleep(600)
				M<<"Chicken"
				usr<<"They Chickened out."
				challenger=null
				challengee=null


		Accept()
			set hidden=1
			if(challenger == usr)
				var/mob/M=challengee
				if(M)
					world << "<b>Arena:</b>[challenger] has accepted [challengee]'s Challenge!"
					M.loc = locate(43,65,5)
					usr.loc = locate(65,65,5)
					usr.health=usr.mhealth
					usr.wound=0
					usr.canattacks=0
					usr.safe=0
					usr.firing=0
					usr.frozen=0
					usr.rei=usr.mrei

					M.health=M.mhealth
					M.wound=0
					M.canattacks=0
					M.safe=0
					M.firing=0
					M.frozen=0
					M.rei=M.mrei
					usr.RemoveDonorStats()
					M.RemoveDonorStats()
					if(snoboost)
						M.noboost=1
						usr.noboost=1
					if(snoslow)
						M.noslow=1
						usr.noslow=1
					if(snostun)
						M.nostun=1
						usr.nostun=1
					if(snoskill)
						M.noskill=1
						usr.noskill=1
					if(snomelee)
						M.nomelee=1
						usr.nomelee=1
					if(snomove)
						M.nomove=1
						usr.nomove=1
					(M) << sound(null)
				else
					usr << "The person that challenged you isn't here!"
			else
				usr << "You haven't been challenged"


		Decline()
			set hidden=1
			if(challenger == usr)
				var/mob/M=challengee
				if(M)
					world << "<b>Arena:</b>[challenger] has declined [challengee]'s Challenge!"
					challenger=null
					challengee=null
				else
					usr << "They have not Challenged you!"
			else
				usr << "You haven't been challenged!"


/*mob/EJ
	verb
		Announce_Mute()
			set category = "GM"
			set name = "Announce Mute"
			world<<"<b> [usr] Muted Announce!"
			announce=1
		Announce_UnMute()
			set category = "GM"
			set name = "Announce UnMute"
			world<<"<b> [usr] unmuted Announce!"
			announce=0	*/
mob/espada/verb/Make_Fraccion()
	set category = "Espada"
	var/list/Menu = list()
	for(var/mob/player/M in All_Clients())
		if(!M.client) continue
		if(M.name != usr.name)
			if(!M.isfrac)
				if(M.race=="Arrancar")
				//	if(M.espadas>10)
					Menu.Add(M)
	var/mob/M = input("Who do you want to your fraccion??","") as null | anything in Menu
	if(!M)return
	if(istype(M,/mob/player))
		switch(alert(M,"Do you want to join [usr]'s Fraccion?","","Yes","No"))
			if("Yes")
				M.squadid = usr.squadid
				M.isfrac=1
				usr.verbs+= /mob/espada/verb/Fraccion_Say
				usr.verbs+= /mob/espada/verb/Fraccion_Who
				M.verbs+= /mob/espada/verb/Fraccion_Say
				M.verbs+= /mob/espada/verb/Fraccion_Who
				M.verbs+= /mob/espada/verb/Fraccion_Leave
				for(var/mob/X in All_Clients())
					if(X.squadid== usr.squadid)
						X << output("<b><font color = gray>Fraccion Info: [M] has joined the Fraccion!","output")
			if("No")
				usr << output("[M] has declined your Fraccion Invite","output")
				return

mob/espada
	verb
		Fraccion_Say(T as text)
			set category = "Espada"

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
				if(X.squadid == usr.squadid)
					X << output("<b><font color = yellow>(Squad Say)([src.espadas])[src.name]: [T]","output")


		Fraccion_Who()
			set category = "Espada"
			var/tmp/C = 0
			usr << "<font size=1><b><font color=yellow><center>-Online Squad Members-"
			for(var/mob/player/M in All_Clients())
				if(M.squadid == usr.squadid)
					C += 1
					usr << output("<font size=1><b><font color=red>[M.espadas] [M.name]","output")
			usr << output("<b><font color = red>[C] Squad Members Online!","output")
		Fraccion_Leave()
			set category = "Espada"
			switch(alert("Are you sure about leaving [src.squadid]?","","Yes","No"))
				if("Yes")
					src.isfrac=0
					src.verbs-=/mob/espada/verb/Fraccion_Say
					src.verbs-=/mob/espada/verb/Fraccion_Who
					src.verbs-=/mob/espada/verb/Fraccion_Leave
					world << output("<b><font color = yellow>Squad Info: [usr] has left Fraccion [usr.squadid]!","output")
					src.squadid = null
					Espada_Ranking(src)
				if("No")
					return






