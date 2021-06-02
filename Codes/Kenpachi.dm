mob
	realGinjo
		name = "{NPC}Ginjo"
		enemy = 1
		mhealth=7000
		rundelay = 0
		level=150
		race="Fullbringer"
		ginjo=1
		killable=1
		hostile=1
		mreiatsu=1000
		mrei = 6000
		spawntime = 500
		expgain = 20000
		mattack = 500
		mdefence = 10
		healthwas = 10000
		legit=1
		New()
			src.icon_name="Base"
			src.hair_type=/obj/hair/h2/black
			src.rei=src.mrei
			src.health=src.mhealth
			src.attack=src.mattack
			src.defence=src.mdefence
			src.swordon=1
			src.ftype="Ginjo"
			src.swordname="Bring it On!"
			src.weapon=/obj/weapon/fullbring/necklace
			src.oldspot = src.loc
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
			spawn(5)
			src.Fullbring()
	realTsukishima
		name = "{NPC}Tsukishima"
		enemy = 1
		mhealth=30000
		rundelay = 0
		level=300
		race="Fullbringer"
		tsukishima=1
		killable=1
		hostile=1
		mreiatsu=1000
		mrei = 10000
		spawntime = 500
		expgain = 40000
		mattack = 2050
		mdefence = 2050
		healthwas = 30000
		legit=1
		New()
			src.icon_name="Base"
			src.hair_type=/obj/hair/h2/black
			src.rei=src.mrei
			src.health=src.mhealth
			src.attack=src.mattack
			src.defence=src.mdefence
			src.swordon=1
			src.ftype="Tsukishima"
			src.swordname="Book of End!"
			src.weapon=/obj/weapon/fullbring/bookmark
			src.oldspot = src.loc
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
			spawn(5)
			src.Fullbring()
mob
	Kenpachi
		name = "{NPC}Kenpachi"
		enemy = 1
		mhealth=4000
		rundelay = 0
		level=150
		kenpachi=1
		killable=1
		hostile=1
		mreiatsu=1050
		mrei = 1000
		spawntime = 500
		expgain = 100000
		mattack = 1000
		mdefence = 999999999999999999999999999999999999999
		healthwas = 10000
		legit=1
		New()
			src.icon_name="Base"
			src.hair_type=/obj/hair/h5/black
			src.rei=src.mrei
			src.health=src.mhealth
			src.attack=src.mattack
			src.defence=src.mdefence
			src.swordon=1
			src.stype="Zaraki"
			src.swordcall="Let's Finish this"
			src.swordname="with the next hit!"
			src.inshikai=1
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
			spawn(2)
				var/sound/dd = sound('Sounds/Kenpachi/WAVE_VO_KENP_026_000.wav',volume=50)
				view(src) << dd
				spawn(13)
					view(src) << "<b>HAHAHAHAHAHAHAHA."
					var/sound/d = sound('Sounds/Kenpachi/WAVE_VO_KENP_027_000.wav',volume=50)
					view(src) << d
					spawn(17)
						view(src) << "<b>I'm here to fight you to death!"
						var/sound/Sa = sound('Sounds/Kenpachi/WAVE_VO_KENP_032_000.wav',volume=50)
						view(src) << Sa
						spawn(25)
							view(src) << "<b>Come at me now."
							var/sound/S = sound('Sounds/Kenpachi/WAVE_VO_KENP_033_000.wav',volume=50)
							view(src) << S
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(!M.ispedal)
					src.Attack()
			if(istype(A,/turf/))
				var/turf/T = A
				if(istype(T,/turf/Soul_Society/Wall1))
					T.icon_state="broken"
					spawn(200)
					T.icon_state="Wall1 0,0"
				if(istype(T,/turf/Soul_Society/Wall2))
					T.icon_state="broken1"
					spawn(200)
					T.icon_state="Wall 2 0,0"
				view(src) << "..."
				T.density=0
				step(src,src.dir)
				spawn(200)
				T.density=1
obj/mazewin
obj/Opponentchoose
obj/Kenpachichase
	Sides
	Ups
	Breaks
	Surprise1
	Surprise2
mob
	Move()
		..()
		if(!src.irace)
			for(var/obj/race/win/M in view(0,src))
				src.loc=locate(67,133,1)
				src.GainExp(50000)
				src<<"<font color=purple>You have gained 50,000 exp and $2,000!"
				src.GainMoney(2000)
				src.gamemish=5
				if(src.storycom<=40)
					src.Story_Talk("You have honed your sense of direction,luck,targeting,and agility. You can help improve your survival tactics by talking to Yukio again, or you can continue training")
					src.curpart="Part 5: The Cursed Race"
					src.storycom=40
					src.curmis="Train until level 400"
				src.Level_Up()
		if(src.irace)
			for(var/obj/race/win/M in view(0,src))
				var/mob/D=src.owner
				if(D.gamemish!=5)
					D.loc=locate(67,133,1)
					D<<"<font color=purple>You have lost!"
				del src
			for(var/obj/race/a1/M in view(0,src))
				for(var/obj/race/a2/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a2/M in view(0,src))
				for(var/obj/race/a3/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a3/M in view(0,src))
				for(var/obj/race/a4/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a4/M in view(0,src))
				for(var/obj/race/a5/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a5/M in view(0,src))
				for(var/obj/race/a6/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a6/M in view(0,src))
				for(var/obj/race/a7/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a7/M in view(0,src))
				for(var/obj/race/a8/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a8/M in view(0,src))
				for(var/obj/race/a9/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a9/M in view(0,src))
				for(var/obj/race/a10/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a10/M in view(0,src))
				for(var/obj/race/a11/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a11/M in view(0,src))
				for(var/obj/race/a12/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a12/M in view(0,src))
				for(var/obj/race/a13/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a13/M in view(0,src))
				for(var/obj/race/a14/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a14/M in view(0,src))
				for(var/obj/race/a15/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a15/M in view(0,src))
				for(var/obj/race/a16/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a16/M in view(0,src))
				for(var/obj/race/a17/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a17/M in view(0,src))
				for(var/obj/race/a18/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a18/M in view(0,src))
				for(var/obj/race/a19/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a19/M in view(0,src))
				for(var/obj/race/a20/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a20/M in view(0,src))
				for(var/obj/race/a21/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a21/M in view(0,src))
				for(var/obj/race/a22/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a22/M in view(0,src))
				for(var/obj/race/a23/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a23/M in view(0,src))
				for(var/obj/race/a24/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a24/M in view(0,src))
				for(var/obj/race/a25/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a25/M in view(0,src))
				for(var/obj/race/a26/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a26/M in view(0,src))
				for(var/obj/race/a27/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a27/M in view(0,src))
				for(var/obj/race/a28/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a28/M in view(0,src))
				for(var/obj/race/a29/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a29/M in view(0,src))
				for(var/obj/race/a30/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a30/M in view(0,src))
				for(var/obj/race/a31/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a31/M in view(0,src))
				for(var/obj/race/a32/k in world)
					walk_to(src,k,0,0)
			for(var/obj/race/a32/M in view(0,src))
				for(var/obj/race/win/k in world)
					walk_to(src,k,0,0)
		if(src.client)
			for(var/obj/mazewin/M in view(0,src))
				src.loc=locate(67,133,1)
				src.GainExp(50000)
				src<<"<font color=purple>You have gained 50,000 exp and $2,000!"
				src.GainMoney(2000)
				src.gamemish=2
			for(var/obj/Opponentchoose/M in view(0,src))
				for(var/mob/Ichigo/m in oview(7,src))
					return
				usr.dir=EAST
				var/mob/k=new/mob/IchigoEarly
				k.dir=WEST
				k.loc=locate(47,54,16)
				k.frozen=1
				usr.frozen=1
				k.Load_Overlays()
				sleep(80)
				k.frozen=0
				usr.frozen=0