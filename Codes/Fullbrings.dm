mob/var
	gotaccelfb=0
	gotgetsugajab=0
mob
	proc
		Power_Monsters()
			if(src.safe)
				return
			if(src.rei<2000)
				usr << "<b>Your rei is too low![src.rei]/2000"
				return
			src.rei-=2000
			for(var/mob/monster/m in world)
				if(m.myclone==src)
					m.attack=src.reiatsu*1.5
					m.defence=src.reiatsu*1.5
					m.reiatsu=src.reiatsu*1.5
		Create_Monsters()
			if(src.z==27||src.z==28)
				usr <<"<b>Cannot use that here!"
				return
			if(src.safe)
				return
			if(src.rei<2000)
				usr << "<b>Your rei is too low!"
				return
			if(src.yukiomonstercd>0)
				usr<<"Wait the cool down"
				return
			src.rei-=2000
			var/mob/monster/R = new/mob/monster(src.loc)
			spawn()R.LifeSpan(src,400)
			R.myclone=src
			src.aclones=1
			R.mattack=src.reiatsu*1.4
			R.mdefence=src.reiatsu*1.4
			R.mreiatsu=src.reiatsu*1.4
			R.attack=src.reiatsu*1.4
			R.defence=src.reiatsu*1.4
			R.reiatsu=src.reiatsu*1.4
			R.mrei=1000
			R.rei=1000
			R.mhealth=src.mhealth*3
			R.health=R.mhealth
			R.expgain=src.level*10
			R.level=src.level
			spawn(1)
			R.icon='Icons/monster.dmi'
			src.yukiomonstercd=1
			sleep(25)
			src.yukiomonstercd=0

			var/mob/monster/Ra = new/mob/monster(src.loc)
			spawn()Ra.LifeSpan(src,400)
			Ra.myclone=src
			Ra.mattack=src.reiatsu
			Ra.mdefence=src.reiatsu
			Ra.mreiatsu=src.reiatsu
			Ra.attack=src.reiatsu
			Ra.defence=src.reiatsu
			R.reiatsu=src.reiatsu
			Ra.mrei=1000
			Ra.rei=1000
			Ra.mhealth=src.mhealth*1.5
			Ra.health=R.mhealth
			Ra.expgain=src.level*10
			Ra.level=src.level
			spawn(1)
			Ra.icon='Icons/monster.dmi'
			spawn(600)
			src.aclones=0
			src.yukiomonstercd=1
			sleep(50)
			src.yukiomonstercd=0
		Create_Mini_Kushanada()
			if(src.z==27||src.z==28)
				usr<< "<b>Cannot use that here!"
				return
			if(src.safe)
				return
			if(src.rei<4000)
				usr << "<b>Your rei is too low!"
				return
			if(src.hellsummon>0)
				usr<<"Wait the cool down"
				return
			src.rei-=4000
			var/mob/Mini_Kushanada/R = new/mob/Mini_Kushanada(src.loc)
			spawn()R.LifeSpan(src,400)
			R.myclone=src
			src.aclones=1
			R.mattack=src.reiatsu*1.4
			R.mdefence=src.reiatsu*1.4
			R.mreiatsu=src.reiatsu*1.4
			R.attack=src.reiatsu*1.4
			R.defence=src.reiatsu*1.4
			R.reiatsu=src.reiatsu*1.4
			R.mrei=1000
			R.rei=1000
			R.mhealth=src.mhealth*3
			R.health=R.mhealth
			R.expgain=src.level*10
			R.level=src.level
			spawn(1)
			R.icon='Icons/Hell Guardian (Kushanada).dmi'
			src.hellsummon=1
			sleep(25)
			src.hellsummon=0

			var/mob/Mini_Kushanada/Ra = new/mob/Mini_Kushanada(src.loc)
			spawn()Ra.LifeSpan(src,400)
			Ra.myclone=src
			Ra.mattack=src.reiatsu
			Ra.mdefence=src.reiatsu
			Ra.mreiatsu=src.reiatsu
			Ra.attack=src.reiatsu
			Ra.defence=src.reiatsu
			R.reiatsu=src.reiatsu
			Ra.mrei=1000
			Ra.rei=1000
			Ra.mhealth=src.mhealth*1.5
			Ra.health=R.mhealth
			Ra.expgain=src.level*10
			Ra.level=src.level
			spawn(1)
			Ra.icon='Icons/Hell Guardian (Kushanada).dmi'
			spawn(600)
			src.aclones=0
			src.hellsummon=1
			sleep(50)
			src.hellsummon=0

mob
	monster
		name = "{NPC}Monster"
		enemy = 1
		race="Monster"
		killable=1
		hostile=1
		delay=2
		New()
			src.icon='Icons/monster.dmi'
			..()
mob
	Mini_Kushanada
		name = "{NPC}Mini_Kushanada"
		enemy = 1
		race="Monster"
		killable=1
		hostile=1
		delay=2
		New()
			src.icon='Icons/Hell Guardian (Kushanada).dmi'
			..()
mob
	proc
		Fullbring()
			if(src.goingress)
				return
			if(src.lostpowers)
				src << "<b>You lost your powers!"
				return
			if(src.infull&&!src.inafull||src.inafull&&!src.infull)
				src.StartShikCool()
				src.stolen=0
				src.arm=0
				src.hardhitted=0
				src.leg=0
				src.core=0
				src.infull=0
				src.volcano=0
				src.ulqgotsword=0
				src.bootboost=0
				src.trans=0
				src.big=0
				src.layer=4
				src.infull=0
				src.inafull=0
				src.attack=src.mattack
				src.defence=src.mdefence
				src.reiatsu=src.mreiatsu
				if(src.beerboost)
					src.attack+=round(src.mattack/2)
					src.defence+=round(src.mdefence/2)
					src.reiatsu+=round(src.mreiatsu/2)
				src.Load_Overlays()
				return
			if(src.rei < 1000)
				src << "<b>Your reiatsu is too low![src.rei]/1000"
				return
			if(src.safe)
				return
			src.firing = 1
			src.rei -= 1000
			src.StartShikCool()
			view()<<"<b><FONT FACE=Palatino Linotype><FONT COLOR=#808080>[src]'s Fullbring is releasing!"
			src.protected=1
			src.frozen=1
			new/obj/fullbringrelease(src.loc)
			sleep(9)
			src.arm=0
			src.hardhitted=0
			src.leg=0
			src.core=0
			src.protected=0
			src.frozen=0
			view(8) << "<b>[src]:[src.swordname]!"
			src.firing = 1
			src.infull=1
			if(src.ftype=="Dark Bat")
				if(src.key=="Dblake1012"||src.key=="WSHGC"||src.key=="WorldStar"||src.key=="MasterGOA")
					src.attack += src.mattack * 7
					src.reiatsu += src.mreiatsu * 7
					src.defence += src.mdefence *7
				else

					src.attack += src.mattack * 2.6
					src.reiatsu += src.mreiatsu * 2.6
					src.defence += src.mdefence *2.6
				src.Load_Overlays()
			if(src.ftype=="Shishigawara")
				src.attack+=round(src.mattack*1.6,1)
				src.defence += round(src.mdefence*1.4,1)
				src.rundelay=1
		/*		if(src.gotshishiskills==0)
					src.contents+=new/obj/skillcard
					src.gotshishiskills=1*/
			if(src.ftype=="Water Doll")
				src.reiatsu += round(src.mreiatsu*3.4,1)
				src.Load_Overlays()
				if(!src.gotwaterdollskills)
					src.gotwaterdollskills=1
					src.contents+=new/obj/skillcard/WaterBullet
					src.contents+=new/obj/skillcard/WaterWave
					src.contents+=new/obj/skillcard/WaterBolt
					src.contents+=new/obj/skillcard/WaterHeavens
					src.RefreshSkillList()
			if(src.ftype=="Fire Doll")
				src.reiatsu += round(src.mreiatsu*3,1)
				src.Load_Overlays()
				if(!src.gotfiredollskills)
					src.gotfiredollskills=1
					src.contents+=new/obj/skillcard/FireBullet
					src.contents+=new/obj/skillcard/FireSlash
					src.contents+=new/obj/skillcard/Heat_Wave
					src.contents+=new/obj/skillcard/FireBolt
					src.RefreshSkillList()
					if(src.key=="Adlofs")
						src.contents-=/obj/skillcard/FireBolt
						src.contents-=/obj/skillcard/FireBullet
						src.RefreshSkillList()

			if(src.ftype=="Wings")
				src.reiatsu += round(src.mreiatsu*2.5,2)
				src.defence += round(src.mdefence*1.5,1)
				src.Load_Overlays()
			if(src.ftype=="Samurai")
				if(src.key in specialverbs||src.key=="Malcolm24x11")
					src.attack +=src.mattack*10
					src.defence += src.mdefence *10
					src.rundelay= 1
				//	src.flashpause = 1
					src.rei += 20000
					src.mrei += 20000
					src.reiatsu += src.mreiatsu * 40
					src.Load_Overlays()
				if(src.key=="Dragonpearl123")
					src.attack +=src.mattack*40
					src.defence += src.mdefence *40
					src.rei += 20000
					src.mrei += 20000
					src.reiatsu += src.mreiatsu * 40
				src.attack += round(src.mattack*3,1)
				src.defence += round(src.mdefence*3,1)
				src.Load_Overlays()
			if(src.ftype=="Jackie")
				src.attack += round(src.mattack*2.4,1)
				if(src.enemy)src.attack += round(src.mattack/2,1)
				src.bootboost=0
				src.rundelay=1
				if(!src.gotkick)
					src.gotkick=1
					src.contents +=new/obj/skillcard/Critical_Hit
					src.RefreshSkillList()
					src << "<b><font color = lime>Ability Info:You learned Critical Hit!"
			if(src.ftype=="Inoue")
				src.defence += round(src.mdefence*3,1)
				if(!src.gotsheild)
					src.gotsheild=1
					src.rundelay=1.5
					src.contents +=new/obj/skillcard/Santen_Kesshun
					src.contents +=new/obj/skillcard/Koten_Zanshun
					src.RefreshSkillList()
					src << "<b><font color = lime>Ability Info:You learned Santen Kesshun!"
			if(src.ftype=="Ichigo")
				if(src.key=="CoreBreaker")
					src.attack += round(src.mattack*3.6,1)
					src.reiatsu += round(src.mreiatsu*3.6,1)
				src.attack += round(src.mattack*2,1)
				src.reiatsu += round(src.mreiatsu*2,1)
				if(src.getsugaring>=150)
					src.defence += round(src.mdefence*0.9,1)
				if(!src.gotring)
					src.gotring=1
					src.contents +=new/obj/skillcard/Getsuga_Ring
					src.RefreshSkillList()
					src << "<b><font color = lime>Ability Info:You learned Getsuga Ring!"
			if(src.ftype=="Ginjo")
				src.contents|=new/obj/skillcard/Power_Transfer
				src.RefreshSkillList()
				src.defence += round(src.mdefence*2,2)
				src.attack += round(src.mattack*2,1)
				if(src.bringerblast>=100)
					src.defence += round(src.mdefence*0.7,1)
					src.attack += round(src.mattack*0.7,1)
				if(!src.gotbringerb)
					src.gotbringerb=1
					src.contents +=new/obj/skillcard/Bringer_Blast
					src.contents -=new/obj/skillcard/Getsuga_Tenshou
					src.RefreshSkillList()
					src << "<b><font color = lime>Ability Info:You learned Bringer Blast!"
			if(src.ftype=="Tsukishima")
				src.attack += round(src.mattack*2.5,1)
				src.defence += round(src.mdefence*2,1)
				if(src.thits>=200)
					src.attack += round(src.mattack*1.6,1)
				if(!src.gothits)
					src.gothits=1
					src.contents +=new/obj/skillcard/First_Hit
					src.contents +=new/obj/skillcard/Second_Hit
					src.contents +=new/obj/skillcard/Third_Hit
					src.contents +=new/obj/skillcard/Forth_Hit
					src.RefreshSkillList()
					src << "<b><font color = lime>Ability Info:You learned the Hits of Memory!"
			if(src.ftype=="Yukio")
				src.attack += round(src.mattack*1.4,1)
				src.reiatsu += round(src.mreiatsu*1.4,1)
				if(!src.gotgame)
					src.gotgame=1
					src.contents +=new/obj/skillcard/Create_Monsters
					src.contents +=new/obj/skillcard/Save_Freeze
					src.contents +=new/obj/skillcard/Game_Trap
					src.RefreshSkillList()
					src << "<b><font color = lime>Ability Info:You learned Game Trap!"
			if(src.beer1)
				src.rundelay+=3
			if(src.guildpassive>=1)
				src.rundelay=src.rundelay/2
			src.Load_Overlays()
			sleep(1)
			src.firing = 0
mob
	proc
		AFullbring()
			if(src.safe)
				src << "<b>You are in safe zone!"
				return
			if(src.rei <= 0&&!src.inafull)
				src << "<b>Your rei is too low!"
				return
			if(src.lostpowers)
				src << "<b>You lost your powers!"
				return
			if(!src.inafull)
				if(src.infull)
					if(src.frozen)
						return
					src.arm=0
					src.hardhitted=0
					src.leg=0
					src.core=0
					src.stolen=0
					if(src.charging)
						src.charging=0
						src.reiatsu-=round(round(src.mreiatsu/50)*src.charge)
						src.attack-=round(round(src.mattack/50)*src.charge)
						src.defence-=round(round(src.mdefence/50)*src.charge)
						src.charge=0
					src.inafull = 1
					src.infull = 0
					src.protected=1
					flick("bankai",src)
					src.frozen = 1
					view(8) << "<b>[src]: Fullbring! [src.swordname]!"
					src.dir = SOUTH
					spawn(33)
						src.frozen = 0
						src.protected=0
						src.Load_Overlays()
					if(src.ftype=="Dark Bat")
						if(src.key=="Dblake1012"||src.key=="WSHGC"||src.key=="WorldStar"||src.key=="MasterGOA")
							src.attack += src.mattack * 9
							src.reiatsu += src.mreiatsu * 9
							src.defence += src.mdefence *9
						else
							src.reiatsu += src.mreiatsu * 3.8
							src.defence += src.mdefence * 3.8
							src.attack += src.mattack*3.8
						src.rundelay = 1
						src.Load_Overlays()
					if(src.ftype == "Ichigo")
						src.reiatsu += src.mreiatsu*2.4
						src.defence += src.mdefence*2.4
						if(src.gotaccelfb==0)
							src.contents+=new/obj/skillcard/Acceleration
							src.contents+=new/obj/skillcard/Decimate
							src.RefreshSkillList()
							src.gotaccelfb=1
						if(src.gotgetsugajab==0)
							src.contents+=new/obj/skillcard/Getsuga_Jab
							src.RefreshSkillList()
							src.gotgetsugajab=1
						src.rundelay=1
						src.Load_Overlays()
					if(src.ftype=="Water Doll")
						src.reiatsu += src.mreiatsu*4.8
						src.rundelay=1
						src.Load_Overlays()
					if(src.ftype=="Wings")
						src.reiatsu += src.mreiatsu*3.5
						src.defence += src.mdefence*2
						src.Load_Overlays()
					if(src.ftype=="Samurai")
						if(src.key in specialverbs||src.key=="Malcolm24x11")
							src.attack +=src.mattack*10
							src.defence += src.mdefence *10
							src.rei += 20000
							src.mrei += 20000
							src.reiatsu += src.mreiatsu * 15
							src.rundelay= 1
						//	src.flashpause=1
							src.Load_Overlays()
						if(src.key=="Dragonpearl123")
							src.attack +=src.mattack*40
							src.defence += src.mdefence*40
							src.rei += 20000
							src.mrei += 20000
							src.reiatsu += src.mreiatsu *15
							src.Load_Overlays()
						src.attack += round(src.mattack*3.5,1)
						src.defence += round(src.mdefence*3.5,1)
						src.Load_Overlays()
					if(src.ftype=="Fire Doll")
						src.reiatsu += round(src.mreiatsu*4,1)
						src.rundelay=1
						src.Load_Overlays()
						if(!src.gotfiredollskills2)
							src.gotfiredollskills2=1
							src.contents+=new/obj/skillcard/FireBurning
							src.contents+=new/obj/skillcard/FireRing
							src.RefreshSkillList()
							if(src.key=="Adlofs")
								src.contents-=/obj/skillcard/FireBolt
								src.contents-=/obj/skillcard/FireBullet
								src.RefreshSkillList()
					if(src.ftype=="Inoue")
						src.defence += src.mdefence*3
						src.rei = src.mrei * 2
						if(!src.gottsubaki)
							src.gottsubaki=1
							src.contents +=new/obj/skillcard/Soten_Kisshun
							src.RefreshSkillList()
							src << "<b><font color = lime>Ability Info:You learned Soten Kisshun!"
					if(src.ftype == "Jackie")
						src.attack += src.mattack*3.1
						src.rundelay=1
						if(src.enemy)src.attack += round(src.mattack*1.6,1)
						if(!src.gotrev)
							src.gotrev=1
							src.contents+=new/obj/skillcard/Rev_Up
							src.RefreshSkillList()
							src<<"<b><font color = lime>Ability Info:You learned Rev Up!"
						src.Load_Overlays()
					if(src.ftype == "Ginjo")
						src.defence += src.mdefence*3
						src.attack += src.mattack*3
						if(src.gotginjogrc==0)
							src.contents+=new/obj/skillcard/Gran_Rey_Cero
							src.RefreshSkillList()
							gotginjogrc=1
						src.rundelay=1
						src.Load_Overlays()
					if(src.ftype=="Shishigawara")
						src.attack+=round(src.mattack*2.5,1)
						src.defence += round(src.mdefence*2.5,1)
						src.rundelay=1
						src.Load_Overlays()
					if(src.ftype == "Tsukishima")
						src.attack += src.mattack*3
						src.defence+= src.mdefence*2
						src.Load_Overlays()
					if(src.ftype == "Yukio")
						src.reiatsu += round(src.mreiatsu*3,1)
						src.attack += round(src.mattack*3,1)
						src.defence += round(src.mdefence*2,1)
						src.Load_Overlays()
					spawn(34)
						if(src.beer1)
							src.rundelay+=3
						if(src.guildpassive>=1)
							src.rundelay=src.rundelay/2
						if(src.beerboost)
							src.attack+=round(src.mattack/2)
							src.defence+=round(src.mdefence/2)
							src.reiatsu+=round(src.mreiatsu/2)
						if(src.karakuraheroplayer==1||src.humanleader==1)
							src.rundelay-=1
							src.attack+=(src.mattack/20)*3
							src.defence+=(src.mdefence/20)*3
							src.reiatsu+=(src.mreiatsu/20)*3
						if(src.karakuraheroplayer==1||src.humanleader==1)
							src.defence+=(src.mdefence/4)
						if(src.karakuraheroplayer==1||src.humanleader==1||src.status)
							src.attack+=(src.mattack/4)
						if(src.karakuraheroplayer==1||src.humanleader==1)
							src.reiatsu+=(src.mreiatsu/3)
						if(src.karakuraheroplayer==1||src.humanleader==1||src.status)
							src.defence+=(src.mdefence/3)
							src.attack+=(src.mattack/3)
							src.reiatsu+=(src.mreiatsu/3)
						if(src.key=="")
							src.defence+=src.mdefence
							src.attack+=src.mattack
							src.reiatsu+=src.mreiatsu
						if(src.status=="<font color=purple>Demi-God</font>")
							src.defence+=(src.mdefence/2)
							src.attack+=(src.mattack/2)
							src.reiatsu+=(src.mreiatsu/2)
					if(src.status=="<font color=purple>Soul King's Heir</font>")
						src.defence+=src.mdefence
						src.attack+=src.mattack
						src.reiatsu+=src.mreiatsu
mob
	proc
		Finalbring()
			if(src.safe)
				src << "<b>You are in safe zone!"
				return
			if(src.rei <= 0&&!src.inafull)
				src << "<b>Your rei is too low!"
				return
			if(src.fgtcool)
				src << "<b>You must wait at least 5 mins!"
				return
			if(src.inafull)
				if(src.frozen)
					return
				src.arm=0
				src.hardhitted=0
				src.leg=0
				src.core=0
				src.stolen=0
				src.overlays+=/obj/fullbringrelease2
				if(src.charging)
					src.charging=0
					src.reiatsu-=round(round(src.mreiatsu/50)*src.charge)
					src.attack-=round(round(src.mattack/50)*src.charge)
					src.defence-=round(round(src.mdefence/50)*src.charge)
					src.charge=0
				src.inafull = 1
				src.infull = 0
				src.protected=1
				src.frozen = 1
				view(8) << "<b>[src]: Finalbring! [src.swordname]!"
				src.dir = SOUTH
				spawn(11)
					src.frozen = 0
					src.protected=0
					src.infinal=1
					src.fgtmax+=5
					if(src.fgtmax>100)src.fgtmax=100
					src.Load_Overlays()
					src.FGTTime()
obj/fullbringrelease
	icon='Icons/fullbring.dmi'
	layer=15
	New()
		..()
		flick("create",src)
		spawn(9)
		del src
obj/fullbringrelease2
	icon='Icons/fullbring.dmi'
	layer=15
	New()
		..()
		flick("final",src)
		spawn(11)
		del src
obj/revup
	icon='Icons/F_Mud.dmi'
	layer=15
	New()
		..()
		flick("create",src)
		spawn(4)
		del src