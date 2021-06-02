//CHECK
mob/var
	bossss=0
obj
 var
		tmp/notenemy = 0
mob
	var
		aacandropdualzan=0
		yamadropfiresword=0
mob
 shinigaminormal
		name = "{NPC}Shinigami"
		enemy = 1
		level=100
		health = 10000
		attack = 400
		defence = 400
		reiatsu = 400
		mattack = 400
		mdefence = 400
		mreiatsu = 400
		killable=1
		mrei = 1000
		rei=1000
		mhealth = 23000
		healthwas = 23000
		race="Shinigami"
		spawntime = 200

		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			expgain=rand(450000,500000)
			src.swordon=1
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=pick(/obj/overshirt/shinigami/s1,/obj/overshirt/shinigami/s2)
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.StypeGen()
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)

mob
	var/canRegenRei=0
	New()
		if(src.enemy&&!src.npccaptain&&!src.npcespada)
			src.mhealth=(src.mhealth*3)//+10000
			//src.mhealth=src.level*
			src.mreiatsu+=50
			src.mdefence+=50
			src.mattack+=50
			src.mreiatsu=round(src.mreiatsu*1.45,1)
			src.mattack=round(src.mattack*1.45,1)
			src.mdefence=round(src.mdefence*1.1,1)
			src.reiatsu=round(src.reiatsu*1.3,1)
			src.attack=round(src.attack*1.45,1)
			src.defence=round(src.defence*1.1,1)
		if(src.level<150&&src.enemy&&!src.npccaptain&&!src.npcespada)
			src.mhealth=round(src.mhealth*0.75,1)
		if(src.isavasto)
			src.mhealth=2
			src.healthwas=2
			src.health=2
			src.spawntime=200
			src.mdefence=99999999999999999
			src.defence=99999999999999999
		..()
		spawn(10)

			expgain=round(expgain*10,1)//2.8
			expgain=round(expgain/10,1)
			src.origexp=src.expgain
mob
	quincy
		name = "{NPC}Quincy"
		enemy = 1
		level=100
		mhealth = 10000
		mattack = 400
		killable=1
		mdefence = 400
		reiatsu = 400
		mreiatsu= 400
		healthwas = 15000
		mrei = 4300
		rei=4350
		healthgain = 0
		reigain = 0
		strgain = 0
		race="Quincy"
		defgain = 0
		reipgain = 0
		spawntime = 200
		New()
			expgain = rand(550000,650000)
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.bowon=1
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/quincy/s1
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)
	quincystrong
		name = "{NPC}Strong Quincy"
		enemy = 1
		level=150
		mhealth = 15000
		mattack = 600
		killable=1
		mdefence = 600
		reiatsu = 600
		mreiatsu= 600
		healthwas = 20000
		mrei = 10500
		rei=10350
		quincystrong=1
		race="Quincy"
		defgain = 0
		reipgain = 0
		spawntime = 300

		New()
			expgain=rand(700000,800000)
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.bowon=1
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/quincy/s1
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)
	quincyultimate
		name = "{NPC}Ultimate Quincy"
		enemy = 1
		level=400
		mhealth = 40000
		attack = 1600
		mattack = 1600
		killable=1
		ultimatequincy=1
		defence = 1600
		reiatsu = 1600
		mdefence = 1600
		mreiatsu = 1600
		healthwas = 70000
		mrei = 20000
		rei=20000
		healthgain = 0
		reigain = 0
		strgain = 0
		race="Quincy"
		defgain = 0
		reipgain = 0
		spawntime = 300

		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.bowon=1
			expgain = rand(800000,880000)
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/quincy/s1
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)
	pspfullbringer
		name = "{NPC}Fullbringer"
		enemy = 1
		level=500
		mhealth = 60000
		attack = 2500
		mattack = 2500
		killable=1
		defence = 2500
		reiatsu = 2500
		mdefence = 2500
		mreiatsu = 2500
		healthwas = 60000
		mrei = 5000
		rei=5000
		psp=1
		instinct=3
		berserk=5
		healthgain = 0
		reigain = 0
		strgain = 0
		race="Fullbringer"
		defgain = 0
		reipgain = 0
		spawntime = 300

		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.FtypeGen()
			src.getsugaring=rand(1,300)
			src.bringerblast=rand(1,200)
			expgain=rand(700000,750000)
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)
	vaizards
		name = "{NPC}Vaizard"
		enemy = 1
		level=500
		mhealth = 80000
		attack = 3000
		mattack = 3000
		hostile=1
		killable=1
		defence = 3000
		reiatsu = 3000
		mdefence = 3000
		mreiatsu = 3000
		healthwas = 60000
		mrei = 5000
		rei=5000
		instinct=4
		berserk=5
		healthgain = 0
		reigain = 0
		strgain = 0
		race="Vaizard"
		defgain = 0
		reipgain = 0
		spawntime = 400

		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.maskuses=pick(1,10,50)
			expgain=rand(700000,830000)
			src.oldspot = src.loc
			src.ClothesGen()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.swordon=1
			src.hasabankai=1
			src.hasashikai=1
			src.weapon=/obj/weapon/sword
			src.StypeGen()
			src.CeroGen()
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)
	lostvaizscout
		name = "{NPC}Lost Vaizard Scout"
		enemy = 1
		lostvai=1
		agrange=8
		level=700
		mhealth = 80000
		attack = 5000
		mattack = 5000
		killable=1
		delay=2
		defence = 5000
		reiatsu = 5000
		mdefence = 5000
		mreiatsu = 5000
		healthwas = 80000
		mrei = 9000
		rei=9000
		instinct=5
		berserk=5
		healthgain = 0
		reigain = 0
		strgain = 0
		race="Vaizard"
		defgain = 0
		reipgain = 0
		vasto=1
		maskon=1
		mask=7
		spawntime = 500

		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			expgain=rand(1000000,1200000)
			src.maskuses=100
			src.oldspot = src.loc
			src.ClothesGen()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.swordon=1
			src.hasabankai=1
			src.hasashikai=1
			src.weapon=/obj/weapon/sword
			src.StypeGen()
			src.CeroGen()
			..()
		verb/Talk()
			set src in oview(1)
			if(usr.talkin==3)
				src.frozen=1
				src.Talks("Aizen has ruined the name of Vaizards and turned us against each other")
				src.Facedir(usr)
				usr.Facedir(src)
				sleep(20)
				src.Talks("Aizen is planning on using the Hougyoku for world domination")
				sleep(20)
				src.Talks("First he's going to destroy Soul Society and crush their portal, so theres no way of any survivors chasing him")
				sleep(70)
				src.Talks("Then he's gonna let his Arrancars wreak havoc on Earth and destroy bars, school, towers, etc")
				sleep(40)
				src.Talks("Then Aizen will personally kill the Karaku Town Heroes and any else in his way")
				sleep(50)
				src.Talks("The sad part about it is that . . .")
				sleep(50)
				src.Talks("YOU are the only one that can beat him")
				sleep(50)
				src.Talks("*sobs*Destroy Aizen and his Espadas")
				if(usr in view(8,src))
					usr.talkin=4
					usr.curpart="Part 10: The Final battle"
					usr.curmis="Kill all the espadas"
					usr.storycom=90
	lostvaizs
		name = "{NPC}Lost Vaizard"
		enemy = 1
		lostvai=1
		agrange=8
		level=700
		mhealth = 80000
		attack = 5000
		mattack = 5000
		hostile=1
		killable=1
		delay=2
		legit=1
		legit2=1
		defence = 5000
		reiatsu = 5000
		mdefence = 5000
		mreiatsu = 5000
		healthwas = 80000
		mrei = 9000
		rei=9000
		instinct=5
		quickflash=4
		berserk=5
		healthgain = 0
		reigain = 0
		strgain = 0
		race="Vaizard"
		defgain = 0
		reipgain = 0
		vasto=1
		maskon=1
		mask=7
		spawntime = 500
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.maskuses=100
			expgain=rand(760000,765000)
			src.oldspot = src.loc
			src.ClothesGen()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.swordon=1
			src.hasabankai=1
			src.hasashikai=1
			src.weapon=/obj/weapon/sword
			src.StypeGen()
			src.CeroGen()
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)
	finalshini
		name = "{NPC}Final Shinigami"
		enemy = 1
		agrange=10
		fgetsugas=1
		level=800
		mhealth = 80000
		attack = 11500
		mattack = 11500
		hostile=1
		killable=1
		delay=3
		defence = 9500
		reiatsu = 9000
		mdefence = 9500
		mreiatsu = 9000
		healthwas = 80000
		mrei = 12000
		rei=12000
		instinct=5
		quickflash=5
		infinal=1
		legit=1
		legit2=1
		berserk=5
		race="Final Shinigami"
		spawntime = 600
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			expgain=rand(1800000,2000000)
			src.oldspot = src.loc
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.swordon=1
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
					return
	subshini
		name = "{NPC}Sub-Shinigami"
		enemy = 1
		agrange=12
		level=1500
		mhealth = 825000
		attack = 35500
		mattack = 35500
		hostile=1
		killable=1
		delay=1
		defence = 20000
		reiatsu = 35000
		mdefence = 20000
		mreiatsu = 35000
		healthwas = 825000
		mrei = 20000
		rei=20000
		instinct=5
		quickflash=5
		berserk=5
		race="Sub-Shinigami"
		spawntime = 800
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.getsugaring=rand(1,300)
			src.bringerblast=rand(1,200)
			expgain=rand(3000000,3500000)
			src.oldspot = src.loc
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.swordon=1
			src.hasabankai=1
			src.hasashikai=1
			src.weapon=/obj/weapon/sword
			src.FtypeGen()
			src.StypeGen()
			src.ClothesGen()
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
					return
	quincyvand
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
			expgain=rand(3900000,4500000)
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
					return
	sado
		name = "{NPC}Sado"
		enemy = 1
		level=100
		mhealth = 10000
		attack = 400
		killable=1
		defence = 400
		reiatsu = 400
		mreiatsu= 400
		healthwas = 20000
		mrei = 1500
		rei=1350
		healthgain = 0
		race="Sado"
		expgain = 500
		spawntime = 300
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			expgain=rand(350000,550000)
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)
	sadostrong
		name = "{NPC}Strong Sado"
		enemy = 1
		level=300
		mhealth = 30000
		mattack = 1200
		attack = 1200
		killable=1
		defence = 1200
		reiatsu = 1200
		mdefence = 1000
		mreiatsu = 1200
		healthwas = 59000
		mrei = 4300
		rei=4350
		sadostrong=1
		race="Sado"
		spawntime = 300
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack");src.HairGen();expgain=rand(600000,700000);src.oldspot = src.loc;src.ClothesGen()
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)
	sadoultimate
		name = "{NPC}Ultimate Sado"
		enemy = 1
		level=400
		mhealth = 40000
		mattack = 2000
		killable=1
		ultimatesado=1
		mdefence = 2000
		mreiatsu = 2000
		healthwas = 70000
		mrei = 7000
		rei=7000
		race="Sado"
		spawntime = 300
		bloodlust=1
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			expgain = rand(800000,900000)
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)
mob
 meno
		name = "{NPC}Menos Grande"
		//icon = 'meno.dmi'
		//icon_state = ""
		enemy = 1
		level=220
		health = 20000
		mhealth=20000
		attack = 2000
		defence = 1600
		mattack = 2000
		mdefence= 1600
		mreiatsu= 4500
		menos=1
		race="Hollow"
		hollowtype="meno"
		killable=1
		hostile=1
		reiatsu = 4500
		healthwas = 40000
		mrei=4000
		rei=4000
		spawntime = 550
		New()
			src.CeroGen()
			src.expgain = rand(450000,600000)
			..()
			src.overlays += /obj/Menos/m1
			src.overlays += /obj/Menos/m2
			src.overlays += /obj/Menos/m3
			src.overlays += /obj/Menos/m4
			src.overlays += /obj/Menos/m5
			src.overlays += /obj/Menos/m6
			src.overlays += /obj/Menos/m7
			src.overlays += /obj/Menos/m8
			src.oldspot = src.loc
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)


mob
	bathollow
		name = "{NPC}Hollow"
		enemy = 1
		killable=1
		level=20
		health = 1000
		mhealth = 1000
		attack = 50
		defence = 100
		reiatsu = 100
		race="Hollow"
		icon='Icons/pantherhollow2.dmi'
		healthwas = 600
		spawntime = 200
		New()
			expgain = rand(400000,550000)
			//icon=pick('bathollow.dmi','bathollow2.dmi','bathollow3.dmi','bathollow4.dmi','bathollow5.dmi','bathollow6.dmi')
			src.oldspot = src.loc
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)
mob
 hollow
		name = "{NPC}Hollow"
		enemy = 1
		level=50
		health = 5000
		mhealth =5000
		attack = 90
		defence =180
		reiatsu =180
		mattack =90
		mdefence=180
		mreiatsu=180
		healthwas = 10000
		mrei=1000
		rei=1000
		killable=1
		healthgain =0
		race="Hollow"
		icon='Icons/pantherhollow.dmi'
		agrange=1
		hostile=1
		rundelay=4
		spawntime = 200
		New()
			expgain = rand(200000,200000)
			//icon=pick('spiderhollow.dmi','spiderhollowblue.dmi','spiderhollowgray.dmi','spiderhollowgreen.dmi','spiderhollowred.dmi','spiderhollowyellow.dmi')
			src.oldspot = src.loc
			src.CeroGen()
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)
mob
 var
		tmp/fighting = 0



mob
 var
		var/ceroc = 0
mob
	blank
		name = "{NPC}Blank"
		icon_name='Icons/Blank2.dmi'
		level=700
		enemy = 1
		agrange=17
		mhealth = 150000
		health = 150000
		race="Blank"
		mattack = 25000
		mdefence = 5000
		mreiatsu = 10000
		attack = 25000
		defence = 5000
		reiatsu = 10000
		healthwas = 150000
		mrei=12325
		rei=12325
		hostile=1
		agrange=10
		killable=1
		spawntime = 400
		rundelay=0
		New()
			src.oldspot = src.loc
			expgain=rand(450000,520000)
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
					return
	stronghollow
		name = "{NPC}Strong Hollow"
		//icon = 'hollowstrong.dmi'
		//icon_state = ""
		level=149
		enemy = 1
		mhealth = 15000
		health = 15000
		race="Hollow"
		hollowtype="strong"
		mattack = 400
		mdefence = 90
		mreiatsu = 600
		attack = 400
		defence = 90
		reiatsu = 600
		healthwas = 29000
		mrei=2000
		rei=2000
		hostile=1
		isstrongh=1
		agrange=4
		killable=1
		spawntime = 240
		New()
			src.overlays += /obj/nstrong1
			src.overlays += /obj/nstrong2
			src.overlays += /obj/nstrong3
			src.overlays += /obj/nstrong4
			//src.overlays += /obj/strong5
			src.oldspot = src.loc
			expgain = rand(400000,550000)
			src.CeroGen()
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)
mob
 var
		tmp/vailast = 0
mob
 arrancar1
		name = "{NPC}Numero Arrancar"
		enemy = 1
		race="Arrancar"
		level=350
		killable=1
		hostile=1
		rundelay = 0
		mhealth = 60000
		mattack = 7400
		mdefence = 1400
		health = 60000
		attack = 7400
		defence = 1400
		mreiatsu = 7400
		reiatsu = 7400
		mrei=6000
		rei=6000
		healthwas = 50000
		healthgain = 0
		swordon=1
		spawntime = 600
		New()
			expgain = rand(470000,580000)
			src.oldspot = src.loc
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.ressurectiontype=pick("Tijereta","Volcanica","Halibel","Nnoitra","Zommari","Pantera","Del Toro","Ulq","Shooter","Scientist","Skeleton","Nell","Luppi")
			src.HairGen()
			src.arrancarmask=rand(1,17)
			src.overshirt=pick(/obj/cloak/espada/e1,/obj/cloak/espada/e2)
			src.weapon=/obj/weapon/sword
			src.StypeGen()
			src.CeroGen()
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)
mob
 shinigamiseat
		enemy = 1
		rundelay = 0
		level=200
		mhealth = 20000
		attack = 800
		defence = 800
		mattack = 800
		mdefence = 800
		race="Shinigami"
		reiatsu = 800
		mreiatsu = 800
		mrei=4000
		rei=4000
		spawntime = 300
		healthwas = 40000
		healthgain =40000
		killable=1
		hasashikai=1
		New()
			var/k=pick(3,4,5)
			if(k==3)src.name="{NPC} Shinigami 3rd Seat"
			if(k==4)src.name="{NPC} Shinigami 4th Seat"
			if(k==5)src.name="{NPC} Shinigami 5th Seat"
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.swordon=1
			src.expgain=rand(400000,450000)
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=pick(/obj/overshirt/shinigami/s1,/obj/overshirt/shinigami/s2)
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.StypeGen()
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)
mob
 shinigamilieu
		name = "{NPC}Shinigami Lieutenant"
		enemy = 1
		rundelay = 0
		level=300
		mhealth = 40000
		mattack = 12000
		mdefence = 7000
		race="Shinigami"
		mreiatsu = 12000
		mrei=4000
		rei=4000
		spawntime = 500
		healthwas = 55000
		healthgain = 55000
		killable=1
		hasashikai=1
		hasabankai=1
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.swordon=1
			expgain = rand(535000,645000)
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=pick(/obj/overshirt/shinigami/s1,/obj/overshirt/shinigami/s2)
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.StypeGen()
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)

mob
 shinigamicaptain
		name = "{NPC}Shinigami Captain"
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.swordon=1
			src.expgain=rand(800000,920000)
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.cloak=pick(/obj/cloak/captain/c2,/obj/cloak/captain/c1)
			src.overshirt=pick(
			prob(70);/obj/overshirt/shinigami/s1,
			prob(30);0)
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.StypeGen()
			..()
		enemy = 1
		killable=1
		rundelay = 0
		mhealth = 100000
		level=650
		race="Shinigami"
		mattack = 25500
		mdefence = 25500
		attack = 25500
		defence = 25500
		reiatsu = 25500
		mreiatsu = 25500
		mrei = 8000
		hostile=1
		legit=1
		legit2=1
		spawntime = 600
		healthwas = 60000
		hasashikai=1
		hasabankai=1
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)

mob
 var
		tmp/vert = 0
obj
 ccharge
		icon = 'Icons/cerocharge.dmi'
		layer = 100
		zer = 1
		New()
			spawn(8)
			del src
mob
 arrancar2
		name = "{NPC}Espada Arrancar"
		icon_state = ""
		enemy = 1
		race="Arrancar"
		killable=1
		hostile=1
		level=650
		rundelay = 1
		mhealth = 75000
		swordon=1
		rei = 8000
		mattack = 15500
		mdefence = 5500
		mreiatsu = 15500
		mrei = 8000
		bloodlust=1
		legit=1
		legit2=1
		healthwas = 75000
		spawntime = 700
		New()
			expgain = rand(550000,600000)
			src.oldspot = src.loc
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.ressurectiontype=pick("Tijereta","Volcanica","Halibel","Nnoitra","Zommari","Pantera","Del Toro","Ulq","Shooter","Scientist","Skeleton","Nell","Luppi")
			src.HairGen()
			src.StypeGen()
			src.arrancarmask=rand(1,17)
			src.overshirt=pick(/obj/cloak/espada/e1,/obj/cloak/espada/e2)
			src.weapon=/obj/weapon/sword
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.CeroGen()
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)

mob
 Adjucha
		name = "{NPC}Adjucha"
		icon_state = ""
		enemy = 1
		level=350
		health = 40000
		mhealth=40000
		attack = 3000
		adjuucha=1
		race="Hollow"
		hollowtype="adjucha"
		killable=1
		defence = 1000
		reiatsu = 6500
		mattack= 3000
		mreiatsu=6500
		rei=6500
		mrei=6500
		mdefence=1000
		healthwas = 30000
		hostile=1
		spawntime = 500
		New()
			expgain = rand(650000,720000)
			src.overlays += /obj/Adjucha/a1
			src.overlays += /obj/Adjucha/a2
			src.overlays += /obj/Adjucha/a3
			src.overlays += /obj/Adjucha/b1
			src.overlays += /obj/Adjucha/b2
			src.overlays += /obj/Adjucha/b3
			src.overlays += /obj/Adjucha/c1
			src.overlays += /obj/Adjucha/c2
			src.overlays += /obj/Adjucha/c3
			src.overlays += /obj/Adjucha/d1
			src.overlays += /obj/Adjucha/d2
			src.overlays += /obj/Adjucha/d3
			src.overlays += /obj/Adjucha/e1
			src.overlays += /obj/Adjucha/e2
			src.overlays += /obj/Adjucha/e3
			src.overlays += /obj/Adjucha/f1
			src.overlays += /obj/Adjucha/f2
			src.overlays += /obj/Adjucha/f3
			src.oldspot = src.loc
			src.CeroGen()
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)
mob
 Vasto
		name = "{NPC}Vasto Lorde"
		icon = 'Icons/vasterode.dmi'
		icon_state = ""
		enemy = 1
		level=600
		rundelay = 0
		mhealth = 60000
		attack = 4250
		defence = 5000
		reiatsu = 6900
		mattack = 4250
		mdefence = 4000
		mreiatsu = 6900
		mrei=6000
		rei=6000
		race="Hollow"
		hollowtype="vasto"
		healthwas = 60000
		healthgain = 0
		hostile=1
		legit=1
		legit2=1
		killable=1
		spawntime = 1200
		New()
			expgain = rand(705000,795500)
			src.oldspot = src.loc
			src.CeroGen()
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
					return
			if(usr.petmsg)
				if(src.petcd)
					src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
					return
				if(usr.race==src.race)
					switch(input("Do you want to partner up with a fellow [src.race]?", text) in list ("Yes","No"))
						if("Yes")
							if(src.level+100>usr.level)
								src.Talks("You're too weak")
								return
							else
								usr.Partner_Up(src)
//-------------------------------------------------------------------------------
mob
	var
		isakush=0
mob
	Kushanada
		name = "{NPC}Hell Guardian (Kushanada)"
		enemy = 1
		agrange=12
		rundelay = 0
		isakush=1
		level=4000
		mhealth = 1000000
		attack = 78000
		defence = 50000
		reiatsu = 38000
		mattack = 38000
		mdefence = 10000
		mreiatsu = 78000
		mrei=60000
		rei=60000
		race="Hollow"
		hollowtype="Kushanada"
		healthwas = 60000
		healthgain = 0
		hostile=1
		legit=1
		legit2=1
		piercepassive=1
		stunpassive=7
		headpassive=2
		bodypassive=2
		armpassive=2
		legpassive=2
		criticalhits=3
		killable=1
		spawntime = 1200
		New()
			expgain=rand(38000000,45000000)
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Kushanada/hellbotleft1
			src.overlays += /obj/Kushanada/hellbotleft2
			src.overlays += /obj/Kushanada/hellbotright2
			src.overlays += /obj/Kushanada/hellbotright1
			src.overlays += /obj/Kushanada/hellmiddleleft1
			src.overlays += /obj/Kushanada/hellmiddleleft2
			src.overlays += /obj/Kushanada/hellmiddleright1
			src.overlays += /obj/Kushanada/hellmiddleright2
			src.overlays += /obj/Kushanada/helltopleft1
			src.overlays += /obj/Kushanada/helltopleft2
			src.overlays += /obj/Kushanada/helltopright1
			src.overlays += /obj/Kushanada/helltopright2
			src.oldspot = src.loc
			src.CeroGen()
			..()
obj
	Kushanada
		hellbotleft1
			icon='Icons/hellbotleft.dmi'
			pixel_x=-48
		hellbotleft2
			icon='Icons/hellbotleftmiddle.dmi'
			pixel_x=-16
		hellbotright1
			icon='Icons/hellbotright.dmi'
			pixel_x=48
		hellbotright2
			icon='Icons/hellbotrightmiddle.dmi'
			pixel_x=16
		hellmiddleleft1
			icon='Icons/hellmiddleleft1.dmi'
			pixel_y=32
			pixel_x=-16
		hellmiddleleft2
			icon='Icons/hellmiddleleft2.dmi'
			pixel_y=32
			pixel_x=-48
		hellmiddleright1
			icon='Icons/hellmiddleright1.dmi'
			pixel_y=32
			pixel_x=16
		hellmiddleright2
			icon='Icons/hellmiddleright2.dmi'
			pixel_y=32
			pixel_x=48
		helltopleft1
			icon='Icons/helltopleft1.dmi'
			pixel_y=64
			pixel_x=-16
		helltopleft2
			icon='Icons/helltopleft2.dmi'
			pixel_y=64
			pixel_x=-48
		helltopright1
			icon='Icons/helltopright1.dmi'
			pixel_y=64
			pixel_x=16
		helltopright2
			icon='Icons/helltopright2.dmi'
			pixel_y=64
			pixel_x=48
//----------------------------------------------------------------------


mob
	Dark_Dragon
		name = "{NPC}Dark Dragon"
		icon_name = 'Icons/DarkDragon2.dmi'
		enemy = 1
		agrange=12
		rundelay=0
		level=900
		mhealth = 3000000
		attack = 70000
		defence = 20000
		reiatsu = 38000
		mattack = 33000
		mdefence = 20000
		mreiatsu = 38000
		mrei=25000
		rei=25000
		race="Hollow"
		hollowtype=""
		healthwas = 60000
		healthgain = 0
		hostile=1
		killable=1
		spawntime = 1200
		New()
			expgain=rand(1200000,1400000)
			src.oldspot = src.loc
			src.CeroGen()
			..()
mob
	tuthollow
		name = "{NPC}Weak Hollow"
		enemy = 1
		killable=1
		level=10
		health = 500
		mhealth = 500
		attack = 50
		defence = 100
		reiatsu = 100
		mattack= 50
		mdefence= 100
		mreiatsu= 100
		race="Hollow"
		hollowtype="tutorial"
		healthwas = 600
		spawntime = 20
		New()
			expgain = rand(400000,500000)
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/TutHollow/BotLeft
			src.overlays += /obj/TutHollow/BotRight
			src.overlays += /obj/TutHollow/TopRight
			src.overlays += /obj/TutHollow/TopLeft
			//icon=pick('bathollow.dmi','bathollow2.dmi','bathollow3.dmi','bathollow4.dmi','bathollow5.dmi','bathollow6.dmi')
			src.oldspot = src.loc
			..()
//-------------------------------------------tut hollow pieces
obj
	TutHollow
		BotLeft
			icon='Icons/botleft.dmi'
			pixel_x=-16
		BotRight
			icon='Icons/botright.dmi'
			pixel_x=16
		TopLeft
			icon='Icons/topleft.dmi'
			pixel_y=32
			pixel_x=-16
			layer=30
		TopRight
			icon='Icons/topright.dmi'
			pixel_y=32
			pixel_x=16
			layer=30
//------------------------------------------------
mob
	Demon_Bat
		name = "{NPC}Demon Bat"
		level=600
		icon='Icons/DemonBat.dmi'
		Demon_Bat=2
		enemy = 1
		mhealth = 100000
		health = 100000
		race="Hollow"
		hollowtype="bat"
		mattack = 35000
		mdefence = 15000
		mreiatsu = 35000
		attack = 35000
		defence = 15000
		reiatsu = 35000
		healthwas = 35000
		mrei=50000
		rei=50000
		hostile=1
		boneharden=20
		quickflash=5
		instinct=5
		agrange=10
		killable=1
		spawntime = 240
		New()
			src.oldspot = src.loc
			expgain=rand(800000,3500000)
			src.overlays += /obj/bat
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.CeroGen()
			..()
obj
	bat
		icon='Icons/DemonBat.dmi'
		layer=15
mob
	Demon_Hollow
		name = "{NPC}Demon Hollow"
		level=900
		enemy = 1
		Demon_Hollow=1
		mhealth = 300000
		health = 300000
		race="Hollow"
		hollowtype="demon"
		mattack = 30000
		mdefence = 10000
		mreiatsu = 30000
		attack = 30000
		defence = 10000
		reiatsu = 30000
		healthwas = 30000
		mrei=99999
		rei=99999
		hostile=0
		agrange=10
		demons=1
		boneharden=20
		quickflash=5
		instinct=5
		legit=1
		legit2=1
		killable=1
		spawntime = 240
		New()
			src.overlays += /obj/demon1
			src.overlays += /obj/demon2
			src.overlays += /obj/demon3
			src.overlays += /obj/demon4
			src.oldspot = src.loc
			expgain=rand(2200000,4500000)
			src.CeroGen()
			..()

mob
	Reaper
		name = "{EVIL}Reaper's Helper"
		level=1000
		enemy = 1
		hostile=0
		Reaper=1
		mhealth = 7426090
		health = 7426090
		race="Hollow"
		hollowtype="Reaper"
		icon='Icons/reaper.dmi'
		mattack = 45000
		mdefence = 7500
		demons=1
		mreiatsu = 45000
		attack = 45000
		defence = 7500
		reiatsu = 45000
		healthwas = 29000
		ressurectiontype="Skeleton"
		mrei=200000
		rei=200000
		hostile=0
		boneharden=20
		quickflash=5
		instinct=5
		agrange=16
		killable=1
		legit=1
		legit2=1
		spawntime = 1400
		New()
			src.overlays += /obj/reaper1
			src.overlays += /obj/reaper2
			spawn()src.Affirm_Icon()
			src.oldspot = src.loc
			if(!usr.HQuest==1||!usr.HQuest==2)
				expgain= rand(3900000,8500000)
			if(usr.HQuest==1||usr.HQuest==2)
				expgain=rand(5000000,10500000)
			src.CeroGen()
mob
	DarkLord
		name= "{NPC}Rogue_Shinigami"
		icon_name='Icons/enemies.dmi'
		enemy = 1
		agrange=10
		killable=1
		level=800
		health = 550000
		mhealth = 65000
		attack = 50000
		defence = 25000
		reiatsu = 55000
		mattack = 50000
		mdefence = 25000
		mreiatsu = 55000
		race="Rogue"
		healthwas = 90000
		spawntime = 500
		hostile=1
		hasashikai=1
		hasabankai=1
		New()
			src.swordon=1
			expgain= rand(2190000,2850000)
			src.oldspot = src.loc
			src.StypeGen()
			..()
//-----------------------------------------------------
mob/var
	Yokai1=0
	Yokai2=0
	Yokai3=0
	Yokai4=0
mob
	Yokai1
		name = "{NPC}First Gate Keaper"
		level=900
		enemy = 1
		bossss=1
		Yokai1=1
		mhealth = 650000
		health = 650000
		race="Hollow"
		mattack = 25000
		mdefence = 30000
		mreiatsu = 25000
		attack = 25000
		defence = 10000
		reiatsu = 25000
		healthwas = 500000
		legit=1
		legit2=1
		mrei=99999
		rei=99999
		demons=1
		boneharden=20
		quickflash=5
		ressurectiontype="Shooter"
		piercepassive=5
		instinct=5
		agrange=20
		hostile=1
		piercepassive=1
		stunpassive=7
		headpassive=2
		bodypassive=2
		armpassive=2
		legpassive=2
		criticalhits=3
		killable=1
		rundelay = 0
		spawntime = 1000
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Yokai/Yokai11
			src.overlays += /obj/Yokai/Yokai12
			src.oldspot = src.loc
			expgain=rand(5000000,11000000)
			src.CeroGen()
			..()
mob
	Yokai2
		name = "{NPC}Second Gate Keaper"
		level=1000
		enemy = 1
		Yokai2=1
		bossss=1
		mhealth = 850000
		health = 850000
		race="Hollow"
		mattack = 25000
		mdefence = 30000
		mreiatsu = 25000
		attack = 25000
		defence = 10000
		reiatsu = 25000
		healthwas = 500000
		mrei=99999
		rei=99999
		legit2=1
		legit=1
		demons=1
		boneharden=20
		quickflash=5
		ressurectiontype="Barragan"
		piercepassive=5
		instinct=5
		agrange=20
		rundelay = 0
		hostile=1
		piercepassive=1
		stunpassive=7
		headpassive=2
		bodypassive=2
		armpassive=2
		legpassive=2
		criticalhits=3
		killable=1
		spawntime = 1000
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Yokai2/Yokai21
			src.overlays += /obj/Yokai2/Yokai22
			src.oldspot = src.loc
			expgain=rand(8000000,17000000)
			src.CeroGen()
			..()
mob
	Yokai4
		name = "{NPC}Gate Guardian"
		level=1500
		enemy = 1
		Yokai4=1
		mhealth = 2000000
		health = 2000000
		race="Hollow"
		legit=1
		bossss=1
		legit2=1
		mattack = 25000
		mdefence = 40000
		mreiatsu = 30000
		bossss=1
		attack = 25000
		defence = 20000
		reiatsu = 30000
		healthwas = 500000
		mrei=99999
		rundelay = 0
		rei=99999
		demons=1
		boneharden=20
		quickflash=5
		ressurectiontype="Ulq"
		piercepassive=5
		instinct=5
		agrange=20
		hostile=1
		killable=1
		piercepassive=1
		stunpassive=7
		headpassive=2
		bodypassive=2
		armpassive=2
		legpassive=2
		criticalhits=3
		spawntime = 1000
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Yokai4/YokaiLeftBot
			src.overlays += /obj/Yokai4/YokaiRightBot
			src.overlays += /obj/Yokai4/YokaiTopLeft
			src.overlays += /obj/Yokai4/YokaiTopRight
			src.oldspot = src.loc
			expgain=rand(25000000,45000000)
			src.CeroGen()
			..()
mob
	Yokai3
		name = "{NPC}Gate Creator"
		canRegenRei=1
		level=2000
		enemy = 1
		Yokai3=1
		mhealth = 15000000
		health = 15000000
		race="Hollow"
		mattack = 65000
		woundregen=5
		mdefence = 35900
		mreiatsu = 65000
		attack = 65000
		defence = 35900
		reiatsu = 65000
		healthwas = 500000
		rundelay = 1
		legit=1
		legit2=1
		bossss=1
		mrei=65000
		rei=65000
		boneharden=20
		quickflash=5
		piercepassive=5
		instinct=5
		hostile=1
		demons=1
		agrange=20
		hostile=1
		piercepassive=1
		stunpassive=7
		headpassive=2
		bodypassive=2
		armpassive=2
		legpassive=2
		criticalhits=3
		ressurectiontype="Nell"
		killable=1
		spawntime = 2000
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Yokai3/YokaiBottomMiddle
			src.overlays += /obj/Yokai3/YokaiBottomLeft
			src.overlays += /obj/Yokai3/YokaiBottomRight
			src.overlays += /obj/Yokai3/YokaiTop1Mid
			src.overlays += /obj/Yokai3/YokaiTop1Left
			src.overlays += /obj/Yokai3/YokaiTop1Right
			src.overlays += /obj/Yokai3/YokaiTop2Mid
			src.overlays += /obj/Yokai3/YokaiTop2Left
			src.overlays += /obj/Yokai3/YokaiTop2Right
			src.oldspot = src.loc
			expgain=rand(155000000,195000000)
			src.CeroGen()
			..()

//-------------------------------------------New map 2014 feb 20th NPC's
obj
	Yokai
		Yokai11
			icon='Icons/Monster11.dmi'
		Yokai12
			icon='Icons/Monster12.dmi'
			pixel_y=32
	Yokai2
		Yokai21
			icon='Icons/Yokai21.dmi'
		Yokai22
			icon='Icons/Yokai22.dmi'
			pixel_y=32
	Yokai4
		YokaiLeftBot
			icon='Icons/Yokai41.dmi'
			pixel_x=-16
		YokaiRightBot
			icon='Icons/Yokai42.dmi'
			pixel_x=16
		YokaiTopLeft
			icon='Icons/Yokai43.dmi'
			pixel_y=32
			pixel_x=-16
		YokaiTopRight
			icon='Icons/Yokai44.dmi'
			pixel_y=32
			pixel_x=16
	Yokai3
		YokaiBottomMiddle
			icon='Icons/Yokai31.dmi'
		YokaiBottomLeft
			icon='Icons/Yokai32.dmi'
			pixel_x=-32
		YokaiBottomRight
			icon='Icons/Yokai33.dmi'
			pixel_x=32
		YokaiTop1Mid
			icon='Icons/Yokai34.dmi'
			pixel_y=32
		YokaiTop1Left
			icon='Icons/Yokai35.dmi'
			pixel_y=32
			pixel_x=-32
		YokaiTop1Right
			icon='Icons/Yokai36.dmi'
			pixel_y=32
			pixel_x=32
		YokaiTop2Mid
			icon='Icons/Yokai37.dmi'
			pixel_y=64
		YokaiTop2Left
			icon='Icons/Yokai38.dmi'
			pixel_y=64
			pixel_x=-32
		YokaiTop2Right
			icon='Icons/Yokai39.dmi'
			pixel_y=64
			pixel_x=32


//

//-------------------------------------------------Fuck tiled map
obj
	TallAdju
		BottomLeft
			icon='Icons/newadjbotleft.dmi'
			pixel_x=-16
		BottomRight
			icon='Icons/newadjbotright.dmi'
			pixel_x=16
		Bottom2Left
			icon='Icons/newadjbot2left.dmi'
			pixel_y=32
			pixel_x=-16
			layer=25
		Bottom2Right
			icon='Icons/newadjbot2right.dmi'
			pixel_y=32
			pixel_x=16
			layer=25
		Bottom3Left
			icon='Icons/newadjbot3left.dmi'
			pixel_y=64
			pixel_x=-16
			layer=25
		Bottom3Right
			icon='Icons/newadjbot3right.dmi'
			pixel_y=64
			pixel_x=16
			layer=25
		Bottom4Left
			icon='Icons/newadjbot4left.dmi'
			pixel_y=96
			pixel_x=-16
			layer=25
		Bottom4Right
			icon='Icons/newadjbot4right.dmi'
			pixel_y=96
			pixel_x=16
			layer=25
	PantherHollow
		BL
			icon='Icons/pantherbl.dmi'
			pixel_x=-16
		BR
			icon='Icons/pantherbr.dmi'
			pixel_x=16
		TL
			icon='Icons/panthertl.dmi'
			pixel_x=-16
			pixel_y=32
		TR
			icon='Icons/panthertr.dmi'
			pixel_y=32
			pixel_x=16

mob/var
	swampboss=0
	swampbosskills=0
mob
	Swamp_Monster
		name = "{Boss}Swamp Monster"
		level=2000
		enemy = 1
		bossss=1
		mhealth = 16532156
		health = 16532156
		race="Hollow"
		hollowtype="swampboss"
		rundelay=1
		mattack = 85000
		mdefence = 25900
		mreiatsu = 80000
		attack = 85000
		swampboss=1
		defence = 25900
		reiatsu = 80000
		healthwas = 500000
		mrei=9999
		rei=9999
		boneharden=20
		quickflash=5
		piercepassive=5
		instinct=5
		hostile=1
		agrange=12
		killable=1
		expgain=125000000
		spawntime = 4 MINUTES
		New()
			src.overlays += /obj/SwampMonster/Swamp1
			src.overlays += /obj/SwampMonster/Swamp2
			src.overlays += /obj/SwampMonster/Swamp3
			src.overlays += /obj/SwampMonster/Swamp4
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.oldspot = src.loc
			src.CeroGen()
			..()
mob
	SwampMini
		name="{NPC}Swamp Minion"
		legit2=1
		enemy = 1
		race="Hollow"
		hollowtype="swampmini"
		killable=1
		hostile=1
		level=600
		rundelay = 1
		mhealth = 125000
		legit=1
		rei = 8000
		icon='Icons/demon monster.dmi'
		mattack = 63500
		mdefence = 17500
		mreiatsu = 63500
		mrei = 8000
		bloodlust=1
		healthwas = 125000
		spawntime = 700
		hostile=1
		piercepassive=1
		stunpassive=7
		headpassive=2
		bodypassive=2
		armpassive=2
		legpassive=2
		criticalhits=3
		boneharden=10
		instinct=4
		quickflash=3
		New()
			src.attack=mattack
			src.defence=mdefence
			src.reiatsu=mreiatsu
			expgain=rand(1500000,1800000)
			src.oldspot = src.loc
			src.CeroGen()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
mob
	TallAdju
		name="{Hollow}Adjuchas"
		legit2=1
		enemy = 1
		race="Hollow"
		hollowtype="new adjuchas"
		killable=1
		hostile=1
		level=600
		rundelay = 1
		mhealth = 125000
		legit=1
		rei = 8000
		mattack = 23500
		mdefence = 7500
		mreiatsu = 23500
		mrei = 8000
		bloodlust=1
		healthwas = 125000
		spawntime = 700
		hostile=1
		piercepassive=1
		stunpassive=7
		headpassive=2
		bodypassive=2
		armpassive=2
		legpassive=2
		criticalhits=3
		boneharden=10
		instinct=4
		quickflash=3

		New()
			src.oldspot = src.loc
			expgain=rand(950000,1000000)
			src.CeroGen()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays+=/obj/TallAdju/BottomLeft
			src.overlays+=/obj/TallAdju/BottomRight
			src.overlays+=/obj/TallAdju/Bottom2Left
			src.overlays+=/obj/TallAdju/Bottom2Right
			src.overlays+=/obj/TallAdju/Bottom3Left
			src.overlays+=/obj/TallAdju/Bottom3Right
			src.overlays+=/obj/TallAdju/Bottom4Left
			src.overlays+=/obj/TallAdju/Bottom4Right
mob
	Panther_Hollow
		name="{Lab Experiment}Cloned Hollow"
		legit2=1
		enemy = 1
		race="Hollow"
		hollowtype="labtype1"
		killable=1
		hostile=1
		level=550
		rundelay = 1
		mhealth = 125000
		health=125000
		legit=1
		rei = 8000
		mattack = 30500
		attack=30500
		mdefence = 2000
		defence=2000
		mreiatsu = 30500
		reiatsu=30500
		mrei = 8000
		rei=8000
		bloodlust=1
		healthwas = 125000
		spawntime = 700
		hostile=1
		piercepassive=1
		stunpassive=7
		headpassive=2
		bodypassive=2
		armpassive=2
		legpassive=2
		criticalhits=3
		boneharden=10
		instinct=4
		quickflash=3
		New()
			expgain=rand(800000,1420000)
			src.oldspot = src.loc
			src.CeroGen()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays+=/obj/PantherHollow/BL
			src.overlays+=/obj/PantherHollow/BR
			src.overlays+=/obj/PantherHollow/TL
			src.overlays+=/obj/PantherHollow/TR











mob
	Demon_Wolf
		name = "Cerberus"
	//	icon = '3-HeadWolf2.dmi'
		level=1000
		enemy = 1
		mhealth = 500000
		health = 500000
		race="Hollow"
		hollowtype="wolf"
		mattack = 25000
		mdefence = 10000
		mreiatsu = 25000
		legit=1
		legit2=1
		attack = 25000
		defence = 10000
		reiatsu = 25000
		healthwas = 500000
		mrei=99999
		rei=99999
		demons=1
		boneharden=20
		quickflash=5
		Demon_wolf=1
		ressurectiontype="Pantera"
		piercepassive=5
		instinct=5
		hostile=0
		agrange=6
		killable=1
		spawntime = 1000

		New()
			expgain=rand(1000000,7000000)
			src.overlays += /obj/wolf1
			src.overlays += /obj/wolf2
			src.overlays += /obj/wolf3
			src.overlays += /obj/wolf4
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.oldspot = src.loc
			src.CeroGen()
			..()
mob
	var
		Reaper=0
		Demon_Hollow=0
		Demon_Bat=0
		Demon_wolf=0
		Demon_Boss=0
		demons=0
obj
	demonboss1
		icon='Icons/demon boss1.dmi'
		pixel_x=-16
		layer=15
	demonboss2
		icon='Icons/demon boss2.dmi'
		pixel_x=16
		layer=15
	demonboss3
		icon='Icons/demon boss3.dmi'
		pixel_x=48
		layer=16
	demonboss4
		icon='Icons/demon boss4.dmi'
		pixel_y=32
		pixel_x=-16
		layer=15
	demonboss5
		icon='Icons/demon boss5.dmi'
		pixel_y=32
		pixel_x=16
		layer=15
	demonboss6
		icon='Icons/demon boss6.dmi'
		pixel_y=32
		pixel_x=48
		layer=15
	demonboss7
		icon='Icons/demon boss7.dmi'
		pixel_y=64
		pixel_x=-16
		layer=15
	demonboss8
		icon='Icons/demon boss8.dmi'
		pixel_y=64
		pixel_x=16
		layer=15
	demonboss9
		icon='Icons/demon boss9.dmi'
		pixel_y=96
		pixel_x=16
		layer=15


//------------koma boss june 24
obj
	komaboss
		layer=25
		bot1left2
			icon='Icons/bot1left2.dmi'
			pixel_x=-48
			layer=6
		bot1left1
			icon='Icons/bot1left1.dmi'
			pixel_x=-16
			layer=6
		bot1right1
			icon='Icons/bot1right1.dmi'
			pixel_x=16
		bot1right2
			icon='Icons/bot1right2.dmi'
			pixel_x=48
		bot2left2
			icon='Icons/bot2left2.dmi'
			pixel_x=-48
			pixel_y=32
		bot2left1
			icon='Icons/bot2left1.dmi'
			pixel_x=-16
			pixel_y=32
		bot2right1
			icon='Icons/bot2right1.dmi'
			pixel_y=32
			pixel_x=16
		bot2right2
			icon='Icons/bot2right2.dmi'
			pixel_y=32
			pixel_x=48
		bot3left2
			icon='Icons/bot3left2.dmi'
			pixel_y=64
			pixel_x=-48
		bot3left1
			icon='Icons/bot3left1.dmi'
			pixel_y=64
			pixel_x=-16
		bot3right1
			icon='Icons/bot3right1.dmi'
			pixel_y=64
			pixel_x=16
		bot3right2
			icon='Icons/bot3right2.dmi'
			pixel_y=64
			pixel_x=48
		bot4left2
			icon='Icons/bot4left2.dmi'
			pixel_y=96
			pixel_x=-48
		bot4left1
			icon='Icons/bot4left1.dmi'
			pixel_y=96
			pixel_x=-16
		bot4right1
			icon='Icons/bot4right1.dmi'
			pixel_y=96
			pixel_x=16
		bot4right2
			icon='Icons/bot4right2.dmi'
			pixel_y=96
			pixel_x=48

//------------------
obj
	wolf1
		icon='Icons/wolfnpc1.dmi'
		pixel_x=-16
		layer=15
obj
	wolf2
		icon='Icons/wolfnpc2.dmi'
		pixel_x=16
		layer=15
obj
	wolf3
		icon='Icons/wolfnpc3.dmi'
		pixel_x=-16
		pixel_y=32
		layer=15
obj
	wolf4
		icon='Icons/wolfnpc4.dmi'
		pixel_x=16
		pixel_y=32
		layer=15

obj
	reaper1
		icon = 'Icons/reaper1.dmi'
		layer = 15
obj
	reaper2
		icon = 'Icons/reaper2.dmi'
		layer=15
		pixel_y = 32
obj
	demon1
		icon = 'Icons/demon1.dmi'
		pixel_x=-16
		layer=15
obj
	demon2
		icon = 'Icons/demon2.dmi'
		pixel_x=16
		layer=15
obj
	demon3
		icon = 'Icons/demon3.dmi'
		pixel_y=32
		pixel_x=-16
		layer=15
obj
	demon4
		icon = 'Icons/demon4.dmi'
		pixel_y =32
		pixel_x=16
		layer=15

obj
 nstrong1
		icon = 'Icons/normal hollow1.dmi'
		pixel_x = -16
		layer = 15
obj
 nstrong2
		icon = 'Icons/normal hollow2.dmi'
		pixel_x = 16
		layer = 15
obj
 nstrong3
		icon = 'Icons/normal hollow3.dmi'
		pixel_y = 32
		pixel_x = -16
		layer = 15
obj
 nstrong4
		icon = 'Icons/normal hollow4.dmi'
		pixel_y = 32
		pixel_x = 16
		layer = 15
mob/var
	lorelei=0
	bossyama=0
	bossyama2=0
	newkomaboss=0
	gotflashboost=0
	newkomabosskills=0

mob/NewKomma
	canRegenRei=1
	enemy = 1
	agrange=12
	level=5000
	mhealth = 30000000
	health = 30000000
	attack = 50000
	mattack = 50000
	mdefence = 25000
	mreiatsu = 55000
	defence = 25000
	reiatsu = 55000
	hostile=1
	killable=1
	swordon=1
	newkomaboss=1
	healthwas = 50000000
	mrei = 20000
	rei=20000
	instinct=5
	quickflash=5
	berserk=5
	boneharden=300
	criticalhits=5
	headpassive=5
	bodypassive=5
	armpassive=5
	legpassive=5
	race="Hollow"
	spawntime = 1500
	swordon=1
	hasabankai=1
	hasashikai=1
	flashpause=0
	delay=0
	armorpassive=20
	rundelay=2
	name="{Boss} Samurai King"
	stype="Kommamaru"
	bossss=1
	swordcall="Fall.."
	swordname="Sakura"
	Tnpccaptain=1

	New()
		expgain=rand(130000000,290000000)
		spawn()src.Affirm_Icon()
		spawn()src.Load_Overlays()
		src.newkomaboss=1
		src.overlays+=/obj/komaboss/bot1left2
		src.overlays+=/obj/komaboss/bot1left1
		src.overlays+=/obj/komaboss/bot1right1
		src.overlays+=/obj/komaboss/bot1right2
		src.overlays+=/obj/komaboss/bot2left2
		src.overlays+=/obj/komaboss/bot2left1
		src.overlays+=/obj/komaboss/bot2right1
		src.overlays+=/obj/komaboss/bot2right2
		src.overlays+=/obj/komaboss/bot3left2
		src.overlays+=/obj/komaboss/bot3left1
		src.overlays+=/obj/komaboss/bot3right1
		src.overlays+=/obj/komaboss/bot3right2
		src.overlays+=/obj/komaboss/bot4left2
		src.overlays+=/obj/komaboss/bot4left1
		src.overlays+=/obj/komaboss/bot4right1
		src.overlays+=/obj/komaboss/bot4right2
		src.oldspot = src.loc
		src.CeroGen()
		..()
mob/Lorelei
	canRegenRei=1
	enemy = 1
	agrange=12
	level=9999
	mhealth = 50000000
	bossss=1
	health = 50000000
	attack = 50000
	mattack = 70000
	mdefence = 40000
	mreiatsu = 55000
	defence = 40000
	reiatsu = 55000
	hostile=1
	killable=1
	swordon=1
	lorelei=1
	aacandropdualzan=1
	healthwas = 50000000
	mrei = 300000
	rei=300000
	instinct=5
	quickflash=5
	berserk=5
	boneharden=300
	criticalhits=5
	headpassive=5
	bodypassive=5
	armpassive=5
	legpassive=5
	race="Hollow"
	spawntime = 800
	swordon=1
	hasabankai=1
	hasashikai=1
	armorpassive=20
	rundelay=1
	name="{NPC}Lorelei"
	stype="Yammamoto"
	swordcall="Burn all creation"
	swordname="Hyosuke"
	Tnpccaptain=1
	spawntime=2000
	New()
		expgain=rand(330000000,390000000)
		spawn()src.Affirm_Icon()
		spawn()src.Load_Overlays()
		src.overlays += /obj/Pheonix/botleft11
		src.overlays += /obj/Pheonix/botleft12
		src.overlays += /obj/Pheonix/botleft13
		src.overlays += /obj/Pheonix/botleft21
		src.overlays += /obj/Pheonix/botleft22
		src.overlays += /obj/Pheonix/botleft23
		src.overlays += /obj/Pheonix/botleft31
		src.overlays += /obj/Pheonix/botleft32
		src.overlays += /obj/Pheonix/botleft33
		src.oldspot = src.loc
		src.CeroGen()
		..()
mob/RedWolf
	name = "{NPC}Red Wolf"
	level=4500
	enemy = 1
	hostile=1
	mhealth = 2000000
	health = 2000000
	race="Hollow"
	legit=1
	legit2=1
	mattack = 45000
	mdefence = 40000
	mreiatsu = 45000
	attack = 45000
	defence = 20000
	reiatsu = 45000
	healthwas = 500000
	mrei=99999
	rundelay = 0
	rei=99999
	lorelei=2
	boneharden=20
	quickflash=5
	piercepassive=5
	swordon=1
	hasabankai=1
	hasashikai=1
	instinct=5
	agrange=20
	hostile=1
	killable=1
	piercepassive=1
	stunpassive=7
	headpassive=2
	bodypassive=2
	armpassive=2
	legpassive=2
	criticalhits=3
	spawntime = 1000

	New()
		expgain=rand(25000000,45000000)
		spawn()src.Affirm_Icon()
		spawn()src.Load_Overlays()
		src.overlays += /obj/redwolf/bl
		src.overlays += /obj/redwolf/br
		src.overlays += /obj/redwolf/tl
		src.overlays += /obj/redwolf/tr
		src.oldspot = src.loc
		src.CeroGen()
		..()
mob/var
	redwolfkills=0
	loreleikills=0
	yamabosskills=0
	gatecreatorkills=0
	demonbosskills=0
//------------------New area for dual zangetsu
obj/Pheonix
	layer=25
	botleft11
		icon='Icons/phbot11.dmi'
		pixel_x=-32
		layer=4
	botleft12
		icon='Icons/phbot12.dmi'
		layer=4
	botleft13
		icon='Icons/phbot13.dmi'
		pixel_x=32
		layer=4
	botleft21
		icon='Icons/phbot21.dmi'
		pixel_x=-32
		pixel_y=32
	botleft22
		icon='Icons/phbot22.dmi'
		pixel_y=32
	botleft23
		icon='Icons/phbot23.dmi'
		pixel_x=32
		pixel_y=32
	botleft31
		icon='Icons/phtop11.dmi'
		pixel_x=-32
		pixel_y=64
	botleft32
		icon='Icons/phtop12.dmi'
		pixel_y=64
	botleft33
		icon='Icons/phtop13.dmi'
		pixel_x=32
		pixel_y=64
obj/redwolf
	bl
		icon='Icons/redwolf1.dmi'
		pixel_x=-16
	br
		icon='Icons/redwolf2.dmi'
		pixel_x=16
	tl
		icon='Icons/redwolf3.dmi'
		pixel_x=-16
		pixel_y=32
		layer=25
	tr
		icon='Icons/redwolf4.dmi'
		pixel_x=16
		pixel_y=32
		layer=25





