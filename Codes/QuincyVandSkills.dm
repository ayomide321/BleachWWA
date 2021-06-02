/*								if("Bow")
									usr.spiritweapon=0
									usr.chosespirit=1
								if("Guns")
									usr.spiritweapon=1
									usr.chosespirit=1
								if("Sword")
									usr.spiritweapon=2
									usr.chosespirit=1*/
mob/var
	tmp/firequincybulletcd=0
	tmp/lightningquincybulletcd=0
	tmp/windquincybulletcd=0
	tmp/firequincystreamcd=0
	tmp/windquincystreamcd=0
	tmp/trans10=0
	tmp/lightnbolt=0
	tmp/lightnboltcd=0
	gotlightnvtechs=0
	gotwindvtechs=0
	gotfirevtechs=0

mob
	proc
		Vandenreich_Power_Release()
			if(!src.chosespirit) return
			src.frozen=1
			flick("bankai",src)
			spawn(10)
			if(src.trans10<1)
				for(var/mob/M in view(src))
					Quake_Effect(M,4,1)
			spawn(14)
				src.frozen=0
				if(src.trans10<1)
					src.trans10=1
					src.Load_Overlays()
					src.attack+=round(src.mattack/3)
					src.defence+=round(src.mdefence/3)
					src.reiatsu+=round(src.mreiatsu/3)
					rundelay=1
				else
					src.trans10=0
					src.attack=src.mattack
					src.defence=src.mdefence
					src.reiatsu=src.mreiatsu
					src.Load_Overlays()
		Fire_Quincy_Stream()
			if(src.spiritweapon!=1) return
			if(src.safe||src.fireback)
				return
			if(src.rei <= 500)
				src << "<b>Your rei is too low!"
				return
			if(!src.firequincystreamcd)
				src.firequincystreamcd = 1
				src.rei -= 500
				if(src.etarget)src.Facedir(src.etarget)
				var/obj/K = new/obj/cero(src.loc)
				K.Gowner = src
				K.icon='Icons/fire stream.dmi'
				K:dir = src.dir
				walk(K,src.dir)
				spawn(50)
				src.firequincystreamcd = 0
			return

		Fire_Commander_Stream()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 500)
				src << "<b>Your rei is too low!"
				return
			if(!src.firequincystreamcd)
				src.firequincystreamcd = 1
				src.rei -= 500
				if(src.etarget)src.Facedir(src.etarget)
				var/obj/K = new/obj/cero(src.loc)
				K.Gowner = src
				K.icon='Icons/fire stream.dmi'
				K:dir = src.dir
				walk(K,src.dir)
				spawn(20)
				src.firequincystreamcd = 0
			return

		FireQuincyBullet()
			if(src.spiritweapon!=1) return
			if(!src.chosespirit) return
			if(src.safe||src.fireback)
				src << "<b>You are in safe zone!"
				return
			if(src.rei <= 500)
				src << "<b>Your rei is too low!"
				return
			if(!src.firequincybulletcd)
				src.rei -= 500
				src.firequincybulletcd = 1
				flick("Sword Slash1",src)
				var/obj/getsugaring/A = new /obj/getsugaring(src.loc)
				A.Gowner=src
				A.icon='Icons/KatonTechniques.dmi'
				A.icon_state="housenka"
				A.dir = src.dir
				walk(A,src.dir)
				var/obj/getsugaring/Ax = new /obj/getsugaring(src.loc)
				Ax.Gowner=src
				Ax.icon='Icons/KatonTechniques.dmi'
				Ax.icon_state="housenka"
				Ax.dir = src.dir
				walk(Ax,src.dir)
				spawn(2)
					var/obj/getsugaring/Aa = new /obj/getsugaring(src.loc)
					Aa.Gowner=src
					Aa.icon='Icons/KatonTechniques.dmi'
					Aa.icon_state="housenka"
					Aa.dir = src.dir
					walk(Aa,src.dir)
				spawn(2)
					var/obj/getsugaring/As = new /obj/getsugaring(src.loc)
					As.Gowner=src
					As.icon='Icons/KatonTechniques.dmi'
					As.icon_state="housenka"
					As.dir = src.dir
					walk(As,src.dir)
				spawn(2)
					var/obj/getsugaring/Asz = new /obj/getsugaring(src.loc)
					Asz.Gowner=src
					Asz.icon='Icons/KatonTechniques.dmi'
					Asz.icon_state="housenka"
					Asz.dir = src.dir
					walk(Asz,src.dir)
				spawn(2)
					var/obj/getsugaring/Aszz = new /obj/getsugaring(src.loc)
					Aszz.Gowner=src
					Aszz.icon='Icons/KatonTechniques.dmi'
					Aszz.icon_state="housenka"
					Aszz.dir = src.dir
					walk(Aszz,src.dir)
				spawn(2)
					var/obj/getsugaring/Aszzz = new /obj/getsugaring(src.loc)
					Aszzz.Gowner=src
					Aszzz.icon='Icons/KatonTechniques.dmi'
					Aszzz.icon_state="housenka"
					Aszzz.dir = src.dir
					walk(Aszzz,src.dir)
				sleep(50)
				src.firequincybulletcd=0
				return
		LightningQuincyBullet()
			if(src.spiritweapon!=0) return
			if(!src.chosespirit) return
			if(src.safe||src.fireback)
				src << "<b>You are in safe zone!"
				return
			if(src.rei <= 500)
				src << "<b>Your rei is too low!"
				return
			if(!src.lightningquincybulletcd)
				src.rei -= 500
				src.lightningquincybulletcd = 1
				flick("Sword Slash1",src)
				var/obj/getsugaring/A = new /obj/getsugaring(src.loc)
				A.Gowner=src
				A.icon='Icons/lightning bullet.dmi'
				A.icon_state=""
				A.dir = src.dir
				walk(A,src.dir)
				var/obj/getsugaring/Ax = new /obj/getsugaring(src.loc)
				Ax.Gowner=src
				Ax.icon='Icons/lightning bullet.dmi'
				Ax.icon_state=""
				Ax.dir = src.dir
				walk(Ax,src.dir)
				spawn(2)
					var/obj/getsugaring/Aa = new /obj/getsugaring(src.loc)
					Aa.Gowner=src
					Aa.icon='Icons/lightning bullet.dmi'
					Aa.icon_state=""
					Aa.dir = src.dir
					walk(Aa,src.dir)
				spawn(2)
					var/obj/getsugaring/As = new /obj/getsugaring(src.loc)
					As.Gowner=src
					As.icon='Icons/lightning bullet.dmi'
					As.icon_state=""
					As.dir = src.dir
					walk(As,src.dir)
				spawn(2)
					var/obj/getsugaring/Asz = new /obj/getsugaring(src.loc)
					Asz.Gowner=src
					Asz.icon='Icons/lightning bullet.dmi'
					Asz.icon_state=""
					Asz.dir = src.dir
					walk(Asz,src.dir)
				spawn(2)
					var/obj/getsugaring/Aszz = new /obj/getsugaring(src.loc)
					Aszz.Gowner=src
					Aszz.icon='Icons/lightning bullet.dmi'
					Aszz.icon_state=""
					Aszz.dir = src.dir
					walk(Aszz,src.dir)
				spawn(2)
					var/obj/getsugaring/Aszzz = new /obj/getsugaring(src.loc)
					Aszzz.Gowner=src
					Aszzz.icon='Icons/lightning bullet.dmi'
					Aszzz.icon_state=""
					Aszzz.dir = src.dir
					walk(Aszzz,src.dir)
				sleep(50)
				src.lightningquincybulletcd=0
				return
		Make_Lightn_Bolt(atom/M)
			var/dista=get_dist(usr,M)
			if(dista>10)return
			var/obj/D=new/obj/LightningBolts/k1(locate(M.x,M.y+1,M.z))
			new/obj/LightningBolts/k1(locate(M.x,M.y+1,M.z))
			new/obj/LightningBolts/k2(locate(M.x,M.y+1,M.z))
			new/obj/LightningBolts/k3(locate(M.x,M.y+1,M.z))
			new/obj/LightningBolts/k4(locate(M.x,M.y+1,M.z))
			new/obj/LightningBolts/k5(locate(M.x,M.y+1,M.z))
			new/obj/LightningBolts/k6(locate(M.x,M.y+1,M.z))
			new/obj/LightningBolts/k7(locate(M.x,M.y+1,M.z))
			new/obj/LightningBolts/k8(locate(M.x,M.y+1,M.z))
			new/obj/LightningBolts/k9(locate(M.x,M.y+1,M.z))
			new/obj/LightningBolts/k10(locate(M.x,M.y+1,M.z))
			new/obj/LightningBolts/k11(locate(M.x,M.y+1,M.z))
			new/obj/LightningBolts/k12(locate(M.x,M.y+1,M.z))
			new/obj/LightningBolts/k13(locate(M.x,M.y+1,M.z))
			new/obj/LightningBolts/k14(locate(M.x,M.y+1,M.z))
			new/obj/LightningBolts/k15(locate(M.x,M.y+1,M.z))
			new/obj/LightningBolts/k16(locate(M.x,M.y+1,M.z))
			new/obj/LightningBolts/k17(locate(M.x,M.y+1,M.z))
			D.Gowner=usr
			usr.lightnbolt=0


		Commander_Bolt()
			if(src.rei < 1500)
				src << "<b>Your rei is too low!"
				return
			if(src.lightnboltcd)
				src<<"<b>You have to wait at least 15 secs"
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
				src.rei-=1500
				src << "<b>Click anywhere to cast a Lightning Bolt!"
				spawn(50)
				src.firing=0
				spawn(10)
				src.lightnboltcd=0

		Lightning_Bolt()
			if(src.spiritweapon!=0) return
			if(!src.chosespirit) return
			if(src.rei < 1500)
				src << "<b>Your rei is too low!"
				return
			if(src.lightnboltcd)
				src<<"<b>You have to wait at least 15 secs"
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
				src.rei-=1500
				src << "<b>Click anywhere to cast a Lightning Bolt!"
				spawn(50)
				src.firing=0
				spawn(70)
				src.lightnboltcd=0
		WindQuincyBullet()
			if(src.spiritweapon!=2) return
			if(!src.chosespirit) return
			if(src.safe||src.fireback)
				src << "<b>You are in safe zone!"
				return
			if(src.rei <= 500)
				src << "<b>Your rei is too low!"
				return
			if(!src.windquincybulletcd)
				src.rei -= 500
				src.windquincybulletcd = 1
				flick("Sword Slash1",src)
				var/obj/getsugaring/A = new /obj/getsugaring(src.loc)
				A.Gowner=src
				A.icon='Icons/wind bullets.dmi'
				A.icon_state=""
				A.dir = src.dir
				walk(A,src.dir)
				var/obj/getsugaring/Ax = new /obj/getsugaring(src.loc)
				Ax.Gowner=src
				Ax.icon='Icons/wind bullets.dmi'
				Ax.icon_state=""
				Ax.dir = src.dir
				walk(Ax,src.dir)
				spawn(2)
					var/obj/getsugaring/Aa = new /obj/getsugaring(src.loc)
					Aa.Gowner=src
					Aa.icon='Icons/wind bullets.dmi'
					Aa.icon_state=""
					Aa.dir = src.dir
					walk(Aa,src.dir)
				spawn(2)
					var/obj/getsugaring/As = new /obj/getsugaring(src.loc)
					As.Gowner=src
					As.icon='Icons/wind bullets.dmi'
					As.icon_state=""
					As.dir = src.dir
					walk(As,src.dir)
				spawn(2)
					var/obj/getsugaring/Asz = new /obj/getsugaring(src.loc)
					Asz.Gowner=src
					Asz.icon='Icons/wind bullets.dmi'
					Asz.icon_state=""
					Asz.dir = src.dir
					walk(Asz,src.dir)
				spawn(2)
					var/obj/getsugaring/Aszz = new /obj/getsugaring(src.loc)
					Aszz.Gowner=src
					Aszz.icon='Icons/wind bullets.dmi'
					Aszz.icon_state=""
					Aszz.dir = src.dir
					walk(Aszz,src.dir)
				spawn(2)
					var/obj/getsugaring/Aszzz = new /obj/getsugaring(src.loc)
					Aszzz.Gowner=src
					Aszzz.icon='Icons/wind bullets.dmi'
					Aszzz.icon_state=""
					Aszzz.dir = src.dir
					walk(Aszzz,src.dir)
				sleep(50)
				src.windquincybulletcd=0
				return
		Wind_Quincy_Stream()
			if(src.spiritweapon!=2) return
			if(!src.chosespirit) return
			if(src.safe||src.fireback)
				return
			if(src.rei <= 500)
				src << "<b>Your rei is too low!"
				return
			if(!src.windquincystreamcd)
				src.windquincystreamcd = 1
				src.rei -= 500
				if(src.etarget)src.Facedir(src.etarget)
				var/obj/K = new/obj/cero(src.loc)
				K.Gowner = src
				K.icon='Icons/wind stream.dmi'
				K:dir = src.dir
				walk(K,src.dir)
				spawn(50)
				src.windquincystreamcd = 0
			return

		Commander_Stream()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 500)
				src << "<b>Your rei is too low!"
				return
			if(!src.windquincystreamcd)
				src.windquincystreamcd = 1
				src.rei -= 500
				if(src.etarget)src.Facedir(src.etarget)
				var/obj/K = new/obj/cero(src.loc)
				K.Gowner = src
				K.icon='Icons/wind stream.dmi'
				K:dir = src.dir
				walk(K,src.dir)
				spawn(20)
				src.windquincystreamcd = 0
			return
