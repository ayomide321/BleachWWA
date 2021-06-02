obj
	Bump(A)
		if(ismob(A))
			var/mob/M = A
			if(M.soccer)
				M.soccer=0
				M.Load_Overlays()
				var/obj/soccerball/s=new/obj/soccerball(M.loc)
				step(s,src.dir)
			..()
turf/soccer
	icon='Icons/soccer.dmi'
	bottom
		icon_state="bottom"
	top
		icon_state="top"
	left
		icon_state="left"
	right
		icon_state="right"
	circle
		icon='Icons/soccercircle.dmi'
	leftgoal
		icon='Icons/soccergoal.dmi'
		icon_state="left"
	rightgoal
		icon='Icons/soccergoal.dmi'
		icon_state="right"
obj/soccer
	goal
	goal1
	goal2
	goal3
	goal4
	goal5
	goal6
	goalnpc
		density=1
	goalplayer
		density=1
obj/soccerball
	icon='Icons/soccerball.dmi'
	density=1
	layer=17
	Bump(O)
		if(istype(O,/obj/soccer/goalnpc))
			for(var/mob/m in world)
				if(m.z==src.z)
					m << "The Cheap team got a point!"
					m.soccergoal=1
					m.wound=50
					spawn(21)
						m << "GOOOOOOOO!!!!!"
						m.soccergoal=0
					if(!m.client)
						m.loc=m.oldspot
					if(m.client)
						m.loc=locate(57,33,1)
			spawn(2)
			for(var/obj/soccerball/s in world)
				del s
				var/obj/soccerball/sa=new/obj/soccerball(src.loc)
				sa.loc=locate(57,33,1)
				del s
		if(istype(O,/obj/soccer/goalplayer))
			for(var/mob/m in world)
				if(m.z==src.z)
					m << "The Hero team got a point!"
					m.soccergoal=1
					spawn(21)
					m << "GOOOOOOOO!!!!!"
					spawn(21)
					m.soccergoal=0
					if(!m.client)
						m.loc=m.oldspot
					if(m.client)
						m.loc=locate(58,35,1)
			for(var/obj/soccerball/s in world)
				s.loc=locate(58,35,1)
area/ob
	density=1
mob
	Bump(A)
		if(istype(A,/obj/soccerball))
			var/obj/soccerball/T = A
			src.soccer=1
			src.Load_Overlays()
			del T
		..()
var
	psoccergoals=0
	nsoccergoals=0
mob/Soccerplayers
	New()
		..()
		sserp
		if(src.soccergoal)
			src.frozen=1
			sleep(21)
			src.frozen=0
			src.soccergoal=0
		src.SnatchBall()
		src.GoToGoal()
		for(var/obj/soccerball/m in oview(6,src))
			walk_to(src,m,0,1)
			sleep(4)
			goto sserp
		sleep(2)
		goto sserp
/obj/soccer
	npcspawn
	playerspawn
mob/Soccerplayers
	Shinigamis
		name = "Soccer Player"
		enemy = 1
		rundelay = 0
		level=300
		mhealth = 9999999999999999999999999999999999999999999999999999999999999999999999
		health = 9999999999999999999999999999999999999999999999999999999999999999999999
		rei = 9999999999999999999999999999999999999999999999999999999999999999999999
		missionchar=0
		killable=1
		wound=51
		mattack = 1
		mdefence = 1
		race="Shinigami"
		reiatsu = 1
		mrei = 99999999999999999999999999999999999999999999999999999999999999999999999999999
		spawntime = 500
		healthwas = 99999999999999999999999999999999999999999999999999999999999999999999999999
		expgain = 0
		hasashikai=1
		hasabankai=1
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.swordon=1
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/shinigami/s1
			src.StypeGen()
			..()
	Arrancars
		name = "Soccer Player"
		enemy = 1
		rundelay = 0
		level=300
		mhealth = 9999999999999999999999999999999999999999999999999999999999999999999999
		health = 9999999999999999999999999999999999999999999999999999999999999999999999
		rei = 9999999999999999999999999999999999999999999999999999999999999999999999
		missionchar=0
		killable=1
		wound=51
		mattack = 1
		mdefence = 1
		race="Arrancar"
		reiatsu = 1
		mrei = 99999999999999999999999999999999999999999999999999999999999999999999999999999
		spawntime = 500
		healthwas = 99999999999999999999999999999999999999999999999999999999999999999999999999
		expgain = 0
		New()
			src.oldspot = src.loc
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.ressurectiontype=pick(/*"Tijereta","Volcanica","Dragon",*/"Pantera"/*"Del Toro","Ulq"*/,"Shooter","Scientist","Skeleton")
			src.HairGen()
			src.arrancarmask=rand(1,14)
			src.overshirt=pick(/obj/cloak/espada/e1,/obj/cloak/espada/e2)
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()