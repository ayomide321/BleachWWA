
mob
	proc
		Raiho_Halberd()
			if(src.safe||src.fireback)
				src << "<b>You are in safe zone!"
				return
			if(src.rei <= 1200)
				src << "<b>Your rei is too low!"
				return
			if(!src.getsugacd)
				src.rei -= 1200
				src.getsugacd = 1
				flick("Sword Slash1",src)
				if(src.dir == NORTH)
					var/obj/LightHalberdM/A = new /obj/LightHalberdM/
					var/obj/LightHalberdL/B = new /obj/LightHalberdL/
					var/obj/LightHalberdR/C = new /obj/LightHalberdR/
					A.loc = locate(src.x, src.y, src.z)
					C.loc = locate(src.x+1, src.y, src.z)
					B.loc = locate(src.x-1, src.y, src.z)
					A.dir = NORTH
					B.dir = NORTH
					C.dir = NORTH
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,NORTH)
					walk(C,NORTH)
					walk(B,NORTH)
				if(src.dir == SOUTH)
					var/obj/LightHalberdM/A = new /obj/LightHalberdM/
					var/obj/LightHalberdL/B = new /obj/LightHalberdL/
					var/obj/LightHalberdR/C = new /obj/LightHalberdR/
					A.loc = locate(src.x, src.y, src.z)
					C.loc = locate(src.x+1, src.y, src.z)
					B.loc = locate(src.x-1, src.y, src.z)
					A.dir = SOUTH
					B.dir = SOUTH
					C.dir = SOUTH
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,SOUTH)
					walk(C,SOUTH)
					walk(B,SOUTH)
				if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST||src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
					var/obj/LightHalberdL/A = new /obj/LightHalberdR/
					var/obj/LightHalberdL/B = new /obj/LightHalberdL/
					var/obj/LightHalberdM/C = new /obj/LightHalberdM/
					A.loc = locate(src.x, src.y-1, src.z)
					C.loc = locate(src.x, src.y, src.z)
					B.loc = locate(src.x, src.y+1, src.z)
					A.dir = src.dir
					B.dir = src.dir
					C.dir = src.dir
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,src.dir)
					walk(C,src.dir)
					walk(B,src.dir)
				sleep(60)
				src.getsugacd = 0
		CCLightning_Bolt()
			if(!src.inbankai && src.key != "WSHGC")
				src<<"You need to be in bankai."
				return
			if(src.rei < 1000)
				src << "<b>Your rei is too low!"
				return
			if(src.lightnboltcd)
				src<<"<b>You have to wait at least 3 secs"
				return
			if(src.safe||src.fireback)
				return
			if(src.firing)
				return
			if(!src.lightnbolt)
				src.firing=1
				src.lightnboltcd=1
				spawn(1)
				src.lightnbolt=1
				src.rei-=1000
				src << "<b>Click anywhere to cast a Lightning Bolt!"
				spawn(50)
				src.firing=0
				spawn(10)
				src.lightnboltcd=0
		LightningAOEStun()
			if(!src.inbankai)
				return
			if(src.rei < 1000)
				src << "<b>Your rei is too low!"
				return
			if(src.lightaoestuncd)
				src<<"<b>You have to wait at least 15 secs"
				return
			if(src.safe||src.fireback)
				return
			if(src.firing)
				return
			if(!src.lightaoestuncd)
				src.rei -= 1200
				src.lightaoestuncd = 1
				for(var/mob/A in oview(5))
					var/damage = src.reiatsu * 2.2
					A.Death(src,damage,rand(1,2))
					A.frozen=1
					A.overlays+=/obj/lightningstun
					spawn(50)
						A.frozen=0
						A.overlays-=/obj/lightningstun
				spawn(150)
				src.lightaoestuncd=0