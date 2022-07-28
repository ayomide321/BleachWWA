mob
	Shonshui
		name = "{NPC}Shunsui Kyoraku"
		enemy = 1
		mhealth=30000
		rundelay = 0
		level=200
		shonshui=1
		killable=1
		hostile=1
		legit=1
		mreiatsu = 800
		mrei = 6000
		spawntime = 500
		expgain = 16000
		mattack = 2000
		mdefence = 1200
		healthwas = 40000
		New()
			src.icon_name="Base"
			src.hair_type=/obj/hair/h2/black
			src.rei=src.mrei
			src.reiatsu=src.mreiatsu
			src.health=src.mhealth
			src.attack=src.mattack
			src.defence=src.mdefence
			src.swordon=1
			src.stype="Shonshui"
			src.swordcall="Uugh"
			src.swordname="Do you really want to fight me?"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/shinigami/s1
			src.cloak=/obj/cloak/captain/c1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.Shikai()
			..()
			src.regeneration()
			spawn(2)
			for(var/mob/m in oview())
				var/sound/dd = sound('Sounds/Shunsui/WAVE_VO_SYUN_035_000.wav',volume=50)
				view(src) << "<b>([src.name]: Let's have a drink."
				view(src) << dd
				spawn(5)
					view(src) << "<b>([m]: I'm too young."
					spawn(10)
						var/sound/d = sound('Sounds/Shunsui/WAVE_VO_SYUN_027_P1_000.wav',volume=50)
						view(src) << "<b>([src.name]: My My. . ."
						view(src) << d
						spawn(20)
							var/sound/da = sound('Sounds/Shunsui/WAVE_VO_SYUN_027_P2_000.wav',volume=50)
							view(src) << "<b>([src.name]: And I was hoping we could avoid all this, but here we are."
							view(src) << da
							spawn(30)
								var/sound/ds = sound('Sounds/Shunsui/WAVE_VO_SYUN_026_P1_000.wav',volume=50)
								view(src) << "<b>([src.name]: Unfortunately it means I'm going to have to take your life."
								view(src) << ds
								spawn(15)
									var/sound/daa = sound('Sounds/Shunsui/WAVE_VO_SYUN_026_P2_000.wav',volume=50)
									view(src) << daa
mob
	Chad
		hair_type=/obj/hair/h2/black
		shirt=/obj/Shirt/gray
		shoes=/obj/Shoes/black
		armon=3
		directo=1
		npc=1
		icon_name="BaseTan"
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(usr.race == "Sado"||usr.race == "Chad")
					if(usr.gottatalk==1)
						usr.Story_Talk("You have Spoken with Sado Chad but he tells you to return when your level 200, now that you've been enlightened you question your chosen path, is being a Sado only about seeking the power to protect your friends or is it all about seeking the unstoppable strengths of the devil arms to Obliterate your foes.")
						src.curmis="Talk to Chad near the school at level 200"
						usr.gottatalk=0
						return
					if(usr.level < 200)
						usr << "<b>You are too weak to learn my moves, please train some more."
						return
					if(!usr.gotaarm)
						switch(input("Young warrior. Do you want to learn how to utulize your 2nd arm?", text) in list ("Yes","No"))
							if("Yes")
								usr.canattack=1
								usr.canattacks=0
								usr.firing=0
								usr.safe=0
								usr.wound=0
								usr << "<b>You are trying to help a friend, but Shunsui catches you. You must kill him to unlock your techniques."
								usr.loc=locate(47,54,16)
								usr.dir=EAST
								var/mob/k=new/mob/Shonshui
								k.loc=locate(52,54,16)
								k.dir=WEST
								k.frozen=1
								usr.frozen=1
								k.Load_Overlays()
								sleep(90)
								k.frozen=0
								usr.frozen=0
obj/skillcard
	Arm1
		names = "Arm1"
		icon = 'gui.dmi'
		icon_state = "Arm1"
		layer = MOB_LAYER+100
		Click()
	Hell_Armor
		names = "Hell_Armor"
		icon = 'gui.dmi'
		icon_state= "ssjd"
		layer = MOB_LAYER+100
		Click()
mob/var
	tmp/tekkaion
	tmp/tekkaicd
obj/tekkaisado
	icon='Icons/sado tekkai.dmi'
	layer=50
mob
	proc
		SadoTekkai()
			src.frozen=1
			spawn(10)
			if(!src.tekkaion)
				for(var/mob/M in view(src))
					Quake_Effect(M,4,1)
			spawn(14)
				src.frozen=0
				if(!src.tekkaion)
					src.tekkaion=1
					src.overlays+=/obj/tekkaisado
					src.Load_Overlays()
				//	src.defence+=round(src.mdefence*2,1)
					src.attack += src.mattack*3.5
					src.defence += src.mdefence*3.5
				else
					src.tekkaion=0
					src.defence=src.mdefence
					src.attack=src.mattack
					src.overlays-=/obj/tekkaisado
					src.Load_Overlays()
mob
	proc
		Hell_Armor()
			if(src.safe)
				usr << "<b>You are in safe zone!"
				return
			if(src.devil)
				return
			if(src.goingress)
				return
			if(src.hellon==0)
				src.hellon = 1
				world << "<b>The creator of hell has lent [src.name] his powers!"
				src.defence+=round(src.mdefence/1.7,1)
				src.attack+=round(src.mattack/1.7,1)
				src.reiatsu+=round(src.mreiatsu/1.7,1)
				src.Load_Overlays()
				return
			else
				src.StartShikCool()
				src.arm=0
				src.hardhitted=0
				src.leg=0
				src.core=0
				src.armon = 0
				src.trans=0
				src.hellon=0
				src.attack = src.mattack
				src.defence =src.mdefence
				src.reiatsu=src.mreiatsu
				src.Load_Overlays()

mob
	proc
		Arm1()
			if(src.safe)
				usr << "<b>You are in safe zone!"
				return
			if(src.devil)
				return
			if(src.goingress)
				return
			if(!src.armon)
				src.StartShikCool()
				src.armon = 1
				src.arm=0
				src.hardhitted=0
				src.leg=0
				src.core=0
				view(usr,8) << "<b>[usr] put on his Brazo Derecha de Gigante!"
				src.attack = round(src.mattack*3,1)
				src.defence = round(src.mdefence*1.9,1)
				if(src.key == "Not|JJNH60c")
					src.reiatsu = round(src.mreiatsu*1.9,1)
				if(src.beerboost)
					src.attack+=round(src.mattack/2)
					src.defence+=round(src.mdefence/2)
					src.reiatsu+=round(src.mreiatsu/2)
				src.Load_Overlays()
				return
			else
				src.StartShikCool()
				src.arm=0
				src.hardhitted=0
				src.leg=0
				src.core=0
				src.armon = 0
				src.trans=0
				src.attack = src.mattack
				src.defence =src.mdefence
				if(src.charging)
					src.charging=0
					src.reiatsu-=round(round(src.mreiatsu/50)*src.charge)
					src.charge=0
				if(src.beerboost)
					src.attack+=round(src.mattack/2)
					src.defence+=round(src.mdefence/2)
					src.reiatsu+=round(src.mreiatsu/2)
				if(src.guildpassive>=1)
					src.rundelay=src.rundelay/2
				src.chadref = 0
				src.Load_Overlays()
obj/skillcard
	Arm2
		names = "Arm2"
		icon = 'gui.dmi'
		icon_state = "Arm2"
		layer = MOB_LAYER+100
mob
	proc
		Arm2()
			if(src.safe)
				usr << "<b>You are in safe zone!"
				return
			if(src.devil)
				return
			if(src.goingress)
				return
			if(!src.armon)
				src.StartShikCool()
				src.arm=0
				src.hardhitted=0
				src.leg=0
				src.core=0
				src.armon = 2
				view(usr,8) << "<b>[usr] put on his Brazo Derecha de Gigante!"
				src.attack = round(src.mattack*5.5,1)
				src.defence = round(src.mdefence*5,1)
				if(src.key == "Not|JJNH60c")
					src.reiatsu = round(src.mreiatsu*2.4,1)
				if(src.beerboost)
					src.attack+=round(src.mattack/2)
					src.defence+=round(src.mdefence/2)
					src.reiatsu+=round(src.mreiatsu/2)
				if(src.newsadoking)
					src.defence+=(src.mdefence*6)
					src.attack+=(src.mattack*6)
					src.reiatsu+=(src.mreiatsu*6)
				src.Load_Overlays()
				return
			else
				src.StartShikCool()
				src.arm=0
				src.hardhitted=0
				src.leg=0
				src.core=0
				src.armon = 0
				src.trans=0
				src.attack = src.mattack
				src.defence =src.mdefence
				if(src.charging)
					src.charging=0
					src.reiatsu-=round(round(src.mreiatsu/50)*src.charge)
					src.charge=0
				if(src.beerboost)
					src.attack+=round(src.mattack/2)
					src.defence+=round(src.mdefence/2)
					src.reiatsu+=round(src.mreiatsu/2)
				if(src.guildpassive>=1)
					src.rundelay=src.rundelay/2
				//src.verbs -= new /mob/chad/verb/Rage_of_the_Devil()
				src.chadref = 0
				src.Load_Overlays()
obj/skillcard
	Arm3
		names = "Arm3"
		icon = 'gui.dmi'
		icon_state = "Arm3"
		layer = MOB_LAYER+100
mob
	proc
		Arm3()
			if(src.inbankai)
				goto heresadoarm
			if(src.inshikai)
				usr << "<b>You cannot do that right now!"
				return
			heresadoarm
				if(src.safe)
					usr << "<b>You are in safe zone!"
					return
				if(src.devil)
					return
				if(src.goingress)
					return
				if(!src.armon)
					if(src.level <700)
						src.arm=0
						src.hardhitted=0
						src.leg= 0
						src.StartShikCool()
						src.core= 0
						src.armon= 3
						view(usr,8) << "<b>[usr] put on his Brazo Derecha de Gigante of Sheild!"
						if(src.key=="Adlofs")
							src.attack=round(src.mattack*2.9,1)
							src.defence=round(src.mdefence*3.2,1)
						else
							if(src.key=="Not|CoreBreaker")
								src.attack=round(src.mattack*1.9,1)
								src.defence=round(src.mdefence*2.2,1)
							src.attack=round(src.mattack*7,1)
							src.defence=round(src.mdefence*7,1)
							if(src.key == "Not|JJNH60c")
								src.reiatsu = round(src.mreiatsu*2.9,1)
						if(src.beerboost)
							src.attack+=round(src.mattack/2)
							src.defence+=round(src.mdefence/2)
							src.reiatsu+=round(src.mreiatsu/2)
						if(src.newsadoking)
							src.defence+=(src.mdefence*9)
							src.attack+=(src.mattack*9)
							src.reiatsu+=(src.mreiatsu*9)
					if(src.level >= 700)
						src.StartShikCool()
						src.arm=0
						src.hardhitted=0
						src.leg=0
						src.core=0
						src.armon=4
						//src.verbs += new /mob/chad/verb/Rage_of_the_Devil()
						view(usr,8) << "<b>[usr] put on his Brazo Derecha de Gigante of Sheild and his Brazo Izquierda del Diablo!"
						if(src.key=="Adlofs")
							src.attack=round(src.mattack*4,1)//3.5
							src.defence=round(src.mdefence*6,1)//3
						else
						//	src.attack += src.mattack * 18
						//	src.defence += src.mdefence * 18
							src.attack=round(src.mattack*8,1)//3.5
							src.defence=round(src.mdefence*8,1)//3
						src.chadref = 0
						src.rundelay=1
						if(src.beerboost)
							src.attack+=round(src.mattack/2)
							src.defence+=round(src.mdefence/2)
							src.reiatsu+=round(src.mreiatsu/2)
						if(src.guildpassive>=1)
							src.rundelay=src.rundelay/2
						if(src.karakuraheroplayer==1||src.humanleader==1 || src.newsadoking || src.newhollowking || src.isEspadaLeader)
							src.rundelay-=1
							src.attack+=(src.mattack/20)*3
							src.defence+=(src.mdefence/20)*3
							src.reiatsu+=(src.mreiatsu/20)*3
						if(src.karakuraheroplayer==1||src.humanleader==1 || src.newsadoking || src.newhollowking || src.isEspadaLeader)
							src.defence+=(src.mdefence/4)
						if(src.squad==11||src.karakuraheroplayer==1||src.humanleader==1 || src.newsadoking || src.newhollowking || src.isEspadaLeader)
							src.attack+=(src.mattack/1.9)
						if(src.karakuraheroplayer==1||src.humanleader==1 || src.newsadoking || src.newhollowking)
							src.reiatsu+=(src.mreiatsu/3)
						if(src.karakuraheroplayer==1||src.humanleader==1||src.status || src.newsadoking || src.newhollowking)
							src.defence+=(src.mdefence/3)
							src.attack+=(src.mattack/3)
							src.reiatsu+=(src.mreiatsu/3)
						if(src.key=="")
							src.defence+=src.mdefence
							src.attack+=src.mattack
							src.reiatsu+=src.mreiatsu
						if(src.status=="<font color=green>Demi-God</font>")
							src.defence+=(src.mdefence/2)
							src.attack+=(src.mattack/2)
							src.reiatsu+=(src.mreiatsu/2)
						if(src.newsadoking || src.newquincyking || src.newhollowking)
							src.defence+=(src.mdefence*10)
							src.attack+=(src.mattack*10)
							src.reiatsu+=(src.mreiatsu*10)
						src.Load_Overlays()
					src.Load_Overlays()
					return
				else
					src.StartShikCool()
					src.arm=0
					src.hardhitted=0
					src.leg=0
					src.core=0
					src.armon = 0
					src.trans=0
					src.attack = src.mattack
					src.defence =src.mdefence
					src.reiatsu=src.mreiatsu
					if(src.beerboost)
						src.attack+=round(src.mattack/2)
						src.defence+=round(src.mdefence/2)
						src.reiatsu+=round(src.mreiatsu/2)
					if(src.guildpassive>=1)
						src.rundelay=src.rundelay/2
					//src.verbs -= new /mob/chad/verb/Rage_of_the_Devil()
					src.chadref = 0
					src.Load_Overlays()



		ArmDP()
			if(src.safe)
				usr << "<b>You are in safe zone!"
				return
			if(src.devil)
				return
			if(src.goingress)
				return
			if(src.inshikai)
				usr << "<b>Bankai first."
				return
			if(!src.dparmon)
				src.StartShikCool()
				src.arm=0
				src.hardhitted=0
				src.leg=0
				src.core=0
				src.dparmon = 1
				view(usr,8) << "<font size=3><b>[usr] put on his artifical Brazo Derecha de Gigante of Sheild!"
				src.attack += round(src.mattack*2,1)
				src.defence += round(src.mdefence*2,1)
				if(src.key == "Not|JJNH60c")
					src.reiatsu = round(src.mreiatsu*2.4,1)
				if(src.beerboost)
					src.attack+=round(src.mattack/2)
					src.defence+=round(src.mdefence/2)
					src.reiatsu+=round(src.mreiatsu/2)
				src.Load_Overlays()
				return
			else
				src.StartShikCool()
				src.arm=0
				src.hardhitted=0
				src.leg=0
				src.core=0
				src.dparmon = 0
				src.trans=0
				src.attack = src.mattack
				src.defence =src.mdefence
				if(src.charging)
					src.charging=0
					src.reiatsu-=round(round(src.mreiatsu/50)*src.charge)
					src.charge=0
				if(src.beerboost)
					src.attack+=round(src.mattack/2)
					src.defence+=round(src.mdefence/2)
					src.reiatsu+=round(src.mreiatsu/2)
				if(src.guildpassive>=1)
					src.rundelay=src.rundelay/2
				//src.verbs -= new /mob/chad/verb/Rage_of_the_Devil()
				src.chadref = 0
				src.Load_Overlays()



	/*	ArmDP()
			if(src.inbankai)
				goto heresadoarmdp
			if(src.inshikai)
				usr << "<b>Bankai first."
				return
			if(src.infull && !src.inafull)
				usr << "<b>You're trying too hard....use advanced fullbring first."
				return
			heresadoarmdp
			if(src.safe)
				usr << "<b>You are in safe zone!"
				return
			if(src.devil)
				return
			if(src.goingress)
				return
			if(!src.armon)
				src.arm=0
				src.hardhitted=0
				src.leg= 0
				src.StartShikCool()
				src.core= 0
				src.armon= 5
				view(usr,8) << "<font size=3><b>[usr] put on his artifical Brazo Derecha de Gigante of Sheild!"
				src.attack+=round(src.mattack*0.6,1)
				src.defence+=round(src.mdefence*0.6,1)
				if(src.key == "Not|JJNH60c")
					src.reiatsu = round(src.mreiatsu*0.9,1)
				if(src.beerboost)
					src.attack+=round(src.mattack/2)
					src.defence+=round(src.mdefence/2)
					src.reiatsu+=round(src.mreiatsu/2)
					if(src.guildpassive>=1)
						src.rundelay=src.rundelay/2
					if(src.karakuraheroplayer==1||src.humanleader==1)
						src.rundelay-=1
						src.attack+=(src.mattack/10)
						src.defence+=(src.mdefence/10)
						src.reiatsu+=(src.mreiatsu/10)
					if(src.karakuraheroplayer==1||src.humanleader==1)
						src.defence+=(src.mdefence/6)
					if(src.squad==11||src.karakuraheroplayer==1||src.humanleader==1)
						src.attack+=(src.mattack/1.9)
					if(src.karakuraheroplayer==1||src.humanleader==1)
						src.reiatsu+=(src.mreiatsu/5)
					if(src.karakuraheroplayer==1||src.humanleader==1||src.status)
						src.defence+=(src.mdefence/5)
						src.attack+=(src.mattack/5)
						src.reiatsu+=(src.mreiatsu/5)
					if(src.key=="")
						src.defence+=src.mdefence
						src.attack+=src.mattack
						src.reiatsu+=src.mreiatsu
					if(src.status=="<font color=purple>Demi-God</font>")
						src.defence+=(src.mdefence/2)
						src.attack+=(src.mattack/2)
						src.reiatsu+=(src.mreiatsu/2)
					src.Load_Overlays()
				src.Load_Overlays()
				return
			else
				src.StartShikCool()
				src.arm=0
				src.hardhitted=0
				src.leg=0
				src.core=0
				src.armon = 0
				src.trans=0
				src.attack = src.mattack
				src.defence =src.mdefence
				src.reiatsu=src.mreiatsu
				if(src.beerboost)
					src.attack+=round(src.mattack/2)
					src.defence+=round(src.mdefence/2)
					src.reiatsu+=round(src.mreiatsu/2)
				if(src.guildpassive>=1)
					src.rundelay=src.rundelay/2
				//src.verbs -= new /mob/chad/verb/Rage_of_the_Devil()
				src.chadref = 0
				src.Load_Overlays()	*/
obj/skillcard
	Lamuerte
		names = "Lamuerte"
		icon = 'gui.dmi'
		icon_state = "lamuerte"
		layer = MOB_LAYER+100
mob
	proc
		Lamuerte()
			if(src.safe)
				usr << "<b>You are in safe zone!"
				return
			if(src.muertecool)
				usr<<"You must wait at least 10 seconds to use again"
				return
			if(src.armon<3)
				usr<<"You need your 3rd arm on"
				return
			if(usr.rei<800)
				usr << "<b>You need [rei]/800 rei!"
				return
			if(!src.firing)
				usr.muertecool=1
				usr << "<b>Press F to hit someone with La Muerte!"
				usr.rei-=800
				src.firing = 1
				src.lamuerte=1
				src.Load_Overlays()
				spawn(100)
				usr.muertecool=0
		Bull_Arm()
			if(src.safe)
				usr << "<b>You are in safe zone!"
				return
			if(usr.bull)
				usr<<"You still have [bull] hits left"
				return
			if(src.bullcool)
				usr<<"You must wait at least 10 seconds to use again"
				return
			if(src.armon<3)
				usr<<"You need your 3rd arm on"
				return
			if(usr.rei<600)
				usr << "<b>You need [rei]/600 rei!"
				return
			if(!src.firing)
				usr.bullcool=1
				usr << "<b>Press F to hit someone with Bull Arm!(4 hits total)"
				usr.rei-=600
				src.bull=4
				spawn(100)
				usr.bullcool=0
mob
	proc
		Power_Blast()
			if(usr.safe)
				usr << "<b>You are in safe zone!"
				return
			if(usr.rei<400)
				usr << "<b>You need [rei]/400 rei!"
				return
			if(!usr.powerblastcd)
				usr.rei-=400
				usr.powerblastcd = 1
				var/obj/power1/A = new /obj/power1/
				A.loc = locate(usr.x, usr.y, usr.z)
				A.dir = usr.dir
				A.Gowner = usr
				walk(A,usr.dir)
				sleep(15)
				usr.powerblastcd = 0
		Diablo_Besar()
			if(usr.safe)
				usr << "<b>You are in safe zone!"
				return
			if(usr.rei<400 && !usr.besar)
				usr << "<b>You need [rei]/400 rei!"
				return
			if(usr.diablobesarcd&&!usr.besar)return
			if(usr.besar)
				usr.besar=0
				src.Load_Overlays()
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
				if(!usr.devil)
					sleep(60)
					usr.diablobesarcd = 0
				else
					sleep(45)
					usr.diablobesarcd = 0
			else
				usr << "<b>Press F to shoot Diablo Besar!"
				usr.besar=1
				usr.diablobesarcd=1
				usr.rei-=400
				usr.Load_Overlays()
mob
 var
		tmp/devil = 0
mob
	proc
		El_Directo()
			if(usr.safe)
				usr << "<b>You are in safe zone!"
				return
			if(usr.rei<400 && !usr.directo)
				usr << "<b>You need [rei]/400 rei!"
				return
			if(usr.eldirectocd&&!usr.directo)return
			if(usr.directo)
				usr.directo=0
				src.Load_Overlays()
				var/obj/directo/A = new /obj/directo/
				A.loc = locate(usr.x, usr.y, usr.z)
				A.Gowner = usr
				walk(A,usr.dir)
				sleep(100)
				usr.eldirectocd = 0
			else
				usr << "<b>Press F to shoot El Directo!"
				usr.directo=1
				usr.eldirectocd=1
				usr.rei-=400
				usr.Load_Overlays()
