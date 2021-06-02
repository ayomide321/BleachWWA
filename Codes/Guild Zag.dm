world
	Del()
		saveGuilds()
		..()
	New()
		..()
		loadGuilds()
proc
	saveGuilds()// and captains
		var/savefile/F=new("guilds.sav")
		F<<allGuilds
	loadGuilds()
		if(fexists("guilds.sav"))
			var/savefile/F=new("guilds.sav")
			F>>allGuilds
var/Guild/list/allGuilds=list()//new /Guild/Quatro_Phoenix

//save a world list of guild datums players access these when they login - make sure no two guilds are the same
Guild // have a load and refresh to readd members to guild list
	var
		guildTagg=""
		name="Zag's Guild"
		leader=null
		level=1
		totalXp=0
		exp=0
		expToLevel=1000000
		maxMembers=10 // increases as you level the guild

		list
			gMembers=list()// list of members inside the guild datum
	proc
		GInfo()
			.="Guild Name: [src.name], Current Founder: [src.leader]"
			.+="\nLevel:[src.level] Experience:([src.exp]/[src.expToLevel])"
			.+="\nTotal Accumulated Experience:[src.totalXp]"
			.+="\nMaximum Member Capacity:[src.maxMembers]."
			return .

		AddMember(mob/player/m)
			for(var/mob/player/z in world)
				if(!z.guildName)
					if(m.name==z.name)
						if(src.gMembers.len<src.maxMembers)
							world<<"<b><font color=red>[m.name] has joined the guild [src.name].</b></font>"
							src.gMembers+=m.name
							m.guildName=src.name
							saveGuilds()
		RemoveMember(var/namer,var/guildNamer="")
			src.gMembers-=namer
			for(var/mob/player/m in world)
				if(namer==m.name)
					m.guildName=null
					m.guildRank="Grunt"
					m.guildMuted=0
					m.canInvite=0
					m.canBoot=0
					m.canMute=0
					m.guildTag=null
			saveGuilds()
//			for(var/mob/player/z in world)
		//		if(m.name==z.name)
		GainXp(var/amt)
			src.exp+=amt
			src.totalXp+=amt
			src.LevelUp()
		LevelUp()
			while(src.exp>=expToLevel)
				src.level++
				src.exp-=src.expToLevel
				src.expToLevel=src.expToLevel**2
				src.maxMembers+=2

proc
	GrabGuildDatum(wh as text)//the name of the guild shud be the same as its tag- when u search for datums using a text string it looks for the tag var
		var/Guild/g=locate(wh) in allGuilds
		if(g)
			return g
		else
			return null
mob
	var
		guildTag=""
		guildRank="Grunt" // reset their rank too
		guildName=null // when a player logs in check to see if there guild name still exists in the guild datum if not remove them from guild
		guildMuted=0
		canInvite=0
		canBoot=0
		canMute=0
		tmp/openAlert=0


	proc
		GainGuildXp(tt as num)
			if(src.guildName)
				var/Guild/G=GrabGuildDatum(src.guildName)
				G.GainXp(tt)
		GrabGuildLeader() // grabs the guild leader of a player whos in a guild, if not in a guild returns no guild found
			if(src.guildName==null)
				return "No guild found"
			else
				for(var/Guild/a in allGuilds)
					if(a.name==src.guildName)
						return a.leader


	verb
		Guild_Say(T as text)
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
			if(guildName == null)
				alert("You must be in a guild to use this chat!")
				return
			for(var/mob/player/X in world)
				if(X.guildName == usr.guildName)
					X << output("<b><font color = aqua><font size=2>([src.guildRank])[src.name]: [T]","output")

		PopGuild()
			set category = "Guild"
			if(winget(usr,"GuildWin","is-visible")=="true")
				winshow(usr,"GuildWin",0)
			else
				winshow(usr,"GuildWin",1)
				usr.GuildInfo()
		Guild
			CreateGuild() // remove this from their verbs when they make a guild
				set category = "Guild"
				usr<<"Removed temporarily."
				return
				if(usr.guildName!=null)
					usr<<"Please leave your current guild before trying to create one"
					return
				if(usr.level<100)
					usr<<"You must be atleast level 100 to make a guild!"
					return
				if(!usr.openAlert)
					usr.openAlert=1
					switch(input("Do you wish to create a guild?", text) in list ("Yes","No"))
						if("Yes")
							tryagain
							var/guildName = input("","What will you call your guild?") as text|null
							if(!length(guildName))
								return
							if(isnull(usr))
								return
							if(length(guildName) < 2)
								alert("Please choose a longer name")
								goto tryagain
							if(length(guildName) > 25)
								alert("Please choose a shorter name!")
								goto tryagain
							var/nameNoGood=0
							for(var/Guild/a in allGuilds)
								if(a.name==guildName)
									nameNoGood=1
									break
							if(nameNoGood)
								alert("That guild already exists!")
								goto tryagain
							var/Guild/a=new()
							a.name=guildName
							a.tag=guildName // make sure tag is set to guild name to make searching for guilds easier
							a.leader=usr.name
							usr.guildName=guildName
							usr.guildRank="Leader"
							a.gMembers+=usr.name
							world<<"A guild has been formed:<b> [a.name]</b>. Led by <b>[usr.name]</b>."
						//	a.AddMember(usr) // give the player leader verbs and shit here
							allGuilds+=a // make sure to save the all guilds list later
							openAlert=0
							usr.canInvite=1
							usr.canMute=1
							usr.canBoot=1
							saveGuilds()
				else
					return
			InviteToGuild()
				set hidden = 1
				if(usr.guildName!=null)
					if(usr.canInvite||usr.guildRank=="Leader")
						var/list/Menu = list()
						for(var/mob/player/M in world)
							if(!M.guildName)
								Menu.Add(M)
						var/mob/M = input("Who do you want to invite to the Guild?","") as null | anything in Menu
						if(!M)return
						switch(alert(M,"[usr] has invited you to join: [usr.guildName] led by [usr.GrabGuildLeader()]","","Yes","No"))
							if("Yes")
								var/Guild/d=GrabGuildDatum(usr.guildName) // grab ur guild from the list of guilds
								d.AddMember(M)

			RemoveFromGuild()
				set hidden = 1
				if(usr.guildName!=null)
					if(usr.canBoot||usr.guildRank=="Leader")
						var/Guild/g=GrabGuildDatum(usr.guildName)
						var/list/Menu = list()
						for(var/M in g.gMembers)
							if(M.!=g.leader)
								Menu.Add(M)
						var/mob/M = input("Who do you want to remove from the Guild?","") as null | anything in Menu
						if(!M)return
						switch(alert(usr,"Do you really want to remove [M] from the guild?","","Yes","No"))
							if("Yes")
								g.RemoveMember(M,usr.guildName)// ill have to do a check when players log in and compare it to the list of members in the guild
								//if they dont match up start removing guild specific stuff from the player
			MuteGuildMember()
				set hidden = 1
				if(usr.guildName!=null)
					if(usr.canMute||usr.guildRank=="Leader")
						var/list/Menu = list()
						for(var/mob/player/M in world)
							if(M.guildName==usr.guildName)
								if(M.guildRank!="Leader")
									Menu.Add(M)
						var/mob/M = input("Who do you want to mute from the guild?","") as null | anything in Menu
						if(!M)return
						switch(alert(usr,"Do you really want to mute [M], preventing him from speaking in the guild-chat?","","Yes","No"))
							if("Yes")
								M.guildMuted=1
			UnMuteGuildMember()
				set hidden = 1
				if(usr.guildName!=null)
					if(usr.canMute||usr.guildRank=="Leader")
						var/list/Menu = list()
						for(var/mob/player/M in world)
							if(M.guildName==usr.guildName)
								if(M.guildRank!="Leader")
									Menu.Add(M)
						var/mob/M = input("Who do you want to un-mute from the guild?","") as null | anything in Menu
						if(!M)return
						switch(alert(usr,"Do you really want to un-mute [M], allowing him to speak in the guild-chat again?","","Yes","No"))
							if("Yes")
								M.guildMuted=0
			ChangeGuildTag()
				set hidden = 1
				if(usr.guildName!=null)
					if(usr.guildRank=="Leader")
						tryagain
						var/guildNafme = input("","What will your new guild tag be?") as text|null
						if(length(guildNafme) < 2)
							alert("Please choose a longer name")
							goto tryagain
						if(length(guildNafme) > 10)
							alert("Please choose a shorter name!")
							goto tryagain
						usr.guildTag=guildNafme
						var/Guild/g=GrabGuildDatum(usr.guildName)
						g.guildTagg=guildNafme
						for(var/mob/player/m in world)
							if(m.guildName==usr.guildName)
								m.guildTag=guildNafme
			GivePowers()
				set hidden = 1
				if(usr.guildName!=null)
					if(usr.guildRank=="Leader")
						var/powersToGive=0
						switch(alert(usr,"Which powers do you want to give a guild member to?","Co-Leader","Boot","Invite","Mute"))
							if("Co-Leader")
								powersToGive="colead"
							if("Boot")
								powersToGive="boot"
							if("Invite")
								powersToGive="invite"
							if("Mute")
								powersToGive="mute"
						var/list/Menu = list()
						for(var/mob/player/M in world)
							if(M.guildName==usr.guildName)
								if(M.guildRank!="Leader")
									Menu.Add(M)
						var/mob/M = input("Who will get these powers?","") as null | anything in Menu
						if(!M)return
						switch(alert(usr,"Do you really want to give [M.name] these powers?","","Yes","No"))
							if("Yes")
								switch(powersToGive)
									if("colead")
										M.guildRank="Co-Leader"
										M.canInvite=1
										M.canBoot=1
										M.canMute=1
									if("boot")
										M.canBoot=1
									if("invite")
										M.canInvite=1
									if("Mute")
										M.canMute=1

			ChangeRank()
				set hidden = 1
				if(usr.guildName!=null)
					if(usr.guildRank=="Leader"||usr.guildRank=="Co-Leader")
						tryagain
						var/i=input(usr,"What Rank/Title are you giving away? Type in nothing and enter to not change the rank.") as text
						if(!length(i))
							return
						if(length(name) > 25)
							alert("Please choose a shorter Title!")
							goto tryagain
						var/list/Menu = list()
						for(var/mob/player/M in world)
							if(M.guildName==usr.guildName)
								if(M.guildRank!="Leader"&&M.guildRank!="Co-Leader")
									Menu.Add(M)
						var/mob/M = input("Who will get this Title/Rank","") as null | anything in Menu
						if(!M)return
						switch(alert(usr,"Do you really want to give [M.name] give Title/Rank ([i])?","","Yes","No"))
							if("Yes")
								M.guildRank=i


			StripPowers()
				set hidden = 1
				if(usr.guildName!=null)
					if(usr.guildRank=="Leader")
						var/list/Menu = list()
						for(var/mob/player/M in world)
							if(M.guildName==usr.guildName)
								if(M.guildRank!="Leader")
									Menu.Add(M)
						var/mob/M = input("Who will get these powers?","") as null | anything in Menu
						if(!M)return
						switch(alert(usr,"Do you really want to strip [M.name] of his guild powers?","","Yes","No"))
							if("Yes")
								M.canInvite=0
								M.guildRank="Grunt"
								M.canBoot=0
								M.canMute=0
			DisbandGuild()
				set hidden = 1
				if(usr.guildName!=null)
					if(usr.guildRank=="Leader")
						switch(alert(usr,"Do you wish to disband your guild?","","Yes","No"))
							if("Yes")
								var/Guild/d=GrabGuildDatum(usr.guildName)
								for(var/mob/player/pa in world)
									if(pa.name in d.gMembers)
										pa.guildMuted=0
										pa.canInvite=0
										pa.canBoot=0
										pa.canMute=0
										pa.guildRank="Grunt"
										pa.guildName=null
										d.gMembers-=pa.name

								for(var/m in d.gMembers)
									d.gMembers-=m//do a check on login to boot members not online
								world<<"<font size=3><font color=red>The Guild: [d.name] has been disbanded"
								allGuilds-=d
								del d

			GuildWho()
				if(usr.guildName!=null)
					var/Guild/d=GrabGuildDatum(usr.guildName)
					var/outputer=""
					usr<<output(null,"GuildInfoLab")
					outputer+="Number of Guild members: [d.gMembers.len]\n"
					for(var/stuff in d.gMembers)
						outputer+="[stuff],"
					usr<<output("[outputer]","GuildInfoLab")
			LeaveGuild()
				if(usr.guildName!=null)
					var/Guild/d=GrabGuildDatum(usr.guildName) // grab ur guild from the list of guilds
					if(usr.name==d.leader)
						switch(alert(usr,"Do you wish to disband your Guild??","","Yes","No"))
							if("Yes")
								usr.DisbandGuild() // if ur leader and u leave party gets disbanded
					else
						switch(alert(usr,"Do you really want to leave the Guild: [d.name]?","","Yes","No"))
							if("Yes")
								d.RemoveMember(usr,usr.guildName)

			GuildActions()
				if(usr.guildName)
					var/list/commands=list()
					commands+="Leave Guild"
					commands+="Guild Who"
					if(usr.guildRank=="Leader"||usr.guildRank=="Co-Leader")
						commands+="Change Guild Tag"
						commands+="Strip Powers"
						commands+="Give Rank"
						commands+="Give Powers"
					if(usr.canInvite)
						commands+="Invite To Guild"
					if(usr.canMute)
						commands+="Mute"
						commands+="Unmute"
					if(usr.canBoot)
						commands+="Exile From Guild"
					var/i=input(usr,"Which action do you wish to perform?")as null|anything in commands//"Re-spec"
					if(i)
						switch(i)
							if("Change Guild Tag")
								usr.ChangeGuildTag()
							if("Strip Powers")
								usr.StripPowers()
							if("Give Rank")
								usr.ChangeRank()
							if("Give Powers")
								usr.GivePowers()
							if("Guild Who")
								usr.GuildWho()
							if("Leave Guild")
								if(alert(usr,"Are you sure?","Leave?","Yes.","No.")=="Yes.")
									usr.LeaveGuild()

							if("Invite To Guild")
								usr.InviteToGuild()
							if("Mute")
								usr.MuteGuildMember()
							if("Unmute")
								usr.UnMuteGuildMember()
							if("Exile From Guild")
								usr.RemoveFromGuild()


			GuildInfo()
				if(usr.guildName)
					var/Guild/G=GrabGuildDatum(usr.guildName)
					usr<<output(null,"GuildInfoLab")
					usr<<output(G.GInfo(),"GuildInfoLab")
				else
					alert(usr,"You need to join a guild first.")

mob
	proc
		ForceDisband()//and leave
			if(src.guildName!=null)
				if(src.guildRank=="Leader")
					var/Guild/d=GrabGuildDatum(usr.guildName)
					for(var/mob/player/pa in world)
						if(pa.name in d.gMembers)
							pa.guildMuted=0
							pa.canInvite=0
							pa.canBoot=0
							pa.canMute=0
							pa.guildTag=null
							pa.guildRank="Grunt"
							pa.guildName=null
							d.gMembers-=pa.name
					d.gMembers-=src.name
					for(var/m in d.gMembers)
						d.gMembers-=m//do a check on login to boot members not online
					world<<"<font size=3><font color=red>The Guild: [d.name] has been disbanded"
					allGuilds-=d
					del d
				else
					var/Guild/d=GrabGuildDatum(src.guildName)
					if(src.name in d.gMembers)
						src.guildMuted=0
						src.canInvite=0
						src.canBoot=0
						src.canMute=0
						src.guildTag=null
						src.guildRank="Grunt"
						src.guildName=null
						d.gMembers-=src.name
