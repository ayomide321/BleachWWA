#define DEBUG



#define DAYS    *864000
#define DAY     *864000
#define HOURS   *36000
#define HOUR    *36000
#define MINUTES *600
#define MINUTE  *600
#define SECONDS *10
#define SECOND  *10
#define TICKS   *1
#define TICK    *1






client
//	script = "<STYLE>BODY {background: black; font-size: 1;color: white}</STYLE>"
//	control_freak=CONTROL_FREAK_ALL
mob/player
mob
	New()
		..()
		if(!src.enemy&&!src.npc)
			src.regeneration()
		if(src.enemy)
			src.health=src.mhealth
			src.rei=src.mrei
		src.reiatsu=src.mreiatsu
		src.attack=src.mattack
		src.defence=src.mdefence
/*		spawn(300)
		if(src.name=="mob")
			world<<"Name: [src]"
			world<<"Loc: [src.x],[src.y],[src.z],[src.loc]"
			world<<"I was here [test12]"
			test12+=1
var
	tmp/test12=1
*/

mob/proc
	MoveThatHatUp()
		var/icon/a=new('hat drop shunsui.dmi')
		a.Shift(NORTH,3)
		fcopy(a,"hat drop shunsui.dmi")


proc
	Clear_Blank_Mobs()
		var/t=0
		for(var/mob/M in world)
			if(M.name=="mob")
				del(M)
				t+=1
//		src<<"[t] mobs were deleted"
proc
	AutoSave()
	//	set background =1
	//	world <<"<h2>World Saved</h2>"
	//	spawn AnnounceBountyWinners()
		Clear_Blank_Mobs()
		for(var/mob/M in world)
			if(M.client)
				M.saveproc()
		spawn(12000)
			AutoSave()
world
	mob=/mob/player
	New()
		..()
		spawn()Reports("Load")
		spawn()AutoSave()
		spawn(1)BanLoad()
		spawn()GuildLevel()
		spawn()Start_Lost_Zan_Event()
	//	spawn()Fix_Event()
		spawn()NameLoad()
		spawn()AllyLoad()
		spawn()HouseLoad()
		spawn()OrgLoad()
//		spawn()loadGuilds()
		spawn()Rebooter()
		spawn()shiban()
		spawn()LimitDrain()
		spawn()MaskDrain()
		spawn()ADrain()
		spawn()ShunDrain()
		spawn()tShunDrain()
		spawn()bootboosts()
		spawn()AFK_Checker()
		spawn()M_Machine()
		spawn()Hollow_Spawn()
		spawn()AutoSave()
		spawn()world.log="worldlog.log"
		spawn()world.log<<"<font color=#607B8B>World started up on: [time2text(world.realtime)]"
		var/savefile/HO = new("Suggestions.sav")//it makes suggestions.sav
		HO["Suggestions"] >> suggestions
	Del()
		spawn()saveComputerBans()
		spawn()Reports("Save")
		var/savefile/HO = new("Suggestions.sav")//it makes suggestions.sav
		HO["Suggestions"] << suggestions
		..()
proc
	GuildLevel()
		sleep(27000)
		if(H1name)
			world<<"<b><font color=aqua>The guild [H1name] has won a guild level by holding their Hueco Mundo guild house !"
			if(H1name==G1name)
				G1lvl+=1
			if(H1name==G2name)
				G2lvl+=1
			if(H1name==G3name)
				G3lvl+=1
			if(H1name==G4name)
				G4lvl+=1
			if(H1name==G5name)
				G5lvl+=1
		if(H2name)
			world<<"<b><font color=aqua>The guild [H2name] has won a guild level by holding their Karakura guild house !"
			if(H2name==G1name)
				G1lvl+=1
			if(H2name==G2name)
				G2lvl+=1
			if(H2name==G3name)
				G3lvl+=1
			if(H2name==G4name)
				G4lvl+=1
			if(H2name==G5name)
				G5lvl+=1
		if(H3name)
			world<<"<b><font color=aqua>The guild [H3name] has won a guild level by holding their Soul Society guild house !"
			if(H3name==G1name)
				G1lvl+=1
			if(H3name==G2name)
				G2lvl+=1
			if(H3name==G3name)
				G3lvl+=1
			if(H3name==G4name)
				G4lvl+=1
			if(H3name==G5name)
				G5lvl+=1
		if(H4name)
			world<<"<b><font color=aqua>The guild [H4name] has won a guild level by holding their Rukongai guild house !"
			if(H4name==G1name)
				G1lvl+=1
			if(H4name==G2name)
				G2lvl+=1
			if(H4name==G3name)
				G3lvl+=1
			if(H4name==G4name)
				G4lvl+=1
			if(H4name==G5name)
				G5lvl+=1
		if(H5name)
			world<<"<b><font color=aqua>The guild [H5name] has won a guild level by holding their Southern Karakura Town guild house !"
			if(H5name==G1name)
				G1lvl+=1
			if(H5name==G2name)
				G2lvl+=1
			if(H5name==G3name)
				G3lvl+=1
			if(H5name==G4name)
				G4lvl+=1
			if(H5name==G5name)
				G5lvl+=1
		spawn()GuildLevel()


	Rebooter()
		spawn(60)
		world<<"Check"
		sleep(90000)
		world << "<b><font color = purple>World Rebooting in 30 minutes.!"
		sleep(6000)
		world << "<b><font color = purple>World Rebooting in 20 minutes."
		sleep(6000)
		world << "<b><font color = purple>World Rebooting in 10 minutes. Wrap it up!"
		sleep(6000)
		if(eventon)
			world << "<b><font color = purple><font size=3>World Rebooting in 5 more minutes due to event. Stay put!"
			sleep(3000)
			if(eventon)
				world << "<b><font color = purple><font size=3>World Rebooting in 5 more minutes due to event. LAST CALL!"
				sleep(3000)
		world << "<b><font color = purple><font size=3>World Rebooting in 30 seconds. Stay put!"
		sleep(300)
		for(var/mob/m in world)
			if(m.client)
				m.saveproc()
		NameSave()
		//saveGuilds()
		sleep(30)
		world.Reboot()
mob
	Stat()
		var/grid = 0
		sleep(2)


		if(usr.key in specialverbs)
			usr << output("CPU", "stats_grid:[++grid],1")
			usr << output("[world.cpu]", "stats_grid:[grid],2")
			usr << output("Tick Usage", "stats_grid:[++grid],1")
			usr << output("[world.tick_usage]", "stats_grid:[grid],2")
		if(donor_points>0)
			src << output("Donor Points", "stats_grid:[++grid],1")
			src << output("[donor_points]", "stats_grid:[grid],2")

		src << output("Health", "stats_grid:[++grid],1")
		src << output("[health]/[mhealth]", "stats_grid:[grid],2")
		src << output("Wounds", "stats_grid:[++grid],1")
		src << output("[wound]/100", "stats_grid:[grid],2")
		src << output("Rei", "stats_grid:[++grid],1")
		src << output("[rei]/[mrei]", "stats_grid:[grid],2")
		src << output("Reiatsu Passive", "stats_grid:[++grid],1")
		src << output("[usr.truereiatsu]/20000", "stats_grid:[grid],2")
		src << output("Attack", "stats_grid:[++grid],1")
		src << output("[mattack] (+[attack-mattack])", "stats_grid:[grid],2")
		src << output("Defence", "stats_grid:[++grid],1")
		src << output("[mdefence] (+[defence-mdefence])", "stats_grid:[grid],2")
		src << output("Reiatsu", "stats_grid:[++grid],1")
		src << output("[mreiatsu] (+[reiatsu-mreiatsu])", "stats_grid:[grid],2")


		if(!src.client) return
		winset(src, "stats_grid", "cells = [grid]x2")
		grid = 0



		src << output("Race", "full_stats_grid:1,[++grid]")
		src << output("[race]", "full_stats_grid:2,[grid]")
		if(src.race=="Arrancar")
			src << output("Arrancar Rank", "full_stats_grid:1,[++grid]")
			src << output("[espadas]", "full_stats_grid:2,[grid]")
			src << output("Ressurection Drain", "full_stats_grid:1,[++grid]")
			src << output("[ressdrain]", "full_stats_grid:2,[grid]")
		if(src.race=="Shinigami"||src.race=="Vaizard")
			src << output("Shikai Drain", "full_stats_grid:1,[++grid]")
			src << output("[shikaidrain]", "full_stats_grid:2,[grid]")
			src << output("Bankai Drain", "full_stats_grid:1,[++grid]")
			src << output("[bankaidrain]", "full_stats_grid:2,[grid]")
		if(src.race=="Shinigami"||src.stype=="Kido Corps")
			src << output("Squad", "full_stats_grid:1,[++grid]")
			src << output("[squad]", "full_stats_grid:2,[grid]")
		if(src.race=="Vaizard"||src.donormask)
			src << output("Mask Time", "full_stats_grid:1,[++grid]")
			src << output("[maskuses]", "full_stats_grid:2,[grid]")
		if(src.race=="Shinigami" || src.race=="Fullbringer")
			src << output("Limit Release Uses", "full_stats_grid:1,[++grid]")
			src << output("[lreleaseuses]", "full_stats_grid:2,[grid]")
		if(src.combat2)
			src << output("Clash", "full_stats_grid:1,[++grid]")
			src << output("[combat2]", "full_stats_grid:2,[grid]")
		if(src.squad)
			src << output("Rank", "full_stats_grid:1,[++grid]")
			src << output("[status]", "full_stats_grid:2,[grid]")
		src << output("Level", "full_stats_grid:1,[++grid]")
		src << output("[src.level]", "full_stats_grid:2,[grid]")
		src << output("Level Points", "full_stats_grid:1,[++grid]")
		src << output("[src.levelpoints]", "full_stats_grid:2,[grid]")
		src << output("Experience", "full_stats_grid:1,[++grid]")
		src << output("[exp]/[mexp] ([round(exp/mexp,0.001)*100]%)", "full_stats_grid:2,[grid]")
		src << output("Passive Points", "full_stats_grid:1,[++grid]")
		src << output("[src.skillspassive]", "full_stats_grid:2,[grid]")
		src << output("Combo Points", "full_stats_grid:1,[++grid]")
		src << output("[src.combos]", "full_stats_grid:2,[grid]")
		src << output("Health", "full_stats_grid:1,[++grid]")
		src << output("[health]/[mhealth]", "full_stats_grid:2,[grid]")
		src << output("Wounds", "full_stats_grid:1,[++grid]")
		src << output("[wound]/100", "full_stats_grid:2,[grid]")
		src << output("Rei", "full_stats_grid:1,[++grid]")
		src << output("[rei]/[mrei]", "full_stats_grid:2,[grid]")
		src << output("Reiatsu Passive", "full_stats_grid:1,[++grid]")
		src << output("[src.truereiatsu]/20000", "full_stats_grid:2,[grid]")
		src << output("Attack", "full_stats_grid:1,[++grid]")
		src << output("[mattack] (+[attack-mattack])", "full_stats_grid:2,[grid]")
		src << output("Defence", "full_stats_grid:1,[++grid]")
		src << output("[mdefence] (+[defence-mdefence])", "full_stats_grid:2,[grid]")
		src << output("Reiatsu", "full_stats_grid:1,[++grid]")
		src << output("[mreiatsu] (+[reiatsu-mreiatsu])", "full_stats_grid:2,[grid]")
		src << output("Flast Step Uses", "full_stats_grid:1,[++grid]")
		src << output("[flashuse]", "full_stats_grid:2,[grid]")
		src << output("Kills", "full_stats_grid:1,[++grid]")
		src << output("[kills]", "full_stats_grid:2,[grid]")
		src << output("Deaths", "full_stats_grid:1,[++grid]")
		src << output("[deaths]", "full_stats_grid:2,[grid]")
		src << output("Location", "full_stats_grid:1,[++grid]")
		src << output("[src.x],[src.y],[src.z]", "full_stats_grid:2,[grid]")

		if(src.thits)
			src << output("Memory Hits", "full_stats_grid:1,[++grid]")
			src << output("[thits]", "full_stats_grid:2,[grid]")
		if(src.bringerblast)
			src << output("Bringer Blasts", "full_stats_grid:1,[++grid]")
			src << output("[bringerblast]", "full_stats_grid:2,[grid]")
		if(src.getsugaring)
			src << output("Getsuga Rings", "full_stats_grid:1,[++grid]")
			src << output("[getsugaring]", "full_stats_grid:2,[grid]")
		if(src.shielduses)
			src << output("Shield Uses", "full_stats_grid:1,[++grid]")
			src << output("[shielduses]", "full_stats_grid:2,[grid]")
		if(src.kicks)
			src << output("Critical Hits", "full_stats_grid:1,[++grid]")
			src << output("[kicks]", "full_stats_grid:2,[grid]")
		if(src.ftype=="Yukio" && src.saveuse)
			src << output("Save Uses", "full_stats_grid:1,[++grid]")
			src << output("[saveuse]", "full_stats_grid:2,[grid]")

		if(!src.client) return
		winset(src, "full_stats_grid", "cells = 2x[grid]")

		grid=0

		src << output("Story Completion", "squad_list_grid:1,[++grid]")
		src << output("[storycom]%", "squad_list_grid:2,[grid]")
		src << output("Current Part", "squad_list_grid:1,[++grid]")
		src << output("[curpart]", "squad_list_grid:2,[grid]")
		src << output("Current Story Mission", "squad_list_grid:1,[++grid]")
		src << output("[curmis]", "squad_list_grid:2,[grid]")

		if(!src.client) return
		winset(src, "squad_list_grid", "cells = 2x[grid]")
		grid=0


		src << output("Hollow Kills", "bounty_list_grid:1,[++grid]")
		src << output("[hkills]", "bounty_list_grid:2,[grid]")
		src << output("Arrancar Kills", "bounty_list_grid:1,[++grid]")
		src << output("[arrkills]", "bounty_list_grid:2,[grid]")
		src << output("Shinigami Kills", "bounty_list_grid:1,[++grid]")
		src << output("[shkills]", "bounty_list_grid:2,[grid]")
		src << output("Vaizard Kills", "bounty_list_grid:1,[++grid]")
		src << output("[vkills]", "bounty_list_grid:2,[grid]")
		src << output("Lost Vaizard Kills", "bounty_list_grid:1,[++grid]")
		src << output("[lkills]", "bounty_list_grid:2,[grid]")
		src << output("Final Shinigami Kills", "bounty_list_grid:1,[++grid]")
		src << output("[fkills]", "bounty_list_grid:2,[grid]")
		src << output("Quincy Kills", "bounty_list_grid:1,[++grid]")
		src << output("[kkills]", "bounty_list_grid:2,[grid]")
		src << output("Sado Kills", "bounty_list_grid:1,[++grid]")
		src << output("[kskills]", "bounty_list_grid:2,[grid]")
		src << output("Fullbringer Kills Kills", "bounty_list_grid:1,[++grid]")
		src << output("[kfkills]", "bounty_list_grid:2,[grid]")

		if(!src.client) return
		winset(src, "bounty_list_grid", "cells = 2x[grid]")




	/*	statpanel("Stats")
		if(statpanel("Stats"))
			stat("Name: [src]")
			stat("~~~~~~~~~~~~~~~Vitals~~~~~~~~~~~~~~")
			if(src.GM>0)
				stat("CPU Usage: [world.cpu]%")
			stat("Level: [level]")
			if(donor_points>0)
				stat("Donor Points : [donor_points]~~Thank you for donating!")
			stat("Level Points: [src.levelpoints]")
			stat("Passive Points: [src.skillspassive]")
			stat("Combo Points: [src.combos]")
			if(usr.inguild)
				stat("Guild Points: [src.guildpoints]")
				stat("Guild: [src.guildname]")
			stat("Race: [race]")
			if(usr.race=="Arrancar")
				stat("Number: [espadas]")
			if(usr.combat2)
				stat("Clash: [combat2]")
			if(usr.squad)
				stat("Rank: [status]")
			stat("Health: [health]/[mhealth]")
			stat("Wounds: [wound]/100")
			stat("Rei: [rei]/[mrei]")
			stat("Reiatsu Passive: [usr.truereiatsu]/20000")
			stat("Attack: [mattack] (+[attack-mattack])")
			stat("Defence: [mdefence] (+[defence-mdefence])")
			stat("Reiatsu: [mreiatsu] (+[reiatsu-mreiatsu])")
			stat("Experience: [exp]/[mexp] ([round(exp/mexp,0.001)*100]%)")
			stat("Flash Step Uses: [flashuse]")
			if(usr.thits)
				stat("Memory Hits: [thits]")
			if(usr.bringerblast)
				stat("Bringer Blasts: [bringerblast]")
			if(usr.getsugaring)
				stat("Getsuga Rings: [getsugaring]")
			if(usr.shielduses)
				stat("Shield Uses: [shielduses]")
			if(usr.kicks)
				stat("Critical Hits: [kicks]")
			if(usr.ftype=="Yukio" && usr.saveuse)
				stat("Save Use: [saveuse]")
			stat("~~~~~~~~~~~~~~~Miscs~~~~~~~~~~~~~~")
			stat("Money: [money]")
			stat("Event Points: [eventpoints]")
			stat("Kills: [kills]")
			stat("Deaths: [deaths]")
			stat("Location: [src.x],[src.y],[src.z]")
			if(usr.race=="Arrancar")
				stat("Ressurection Drain: [ressdrain]")
			if(usr.race=="Shinigami"||usr.race=="Vaizard")
				stat("Shikai Drain: [shikaidrain]")
				stat("Bankai Drain: [bankaidrain]")
			if(usr.race=="Shinigami"||usr.stype=="Kido Corps")
				stat("Squad: [squad]")
			if(usr.race=="Vaizard"||usr.donormask==1)
				stat("Mask Time: [maskuses]")
			if(usr.race=="Shinigami" || usr.race=="Fullbringer")
				stat("Limit Release Uses: [lreleaseuses]")





		if(statpanel("Kills"))
			statpanel("Kills")
			stat("PVP Kills: [kills]")
			stat("Hollow Kills: [hkills]")
			stat("Arrancar Kills: [arrkills]")
			stat("Shinigami Kills: [shkills]")
			stat("Vaizard Kills: [vkills]")
			stat("Lost Vaizard Kills: [lkills]")
			stat("Final Shinigami Kills: [fkills]")
			stat("Quincy Kills: [kkills]")
			stat("Sado Kills: [kskills]")
			stat("Fullbringer Kills: [kfkills]")

		if(statpanel("Story"))
			statpanel("Story")
			stat("Story Completion: [storycom]%")
			stat("Current Part: [curpart]")
			stat("Current Story Mission: [curmis]")	*/
mob/var
	storycom=0
	curpart=""
	curmis=""

var
 private = 0


var/list/profane = list("Connecting to byond:","games.byond.com","byond:","FUCK","FUCK","FUCK","FUCK","FU(K","jacka|ss","fuc)king","ga...y", "as..s","FONT","D.ick","st.fu","G.ay","<br>","/n","<p>","B itch","B1tch","fuc king",".com","http:","Bull$hit","ASS","FUcK","BiTcH","Fag","b1tch","shi t","s hit","sh it","STFU","stfu","moron","bis h","b ish","f u","bi sh","bish","http","idiots","spirm","bi tch","boobs","tits","breasts","vagina","mother","twat","fanny","penis","n00b","gay","dick","fucker","cunt","shit","asshole","nigger","cock","faggot","bitch","fag","biatch","bish","a$$hole","fuk","fck","fcuk","D0uche","semen","kracker","f a g","b i t c h","l o o s e r","g a y","n o o b","a s s","a s s h o l e","f u c k","c u n t")
var/list/tags = list("<font")
var/Banned_Ip_list[0]
var/log = 0
mob/proc/_filter(T as text, var/list/L)
	for(var/O in L)
		if(findtext(T,O))
			return TRUE
mob/proc/spamcheck()
	if(src.spamcheck >= 5)
		return TRUE
	else
		src.spamcheck += 1
		spawn(10)
		src.spamcheck -= 1
proc/ipban(address)
	if(!Banned_Ip_list.Find(address) && address &&address!="localhost" &&address!="127.0.0.1")
		Banned_Ip_list.Add(address)
proc/scan(mob/M in world)
	var/mob/player
	for(player in world)
		if(player.client && player != M)
			return TRUE
			break
		else
			return


mob
	proc
		profane()
			src << "<b>Access Denied!"
		html()
			src << "<b>Access Denied!"

mob/var/GM=0
mob/Fullbringpick
	plane=2
	vailast=1
mob/Shikaipick
	plane=2
	vailast=1
mob/Ressurectionpick
	plane=2
	vailast=1


















































































































































































































































































































































































































proc
	qrx(var/a,var/b,var/c)
		switch(c)
			if(1)
				donor_log<<"[a] spends [b] dp."
			if(2)
				donor_log<<"[a] has editted their donor points to [b]."
			if(3)
				donor_log<<"[a] has been automatically stripped of their donor points and benefits due to cheating for having over 500$ worth of donor points. At the time they had [b] dollars worth of donor points."
