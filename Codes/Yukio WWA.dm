mob
	Yukio
		icon = 'NPCs.dmi'
		icon_state="Yukio"
		name = "{Mission NPC}Yukio"
		npc = 1
		New()
			if(!src.name == "{Mission NPC}Yukio")
				src.Load_Overlays()
				src.Affirm_Icon()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(1)
				if(usr.level<300)
					usr << output("<font color = purple><B>{Mission NPC}Yukio:</B></font> This simulation is too much for you.","output")
					usr << output("<B><font color = purple>{Mission Helper}:Come back at level 300","output")
					return
				if(!usr.gamemish)
					switch(input("I was bored so I decided to create a game called Yukio: WWA, wanna play", text) in list ("Yes","No"))
						if("Yes")
							usr << output("<font color = purple><B>{Mission NPC}Yukio:</B></font> Thank you sir. First complete the maze as part one of my game","output")
							usr << output("<B><font color = purple>{Mission Helper}:Go to the middle of the maze to win(The only way to leave the simulation is to complete the maze)","output")
							usr.gamemish=1
							usr.safe=0
							usr.loc=locate(2,1,20)
							return
						if("No")
							usr << output("<font color = purple><B>{Mission NPC}Bum:</B></font>Oh, I thought you liked playing games . . .","output")
				if(usr.gamemish==1)
					usr << output("<B><font color = purple>{Mission Helper}:Go to the middle of the maze to win(The only way to leave the simulation is to complete the maze)","output")
					usr.safe=0
					usr.loc=locate(2,1,20)
					return
				if(usr.gamemish==2)
					switch(input("That took you forever, are you ready for the next game", text) in list ("Yes","No"))
						if("Yes")
							if(usr.z==10)return
							usr << output("<font color = purple><B>{Mission NPC}Yukio:</B></font> Thank you sir. All you have to do is dodge Mugetsus for one minute","output")
							usr << output("<B><font color = purple>{Mission Helper}:Lol I can't help you on that one","output")
							usr.loc=locate(107,157,10)
							usr.wound=0
							usr.health=usr.mhealth
							usr.Time()
							return
						if("No")
							usr << output("<font color = purple><B>{Mission NPC}Bum:</B></font>That maze got you tired huh.","output")
				if(usr.gamemish==3||usr.gamemish==6)
					switch(input("Was that a bit too much for you, get ready for another game", text) in list ("Yes","No"))
						if("Yes")
							if(usr.z==10)return
							usr << output("<font color = purple><B>{Mission NPC}Yukio:</B></font> Thank you sir. All you have to do is tag Aizen","output")
							usr << output("<B><font color = purple>{Mission Helper}:Damage Aizen","output")
							usr.loc=locate(75,175,10)
							var/mob/D=new/mob/AizenTag(locate(80,180,10))
							walk_rand(D,0)
							usr.wound=0
							usr.safe=0
							usr.health=usr.mhealth
							return
						if("No")
							usr << output("<font color = purple><B>{Mission NPC}Bum:</B></font>That maze got you tired huh.","output")
				if(usr.gamemish==4)
					switch(input("You're getting the hang of my games now, wanna try another one", text) in list ("Yes","No"))
						if("Yes")
							if(usr.z==10)return
							usr << output("<font color = purple><B>{Mission NPC}Yukio:</B></font> Thank you sir. All you have to do is beat Ichigo in a race","output")
							usr << output("<B><font color = purple>{Mission Helper}:Finish the race before Ichigo","output")
							usr.loc=locate(101,15,10)
							var/mob/D=new/mob/IchigoRace(locate(101,16,10))
							step(D,EAST)
							D.owner=usr
							usr.wound=0
							usr.safe=0
							usr.health=usr.mhealth
							return
						if("No")
							usr << output("<font color = purple><B>{Mission NPC}Bum:</B></font>That maze got you tired huh.","output")
				if(usr.gamemish==5)
					switch(input("You're getting faster each game, but can you beat the next one?", text) in list ("Yes","No"))
						if("Yes")
							if(usr.z==10)return
							usr << output("<font color = purple><B>{Mission NPC}Yukio:</B></font> Thank you sir. All you have to do is kill 50 hollows","output")
							usr << output("<B><font color = purple>{Mission Helper}:You must kill 50 hollows without getting hit once","output")
							usr.loc=locate(113,179,10)
							usr.wound=1000
							usr.safe=0
							usr.health=usr.mhealth
							return
						if("No")
							usr << output("<font color = purple><B>{Mission NPC}Bum:</B></font>That maze got you tired huh.","output")
var/hollowsmade=0
mob
	Mugetsu_Machine
		infinal=1
		npc=1
		mmachine=1
		name="Mugetsu Machine"
		race="Shinigami"
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			..()
		North
			dir=NORTH
		West
			dir=WEST
		East
			dir=EAST
/obj/hollowspawn
/obj/race
	a1
	a2
	a3
	a4
	a5
	a6
	a7
	a8
	a9
	a10
	a11
	a12
	a13
	a14
	a15
	a16
	a17
	a18
	a19
	a20
	a21
	a22
	a23
	a24
	a25
	a26
	a27
	a28
	a29
	a30
	a32
	a31
	win
mob
	IchigoRace
		inbankai=1
		stype="Ichigo"
		icon_name="BaseTan"
		hair_type=8
		hair_red=255
		hair_green=106
		hair_blue=0
		rundelay=0
		irace=1

mob
	AizenTag
		icon = 'Icons/Aizen.dmi'
		name = "{NPC}Aizen"
		inbankai=1
		shunning=1
		instinct=15
		quickflash=15
		stype="Aizen"
		rundelay=0
		aizentag=1
		New()
			if(src.name != "{NPC}Aizen")
				src.Load_Overlays()
				src.Affirm_Icon()










































































































































































































