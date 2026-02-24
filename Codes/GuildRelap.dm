//15members, 1k* yen per slot up to 25 max, guild banking+log, guild ranking.
var/list/guilds = list()

guild
	var
		name
		leader
		coleader
		color
		insignia
		invades
		defends
		slots
		bank
		list/members=list()
	New(rname,rleader,rcoleader,rcolor,rinsignia,rinvades,rdefends,rslots,rbank)
		name = rname
		leader = rleader
		coleader = rcoleader
		color = rcolor
		insignia = rinsignia
		invades = rinvades
		defends = rdefends
		slots = rslots
		bank = rbank
		if(guilds&&istype(guilds,/list)) guilds += src
		else
			guilds = list()
			guilds += src

mob/Owner/verb/Create_Guild2()
	set category = "Guild"
	if(usr.z==8)
		usr<<"You cannot make a guild here."
		return
	if(usr.eventpoints<70)
		usr<<"You need 70 event points to create a guild."
		return
	if(usr.level<700)
		usr<<"Level 700 is required to make guilds."
		return
	if(usr.inguild)
		usr<<"Leave your current guild if you wish to create a new one."
		return
	var/guildname=input("What would you like to name your guild? No HTML or obscene characters(ascii included).","Guild Creation: 25SP") as text
	guildname=cursefilter(capsfilter(html_encode(removeBreaks(guildname))))
	if(!namesfilter(guildname)||length(guildname)<3||length(guildname)>25)
		usr<<"Your guild name cannot contain anything other than letters, numbers, spaces, or underlines, and must be 3 letters minimum, 20 maximum."
		return
	var/exists=0
	for(var/guild/x in guilds) if(x.name==guildname)
		if(usr.key==x.leader)
			usr<<"You have obtained leadership of '[guildname]', your guild."
			usr.guildname=guildname
			usr.inguild=3
		else usr<<"'[guildname]' has already been created by '[x.leader]'."
		exists++
		break
	if(exists)return
	new /guild(guildname,usr.key,"","#87cefa",'Icons/mouse.dmi',0,0,15,0)
	usr.eventpoints-=70
	usr.guildname=guildname
	usr.inguild=3
	usr<<"You have created the guild '[guildname]'."
	usr<<output("<center>[usr.guildname]","guildownwin.guildoutput")
//-----------------------------------------
mob/Owner/verb/Guild_Invite(mob/M in All_Clients())
	set category = "Guild"
	ASSERT(M)
//	if(!M.invitetoggle)
//		usr<<"[M] doesn't want to be invited."
//		return
	if(M.inguild)
		usr<<"[M] is already in the guild '<font color=[M.guildcolor]>[M.guildname]</font>'"
		return
	//if(M.inhouse||M.joinedctf||M.intournament||M.ininvasion||M.defender||inrukiafight=="[M.name]"||inginfight=="[M.name]"||inikkakufight=="[M.name]"||inkenpachifight=="[M.name]"||inbyakuyafight=="[M.name]"||invaizardfight=="[M.name]"||ishidachallenger=="[M.name]"||sadochallenger=="[M.name]"||inrenjifight=="[M.name]"||usr.insadochallenge||inhinamorifight=="[M.name]"||inkirafight=="[M.name]"||intoushiroufight=="[M.name]"||inukitakefight=="[M.name]") return
	if(!usr.inguild)
		switch(input(M,"[usr] is inviting you into '[usr.guildname]', accept?","Guild Invite") in list("Yes","No"))
			if("Yes")
				if(M&&usr&&usr.inguild&&!M.inguild)
					var/pass=0
					for(var/guild/x in guilds) if(x.name==usr.guildname)
						if(x.slots>length(x.members)) x.members+=M
						else pass=x.slots
						break
					if(!pass)
						M.guildname=usr.guildname
						M.inguild=1
						M.guildcolor=usr.guildcolor
						M.mouse_over_pointer=usr.mouse_over_pointer
						M<<"You've joined [usr.guildname]."
						usr<<"[M] has joined [usr.guildname]."
					else usr<<"You have reached your maximum slot capacity of [pass][pass<25?", you can purchase up to 25 slots":""]."
			if("No")
				if(M&&usr) usr<<"[M] has rejected your offer to join [usr.guildname]."
	else usr<<"You're unable to recruit with your rank."
//-----------------------------------------
mob/Owner/verb/Guild_Boot(mob/M in All_Clients())
	set category = "Guild"
	if(M.guildname==usr.guildname&&usr.inguild&&M.inguild!=usr.inguild)
		for(var/guild/x in guilds) if(x.name==usr.guildname)
			x.members-=M
			break
			M.inguild=0
			M.guildname=""
			M.guildcolor="#87cefa"
			M.mouse_over_pointer='Icons/mouse.dmi'
//-----------------------------------------
mob/Owner/verb/Leave_Guild()
	set category = "Guild"
	if(usr.inguild)
		if(usr.inguild)
			for(var/mob/M in All_Clients()) if(M.guildname==usr.guildname&&M!=usr)
				M.inguild=0
				M.guildname=""
				M.guildcolor="#87cefa"
				M.mouse_over_pointer='Icons/mouse.dmi'
				M<<"[usr] has disbanded '[usr.guildname]'."
			for(var/guild/x in guilds) if(x.name==usr.guildname)
				guilds-=x
				break
		usr<<"You have left [usr.guildname]."
		usr.inguild=0
		usr.guildname=""
		usr.guildcolor="#87cefa"
		usr.mouse_over_pointer='Icons/mouse.dmi'
		usr<<output(null,"guildownwin.guildoutput")
		usr<<output(null,"guildownwin.guildinfo")
	else usr<<"You aren't in a guild."
//-----------------------------------------
/*mob/Owner/verb/Guild_Promotion(mob/M in All_Clients())
	set hidden=1
	ASSERT(M)
	if(!M.realplayer||!usr.inguild||!M.inguild||usr.inhouse||M.inhouse||M.guildname!=usr.guildname||M.inguild==3||M.inguild==4)return
	switch(M.inguild)
		if(1)
			M.inguild=2
			M<<"You've been promoted to: Recruiter."
			usr<<"[M] has been promoted to: Recruiter."
		if(2)
			var/guild/x
			for(x in guilds) if(x.name==usr.guildname)
				x=x
				break
			if(!x.coleader)
				x.coleader=M.key
				M.inguild=4
				M<<"You've been promoted to: Co-Leader."
				usr<<"[M] has been promoted to: Co-Leader."
			else
				switch(alert("'[x.coleader]' is already the Co-Leader, pick.","Guild Promotion","Keep","Remove","Replace"))
					if("Keep") return
					if("Remove")
						for(var/mob/N in All_Clients()) if(N.key==x.coleader) N.inguild=1
						usr<<"Co-Leader: '[x.coleader]' has been removed."
						x.coleader=""
					if("Replace")
						ASSERT(M)
						for(var/mob/N in All_Clients()) if(N.key==x.coleader) N.inguild=1
						usr<<"Co-Leader: '[x.coleader]' has been replaced with '[M.key]'."
						M.inguild=4
						x.coleader=M.key	*/
//-----------------------------------------
/*mob/Owner/verb/Guild_Demotion(mob/M in All_Clients())
	set hidden=1
	ASSERT(M)
	if(!M.realplayer||usr.inguild!=3||M.inguild==3||M.inguild==1||M.guildname!=usr.guildname)return
	switch(M.inguild)
		if(2)
			M.inguild=1
			M<<"You've been demoted to: Member."
			usr<<"[M] has been demoted to: Member."
		if(4)
			for(var/guild/x in guilds) if(x.name==usr.guildname)
				if(x.coleader==M.key) x.coleader=""
				break
			M.inguild=2
			M<<"You've been demoted to: Recruiter."
			usr<<"[M] has been demoted to: Recruiter."
//-----------------------------------------
mob/Owner/verb/uploadguildsign()
	set hidden=1
	if(!usr.inguild||usr.inguild!=3)return
	usr<<"<b>Specifications:</b> Must be within 32x32p, in .dmi format, and less than or equal to 5kb."
	var/icon/I=input("Select the insignia","Guild Insignia") as icon
	var/obj/A=new()
	A.name="[I]"
	if(findtextEx(A.name,".dmi"))
		if(length(file(I))<=5000)
			for(var/guild/x in guilds) if(x.name==usr.guildname)
				x.insignia=I
				break
			usr.mouse_over_pointer=I
			for(var/mob/M in players) if(M.realplayer&&M!=usr&&usr.guildname==M.guildname) M.mouse_over_pointer=I
		else usr<<"<b>Error:</b> Must be less than or equal to 5kb."
	else usr<<"<b>Error:</b> Must be in .dmi format."
	del(A)*/
//-----------------------------------------
mob/Owner/verb/guildcolor()
	set category = "Guild"
	if(!usr.inguild)return
	usr.guildcolor=input(usr,"Select the color choice for your Guild.","Guild Color",usr.guildcolor) as color
	for(var/guild/x in guilds) if(x.name==usr.guildname)
		x.color=usr.guildcolor
		break
	for(var/mob/M in All_Clients()) if(M.inguild&&usr.guildname==M.guildname) M.guildcolor=usr.guildcolor
//-----------------------------------------
mob/Owner/verb/checkguild()
	set category = "Guild"
	var
		list/choices=new
		guild/x
	for(x in guilds) choices["[x.name]"]=x
	var/choice=input(usr,"Which guild do you wish to check out?","Guild Check") as null|anything in choices + list("(Cancel)")
	if(!choice||choice=="(Cancel)") return
	x=choices[choice]
	usr<<output(null,"guildownwin.guildoutput")
	usr<<output(null,"guildownwin.guildinfo")
	usr<<output("<center>[choice]","guildownwin.guildoutput")
	usr<<output("Invades: [x.invades]<br>Defends: [x.defends]","guildownwin.guildinfo")
//-----------------------------------------
mob/Owner/verb/guildmanage()
	set category = "Guild"
	if(!usr.cansave)
		usr<<"Must be logged in for this feature."
		return
	winshow(usr,"guildownwin",2)
	usr<<output(null,"guildownwin.guildoutput")
	if(usr.inguild)
		usr<<output("<center>[usr.guildname]","guildownwin.guildoutput")
		for(var/guild/x in guilds) if(x.name==usr.guildname)
			usr<<output("Invades: [x.invades]<br>Defends: [x.defends]","guildownwin.guildinfo")
			break
//-----------------------------------------
mob/Owner/verb/guildclose()
	set category = "Guild"
	if(!usr.cansave)
		usr<<"Must be logged in for this feature."
		return
	winshow(usr,"guildownwin",0)
	usr<<output(null,"guildownwin.guildoutput")
	usr<<output(null,"guildownwin.guildinfo")
//-----------------------------------------




proc/removeBreaks(string)
	var/breakpos = findtextEx(string,"\n")
	while(breakpos)
		string=copytext(string, 1, breakpos) + copytext(string, breakpos+1)
		breakpos=findtextEx(string, "\n")
	return string
//-----------------------------------------
proc/capsfilter(string)
	var/msglen=length(string)
	if(msglen>6)
		var/caps=0
		var/tmsg=""
		for(var/i=1,i<=msglen,i++)
			tmsg=copytext(string,i,i+1)
			if(tmsg==uppertext(tmsg)) caps++
		var/equation=(caps/msglen)
		if(msglen>=15)
			if(equation>=0.6) string=lowertext(string)
		else
			if(equation>=0.8) string=lowertext(string)
	return string
//-----------------------------------------
proc/namesfilter(string)
	var/char=text2ascii(string,1)
	switch(char)
		if(0x30 to 0x39,0x41 to 0x5A,0x61 to 0x7A)
			for(var/i=2,i<=length(string),++i)
				char=text2ascii(string,i)
				switch(char)
					if(0x00 to 0x1F, 0x2F, 0x5C, 0x3A, 0x2A, 0x3F, 0x22, 0x3C, 0x3E, 0x27, 0x7F) return 0
					else continue
			char=text2ascii(string,length(string))
			switch(char)
				if(0x30 to 0x39, 0x41 to 0x5A, 0x61 to 0x7A) return 1
				else return 0
		else return 0

//-----------------------------------------
proc/cursefilter(string)
	if(oocfiltered)
		var
			loc
			cl
		for(var/i = 1,i < curselist.len + 1,i++)
			loc = findtext(string,curselist[i])
			while(loc)
				cl = length(curselist[i])
				string = copytext(string,1,loc) + cursereplace(curselist[i]) + copytext(string,loc+cl)
				loc = findtext(string,curselist[i])
	return string


proc/cursereplace(string)
	var/a=""
	switch(string)
		if("beaner") a="mexican american"
		if("bitch") a="female dog"
		if("bastard") a="illegitimate child"
		if("chink") a="asian"
		if("cracker") a="white american"
		if("coon") a="african american"
		if("cunt") a="vagina"
		if("fag") a="homosexual"
		if("fuck") a="fornicate"
		if("gay") a="homosexual"
		if("gook") a="chinese"
		if("hoe") a="woman"
		if("honkey") a="white american"
		if("nigger") a="african american"
		if("queer") a="homosexual"
		if("shit") a="poop"
		if("skank") a="dirty girl"
		if("slut") a="sexually popular woman"
		if("spick") a="mexican american"
		if("spook") a="white american"
		if("twat") a="female genitals"
		if("wetback") a="mexican american"
		if("whore") a="sexually popular woman"
	return a


var
	list/curselist=list("beaner","bitch","bastard","chink","coon","cracker","cunt","fag","fuck","gay","gook","hoe","honkey","nigger","queer","shit","skank","slut","spick","spook","twat","wetback","whore")
	oocfiltered=0