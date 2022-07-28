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
		sleep(2)
		statpanel("Stats")
		if(statpanel("Stats"))
			stat("Name: [src]")
			stat("~~~~~~~~~~~~~~~Vitals~~~~~~~~~~~~~~")
			if(src.GM>0)
				stat("CPU Usage: [world.cpu]%")
			if(src.GM>3)
				stat("Rank Test Active: [currentRankTest]")
				stat("Person taking Test: [currentPlayerTest]")
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
			stat("Yammamoto Boss kills: [yamabosskills]")
			stat("Crown Prince kills: [crownprincekills]")
			stat("Lorelei kills: [loreleikills]")
			stat("Samurai King kills: [newkomabosskills]")
			stat("Gate Creator kills: [gatecreatorkills]")
			stat("Brazo kills: [demonbosskills]")
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
			stat("Current Story Mission: [curmis]")
		if(statpanel("Collectibles"))
			statpanel("Collectibles")
			completionPercentage = ((min(relapseAutographs,relapseAutographReq)/relapseAutographReq)*15) + ((min(hellArmors,hellArmorReq)/hellArmorReq)*15) + ((min(karakuraHeroKills,karakuraHeroKills)/karukaHeroReq)*15) + ((min(currentPlayerEssence,playerEssenceReq)/playerEssenceReq)*15) + ((min(eventsWon,eventsWonReq)/eventsWonReq)*15) + ((min(timesRebirthed,timesRebirthedReq)/timesRebirthedReq)*25)
			completionPercentage = min(100, completionPercentage)
			completionPercentage = (completionPercentage * 0.95) + ((min(fuseCount, fuseCountReq)/fuseCountReq)*5)
			if(completionPercentage == 100&&!canBeGODOFBWWA)
				canBeGODOFBWWA=1
				src<<output("<b><font color=yellow>Congratulations, you have earned the right to take the test to become the God of BWWA!","output")
			if(completionPercentage > 75)
				hiddenQuest = "Fuse Count"
			stat("Collectibles Completion: [completionPercentage]%")
			stat("~~~~~~~~~~~~~~~Collectibles~~~~~~~~~~~~~~")
			if(!canBeGODOFBWWA)
				stat("Relapse Autographs: [relapseAutographs]/[relapseAutographReq]")
				stat("Hell Armors: [hellArmors]/[hellArmorReq]")
				stat("Karakura Town Hero Kills: [karakuraHeroKills]/[karukaHeroReq]")
				stat("Essence of Player: [currentPlayerEssence]/[playerEssenceReq]")
				stat("Events Won: [eventsWon]/[eventsWonReq]")
				stat("Rebirth Count: [timesRebirthed]/[timesRebirthedReq]")
				stat("[hiddenQuest]: [fuseCount]/[fuseCountReq]")
			if(canBeGODOFBWWA&&!GODOFBWWA)
				stat("Talk to the Rank Test NPC in Cross Roads to take the challenge to become the God of BWWA")
			if(GODOFBWWA)
				stat("Congratulations, enjoy your position as God")


	/*	if(statpanel("Skills"))
			statpanel("Skills")
		//	var/grid_item = 0
			for(var/obj/skillcard/X in src.contents)
				stat("Skills: [X]")	*/
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
