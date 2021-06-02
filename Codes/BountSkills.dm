//fire bount---------------------------------------------------------------------------------------------------------------------------------
mob/var
	gotfiredollskills=0
	gotfiredollskills2=0
	gotwaterdollskills=0
	tmp/fireringcd=0
	tmp/firebolt=0
	tmp/burningdoll=0
	tmp/burningdollcd=0
	tmp/fireboltcd=0
	tmp/waterbolt=0
	tmp/waterboltcd=0
	tmp/heaven2=0
mob/proc
	Make_Fire_Bolt(atom/M)
		var/dista=get_dist(usr,M)
		if(dista>10)return
		var/obj/D=new/obj/FireBolt/k1(locate(M.x,M.y,M.z))
		new/obj/FireBolt/k1(locate(M.x,M.y,M.z))
		new/obj/FireBolt/k2(locate(M.x,M.y,M.z))
		new/obj/FireBolt/k3(locate(M.x,M.y,M.z))
		new/obj/FireBolt/k4(locate(M.x,M.y,M.z))
		new/obj/FireBolt/k5(locate(M.x,M.y,M.z))
		new/obj/FireBolt/k6(locate(M.x,M.y,M.z))
		new/obj/FireBolt/k7(locate(M.x,M.y,M.z))
		new/obj/FireBolt/k8(locate(M.x,M.y,M.z))
		new/obj/FireBolt/k9(locate(M.x,M.y,M.z))
		new/obj/FireBolt/k10(locate(M.x,M.y,M.z))
		new/obj/FireBolt/k11(locate(M.x,M.y,M.z))
		new/obj/FireBolt/k12(locate(M.x,M.y,M.z))
		new/obj/FireBolt/k13(locate(M.x,M.y,M.z))
		new/obj/FireBolt/k14(locate(M.x,M.y,M.z))
		new/obj/FireBolt/k15(locate(M.x,M.y,M.z))
		new/obj/FireBolt/k16(locate(M.x,M.y,M.z))
		new/obj/FireBolt/k17(locate(M.x,M.y,M.z))
		D.Gowner=usr
		usr.firebolt=0

	Make_Water_Ball(atom/M)
		var/dista=get_dist(usr,M)
		if(dista>10)return
		var/obj/D=new/obj/WaterBolt/k1(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k1(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k2(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k3(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k4(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k5(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k6(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k7(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k8(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k9(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k10(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k11(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k12(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k13(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k14(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k15(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k16(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k17(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k18(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k19(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k20(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k21(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k22(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k23(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k24(locate(M.x,M.y,M.z))
		new/obj/WaterBolt/k25(locate(M.x,M.y,M.z))
		D.Gowner=usr
		usr.waterbolt=0
mob
	proc
		Water_Wave()
			if(src.safe||src.fireback)
				return
			if(src.heaven2)
				src<<"<b>You must wait a little before using this again"
				return
			if(src.rei<1000)
				src<<"<b>You need [src.rei]/1000"
				return
			if(!src.heaven2)
				src.heaven2=1
				src.rei-=1000
				for(var/mob/m in oview(4,src))
					var/obj/n=new/obj/burning2(m.loc)
					src.overlays+=/obj/fire/Water
					n.Gowner=src
					m.canattack=0
					spawn(30)
						src.overlays-=/obj/fire/Water
						m.canattack=1
				for(var/mob/b in view(4,src))
					if(b.client)
						b.client.DE_SFL_b1()
				spawn(450)
				src.heaven2=0
		Fire_Bolt()
			if(src.rei < 500)
				src << "<b>Your rei is too low!"
				return
			if(src.fireboltcd)
				src<<"<b>You have to wait at least 15 secs"
				return
			if(src.safe||src.fireback)
				return
			if(src.firing)
				return
			if(!src.firebolt)
				src.firing=1
				src.fireboltcd=1
				spawn(1)
				src.firebolt=1
				src.rei-=500
				src << "<b>Click anywhere to cast a fire bolt!"
				spawn(50)
				src.firing=0
				spawn(150)
				src.fireboltcd=0
		Water_Bolt()
			if(src.rei < 500)
				src << "<b>Your rei is too low!"
				return
			if(src.waterboltcd)
				src<<"<b>You have to wait at least 15 secs"
				return
			if(src.safe||src.fireback)
				return
			if(src.firing)
				return
			if(!src.waterbolt)
				src.firing=1
				src.waterboltcd=1
				spawn(1)
				src.waterbolt=1
				src.rei-=500
				src << "<b>Click anywhere to throw a water bolt!"
				spawn(50)
				src.firing=0
				spawn(150)
				src.waterboltcd=0
		FireDollSlash()
			if(src.safe||src.fireback)
				src << "<b>You are in safe zone!"
				return
			if(src.rei <= 1000)
				src << "<b>Your rei is too low!"
				return
			if(src.getsugacd==1)
				return
			if(!src.getsugacd)
				src.rei -= 1000
				src.getsugacd = 1
/*				flick("Sword Slash1",src)
				var/obj/yaiba/A = new /obj/yaiba/(src.loc)
				A.Gowner=src
				A.icon_state="3"
				A.dir = src.dir
				walk(A,src.dir)
				sleep(60)
				src.firing=0
				return*/
			if(src.dir == NORTH)
				var/obj/yaiba/A = new /obj/yaiba/
				var/obj/yaiba2/B = new /obj/yaiba2/
				var/obj/yaiba1/C = new /obj/yaiba1/
				A.icon = 'example.dmi'
				B.icon = 'example.dmi'
				C.icon = 'example.dmi'
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
				var/obj/yaiba/A = new /obj/yaiba/
				var/obj/yaiba1/B = new /obj/yaiba1/
				var/obj/yaiba2/C = new /obj/yaiba2/
				A.icon = 'example.dmi'
				B.icon = 'example.dmi'
				C.icon = 'example.dmi'
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
			if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
				var/obj/yaiba1/A = new /obj/yaiba1/
				var/obj/yaiba2/B = new /obj/yaiba2/
				var/obj/yaiba/C = new /obj/yaiba/
				A.icon = 'example.dmi'
				B.icon = 'example.dmi'
				C.icon = 'example.dmi'
				A.loc = locate(src.x, src.y+1, src.z)
				C.loc = locate(src.x, src.y, src.z)
				B.loc = locate(src.x, src.y-1, src.z)
				A.dir = src.dir
				B.dir = src.dir
				C.dir = src.dir
				A.Gowner = src
				B.Gowner = src
				C.Gowner = src
				walk(A,src.dir)
				walk(C,src.dir)
				walk(B,src.dir)
			if(src.dir==EAST)
				var/obj/yaiba1/A = new /obj/yaiba1/
				var/obj/yaiba2/B = new /obj/yaiba2/
				var/obj/yaiba/C = new /obj/yaiba/
				A.icon = 'example.dmi'
				B.icon = 'example.dmi'
				C.icon = 'example.dmi'
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
		Fire_Doll_Ring()
			if(src.safe||src.fireback)
				src << "<b>You are in safe zone!"
				return
			if(src.rei <= 500)
				src << "<b>Your rei is too low!"
				return
			if(!src.fireringcd)
				src.rei -= 500
				src.fireringcd = 1
				flick("Sword Slash1",src)
				var/obj/getsugaring/A = new /obj/getsugaring(src.loc)
				A.Gowner=src
				A.icon='Icons/fire ring.dmi'
				A.icon_state=""
				A.dir = src.dir
				walk(A,src.dir)
				var/obj/getsugaring/Axx = new /obj/getsugaring(src.loc)
				Axx.Gowner=src
				Axx.icon='Icons/fire ring.dmi'
				Axx.icon_state=""
				Axx.dir = src.dir
				walk(Axx,src.dir)
				spawn(1)
					var/obj/getsugaring/Aa = new /obj/getsugaring(src.loc)
					Aa.Gowner=src
					Aa.icon='Icons/fire ring.dmi'
					Aa.icon_state=""
					Aa.dir = src.dir
					walk(Aa,src.dir)
				spawn(1)
					var/obj/getsugaring/As = new /obj/getsugaring(src.loc)
					As.Gowner=src
					As.icon='Icons/fire ring.dmi'
					As.icon_state=""
					As.dir = src.dir
					walk(As,src.dir)
				sleep(30)
				src.fireringcd=0
				return
		Water_Doll_Bullet()
			if(src.safe||src.fireback)
				src << "<b>You are in safe zone!"
				return
			if(src.rei <= 500)
				src << "<b>Your rei is too low!"
				return
			if(!src.getsugaringcd)
				src.rei -= 500
				src.getsugaringcd = 1
				flick("Sword Slash1",src)
				var/obj/getsugaring/A = new /obj/getsugaring(src.loc)
				A.Gowner=src
				A.icon='Icons/watershockwave.dmi'
				A.icon_state=""
				A.dir = src.dir
				walk(A,src.dir)
				var/obj/getsugaring/Ax = new /obj/getsugaring(src.loc)
				Ax.Gowner=src
				Ax.icon='Icons/watershockwave.dmi'
				Ax.icon_state=""
				Ax.dir = src.dir
				walk(Ax,src.dir)
				spawn(2)
					var/obj/getsugaring/Aa = new /obj/getsugaring(src.loc)
					Aa.Gowner=src
					Aa.icon='Icons/watershockwave.dmi'
					Aa.icon_state=""
					Aa.dir = src.dir
					walk(Aa,src.dir)
				spawn(2)
					var/obj/getsugaring/As = new /obj/getsugaring(src.loc)
					As.Gowner=src
					As.icon='Icons/watershockwave.dmi'
					As.icon_state=""
					As.dir = src.dir
					walk(As,src.dir)
				spawn(2)
					var/obj/getsugaring/Asz = new /obj/getsugaring(src.loc)
					Asz.Gowner=src
					Asz.icon='Icons/watershockwave.dmi'
					Asz.icon_state=""
					Asz.dir = src.dir
					walk(Asz,src.dir)
				spawn(2)
					var/obj/getsugaring/Aszz = new /obj/getsugaring(src.loc)
					Aszz.Gowner=src
					Aszz.icon='Icons/watershockwave.dmi'
					Aszz.icon_state=""
					Aszz.dir = src.dir
					walk(Aszz,src.dir)
				spawn(2)
					var/obj/getsugaring/Aszzz = new /obj/getsugaring(src.loc)
					Aszzz.Gowner=src
					Aszzz.icon='Icons/watershockwave.dmi'
					Aszzz.icon_state=""
					Aszzz.dir = src.dir
					walk(Aszzz,src.dir)
				sleep(50)
				src.getsugaringcd=0
				return
		Fire_Doll_Bullet()
			if(src.safe||src.fireback)
				src << "<b>You are in safe zone!"
				return
			if(src.rei <= 500)
				src << "<b>Your rei is too low!"
				return
			if(!src.getsugaringcd)
				src.rei -= 500
				src.getsugaringcd = 1
				flick("Sword Slash1",src)
				var/obj/getsugaring/A = new /obj/getsugaring(src.loc)
				A.Gowner=src
				A.icon='Icons/bountdragon.dmi'
				A.icon_state=""
				A.dir = src.dir
				walk(A,src.dir)
				var/obj/getsugaring/Ax = new /obj/getsugaring(src.loc)
				Ax.Gowner=src
				Ax.icon='Icons/bountdragon.dmi'
				Ax.icon_state=""
				Ax.dir = src.dir
				walk(Ax,src.dir)
				spawn(2)
					var/obj/getsugaring/Aa = new /obj/getsugaring(src.loc)
					Aa.Gowner=src
					Aa.icon='Icons/bountdragon.dmi'
					Aa.icon_state=""
					Aa.dir = src.dir
					walk(Aa,src.dir)
				spawn(2)
					var/obj/getsugaring/As = new /obj/getsugaring(src.loc)
					As.Gowner=src
					As.icon='Icons/bountdragon.dmi'
					As.icon_state=""
					As.dir = src.dir
					walk(As,src.dir)
				spawn(2)
					var/obj/getsugaring/Asz = new /obj/getsugaring(src.loc)
					Asz.Gowner=src
					Asz.icon='Icons/bountdragon.dmi'
					Asz.icon_state=""
					Asz.dir = src.dir
					walk(Asz,src.dir)
				spawn(2)
					var/obj/getsugaring/Aszz = new /obj/getsugaring(src.loc)
					Aszz.Gowner=src
					Aszz.icon='Icons/bountdragon.dmi'
					Aszz.icon_state=""
					Aszz.dir = src.dir
					walk(Aszz,src.dir)
				spawn(2)
					var/obj/getsugaring/Aszzz = new /obj/getsugaring(src.loc)
					Aszzz.Gowner=src
					Aszzz.icon='Icons/bountdragon.dmi'
					Aszzz.icon_state=""
					Aszzz.dir = src.dir
					walk(Aszzz,src.dir)
				sleep(50)
				src.getsugaringcd=0
				return
		Water_Heavens()
			if(src.safe||src.fireback)
				return
			if(src.heaven)
				src<<"<b>You must wait a little before using this again"
				return
			if(src.rei<1000)
				src<<"<b>You need [src.rei]/1000"
				return
			if(!src.heaven)
				src.heaven=1
				src.rei-=1000
				if(!src.npccaptain||src.npccaptain&&src.pet)
					for(var/mob/m in oview(8,src))
						var/obj/n=new/obj/fire/Water(m.loc)
						n.Gowner=src
						m.frozen=1
						m.canattack=0
						spawn(30)
							m.frozen=0
							m.canattack=1
							src.frozen=0
					for(var/mob/b in view(8,src))
						if(b.client)
							b.client.DE_SFL_b()
				if(src.npccaptain&&!src.pet)
					world<<"<b><font color = lime>Hitsugaya has changed the weather"
					for(var/mob/player/m in world)
						if(m.lost)
							var/obj/n=new/obj/fire/Water(m.loc)
							n.Gowner=src
							m.frozen=1
							m.canattack=0
							spawn(30)
								m.frozen=0
								m.canattack=1
								src.frozen=0
					for(var/mob/player/b in world)
						if(b.lost&&b.client)
							b.client.DE_SFL_b()
				spawn(300)
				src.heaven=0
		Burning()
			if(src.burningdoll)
				src.burningdoll=0
				for(var/obj/Fire/f in world)
					if(f.Gowner==src)
						del f
				return
			if(src.rei < 600)
				src << "<b>Your rei is too low!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.burningdoll)
				src.burningdoll = 1
				src.rei -= 600
				src.encircle=1
				spawn()
					src.DollFlame()
				sleep(6 SECONDS)
				src.burningdoll = 0
				src.encircle=0
				sleep(36 SECONDS)
				src.encirclecd = 0

		DollFlame()
			set background=1
			if(src.encircle)
				if(!src.npccaptain)
					for(var/mob/M in oview(src))
						var/damage=src.reiatsu
						view(src,8) << "<b><font color = red>[src] burned [M]"
						if(!M.protected)
							spawn()M.Death(src,damage,rand(0,1))
				if(src.npccaptain&&!src.pet)
					for(var/mob/player/M in world)
						if(M.lost)
							var/damage=src.reiatsu/2
							view(src,8) << "<b><font color = red>[src] burned [M]"
							if(!M.protected)
								spawn()M.Death(src,damage,rand(0,1))
				if(!src.pet)
					src.rei-=src.mrei/30
				if(src.rei<=0)
					src.encircle=0
					for(var/obj/Fire/f in world)
						if(f.Gowner==src)
							del f
				sleep(10)
				src.DollFlame()
//fire bount---------------------------------------------------------------------------------------------------------------------------------