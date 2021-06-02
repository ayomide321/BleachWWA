mob
	var
		tmp
			teamid
			team_leader = 0
			team_member = 0
			in_team = 0
		togglepartyinv=0


mob
	verb

		Toggle_Invites()
			set category = "Party"
			if(!togglepartyinv)
				usr.togglepartyinv=1
				usr<<"You are no longer getting party invitations."
			else
				usr<<"You can now receive party invitations."
				usr.togglepartyinv=0


		Create_Party()
			set category = "Party"
			if(usr.race != "Human")
				if(usr.in_team)
					usr << output("<b>You are already in a party!","output")
					return
				switch(alert("Are you sure you want to create a party?","","Yes","No"))
					if("Yes")
						goto Create
					if("No")
						return
				Create
					if(usr.lost)
						usr<<"Not while in an event"
						return
					usr.teamid = rand(1,500000)
					usr.team_leader = 1
					usr.in_team = 1
					usr.leaderbonus=1
					usr << output("<b><font color = teal>You have joined [usr]'s party!","output")
					usr << output("<b><font color = teal>You have created a party!","output")
					usr.overlays += /obj/gl
					usr.Give_Team_Verbs()
			else
				usr << "<b>Humans cannot create a team."

mob/var/tmp/changedled=0

mob/Party_Leader
	verb
		Chanled()
			set category = "Party"
			set name = "Change Party Leader"
			var/list/Menu = list()
			for(var/mob/player/M in All_Clients())
				if(M.name != usr.name)
					if(M.in_team)
						if(M.teamid == usr.teamid)
							Menu.Add(M)
			var/mob/player/M = input("Who do you wish to make the new party leader?","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob/player))
				M.team_leader=1
				M.Give_Team_Verbs()
				usr.changedled=1
			if(usr.changedled)
				usr.Changeleadverbs()
				usr.Give_Team_Verbs()
			for(var/mob/player/X in All_Clients())
				if(X.teamid== usr.teamid)
					X << output("<b><font color = red><u>(Party News): [usr] has made [M] the new party leader","output")


		Team_Invite()
			set category = "Party"
			set name = "Party Invite"
			var/list/Menu = list()
			var/J = 1
			for(var/mob/player/M in All_Clients())
				if(M.teamid == usr.teamid&&M.in_team)
					J += 1
			if(J >= 15)
				usr << output("<b>You have too many members in your party!","output")
				return
			for(var/mob/player/M in All_Clients())
			//	if(!M.client) continue
				if(M.name != usr.name)
					if(M.in_team)
						Menu.Remove(M)
					if(!M.in_team && !M.togglepartyinv)
						Menu.Add(M)
			var/mob/M = input("Who do you want to invite to your party?","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob/player))
				switch(alert(M,"Do you want to join [usr]'s party?","","Yes","No"))
					if("Yes")
						var/Js = 1
						for(var/mob/player/Md in All_Clients())
							if(Md.teamid == usr.teamid)
								Js += 1
								usr.leaderbonus+=1
						if(Js >= 15)
							M << output("<b>[usr] has no more space for you!","output")
							return
						if(M.lost)
							M<<"Not while in an event"
							return
						M.teamid = usr.teamid
						M.team_member = 1
						M.in_team = 1
						M.Give_Team_Verbs()
						for(var/mob/player/X in All_Clients())
							if(X.teamid== usr.teamid)
								X << output("<b><font color = teal>Party Info: [M] has joined the party!","output")
					if("No")
						usr << output("[M] has declined your party Invite","output")
						sleep(60)
						return
		Party_Boot()
			set category = "Party"
			var/list/Menu = list()
			for(var/mob/player/M in All_Clients())
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.in_team)
						if(M.teamid == usr.teamid)
							Menu.Add(M)
			var/mob/player/M = input("Who do you wish to boot from the party?","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob/player))
				switch(alert("Are you sure you want to boot [M] from the party?","","Yes","No"))
					if("Yes")
						for(var/mob/player/X in All_Clients())
							if(X.teamid== usr.teamid)
								X << output("<b><font color = teal>Party Info: [usr] has booted [M] from the party!","output")
						usr.leaderbonus-=1
						M.leaveteam()
						M.teamid=0
						M.team_leader = 0
						M.team_member = 0
						M.in_team = 0
					if("No")
						return
mob/Party_Verbs
	verb
		Team_Say(T as text)
			set category = "Party"
			set name="Party Say"
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
				if(X.teamid== usr.teamid)
					X << output("<b><font color = teal><u>(Party Say)[src.name]: [T]","output")
		Team_Who()
			set category = "Party"
			set name="Party Who"
			src << output("<b><font color = teal><u>(Party Who)","output")
			for(var/mob/player/X in All_Clients())
				if(X.teamid== usr.teamid)
					src << output("<font color = teal>[X]","output")
		Leave_Party()
			set category = "Party"
			switch(alert("Are you sure you want to leave the party?","","Yes","No"))
				if("Yes")
					for(var/mob/player/M in All_Clients())
						if(M.teamid == usr.teamid)
							M << output("<b><font color = teal>[usr] has left the party!","output")
							if(M.team_leader == 1)
								M.leaderbonus-=1
					src.leaveteam()
					src.teamid = null
					src.leaderbonus=0
					src.team_leader = 0
					src.team_member = 0
					src.in_team = 0
				if("No")
					return

mob
	proc
		Changeleadverbs()
			if(src.changedled)
				src.verbs -= typesof(/mob/Party_Leader/verb)
				src.team_leader=0
				src.team_member=1

		Give_Team_Verbs()
			if(src.inguild)
				if(src.guildname==G1name)
					if(G1lvl>200)
						src.verbs += typesof(/mob/Party_Leader_Guild/verb)
				if(src.guildname==G2name)
					if(G2lvl>200)
						src.verbs += typesof(/mob/Party_Leader_Guild/verb)
				if(src.guildname==G3name)
					if(G3lvl>200)
						src.verbs += typesof(/mob/Party_Leader_Guild/verb)
				if(src.guildname==G4name)
					if(G4lvl>200)
						src.verbs += typesof(/mob/Party_Leader_Guild/verb)
				if(src.guildname==G5name)
					if(G5lvl>200)
						src.verbs += typesof(/mob/Party_Leader_Guild/verb)
			if(src.team_leader)
				src.verbs += typesof(/mob/Party_Leader/verb)
				src.verbs += typesof(/mob/Party_Verbs/verb)
			if(src.team_member)
				src.verbs += typesof(/mob/Party_Verbs/verb)
		leaveteam()
			src.verbs -= typesof(/mob/Party_Leader_Guild/verb)
			src.verbs -= typesof(/mob/Party_Leader/verb)
			src.verbs -= typesof(/mob/Party_Verbs/verb)