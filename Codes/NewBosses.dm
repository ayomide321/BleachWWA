

mob/var/justzanchanged=0

mob/newbossYama
	canRegenRei=1
	enemy = 1
	agrange=20
	level=12500
	delay=0
	mhealth = 99999999999
	bossss=1
	health = 99999999999
	attack = 900000
	mattack = 900000
	mdefence = 2500000
	mreiatsu = 500000
	defence = 2500000
	reiatsu = 500000
	hostile=1
	killable=1
	bossyama=1
	yamadropfiresword=1
	healthwas = 99999999999
	mrei = 2000000
	rei=2000000
	instinct=5
	quickflash=5
	berserk=5000000
	boneharden=3000000
	criticalhits=500000
	headpassive=10
	bodypassive=10
	armpassive=50
	regenpassive=40
	hypebeast=10
	backup=10
	hibernation=10
	woundregen=25
	survival=1
	invincibility=10
	piercepassive=100
	legpassive=100
	race="Nothing"
	wound=0
	armorpassive=100
	glare=5
	angel=10
	name="{Boss}Yammamoto"
	swordon=1
	hasabankai=1
	hasashikai=1
	rundelay = 1
	legit=1
	legit2=1
	hair_type=0
	stype="Yammamoto"
	icon_name="Base"
	spawntime=7 MINUTES
	Tnpccaptain=1
	New()
		expgain=rand(1000000000,3000000000)
		hair_type=/obj/hair/h1/black
		src.cloak=/obj/cloak/captain/c1
		src.weapon=/obj/weapon/sword
		src.overshirt=/obj/overshirt/shinigami/s1
		spawn()src.Affirm_Icon()
		spawn()src.Load_Overlays()
		src.oldspot = src.loc
		..()







obj/vandprince
	botleft
		icon='Icons/vand bot left.dmi'
		pixel_x=-32
		pixel_y=-32
	botmid
		icon='Icons/vand bot mid.dmi'
		pixel_y=-32
	botright
		icon='Icons/vand bot right.dmi'
		pixel_y=-32
		pixel_x=32
	midleft
		icon='Icons/vand mid left.dmi'
		pixel_x=-32
		layer=25
	midmid
		icon='Icons/vand mid mid.dmi'
	midright
		icon='Icons/vand mid right.dmi'
		pixel_x=32
		layer=25
	topleft
		icon='Icons/vand top left.dmi'
		pixel_x=-32
		pixel_y=32
		layer=25
	topmid
		icon='Icons/vand top mid.dmi'
		pixel_y=32
		layer=25
	topright
		icon='Icons/vand top right.dmi'
		pixel_y=32
		pixel_x=32
		layer=25
mob/var
	crownprince=0
	crownprincekills=0
mob/Crown_Prince
	enemy = 1
	agrange=14
	level=10000
	delay=0
	mhealth = 140000000
	bossss=1
	health = 14000000
	attack = 50000
	mattack = 70000
	mdefence = 40000
	mreiatsu = 90000
	defence = 40000
	reiatsu = 90000
	hostile=1
	killable=1
	crownprince=1
	healthwas = 140000000
	mrei = 2000000
	rei=2000000
	instinct=5
	quickflash=5
	berserk=5
	boneharden=300
	criticalhits=5
	headpassive=5
	bodypassive=5
	armpassive=5
	legpassive=5
	race="Pure Blood Quincy"
	wound=0
	armorpassive=20
	rundelay=0
	name="{Boss}Crown Prince Vandenreich"
	spawntime=2000
	New()
		expgain=rand(450000000,600000000)
		spawn()src.Affirm_Icon()
		spawn()src.Load_Overlays()
		src.overlays += /obj/vandprince/botleft
		src.overlays += /obj/vandprince/botmid
		src.overlays += /obj/vandprince/botright
		src.overlays += /obj/vandprince/midleft
		src.overlays += /obj/vandprince/midmid
		src.overlays += /obj/vandprince/midright
		src.overlays += /obj/vandprince/topleft
		src.overlays += /obj/vandprince/topmid
		src.overlays += /obj/vandprince/topright
		src.oldspot = src.loc
		..()


/*	quincyvand
		name = "{NPC}Vandereich Quincy"
		enemy = 1
		agrange=12
		level=1300
		mhealth = 250000
		attack = 22000
		mattack = 22000
		hostile=1
		killable=1
		delay=3
		defence = 22000
		reiatsu = 20000
		mdefence = 22000
		mreiatsu = 20000
		healthwas = 150000
		mrei = 40000
		rei=40000
		instinct=5
		quickflash=5
		loyalty=1
		race="Quincy"
		vand=1
		legit
		seelsword=1
		spawntime = 900
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			expgain=rand(2900000,3000000)
			src.oldspot = src.loc
			src.ClothesGen()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
		verb/Talk()
			set src in oview(1)
			if(usr.dmission==src)
				src.Talks("Thanks for getting me this")
				usr.CompleteMish(1000,rand(75,110),view(20,usr))
				return
			if(usr.mission==src)
				src.Talks("How did you find me?")
				usr.CompleteMish(1000,rand(75,110),view(20,usr))
				return
			if(usr.mission==4&&usr.missiontarget==src)
				if(!src.follow)
					src.Talks("May you escort me to [usr.mlocation]?")
					src.follow=usr
					//src.rundelay+=1				jk.loc=locate(usr.x,usr.y,usr.z)
					return
				else
					src.Talks("I'll stay put right here until your ready.")
					src.follow=0
					//src.rundelay=-1				jk.loc=locate(usr.x,usr.y,usr.z)
					return*/
obj/crownprincesides
	icon='Icons/crown prince shot.dmi'
	bot
		icon_state="1,0"
		pixel_y=-32
	botleft
		icon_state="0,0"
		pixel_x=-32
		pixel_y=-32
	botright
		icon_state="2,0"
		pixel_x=32
		pixel_y=-32
	midleft
		icon_state="0,1"
		pixel_x=-32
	midright
		icon_state="2,1"
		pixel_x=32
	topleft
		icon_state="0,2"
		pixel_y=32
		pixel_x=-32
	topmid
		icon_state="1,2"
		pixel_y=32
	topright
		icon_state="2,2"
		pixel_y=32
		pixel_x=32
obj
	crownprinceshot//hits thru def
		icon = 'Icons/crown prince shot.dmi'
		icon_state = "impact"
		density = 1
		New()
			src.overlays+=/obj/crownprincesides/bot
			src.overlays+=/obj/crownprincesides/botleft
			src.overlays+=/obj/crownprincesides/botright
			src.overlays+=/obj/crownprincesides/midleft
			src.overlays+=/obj/crownprincesides/midright
			src.overlays+=/obj/crownprincesides/topleft
			src.overlays+=/obj/crownprincesides/topmid
			src.overlays+=/obj/crownprincesides/topright
			spawn(35)
			del src
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					del src
					return
				if(M.ispedal)
					del src
					return
				if(prob(M.instinct*5))
					var/remember=M.dir
					src.loc=M.loc
					if(src.y==M.y)
						var/k=pick(1,2)
						if(k==1)step(M,NORTH);M.dir=remember
						if(k==2)step(M,SOUTH);M.dir=remember
					if(src.x==M.x)
						var/k=pick(1,2)
						if(k==1)step(M,WEST);M.dir=remember
						if(k==2)step(M,EAST);M.dir=remember
					else
						var/f=pick(1,2,3,4)
						if(f==1)step(M,WEST);M.dir=remember
						if(f==2)step(M,EAST);M.dir=remember
						if(f==3)step(M,NORTH);M.dir=remember
						if(f==4)step(M,SOUTH);M.dir=remember
					return
				if(M.soccer)
					M.soccer=0
					M.Load_Overlays()
					var/obj/soccerball/s=new/obj/soccerball(src.loc)
					s.icon_state=""
					walk(s,src.dir,0)
					spawn(1)
						s.icon_state=""
						walk(s,0)
						if(s.dir==NORTH)s.dir=SOUTH
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Seele"
					del src
				Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = round((O.reiatsu * 2.75)+(M.defence*1.5))
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Seele Schneider for [damage] damage!"
				if(M.enemy)
					O.hollowprotection = 1
				src.loc = M.loc
				M.Death(O,damage,rand(1,2))
				spawn(3)
					if(!M.npc)
						if(src)
							var/dirold = M.dir
							step(M,src.dir)
							M.dir = dirold
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,src.DeflectionDirection(),1)
		Move()
			if(src.beenout)
				var/K = new/obj/seeletrail(src.loc)
				K:dir = src.dir
			src.beenout=1
			..()
obj/NewBossSkill
	New()
		spawn(35)
			src.loc=null
	icon='Icons/tiled sh!t a&# format.dmi'
	tail1
		icon_state="tail1"
		density=0
	tail2
		icon_state="tail2"
		density=0
	head1
		icon_state="head1"
		density=1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
			//	if(M == src.Gowner)
			//	del src
			//		return
				if(M.ispedal)
					del src
					return
				if(prob(M.instinct*5))
					var/remember=M.dir
					src.loc=M.loc
					if(src.y==M.y)
						var/k=pick(1,2)
						if(k==1)step(M,NORTH);M.dir=remember
						if(k==2)step(M,SOUTH);M.dir=remember
					if(src.x==M.x)
						var/k=pick(1,2)
						if(k==1)step(M,WEST);M.dir=remember
						if(k==2)step(M,EAST);M.dir=remember
					else
						var/f=pick(1,2,3,4)
						if(f==1)step(M,WEST);M.dir=remember
						if(f==2)step(M,EAST);M.dir=remember
						if(f==3)step(M,NORTH);M.dir=remember
						if(f==4)step(M,SOUTH);M.dir=remember
					return
				if(M.soccer)
					M.soccer=0
					M.Load_Overlays()
					var/obj/soccerball/s=new/obj/soccerball(src.loc)
					s.icon_state=""
					walk(s,src.dir,0)
					spawn(1)
						s.icon_state=""
						walk(s,0)
						if(s.dir==NORTH)s.dir=SOUTH
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Seele"
					del src
				Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = round((O.reiatsu * 2)+(M.defence/2))
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Seele Schneider for [damage] damage!"
				if(M.enemy)
					O.hollowprotection = 1
				src.loc = M.loc
				M.Death(O,damage,rand(1,2))
				spawn(3)
					if(!M.npc)
						if(src)
							var/dirold = M.dir
							step(M,src.dir)
							M.dir = dirold
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,src.DeflectionDirection(),1)
		Move()
			if(src.beenout)
				var/K = new/obj/seeletrail(src.loc)
				K:dir = src.dir
			src.beenout=1
			..()
mob
	proc
		PrinceRewardShot()
			if(src.safe)
				usr << "<b>You are in safe zone!"
				return
			if(src.rei<1000)
				src << "<b>You need [rei]/1000 rei!"
				return
			if(src.rewardprincecd)
				src<<"<b> You must wait atlesat 2.5 seconds!</b>"
				return
			if(!src.rewardprincecd)
				src.rewardprincecd=1
				src.Load_Overlays()
				if(src.dir == NORTH)
					var/obj/NewBossSkill/head1/A = new /obj/NewBossSkill/head1/
					var/obj/NewBossSkill/head1/A2 = new /obj/NewBossSkill/head1/
					var/obj/NewBossSkill/tail1/B = new /obj/NewBossSkill/tail1/
					var/obj/NewBossSkill/tail2/C = new /obj/NewBossSkill/tail2/
					A.pixel_x=-16
					A2.icon_state="head2"
					A2.density=0
					A2.pixel_x=16
					B.pixel_x=-16
					C.pixel_x=16
					A.loc=locate(usr.x,usr.y+1,usr.z)
					A2.loc=locate(usr.x,usr.y+1,usr.z)
					B.loc = locate(usr.x, usr.y, usr.z)
					C.loc = locate(usr.x, usr.y, usr.z)
					A.dir = NORTH
					A2.dir = NORTH
					B.dir=NORTH
					C.dir=NORTH
					A.Gowner = src
					A2.Gowner = src
					B.Gowner=src
					C.Gowner=src
					walk(A,NORTH)
					walk(A2,NORTH)
					walk(B,NORTH)
					walk(C,NORTH)
				if(usr.dir == SOUTH)
					var/obj/NewBossSkill/head1/A = new /obj/NewBossSkill/head1/
					var/obj/NewBossSkill/head1/A2 = new /obj/NewBossSkill/head1/
					var/obj/NewBossSkill/tail1/B = new /obj/NewBossSkill/tail1/
					var/obj/NewBossSkill/tail2/C = new /obj/NewBossSkill/tail2/
					A2.icon_state="head2"
					A.pixel_x=-16
					A2.density=0
					A2.icon_state="head2"
					A2.pixel_x=16
					B.pixel_x=-16
					C.pixel_x=16
					A.loc=locate(usr.x,usr.y-1,usr.z)
					A2.loc=locate(usr.x,usr.y-1,usr.z)
					B.loc = locate(usr.x, usr.y, usr.z)
					C.loc = locate(usr.x, usr.y, usr.z)
					A.dir = SOUTH
					A2.dir = SOUTH
					B.dir=SOUTH
					C.dir=SOUTH
					A.Gowner = src
					A2.Gowner = src
					B.Gowner=src
					C.Gowner=src
					walk(A,SOUTH)
					walk(A2,SOUTH)
					walk(B,SOUTH)
					walk(C,SOUTH)
				if(usr.dir == WEST||usr.dir == NORTHWEST||usr.dir == SOUTHWEST)
					var/obj/NewBossSkill/head1/A = new /obj/NewBossSkill/head1/
					var/obj/NewBossSkill/head1/A2 = new /obj/NewBossSkill/head1/
					var/obj/NewBossSkill/tail1/B = new /obj/NewBossSkill/tail1/
					var/obj/NewBossSkill/tail2/C = new /obj/NewBossSkill/tail2/
					A2.icon_state="head2"
					A.pixel_y=-16
					A2.pixel_y=16
					A2.density=0
					B.pixel_y=-16
					C.pixel_y=16
					A.loc=locate(usr.x-1,usr.y,usr.z)
					A2.loc=locate(usr.x-1,usr.y,usr.z)
					B.loc = locate(usr.x, usr.y, usr.z)
					C.loc = locate(usr.x, usr.y, usr.z)
					A.dir = WEST
					A2.dir = WEST
					B.dir=WEST
					C.dir=WEST
					A.Gowner = src
					A2.Gowner = src
					B.Gowner=src
					C.Gowner=src
					walk(A,WEST)
					walk(A2,WEST)
					walk(B,WEST)
					walk(C,WEST)
				if(usr.dir == EAST||usr.dir == NORTHEAST||usr.dir == SOUTHEAST)
					var/obj/NewBossSkill/head1/A = new /obj/NewBossSkill/head1/
					var/obj/NewBossSkill/head1/A2 = new /obj/NewBossSkill/head1/
					var/obj/NewBossSkill/tail1/B = new /obj/NewBossSkill/tail1/
					var/obj/NewBossSkill/tail2/C = new /obj/NewBossSkill/tail2/
					A2.icon_state="head2"
					A.pixel_y=-16
					A2.pixel_y=16
					B.pixel_y=-16
					A2.density=0
					C.pixel_y=16
					A.loc=locate(usr.x+1,usr.y,usr.z)
					A2.loc=locate(usr.x+1,usr.y,usr.z)
					B.loc = locate(usr.x, usr.y, usr.z)
					C.loc = locate(usr.x, usr.y, usr.z)
					A.dir = EAST
					A2.dir = EAST
					B.dir=EAST
					C.dir=EAST
					A.Gowner = src
					A2.Gowner = src
					B.Gowner=src
					C.Gowner=src
					walk(A,EAST)
					walk(A2,EAST)
					walk(B,EAST)
					walk(C,EAST)
				sleep(25)
				src.rewardprincecd = 0
mob/var
	tmp/rewardprincecd=0