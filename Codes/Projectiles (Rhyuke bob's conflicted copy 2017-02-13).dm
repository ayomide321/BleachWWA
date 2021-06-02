var
	donor_log=file("donorlog.txt")





mob/var
	donthit=0
mob
	Move()
		if(src.saied||src.neged||src.frozen||src.moving&&!src.allowmove||src.npc||src.tripped||src.nomove&&!src.shunning&&!src.allowmove)
			return
		if(src.client)
			if(src.inshikai||src.inbankai)
				if(src.stype == "Dark Bat")
					var/K = new/obj/darkdust(src.loc)
					K:dir = src.dir
				if(src.stype == "Rukia")
					var/K = new/obj/rukiadust(src.loc)
					K:dir = src.dir
			if(src.ressurection)
				if(src.ressurectiontype == "Volcanica")
					var/F = new/obj/bountofiretrail(src.loc)
					F:dir = src.dir
		if(src.inbankai&&src.stype=="Unohana"||src.ressurection&&src.ressurectiontype=="Del Toro"||src.rushing)
			for(var/mob/M in get_step(src,src.dir))
				if(!M.ispedal)
					src.moving=1
					src.Push(M)
		..()
//		if(src.ftype=="Yukio")
//			for(var/obj/gameturf/fd in get_step(src,src.dir))
//				if(fd.gamer&&fd.owner==src)
//					src.loc=fd.loc
	//	..()
		if(src.shunning)
			/*for(var/mob/is in oview(2,src))
				if(is.hollowtype=="adjucha"||is.hollowtype=="meno")
					view(src,8) << "<font color = red><b>[is] stomped [src]!"
					src.Death(is,is.attack*2,1)*/
			if(src.stype=="Aizen"&&inshikai||src.stype=="Aizen"&&inbankai)
				for(var/mob/m in view(4,src))
					if(m.etarget==src)
						m.Untarget()
		for(var/obj/garganta/is in view(0,usr))
			if(is.garganta)
				src.loc = locate(147,103,1)
				src.safe=0
		for(var/obj/Shadow/is in view(0,src))
			if(!src.protected)
				var/mob/O=is.Gowner
				if(src!=O)
					view(O,8) << "<b><font color = red>[O] has stunned [src] with the shadow"
					spawn()src.Freeze(50)
					del is
		for(var/obj/senkaimon/is in view(0,usr))
			if(is.garganta)
				src.loc = locate(147,103,1)
				src.safe=0
		if(src.mission==2)
			if(usr.race=="Hollow"&&usr.z==3)
				usr.scan+=1
			if(usr.race=="Shinigami"&&usr.z==4)
				usr.scan+=1
			if(usr.earth&&usr.z==2)
				usr.scan+=1
			if(usr.race=="Arrancar"&&usr.z==11)
				usr.scan+=1
			if(usr.scan>=200)
				usr.CompleteMish(1,1,view(20,src))
		if(src.smashing||src.esmashing)
			for(var/mob/Df in oview(2))
				if(src.etarget==Df)
					var/obj/afterImage = new /obj()
					afterImage.layer = MOB_LAYER
					afterImage.icon=src.icon
					afterImage.overlays=src.overlays
					afterImage.underlays = src.underlays
					afterImage.dir=src.dir
					afterImage.loc = src.loc
					afterImage.zer = 1
					afterImage.owner = src
					flick("shun",afterImage)
					spawn(4)
					del afterImage
					src.smashing=0
					src.esmashing=0
					src.loc=Df.loc
					//src.dir = turn(src.dir, -90)
					src.Smashed(Df)
		if(src.restep)
			if(!src.step12&&src.step11)
				src.restep=0
				src.step12=src.dir
				src.controlbug=0
				src.invisibility=40
				src.see_invisible=40
				src.Rewalk()
			if(!src.step11&&src.step10)
				src.step11=src.dir
			if(!src.step10&&src.step9)
				src.step10=src.dir
			if(!src.step9&&src.step8)
				src.step9=src.dir
			if(!src.step8&&src.step7)
				src.step8=src.dir
			if(!src.step7&&src.step6)
				src.step7=src.dir
			if(!src.step6&&src.step5)
				src.step6=src.dir
			if(!src.step5&&src.step4)
				src.step5=src.dir
			if(!src.step4&&src.step3)
				src.step4=src.dir
			if(!src.step3&&src.step2)
				src.step3=src.dir
			if(!src.step2&&src.step1)
				src.step2=src.dir
			if(!src.step1)
				src.step1=src.dir
		if(src.shunning)
			for(var/mob/G in get_step(src,src.OppositeDirection()))
				if(G!=src)
					if(src.particlecrip)
						if(G.protected)return
						if(src.ko)return
						view(src,8) << "<font color = red><b>[src] hit [G] with Particle Crippler!"
						G.beer1()
					if(prob(src.senka*10))
						if(G.protected)return
						if(src.ko)return
						Blood(G.x,G.y,G.z)
						var/damage=src.attack*1.5
						view(src,8) << "<font color = red><b>[src] hit [G] with senka!"
						G.senkad=src
						spawn(3)
						G.senkad=0
						G.Death(src,damage,5)
		if(src.donthit)
			src.density=1
			src.donthit=0
		if(src.rundelay<=1)
			if(!src.bowon)
				if(!src.zab)
					src.icon_state="Run"
		for(var/obj/Money/m in view(0,src))
			if(!src.ispedal&&!src.zab)
				src.GainMoney(m.mvalue)
				for(var/mob/jk in view(8,src))
					if(jk.mission==11&&jk.missiontarget==src)
						jk.CompleteMish(8000,rand(300,500),world)
				del m
		if(src.running)
			var/k=rand(1,2)
			if(k==1)
				if(src.rundelay>=3||src.flags||src.gotthecharge)src.running=100
				var/obj/afterImage = new /obj()
				afterImage.layer = MOB_LAYER
				afterImage.icon=src.icon
				afterImage.icon_state=src.icon_state
				afterImage.overlays=src.overlays
				afterImage.underlays = src.underlays
				afterImage.dir=src.dir
				afterImage.loc = src.loc
				afterImage.zer = 1
				afterImage.owner = src
				spawn(10)
				del afterImage
		if(!src.allowmove||!src.client)
			src.moving=1
			var/t=0
			if(src.flags)t=3
			if(src.wound>=90)t+=1
			if(src.gotthecharge&&src.incr)t+=1
			if(src.rundelay<0)src.rundelay=1
			sleep(src.rundelay+t)
			if(src.rundelay<=1)
				if(!src.bowon)
					if(!src.zab)
						src.icon_state=""
			src.moving = 0
obj/fire
	icon = 'Fs.dmi'
	flash
		icon_state="fire"
		layer = 30
		New()
			spawn(11)
			src.loc=null
	spark
		layer = 30
		icon_state="FlashFire"
		New()
			spawn(6)
			src.loc=null
	Water
		layer = 30
		icon='Icons/turf_water.dmi'
		icon_state="trans"
		New()
			spawn(6)
			src.loc=null
obj
	hado1
		layer = 30
		icon='Icons/hado1.dmi'
		New()
			flick("",src)
			spawn(3)
			src.loc=null
obj
	negacion
		layer = 30
		icon='Icons/negacion.dmi'
		New()
			flick("",src)
			spawn(3)
			src.loc=null
obj
	WaterDollBall
		icon = 'waterball.dmi'
		icon_state = ""
		density = 1
		layer = 100
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(!M.protected)Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = O.reiatsu*1.5
				if(O.marksman>=1)
					damage+=O.level*5
				if(damage < 1)
					damage =rand(25,1000)
				src.loc = M.loc
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] for [damage] damage!"
				M.Death(O,damage,rand(1,2))
				spawn(2)
					if(!M.npc)
						if(src)
							var/dirold = M.dir
							step(M,src.dir)
							M.dir = dirold
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc = T.loc
			if(istype(A,/obj/))
				var/obj/T = A
				src.loc = T.loc
obj
	FireDollBall
		icon = 'bountofireball.dmi'
		icon_state = ""
		density = 1
		layer = 100
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(!M.protected)Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = O.reiatsu*1.5
				if(O.marksman>=1)
					damage+=O.level*5
				if(damage < 1)
					damage =rand(25,1000)
				src.loc = M.loc
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] for [damage] damage!"
				M.Death(O,damage,rand(1,2))
				spawn(2)
					if(!M.npc)
						if(src)
							var/dirold = M.dir
							step(M,src.dir)
							M.dir = dirold
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc = T.loc
			if(istype(A,/obj/))
				var/obj/T = A
				src.loc = T.loc
		Move()
			var/k = new/obj/bountofiretrail(src.loc)
			k:dir = src.dir
			..()
	inouepow
		icon = 'bountofireball.dmi'
		icon_state = ""
		density = 1
		layer = 100
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(!M.protected)Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = O:mhealth / 6
				if(O.marksman>=1)
					damage+=O.level*5.3
				//var/damage = abs(O:mhealth - O:health)/3
				if(damage < 1)
					damage =rand(25,1000)
				src.loc = M.loc
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Koten Zanshun for [damage] damage!"
				if(M.enemy)
					O.hollowprotection = 1
				M.Death(O,damage,rand(1,2))
				spawn(2)
					if(!M.npc)
						if(src)
							var/dirold = M.dir
							step(M,src.dir)
							M.dir = dirold
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc = T.loc
			if(istype(A,/obj/))
				var/obj/T = A
				src.loc = T.loc
		Move()
			var/k = new/obj/bountofiretrail(src.loc)
			k:dir = src.dir
			..()
obj
	inouezip
		icon = 'inoueslash.dmi'
		icon_state = ""
		density = 1
		layer = 100
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(!isnull(M))
					if(M == src.Gowner)
						src.loc=null
						return
					if(M.ispedal)
						src.loc=null
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
					if(!M.protected)Blood(M.x,M.y,M.z)
					var/mob/O = src.Gowner
					var/damage = O.defence*2.8
					if(O.marksman>=1)
						damage+=O.level*5
					damage-=M.defence/2
					if(damage < 1)
						damage =rand(25,1000)
					src.loc = M.loc
					//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] for [damage] damage!"
					M.Death(O,damage,rand(1,2))
					spawn(2)
						if(!M.npc)
							if(src)
								var/dirold = M.dir
								step(M,src.dir)
								M.dir = dirold
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						src.loc = T.loc
				if(istype(A,/obj/))
					var/obj/T = A
					src.loc = T.loc
		Move()
			if(!isnull(src))
				var/k = new/obj/inoueziptrail(src.loc)
				k:dir = src.dir
				..()
	inouepow
		icon = 'inoueslash.dmi'
		icon_state = "power"
		density = 1
		layer = 100
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(!M.protected)Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = O:mhealth / 5.5
				if(O.marksman>=1)
					damage+=O.level*5
				//var/damage = abs(O:mhealth - O:health)/3
				if(damage < 1)
					damage =rand(25,1000)
				src.loc = M.loc
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Koten Zanshun for [damage] damage!"
				if(M.enemy)
					O.hollowprotection = 1
				M.Death(O,damage,rand(1,2))
				spawn(2)
					if(!M.npc)
						if(src)
							var/dirold = M.dir
							step(M,src.dir)
							M.dir = dirold
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc = T.loc
			if(istype(A,/obj/))
				var/obj/T = A
				src.loc = T.loc
		Move()
			var/k = new/obj/inoueziptrail(src.loc)
			k:dir = src.dir
			..()
obj
 inoueziptrail
		icon = 'inoueslash.dmi'
		icon_state = "trail"
		zer = 1
		New()
			spawn(10)
			src.loc=null
obj
	ice
		icon = 'hitsugayashikai.dmi'
		icon_state = ""
		density = 1
		layer = 60
		New()
			spawn(20)
			src.loc=null
		Del()
			for(var/obj/icetrail/X in world)
				if(X.owner == src)
					del X
			..()
		Move()
			..()
			if(src.beenout)
				var/obj/icetrail/K = new /obj/icetrail
				if(src.dir == NORTH)
					K.loc = locate(src.x,src.y-1,src.z)
				if(src.dir == WEST)
					K.loc = locate(src.x+1,src.y,src.z)
				if(src.dir == EAST)
					K.loc = locate(src.x-1,src.y,src.z)
				if(src.dir == SOUTH)
					K.loc = locate(src.x,src.y+1,src.z)
				if(src.dir == NORTHWEST)
					K.loc = locate(src.x+1,src.y-1,src.z)
				if(src.dir == NORTHEAST)
					K.loc = locate(src.x-1,src.y-1,src.z)
				if(src.dir == SOUTHWEST)
					K.loc = locate(src.x+1,src.y+1,src.z)
				if(src.dir == SOUTHEAST)
					K.loc = locate(src.x-1,src.y+1,src.z)
				K.dir = src.dir
				K.owner = src
			src.beenout=1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(M.inoueshield)
					M.inoueshield=0
					view(8) << "<b>[M]: Blood Mist Shield!"
					var/obj/Maf = new/obj/bloodshield(M.loc)
					Maf:owner = M
					M.ShieldCool()
					flick("new",Maf)
					Maf.dir=get_dir(Maf,src)
				if(M.protected==1)src.loc=null
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Ice"
					src.loc=null
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
				var/mob/O=src.Gowner
				M.overlays += /obj/icicle
				M.overlays += /obj/icicle2
				src.loc = M.loc
				M.frozen = 1
				M.canattack = 0
				M.firing = 1
				M.shatter(O)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					del kink
obj
	BlackFlame2
		icon = 'black flames amat.dmi'
		icon_state = "2"
		pixel_y = 32
		layer = 40
obj
	BlackFlame
		icon = 'black flames amat.dmi'
		icon_state =""
		layer = 40
		New()
			spawn(20)
			src.loc=null
obj
	BlackFlameTrail
		icon = 'black flames amat.dmi'
		zer=1
		layer = 40
		New()
			src.overlays += /obj/BlackFlame2
			spawn(20)
			src.loc=null
obj
	darkshard
		icon = 'DarkShatter.dmi'
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump()
			src.loc=null
obj
	iceshard
		icon = 'icicle.dmi'
		icon_state = "3"
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump()
			src.loc=null
obj
 icicle2
		icon = 'icicle.dmi'
		icon_state = "2"
		pixel_y = 32
		layer = 40
obj
 icicle
		icon = 'icicle.dmi'
		icon_state = "1"
		layer = 40
		New()
			spawn(20)
			src.loc=null
obj
 icicletrail
		icon = 'icicle.dmi'
		icon_state = "1"
		zer = 1
		layer = 40
		New()
			src.overlays += /obj/icicle2
			spawn(20)
			src.loc=null
 icetrail
		icon = 'hitsugayashikai.dmi'
		icon_state = "trail"
		layer = 60
		density = 0
		New()
			spawn(20)src.loc=null
			..()
obj
 ceroc
		icon = 'ceroc.dmi'
		New()
			spawn(5)
			src.loc=null
obj
	Darkban
		density = 1
		New()
			spawn(20)
			src.loc=null
		Del()
			for(var/obj/BlackFlameTrail/X in world)
				if(X.owner == src)
					del X
			..()
		Move()
			..()
			var/obj/BlackFlameTrail/K = new /obj/BlackFlameTrail
			K.loc = locate(src.x,src.y,src.z)
			K.dir = src.dir
			K.owner = src
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Hakuren"
					src.loc=null
				//view(O,8) << "<b><font color = red>[O] hit [M] with his Hakuren for [damage] damage!"
				M.overlays += /obj/BlackFlame
				var/mob/O=src.Gowner
				src.loc = M.loc
				M.frozen = 1
				M.canattack = 0
				M.firing = 1
				M.DarkShatter(O)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					del kink

obj
	rukiaban
		density = 1
		New()
			spawn(20)
			src.loc=null
		Del()
			for(var/obj/icicletrail/X in world)
				if(X.owner == src)
					del X
			..()
		Move()
			..()
			var/obj/icicletrail/K = new /obj/icicletrail
			K.loc = locate(src.x,src.y,src.z)
			K.dir = src.dir
			K.owner = src
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Hakuren"
					src.loc=null
				//view(O,8) << "<b><font color = red>[O] hit [M] with his Hakuren for [damage] damage!"
				M.overlays += /obj/icicle
				M.overlays += /obj/icicle2
				var/mob/O=src.Gowner
				src.loc = M.loc
				M.frozen = 1
				M.canattack = 0
				M.firing = 1
				M.shatter2(O)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					del kink

obj
	Ice
		layer=58
		icon = 'icepillar.dmi'
		i1
			icon_state="1"
			pixel_y=-32
		i2
			icon_state="3"
			pixel_y=32
		Break
			icon_state="del"
			New()
				flick("del",src)
				spawn(4)
				src.loc=null
		Ice
			icon_state = "2"
			density = 1
			New()
				src.overlays+=/obj/Ice/i1
				src.overlays+=/obj/Ice/i2
				spawn(20)
				src.loc=null
			Del()
				src.density=0
				new/obj/Ice/Break(locate(src.x,src.y,src.z))
				new/obj/Ice/Break(locate(src.x,src.y+1,src.z))
				new/obj/Ice/Break(locate(src.x,src.y-1,src.z))
				..()
			Bump(A)
				if(ismob(A))
					var/mob/M = A
					if(M == src.Gowner)
						src.loc=M.loc
						return
					if(M.ispedal)
						src.loc=null
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
					var/mob/O = src.Gowner
					var/damage = O.reiatsu*1.9 - M.defence / 1.6
					if(O.marksman>=1)
						damage+=O.level*5
					if(damage < 1)
						damage =rand(25,1000)
					walk(src,0)
					//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Sennen Hyoro for [damage] damage!"
					M.Death(O,damage,rand(2,4))
					step(M,src.dir)
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						src.loc=locate(T.x,T.y,T.z)
				if(istype(A,/obj/))
					src.loc=null
obj
	sovereign
		icon = 'Zommari Ress.dmi'
		icon_state = "blast"
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Sovereign"
					src.loc=null
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
				var/mob/O = src.Gowner
				var/damage = O.attack*4
				if(O.marksman>=1)
					damage+=O.level*5
				if(damage < 1)
					damage =rand(25,1000)
				src.loc=null
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Sovereign Blast for [damage] damage!"
				spawn()M.Death(O,damage,rand(3,5))
				M.Sovereign(O)
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
obj
	reiatsu_blast
		icon = 'reiatsu blast.dmi'
		icon_state = ""
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Reiatsu Blast"
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = O.reiatsu*2- M.defence / 2
				if(O.marksman>=1)
					damage+=O.level*5
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				src.loc=null
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Reiatsu Blast for [damage] damage!"
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(src,kink.DeflectionDirection(),1)
obj
	hina
		icon = 'hinamoriblast.dmi'
		icon_state = ""
		single=1
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Hina"
					src.loc=null
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
				var/mob/O = src.Gowner
				var/damage = O.reiatsu*2.4 - M.defence / 3.5
				if(O.marksman>=1)
					damage+=O.level*5
				damage+=rand(damage/2,damage)
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				src.loc=null
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Reiatsu Blast for [damage] damage!"
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
obj
	blood
		density=1
		layer=99
		New()
			..()
			src.icon='Icons/bloods.dmi'
			src.icon_state="sz"
			spawn(10)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				var/mob/O = src.Gowner
				view(O,8) << "<b><font color = red>[O] hit [M] with his blood, cloning [M]!"
				O.cloned+=1
				if(O.cloned>=3)
					var/mob/x1 = pick(O.clones)
					O<<"These people are in your list:[O.clones]"
					O<<"You chose [x1] to kill"
					O.cloned-=1
					del x1
				var/mob/clones/R = new/mob/clones(M.loc)
				src.loc=null
				spawn()R.LifeSpan(O,900)
				R.myclone=O
				O.clones+=R
				R.icon=M.icon
				R.armon=M.armon
				R.finalb=M.finalb
				R.bowon=M.bowon
				R.seelsword=M.seelsword
				R.sanrei=M.sanrei
				if(M.level>=100&&M.level<300)
					if(M.race=="Sado")R.sadostrong=1
					if(M.race=="Quincy")R.quincystrong=1
				if(M.level>=300)
					if(M.race=="Sado")R.ultimatesado=1
					if(M.race=="Quincy")R.ultimatequincy=1
				R.ftype=M.ftype
				R.infull=M.infull
				R.inafull=M.inafull
				R.ftype=M.ftype
				R.getsugaring=M.getsugaring
				R.bringerblast=M.bringerblast
				R.thits=M.thits
				R.iszan=M.iszan
				R.cerored=M.cerored
				R.cerogreen=M.cerogreen
				R.ceroblue=M.ceroblue
				R.icon_name=M.icon_name
				R.hollowtype=M.hollowtype
				R.health=M.mhealth/2
				R.attack=M.attack/1.2
				R.mattack=M.attack
				R.defence=M.defence/1.2
				R.mdefence=M.defence
				R.mrei=M.mrei
				R.rei=M.mrei
				R.reiatsu=M.reiatsu/1.2
				R.mreiatsu=M.reiatsu
				R.race=M.race
				R.swordon=M.swordon
				R.stype=M.stype
				R.wound=0
				R.ressurectiontype=M.ressurectiontype
				R.undershirt=M.undershirt
				R.overshirt=M.overshirt
				R.armor=M.armor
				R.pants=M.pants
				R.legarmor=M.legarmor
				R.armarmor=M.armarmor
				R.facearmor=M.facearmor
				R.glasses=M.glasses
				R.cloak=M.cloak
				R.back=M.back
				R.shoes=M.shoes
				R.special=M.special
				R.etarget=M
				R.hair_type=M.hair_type
				R.hair_red=M.hair_red
				R.hair_green=M.hair_green
				R.hair_blue=M.hair_blue
				R.shirt=M.shirt
				R.shirt_red=M.shirt_red
				R.shirt_green=M.shirt_green
				R.shirt_blue=M.shirt_blue
				R.jacket=M.jacket
				R.jacket_red=M.jacket_red
				R.jacket_green=M.jacket_green
				R.jacket_blue=M.jacket_blue
				R.pants_red=M.pants_red
				R.pants_green=M.pants_green
				R.pants_blue=M.pants_blue
				R.arrancarmask=M.arrancarmask
				R.inshikai=M.inshikai
				R.inbankai=M.inbankai
				R.ressurection=M.ressurection
				R.name="{Clone}[M.name]"
				R.level=M.level
				R.expgain=M.level*4
				R.killable=1
				R.dead=0
				R.enemy=1
				R.Load_Overlays()
				R.Affirm_Icon()
				step_away(R,M,5)
				R.Facedir(M)
				R.Aggro(M)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
mob/clones
	delay=3
	instinct=2
	quickflash=2
	agrange=10
obj
	benihikou
		icon = 'Benihikou.dmi'
		icon_state = ""
		density = 1
		New()
			spawn(15)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(!M.protected)Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = O.attack * 3.5 - M.defence / 1.8
				if(O.marksman>=1)
					damage+=O.level*5
				if(damage < 1)
					damage =rand(25,1000)
				if(O.inbankai)
					damage = O.attack * 5- M.defence / 1.8
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Benihikou for [damage] damage!"
				src.loc=null
				M.Death(O,damage,rand(2,3))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
obj
	hina2
		icon = 'hinamoriblast2.dmi'
		icon_state = ""
		density = 1
		single=1
		New()
			spawn(100)
				if(!isnull(src))
					src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Hina2"
					//M.contents+=src
					//return
					src.loc=null
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
				var/mob/O = src.Gowner
				var/damage = O.reiatsu * 3.6 - M.defence / 2
				damage+=rand(damage/3,damage/2)
				if(O.marksman>=1)
					damage+=O.level*5
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				src.loc=null
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Reiatsu Power Blast for [damage] damage!"
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
obj
 var
		diealready = 0
obj
	Sounds/Aizen/'WAVEtrail
		icon = 'kaien.dmi'
		icon_state = "Sounds/Aizen/'WAVE trail"
		density = 0
		layer=16
		New()
			spawn(10)
			src.loc=null
obj
	weakSounds/Aizen/'WAVE
		icon = 'kaien.dmi'
		icon_state = "Sounds/Aizen/'WAVE"
		density = 1
		layer=16
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=M.loc
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="weakSounds/Aizen/'WAVE"
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = O.reiatsu*2.3
				if(O.marksman>=1)
					damage+=O.level*5
				if(damage < 1)
					damage =rand(25,1000)
				src.loc=M.loc
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Sounds/Aizen/'WAVE for [damage] damage!"
				M.Death(O,damage,pick(0,0,2,3,2,1))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
		Move()
			if(src.beenout)
				new/obj/Sounds/Aizen/'WAVEtrail(src.loc)
			src.beenout=1
			..()
	Sounds/Aizen/'WAVE
		icon = 'kaien.dmi'
		icon_state = "Sounds/Aizen/'WAVE"
		density = 1
		New()
			spawn(10)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=M.loc
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Sounds/Aizen/'WAVE"
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = (O.reiatsu*3) - M.defence
				if(O.marksman>=1)
					damage+=O.level*5
				if(damage < 1)
					damage =rand(25,1000)
				if(M.enemy)
					O.hollowprotection = 1
				src.loc=M.loc
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Sounds/Aizen/'WAVE for [damage] damage!"
				M.Death(O,damage,pick(0,0,2,3,2,1))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
		Move()
			if(src.beenout)
				new/obj/Sounds/Aizen/'WAVEtrail(src.loc)
			src.beenout=1
			..()
obj
	newkaeintrail
		icon='Icons/newkaeinSounds/Aizen/'WAVE.dmi'
		density=1
		layer=16
		New()
			spawn(20)
			src.loc=null

obj
	newkaeinSounds/Aizen/'WAVE
		icon='Icons/newkaeinSounds/Aizen/'WAVE.dmi'
		density=1
		layer=16
		New()
			spawn(10)
			walk(src,0)
			spawn(30)
				if(!isnull(src))
					src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=M.loc
					return
				if(M.ispedal)
					src.loc=M.loc
					return
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Cascada"
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = ((O.reiatsu+O.attack)*2.3)
				if(O.marksman>=1)
					damage+=O.level*6
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Cascada for [damage] damage!"
				src.loc=M.loc
				M.Death(O,damage,pick(0,0,2,3,2,1))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=T.loc
			if(istype(A,/obj/))
				var/obj/T = A
				src.loc=T.loc
		Move()
			if(src.beenout)
				var/obj/a=new/obj/newkaeintrail(src.loc)
				a.dir=src.dir
				a.layer=src.layer
			src.beenout=1
			..()
obj
	cascadatrail
		icon = 'getsuga3.dmi'
		icon_state = "trail"
		density = 1
		layer=16
		New()
			spawn(20)
			src.loc=null
obj
	cascada
		icon = 'getsuga3.dmi'
		icon_state = "water"
		density = 1
		layer=16
		New()
			spawn(10)
			walk(src,0)
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=M.loc
					return
				if(M.ispedal)
					src.loc=M.loc
					return
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Cascada"
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = ((O.reiatsu+O.attack)*2.3) - M.defence /2
				if(O.marksman>=1)
					damage+=O.level*5
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Cascada for [damage] damage!"
				src.loc=M.loc
				M.Death(O,damage,pick(0,0,2,3,2,1))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=T.loc
			if(istype(A,/obj/))
				var/obj/T = A
				src.loc=T.loc
		Move()
			if(src.beenout)
				var/obj/a=new/obj/cascadatrail(src.loc)
				a.dir=src.dir
				a.layer=src.layer
			src.beenout=1
			..()

obj
	hisagitrail
		icon='Icons/fuumashuriken.dmi'
		icon_state="trail"
		New()
			spawn(10)src.loc=null
			..()
obj
	hisagi
		icon = 'fuumashuriken.dmi'
		icon_state = ""
		density = 1
		strong=1
		Del()
			for(var/obj/hisagitrail/k in src.trails)
				if(k.owner == src)
					src.loc=null
			..()
		New()
			spawn(6)
			if(!src.crissing)
				walk_towards(src,src.Gowner,0)
			spawn(18)
			src.loc=null
		Move()
			..()
			if(src.beenout)
				var/obj/hisagitrail/s=new/obj/hisagitrail(src.loc)
				s.dir=src.dir
				s.owner=src
				src.trails+=s
			src.beenout=1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
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
				var/mob/O = src.Gowner
				var/damage = O.attack * 4 - M.defence / 3
				if(O.marksman>=1)
					damage+=O.level*5
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his [O.swordname] for [damage] damage!"
				if(src.chainwrap)
					if(!M.protected)
						view(O,8) << "<b><font color = red>[O] has stunned [M] with his scythe"
						O.Freeze(20)
						M.Freeze(20)
						O.exception=1
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
				if(O.inshikai)
					O.shimastery(2)
				if(O.inbankai)
					O.banmastery(3)
				spawn(1)
				if(!src.crissing)
					walk_towards(src,src.Gowner,0)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					if(!src.crissing)
						walk_towards(src,src.Gowner,0)
			if(istype(A,/obj/))
				if(!src.crissing)
					walk_towards(src,src.Gowner,0)
obj
	ikkakuextendtrail
		icon='Icons/ikkakushikaimove.dmi'
		icon_state="2"
		New()
			spawn(6)src.loc=null
obj
	ikkakuextend
		icon = 'ikkakushikaimove.dmi'
		icon_state = "1"
		density = 1
		strong=1
		Del()
			for(var/obj/ikkakuextendtrail/k in src.trails)
				if(k.owner == src)
					del k
			..()
		New()
			flick("flick",src)
			spawn(3)
				walk_towards(src,src.Gowner,0)
			spawn(6)
			src.loc=null
		Move()
			..()
			var/obj/ikkakuextendtrail/s=new/obj/ikkakuextendtrail(src.loc)
			s.dir=src.dir
			s.owner=src
			src.trails+=s
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
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
				var/mob/O = src.Gowner
				var/damage = O.attack * 3.8
				if(O.marksman>=1)
					damage+=O.level*5
				if(damage < 1)
					damage =rand(25,1000)
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
				if(O.inshikai)
					O.shimastery(1)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/tink=A
				if(tink.Gowner)
					del tink
obj
	tentaclebindt
		icon='Icons/luppiattack.dmi'
		icon_state="trail"
		New()
			spawn(18)
			del src
obj
	tentaclebind
		icon='Icons/luppiattack.dmi'
		icon_state="head"
		density = 1
		strong=1
		Del()
			for(var/obj/tentaclebindt/k in src.trails)
				if(k.owner == src)
					spawn(10)
						del k
			..()
		New()
			spawn(6)
			if(!src.crissing)
				walk_towards(src,src.Gowner,0)
			spawn(18)
				if(!isnull(src))
					src.loc=null
		Move()
			..()
			if(src.beenout)
				var/obj/tentaclebindt/s=new/obj/tentaclebindt(src.loc)
				s.dir=src.dir
				s.owner=src
				src.trails+=s
			src.beenout=1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					return
				if(M.ko)
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
				var/mob/O = src.Gowner
				var/damage = O.attack * 2 - M.defence / 3
				if(O.marksman>=1)
					damage+=O.level*5
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his [O.swordname] for [damage] damage!"
				if(src.chainwrap)
					if(!M.protected&&!M.ko)
						view(O,8) << "<b><font color = red>[O] has grabbed [M] with tentacles"
						O.Freeze(20)
						M.Freeze(20)
						O.exception=1
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
				M.frozen=1
				spawn(50)
					if(!isnull(M))
						M.frozen=0
				if(O.inshikai)
					O.shimastery(2)
				if(O.inbankai)
					O.banmastery(3)
				spawn(1)
				if(!src.crissing)
					walk_towards(src,src.Gowner,0)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					if(!src.crissing)
						walk_towards(src,src.Gowner,0)
			if(istype(A,/obj/))
				if(!src.crissing)
					walk_towards(src,src.Gowner,0)
obj
	tentacletrail
		icon='Icons/luppiattack.dmi'
		icon_state="trail"
		New()
			spawn(15)
			del src
obj
	tentacle
		icon = 'luppiattack.dmi'
		icon_state = "head"
		density = 1
		Del()
			for(var/obj/tentacletrail/k in world)
				if(k.owner == src)
					del k
			..()
		New()
			spawn(5)
			walk_towards(src,src.Gowner,0)
			spawn(10)
			del src
		Move()
			..()
			var/obj/tentacletrail/s=new/obj/tentacletrail(src.loc)
			s.dir=src.dir
			s.owner=src
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					M.frozen=0
					src.loc=null
					return
				if(M.ispedal)
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
				if(M.inoueshield)
					M.inoueshield=0
					view(8) << "<b>[M]: Blood Mist Shield!"
					var/obj/Maf = new/obj/bloodshield(M.loc)
					Maf:owner = M
					M.ShieldCool()
					flick("new",Maf)
					Maf.dir=get_dir(Maf,src)
				if(M.protected==1)src.loc=null
			//	M.wound+=rand(1,3)
				var/mob/O = src.Gowner
				var/damage = O.attack * 2.3 - M.defence
				if(O.marksman>=1)
					damage+=O.level*2
				if(damage < 1)
					damage =rand(25,1000)
				if(M.enemy)
					O.hollowprotection = 1
				src.loc=M.loc
				M.Death(O)
				spawn(1)
				walk_towards(src,src.Gowner,0)
				spawn(2)
				M.Death(O,damage,rand(0,5))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					walk_towards(src,src.Gowner,0)
			if(istype(A,/obj/))
				walk_towards(src,src.Gowner,0)
obj
	tentaclestrail
		icon='Icons/luppiattack.dmi'
		icon_state="trail1"
		New()
			spawn(10)del src
obj
	tentacles
		icon = 'luppiattack.dmi'
		icon_state = "head1"
		density = 1
		Del()
			for(var/obj/tentaclestrail/k in world)
				if(k.owner == src)
					del k
			..()
		New()
			spawn(5)
			walk_towards(src,src.Gowner,0)
			spawn(10)
			del src
		Move()
			..()
			var/obj/tentaclestrail/s=new/obj/tentacletrail(src.loc)
			s.dir=src.dir
			s.owner=src
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					M.frozen=0
					src.loc=null
					return
				if(M.ispedal)
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
				if(M.inoueshield)
					M.inoueshield=0
					view(8) << "<b>[M]: Blood Mist Shield!"
					var/obj/Maf = new/obj/bloodshield(M.loc)
					Maf:owner = M
					M.ShieldCool()
					flick("new",Maf)
					Maf.dir=get_dir(Maf,src)
				if(M.protected==1)src.loc=null
				M.wound+=rand(1,2)
				var/mob/O = src.Gowner
				var/damage = O.attack * 4 - M.defence
				if(O.marksman>=1)
					damage+=O.level*5
				if(damage < 1)
					damage =rand(25,1000)
		//		M.health -= damage
				if(M.enemy)
					O.hollowprotection = 1
				src.loc=M.loc
				M.Death(O)
				spawn(1)
				walk_towards(src,src.Gowner,0)
				spawn(2)
				M.Death(O,damage,rand(3,7))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					walk_towards(src,src.Gowner,0)
			if(istype(A,/obj/))
				walk_towards(src,src.Gowner,0)
obj
	wtornado1
		icon = 'white tornado.dmi'
		icon_state = "0,0"
		layer=17
		pixel_x=-5
		pixel_y=-10
		density = 1
		New()
			new/obj/wtornado2(src.loc)
			new/obj/wtornado3(src.loc)
			new/obj/wtornado4(src.loc)
			spawn(15)
			src.loc=null
obj
	wtornado2
		icon = 'white tornado.dmi'
		icon_state = "1,0"
		layer=17
		pixel_x=27
		pixel_y=-10
		New()
			spawn(15)
			src.loc=null
obj
	wtornado3
		icon = 'white tornado.dmi'
		icon_state = "0,1"
		layer=17
		pixel_y=22
		pixel_x=-5
		New()
			spawn(15)
			src.loc=null
obj
	wtornado4
		icon = 'white tornado.dmi'
		icon_state = "1,1"
		layer=17
		pixel_y=22
		pixel_x=27
		New()
			spawn(15)
			src.loc=null
obj
	wtornado
		icon = 'white tornado.dmi'
		icon_state = "create"
		density = 1
		New()
			spawn(15)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
					return
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Tornado"
					src.loc=null
				var/obj/wtornado1/K=new/obj/wtornado1(M.loc)
				var/mob/O = src.Gowner
				K.Gowner=O
				var/damage = O.attack *3 - M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				src.loc=null
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Bushogoma for [damage] damage!"
				M.Death(O,damage,rand(1,5))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
obj
	tornado1
		icon = 'tornado.dmi'
		icon_state = "0,0"
		layer=17
		pixel_x=-5
		pixel_y=-10
		density = 1
		New()
			new/obj/tornado2(src.loc)
			new/obj/tornado3(src.loc)
			new/obj/tornado4(src.loc)
			spawn(15)
			src.loc=null
obj
	tornado2
		icon = 'tornado.dmi'
		icon_state = "1,0"
		layer=17
		pixel_x=27
		pixel_y=-10
		New()
			spawn(15)
			src.loc=null
obj
	tornado3
		icon = 'tornado.dmi'
		icon_state = "0,1"
		layer=17
		pixel_y=22
		pixel_x=-5
		New()
			spawn(15)
			src.loc=null
obj
	tornado4
		icon = 'tornado.dmi'
		icon_state = "1,1"
		layer=17
		pixel_y=22
		pixel_x=27
		New()
			spawn(15)
			src.loc=null
obj
	tornado
		icon = 'tornado.dmi'
		icon_state = "create"
		density = 1
		New()
			spawn(15)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
					return
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Tornado"
					src.loc=null
				var/obj/tornado1/K=new/obj/tornado1(M.loc)
				var/mob/O = src.Gowner
				K.Gowner=O
				var/damage = O.attack *4.6 - M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				src.loc=null
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Bushogoma for [damage] damage!"
				M.Death(O,damage,rand(1,5))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
/*obj
	oscuracharge
		icon = 'ceroobscura.dmi'
		icon_state = ""
		layer=17
	ceroobscura
		icon = 'ceroobscura.dmi'
		icon_state = "s"
		density = 1
		New()
			src.overlays+=/obj/ceroobscura/c1
			src.overlays+=/obj/ceroobscura/c2
			src.overlays+=/obj/ceroobscura/c3
			src.overlays+=/obj/ceroobscura/c4
			src.overlays+=/obj/ceroobscura/c5
			src.overlays+=/obj/ceroobscura/c6
			src.overlays+=/obj/ceroobscura/ac1
			src.overlays+=/obj/ceroobscura/ac2
			src.overlays+=/obj/ceroobscura/ac3
			src.overlays+=/obj/ceroobscura/ac4
			src.overlays+=/obj/ceroobscura/ac5
			src.overlays+=/obj/ceroobscura/ac6
			src.overlays+=/obj/ceroobscura/aac1
			src.overlays+=/obj/ceroobscura/aac2
			src.overlays+=/obj/ceroobscura/aac3
			src.overlays+=/obj/ceroobscura/aac4
			src.overlays+=/obj/ceroobscura/aac5
			src.overlays+=/obj/ceroobscura/aac6
			src.Cero_Obscura()
			spawn(10)
			src.loc=null
		c1
			icon_state="0,0"
			pixel_y=-32
		c2
			icon_state="1,0"
			pixel_y=-32
			pixel_x=32
		c3
			icon_state="2,0"
			pixel_y=-32
			pixel_x=64
		c4
			icon_state="3,0"
			pixel_y=-32
			pixel_x=96
		c5
			icon_state="4,0"
			pixel_y=-32
			pixel_x=128
		c6
			icon_state="5,0"
			pixel_y=-32
			pixel_x=160
		ac1
			icon_state="0,1"
		ac2
			icon_state="1,1"
			pixel_x=32
		ac3
			icon_state="2,1"
			pixel_x=64
		ac4
			icon_state="3,1"
			pixel_x=96
		ac5
			icon_state="4,1"
			pixel_x=128
		ac6
			icon_state="5,1"
			pixel_x=160
		aac1
			icon_state="0,2"
			pixel_y=32
		aac2
			icon_state="1,2"
			pixel_y=32
			pixel_x=32
		aac3
			icon_state="2,2"
			pixel_y=32
			pixel_x=64
		aac4
			icon_state="3,2"
			pixel_y=32
			pixel_x=96
		aac5
			icon_state="4,2"
			pixel_y=32
			pixel_x=128
		aac6
			icon_state="5,2"
			pixel_y=32
			pixel_x=160
		aaac6
			icon_state="4,3"
			pixel_y=64
			pixel_x=128
obj
	proc
		Cero_Obscura()
			for(var/mob/M in view(0,src))
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
					return
				if(M.inoueshield)
					M.inoueshield=0
					view(8) << "<b>[M]: Blood Mist Shield!"
					var/obj/Maf = new/obj/bloodshield(M.loc)
					Maf:owner = M
					M.ShieldCool()
					flick("new",Maf)
					Maf.dir=get_dir(Maf,src)
				if(M.protected==1)src.loc=null
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Cero Obscura"
					M.cerored=src.ccerored
					M.cerogreen=src.ccerogreen
					M.ceroblue=src.cceroblue
					//M.contents+=src
					//return
					src.loc=null
				M.wound+=rand(1,2)
				var/mob/O = src.Gowner
				var/damage = O.attack * 2 - M.defence / 1.3
				if(damage < 1)
					damage =rand(25,1000)
				M.health -= damage
				view(O,8) << "<b><font color = red>[O] hit [M] with his Cero Obscura for [damage] damage!"
				if(M.enemy)
					O.hollowprotection = 1
				M.Death(O)
				src.loc=null*/
obj
	charge
		layer = 54389573958
		New()
			spawn(5)
			src.loc=null
obj
	getsugaring
		icon = 'getsugaring.dmi'
		icon_state = ""
		density = 1
		New()
			spawn(15)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
					return
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Getsuga Ring"
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = O.reiatsu * 1.4 - M.defence /2
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				src.loc=M.loc
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Getsuga Ring for [damage] damage!"
				M.Death(O,damage,rand(2,3))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
			//	src.loc=null
				src.loc=null
obj
	freezingmary
		icon = 'Ice Cast-MissleProjectile.dmi'
		icon_state = ""
		density = 1
		New()
			spawn(15)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
					return
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Getsuga Ring"
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = O.reiatsu * 1.6 - M.defence /2
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				src.loc=M.loc
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Getsuga Ring for [damage] damage!"
				M.Death(O,damage,rand(2,3))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
			//	src.loc=null
				src.loc=null
obj
	Rasen
		icon = 'fuji barrage.dmi'
		density = 1
		layer=20
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
					return
				var/mob/O = src.Gowner
				var/damage = O.reiatsu * 2.5
				damage+=O.reiatsu
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				src.loc=M.loc
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Getsuga Tenshou for [damage] damage!"
				M.Death(O,damage,rand(1,2))
	//		if(istype(A,/turf/))
	//			var/turf/T = A
	//			if(T.density)
	//				src.loc=null
	//		if(istype(A,/obj/))
	//			if(A!=src.Gowner)
	//				src.loc=null
		Move()
			if(src.beenout)
				var/k = new/obj/Fujibarragetrail(src.loc)
				k:dir = src.dir
			src.beenout=1
			..()
obj
	BlackFlames
		icon='Icons/black flames amat.dmi'
		New()
			spawn(rand(100,150))
			if(!isnull(src))
				src.loc=null
		Cross(atom/O)
			if(ismob(O))
				var/mob/m=O
				m.amated=1
				m.CheckAmat()
				m.overlays+=/obj/amatover
				m.Load_Overlays()
//				if(!m.immunetoflames)
//					m.Death(x,100000,rand(1,10))
			return 1


obj
	yaiba
		icon = 'getsuga.dmi'
		icon_state = ""
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
					return
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Getsuga"
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = (O.attack+O.reiatsu) * 3.5
				damage+=O.reiatsu
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				src.loc=M.loc
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Getsuga Tenshou for [damage] damage!"
				M.Death(O,damage,rand(1,2))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
obj
	ola
		icon = 'getsuga3.dmi'
		icon_state = ""
		density = 1
		New()
			spawn(30)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
					return
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Ola Azul"
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = (O.attack+O.reiatsu)*2 - M.defence / 1.3
				damage+=O.reiatsu
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				src.loc=M.loc
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Ola Azul for [damage] damage!"
				M.Death(O,damage,rand(1,2))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
obj
	SingleNewGetsuga
		icon = '32x32 bankai ichigo getsuga.dmi'
		icon_state = "resized"
		density = 1
		single=1
		New()
			spawn(100)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
/*				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Bala"
					M.cerored=src.ccerored
					M.cerogreen=src.ccerogreen
					M.ceroblue=src.cceroblue
					src.loc=null*/
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
				var/mob/O = src.Gowner
				if(O.enemy&&M.enemy)
					src.loc = M.loc
					return
				var/damage = O.reiatsu * 5 - M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				if(M.ceroback)
					M.absorbcero=1
					src.loc=null
				if(M.enemy)
					O.hollowprotection = 1
				if(M.enemy)
					O.hollowprotection = 1
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,src.DeflectionDirection(),1)
		Move()
			..()

obj
	yaiba1
		icon = 'getsuga.dmi'
		icon_state = "1"
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
					return
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Getsuga"
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = (O.attack+O.reiatsu)* 3.5 - M.defence / 1.3
				damage+=O.reiatsu
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				src.loc=M.loc
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Getsuga Tenshou for [damage] damage!"
				M.Death(O,damage,rand(1,2))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
obj
	yaiba2
		icon = 'getsuga.dmi'
		icon_state = "2"
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
					return
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Getsuga"
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = (O.attack+O.reiatsu) * 3.5 - M.defence / 1.3
				damage+=O.reiatsu
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				src.loc=M.loc
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Getsuga Tenshou for [damage] damage!"
				M.Death(O,damage,rand(1,2))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,src.DeflectionDirection(),1)
					walk(src,kink.OppositeDirection(),1)
obj
	bringerb
		icon = 'getsuga2.dmi'
		icon_state = ""
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
					return
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Bringer Blast"
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = O.attack * 2.8 - M.defence / 1.3
				damage+=O.reiatsu
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				src.loc=M.loc
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Bringer Blast for [damage] damage!"
				M.Death(O,damage,rand(1,2))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null


obj
	bringerb1
		icon = 'getsuga2.dmi'
		icon_state = "1"
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
					return
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Bringer Blast"
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = O.attack * 2.8 - M.defence / 1.3
				damage+=O.reiatsu
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Bringer Blast for [damage] damage!"
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
obj
	bringerb2
		icon = 'getsuga2.dmi'
		icon_state = "2"
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
					return
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Bringer Blast"
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = O.attack * 2.8 - M.defence / 1.3
				damage+=O.reiatsu
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				src.loc=M.loc
				//if(!M.protected)
				//	view(O,8) << "<b><font color = red>[O] hit [M] with his Bringer Blast for [damage] damage!"
				M.Death(O,damage,rand(1,2))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,src.DeflectionDirection(),1)
					walk(src,kink.OppositeDirection(),1)
mob
	LuppiTentacle
		name = "LuppiTentacle"
		icon = 'luppi.dmi'
		icon_state = "head1"
		density = 1
		rundelay = -999
		ispedal = 1
		layer = 30
		New()
			//src.icon_state="[rand(1,6)]"
			spawn(10)
			walk_towards(src,src.owner,0)
			spawn(30)
			src.loc=null
			..()
		Move()
			..()
			for(var/mob/M in view(1,src))
				if(M.loc==src.loc)
					if(istype(M,/mob/LuppiTentacle))
						src.loc=M.loc
						return
					if(M == src.owner)
						src.loc=null
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
					if(!M.protected)Blood(M.x,M.y,M.z)
					var/mob/D = src.owner
					var/damage = D.attack
					if(damage <= 0)
						damage =rand(25,1000)
					//if(!M.protected)
					//	view(D,8) << "<b><font color = red>[D] hit [M] with his shuriken for [damage] damage!"
					M.Death(D,damage,pick(0,0,1,1,2))
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				src.loc = M.loc
			if(istype(A,/obj/))
				var/turf/T = A
				src.loc = T.loc
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					walk_towards(src,src.owner,0)

mob
	Homingfireballs
		name="Pheonix Ball"
		icon='Icons/homing heal version.dmi'
		density=1
		rundelay=-50
		ispedal=1
		layer=30
		New()
			spawn(30)
			src.loc=null
			..()
		Move()
			..()
			for(var/mob/M in view(1,src))
				if(M.loc==src.loc)
					if(istype(M,/mob/Homingfireballs))
						src.loc=M.loc
						return
					if(M == src.owner)
						src.loc=null
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
					if(!M.protected)Blood(M.x,M.y,M.z)
					var/mob/D = src.owner
					var/damage = (D.reiatsu*1.3) - M.defence / 11
					if(damage <= 0)
						damage =rand(25,1000)
					//if(!M.protected)
					//	view(D,8) << "<b><font color = red>[D] hit [M] with his shuriken for [damage] damage!"
					M.Death(D,damage,pick(0,0,1,1,2))
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				src.loc = M.loc
			if(istype(A,/obj/))
				var/turf/T = A
				src.loc = T.loc
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					walk_towards(src,src.owner,0)
mob
	Floatswordhome
		name="Sword"
		icon='Icons/floating sword zan.dmi'
		density=0
		rundelay=-50
		ispedal=1
		layer=30
		New()
			spawn(57)
			src.loc=null
			..()
		Move()
			..()
			for(var/mob/M in view(1,src))
				if(M.loc==src.loc)
					if(istype(M,/mob/Floatswordhome))
						src.loc=M.loc
						return
					if(M == src.owner)
						src.loc=null
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
					if(!M.protected)Blood(M.x,M.y,M.z)
					var/mob/D = src.owner
					var/damage = (D.attack*1.5)
					if(damage <= 0)
						damage =rand(25,1000)
					//if(!M.protected)
					//	view(D,8) << "<b><font color = red>[D] hit [M] with his shuriken for [damage] damage!"
					M.Death(D,damage,pick(0,0,1,1,2))
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				src.loc = M.loc
			if(istype(A,/obj/))
				var/turf/T = A
				src.loc = T.loc
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					walk_towards(src,src.owner,0)
mob
	DeathSounds/Aizen/'WAVE
		name="Death Sounds/Aizen/'WAVE"
		icon='Icons/tracking hit.dmi'
		density=1
		rundelay=-50
		ispedal=1
		layer=30
		New()
			spawn(30)
			src.loc=null
			..()
		Move()
			..()
			for(var/mob/M in view(1,src))
				if(M.loc==src.loc)
					if(istype(M,/mob/DeathSounds/Aizen/'WAVE))
						src.loc=M.loc
						return
					if(M == src.owner)
						src.loc=null
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
					if(!M.protected)Blood(M.x,M.y,M.z)
					var/mob/D = src.owner
					var/damage = (D.attack*1.3) - M.defence / 11
					if(damage <= 0)
						damage =rand(25,1000)
					//if(!M.protected)
					//	view(D,8) << "<b><font color = red>[D] hit [M] with his shuriken for [damage] damage!"
					M.Death(D,damage,pick(0,0,1,1,2))
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				src.loc = M.loc
			if(istype(A,/obj/))
				var/turf/T = A
				src.loc = T.loc
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					walk_towards(src,src.owner,0)
	Devorar
		name="Devorar Pluma"
		icon='Icons/agui feather home.dmi'
		density=1
		rundelay=-50
		ispedal=1
		layer=30
		New()
			spawn(30)
			src.loc=null
			..()
		Move()
			..()
			for(var/mob/M in view(1,src))
				if(M.loc==src.loc)
					if(istype(M,/mob/Devorar))
						src.loc=M.loc
						return
					if(M == src.owner)
						src.loc=null
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
					if(!M.protected)Blood(M.x,M.y,M.z)
					var/mob/D = src.owner
					var/damage = (D.attack+D.reiatsu) - M.defence / 11
					if(damage <= 0)
						damage =rand(25,1000)
					//if(!M.protected)
					//	view(D,8) << "<b><font color = red>[D] hit [M] with his shuriken for [damage] damage!"
					M.Death(D,damage,pick(0,0,1,1,2))
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				src.loc = M.loc
			if(istype(A,/obj/))
				var/turf/T = A
				src.loc = T.loc
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					walk_towards(src,src.owner,0)
mob
	shuriken
		name = "Shurikens"
		icon = 'Z_Jiroubou.dmi'
		icon_state = "thrown"
		density = 1
		rundelay = -50
		ispedal = 1
		layer = 30
		New()
			//src.icon_state="[rand(1,6)]"
			spawn(10)
			walk_towards(src,src.owner,0)
			spawn(30)
			src.loc=null
			..()
		Move()
			..()
			for(var/mob/M in view(1,src))
				if(M.loc==src.loc)
					if(istype(M,/mob/shuriken))
						src.loc=M.loc
						return
					if(M == src.owner)
						src.loc=null
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
					if(!M.protected)Blood(M.x,M.y,M.z)
					var/mob/D = src.owner
					var/damage = D.reiatsu/1.4 - M.defence / 11
					if(damage <= 0)
						damage =rand(25,1000)
					//if(!M.protected)
					//	view(D,8) << "<b><font color = red>[D] hit [M] with his shuriken for [damage] damage!"
					M.Death(D,damage,pick(0,0,1,1,2))
					if(D.inshikai)
						D.shimastery(2)
					if(D.inbankai)
						D.banmastery(2)
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				src.loc = M.loc
			if(istype(A,/obj/))
				var/turf/T = A
				src.loc = T.loc
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					walk_towards(src,src.owner,0)

obj/petalpieces
	layer=30
	up
		icon='Icons/byakuyashikai.dmi'
		icon_state="up"
		pixel_y=32
	down
		icon='Icons/byakuyashikai.dmi'
		icon_state="down"
		pixel_y=-32
	right
		icon='Icons/byakuyashikai.dmi'
		icon_state="right"
		pixel_x=32
	left
		icon='Icons/byakuyashikai.dmi'
		icon_state="left"
		pixel_x=-32
	middle
		icon='Icons/byakuyashikai.dmi'
		icon_state=""
obj
	pedals
		name = "Pedals"
		icon = 'byakuyashikai.dmi'
		icon_state = ""
		density = 0
		ispedals = 1
		layer = 30
		New()
			src.overlays+=/obj/petalpieces/up
			src.overlays+=/obj/petalpieces/down
			src.overlays+=/obj/petalpieces/right
			src.overlays+=/obj/petalpieces/left
			src.random = rand(1,4)
			if(src.random == 1)
				src.icon_state = ""
			if(src.random == 2)
				src.icon_state = "2"
			if(src.random == 3)
				src.icon_state = "3"
			spawn(4)
			src.loc=null
		Move()
			..()
			for(var/mob/M in view(1,src))
				if(M.loc==src.loc)
					if(M == src.Gowner)
						if(M.safezone)
							M.caughtpetal=1
						if(!M.safezone)
							return
					var/mob/D = src.Gowner
					if(!M.protected)
						Blood(M.x,M.y,M.z)
						if(D.inshikai&&D.shikaidrain > 0)
							D.shimastery(1)
						if(D.inbankai&&D.bankaidrain > 0)
							D.banmastery(1)
					var/damage = D.reiatsu*2.5
					if(damage <= 0)
						damage =rand(25,1000)
					M.Death(D,damage,rand(1,1))

obj
 scatterbankai
		icon = 'byakuyashikai.dmi'
		icon_state = "bankai"
		New()
			flick("bankai",src)
			spawn(25)
				var/Q = new/obj/pedals(src.loc)
				Q:Gowner = src.owner
				Q:attack = src.attack
				src.loc=null
//CHECK
 scatterbankai2
		icon = 'byakuyashikai.dmi'
		icon_state = "bankai"
		New()
			flick("bankai",src)
			spawn(25)
				var/Q = new/obj/pedals(src.loc)
				Q:Gowner = src.owner
				Q:attack = src.attack
				var/G = new/obj/pedals(src.loc)
				G:Gowner = src.owner
				G:attack = src.attack
				src.loc=null
obj/smokepieces
	layer=30
	up
		icon='Icons/smoke.dmi'
		icon_state="up"
		pixel_y=32
	down
		icon='Icons/smoke.dmi'
		icon_state="down"
		pixel_y=-32
	right
		icon='Icons/smoke.dmi'
		icon_state="right"
		pixel_x=32
	left
		icon='Icons/smoke.dmi'
		icon_state="left"
		pixel_x=-32
	mid
		icon='Icons/smoke.dmi'
		icon_state=""
		layer=30
obj
	smoke
		name = "Smoke"
		icon = 'smoke.dmi'
		icon_state = ""
		layer = 30
		New()
			src.overlays+=/obj/smokepieces/up
			src.overlays+=/obj/smokepieces/down
			src.overlays+=/obj/smokepieces/right
			src.overlays+=/obj/smokepieces/left
			spawn(4)
			src.loc=null
		Move()
			..()
			for(var/mob/M in view(1,src))
				if(M.loc==src.loc)
					if(M == src.Gowner)
						if(M.safezone)
							M.caughtpetal=1
						if(!M.safezone)
							return
					var/mob/D = src.Gowner
					if(!M.protected)
						Blood(M.x,M.y,M.z)
						if(D.inshikai&&D.shikaidrain > 0)
							D.shimastery(1)
						if(D.inbankai&&D.bankaidrain > 0)
							D.banmastery(1)
					var/damage = D.attack*3.5 - M.defence / 3
					if(damage <= 0)
						damage =rand(25,1000)
					M.Death(D,damage,rand(0,3))

mob
 Bump(A)
		if(ismob(A))
			var/mob/M = A
			if(M.issmoke||M.ispedal)
				usr.loc = M.loc

obj
 smokebankai
		icon = 'smoke.dmi'
		icon_state = "bankai"
		New()
			flick("bankai",src)
			spawn(25)
				var/Q = new/obj/smoke(src.loc)
				Q:owner = src.owner
				Q:attack = src.attack
				src.loc=null
//CHECK
 smokebankai2
		icon = 'smoke.dmi'
		icon_state = "bankai"
		New()
			flick("bankai",src)
			spawn(25)
				var/G = new/obj/smoke(src.loc)
				G:owner = src.owner
				G:attack = src.attack
				src.loc=null
obj
 var
		attack
//CHECK
//CHECK
obj
	Petalsword
		icon = 'byakuyashikai.dmi'
		icon_state = "sword"
		density = 1
		layer = 100
		New()
			spawn(4)
			src.loc=null
			spawn(1)
			for(var/mob/M in view(0,src))
				var/mob/O = src.Gowner
				if(M == src.Gowner)
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
				var/damage=(O.reiatsu*3.7)-M.defence
				if(damage<1)
					damage=1
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Petal Sword for [damage]!"
				M.Death(O,damage,rand(5,6))
obj
	//matsuricopy
	Pink_Mugetsu
		icon = 'Pink mugetsu.dmi'
		icon_state = "mugetsu"
		density = 1
		layer = 100
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				var/mob/O = src.Gowner
				if(M == src.Gowner)
					src.loc=M.loc
					return
				if(M.ispedal)
					src.loc=M.loc
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
				M.health -= 45000
				M.wound+=5
				src.loc = M.loc
				view(O,8) << "<b><font color = red>[O] hit [M] with his Mugetsu!"
				if(M.fgetsugas||M.demons)
					M.health=1
					view(M,8) << "<b><font color = aqua>[M.name]:</b><font color=red> I'm immune to that skill!"
					return
				M.Death(O,1,rand(1,2))
			if(istype(A,/turf/))
				var/turf/T = A
				src.loc=locate(T.x,T.y,T.z)
			if(istype(A,/obj/))
				var/obj/T = A
				src.loc = T.loc
		Move()
			if(src.beenout)
				var/k = new/obj/Mugetsutrail(src.loc)
				k:dir = src.dir
			src.beenout=1
			..()
	//end matsuricopy
	Mugetsu
		icon = 'finalgetsugablack.dmi'
		icon_state = "mugetsu"
		density = 1
		layer = 100
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				var/mob/O = src.Gowner
				if(M == src.Gowner)
					src.loc=M.loc
					return
				if(M.ispedal)
					src.loc=M.loc
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
				M.health = 0
				M.wound+=30
				src.loc = M.loc
				view(O,8) << "<b><font color = red>[O] hit [M] with his Mugetsu!"
				if(M.fgetsugas||M.demons)
					M.health=1
					view(M,8) << "<b><font color = aqua>[M.name]:</b><font color=red> I'm immune to that skill!"
					return
				M.Death(O,1,rand(1,2))
			if(istype(A,/turf/))
				var/turf/T = A
				src.loc=locate(T.x,T.y,T.z)
			if(istype(A,/obj/))
				var/obj/T = A
				src.loc = T.loc
		Move()
			if(src.beenout)
				var/k = new/obj/Mugetsutrail(src.loc)
				k:dir = src.dir
			src.beenout=1
			..()
	FujiBankaiM
		icon='Icons/fuji bankai attk.dmi'
		icon_state="mid"
		density=1
		layer=50
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				var/mob/O = src.Gowner
				if(M == src.Gowner)
					src.loc=M.loc
					return
				if(M.ispedal)
					src.loc=M.loc
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
				var/damage=O.reiatsu*2
				damage-=M.defence
				if(damage<1)damage=1
				src.loc = M.loc
				//view(O,8) << "<b><font color = red>[O] hit [M] with his Kendo for [damage]!"
				M.Death(O,damage,rand(1,4))
			if(istype(A,/turf/))
				var/turf/T = A
				src.loc=locate(T.x,T.y,T.z)
			if(istype(A,/obj/))
				var/obj/T = A
				src.loc = T.loc
		Move()
			if(src.beenout)
				var/k = new/obj/FujiBankaiMT(src.loc)
				k:dir = src.dir
			src.beenout=1
			..()
	FujiBankaiR
		icon='Icons/fuji bankai attk.dmi'
		icon_state="right"
		density=1
		layer=50
		New()
			spawn(25)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				var/mob/O = src.Gowner
				if(M == src.Gowner)
					src.loc=M.loc
					return
				if(M.ispedal)
					src.loc=M.loc
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
				var/damage=O.reiatsu*2
				damage-=M.defence
				if(damage<1)damage=1
				src.loc = M.loc
				//view(O,8) << "<b><font color = red>[O] hit [M] with his Kendo for [damage]!"
				M.Death(O,damage,rand(1,4))
			if(istype(A,/turf/))
				var/turf/T = A
				src.loc=locate(T.x,T.y,T.z)
			if(istype(A,/obj/))
				var/obj/T = A
				src.loc = T.loc
		Move()
			if(src.beenout)
				var/k = new/obj/FujiBankaiRT(src.loc)
				k:dir = src.dir
			src.beenout=1
			..()
	FujiBankaiL
		icon='Icons/fuji bankai attk.dmi'
		icon_state="left"
		density=1
		layer=50
		New()
			spawn(25)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				var/mob/O = src.Gowner
				if(M == src.Gowner)
					src.loc=M.loc
					return
				if(M.ispedal)
					src.loc=M.loc
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
				var/damage=O.reiatsu*2
				damage-=M.defence
				if(damage<1)damage=1
				src.loc = M.loc
				//view(O,8) << "<b><font color = red>[O] hit [M] with his Kendo for [damage]!"
				M.Death(O,damage,rand(1,4))
			if(istype(A,/turf/))
				var/turf/T = A
				src.loc=locate(T.x,T.y,T.z)
			if(istype(A,/obj/))
				var/obj/T = A
				src.loc = T.loc
		Move()
			if(src.beenout)
				var/k = new/obj/FujiBankaiLT(src.loc)
				k:dir = src.dir
			src.beenout=1
			..()
	Kendo
		icon = 'finalgetsugablack.dmi'
		icon_state = "kendo"
		density = 1
		layer = 100
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				var/mob/O = src.Gowner
				if(M == src.Gowner)
					src.loc=M.loc
					return
				if(M.ispedal)
					src.loc=M.loc
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
				var/damage=O.attack*6.5
				damage-=M.defence
				if(damage<1)damage=1
				src.loc = M.loc
				//view(O,8) << "<b><font color = red>[O] hit [M] with his Kendo for [damage]!"
				M.Death(O,damage,rand(3,7))
			if(istype(A,/turf/))
				var/turf/T = A
				src.loc=locate(T.x,T.y,T.z)
			if(istype(A,/obj/))
				var/obj/T = A
				src.loc = T.loc
		Move()
			if(src.beenout)
				var/k = new/obj/Kendotrail(src.loc)
				k:dir = src.dir
			src.beenout=1
			..()
obj
	pinkbyaku
		icon = 'pinkbyaku.dmi'
		icon_state = ""
		density = 1
		layer = 100
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
					return
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="PinkByaku"
					src.loc=null
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
				var/mob/O = src.Gowner
				var/damage = O:reiatsu * 2.5- M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				src.loc = M.loc
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Hana Byakurai for [damage] damage!"
				M.Death(O,damage,rand(1,2),1)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/T = A
				src.loc = T.loc
		Move()
			if(src.beenout)
				var/k = new/obj/pinkbyakutrail(src.loc)
				k:dir = src.dir
			src.beenout=1
			..()
	/*dragontrail
		icon = 'dragon.dmi'
		icon_state = "trail"
		density = 0
		layer = 40
		New()
			spawn(30)
			src.loc=null
	dragon
		icon = 'dragon.dmi'
		icon_state = "blast"
		density = 1
		layer = 40
		New()
			spawn(30)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
					return
				if(M.inoueshield)
					M.inoueshield=0
					view(8) << "<b>[M]: Blood Mist Shield!"
					var/obj/Maf = new/obj/bloodshield(M.loc)
					Maf:owner = M
					M.ShieldCool()
					flick("new",Maf)
					Maf.dir=get_dir(Maf,src)
				if(M.protected==1)src.loc=null
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Dragon Blast"
					src.loc=null
				M.wound+=rand(1,2)
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
				var/mob/O = src.Gowner
				var/damage = O:reiatsu * 2.5- M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				M.health -= damage
				src.loc = M.loc
				view(O,8) << "<b><font color = red>[O] hit [M] with his Dragon Blast for [damage] damage!"
				if(M.enemy)
					O.hollowprotection = 1
				M.Death(O)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/T = A
				src.loc = T.loc
		Move()
			var/k = new/obj/dragontrail(src.loc)
			k:dir = src.dir
			..()*/


mob
 var
		tmp/devilwait = 0

obj
 pinkbyakutrail
		layer = 100
		icon = 'pinkbyaku.dmi'
		icon_state = "trail"
		zer = 1
		New()
			spawn(20)
			src.loc=null
obj
 Mugetsutrail
		layer = 100
		icon = 'finalgetsugablack.dmi'
		icon_state = "trail"
		zer = 1
		New()
			spawn(20)
			src.loc=null
obj
 powerblasttrail
		layer = 100
		icon = 'new sado blast.dmi'
		icon_state = "trail"
		zer = 1
		New()
			spawn(20)
			src.loc=null
obj
 Kendotrail
		layer = 100
		icon = 'finalgetsugablack.dmi'
		icon_state = "kendotrail"
		zer = 1
		New()
			spawn(20)
			src.loc=null
obj
 Fujibarragetrail
		layer = 100
		icon = 'fuji barrage.dmi'
		icon_state = "trail"
		zer = 1
		New()
			spawn(20)
			src.loc=null
obj
	FujiBankaiLT
		layer = 100
		icon = 'fuji bankai attk.dmi'
		icon_state = "left"
		zer = 1
		New()
			spawn(25)
			src.loc=null
obj
	FujiBankaiRT
		layer = 100
		icon = 'fuji bankai attk.dmi'
		icon_state = "right"
		zer = 1
		New()
			spawn(25)
			src.loc=null
obj
	FujiBankaiMT
		layer = 100
		icon = 'fuji bankai attk.dmi'
		icon_state = "mid"
		zer = 1
		New()
			spawn(25)
			src.loc=null
/*
obj
	Click()
		if(usr.safe)return
		for(var/mob/monster/K in view(8,usr))
			if(K.myclone == usr)
				walk_towards(K,src,0)
		if(usr.coffin)
			if(istype(src, /obj/hud/))
				return
			usr.Make_Coffin(src)
			return
		for(var/mob/shuriken/K in view(8,usr))
			if(K.owner == usr)
				walk_towards(K,src,0)
		*/
mob/var/tmp
	dhealactive=0
	healingkidoactive=0
	healkidocd=0
	dhealcd=0
	aoehealcd=0

mob
	Click()
		if(usr.safe)return
		if(usr.ressurectiontype=="Zommari")
			for(var/mob/D in view(8,usr))
				if(D.controller==usr)
					walk_towards(D,src.loc,0)
		for(var/mob/monster/K in view(8,usr))
			if(K.myclone == usr)
				K.aggrod=0
				K.Aggro(src)
				usr<<"You tell monsters to attack"
		if(usr.senkei&&usr.stype=="Byakuya")
			if(!usr.ko&&!usr.senkeicool)
				var/obj/senkeisword/D=new/obj/senkeisword(locate(src.x,src.y,src.z))
				D.Gowner=usr
				usr.SenkeiCool()
		if(usr.coffin)
			usr.Make_Coffin(src)
			return
		if(usr.coffin)
			usr.Make_Coffin(src)
			return
		if(usr.fulldanku)
			usr.Make_Danku(src)
			return
		if(usr.inosh)
			if(!src.ko)
				if(src in view(usr))
					usr.inosh=0
					var/obj/d=new/obj/inoueheal(locate(src.x,src.y,src.z))
					d.Gowner=usr
		if(usr.dhealactive)
			if(!src.ko)
				if(src in view(usr))
					usr.dhealactive=0
					var/obj/d=new/obj/dungeonaoeheal(locate(src.x,src.y,src.z))
					d.Gowner=usr
					d.overlays += new/obj/Heal_Aura/aoe00
					d.overlays += new/obj/Heal_Aura/aoe10
					d.overlays += new/obj/Heal_Aura/aoe20
					d.overlays += new/obj/Heal_Aura/aoe30
					d.overlays += new/obj/Heal_Aura/aoe01
					d.overlays += new/obj/Heal_Aura/aoe11
					d.overlays += new/obj/Heal_Aura/aoe21
					d.overlays += new/obj/Heal_Aura/aoe31
					d.overlays += new/obj/Heal_Aura/aoe02
					d.overlays += new/obj/Heal_Aura/aoe12
					d.overlays += new/obj/Heal_Aura/aoe22
					d.overlays += new/obj/Heal_Aura/aoe32
					d.overlays += new/obj/Heal_Aura/aoe03
					d.overlays += new/obj/Heal_Aura/aoe13
					d.overlays += new/obj/Heal_Aura/aoe23
					d.overlays += new/obj/Heal_Aura/aoe33

		if(usr.healingkidoactive)
			if(!src.ko)
				if(src in view(usr))
					usr.healingkidoactive=0
					var/obj/d=new/obj/kidocorpheal(locate(src.x,src.y,src.z))
					d.Gowner=usr
		for(var/mob/shuriken/K in view(8,usr))
			if(K.owner == usr)
				walk_towards(K,src.loc,0)
turf
 Click()
		if(usr.safe&&usr.z!=25)return
		for(var/mob/monster/K in view(8,usr))
			if(K.myclone == usr)
				walk_towards(K,src,0)
		if(usr.ressurectiontype=="Zommari")
			for(var/mob/D in view(8,usr))
				if(D.controller==usr)
					walk_towards(D,src,0)
		if(usr.inbankai)
			if(usr.stype == "Renji")
				for(var/mob/zabimaru/K in view(8,usr))
					if(K.owner == usr)
						walk_towards(K,src,0)
		if(usr.senkei&&usr.stype=="Byakuya")
			if(!usr.ko&&!usr.senkeicool)
				var/obj/senkeisword/D=new/obj/senkeisword(locate(src.x,src.y,src.z))
				D.Gowner=usr
				usr.SenkeiCool()
		if(usr.coffin)
			usr.Make_Coffin(src)
			return
		if(usr.waterbolt)
			if(!isnull(src))//waterboltruntime
				usr.Make_Water_Ball(src)
		if(usr.lightnbolt)
			usr.Make_Lightn_Bolt(src)
		if(usr.firebolt)
			usr.Make_Fire_Bolt(src)
			return
		if(usr.fulldanku)
			usr.Make_Danku(src)
			return
		if(usr.flashstep)
				sleep(0.5 SECONDS)
			if(usr.ko)
				return
			if(usr.frozen)
				return
			if(usr.controlled)
				usr<< "<b>You can't control your movements!"
				return
			if(usr.rundelay > 2)
				return
			if(usr.flags)
				return
			var/d=get_dist(usr,src)
			if(d>8||d==0)return
			if(src.z!=usr.z)return
			if(usr.controlbug)
				return
			if(usr.ikkakubankai)
				return
			if(usr.stype=="Kommamaru"&&usr.inbankai)
				return
			if(usr.gotthecharge&&usr.incr)return
			if(!usr.shun)
				/*if(usr.flashuse>2000)
					var/obj/h=new/obj/craters/begin(usr.loc)
					h.dir=usr.dir*/
				if(usr.charging)
					usr.charging=0
					usr.reiatsu-=round(round(usr.mreiatsu/50)*usr.charge)
					usr.attack-=round(round(usr.mattack/50)*usr.charge)
				//	src.defence-=round(round(src.mdefence/50)*src.charge)
					usr.charge=0
				if(usr.rei<100)
					usr<<"<b>You need at least 100 rei"
					return
				usr.rei-=100
				if(usr.race == "Shinigami"||usr.race == "Vaizard")
					if(usr.stype == "Ichigo"&&usr.inbankai||usr.stype == "Stinger"||usr.stype=="Fujimaru")
						var/obj/afterImage = new /obj()
						afterImage.layer = MOB_LAYER
						afterImage.icon=usr.icon
						afterImage.icon_state=usr.icon_state
						afterImage.overlays=usr.overlays
						afterImage.underlays = usr.underlays
						afterImage.dir=usr.dir
						afterImage.loc = usr.loc
						afterImage.zer = 1
						spawn(6)	flick("shun",afterImage)
						spawn(10)	del(afterImage)
						usr.shun = 1
						usr.shunning=1
						usr.Move(src)
						if(usr.flashuse >= 100)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
						if(usr.flashuse >= 200)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
						if(usr.flashuse >= 300)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
						usr.flashuse += 1
						if(usr.flashuse == 30||usr.flashuse == 60||usr.flashuse == 90||usr.flashuse == 120||usr.flashuse == 150||usr.flashuse == 180||usr.flashuse == 210||usr.flashuse == 240||usr.flashuse == 270)
							usr << "<b>Your flash step ability increased!"
							usr.flashpause-=10
						if(usr.flashuse == 300)
							usr.flashpause-=5
							world << "<b><font color = lime>Ability Info: [usr] has mastered his flash step!"
							usr.contents+=new/obj/skillcard/Flashing_Attack
							world << "<b><font color = lime>Ability Info: [usr] has learned Flashing Attack!"
						usr.shunning=0
						if(usr.flashpause-20<=10)
							usr.flashpause=10
						if(usr.flashuse==15000)
							AwardMedal("Shunpo Master", usr)
						sleep(usr.flashpause-10)
						if(usr)
							usr.shun = 0
					else
						var/obj/afterImage = new /obj()
						afterImage.layer = MOB_LAYER
						afterImage.icon=usr.icon
						afterImage.icon_state=usr.icon_state
						afterImage.overlays=usr.overlays
						afterImage.underlays = usr.underlays
						afterImage.dir=usr.dir
						afterImage.loc = usr.loc
						afterImage.zer = 1
						flick("shun",afterImage)
						spawn(4)	del(afterImage)
						usr.shun = 1
						usr.shunning=1
						flick("shun",usr)
						step_towards(usr,src)
						usr.moving = 0
						if(usr.flashuse<300)
							step_towards(usr,src)
							usr.moving = 0
							step_towards(usr,src)
							usr.moving = 0
							step_towards(usr,src)
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							step_towards(usr,src)
							if(usr.flashuse >= 100)
								step_towards(usr,src)
								usr.moving = 0
							if(usr.flashuse >= 200)
								step_towards(usr,src)
								var/ak =new/obj/afterimage(usr.loc)
								ak:dir = usr.dir
								usr.moving = 0
						if(usr.flashuse >= 300)
							usr.Move(src)
							usr.moving=0
						usr.flashuse += 1
						if(usr.flashuse == 30||usr.flashuse == 60||usr.flashuse == 90||usr.flashuse == 120||usr.flashuse == 150||usr.flashuse == 180||usr.flashuse == 210||usr.flashuse == 240||usr.flashuse == 270)
							usr << "<b>Your flash step ability increased!"
							usr.flashpause-=10
						if(usr.flashuse == 300)
							usr.flashpause-=5
							world << "<b><font color = lime>Ability Info: [usr] has mastered his flash step!"
							usr.contents+=new/obj/skillcard/Flashing_Attack
							world << "<b><font color = lime>Ability Info: [usr] has learned Flashing Attack!"
						usr.shunning=0
						sleep(usr.flashpause)
						if(usr)
							usr.shun = 0
				if(usr.race=="Sado"||usr.race=="Quincy"||usr.race=="Fullbringer"||usr.race=="Arrancar"||usr.race=="Hollow")
					if(usr.race == "Fullbringer")
						new/obj/afterimage3(usr.loc)
					if(usr.race != "Fullbringer")
						var/obj/afterImage = new /obj()
						afterImage.layer = MOB_LAYER
						afterImage.icon=usr.icon
						afterImage.icon_state=usr.icon_state
						afterImage.overlays=usr.overlays
						afterImage.underlays = usr.underlays
						afterImage.dir=usr.dir
						afterImage.loc = usr.loc
						afterImage.zer = 1
						flick("shun",afterImage)
						spawn(4)	del(afterImage)
					usr.shun = 1
					usr.shunning=1
					flick("shun",usr)
					step_towards(usr,src)
					usr.moving = 0
					step_towards(usr,src)
					usr.moving = 0
					step_towards(usr,src)
					usr.moving = 0
					step_towards(usr,src)
					usr.shun = 1
					flick("shun",usr)
					usr.Move(src)
					if(usr.flashuse >= 100)
						usr.Move(src)
						usr.moving = 0
					if(usr.flashuse >= 200)
						usr.Move(src)
						usr.moving = 0
					if(usr.flashuse >= 300)
						usr.Move(src)
						usr.moving = 0
					usr.flashuse += 1
					if(usr.race == "Fullbringer")
						new/obj/afterimage3(usr.loc)
					if(usr.flashuse == 30||usr.flashuse == 60||usr.flashuse == 90||usr.flashuse == 120||usr.flashuse == 150||usr.flashuse == 180||usr.flashuse == 210||usr.flashuse == 240||usr.flashuse == 270)
						usr << "<b>Your flash step ability increased!"
						usr.flashpause-=10
					if(usr.flashuse == 300)
						usr.flashpause-=5
						world << "<b><font color = lime>Ability Info: [usr] has mastered his flash step!"
						usr.contents+=new/obj/skillcard/Flashing_Attack
						world << "<b><font color = lime>Ability Info: [usr] has learned Flashing Attack!"
					usr.shunning=0
					sleep(usr.flashpause)
					if(usr)
						usr.shun = 0
obj
	frozen
		icon = 'frozen.dmi'
		icon_state = ""
		density = 0
		layer=28
		New()
			flick("flick",src)
			spawn(1)
			for(var/mob/M in view(0,src))
				if(M == src.Gowner)
					src.loc=null
					return
				var/mob/O = src.Gowner
				if(O.enemy&&M.enemy)
					return
				var/damage = O.reiatsu * 2 - M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
					//view(O,8) << "<b><font color = red>[O] froze [M] for [damage] damage!"
				M.Death(O,damage,rand(6,7))
			spawn(30)
			src.loc=null
		Del()
			flick("del",src)
			spawn(4)
			..()
	burning
		icon = 'Fs.dmi'
		icon_state = ""
		density = 0
		layer=28
		New()
			flick("fire",src)
			spawn(1)
			for(var/mob/M in view(0,src))
				if(M == src.Gowner)
					src.loc=null
					return
				var/mob/O = src.Gowner
				if(O.enemy&&M.enemy)
					return
				var/damage = O.reiatsu * 3.4 - M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] burned [M] for [damage] damage!"
				M.Death(O,damage,rand(6,7))
			spawn(10)
			src.loc=null
	burning2
		icon = 'turf_water.dmi'
		icon_state = "trans"
		density = 0
		layer=28
		New()
			flick("trans",src)
			spawn(1)
			for(var/mob/M in view(0,src))
				if(M == src.Gowner)
					src.loc=null
					return
				var/mob/O = src.Gowner
				if(O.enemy&&M.enemy)
					return
				var/damage = O.reiatsu * 3.4 - M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] burned [M] for [damage] damage!"
				M.Death(O,damage,rand(6,7))
			spawn(10)
			src.loc=null
obj
	darts
		icon = 'darts.dmi'
		icon_state = ""
		density = 1
		New()
			spawn(10)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				var/mob/O = src.Gowner
				if(O.enemy&&M.enemy)
					src.loc = M.loc
					return
				var/damage = O.attack * 4
				damage-= M.defence/1.3
				if(damage < 1)
					damage =rand(25,1000)
				src.loc=null
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his dart for [damage] damage!"
				M.Death(O,damage,rand(2,3))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,src.DeflectionDirection(),1)
					walk(src,kink.OppositeDirection(),1)
		Move()
			..()
	dart
		icon = 'cirucci.dmi'
		icon_state = "one"
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(M.inoueshield)
					M.inoueshield=0
					view(8) << "<b>[M]: Blood Mist Shield!"
					var/obj/Maf = new/obj/bloodshield(M.loc)
					Maf:owner = M
					M.ShieldCool()
					flick("new",Maf)
					Maf.dir=get_dir(Maf,src)
				if(M.protected==1)src.loc=null
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
				M.wound+=rand(2,3)
				Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				if(O.enemy&&M.enemy)
					src.loc = M.loc
					return
				var/damage = O.attack * 1.5 - M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				M.health -= damage
				if(M.enemy)
					O.hollowprotection = 1
				view(O,8) << "<b><font color = red>[O] hit [M] with his dart for [damage] damage!"
				if(M.enemy)
					O.hollowprotection = 1
				M.Death(O)
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,src.DeflectionDirection(),1)
					walk(src,kink.OppositeDirection(),1)
		Move()
			..()
obj
	Yumi
		icon = 'Yumibankai.dmi'
		density = 1
		New()
			spawn(7)
			walk(src,0)
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Yumi"
					src.loc=null
				var/mob/O = src.Gowner
				if(O.enemy&&M.enemy)
					src.loc = M.loc
					return
				var/damage = O.reiatsu * 3 - M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
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
				O.rei+=round(M.mrei/2)
				O.wound-=2
				O.health+=round(M.mrei)
				if(O.rei>O.mrei*2)O.rei=O.mrei*2
				if(O.health>O.mhealth*2)O.health=O.mhealth*2
				var/yumidrain=round(M.rei/4)
				M.DrainRei(O,yumidrain)
				if(M.rei<0)M.rei=0
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Ruri'iro Kujaku for [damage] damage!"
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/T= A
				if(T.density)
					walk(src,0)
		Move()
			for(var/mob/M in view(0,src))
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Yumi"
					src.loc=null
				var/mob/O = src.Gowner
				if(O.enemy&&M.enemy)
					src.loc = M.loc
					return
				var/damage = O.reiatsu * 2 - M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
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
				O.rei+=round(M.mrei/2)
				O.wound-=2
				O.health+=round(M.mrei)
				if(O.rei>O.mrei*2)O.rei=O.mrei*2
				if(O.health>O.mhealth*2)O.health=O.mhealth*2
				var/draineded=round(M.mrei/2)
//				M.rei-=round(M.mrei/2)
				M.DrainRei(O,draineded)
				if(M.rei<0)M.rei=0
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his [O.swordname] for [damage] damage!"
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
			var/K = new/obj/Yumi(src.loc)
			K:dir = src.dir
			..()
	ocero
		icon = 'CERO.dmi'
		icon_state = "Start"
		density = 1
		New()
			spawn(1)
				step(src,src.dir)
				step(src,src.dir)
				step(src,src.dir)
			spawn(2)
				step(src,src.dir)
				step(src,src.dir)
				step(src,src.dir)
			spawn(3)
				step(src,src.dir)
				step(src,src.dir)
				step(src,src.dir)
			spawn(30)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
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
				var/mob/O = src.Gowner
				if(!O)src.loc=null
				if(O.enemy&&M.enemy)
					src.loc = M.loc
					return
				var/damage = O.reiatsu * 6.8
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Cero"
					//M.contents+=src
					//return
					src.loc=null
				if(M.ceroback)
					M.absorbcero=1
					src.loc=null
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
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Cero for [damage] damage!"
				src.loc=null
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
		Move()
			if(src.beenout)
				var/obj/K = new/obj/ocerotrail(src.loc)
				K:dir = src.dir
				K.icon=src.icon
			src.beenout=1
			//if(!src.head)K.icon_state="head";src.head=1
			..()
	raihou
		icon = 'hado 88.dmi'
		icon_state = "Start"
		density = 1
		New()
			spawn(1)
				step(src,src.dir)
				step(src,src.dir)
				step(src,src.dir)
			spawn(2)
				step(src,src.dir)
				step(src,src.dir)
				step(src,src.dir)
			spawn(3)
				step(src,src.dir)
				step(src,src.dir)
				step(src,src.dir)
			spawn(30)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
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
				var/mob/O = src.Gowner
				if(!O)src.loc=null
				if(O.enemy&&M.enemy)
					src.loc = M.loc
					return
				var/damage = O.reiatsu * 4.8
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Byakurai"
					//M.contents+=src
					//return
					src.loc=null
				if(M.ceroback)
					M.absorbcero=1
					src.loc=null
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
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Cero for [damage] damage!"
				src.loc=null
				M.Death(O,damage,rand(1,2),1)
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
		Move()
			if(src.beenout)
				var/obj/K = new/obj/raihoutrail(src.loc)
				K:dir = src.dir
				K.icon=src.icon
			src.beenout=1
			//if(!src.head)K.icon_state="head";src.head=1
			..()
	cero
		icon = 'ceronew.dmi'
		icon_state = ""
		density = 1
		New()
			spawn(30)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
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
				var/mob/O = src.Gowner
				if(!O)src.loc=null
				if(O)
					if(O.enemy&&M.enemy)
						src.loc = M.loc
						return
				var/damage = O.reiatsu * 3.7 - M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Cero"
					M.cerocolor=O.cerocolor
					//M.contents+=src
					//return
					src.loc=null
				if(M.ceroback)
					M.absorbcero=1
					src.loc=null
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
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Cero for [damage] damage!"
				src.loc=null
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
		Move()
			if(src.beenout)
				var/obj/K = new/obj/cerotrail(src.loc)
				K:dir = src.dir
				K.icon=src.icon
			src.beenout=1
			//if(!src.head)K.icon_state="head";src.head=1
			..()
	cerodoble
		icon = 'ceronew.dmi'
		icon_state = ""
		density = 1
		New()
			spawn(30)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(!isnull(src.Gowner))
					if(M == src.Gowner)
						src.loc=null
						return
				if(M.ispedal)
					src.loc=null
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
				var/mob/O = src.Gowner
				if(O.enemy&&M.enemy)
					src.loc = M.loc
					return
				var/damage = O.attack * 3.3 - M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Cero"
					M.cerocolor=O.cerocolor
					//M.contents+=src
					//return
					src.loc=null
				if(M.ceroback)
					M.absorbcero=1
					src.loc=null
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
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Cero for [damage] damage!"
				src.loc=null
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
		Move()
			if(src.beenout)
				var/obj/K = new/obj/cerotrail(src.loc)
				K:dir = src.dir
				K.icon=src.icon
			src.beenout=1
			//if(!src.head)K.icon_state="head";src.head=1
			..()
	cyclone
		icon = 'wind.dmi'
		icon_state = "bird"
		density = 1
		layer=10
		New()
			spawn(15)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				var/mob/O = src.Gowner
				if(O.enemy&&M.enemy)
					src.loc = M.loc
					return
				var/damage = O.attack * 2 - M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
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
				src.loc=null
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Cyclone Attack for [damage] damage!"
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
		Move()
			if(src.beenout)
				var/K = new/obj/cyclonetrail(src.loc)
				K:dir = src.dir
			src.beenout=1
			..()
	weakcero
		icon = 'ceronew.dmi'
		icon_state = ""
		density = 1
		New()
			spawn(1)
			step(src,src.dir)
			spawn(2)
				step(src,src.dir)
				step(src,src.dir)
			spawn(3)
				step(src,src.dir)
				step(src,src.dir)
			spawn(4)
				step(src,src.dir)
				step(src,src.dir)
			spawn(5)
				step(src,src.dir)
				step(src,src.dir)
			spawn(6)
				step(src,src.dir)
				step(src,src.dir)
			spawn(7)
				step(src,src.dir)
				step(src,src.dir)
			spawn(8)
				step(src,src.dir)
				step(src,src.dir)
			spawn(9)
				step(src,src.dir)
				step(src,src.dir)
			spawn(10)
				step(src,src.dir)
				step(src,src.dir)
			spawn(11)
				step(src,src.dir)
				step(src,src.dir)
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				var/mob/O = src.Gowner
				if(O.enemy&&M.enemy)
					src.loc = M.loc
					return
				var/damage = O.reiatsu * 2.5 - M.defence/2
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Cero"
					M.cerored=src.ccerored
					M.cerogreen=src.ccerogreen
					M.ceroblue=src.cceroblue
					//M.contents+=src
					//return
					src.loc=null
				if(M.ceroback)
					M.absorbcero=1
					src.loc=null
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
				src.loc=null
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Cero for [damage] damage!"
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,src.DeflectionDirection(),1)
					walk(src,kink.OppositeDirection(),1)
		Move()
			if(src.beenout)
				var/obj/K = new/obj/cerotrail(src.loc)
				K:dir = src.dir
				K:icon=src.icon
			src.beenout=1
			//if(!src.head)K.icon_state="head";src.head=1
			..()
	bluefirebarrage
		icon = 'blue fire barrage.dmi'
		icon_state = "head"
		density = 1
		New()
			spawn(1)
			step(src,src.dir)
			spawn(2)
				step(src,src.dir)
				step(src,src.dir)
			spawn(3)
				step(src,src.dir)
				step(src,src.dir)
			spawn(4)
				step(src,src.dir)
				step(src,src.dir)
			spawn(5)
				step(src,src.dir)
				step(src,src.dir)
			spawn(6)
				step(src,src.dir)
				step(src,src.dir)
			spawn(7)
				step(src,src.dir)
				step(src,src.dir)
			spawn(8)
				step(src,src.dir)
				step(src,src.dir)
			spawn(9)
				step(src,src.dir)
				step(src,src.dir)
			spawn(10)
				step(src,src.dir)
				step(src,src.dir)
			spawn(11)
				step(src,src.dir)
				step(src,src.dir)
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				var/mob/O = src.Gowner
				if(O.enemy&&M.enemy)
					src.loc = M.loc
					return
				var/damage = O.attack * 3 - M.defence/2
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Cero"
					M.cerored=src.ccerored
					M.cerogreen=src.ccerogreen
					M.ceroblue=src.cceroblue
					//M.contents+=src
					//return
					src.loc=null
				if(M.ceroback)
					M.absorbcero=1
					src.loc=null
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
				src.loc=null
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Cero for [damage] damage!"
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,src.DeflectionDirection(),1)
					walk(src,kink.OppositeDirection(),1)
		Move()
			if(src.beenout)
				var/obj/K = new/obj/cerotrail222(src.loc)
				K:dir = src.dir
				K:icon=src.icon
			src.beenout=1
			//if(!src.head)K.icon_state="head";src.head=1
			..()

	craters/smoke
		icon = 'craterseries.dmi'
		icon_state = "smoke"
		density = 1
		New()
			new/obj/craters/begin(src.loc)
			spawn(5)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				var/mob/O = src.Gowner
				if(O.enemy&&M.enemy)
					src.loc = M.loc
					return
				var/damage = O.attack + (M.defence*0.8)
				damage+=rand(damage/2,damage)
				if(damage < 1)
					damage =rand(25,1000)
				spawn()M.Aggro(src.Gowner)
				src.loc=null
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] for [damage] damage!"
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,src.DeflectionDirection(),1)
					walk(src,kink.OppositeDirection(),1)
		Move()
			var/K = new/obj/craters/rammed(src.loc)
			K:dir = src.dir
			..()
obj/craters
	mouse_opacity=0
obj
	craters/begin
		icon = 'craterseries.dmi'
		icon_state = "begin"
		density = 0
		New()
			..()
			spawn(30)
			src.loc=null
obj
	wind
		icon = 'wind.dmi'
		density = 0
		New()
			spawn(10)
			src.loc=null
		Move()
			if(src.beenout)
				var/obj/Ov = new/obj/windtrail(src.loc)
				Ov:icon_state = "[src.icon_state]trail"
				Ov.density=1
				Ov:dir = src.dir
			src.beenout=1
			..()
			for(var/obj/Danku/D in view(0,src))
				src.loc=null
			for(var/mob/M in view(0,src))
				if(M == src.Gowner)
					src.loc=M.loc
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Wind"
					src.loc=null
				if(M.soccer)
					M.soccer=0
					M.Load_Overlays()
					var/obj/soccerball/s=new/obj/soccerball(src.loc)
					s.icon_state="fire"
					walk(s,src.dir,0)
					spawn(3)
						s.icon_state=""
						walk(s,0)
						if(s.dir==NORTH)s.dir=SOUTH
				var/mob/O = src.Gowner
				var/damage = O.reiatsu * 3.2- M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Tenran for [damage] damage!"
				M.Death(O,damage,rand(1,2),1)
	ccero
		icon = 'cero2.dmi'
		density = 1
		New()
			spawn(15)
			src.loc=null
		Move()
			if(src.beenout)
				var/obj/Ov = new/obj/ccerotrail(src.loc)
				Ov:icon_state = "[src.icon_state]trail"
				Ov:dir = src.dir
				Ov:icon=src.icon
			src.beenout=1
			..()
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(!isnull(M))//ccero runtime
					if(M == src.Gowner)
						src.loc=null
						return
					if(M.ispedal)
						src.loc=M.loc
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
					var/mob/O = src.Gowner
					if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
						M.Absorbtime()
						M.absorb="Gran Rey Cero"
						M.cerocolor=O.cerocolor
						src.loc=null
					if(M.soccer)
						M.soccer=0
						M.Load_Overlays()
						var/obj/soccerball/s=new/obj/soccerball(src.loc)
						s.icon_state="fire"
						walk(s,src.dir,0)
						spawn(3)
							s.icon_state=""
							walk(s,0)
							if(s.dir==NORTH)s.dir=SOUTH
					var/damage = O.reiatsu * 6- M.defence
					if(damage < 1)
						damage =rand(25,1000)
					if(M.chadref)
						var/K = new/obj/reflection(M.loc)
						K:attack = damage
						K:dir = M.dir
						K:Gowner = M
						walk(K,M.dir)
						src.loc=null
					if(M.ceroback)
						M.absorbcero=1
						src.loc=null
					//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Cero for [damage] damage!"
					src.loc=M.loc
					M.Death(O,damage,rand(1,2))
				if(istype(A,/turf/))
					var/turf/T = A
					src.loc=T.loc
				if(istype(A,/obj/))
					var/obj/T = A
					if(istype(T,/obj/Danku/))
						src.loc=null
					src.loc=T.loc
	baboonblasttrail
		icon = 'renjibankaimove.dmi'
		layer=30
		New()
			spawn(10)
			src.loc=null
	baboonblast
		icon = 'renjibankaimove.dmi'
		density = 0
		layer=30
		New()
			spawn(20)
			src.loc=null
		Move()
			var/obj/Ov = new/obj/baboonblasttrail(src.loc)
			Ov:icon_state = "[src.icon_state]trail"
			Ov.density=1
			Ov:dir = src.dir
			..()
			for(var/mob/M in view(0,src))
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=M.loc
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Baboon Blast"
					src.loc=null
				if(M.soccer)
					M.soccer=0
					M.Load_Overlays()
					var/obj/soccerball/s=new/obj/soccerball(src.loc)
					s.icon_state="fire"
					walk(s,src.dir,0)
					spawn(3)
						s.icon_state=""
						walk(s,0)
						if(s.dir==NORTH)s.dir=SOUTH
				var/mob/O = src.Gowner
				var/damage = O.attack * 6- M.defence
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Baboon Blast for [damage] damage!"
				M.Death(O,damage,rand(1,2))
	cceros
		icon = 'ceros.dmi'
		density = 1
		New()
			spawn(2)
				step(src,src.dir)
			spawn(3)
				step(src,src.dir)
			spawn(4)
				step(src,src.dir)
			spawn(5)
				step(src,src.dir)
			spawn(6)
				step(src,src.dir)
			spawn(7)
				step(src,src.dir)
			spawn(8)
				step(src,src.dir)
			spawn(9)
				step(src,src.dir)
			spawn(10)
				step(src,src.dir)
			spawn(11)
				step(src,src.dir)
			spawn(20)
			src.loc=null
		Bump(A)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,src.DeflectionDirection(),1)
		Move()
			var/obj/Ov = new/obj/ccerostrail(src.loc)
			Ov:icon_state = "trail[src.icon_state]"
			Ov.density=1
			Ov:dir = src.dir
			Ov.icon=src.icon
			..()
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=M.loc
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
				var/mob/O = src.Gowner
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Cero"
					M.cerocolor=O.cerocolor
					src.loc=null
				if(M.soccer)
					M.soccer=0
					M.Load_Overlays()
					var/obj/soccerball/s=new/obj/soccerball(src.loc)
					s.icon_state="fire"
					walk(s,src.dir,0)
					spawn(3)
						s.icon_state=""
						walk(s,0)
						if(s.dir==NORTH)s.dir=SOUTH
				var/damage = O.reiatsu * 4.3- M.defence
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				if(M.ceroback)
					M.absorbcero=1
					src.loc=null
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Cero for [damage] damage!"
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
			if(istype(A,/turf/))
				var/turf/T = A
				src.loc=T.loc
			if(istype(A,/obj/))
				var/obj/T = A
				src.loc=T.loc
	ccerose1
		icon='Icons/Explosions.dmi'
		icon_state="0,0"
		layer=MOB_LAYER+4
		pixel_x=-16
		pixel_y=-16
		New()
			spawn(12)
			src.loc=null
	ccerose2
		icon='Icons/Explosions.dmi'
		icon_state="1,0"
		layer=MOB_LAYER+4
		pixel_x=16
		pixel_y=-16
		New()
			spawn(12)
			src.loc=null
	ccerose3
		icon='Icons/Explosions.dmi'
		icon_state="0,1"
		layer=MOB_LAYER+4
		pixel_x=-16
		pixel_y=16
		New()
			spawn(12)
			src.loc=null
	ccerose4
		icon='Icons/Explosions.dmi'
		icon_state="1,1"
		layer=MOB_LAYER+4
		pixel_x=16
		pixel_y=16
		New()
			spawn(12)
			src.loc=null
	weakwolf
		icon = 'wolf.dmi'
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
			if(istype(A,/mob/player))
				var/mob/M=A
				var/mob/O=src.Gowner
				var/obj/ccerose/k=new/obj/ccerose(M.loc)
				k.ccerored=O.cerored
				k.ccerogreen=O.cerogreen
				k.cceroblue=O.ceroblue
				k.Gowner=src.Gowner
				if(M == src.Gowner)
					return
				if(M.ispedal)
					src.loc=null
					return
				var/damage = O.reiatsu * 2.5- M.defence
				if(damage < 1)
					damage =rand(25,1000)
				src.loc=null
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Cero wolf for [damage] damage!"
				M.Death(O,damage,rand(1,2))
				src.loc=null
		Move()
			..()
			for(var/mob/M in view(1,src))//get_step(src,src.dir)
				var/mob/O=src.Gowner
				if(M == src.Gowner)
					return
				var/obj/ccerose/k=new/obj/ccerose(M.loc)
				k.ccerored=O.cerored
				k.ccerogreen=O.cerogreen
				k.cceroblue=O.ceroblue
				k.Gowner=src.Gowner
				if(M.ispedal)
					src.loc=null
					return
				var/damage = O.reiatsu * 2.5- M.defence
				if(damage < 1)
					damage =rand(25,1000)
				src.loc=null
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Cero wolf for [damage] damage!"
				M.Death(O,damage,rand(1,2))
				src.loc=null
	wolf
		icon = 'wolf.dmi'
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
			if(istype(A,/mob/player))
				var/mob/M=A
				var/mob/O=src.Gowner
				var/obj/ccerose/k=new/obj/ccerose(M.loc)
				k.ccerored=O.cerored
				k.ccerogreen=O.cerogreen
				k.cceroblue=O.ceroblue
				k.Gowner=src.Gowner
				if(M == src.Gowner)
					return
				if(M.ispedal)
					src.loc=null
					return
				if(prob(M.instinct*5))
					var/remember=M.dir
					src.loc=M.loc
					if(src.y==M.y)
						var/kd=pick(1,2)
						if(kd==1)step(M,NORTH);M.dir=remember
						if(kd==2)step(M,SOUTH);M.dir=remember
					if(src.x==M.x)
						var/ka=pick(1,2)
						if(ka==1)step(M,WEST);M.dir=remember
						if(ka==2)step(M,EAST);M.dir=remember
					else
						var/f=pick(1,2,3,4)
						if(f==1)step(M,WEST);M.dir=remember
						if(f==2)step(M,EAST);M.dir=remember
						if(f==3)step(M,NORTH);M.dir=remember
						if(f==4)step(M,SOUTH);M.dir=remember
					return
				var/damage = O.reiatsu * 4- M.defence
				if(damage < 1)
					damage =rand(25,1000)
				src.loc=null
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Cero wolf for [damage] damage!"
				M.Death(O,damage,rand(1,2))
				src.loc=null
		Move()
			..()
			for(var/mob/M in view(1,src))//get_step(src,src.dir)
				var/mob/O=src.Gowner
				if(M == src.Gowner)
					return
				var/obj/ccerose/k=new/obj/ccerose(M.loc)
				k.ccerored=O.cerored
				k.ccerogreen=O.cerogreen
				k.cceroblue=O.ceroblue
				k.Gowner=src.Gowner
				if(M.ispedal)
					src.loc=null
					return
				var/damage = O.reiatsu * 4- M.defence
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Cero wolf for [damage] damage!"
				src.loc=null
				M.Death(O,damage,rand(1,2))
				src.loc=null
	ccerose
		density = 0
		New()
			spawn(12)
			src.loc=null
			var/obj/k=new/obj/ccerose1(src.loc)
			var/obj/ka=new/obj/ccerose2(src.loc)
			var/obj/ks=new/obj/ccerose3(src.loc)
			var/obj/kd=new/obj/ccerose4(src.loc)
			spawn(1)
				var/mob/O=src.Gowner
				if(O.cerocolor=="Red")
					k.icon='Icons/Explosionsred.dmi'
					ka.icon='Icons/Explosionsred.dmi'
					ks.icon='Icons/Explosionsred.dmi'
					kd.icon='Icons/Explosionsred.dmi'
				if(O.cerocolor=="Blue")
					k.icon='Icons/Explosionsblue.dmi'
					ka.icon='Icons/Explosionsblue.dmi'
					ks.icon='Icons/Explosionsblue.dmi'
					kd.icon='Icons/Explosionsblue.dmi'
				if(O.cerocolor=="Green")
					k.icon='Icons/Explosionsgreen.dmi'
					ka.icon='Icons/Explosionsgreen.dmi'
					ks.icon='Icons/Explosionsgreen.dmi'
					kd.icon='Icons/Explosionsgreen.dmi'
				if(O.cerocolor=="Yellow")
					k.icon='Icons/Explosionsyellow.dmi'
					ka.icon='Icons/Explosionsyellow.dmi'
					ks.icon='Icons/Explosionsyellow.dmi'
					kd.icon='Icons/Explosionsyellow.dmi'
obj
	Shoen
		icon = 'Shoen.dmi'
		density = 0
		layer= 20
		New()
			spawn(15)
			src.loc=null
obj
	fireball
		icon = 'fireball.dmi'
		icon_state = ""
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Fireball"
					//M.contents+=src
					//return
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = O.reiatsu * 4- M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				src.loc=M.loc
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Shakkahou for [damage] damage!"
				M.Death(O,damage,rand(2,4))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(src,kink.DeflectionDirection(),1)
	shakkahou
		icon = 'shakkahou.dmi'
		icon_state = ""
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Shakkahou"
					//M.contents+=src
					//return
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = O.reiatsu * 3.5
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				src.loc=M.loc
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Shakkahou for [damage] damage!"
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(src,kink.DeflectionDirection(),1)
obj
	soukatsui
		icon = 'soukatsui.dmi'
		icon_state = ""
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				var/mob/O = src.Gowner
				var/damage = O.reiatsu * 3
				if(damage < 1)
					damage =rand(25,1000)
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Soukatsui"
					src.loc=null
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				src.loc=M.loc
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Soukatsui for [damage] damage!"
				M.Death(O,damage,rand(1,2),1)
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(src,kink.DeflectionDirection(),1)

	adjlobo
		icon = 'blankbase.dmi'
		density = 1
		New()
			src.overlays+=/obj/lobo/Lobo1
			src.overlays+=/obj/lobo/Lobo2
			src.overlays+=/obj/lobo/Lobo3
			src.overlays+=/obj/lobo/Lobo4
			spawn(30)
			src.loc=null
		Bump(A)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
			if(istype(A,/mob/player))
				var/mob/M=A
				var/mob/O=src.Gowner
				var/obj/lobo/Lobo1/k=new/obj/lobo/Lobo1(M.loc)
				k.ccerored=O.cerored
				k.ccerogreen=O.cerogreen
				k.cceroblue=O.ceroblue
				k.Gowner=src.Gowner
				if(M == src.Gowner)
					return
				if(M.ispedal)
					src.loc=null
					return
				if(prob(M.instinct*5))
					var/remember=M.dir
					src.loc=M.loc
					if(src.y==M.y)
						var/kd=pick(1,2)
						if(kd==1)step(M,NORTH);M.dir=remember
						if(kd==2)step(M,SOUTH);M.dir=remember
					if(src.x==M.x)
						var/ka=pick(1,2)
						if(ka==1)step(M,WEST);M.dir=remember
						if(ka==2)step(M,EAST);M.dir=remember
					else
						var/f=pick(1,2,3,4)
						if(f==1)step(M,WEST);M.dir=remember
						if(f==2)step(M,EAST);M.dir=remember
						if(f==3)step(M,NORTH);M.dir=remember
						if(f==4)step(M,SOUTH);M.dir=remember
					return
				var/damage = O.reiatsu * 3- M.defence
				if(damage < 1)
					damage =rand(25,1000)
				src.loc=null
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Cero wolf for [damage] damage!"
				M.Death(O,damage,rand(1,2))
				src.loc=null
		Move()
			..()
			for(var/mob/M in view(1,src))//get_step(src,src.dir)
				var/mob/O=src.Gowner
				if(M == src.Gowner)
					return
				var/obj/ccerose/k=new/obj/ccerose(M.loc)
				k.ccerored=O.cerored
				k.ccerogreen=O.cerogreen
				k.cceroblue=O.ceroblue
				k.Gowner=src.Gowner
				if(M.ispedal)
					src.loc=null
					return
				var/damage = O.reiatsu * 4- M.defence
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Cero wolf for [damage] damage!"
				src.loc=null
				M.Death(O,damage,rand(1,2))
				src.loc=null
obj/lobo
	icon='Icons/cut up new lobo.dmi'
	Lobo1
		icon_state="1"
		pixel_x=-16
		New()
//			new/obj/lobo/Lobo2(src.loc)
//			new/obj/lobo/Lobo3(src.loc)
//			new/obj/lobo/Lobo4(src.loc)
			spawn(30)
			src.loc=null
	Lobo2
		icon_state="2"
		pixel_x=16
		New()
			spawn(30)
			src.loc=null
	Lobo3
		icon_state="3"
		pixel_y=32
		pixel_x=-16
		layer=25
		New()
			spawn(30)
			src.loc=null
	Lobo4
		icon_state="4"
		pixel_y=32
		pixel_x=16
		layer=25
		New()
			spawn(30)
			src.loc=null

obj
	shuriken
		icon = 'shuriken.dmi'
		icon_state = ""
		density = 1
		New()
			spawn(30)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(!M.protected)Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = O.attack / 1.5
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				src.loc=M.loc
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Shuriken for [damage] damage!"
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,src.DeflectionDirection(),1)
					walk(src,kink.OppositeDirection(),1)
	senkeisword
		icon = 'senkei.dmi'
		density = 1
		layer=17
		pixel_x=-16
		s1
			icon = 'senkei1.dmi'
			pixel_x=16
		s2
			icon = 'senkei2.dmi'
			pixel_x=-16
			pixel_y=32
		s3
			icon = 'senkei3.dmi'
			pixel_x=16
			pixel_y=32
		New()
			src.overlays+=/obj/senkeisword/s1
			src.overlays+=/obj/senkeisword/s2
			src.overlays+=/obj/senkeisword/s3
			spawn(1)
				flick("hit",src)
				for(var/mob/M in view(0,src))
					if(M == src.Gowner)
						src.loc=null
						return
					if(M.ispedal)
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
					if(!M.protected)Blood(M.x,M.y,M.z)
					var/mob/O = src.Gowner
					var/damage = round(O.attack*5 - M.defence/3,1)
					if(damage < 1)
						damage =rand(25,1000)
					//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Senkei for [damage] damage!"
					if(M.enemy)
						O.hollowprotection = 1
					M.Death(O,damage,rand(1,2))
			spawn(14)
			src.loc=null

	ccerotrail
		icon = 'cero2.dmi'
		layer = 9
		density=1
		zer = 1
		New()
			spawn(10)
			src.loc=null
	cyclonetrail
		icon = 'wind.dmi'
		icon_state="trail"
		layer = 23
		zer = 1
		New()
			spawn(20)
			src.loc=null
	windtrail
		icon = 'wind.dmi'
		icon_state=""
		layer = 23
		zer = 1
		New()
			spawn(10)
			src.loc=null
	ccerostrail
		icon = 'ceros.dmi'
		layer = 23
		zer = 1
		New()
			spawn(20)
			src.loc=null
	cerotrail
		icon = 'ceronew.dmi'
		icon_state = "trail"
		zer = 1
		layer = 23
		New()
			spawn(10)
			src.loc=null
	cerotrail222
		icon = 'blue fire barrage.dmi'
		icon_state = "trail"
		zer = 1
		layer = 23
		New()
			spawn(10)
			src.loc=null
	ocerotrail
		icon = 'CERO.dmi'
		icon_state = "trail"
		zer = 1
		layer = 23
		New()
			spawn(10)
			src.loc=null
	raihoutrail
		icon = 'hado 88.dmi'
		icon_state = "trail"
		zer = 1
		layer = 23
		New()
			spawn(10)
			src.loc=null
obj
	desgarrontrail
		icon = 'desgarron.dmi'
		icon_state = "trail"
		density = 1
		New()
			spawn(8)
			src.loc=null
obj
	desgarron
		icon = 'desgarron.dmi'
		icon_state = ""
		density = 1
		New()
			var/obj/K = new/obj/craters/begin(src.loc)
			K.dir=src.dir
			spawn(10)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
					return
				if(prob(M.instinct*5))
					var/remember=M.dir
					if(src.y==M.y)
						src.loc=M.loc
						var/k=pick(1,2)
						if(k==1)step(M,NORTH);M.dir=remember
						if(k==2)step(M,SOUTH);M.dir=remember
					if(src.x==M.x)
						src.loc=M.loc
						var/k=pick(1,2)
						if(k==1)step(M,WEST);M.dir=remember
						if(k==2)step(M,EAST);M.dir=remember
					else
						src.loc=M.loc
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
				if(!M.protected)Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = round(O.reiatsu * 2.7 - (M.defence/1.4) )
				damage+=round(O.attack * 2.7 - (M.defence/1.4))
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his desgarron for [damage] damage!"
				src.loc = M.loc
				M.Death(O,damage,rand(1,2))
				if(!M.npc)
					if(src)
						var/dirold = M.dir
						M.allowmove=1
						step(M,src.dir)
						M.allowmove=0
						M.dir = dirold
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,kink.OppositeDirection(),1)
		Move()
			if(src.beenout)
				var/K = new/obj/craters/rammed(src.loc)
				K:dir = src.dir
				var/sK = new/obj/desgarrontrail(src.loc)
				sK:dir = src.dir
			src.beenout=1
			..()
	spear1
		icon = 'Nell.dmi'
		icon_state = "front spear throw"
		density = 1
		New()
			spawn(1)
				var/obj/K = new/obj/craters/begin(src.loc)
				K.dir=src.dir
			spawn(20)
			src.loc=null
		Move()
			var/K = new/obj/craters/rammed(src.loc)
			K:dir = src.dir
			..()
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=M.loc
					return
				if(M.ispedal)
					src.loc=M.loc
					step_away(M,src,1)
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
				if(!M.protected)Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = round(O.attack * 3 - M.defence )
				if(damage < 1)
					damage =rand(25,1000)
				src.loc=M.loc
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his spear for [damage] damage!"
				M.Death(O,damage,rand(1,2))
				if(!M.npc)
					if(src)
						var/dirold = M.dir
						step(M,src.dir)
						M.dir = dirold
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					src.loc=kink.loc
	spear2
		icon = 'Nell.dmi'
		icon_state = "mid spear throw"
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=M.loc
					return
				if(M.ispedal)
					src.loc=M.loc
					step_away(M,src,1)
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
				if(!M.protected)Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = round(O.attack * 2.5 - M.defence )
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his spear for [damage] damage!"
				if(M.enemy)
					O.hollowprotection = 1
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
				if(!M.npc)
					if(src)
						var/dirold = M.dir
						step(M,src.dir)
						M.dir = dirold
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/turf/T = A
				src.loc=T.loc
	spear3
		icon = 'Nell.dmi'
		icon_state = "back spear throw"
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=M.loc
					return
				if(M.ispedal)
					src.loc=M.loc
					step_away(M,src,1)
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
				if(!M.protected)Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = round(O.attack * 2.5 - M.defence )
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his spear for [damage] damage!"
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
				if(!M.npc)
					if(src)
						var/dirold = M.dir
						step(M,src.dir)
						M.dir = dirold
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/turf/T = A
				src.loc=T.loc
obj
	arrowrapid
		icon = 'quincyarrowrapid.dmi'
		icon_state = ""
		density = 1
		single=1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
					return
				if(isnull(M))
					src.loc=null
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

				if(!M.protected)Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = round(O.reiatsu*1.5 - M.defence / 2.5)
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his arrow for [damage] damage!"
				src.loc = M.loc
				M.Death(O,damage,rand(1,2))
				spawn(1)
					if(!M.npc)
						if(src)
							var/dirold = M.dir
							step(M,src.dir)
							M.dir = dirold
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,src.ReverseDeflectionDirection(),1)
					walk(src,kink.OppositeDirection(),1)
		Move()
			..()
obj/KidoZag
	icon='Icons/BlastAqua.dmi'
	density = 1
	single=1
	New()
		spawn(100)
		src.loc=null
	Bump(A)
		if(ismob(A))
			var/mob/M = A
			if(M == src.Gowner)
				src.loc=null
				return
			if(M.ispedal)
				src.loc=null
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
			var/mob/O = src.Gowner
			if(O.enemy&&M.enemy)
				src.loc = M.loc
				return
			var/damage = O.reiatsu * 3 - M.defence / 2
			if(damage < 1)
				damage =rand(25,1000)
			if(M.chadref)
				var/K = new/obj/reflection(M.loc)
				K:attack = damage
				K:dir = M.dir
				K:Gowner = M
				walk(K,M.dir)
				src.loc=null
			if(M.ceroback)
				M.absorbcero=1
				src.loc=null
			if(M.enemy)
				O.hollowprotection = 1
			if(M.enemy)
				O.hollowprotection = 1
			src.loc=M.loc
			M.Death(O,damage,rand(1,2))
			src.loc=null
		if(istype(A,/turf/))
			var/turf/T = A
			if(T.density)
				src.loc=null
		if(istype(A,/obj/))
			var/obj/kink = A
			if(kink.Gowner)
				walk(kink,src.DeflectionDirection(),1)
	Move()
		..()
obj
	arrow
		icon = 'quincyarrow.dmi'
		icon_state = ""
		density = 1
		single=1
		New()
			spawn(1)
				var/mob/O=src.Gowner
				if(O.zigzag)
					src.ZigZag()
				if(O.speedy)
					src.Speedy()
				/*if(O.splita&&src.split==0)
					src.split=1
					src.attack+=src.attack*1.5
					src.SplitArrow()*/
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = round(src.attack / 1.25 - M.defence / 2.5)
				if(damage < 1)
					damage =rand(25,1000)
				if(O.blinding)
					if(!M.protected)M.Blinded()
				if(O.slow)
					if(!M.protected)M.Slowed()
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his arrow for [damage] damage!"
				src.loc = M.loc
				M.Death(O,damage,rand(1,2))
				spawn(3)
					if(M)
						if(!M.npc)
							if(src)
								var/dirold = M.dir
								step(M,src.dir)
								M.dir = dirold
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					if(istype(T,/turf/Soul_Society/))
						T.Break(src)
					if(istype(T,/turf/Soul_Society2/))
						T.Break(src)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.single)
					walk(kink,src.ReverseDeflectionDirection(),1)
					walk(src,kink.OppositeDirection(),1)
				else
					src.loc=null
		Move()
			for(var/mob/o in oview(1,src))
				if(o.mayuri)
					var/k=pick(1,2,3)
					if(k==3)
						if(src.dir==NORTH||src.dir==SOUTH)
							step(o,pick(WEST,EAST),1)
						if(src.dir==EAST||src.dir==WEST)
							step(o,pick(NORTH,SOUTH),1)
			//new/obj/arrowtrail(src.loc)
			for(var/obj/s in view(0,src))
				if(s.Gowner && s.sp==1)
					s.sp=2
					var/image/I = image('silverstands.dmi',s)  //make an image attached to usr
					usr << I
					var/mob/j=src.Gowner
					j.spren+=1
					j<<"You got [j.spren], [5-j.spren] more to go!"
					if(j.spren>=5)
						j<<"<b>Press F to activate this move!"
			..()
obj
	darksword
		icon = 'dark throw.dmi'
		icon_state = "Throw"
		density = 1
		New()
			spawn(1)
				step(src,src.dir)
			spawn(2)
				step(src,src.dir)
				step(src,src.dir)
			spawn(3)
				step(src,src.dir)
				step(src,src.dir)
			spawn(4)
				step(src,src.dir)
				step(src,src.dir)
			spawn(5)
				step(src,src.dir)
				step(src,src.dir)
			spawn(6)
				step(src,src.dir)
				step(src,src.dir)
			spawn(7)
				step(src,src.dir)
				step(src,src.dir)
			spawn(8)
				step(src,src.dir)
				step(src,src.dir)
			spawn(9)
				step(src,src.dir)
				step(src,src.dir)
			spawn(10)
				step(src,src.dir)
				step(src,src.dir)
			spawn(11)
				step(src,src.dir)
				step(src,src.dir)
		//		src.loc=null
				if(!isnull(src))
					src.loc=null
		Del()
			for(var/mob/uid in view(8,src))
				if(uid.client)//
					Quake_Effect(uid,20,1)
					uid.client.DE_SFL_DUqexplode()//
			for(var/mob/id in view(6,src))
				if(id!=src.Gowner)
					if(!id.ko)
						var/mob/O = src.Gowner
						var/damage = round(O.reiatsu * 8.2) - id.defence / 2.5
						if(damage < 1)
							damage =rand(25,1000)
						if(!id.protected)view(O,8) << "<b><font color = red>[O] hit [id] with his Lanza Del Relampago explosion!"
						spawn()id.Death(O,damage,rand(1,2))
						if(!id.npc)
							if(src)
								var/dirold = id.dir
								step(id,src.dir)
								id.dir = dirold
			src.loc=null
			sleep(1)
			..()
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=M.loc
					return
				if(M.ispedal)
					src.loc=M.loc
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
				if(M.inoueshield)
					M.inoueshield=0
					view(8) << "<b>[M]: Blood Mist Shield!"
					var/obj/Maf = new/obj/bloodshield(M.loc)
					Maf:owner = M
					M.ShieldCool()
					flick("new",Maf)
					Maf.dir=get_dir(Maf,src)
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Lanza"
					src.loc=null
					src.loc=null
				if(M.protected==1)src.loc=null
				if(M.soccer)
					M.soccer=0
					M.Load_Overlays()
					var/obj/soccerball/s=new/obj/soccerball(src.loc)
					s.icon_state=""
					walk(s,src.dir,0)
				del src
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,src.DeflectionDirection(),1)
					walk(src,kink.OppositeDirection(),1)
	ulqsword
		icon = 'Z_Ulq.dmi'
		icon_state = "Throw"
		density = 1
		New()
			spawn(1)
			step(src,src.dir)
			spawn(2)
				step(src,src.dir)
				step(src,src.dir)
			spawn(3)
				step(src,src.dir)
				step(src,src.dir)
			spawn(4)
				step(src,src.dir)
				step(src,src.dir)
			spawn(5)
				step(src,src.dir)
				step(src,src.dir)
			spawn(6)
				step(src,src.dir)
				step(src,src.dir)
			spawn(7)
				step(src,src.dir)
				step(src,src.dir)
			spawn(8)
				step(src,src.dir)
				step(src,src.dir)
			spawn(9)
				step(src,src.dir)
				step(src,src.dir)
			spawn(10)
				step(src,src.dir)
				step(src,src.dir)
			spawn(11)
				step(src,src.dir)
				step(src,src.dir)
		//		src.loc=null
				if(!isnull(src))
					src.loc=null
		Del()
			for(var/mob/uid in view(8,src))
				if(uid.client)//
					Quake_Effect(uid,20,1)
					uid.client.DE_SFL_Uqexplode()//
			for(var/mob/id in view(6,src))
				if(id!=src.Gowner)
					if(!id.ko)
						var/mob/O = src.Gowner
						var/damage = round(O.reiatsu * 8.8) - id.defence / 2.5
						if(damage < 1)
							damage =rand(25,1000)
						if(!id.protected)view(O,8) << "<b><font color = red>[O] hit [id] with his Lanza Del Relampago explosion!"
						spawn()id.Death(O,damage,rand(1,2))
						if(!id.npc)
							if(src)
								var/dirold = id.dir
								step(id,src.dir)
								id.dir = dirold
			src.loc=null
			sleep(1)
			..()
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=M.loc
					return
				if(M.ispedal)
					src.loc=M.loc
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
				if(M.inoueshield)
					M.inoueshield=0
					view(8) << "<b>[M]: Blood Mist Shield!"
					var/obj/Maf = new/obj/bloodshield(M.loc)
					Maf:owner = M
					M.ShieldCool()
					flick("new",Maf)
					Maf.dir=get_dir(Maf,src)
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Lanza"
					src.loc=null
					src.loc=null
				if(M.protected==1)src.loc=null
				if(M.soccer)
					M.soccer=0
					M.Load_Overlays()
					var/obj/soccerball/s=new/obj/soccerball(src.loc)
					s.icon_state=""
					walk(s,src.dir,0)
				del src
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,src.DeflectionDirection(),1)
					walk(src,kink.OppositeDirection(),1)
obj
 arrowtrail
		icon = 'redarrow.dmi'
		icon_state = "trail"
		zer = 1
		New()
			spawn(5)
			src.loc=null
obj
 redarrowtrail
		icon = 'quincyarrow.dmi'
		icon_state = "trail"
		zer = 1
		New()
			spawn(5)
			src.loc=null
obj
	seele
		icon = 'silverseeleshoot.dmi'
		icon_state = ""
		density = 1
		New()
			spawn(35)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
					src.loc=null
				Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = round((O.reiatsu * 4.5) / 1.25 - M.defence / 2.5)
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
					src.loc=null
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

obj
 seeletrail
		icon = 'silverseeleshoot.dmi'
		icon_state = "trail"
		zer = 1
		New()
			spawn(15)
			src.loc=null
obj
	haizen
		icon = 'silverslash.dmi'
		icon_state = ""
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
					return
				if(prob(M.instinct*5))
					var/remember=M.dir
					src.loc=M.loc
					if(src.y==M.y)
						M.moving=0
						var/k=pick(1,2)
						if(k==1)step(M,NORTH);M.dir=remember
						if(k==2)step(M,SOUTH);M.dir=remember
					if(src.x==M.x)
						M.moving=0
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
					M.absorb="Haizen"
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = round(O.reiatsu*3.7 - M.defence/ 2.5)
				if(damage < 1)
					damage =rand(25,1000)
				//view(O,8) << "<b><font color = red>[O] hit [M] with his Haizen for [damage] damage!"
				src.loc = M.loc
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,kink.OppositeDirection(),1)
					walk(src,src.OppositeDirection(),1)
		Move()
			new/obj/haizentrail(src.loc)
			..()
obj
 haizentrail
		icon = 'silverslash.dmi'
		icon_state = "trail"
		zer = 1
		New()
			spawn(5)
			src.loc=null
obj
	volcore
		icon = 'silvervolcore.dmi'
		icon_state = ""
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(M.inoueshield)
					M.inoueshield=0
					view(8) << "<b>[M]: Blood Mist Shield!"
					var/obj/Maf = new/obj/bloodshield(M.loc)
					Maf:owner = M
					M.ShieldCool()
					flick("new",Maf)
					Maf.dir=get_dir(Maf,src)
				if(M.protected==1)src.loc=null
				M.wound+=rand(3,4)
				Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Volcore!"
				if(M.enemy)
					O.hollowprotection = 1
				M.moving = 1
				src.loc = locate(0,0,0)
				M.moving = 0
				step(M,src.dir)
				sleep(1)
				M.moving = 0
				step(M,src.dir)
				sleep(1)
				M.moving = 0
				step(M,src.dir)
				M.Slowed(7,35)
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.single)
					walk(kink,src.ReverseDeflectionDirection(),1)
					walk(src,kink.OppositeDirection(),1)
		Move()
			var/obj/k=new/obj/volcoretrail(src.loc)
			k.dir=src.dir
			..()
obj
 volcoretrail
		icon = 'silvervolcore.dmi'
		icon_state = "trail"
		zer = 1
		New()
			spawn(5)
			src.loc=null
obj
	rockettrail
		icon = 'rockets.dmi'
		icon_state="trail"
		layer=30
		New()
			spawn(10)
			src.loc=null
	luppicusttrail
		icon='Icons/custom luppi.dmi'
		icon_state="Trail"
		layer=30
		New()
			spawn(10)
			src.loc=null
obj
	trident
		icon = 'getsuga3.dmi'
		icon_state = "10"
		density = 1
		layer = 30
		Del()
			..()
		New()
			spawn(1)
				var/mob/i=src.Gowner
				step(src,i.dir)
			spawn(2)
				step(src,src.dir)
				step(src,src.dir)
			spawn(3)
				step(src,src.dir)
				step(src,src.dir)
			spawn(4)
				step(src,src.dir)
				step(src,src.dir)
			spawn(5)
				step(src,src.dir)
				step(src,src.dir)
			spawn(6)
				step(src,src.dir)
				step(src,src.dir)
			spawn(7)
				step(src,src.dir)
				step(src,src.dir)
			spawn(8)
				step(src,src.dir)
				step(src,src.dir)
			spawn(9)
				step(src,src.dir)
				step(src,src.dir)
			spawn(10)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				for(var/mob/uid in view(8,src))
					Quake_Effect(uid,20,1)
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
				var/mob/O = src.Gowner
				var/damage = round((O.reiatsu * 4)+(O.attack*4) - M.defence / 2)
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his [O.swordname] for [damage] damage!"
				src.loc = M.loc
				M.Death(O,damage,rand(5,15))
				spawn(2)
					if(!M.npc)
						if(src)
							var/dirold = M.dir
							step(M,src.dir)
							M.dir = dirold
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=T.loc
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.density)
					src.loc=kink.loc
		Move()
			var/obj/k = new/obj/craters/rammed(src.loc)
			k:dir = src.dir
			k.owner=src
			..()
obj
	airblade
		icon = 'airblade.dmi'
		icon_state = "10"
		density = 1
		layer = 30
		Del()
			..()
		New()
			spawn(1)
				var/mob/i=src.Gowner
				step(src,i.dir)
			spawn(2)
				step(src,src.dir)
				step(src,src.dir)
			spawn(3)
				step(src,src.dir)
				step(src,src.dir)
			spawn(4)
				step(src,src.dir)
				step(src,src.dir)
			spawn(5)
				step(src,src.dir)
				step(src,src.dir)
			spawn(6)
				step(src,src.dir)
				step(src,src.dir)
			spawn(7)
				step(src,src.dir)
				step(src,src.dir)
			spawn(8)
				step(src,src.dir)
				step(src,src.dir)
			spawn(9)
				step(src,src.dir)
			spawn(10)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				var/mob/O = src.Gowner
				var/damage = round((O.reiatsu * 4)+(O.attack*4) - M.defence / 2.5)
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his [O.swordname] for [damage] damage!"
				src.loc = M.loc
				M.Death(O,damage,rand(2,7))
				spawn(2)
					if(!M.npc)
						if(src)
							var/dirold = M.dir
							step(M,src.dir)
							M.dir = dirold
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=T.loc
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.density)
					src.loc=kink.loc
		Move()
			var/obj/k = new/obj/craters/rammed(src.loc)
			k:dir = src.dir
			k.owner=src
			..()
	airblades
		icon = 'airblade.dmi'
		icon_state = "10"
		density = 1
		layer = 30
		New()
			spawn(10)
			walk(src,0)
			spawn(20)
			src.loc=null
/*		Del()
			..()
		New()
			spawn(1)
				var/mob/i=src.Gowner
				step(src,i.dir)
			spawn(2)
				step(src,src.dir)
			spawn(3)
				step(src,src.dir)
			spawn(4)
				step(src,src.dir)
			spawn(5)
				step(src,src.dir)
			spawn(6)
				step(src,src.dir)
			spawn(7)
				step(src,src.dir)
			spawn(8)
				step(src,src.dir)
			spawn(9)
				step(src,src.dir)
			spawn(10)
			src.loc=null*/
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				var/mob/O = src.Gowner
				var/damage = round((O.reiatsu * 1.5)+(O.attack*1.5) - M.defence /1.4)
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his [O.swordname] for [damage] damage!"
				src.loc = M.loc
				M.Death(O,damage,rand(1,2))
				spawn(2)
					if(!M.npc)
						if(src)
							var/dirold = M.dir
							step(M,src.dir)
							M.dir = dirold
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=T.loc
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.density)
					src.loc=kink.loc
obj
	tentaclecustom2
		icon = 'custom luppi.dmi'
		icon_state = ""
		density = 1
		layer = 30
		Del()
	//		new/obj/explode/k5(src.loc)
			for(var/obj/luppicusttrail/k in world)
				if(k.owner==src)
					del k
			..()
		New()
			spawn(1)
				var/mob/i=src.Gowner
				step(src,i.dir)
				var/mob/e=i.etarget
				spawn(3)
					if(e)
						step_towards(src,e)
						step_towards(src,e)
					else
						step(src,src.dir)
						step(src,src.dir)
				spawn(5)
					if(e)
						step_towards(src,e)
						step_towards(src,e)
					else
						step(src,src.dir)
						step(src,src.dir)
				spawn(7)
					if(e)
						step_towards(src,e)
						step_towards(src,e)
					else
						step(src,src.dir)
						step(src,src.dir)
				spawn(9)
					if(e)
						step_towards(src,e)
						step_towards(src,e)
					else
						step(src,src.dir)
						step(src,src.dir)
				spawn(11)
					if(e)
						step_towards(src,e)
						step_towards(src,e)
					else
						step(src,src.dir)
						step(src,src.dir)
				spawn(13)
					if(e)
						step_towards(src,e)
						step_towards(src,e)
					else
						step(src,src.dir)
						step(src,src.dir)
				spawn(15)
					if(e)
						step_towards(src,e)
						step_towards(src,e)
					else
						step(src,src.dir)
						step(src,src.dir)
				spawn(17)
				if(e)
					step_towards(src,e)
					step_towards(src,e)
				else
					step(src,src.dir)
					step(src,src.dir)
			spawn(17)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				var/mob/O = src.Gowner
				var/damage = O:attack*10
				if(damage < 1)
					damage =rand(25,1000)
				src.loc = M.loc
				O.banmastery(7)
				//view(O,8) << "<b><font color = red>[O] hit [M] with his [O.swordname] for [damage] damage!"
				if(M.enemy)
					O.hollowprotection = 1
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					for(var/mob/M in view(2,src))
						var/mob/O = src.Gowner
						var/damage = O:attack*2- M.defence / 2
						if(damage < 1)
							damage =rand(25,1000)
						src.loc = M.loc
						O.banmastery(7)
						//view(O,8) << "<b><font color = red>[O] hit [M] with his [O.swordname] for [damage] damage!"
						M.Death(O,damage,rand(1,2))
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.density)
					src.loc=null
		Move()
			if(src.beenout)
				var/obj/k = new/obj/luppicusttrail(src.loc)
				k:dir = src.dir
				k.owner=src
			src.beenout=1
			..()
obj
	rocket
		icon = 'rockets.dmi'
		icon_state = ""
		density = 1
		layer = 30
		Del()
			new/obj/explode/k5(src.loc)
			for(var/obj/rockettrail/k in world)
				if(k.owner==src)
					del k
			..()
		New()
			spawn(1)
				var/mob/i=src.Gowner
				step(src,i.dir)
				var/mob/e=i.etarget
				spawn(1)
					if(e)
						step_towards(src,e)
						step_towards(src,e)
					else
						step(src,src.dir)
						step(src,src.dir)
				spawn(2)
					if(e)
						step_towards(src,e)
						step_towards(src,e)
					else
						step(src,src.dir)
						step(src,src.dir)
				spawn(3)
					if(e)
						step_towards(src,e)
						step_towards(src,e)
					else
						step(src,src.dir)
						step(src,src.dir)
				spawn(4)
					if(e)
						step_towards(src,e)
						step_towards(src,e)
					else
						step(src,src.dir)
						step(src,src.dir)
				spawn(5)
					if(e)
						step_towards(src,e)
						step_towards(src,e)
					else
						step(src,src.dir)
						step(src,src.dir)
				spawn(6)
					if(e)
						step_towards(src,e)
						step_towards(src,e)
					else
						step(src,src.dir)
						step(src,src.dir)
				spawn(7)
					if(e)
						step_towards(src,e)
						step_towards(src,e)
					else
						step(src,src.dir)
						step(src,src.dir)
				spawn(8)
				if(e)
					step_towards(src,e)
					step_towards(src,e)
				else
					step(src,src.dir)
					step(src,src.dir)
			spawn(10)
			src.loc=null
		Bump(A)
			if(ismob(A))
				for(var/mob/M in view(2,src))
					var/mob/O = src.Gowner
					var/damage = O:attack*10
					if(damage < 1)
						damage =rand(25,1000)
					src.loc = M.loc
					O.banmastery(7)
					//view(O,8) << "<b><font color = red>[O] hit [M] with his [O.swordname] for [damage] damage!"
					if(M.enemy)
						O.hollowprotection = 1
					M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					for(var/mob/M in view(2,src))
						var/mob/O = src.Gowner
						var/damage = O:attack*9- M.defence / 2
						if(damage < 1)
							damage =rand(25,1000)
						src.loc = M.loc
						O.banmastery(7)
						//view(O,8) << "<b><font color = red>[O] hit [M] with his [O.swordname] for [damage] damage!"
						M.Death(O,damage,rand(1,2))
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.density)
					src.loc=null
		Move()
			if(src.beenout)
				var/obj/k = new/obj/rockettrail(src.loc)
				k:dir = src.dir
				k.owner=src
			src.beenout=1
			..()
obj
	raikouhou
		icon = 'Raikouhou.dmi'
		icon_state = "Head"
		density = 1
		layer = 100
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Raikouhou"
					//M.contents+=src
					//return
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = O:reiatsu*3
				if(damage < 1)
					damage =rand(25,1000)
				src.loc = M.loc
				//view(O,8) << "<b><font color = red>[O] hit [M] with his Byakurai for [damage] damage!"
				M.Death(O,damage,rand(1,3))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					src.loc=kink.loc
		Move()
			if(src.beenout)
				var/k = new/obj/raikouhoutrail(src.loc)
				k:dir = src.dir
			src.beenout=1
			..()
	raikouhoutrail
		icon='Icons/Raikouhou.dmi'
		icon_state="trail"
		New()
			spawn(10)
			src.loc=null
obj
	shitotsusansen
		icon = 'shitotsu sansen.dmi'
		icon_state = ""
		density = 1
		layer = 20
		New()
			spawn(16)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = O:reiatsu*3
				if(damage < 1)
					damage =rand(25,1000)
				M.Slowed(5,20)
				//view(O,8) << "<b><font color = red>[O] hit [M] with his Byakurai for [damage] damage!"
				M.Death(O,damage,rand(1,2),1)
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					src.loc=null
	byaku
		icon = 'Byakurai2.dmi'
		icon_state = ""
		density = 1
		layer = 100
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Byakurai"
					//M.contents+=src
					//return
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = O:reiatsu * 2.9- M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				src.loc = M.loc
				//view(O,8) << "<b><font color = red>[O] hit [M] with his Byakurai for [damage] damage!"
				M.Death(O,damage,rand(1,2),1)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					src.loc=kink.loc
		Move()
			if(src.beenout)
				var/k = new/obj/byakutrail(src.loc)
				k:dir = src.dir
			src.beenout=1
			..()
	riku
		icon='Icons/bakudoublast.dmi'
		density=1
		single=1
		New()
			spawn(10)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				//var/mob/G = src.Gowner
				if(M == src.Gowner)
					src.loc=null
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
				if(M.inoueshield)
					M.inoueshield=0
					view(8) << "<b>[M]: Blood Mist Shield!"
					var/obj/Maf = new/obj/bloodshield(M.loc)
					Maf:owner = M
					M.ShieldCool()
					flick("new",Maf)
					Maf.dir=get_dir(Maf,src)
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Riku"
				//	M.contents+=src
				//	return
					src.loc=null
				if(M.protected==1)
					src.loc=M.loc
					return
				spawn()M.Rikuspeed()
				src.loc=null
			if(istype(A,/obj/))
				src.loc=null
obj/bakudou
	icon='Icons/bakudou.dmi'
	layer=MOB_LAYER+11
obj
 byakutrail
		layer = 100
		icon = 'Byakurai2.dmi'
		icon_state = "trail"
		New()
			spawn(30)
			src.loc=null

obj
	shinsou
		icon = 'ichimarushikai.dmi'
		icon_state = ""
		density = 1
		layer = 100
		New()
			spawn(1)
				step(src,src.dir)
			spawn(2)
				step(src,src.dir)
			spawn(3)
				step(src,src.dir)
			spawn(4)
				step(src,src.dir)
			spawn(5)
				step(src,src.dir)
			spawn(6)
				step(src,src.dir)
			spawn(7)
				step(src,src.dir)
				src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
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
				Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = O:attack * 1.5- M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				if(O.poison)
					M.Poisoned(O)
				//view(O,8) << "<b><font color = red>[O] hit [M] with his [O.swordname] for [damage] damage!"
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				src.loc=kink.loc
		Move()
			..()
			var/k = new/obj/shinsotrail(src.loc)
			k:dir = src.dir
			k:owner = src.Gowner
obj
	shinsou3
		icon = 'ichimarushikai.dmi'
		icon_state = ""
		density = 1
		layer = 100
		New()
			spawn(10)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
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
				Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = O:attack * 2.8- M.defence / 1.8
				if(damage < 1)
					damage =rand(25,1000)
				if(O.poison)
					M.Poisoned(O)
				src.loc = M.loc
				//view(O,8) << "<b><font color = red>[O] hit [M] with his [O.swordname] for [damage] damage!"
				M.Death(O,damage,rand(1,3))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					src.loc=kink.loc
		Move()
			..()
			var/k = new/obj/shinsotrail(src.loc)
			k:dir = src.dir
			k:owner = src.Gowner
obj
	shinsou2
		icon = 'ichimarushikai.dmi'
		icon_state = ""
		density = 1
		layer = 100
		Move()
			..()
			var/J = 1
			for(var/mob/M in oview(src,6))
				if(src.Gowner == M)
					J = 0
			if(J == 1)
				if(src)
					src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=M.loc
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
				Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = O:attack * 1.5- M.defence / 1.5
				if(damage < 1)
					damage =rand(25,1000)
				if(O.bankai)
					damage = O:attack * 2.3- M.defence / 1.5
				if(O.poison)
					M.Poisoned(O)
				src.loc = M.loc
				//view(O,8) << "<b><font color = red>[O] hit [M] with his [O.swordname] for [damage] damage!"
				M.Death(O,damage,rand(1,2))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					src.loc=kink.loc
		Move()
			..()
			var/k = new/obj/shinsou(src.loc)
			k:dir = src.dir
			k:owner = src
		Del()
			for(var/obj/shinsou/K in world)
				if(K.owner == src)
					del K
			for(var/mob/M in world)
				if(src.Gowner == M)
					M.frozen = 0
					M.canattack = 1
					M.icon_state = ""
			..()
obj
 shinsotrail
		layer = 100
		icon = 'ichimarushikai.dmi'
		icon_state = "trail"
		New()
			spawn(10)
			src.loc=null
obj
 renji1
		icon = 'renjishikaimove.dmi'
		icon_state = "1"
		New()
			..()
			spawn(4)
			if(src)src.loc=null
obj
 renji2
		icon = 'renjishikaimove.dmi'
		icon_state = "2"
		New()
			..()
			spawn(4)
			if(src)src.loc=null
obj
 ikkakus1
		icon = 'ikkakushikaimove.dmi'
		icon_state = "1"
		New()
			..()
			spawn(4)
			if(src)src.loc=null
obj
 mayuripoison
		icon = 'mayuribankaimove.dmi'
		layer=MOB_LAYER+10
		New()
			..()
			spawn(4)
			if(src)src.loc=null
obj
 ikkakus2
		icon = 'ikkakushikaimove.dmi'
		icon_state = "2"
		New()
			..()
			spawn(4)
			if(src)src.loc=null
obj
 hit1
		icon = 'hitsugayabankaimove.dmi'
		icon_state = "1"
		layer=MOB_LAYER+10
		New()
			..()
			spawn(10)
			if(src)src.loc=null
obj
 hit2
		icon = 'hitsugayabankaimove.dmi'
		icon_state = "2"
		layer=MOB_LAYER+10
		New()
			..()
			spawn(10)
			if(src)src.loc=null
obj
 reflection
		icon = 'sadoreflect.dmi'
		density = 1
		New()
			spawn(20)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					return
				if(M.ispedal)
					src.loc=null
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
				var/mob/O = src.Gowner
				var/damage = src.attack / 2
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null

obj
 power1
	//	icon = 'sadoblast.dmi'
	//	icon_state="head"
		icon='Icons/new sado blast.dmi'
		icon_state=""
		density = 1
		New()
			spawn(100)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				var/mob/O = src.Gowner
				var/damage = O.attack * 5- M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				if(M.soccer)
					M.soccer=0
					M.Load_Overlays()
					var/obj/soccerball/s=new/obj/soccerball(src.loc)
					s.icon_state=""
					walk(s,src.dir,0)
					spawn(2)
						s.icon_state=""
						walk(s,0)
						if(s.dir==NORTH)s.dir=SOUTH
				//view(O,8) << "<b><font color = red>[O] hit [M] with his Power Strike for [damage] damage!"
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
		Move()
			if(src.beenout)
				var/k = new/obj/Kendotrail(src.loc)
				k:dir = src.dir
			src.beenout=1
			..()
		Del()
			..()
obj
 diablo
		icon = 'diablobesar.dmi'
		density = 1
		New()
			spawn(50)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Diablo"
					src.loc=null
				Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = O.attack * 6- M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				//view(O,8) << "<b><font color = red>[O] hit [M] with his Diablo Besar for [damage] damage!"
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,src.ReverseDeflectionDirection(),1)
					walk(src,kink.OppositeDirection(),1)
		Del()
			for(var/obj/bpower2/M in world)
				if(M.owner == src.owner)
					del M
			for(var/obj/bpower3/M in world)
				if(M.owner == src.owner)
					del M
			..()
	bpower2
		icon = 'diablobesar.dmi'
		icon_state = "1"
	bpower3
		icon = 'diablobesar.dmi'
		icon_state = "2"
obj
 directo
		icon = 'eldirecto.dmi'
		density = 1
		New()
			spawn(50)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.absorb="El Direction"
					src.loc=null
				var/mob/O = src.Gowner
				O.loc = M.loc
				src.loc = locate(0,0,0)
				M.underlays += 'eldirecto.dmi'
				view(O,8) << "<b>[O]: El Directo!"
				if(M.enemy)
					O.hollowprotection = 1
				M.AllowMovement(4)
				O.AllowMovement(4)
				step(M,src.dir)
				step(O,src.dir)
				sleep(1)
				step(M,src.dir)
				sleep(1)
				step(M,src.dir)
				sleep(1)
				step(M,src.dir)
				sleep(1)
				step(M,src.dir)
				M.underlays -= 'eldirecto.dmi'
				var/damage = O.attack * 6- M.defence / 1.6
				if(damage < 1)
					damage =rand(25,1000)
				//view(O,8) << "<b><font color = red>[O] hit [M] with his El Directo for [damage] damage!"
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
 diablo2
		icon = 'diablobesar.dmi'
		icon_state = "1"
		New()
			spawn(50)
			src.loc=null
 diablo3
		icon = 'diablobesar.dmi'
		icon_state = "2"
		New()
			spawn(50)
			src.loc=null
obj
	var
		canphase=0
obj
	DeathBall
		icon = 'aoe blast.dmi'
		density = 1
		single=1
		canphase=1
		New()
			spawn(100)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(!isnull(M))
					if(M == src.Gowner)
						src.loc=null
						return
					if(M.ispedal)
						src.loc=null
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
					if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
						M.Absorbtime()
						M.absorb="Bala"
						M.cerored=src.ccerored
						M.cerogreen=src.ccerogreen
						M.ceroblue=src.cceroblue
						src.loc=null
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
					var/mob/O = src.Gowner
					if(O.enemy&&M.enemy)
						src.loc = M.loc
						return
					var/damage = (O.reiatsu+O.attack) * 3.5 - M.defence / 3
					if(damage < 1)
						damage =rand(25,1000)
					if(M.chadref)
						var/K = new/obj/reflection(M.loc)
						K:attack = damage
						K:dir = M.dir
						K:Gowner = M
						walk(K,M.dir)
						src.loc=null
					if(M.ceroback)
						M.absorbcero=1
						src.loc=null
					if(M.enemy)
						O.hollowprotection = 1
					if(M.enemy)
						O.hollowprotection = 1
					src.loc=M.loc
					M.Death(O,damage,rand(1,2))
					src.loc=null
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						src.loc=null
				if(istype(A,/obj/))
					var/obj/kink = A
					if(kink.Gowner)
						walk(kink,src.DeflectionDirection(),1)
		Move()
			..()
obj
	Bala
		icon = 'Bala.dmi'
		icon_state = ""
		density = 1
		single=1
		New()
			spawn(100)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(!isnull(M))
					if(M == src.Gowner)
						src.loc=null
						return
					if(M.ispedal)
						src.loc=null
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
					if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
						M.Absorbtime()
						M.absorb="Bala"
						M.cerored=src.ccerored
						M.cerogreen=src.ccerogreen
						M.ceroblue=src.cceroblue
						src.loc=null
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
					var/mob/O = src.Gowner
					if(O.enemy&&M.enemy)
						src.loc = M.loc
						return
					var/damage = O.reiatsu * 2 - M.defence / 2
					if(damage < 1)
						damage =rand(25,1000)
					if(M.chadref)
						var/K = new/obj/reflection(M.loc)
						K:attack = damage
						K:dir = M.dir
						K:Gowner = M
						walk(K,M.dir)
						src.loc=null
					if(M.ceroback)
						M.absorbcero=1
						src.loc=null
					if(M.enemy)
						O.hollowprotection = 1
					if(M.enemy)
						O.hollowprotection = 1
					src.loc=M.loc
					M.Death(O,damage,rand(1,2))
					src.loc=null
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						src.loc=null
				if(istype(A,/obj/))
					var/obj/kink = A
					if(kink.Gowner)
						walk(kink,src.DeflectionDirection(),1)
		Move()
			..()
obj
	Spinningleft
		icon = 'samurai 1.dmi'
		icon_state = "topleft"
		density = 1
		single=1
		New()
			spawn(100)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(!isnull(M))
					if(M == src.Gowner)
						src.loc=null
						return
					if(M.ispedal)
						src.loc=null
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
					if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
						M.Absorbtime()
						M.absorb="Bala"
						M.cerored=src.ccerored
						M.cerogreen=src.ccerogreen
						M.ceroblue=src.cceroblue
						src.loc=null
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
					var/mob/O = src.Gowner
					if(O.enemy&&M.enemy)
						src.loc = M.loc
						return
					var/damage = O.reiatsu * 2 - M.defence / 2
					if(damage < 1)
						damage =rand(25,1000)
					if(M.chadref)
						var/K = new/obj/reflection(M.loc)
						K:attack = damage
						K:dir = M.dir
						K:Gowner = M
						walk(K,M.dir)
						src.loc=null
					if(M.ceroback)
						M.absorbcero=1
						src.loc=null
					if(M.enemy)
						O.hollowprotection = 1
					if(M.enemy)
						O.hollowprotection = 1
					src.loc=M.loc
					M.Death(O,damage,rand(1,2))
					src.loc=null
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						src.loc=null
				if(istype(A,/obj/))
					var/obj/kink = A
					if(kink.Gowner)
						walk(kink,src.DeflectionDirection(),1)
		Move()
			..()
obj
	nake
		icon = 'nake.dmi'
		icon_state = ""
		density = 1
		New()
			spawn(100)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Nake"
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = O.reiatsu * 3.2 - M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				if(M.soccer)
					M.soccer=0
					M.Load_Overlays()
					var/obj/soccerball/s=new/obj/soccerball(src.loc)
					s.icon_state=""
					walk(s,src.dir,0)
					spawn(2)
						s.icon_state=""
						walk(s,0)
						if(s.dir==NORTH)s.dir=SOUTH
				if(M.enemy)
					O.hollowprotection = 1
				//view(O,8) << "<b><font color = red>[O] hit [M] with his Nake for [damage] damage!"
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null


obj
	nake1
		icon = 'nake.dmi'
		icon_state = "1"
		density = 1
		New()
			spawn(100)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
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
				if(M.stype=="Ukitake" && M.inshikai||M.stype=="Ukitake" && M.inbankai)
					M.Absorbtime()
					M.absorb="Nake"
					//M.contents+=src
					//return
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = O.reiatsu * 2.5 - M.defence / 1.3
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
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
				//view(O,8) << "<b><font color = red>[O] hit [M] with his Nake for [damage] damage!"
				if(M.enemy)
					O.hollowprotection = 1
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
obj
	nake2
		icon = 'nake.dmi'
		icon_state = "2"
		density = 1
		New()
			spawn(100)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				if(M.stype=="Ukitake" && M.inshikai && M.absorbtime==0||M.stype=="Ukitake" && M.inbankai && M.absorbtime==0||M.ftype=="Ginjo"&&M.gotfinalfb&&M.inafull)
					M.Absorbtime()
					M.absorb="Nake"
					//M.contents+=src
					//return
					src.loc=null
				var/mob/O = src.Gowner
				var/damage = O.reiatsu* 3 - M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				if(M.soccer)
					M.soccer=0
					M.Load_Overlays()
					var/obj/soccerball/s=new/obj/soccerball(src.loc)
					s.icon_state=""
					walk(s,src.dir,0)
					spawn(2)
						s.icon_state=""
						walk(s,0)
						if(s.dir==NORTH)s.dir=SOUTH
				//view(O,8) << "<b><font color = red>[O] hit [M] with his Nake for [damage] damage!"
				if(M.enemy)
					O.hollowprotection = 1
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
obj/darkshirafune
	icon='Icons/darkshirafune.dmi'
	density=0
	layer=28
	New()
		spawn(13)
		src.loc=null
		spawn(4)
		for(var/mob/M in view(0,src))
			if(M != src.Gowner)
				src.density=1
				if(M.inoueshield)
					M.inoueshield=0
					view(8) << "<b>[M]: Blood Mist Shield!"
					var/obj/Maf = new/obj/bloodshield(M.loc)
					Maf:owner = M
					M.ShieldCool()
					flick("new",Maf)
					Maf.dir=get_dir(Maf,src)
				M.Freeze(6)
				M.icon_state=""
				var/mob/O = src.Gowner
				var/damage = O.reiatsu * 5 - M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] pierced [M] for [damage] damage!"
				spawn(6)M.Death(O,damage,rand(5,10))
obj/shirafune
	icon='Icons/shirafune.dmi'
	density=0
	layer=28
	New()
		spawn(13)
		src.loc=null
		spawn(4)
		for(var/mob/M in view(0,src))
			if(M != src.Gowner)
				src.density=1
				if(M.inoueshield)
					M.inoueshield=0
					view(8) << "<b>[M]: Blood Mist Shield!"
					var/obj/Maf = new/obj/bloodshield(M.loc)
					Maf:owner = M
					M.ShieldCool()
					flick("new",Maf)
					Maf.dir=get_dir(Maf,src)
				M.Freeze(6)
				M.icon_state=""
				var/mob/O = src.Gowner
				var/damage = O.reiatsu * 5 - M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] pierced [M] for [damage] damage!"
				spawn(6)M.Death(O,damage,rand(5,10))
obj/Breath_Spear
	icon='Icons/ice spear thrust.dmi'
	density=0
	layer=28
	Del()
		for(var/mob/uid in view(8,src))
			if(uid.client)//
				Quake_Effect(uid,20,1)
			//	uid.client.DE_SFL_Uqexplode()//
		for(var/mob/id in view(6,src))
			if(id!=src.Gowner)
				var/obj/o=new/obj/papersuffocation(id.loc)
				o.Gowner=src
		src.loc=null
		sleep(1)
		..()
	New()
		spawn(13)
		src.loc=null
		spawn(4)
		for(var/mob/M in view(0,src))
			if(M != src.Gowner)
				src.density=1
				if(M.inoueshield)
					M.inoueshield=0
					view(8) << "<b>[M]: Blood Mist Shield!"
					var/obj/Maf = new/obj/bloodshield(M.loc)
					Maf:owner = M
					M.ShieldCool()
					flick("new",Maf)
					Maf.dir=get_dir(Maf,src)
				M.Freeze(6)
				M.icon_state=""
				var/mob/O = src.Gowner
				var/damage = O.attack * 5 - M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] pierced [M] for [damage] damage!"
				spawn(6)
					M.Death(O,damage,rand(5,10))
					del src

obj/shirafune2
	icon='Icons/ice spear thrust.dmi'
	density=0
	layer=28
	New()
		spawn(13)
		src.loc=null
		spawn(4)
		for(var/mob/M in view(0,src))
			if(M != src.Gowner)
				src.density=1
				if(M.inoueshield)
					M.inoueshield=0
					view(8) << "<b>[M]: Blood Mist Shield!"
					var/obj/Maf = new/obj/bloodshield(M.loc)
					Maf:owner = M
					M.ShieldCool()
					flick("new",Maf)
					Maf.dir=get_dir(Maf,src)
				M.Freeze(6)
				M.icon_state=""
				var/mob/O = src.Gowner
				var/damage = O.attack * 5 - M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] pierced [M] for [damage] damage!"
				spawn(6)M.Death(O,damage,rand(5,10))
obj/darksuffocation
	icon='Icons/darkfreeze.dmi'
	density=1
	layer=28
	New()
		spawn(80)
		src.loc=null
		flick("suffocation",src)
		spawn(3)
		for(var/mob/M in view(0,src))
			if(M != src.Gowner)
				src.dir=M.dir
				M.Freeze(48)
				M.icon_state=""
				var/mob/O = src.Gowner
				var/damage = O.reiatsu * 2 - M.defence
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] is freezing [M] for [damage] damage!"
				spawn()M.Death(O,damage,rand(1,3))
				spawn(12)
					if(!isnull(M))
						M.Freeze(36)
						M.icon_state=""
						//if(!M.protected)view(O,8) << "<b><font color = red>[O] is freezing [M] for [damage] damage!"
						spawn()M.Death(O,damage,rand(1,3))
				spawn(24)
					if(!isnull(M))
						M.Freeze(24)
						M.icon_state=""
						//if(!M.protected)view(O,8) << "<b><font color = red>[O] is freezing [M] for [damage] damage!"
						spawn()M.Death(O,damage,rand(1,3))
				spawn(36)
					if(!isnull(M))
						M.Freeze(12)
						M.icon_state=""
						//if(!M.protected)view(O,8) << "<b><font color = red>[O] is freezing [M] for [damage] damage!"
						spawn()M.Death(O,damage,rand(1,3))

obj/papersuffocation
	icon='Icons/icefreeze.dmi'
	density=1
	layer=28
	New()
		spawn(80)
		src.loc=null
		flick("suffocation",src)
		spawn(3)
		for(var/mob/M in view(0,src))
			if(M != src.Gowner)
				src.dir=M.dir
				M.Freeze(48)
				M.icon_state=""
				var/mob/O = src.Gowner
				var/damage = O.reiatsu * 2 - M.defence
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] is freezing [M] for [damage] damage!"
				spawn()M.Death(O,damage,rand(1,3))
				spawn(12)
					if(!isnull(M))
						M.Freeze(36)
						M.icon_state=""
						//if(!M.protected)view(O,8) << "<b><font color = red>[O] is freezing [M] for [damage] damage!"
						spawn()M.Death(O,damage,rand(1,3))
				spawn(24)
					if(!isnull(M))
						M.Freeze(24)
						M.icon_state=""
						//if(!M.protected)view(O,8) << "<b><font color = red>[O] is freezing [M] for [damage] damage!"
						spawn()M.Death(O,damage,rand(1,3))
				spawn(36)
					if(!isnull(M))
						M.Freeze(12)
						M.icon_state=""
						//if(!M.protected)view(O,8) << "<b><font color = red>[O] is freezing [M] for [damage] damage!"
						spawn()M.Death(O,damage,rand(1,3))
obj
	fog
		icon = 'mayuribankaimove.dmi'
		icon_state="newtest"
		layer=MOB_LAYER+10
		New()
			spawn(20)
			src.loc=null
		Move()
			..()
			var/obj/m=new/obj/fogtrail(src.loc)
			m.Gowner=src.Gowner
obj
	fogtrail
		icon = 'mayuribankaimove.dmi'
		icon_state="newtest"
		layer=MOB_LAYER+10
		New()
			spawn(40)
			src.loc=null
			spawn(3)
				for(var/mob/M in view(0,src))
					if(!isnull(M))
						if(M != src.Gowner)
							var/mob/O = src.Gowner
							if(isnull(O)) return
							var/damage = O.reiatsu * 2.2 - M.defence
							if(damage < 1)
								damage =rand(25,1000)
							//view(O,8) << "<b><font color = red>[O] is poisoninging [M] for [damage] damage!"
							M.Death(O,damage,rand(1,3))
			spawn(6)
				for(var/mob/M in view(0,src))
					if(!isnull(M))
						if(M != src.Gowner)
							var/mob/O = src.Gowner
							if(isnull(O)) return
							var/damage = O.reiatsu * 2.2 - M.defence
							if(damage < 1)
								damage =rand(25,1000)
							//view(O,8) << "<b><font color = red>[O] is poisoninging [M] for [damage] damage!"
							M.Death(O,damage,rand(1,3))
			spawn(12)
				for(var/mob/M in view(0,src))
					if(!isnull(M))
						if(M != src.Gowner)
							var/mob/O = src.Gowner
							if(isnull(O)) return
							var/damage = O.reiatsu * 2.2 - M.defence
							if(damage < 1)
								damage =rand(25,1000)
							//view(O,8) << "<b><font color = red>[O] is poisoninging [M] for [damage] damage!"
							M.Death(O,damage,rand(1,3))
			spawn(18)
				for(var/mob/M in view(0,src))
					if(!isnull(M))
						if(M != src.Gowner)
							var/mob/O = src.Gowner
							if(isnull(O)) return
							var/damage = O.reiatsu * 2.2 - M.defence
							if(damage < 1)
								damage =rand(25,1000)
							//view(O,8) << "<b><font color = red>[O] is poisoninging [M] for [damage] damage!"
							M.Death(O,damage,rand(1,3))
			spawn(24)
				for(var/mob/M in view(0,src))
					if(!isnull(M))
						if(M != src.Gowner)
							var/mob/O = src.Gowner
							if(isnull(O)) return
							var/damage = O.reiatsu * 2.2 - M.defence
							if(damage < 1)
								damage =rand(25,1000)
							//view(O,8) << "<b><font color = red>[O] is poisoninging [M] for [damage] damage!"
							M.Death(O,damage,rand(1,3))
			spawn(30)
				for(var/mob/M in view(0,src))
					if(!isnull(M))
						if(M != src.Gowner)
							var/mob/O = src.Gowner
							if(isnull(O)) return
							var/damage = O.reiatsu * 2.2 - M.defence
							if(damage < 1)
								damage =rand(25,1000)
							//view(O,8) << "<b><font color = red>[O] is poisoninging [M] for [damage] damage!"
							M.Death(O,damage,rand(1,3))
			spawn(36)
				for(var/mob/M in view(0,src))
					if(!isnull(M))
						if(M != src.Gowner)
							var/mob/O = src.Gowner
							if(isnull(O)) return
							var/damage = O.reiatsu * 2.2 - M.defence
							if(damage < 1)
								damage =rand(25,1000)
							//view(O,8) << "<b><font color = red>[O] is poisoninging [M] for [damage] damage!"
							M.Death(O,damage,rand(1,3))
obj
	ocerocharge
		icon='Icons/CERO.dmi'
		layer=30
		New()
			flick("charge",src)
			spawn(7)
			src.loc=null
	raihoucharge
		icon='Icons/CERO.dmi'
		layer=30
		New()
			flick("charge",src)
			spawn(7)
			src.loc=null

obj
	LeftHalTrail2
		layer = 100
		icon = 'lightning halberd - Copy - Copy.dmi'
		icon_state = "halberd 0,1"
		New()
			spawn(50)
				src.loc=null
	MidHalTrail2
		layer = 100
		icon = 'lightning halberd - Copy - Copy.dmi'
		icon_state = "halberd 1,2"
		New()
			spawn(50)
				src.loc=null
	RightHalTrail2
		layer = 100
		icon = 'lightning halberd - Copy - Copy.dmi'
		icon_state = "halberd 2,2"
		New()
			spawn(50)
				src.loc=null
	LeftHalTrail
		layer = 100
		icon = 'lightning halberd - Copy - Copy.dmi'
		icon_state = "halberd 0,1"
		New()
			spawn(50)
				src.loc=null
		Move()
			if(src.beenout)
				var/k = new/obj/LeftHalTrail2(src.loc)
				k:dir = src.dir
			src.beenout=1
			..()
	MidHalTrail
		layer = 100
		icon = 'lightning halberd - Copy - Copy.dmi'
		icon_state = "halberd 1,1"
		New()
			spawn(50)
				src.loc=null
		Move()
			if(src.beenout)
				var/k = new/obj/MidHalTrail2(src.loc)
				k:dir = src.dir
			src.beenout=1
			..()
	RightHalTrail
		layer = 100
		icon = 'lightning halberd - Copy - Copy.dmi'
		icon_state = "halberd 2,1"
		New()
			spawn(50)
				src.loc=null
		Move()
			if(src.beenout)
				var/k = new/obj/RightHalTrail2(src.loc)
				k:dir = src.dir
			src.beenout=1
			..()
	LightHalberdM
		icon = 'lightning halberd - Copy - Copy.dmi'
		icon_state="halberd 1,0"
		density = 1
		New()
			spawn(100)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				var/mob/O = src.Gowner
				var/damage = O.reiatsu * 5- M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				if(M.soccer)
					M.soccer=0
					M.Load_Overlays()
					var/obj/soccerball/s=new/obj/soccerball(src.loc)
					s.icon_state=""
					walk(s,src.dir,0)
					spawn(2)
						s.icon_state=""
						walk(s,0)
						if(s.dir==NORTH)s.dir=SOUTH
				//view(O,8) << "<b><font color = red>[O] hit [M] with his Power Strike for [damage] damage!"
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
		Move()
			if(src.beenout)
				var/k = new/obj/MidHalTrail(src.loc)
				k:dir = src.dir
			src.beenout=1
			..()
	LightHalberdR
		icon = 'lightning halberd - Copy - Copy.dmi'
		icon_state="halberd 2,0"
		density = 1
		New()
			spawn(100)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				var/mob/O = src.Gowner
				var/damage = O.reiatsu * 3.5- M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				if(M.soccer)
					M.soccer=0
					M.Load_Overlays()
					var/obj/soccerball/s=new/obj/soccerball(src.loc)
					s.icon_state=""
					walk(s,src.dir,0)
					spawn(2)
						s.icon_state=""
						walk(s,0)
						if(s.dir==NORTH)s.dir=SOUTH
				//view(O,8) << "<b><font color = red>[O] hit [M] with his Power Strike for [damage] damage!"
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
		Move()
			if(src.beenout)
				var/k = new/obj/RightHalTrail(src.loc)
				k:dir = src.dir
			src.beenout=1
			..()
	LightHalberdL
		icon = 'lightning halberd - Copy - Copy.dmi'
		icon_state="halberd 0,0"
		density = 1
		New()
			spawn(100)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					src.loc=null
					return
				if(M.ispedal)
					src.loc=null
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
				var/mob/O = src.Gowner
				var/damage = O.reiatsu * 3.5- M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					src.loc=null
				if(M.soccer)
					M.soccer=0
					M.Load_Overlays()
					var/obj/soccerball/s=new/obj/soccerball(src.loc)
					s.icon_state=""
					walk(s,src.dir,0)
					spawn(2)
						s.icon_state=""
						walk(s,0)
						if(s.dir==NORTH)s.dir=SOUTH
				//view(O,8) << "<b><font color = red>[O] hit [M] with his Power Strike for [damage] damage!"
				src.loc=M.loc
				M.Death(O,damage,rand(1,2))
				src.loc=null
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.loc=null
			if(istype(A,/obj/))
				src.loc=null
		Move()
			if(src.beenout)
				var/k = new/obj/LeftHalTrail(src.loc)
				k:dir = src.dir
			src.beenout=1
			..()