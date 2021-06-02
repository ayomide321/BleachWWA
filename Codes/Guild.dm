mob
	var
		guild_name = ""
		guild_leader = 0
		guild_co_leader = 0
		guild_member = 0
		guild_rank = ""
		in_guild = 0
mob/var
	Guild="None"
	Guildrank=""
var
	list/
		Guilds = list()
mob
 verb
		Create_Guild()
			set hidden=1
			if(usr.level >= 400)
				var/list/L
				L = list("font size")
				if(usr.in_guild)
					usr << "<b>You are already in a Guild!"
					return
				switch(alert("Are you sure that you want to create a guild?","","Yes","No"))

					if("Yes")
						var/new_guild_name = input("What do you want to call your guild?","") as text
						if(!new_guild_name)
							alert("Guild Name may not be blank.")
							return
						for(var/X in L)
							if(findtext(new_guild_name,X))
								alert("You canno't change your font size!")
								return
						if(lentext(new_guild_name) > 1000)
							alert("Your guild name is too long!")
							return
						usr.guild_name = new_guild_name
						usr.guild_leader = 1
						usr.guild_rank = "Leader"
						usr.in_guild = 1
						world << "<b><font color = aqua>Guild Info: [usr] has created the Guild [usr.guild_name]!"
						usr.overlays += /obj/gl
						Guilds.Add(usr.guild_name)
						usr.Give_Guild_Verbs()

					if("No")
						return

			else
				usr << "<b>You must be over level 400 to own a Guild!"

mob/Guild_Leader
	verb
		Guild_Invite2()
			set category = "Guild"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(!M.in_guild)
						Menu.Add(M)

			var/mob/M = input("Who do you want to invite to the Guild?","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob/player))
				switch(alert(M,"Do you want to join [usr]'s guild?","","Yes","No"))
					if("Yes")
						M.guild_name = usr.guild_name
						M.guild_member = 1
						M.guild_rank = "Member"
						M.in_guild = 1
						M.Give_Guild_Verbs()
						world << "<b><font color = aqua>Guild Info: [M] has joined the Guild [usr.guild_name]!"
					if("No")
						usr << "[M] has declined your Guild Invite"
						return
		Guild_Boot2()
			set category = "Guild"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.in_guild)
						if(M.guild_name == usr.guild_name)
							Menu.Add(M)
			var/mob/M = input("Who do you want to boot from the Guild?","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob/player))
				if(M.guild_leader)
					alert("You cannot boot the leader!")
					return
				switch(alert("Are you sure you want to boot [M] from the guild?","","Yes","No"))
					if("Yes")
						world << "<b><font color = aqua>Guild Info: [usr] has booted [M] from the Guild [usr.guild_name]!"
						M.leaveguild()
						M.guild_name = "None"
						M.guild_leader = 0
						M.guild_co_leader = 0
						M.guild_member = 0
						M.guild_rank = ""
						M.in_guild = 0
					if("No")
						return
		Change_Rank()
			set category = "Guild"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.in_guild)
						if(M.guild_name == usr.guild_name)
							Menu.Add(M)

			var/mob/M = input("Who's rank do you want to change?","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob/player))
				if(M.guild_leader)
					alert("You cannot change the leader's Rank!")
				switch(input("What rank do you wish to give [M]?")in list("Co-Leader","Member","Custom","Cancel"))
					if("Co-Leader")
						M.guild_co_leader = 1
						M.Give_Guild_Verbs()
						M.guild_rank = "Co-Leader"
					if("Member")
						M.guild_member = 1
						M.leaveguild()
						M.Give_Guild_Verbs()
						M.guild_rank = "Member"
					if("Cancel")
						return
		Custom_Rank()
			set category = "Guild"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.in_guild)
						if(M.guild_name == usr.guild_name)
							Menu.Add(M)

			var/mob/M = input("Who's rank name do you want to change?","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob/player))
				var/ID=input("What do you want to Rename [M]'s Rank name to?")as text
				M.guild_rank=ID
		Guild_Announce2(T as text)
			set category = "Guild"
			var/list/L
			L = list("font size")
			if(lentext(T) > 400)
				alert("Your message must be less than 400 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.guild_name == usr.guild_name)
					X << output("<font size=4><font color = purple><font face=times new roman><b><center>[usr] would like to Announce to the Guild:<center><br>[T]","output")

mob/Guild_Verbs
	verb
		Guild_Say2(T as text)
			set category = "Guild"

			var/list/L
			L = list("font size")

			if(lentext(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.guild_name == usr.guild_name)
					X << output("<b><font color = aqua><font size=3>(Guild Say)([src.guild_rank])[src.name]: [T]","output")


		Guild_Who()
			set category = "Guild"
			var/tmp/C = 0
			usr << "<font size=1><b><font color=gray><center>---------------------GUILD WHO------------------------"
			for(var/mob/M in world)
				if(M.in_guild)
					if(M.guild_name == usr.guild_name)
						C += 1
						usr << "<font size=1><b><font color=red>[M.name]([M.key])([M.guild_rank])-[M.race]"
			usr << "<b><font color = red>[C] Guild Members Online!"
			usr << "<font size=1><b><font color=silver><center>---------------------GUILD WHO------------------------"

		Guild_Leave()
			set category = "Guild"
			switch(alert("Are you sure you want to leave the Guild [src.guild_name]?","","Yes","No"))
				if("Yes")
					src.leaveguild()
					world << "<b><font color = aqua>Guild Info: [usr] has left the Guild [usr.guild_name]!"
					src.guild_name = ""
					src.guild_leader = 0
					src.guild_co_leader = 0
					src.guild_member = 0
					src.guild_rank = ""
					src.overlays -= /obj/gl
					src.overlays -= /obj/gl
					src.overlays -= /obj/gl
					src.overlays -= /obj/gl
					src.in_guild = 0
				if("No")
					return

mob
	proc
		Give_Guild_Verbs()
			if(src.guild_leader)
				src.verbs += typesof(/mob/Guild_Leader/verb)
				src.verbs += typesof(/mob/Guild_Verbs/verb)
			if(src.guild_co_leader)
				src.verbs += typesof(/mob/Guild_Leader/verb)
				src.verbs += typesof(/mob/Guild_Verbs/verb)
			if(src.guild_member)
				src.verbs += typesof(/mob/Guild_Verbs/verb)
		leaveguild()
			src.verbs -= typesof(/mob/Guild_Leader/verb)
			src.verbs -= typesof(/mob/Guild_Verbs/verb)

