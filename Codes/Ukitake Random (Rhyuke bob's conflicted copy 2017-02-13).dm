mob
	proc
		Random_Blast()
			if(!src.inbankai&&!src.inshikai)
				src << "You need to activate shikai/bankai!"
				return
			if(src.safe)
				src<<"You are in a safe zone!"
				return
			if(src.firing)
				src<<"You must wait a little!"
				return
			if(src.rei<1000)
				src<<"You need at least [src.rei]/1000!"
				return
			var/d=pick("Reiatsu Blast","Ice","Hakuren","Fireball","Sovereign","Hina","Hina2","weakWave","Wave","Cascada","Tornado","Getsuga Ring","Getsuga","Ola Azul","Bringer Blast","PinkByaku","Darts","Yumi","Cero","Wind","Gran Rey Cero","Baboon Blast","Riku","Soukatsui","Byakurai","Shakkahou","Nake","Diablo","El Direction","Bala")
			if(!src.randomblastcd)
				src.randomblastcd=1
				src.rei-=1000
				if(d=="Reiatsu Blast")
					var/K = new/obj/reiatsu_blast(usr.loc)
					K:Gowner = usr;K:dir = usr.dir;walk(K,usr.dir)
				if(d=="Ice")
					var/K = new/obj/ice(usr.loc)
					K:Gowner = usr;K:dir = usr.dir;walk(K,usr.dir)
				if(d=="Hakuren")
					var/K = new/obj/rukiaban(usr.loc)
					K:Gowner = usr;K:dir = usr.dir;walk(K,usr.dir)
				if(d=="Fireball")
					var/K = new/obj/fireball(usr.loc)
					K:Gowner = usr;K:dir = usr.dir;walk(K,usr.dir)
				if(d=="Sovereign")
					if(usr.dir == SOUTH)
						var/obj/sovereign/A = new /obj/sovereign/
						var/obj/sovereign/B = new /obj/sovereign/
						var/obj/sovereign/C = new /obj/sovereign/
						A.loc = locate(usr.x, usr.y, usr.z)
						C.loc = locate(usr.x+1, usr.y, usr.z)
						B.loc = locate(usr.x-1, usr.y, usr.z)
						A.dir = usr.dir
						B.dir = usr.dir
						C.dir = usr.dir
						A.Gowner = usr
						B.Gowner = usr
						C.Gowner = usr
						walk(A,SOUTH)
						walk(C,SOUTH)
						walk(B,SOUTH)
						var/obj/sovereign/Ca = new /obj/sovereign/
						var/obj/sovereign/Ba = new /obj/sovereign/
						Ca.loc = locate(usr.x+2, usr.y, usr.z)
						Ba.loc = locate(usr.x-2, usr.y, usr.z)
						Ba.dir = usr.dir
						Ca.dir = usr.dir
						Ba.Gowner = usr
						Ca.Gowner = usr
						walk(Ca,SOUTH)
						walk(Ba,SOUTH)
					if(usr.dir == NORTH)
						var/obj/sovereign/Aa = new /obj/sovereign/
						var/obj/sovereign/Ba = new /obj/sovereign/
						var/obj/sovereign/Ca = new /obj/sovereign/
						Aa.loc = locate(usr.x, usr.y, usr.z)
						Ca.loc = locate(usr.x-1, usr.y, usr.z)
						Ba.loc = locate(usr.x+1, usr.y, usr.z)
						Aa.dir = usr.dir
						Ba.dir = usr.dir
						Ca.dir = usr.dir
						Aa.Gowner = usr
						Ba.Gowner = usr
						Ca.Gowner = usr
						walk(Aa,NORTH)
						walk(Ca,NORTH)
						walk(Ba,NORTH)
						var/obj/sovereign/Caa = new /obj/sovereign/
						var/obj/sovereign/Baa = new /obj/sovereign/
						Caa.loc = locate(usr.x+2, usr.y, usr.z)
						Baa.loc = locate(usr.x-2, usr.y, usr.z)
						Baa.dir = usr.dir
						Caa.dir = usr.dir
						Baa.Gowner = usr
						Caa.Gowner = usr
						walk(Caa,NORTH)
						walk(Baa,NORTH)
					if(usr.dir == WEST||usr.dir == NORTHWEST||usr.dir == SOUTHWEST||usr.dir == EAST||usr.dir == NORTHEAST||usr.dir == SOUTHEAST)
						var/obj/sovereign/A = new /obj/sovereign/
						var/obj/sovereign/B = new /obj/sovereign/
						var/obj/sovereign/C = new /obj/sovereign/
						A.loc = locate(usr.x, usr.y+1, usr.z)
						C.loc = locate(usr.x, usr.y, usr.z)
						B.loc = locate(usr.x, usr.y-1, usr.z)
						A.Gowner = usr
						B.Gowner = usr
						C.Gowner = usr
						A.dir = usr.dir
						B.dir = usr.dir
						C.dir = usr.dir
						walk(A,usr.dir)
						walk(C,usr.dir)
						walk(B,usr.dir)
						var/obj/sovereign/Caa = new /obj/sovereign/
						var/obj/sovereign/Baa = new /obj/sovereign/
						Caa.loc = locate(usr.x, usr.y+2, usr.z)
						Baa.loc = locate(usr.x, usr.y-2, usr.z)
						Baa.dir = usr.dir
						Caa.dir = usr.dir
						Baa.Gowner = usr
						Caa.Gowner = usr
						walk(Caa,usr.dir)
						walk(Baa,usr.dir)
				if(d=="Hina")
					var/K = new/obj/hina(usr.loc)
					K:Gowner = usr;K:dir = usr.dir;walk(K,usr.dir)
				if(d=="Hina2")
					var/K = new/obj/hina2(usr.loc)
					K:Gowner = usr;K:dir = usr.dir;walk(K,usr.dir)
				if(d=="weakWave")
					if(src.dir == NORTH||src.dir==SOUTH)
						var/obj/weakwave/Aa = new /obj/weakwave/
						var/obj/weakwave/Ba = new /obj/weakwave/
						var/obj/weakwave/Ca = new /obj/weakwave/
						Aa.loc = locate(src.x, src.y, src.z)
						Ca.loc = locate(src.x-1, src.y, src.z)
						Ba.loc = locate(src.x+1, src.y, src.z)
						Aa.dir = src.dir
						Ba.dir = src.dir
						Ca.dir = src.dir
						Aa.Gowner = src
						Ba.Gowner = src
						Ca.Gowner = src
						walk(Aa,src.dir)
						walk(Ca,src.dir)
						walk(Ba,src.dir)
					if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST||src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
						var/obj/weakwave/A = new /obj/weakwave/
						var/obj/weakwave/B = new /obj/weakwave/
						var/obj/weakwave/C = new /obj/weakwave/
						A.loc = locate(src.x, src.y+1, src.z)
						C.loc = locate(src.x, src.y, src.z)
						B.loc = locate(src.x, src.y-1, src.z)
						A.Gowner = src
						B.Gowner = src
						C.Gowner = src
						A.dir = src.dir
						B.dir = src.dir
						C.dir = src.dir
						walk(A,src.dir)
						walk(C,src.dir)
						walk(B,src.dir)
				if(d=="Wave")
					if(src.dir == NORTH||src.dir==SOUTH)
						var/obj/wave/Aa = new /obj/wave/
						var/obj/wave/Ba = new /obj/wave/
						var/obj/wave/Ca = new /obj/wave/
						Aa.loc = locate(src.x, src.y, src.z)
						Ca.loc = locate(src.x-1, src.y, src.z)
						Ba.loc = locate(src.x+1, src.y, src.z)
						Aa.dir = src.dir
						Ba.dir = src.dir
						Ca.dir = src.dir
						Aa.Gowner = src
						Ba.Gowner = src
						Ca.Gowner = src
						walk(Aa,src.dir)
						walk(Ca,src.dir)
						walk(Ba,src.dir)
					if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST||src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
						var/obj/wave/A = new /obj/wave/
						var/obj/wave/B = new /obj/wave/
						var/obj/wave/C = new /obj/wave/
						A.loc = locate(src.x, src.y+1, src.z)
						C.loc = locate(src.x, src.y, src.z)
						B.loc = locate(src.x, src.y-1, src.z)
						A.Gowner = src
						B.Gowner = src
						C.Gowner = src
						A.dir = src.dir
						B.dir = src.dir
						C.dir = src.dir
						walk(A,src.dir)
						walk(C,src.dir)
						walk(B,src.dir)
				if(d=="Cascada")
					if(usr.dir == SOUTH||usr.dir == NORTH)
						var/obj/cascada/A = new /obj/cascada/
						var/obj/cascada/B = new /obj/cascada/
						var/obj/cascada/C = new /obj/cascada/
						A.loc = locate(usr.x, usr.y, usr.z)
						C.loc = locate(usr.x+1, usr.y, usr.z)
						B.loc = locate(usr.x-1, usr.y, usr.z)
						A.layer=3
						spawn(1)
						A.layer=16
						A.dir = usr.dir
						B.dir = usr.dir
						C.dir = usr.dir
						A.Gowner = usr
						B.Gowner = usr
						C.Gowner = usr
						walk(A,usr.dir)
						walk(C,usr.dir)
						walk(B,usr.dir)
						var/obj/cascada/Ca = new /obj/cascada/
						var/obj/cascada/Ba = new /obj/cascada/
						Ca.loc = locate(usr.x+2, usr.y, usr.z)
						Ba.loc = locate(usr.x-2, usr.y, usr.z)
						Ba.dir = usr.dir
						Ca.dir = usr.dir
						Ba.Gowner = usr
						Ca.Gowner = usr
						walk(Ca,usr.dir)
						walk(Ba,usr.dir)
						var/obj/cascada/Caa = new /obj/cascada/
						var/obj/cascada/Baa = new /obj/cascada/
						Caa.loc = locate(usr.x+3, usr.y, usr.z)
						Baa.loc = locate(usr.x-3, usr.y, usr.z)
						Baa.dir = usr.dir
						Caa.dir = usr.dir
						Baa.Gowner = usr
						Caa.Gowner = usr
						walk(Caa,usr.dir)
						walk(Baa,usr.dir)
						var/obj/cascada/Caaa = new /obj/cascada/
						var/obj/cascada/Baaa = new /obj/cascada/
						Caaa.loc = locate(usr.x+4, usr.y, usr.z)
						Baaa.loc = locate(usr.x-4, usr.y, usr.z)
						Baaa.dir = usr.dir
						Caaa.dir = usr.dir
						Baaa.Gowner = usr
						Caaa.Gowner = usr
						walk(Caaa,usr.dir)
						walk(Baaa,usr.dir)
					if(usr.dir == WEST||usr.dir == NORTHWEST||usr.dir == SOUTHWEST||usr.dir == EAST||usr.dir == NORTHEAST||usr.dir == SOUTHEAST)
						var/obj/cascada/A = new /obj/cascada/
						var/obj/cascada/B = new /obj/cascada/
						var/obj/cascada/C = new /obj/cascada/
						A.loc = locate(usr.x, usr.y, usr.z)
						C.loc = locate(usr.x, usr.y+1, usr.z)
						B.loc = locate(usr.x, usr.y-1, usr.z)
						A.layer=3
						spawn(1)
						A.layer=16
						A.dir = usr.dir
						B.dir = usr.dir
						C.dir = usr.dir
						A.Gowner = usr
						B.Gowner = usr
						C.Gowner = usr
						walk(A,usr.dir)
						walk(C,usr.dir)
						walk(B,usr.dir)
						var/obj/cascada/Ca = new /obj/cascada/
						var/obj/cascada/Ba = new /obj/cascada/
						Ca.loc = locate(usr.x, usr.y+2, usr.z)
						Ba.loc = locate(usr.x, usr.y-2, usr.z)
						Ba.dir = usr.dir
						Ca.dir = usr.dir
						Ba.Gowner = usr
						Ca.Gowner = usr
						walk(Ca,usr.dir)
						walk(Ba,usr.dir)
						var/obj/cascada/Caa = new /obj/cascada/
						var/obj/cascada/Baa = new /obj/cascada/
						Caa.loc = locate(usr.x, usr.y+3, usr.z)
						Baa.loc = locate(usr.x, usr.y-3, usr.z)
						Baa.dir = usr.dir
						Caa.dir = usr.dir
						Baa.Gowner = usr
						Caa.Gowner = usr
						walk(Caa,usr.dir)
						walk(Baa,usr.dir)
						var/obj/cascada/Caaa = new /obj/cascada/
						var/obj/cascada/Baaa = new /obj/cascada/
						Caaa.loc = locate(usr.x, usr.y+4, usr.z)
						Baaa.loc = locate(usr.x, usr.y-4, usr.z)
						Baaa.dir = usr.dir
						Caaa.dir = usr.dir
						Baaa.Gowner = usr
						Caaa.Gowner = usr
						walk(Caaa,usr.dir)
						walk(Baaa,usr.dir)
				if(d=="Tornado")
					var/K = new/obj/tornado(usr.loc)
					K:Gowner = usr;K:dir = usr.dir;walk(K,usr.dir)
				if(d=="Getsuga Ring")
					var/K = new/obj/getsugaring(usr.loc)
					K:Gowner = usr;K:dir = usr.dir;walk(K,usr.dir)
				if(d=="Getsuga")
					if(usr.dir == NORTH)
						var/obj/yaiba/A = new /obj/yaiba/
						var/obj/yaiba2/B = new /obj/yaiba2/
						var/obj/yaiba1/C = new /obj/yaiba1/
						if(usr.inbankai)
							A.icon = 'getsugablack.dmi'
							B.icon = 'getsugablack.dmi'
							C.icon = 'getsugablack.dmi'
						A.loc = locate(usr.x, usr.y, usr.z)
						C.loc = locate(usr.x+1, usr.y, usr.z)
						B.loc = locate(usr.x-1, usr.y, usr.z)
						A.dir = NORTH
						B.dir = NORTH
						C.dir = NORTH
						A.Gowner = usr
						B.Gowner = usr
						C.Gowner = usr
						walk(A,NORTH)
						walk(C,NORTH)
						walk(B,NORTH)
					if(usr.dir == SOUTH)
						var/obj/yaiba/A = new /obj/yaiba/
						var/obj/yaiba1/B = new /obj/yaiba1/
						var/obj/yaiba2/C = new /obj/yaiba2/
						if(usr.inbankai)
							A.icon = 'getsugablack.dmi'
							B.icon = 'getsugablack.dmi'
							C.icon = 'getsugablack.dmi'
						A.loc = locate(usr.x, usr.y, usr.z)
						C.loc = locate(usr.x+1, usr.y, usr.z)
						B.loc = locate(usr.x-1, usr.y, usr.z)
						A.dir = SOUTH
						B.dir = SOUTH
						C.dir = SOUTH
						A.Gowner = usr
						B.Gowner = usr
						C.Gowner = usr
						walk(A,SOUTH)
						walk(C,SOUTH)
						walk(B,SOUTH)
					if(usr.dir == WEST||usr.dir == NORTHWEST||usr.dir == SOUTHWEST||usr.dir == EAST||usr.dir == NORTHEAST||usr.dir == SOUTHEAST)
						var/obj/yaiba1/A = new /obj/yaiba1/
						var/obj/yaiba2/B = new /obj/yaiba2/
						var/obj/yaiba/C = new /obj/yaiba/
						if(usr.inbankai)
							A.icon = 'getsugablack.dmi'
							B.icon = 'getsugablack.dmi'
							C.icon = 'getsugablack.dmi'
						A.loc = locate(usr.x, usr.y-1, usr.z)
						C.loc = locate(usr.x, usr.y, usr.z)
						B.loc = locate(usr.x, usr.y+1, usr.z)
						A.dir = usr.dir
						B.dir = usr.dir
						C.dir = usr.dir
						A.Gowner = usr
						B.Gowner = usr
						C.Gowner = usr
						walk(A,usr.dir)
						walk(C,usr.dir)
						walk(B,usr.dir)
				if(d=="Ola Azul")
					if(usr.dir == NORTH||usr.dir == SOUTH)
						var/obj/ola/A = new /obj/ola/
						var/obj/ola/B = new /obj/ola/
						var/obj/ola/C = new /obj/ola/
						A.loc = locate(usr.x, usr.y, usr.z)
						C.loc = locate(usr.x+1, usr.y, usr.z)
						B.loc = locate(usr.x-1, usr.y, usr.z)
						A.icon_state="4"
						C.icon_state="6"
						B.icon_state="5"
						A.dir = usr.dir
						B.dir = usr.dir
						C.dir = usr.dir
						A.Gowner = usr
						B.Gowner = usr
						C.Gowner = usr
						walk(A,usr.dir)
						walk(C,usr.dir)
						walk(B,usr.dir)
					if(usr.dir == WEST||usr.dir == NORTHWEST||usr.dir == SOUTHWEST||usr.dir == EAST||usr.dir == NORTHEAST||usr.dir == SOUTHEAST)
						var/obj/ola/A = new /obj/ola/
						var/obj/ola/B = new /obj/ola/
						var/obj/ola/C = new /obj/ola/
						A.icon_state="5"
						B.icon_state="6"
						C.icon_state="4"
						A.loc = locate(usr.x, usr.y-1, usr.z)
						C.loc = locate(usr.x, usr.y, usr.z)
						B.loc = locate(usr.x, usr.y+1, usr.z)
						A.dir = usr.dir
						B.dir = usr.dir
						C.dir = usr.dir
						A.Gowner = usr
						B.Gowner = usr
						C.Gowner = usr
						walk(A,usr.dir)
						walk(C,usr.dir)
						walk(B,usr.dir)
				if(d=="Bringer Blast")
					if(usr.dir == NORTH)
						var/obj/bringerb/A = new /obj/bringerb/
						var/obj/bringerb2/B = new /obj/bringerb2/
						var/obj/bringerb1/C = new /obj/bringerb1/
						A.loc = locate(usr.x, usr.y, usr.z)
						C.loc = locate(usr.x+1, usr.y, usr.z)
						B.loc = locate(usr.x-1, usr.y, usr.z)
						A.dir = NORTH
						B.dir = NORTH
						C.dir = NORTH
						A.Gowner = usr
						B.Gowner = usr
						C.Gowner = usr
						walk(A,NORTH)
						walk(C,NORTH)
						walk(B,NORTH)
					if(usr.dir == SOUTH)
						var/obj/bringerb/A = new /obj/bringerb/
						var/obj/bringerb1/B = new /obj/bringerb1/
						var/obj/bringerb2/C = new /obj/bringerb2/
						A.loc = locate(usr.x, usr.y, usr.z)
						C.loc = locate(usr.x+1, usr.y, usr.z)
						B.loc = locate(usr.x-1, usr.y, usr.z)
						A.dir = SOUTH
						B.dir = SOUTH
						C.dir = SOUTH
						A.Gowner = usr
						B.Gowner = usr
						C.Gowner = usr
						walk(A,SOUTH)
						walk(C,SOUTH)
						walk(B,SOUTH)
					if(usr.dir == WEST||usr.dir == NORTHWEST||usr.dir == SOUTHWEST||usr.dir == EAST||usr.dir == NORTHEAST||usr.dir == SOUTHEAST)
						var/obj/bringerb1/A = new /obj/bringerb1/
						var/obj/bringerb2/B = new /obj/bringerb2/
						var/obj/bringerb/C = new /obj/bringerb/
						A.loc = locate(usr.x, usr.y-1, usr.z)
						C.loc = locate(usr.x, usr.y, usr.z)
						B.loc = locate(usr.x, usr.y+1, usr.z)
						A.dir = usr.dir
						B.dir = usr.dir
						C.dir = usr.dir
						A.Gowner = usr
						B.Gowner = usr
						C.Gowner = usr
						walk(A,usr.dir)
						walk(C,usr.dir)
						walk(B,usr.dir)
				if(d=="PinkByaku")
					var/K = new/obj/pinkbyaku(usr.loc)
					K:Gowner = usr
					K:dir = usr.dir
					step(K,usr.dir)
					step(K,usr.dir)
					step(K,usr.dir)
					step(K,usr.dir)
					step(K,usr.dir)
					step(K,usr.dir)
					step(K,usr.dir)
					step(K,usr.dir)
					step(K,usr.dir)
					step(K,usr.dir)
					step(K,usr.dir)
				if(d=="Darts")
					var/obj/K = new/obj/darts(src.loc)
					K:Gowner = src
					K.dir=src.dir
					walk(K,src.dir)
					K:attack = src.reiatsu
					spawn(1)
						var/obj/Ka = new/obj/darts(K.loc)
						Ka:Gowner = src
						Ka.dir = turn(K.dir, 45)
						walk(Ka,Ka.dir)
						var/obj/Ks = new/obj/darts(K.loc)
						Ks:Gowner = src
						Ks.dir = turn(K.dir, -45)
						walk(Ks,Ks.dir)
						spawn(1)
							var/obj/Kaa = new/obj/darts(Ka.loc)
							Kaa:Gowner = src
							Kaa.dir = turn(Ka.dir, -45)
							walk(Kaa,Kaa.dir)
							var/obj/Kss = new/obj/darts(Ks.loc)
							Kss:Gowner = src
							Kss.dir = turn(Ks.dir, 45)
							walk(Kss,Kss.dir)
				if(d=="Yumi")
					var/Ka = new/obj/Yumi(locate(usr.x+1,usr.y+1,usr.z))
					Ka:Gowner = usr
					Ka:dir = WEST
					walk(Ka,WEST)
					var/Kd = new/obj/Yumi(locate(usr.x+1,usr.y-1,usr.z))
					Kd:Gowner = usr
					Kd:dir = NORTH
					walk(Kd,NORTH)
					var/Ks = new/obj/Yumi(locate(usr.x-1,usr.y+1,usr.z))
					Ks:Gowner = usr
					Ks:dir = SOUTH
					walk(Ks,SOUTH)
					var/K = new/obj/Yumi(locate(usr.x-1,usr.y-1,usr.z))
					K:Gowner = usr
					K:dir = EAST
					walk(K,EAST)
					if(usr.inbankai)
						var/Kad = new/obj/Yumi(locate(usr.x+1,usr.y+2,usr.z))
						Kad:Gowner = usr
						Kad:dir = WEST
						walk(Kad,WEST)
						var/Kdd = new/obj/Yumi(locate(usr.x+2,usr.y-1,usr.z))
						Kdd:Gowner = usr
						Kdd:dir = NORTH
						walk(Kdd,NORTH)
						var/Ksd = new/obj/Yumi(locate(usr.x-2,usr.y+1,usr.z))
						Ksd:Gowner = usr
						Ksd:dir = SOUTH
						walk(Ksd,SOUTH)
						var/Kg = new/obj/Yumi(locate(usr.x-1,usr.y-2,usr.z))
						Kg:Gowner = usr
						Kg:dir = EAST
						walk(Kg,EAST)
				if(d=="Cero")
					var/obj/K = new/obj/cero(src.loc)
					if(src.cerocolor=="Red")K.icon='Icons/new red cero.dmi'
					if(src.cerocolor=="Blue")K.icon='Icons/bluenew cero.dmi'
					if(src.cerocolor=="Green")K.icon='Icons/greennew cero.dmi'
					if(src.cerocolor=="Yellow")K.icon='Icons/yellownew cero.dmi'
					K:Gowner = src
					K:dir = src.dir
					walk(K,src.dir)
				if(d=="Raiko")
					var/obj/K = new/obj/raikouhou(src.loc)
					K:Gowner = usr;K:dir = usr.dir;walk(K,usr.dir)
				if(d=="Wind")
					var/K = new/obj/wind(locate(src.x,src.y,src.z))
					K:Gowner = src
					K:dir = src.dir
					walk(K,src.dir)
					if(src.dir==NORTH||src.dir==SOUTH)
						var/Ka = new/obj/wind(locate(src.x-1,src.y,src.z))
						Ka:Gowner = src
						Ka:dir = src.dir
						walk(Ka,src.dir)
						var/Kd = new/obj/wind(locate(src.x+1,src.y,src.z))
						Kd:Gowner = src
						Kd:dir = src.dir
						walk(Kd,src.dir)
					if(src.dir==EAST||src.dir==WEST||src.dir==NORTHEAST||src.dir==NORTHWEST||src.dir==SOUTHEAST||src.dir==SOUTHWEST)
						var/Ka = new/obj/wind(locate(src.x,src.y+1,src.z))
						Ka:Gowner = src
						Ka:dir = src.dir
						walk(Ka,src.dir)
						var/Kd = new/obj/wind(locate(src.x,src.y-1,src.z))
						Kd:Gowner = src
						Kd:dir = src.dir
						walk(Kd,src.dir)
				if(d=="Gran Rey Cero")
					var/obj/K2 = new/obj/charge(usr.loc)
					new/obj/ceroc(locate(usr.x-5,usr.y,usr.z))
					new/obj/ceroc(locate(usr.x+5,usr.y,usr.z))
					new/obj/ceroc(locate(usr.x+5,usr.y-5,usr.z))
					new/obj/ceroc(locate(usr.x-5,usr.y-5,usr.z))
					new/obj/ceroc(locate(usr.x,usr.y-5,usr.z))
					new/obj/ceroc(locate(usr.x,usr.y+5,usr.z))
					new/obj/ceroc(locate(usr.x+5,usr.y+5,usr.z))
					new/obj/ceroc(locate(usr.x-5,usr.y+5,usr.z))
					for(var/obj/ceroc/DF in oview(6))
						walk_towards(DF,usr,0)
					K2:icon = 'ceroc2.dmi'
					if(src.cerocolor=="Red")K2.icon='Icons/cero2red.dmi'
					if(src.cerocolor=="Blue")K2.icon='Icons/cero2blue.dmi'
					if(src.cerocolor=="Green")K2.icon='Icons/cero2green.dmi'
					if(src.cerocolor=="Yellow")K2.icon='Icons/cero2yellow.dmi'
					sleep(5)
					src.frozen=0
					if(src.dir == NORTH)
						var/obj/ccero/A = new /obj/ccero/
						var/obj/ccero/B = new /obj/ccero/
						var/obj/ccero/C = new /obj/ccero/
						if(src.cerocolor=="Red")A.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")A.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Red")B.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")B.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Red")C.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")C.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Green")A.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")A.icon='Icons/cero2yellow.dmi'
						if(src.cerocolor=="Green")B.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")B.icon='Icons/cero2yellow.dmi'
						if(src.cerocolor=="Green")C.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")C.icon='Icons/cero2yellow.dmi'
						A.loc = locate(src.x, src.y, src.z)
						C.loc = locate(src.x-1, src.y, src.z)
						B.loc = locate(src.x+1, src.y, src.z)
						B.icon_state = "1"
						C.icon_state = "2"
						A.dir = src.dir
						B.dir = src.dir
						C.dir = src.dir
						A.Gowner = src
						B.Gowner = src
						C.Gowner = src
						walk(A,NORTH)
						walk(C,NORTH)
						walk(B,NORTH)
					if(src.dir == SOUTH)
						var/obj/ccero/A = new /obj/ccero/
						var/obj/ccero/B = new /obj/ccero/
						var/obj/ccero/C = new /obj/ccero/
						if(src.cerocolor=="Red")A.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")A.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Red")B.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")B.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Red")C.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")C.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Green")A.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")A.icon='Icons/cero2yellow.dmi'
						if(src.cerocolor=="Green")B.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")B.icon='Icons/cero2yellow.dmi'
						if(src.cerocolor=="Green")C.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")C.icon='Icons/cero2yellow.dmi'
						A.loc = locate(src.x, src.y, src.z)
						C.loc = locate(src.x+1, src.y, src.z)
						B.loc = locate(src.x-1, src.y, src.z)
						C.icon_state = "1"
						B.icon_state = "2"
						A.dir = src.dir
						B.dir = src.dir
						C.dir = src.dir
						A.Gowner = src
						B.Gowner = src
						C.Gowner = src
						walk(A,SOUTH)
						walk(C,SOUTH)
						walk(B,SOUTH)
					if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST)
						var/obj/ccero/A = new /obj/ccero/
						var/obj/ccero/B = new /obj/ccero/
						var/obj/ccero/C = new /obj/ccero/
						if(src.cerocolor=="Red")A.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")A.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Red")B.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")B.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Red")C.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")C.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Green")A.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")A.icon='Icons/cero2yellow.dmi'
						if(src.cerocolor=="Green")B.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")B.icon='Icons/cero2yellow.dmi'
						if(src.cerocolor=="Green")C.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")C.icon='Icons/cero2yellow.dmi'
						A.loc = locate(src.x, src.y+1, src.z)
						C.loc = locate(src.x, src.y, src.z)
						B.loc = locate(src.x, src.y-1, src.z)
						A.Gowner = src
						B.Gowner = src
						C.Gowner = src
						A.dir = src.dir
						B.dir = src.dir
						C.dir = src.dir
						B.icon_state = "1"
						A.icon_state = "2"
						walk(A,src.dir)
						walk(C,src.dir)
						walk(B,src.dir)
					if(src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
						var/obj/ccero/A = new /obj/ccero/
						var/obj/ccero/B = new /obj/ccero/
						var/obj/ccero/C = new /obj/ccero/
						if(src.cerocolor=="Red")A.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")A.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Red")B.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")B.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Red")C.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")C.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Green")A.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")A.icon='Icons/cero2yellow.dmi'
						if(src.cerocolor=="Green")B.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")B.icon='Icons/cero2yellow.dmi'
						if(src.cerocolor=="Green")C.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")C.icon='Icons/cero2yellow.dmi'
						A.loc = locate(src.x, src.y+1, src.z)
						C.loc = locate(src.x, src.y, src.z)
						B.loc = locate(src.x, src.y-1, src.z)
						A.Gowner = src
						B.Gowner = src
						C.Gowner = src
						A.dir = src.dir
						B.dir = src.dir
						C.dir = src.dir
						B.icon_state = "2"
						A.icon_state = "1"
						walk(A,src.dir)
						walk(C,src.dir)
						walk(B,src.dir)
					var/t=src.dir
					src.allowmove = 1
					step(src,src.OppositeDirection())
					src.allowmove = 0
					src.dir=t
				if(d=="Baboon Blast")
					var/obj/cannon/A = new /obj/cannon/b2
					A.loc = locate(usr.x, usr.y, usr.z)
					A.dir = usr.dir
					A.Gowner = usr
					walk(A,src.dir)
				if(d=="Riku")
					var/K = new/obj/riku(usr.loc)
					K:Gowner = usr;K:dir = usr.dir;walk(K,usr.dir)
				if(d=="Soukatsui")
					var/K = new/obj/soukatsui(usr.loc)
					K:Gowner = usr;K:dir = usr.dir;walk(K,usr.dir)
				if(d=="Byakurai")
					var/K = new/obj/byaku(usr.loc)
					K:Gowner = usr;K:dir = usr.dir;walk(K,usr.dir)
				if(d=="Shakkahou")
					var/K = new/obj/shakkahou(usr.loc)
					K:Gowner = usr;K:dir = usr.dir;walk(K,usr.dir)
				if(d=="Nake")
					if(usr.dir == NORTH)
						var/obj/yaiba/A = new /obj/nake/
						var/obj/yaiba2/B = new /obj/nake2/
						var/obj/yaiba1/C = new /obj/nake1/
						A.loc = locate(usr.x, usr.y, usr.z)
						C.loc = locate(usr.x+1, usr.y, usr.z)
						B.loc = locate(usr.x-1, usr.y, usr.z)
						A.dir = NORTH
						B.dir = NORTH
						C.dir = NORTH
						A.Gowner = usr
						B.Gowner = usr
						C.Gowner = usr
						walk(A,NORTH)
						walk(C,NORTH)
						walk(B,NORTH)
					if(usr.dir == SOUTH)
						var/obj/yaiba/A = new /obj/nake/
						var/obj/yaiba1/B = new /obj/nake1/
						var/obj/yaiba2/C = new /obj/nake2/
						A.loc = locate(usr.x, usr.y, usr.z)
						C.loc = locate(usr.x+1, usr.y, usr.z)
						B.loc = locate(usr.x-1, usr.y, usr.z)
						A.dir = SOUTH
						B.dir = SOUTH
						C.dir = SOUTH
						A.Gowner = usr
						B.Gowner = usr
						C.Gowner = usr
						walk(A,SOUTH)
						walk(C,SOUTH)
						walk(B,SOUTH)
					if(usr.dir == WEST||usr.dir == NORTHWEST||usr.dir == SOUTHWEST||usr.dir == EAST||usr.dir == NORTHEAST||usr.dir == SOUTHEAST)
						var/obj/yaiba1/A = new /obj/nake1/
						var/obj/yaiba2/B = new /obj/nake2/
						var/obj/yaiba/C = new /obj/nake/
						A.loc = locate(usr.x, usr.y-1, usr.z)
						C.loc = locate(usr.x, usr.y, usr.z)
						B.loc = locate(usr.x, usr.y+1, usr.z)
						A.dir = usr.dir
						B.dir = usr.dir
						C.dir = usr.dir
						A.Gowner = usr
						B.Gowner = usr
						C.Gowner = usr
						walk(A,usr.dir)
						walk(C,usr.dir)
						walk(B,usr.dir)
				if(d=="Lanza")
					if(src.stype == "Dark Bat")
						var/K = new/obj/darksword(usr.loc)
						K:Gowner = usr;K:dir = usr.dir;walk(K,usr.dir)
					else
						var/K = new/obj/ulqsword(usr.loc)
						K:Gowner = usr;K:dir = usr.dir;walk(K,usr.dir)
				if(d=="Seele")
					var/K = new/obj/seele(usr.loc)
					K:Gowner = usr;K:dir = usr.dir;walk(K,usr.dir)
				if(d=="Haizen")
					var/K = new/obj/haizen(usr.loc)
					K:Gowner = usr;K:dir = usr.dir;walk(K,usr.dir)
				if(d=="Diablo")
					if(usr.dir == NORTH)
						var/obj/diablo/A = new /obj/diablo/
						var/obj/bpower2/B = new /obj/diablo2/
						var/obj/bpower3/C = new /obj/diablo3/
						B.loc = locate(usr.x, usr.y-1, usr.z)
						A.loc = locate(usr.x, usr.y, usr.z)
						C.loc = locate(usr.x, usr.y-2, usr.z)
						A.dir = NORTH
						B.dir = NORTH
						C.dir = NORTH
						A.Gowner = usr
						B.Gowner = usr
						C.Gowner = usr
						walk(A,NORTH)
						walk(C,NORTH)
						walk(B,NORTH)
					if(usr.dir == SOUTH)
						var/obj/diablo/A = new /obj/diablo/
						var/obj/bpower2/B = new /obj/diablo2/
						var/obj/bpower3/C = new /obj/diablo3/
						B.loc = locate(usr.x, usr.y+1, usr.z)
						A.loc = locate(usr.x, usr.y, usr.z)
						C.loc = locate(usr.x, usr.y+2, usr.z)
						A.dir = SOUTH
						B.dir = SOUTH
						C.dir = SOUTH
						A.Gowner = usr
						B.Gowner = usr
						C.Gowner = usr
						walk(A,SOUTH)
						walk(C,SOUTH)
						walk(B,SOUTH)
					if(usr.dir == WEST||usr.dir == NORTHWEST||usr.dir == SOUTHWEST)
						var/obj/diablo/A = new /obj/diablo/
						var/obj/bpower2/B = new /obj/diablo2/
						var/obj/bpower3/C = new /obj/diablo3/
						B.loc = locate(usr.x+1, usr.y, usr.z)
						A.loc = locate(usr.x, usr.y, usr.z)
						C.loc = locate(usr.x+2, usr.y, usr.z)
						A.dir = WEST
						B.dir = WEST
						C.dir = WEST
						A.Gowner = usr
						B.Gowner = usr
						C.Gowner = usr
						walk(A,usr.dir)
						walk(C,usr.dir)
						walk(B,usr.dir)
					if(usr.dir == EAST||usr.dir == NORTHEAST||usr.dir == SOUTHEAST)
						var/obj/diablo/A = new /obj/diablo/
						var/obj/bpower2/B = new /obj/diablo2/
						var/obj/bpower3/C = new /obj/diablo3/
						B.loc = locate(usr.x-1, usr.y, usr.z)
						A.loc = locate(usr.x, usr.y, usr.z)
						C.loc = locate(usr.x-2, usr.y, usr.z)
						A.dir = EAST
						B.dir = EAST
						C.dir = EAST
						A.Gowner = usr
						B.Gowner = usr
						C.Gowner = usr
						walk(A,usr.dir)
						walk(C,usr.dir)
						walk(B,usr.dir)
				if(d=="El Direction")
					var/K = new/obj/directo(usr.loc)
					K:Gowner = usr;K:dir = usr.dir;walk(K,usr.dir)
				if(d=="Bala")
					var/obj/K = new/obj/Bala(usr.loc)
					K:Gowner = usr
					if(src.cerocolor=="Red")K.icon='Icons/Balared.dmi'
					if(src.cerocolor=="Blue")K.icon='Icons/Balablue.dmi'
					if(src.cerocolor=="Green")K.icon='Icons/Balagreen.dmi'
					if(src.cerocolor=="Yellow")K.icon='Icons/Balayellow.dmi'
					K:dir = usr.dir
					walk(K,usr.dir)
				flick("Sword Slash1",src)
				sleep(100)
				src.randomblastcd=0