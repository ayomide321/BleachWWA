

mob/var
	tmp/inegcontent = 0
	tmp/inegcontent2 = 0
	egcaps = 0
	egcaps2 = 0
	egcaps3 = 0
	egcaps4 = 0
	defeatedstage1 = 0
	defeatedstage2 = 0

mob
 EndGame_NPC
		icon = 'NPCs.dmi'
		name = "{NPC}Endgame Challenger"
		icon_state = "Shinigami"
		npc = 1
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			..()
			src.inshikai=1
			src.HairGen()
			src.overshirt=/obj/overshirt/shinigami/s1
			src.StypeGen()
			src.Load_Overlays()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(usr.client)
					switch(input(usr,"Would you like to commence your journey to endgame leveling", text) in list ("Yes","No"))
						if("Yes")
							world << "<b><font size=3><font color=aqua>[usr] is starting the first stage of the endgame!</b></font>"
							usr.inegcontent = 1
							usr.loc = locate_tag("firststage_eg")
							alert(usr,"In this stage you will start off by testing your strength against a captain\
							 that volunteered to participate in this minigame of mine. Good luck!")

						else usr << alert(usr,"I'm here whenever you're interested")

proc
	ContinueEndgame()
		if(usr.defeatedstage1)
			alert(usr,"Congratulations! You defeated the first stage of the game and now have the option to move on.....will you do it?")
			switch(input(usr,"Are ypu moving onto the next stage?") in list ("Yes","No"))
				if("Yes")
					usr.inegcontent2 = 1
					usr.HealPlayer()
					usr.loc = locate_tag("secondstage_eg")
					world << "<b><font size=3><font color=aqua>[usr] is starting the second stage of the endgame!</b></font>"
				else usr.loc = locate(46,182,2)


		if(usr.defeatedstage2)
			alert(usr,"Congratulations! You defeated the second stage of the game and now have the option to move on.....will you do it?")




mob/Endgame_Caps
//	egcaps = 1
	enemy = 1
	agrange=15
	level=1000
	mhealth = 900000
	attack = 30000
	health=900000
	mattack = 30000
	mdefence = 30000
	mreiatsu = 30000
	defence = 30000
	reiatsu = 30000
	hostile=1
	killable=1
	delay=0
	healthwas = 900000
	mrei = 20000
	rei=20000
	instinct=5
	quickflash=5
	berserk=5
	regenrate=90
	criticalhits=5
	headpassive=2
	bodypassive=2
	armpassive=2
	legpassive=2
	race="Shinigami"
	spawntime = 800
	expgain=700000
	swordon=1
	hasabankai=1
	hasashikai=1
	legit=1
	legit2=1
	New()
		src.icon_name=pick("Base","BaseTan","BaseBlack")
		src.HairGen()
		src.oldspot = null
		src.cloak=/obj/cloak/captain/c1
		src.weapon=/obj/weapon/sword
		src.overshirt=/obj/overshirt/shinigami/s1
		spawn(1)
			src.activated=1
			src.AI()
		..()
	C1
		name="{NPC}Yammamoto"
		stype="Yammamoto"
		icon_name="Base"
		Tnpccaptain=1
		reiatsu = 60000
		mreiatsu = 60000
		egcaps = 1
		New()
			hair_type=0
			..()

	C2
		name="{NPC}Soi Fon"
		stype="Stinger"
		icon_name="BaseTan"
		Tnpccaptain=2
		egcaps2 = 1
		New()
			hair_type=/obj/hair/h3/black
			..()
			src.cloak=0
	C3
		name="{NPC}Gin"
		stype="Ichimaru"
		icon_name="BaseTan"
		Tnpccaptain=3
		egcaps3 = 1
		New()
			hair_type=/obj/hair/h1/black
			..()
	C4
		name="{NPC}Unohana"
		stype="Unohana"
		icon_name="Base"
		Tnpccaptain=4
		egcaps4 = 1
		New()
			hair_type=/obj/hair/h4/black
			..()
	C5
		name="{NPC}Aizen"
		stype="Aizen"
		icon_name="Base"
		Tnpccaptain=5
		New()
			hair_type=/obj/hair/h2/black
			..()
	C6
		name="{NPC}Byakuya"
		stype="Byakuya"
		icon_name="Base"
		Tnpccaptain=6
		New()
			hair_type=/obj/hair/h4/black
			special=/obj/special/scarf
			..()