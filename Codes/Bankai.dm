mob/var
	gotnewik=0
mob
	Zan2
		name = "{NPC}Zanpakutou{Whisperer}"
		enemy = 1
		level=350
		ismura=1
		killable=1
		rundelay = 2
		mhealth = 40000
		mattack = 2000
		mdefence = 2000
		mreiatsu = 2000
		mrei=10000
		healthwas = 40000
		legit=1
		swordon=1
	Zan3
		name = "{NPC}Zanpakutou{Whisperer}"
		enemy = 1
		iszan=1
		level=350
		killable=1
		rundelay = 2
		mhealth = 40000
		mattack = 2000
		mdefence = 2000
		mreiatsu = 2000
		mrei=10000
		healthwas = 40000
		legit=1
		swordon=1
mob
	Zanpakutou
		name = "{NPC}Zanpakutou"
		enemy = 1
		level=400
		killable=1
		hostile=1
		rundelay = 0
		mhealth = 35000
		mattack = 2500
		mdefence = 2500
		mreiatsu = 2500
		mrei=30000
		healthwas = 70000
		legit=1
		race="Bankai"
		swordon=1
		inshikai=1
		New()
			..()
			spawn(2)
				if(src.name=="{NPC}Kido Master")
					src.Talks("I am the Kido Master.")
				else
					src.Talks("I am your Zanpakutou.")
				var/sound/d = sound('Sounds/Aizen/WAVE_VO_AIZE_045_000.wav',volume=50)
				view(src) << d
				spawn(30)
					if(src.name=="{NPC}Kido Master")
						src.Talks("I will teach you my favorite kido if you manage to defeat me.")
					else
						src.Talks("I will teach you bankai if you manage to defeat me.")
					spawn(70)
						src.Talks("Try to fight me at full strength.")
						var/sound/S = sound('Sounds/Aizen/WAVE_VO_AIZE_025_000.wav',volume=50)
						view(src) << S
						src.Bankai()
						spawn(30)
							var/sound/s = sound('Sounds/Aizen/WAVE_VO_AIZE_026_000.wav',volume=50)
							view(src) << s
mob
	FGT
		hair_type=/obj/hair/h4/black
		icon_name="BaseTan"
		name="{NPC}Final Getsuga Tenshou Ichigo"
		enemy = 1
		level=800
		killable=1
		hostile=1
		rundelay = 0
		mhealth = 120000
		mattack = 11000
		mdefence = 7000
		mreiatsu = 9000
		mrei=10000
		healthwas = 120000
		inbankai=1
		infinal=1
		legit=1
		aggrod=0
		stype="Ichigo"
		FGT=1
		swordon=1
		New()
			..()
			spawn(2)
				var/sound/d = sound('Sounds/Ichigo/WAVE_VO_ICHI_028_P1_000.wav',volume=50)
				view(src) << d
				src.Talks("Sorry...")
				spawn(10)
					var/sound/Sa = sound('Sounds/Ichigo/WAVE_VO_ICHI_028_P1_000.wav',volume=50)
					view(src) << Sa
					src.Talks("I ain't ready to die yet!")
	Ashellnpc
		name = "{NPC}Hougyoku Aizen"
		npc=1
		New()
			src.icon='Icons/Ashell.dmi'
			..()
			spawn(1)
			src.icon='Icons/Ashell.dmi'
			spawn(200)
			del src
	Ashell
		name = "{NPC}Hougyoku Aizen"
		enemy = 1
		level=800
		killable=1
		hostile=1
		rundelay = 0
		mhealth = 120000
		mattack = 11000
		mdefence = 7000
		mreiatsu = 9000
		mrei=10000
		healthwas = 120000
		inbankai=1
		stype="Aizen"
		aizen=1
		legit=1
		swordon=1
		New()
			..()
			spawn(2)
				src.icon='Icons/Ashell.dmi'
				var/sound/d = sound('Sounds/Aizen/WAVE_VO_AIZE_019_000.wav',volume=50)
				view(src) << d
				spawn(10)
					src.Talks("This fight has just begun, but it's already over")
					var/sound/Sa = sound('Sounds/Aizen/WAVE_VO_AIZE_057_000.wav',volume=50)
					view(src) << Sa
					spawn(20)
						var/sound/Sd = sound('Sounds/Aizen/WAVE_VO_AIZE_058_000.wav',volume=50)
						view(src) << Sd
						spawn(20)
							var/sound/S = sound('Sounds/Aizen/WAVE_VO_AIZE_045_000.wav',volume=50)
							view(src) << S
mob
	proc
		Bankai()
			if(src.safe)
				src << "<b>You are in safe zone!"
				return
			if(src.stype=="Kido Class")
				src<<"You can't use this as a Kido Specialist"
				return
			if(src.intdm)
				src << "Can't use that here."
				return
			/*if(src.lost)
				if(lastevent==5&&eventon==1)
					src << "<b>Your zanpaktou won't listen!"
					return*/
			if(src.hedidit)
				src << "<b>Your zanpaktou won't listen!"
				return
			if(src.lostpowers)
				src << "<b>You lost your powers!"
				return
			if(src.infinal)
				src<<"Not while in this form"
				return
			if(!src.swordon && !src.key in specialverbs)
				src <<"Open your bag and equip your sword to activate your Shikai."
				return
			if(src.rei <= 0&&!src.inbankai)
				src << "<b>Your rei is too low!"
				return
			for(var/obj/scatterbankai/ilda in world)
				if(ilda.owner==src)
					return
			if(!src.inbankai)
				if(src.inshikai||src.race=="Quincy"||src.key=="Nakshart")
					if(src.frozen)
						return
					src.arm=0
					src.hardhitted=0
					src.leg=0
					src.core=0
					if(src.charging)
						src.charging=0
						src.reiatsu-=round(round(src.mreiatsu/50)*src.charge)
						src.attack-=round(round(src.mattack/50)*src.charge)
						src.defence-=round(round(src.mdefence/50)*src.charge)
						src.charge=0
					src.inbankai = 1
					spawn(1)
						src.overlays += /obj/newbankaiaura/BR
						src.overlays += /obj/newbankaiaura/B
						src.overlays += /obj/newbankaiaura/BL
						src.overlays += /obj/newbankaiaura/BR2
						src.overlays += /obj/newbankaiaura/B2
						src.overlays += /obj/newbankaiaura/BL2
						src.overlays += /obj/newbankaiaura/BR3
						src.overlays += /obj/newbankaiaura/B3
						src.overlays += /obj/newbankaiaura/BL3
					src.inshikai = 0
					src.protected=1
					flick("bankai",src)
					src.frozen = 1
					src.dir = SOUTH
					spawn(65)
						src.frozen = 0
						src.protected=0
						src.overlays -= /obj/newbankaiaura/BR
						src.overlays -= /obj/newbankaiaura/B
						src.overlays -= /obj/newbankaiaura/BL
						src.overlays -= /obj/newbankaiaura/BR2
						src.overlays -= /obj/newbankaiaura/B2
						src.overlays -= /obj/newbankaiaura/BL2
						src.overlays -= /obj/newbankaiaura/BR3
						src.overlays -= /obj/newbankaiaura/B3
						src.overlays -= /obj/newbankaiaura/BL3
						spawn(2)
							if(src.status=="<font color = #FF5600>Captain</font>"||src.status=="<font color = #f0f217>Captain Commander</font>"||src.statusold=="<font color = #f0f217>Captain Commander</font>"||src.squad==0||src.karakuraheroplayer==1||src.humanleader==1)
								if(src.squad==2)
									src.rundelay-=1
								src.attack+=(src.mattack/20)*src.shinipassive
								src.defence+=(src.mdefence/20)*src.shinipassive
								src.reiatsu+=(src.mreiatsu/20)*src.shinipassive
							if(src.status=="Lieutenant")
								src.attack+=round(src.mattack/33)*src.shinipassive
								src.defence+=round(src.mdefence/33)*src.shinipassive
								src.reiatsu+=round(src.mreiatsu/33)*src.shinipassive
							if(src.squad==13||src.squad==0||src.karakuraheroplayer==1||src.humanleader==1)
								src.defence+=(src.mdefence/4)
								if(src.status=="Lieutenant")
									src.defence+=(src.mdefence/3)
								if(src.status=="<font color = #FF5600>Captain</font>")
									src.defence+=(src.mdefence/2)
							if(src.squad==11)
								src.attack+=(src.mattack/4)
							if(src.squad==6)
								src.reiatsu+=(src.mreiatsu/5)
								src.defence+=(src.mdefence/10)
								if(src.status=="Lieutenant")
									src.attack+=(src.mattack/4)
								if(src.status=="<font color = #FF5600>Captain</font>")
									src.attack+=(src.mattack/3)
							if(src.squad==1||src.squad==0||src.karakuraheroplayer==1||src.humanleader==1)
								src.reiatsu+=(src.mreiatsu/4)
								if(src.status=="<font color = #FF5600>Captain</font>")
									src.reiatsu+=(src.mreiatsu/2)
							if(src.status=="<font color = #f0f217>Captain Commander</font>"||src.statusold=="<font color = #f0f217>Captain Commander</font>")
								src.defence+=(src.mdefence/3)
								src.attack+=(src.mattack/3)
								src.reiatsu+=(src.mreiatsu/3)
							if(src.squad==8||src.squad==0||src.karakuraheroplayer==1||src.humanleader==1)
								src.defence+=(src.mdefence/5)
								src.attack+=(src.mattack/5)
								src.reiatsu+=(src.mreiatsu/5)
							if(src.key=="")
								src.defence+=src.mdefence
								src.attack+=src.mattack
								src.reiatsu+=src.mreiatsu
							if(src.status=="<font color=purple>Spirit King</font>")
								src.defence+=(src.mdefence/2)
								src.attack+=(src.mattack/2)
								src.reiatsu+=(src.mreiatsu/2)
							if(src.status=="<font color=purple>Soul King's Heir</font>")
								src.defence+=src.mdefence
								src.attack+=src.mattack
								src.reiatsu+=src.mreiatsu
					if(src.stype=="Shinji" && src.client)
						view(8) << "<b>[src]: Bankai! [src.swordname]!"
						src.attack += src.mattack * 3
						src.reiatsu += src.mreiatsu * 3.5
						src.rundelay = 1.5
						src.Load_Overlays()
					if(src.stype == "Dark Bat" && src.client)
						view(8) << "<b>[src]: Bankai! [src.swordname]!"
						if(src.key=="CoreBreaker")
							src.reiatsu = src.mreiatsu * 36
							src.defence = src.mdefence * 36
							src.attack = src.mattack*36

						else
							src.reiatsu += src.mreiatsu * 3.8
							src.defence += src.mdefence * 3.8
							src.attack += src.mattack*3.8
						src.rundelay = 1
						src.Load_Overlays()
					if(src.stype == "Urahara" && src.client)
						view(8) << "<b>[src]: Bankai! [src.swordname]!"
						src.reiatsu += src.mreiatsu * 3
						src.defence += src.mdefence * 2.2
						src.attack += src.mattack*3
						src.rundelay = 1
						src.Load_Overlays()
					if(src.stype=="Shusuke" && src.client)
						view(8) << "<b>[src]: Bankai! [src.swordname]!"
						src.reiatsu+=src.mreiatsu*3.9
						src.defence+=src.mdefence*3.9
						src.rundelay=1
						src.Load_Overlays()
					if(src.stype=="Fujimaru" && src.client)
						view(8) << "<b>[src]: Bankai! [src.swordname]!"
						if(src.key=="CoreBreaker")
							src.reiatsu=src.mreiatsu*10
							src.defence=src.mdefence*10
						else
							src.reiatsu+=src.mreiatsu*3
							src.defence+=src.mdefence*3
						src.rundelay=1
						src.Load_Overlays()
					if(src.stype == "Unohana" && src.client)
						view(8) << "<b>[src]: Bankai! [src.swordname]!"
						src.health+=src.mhealth/2
						if(src.health>src.mhealth*2)src.health=src.mhealth
						src.attack += src.mattack * 3
						src.defence += src.mdefence * 3
						src.rundelay=1.5
						src.Load_Overlays()
					if(src.stype == "Ukitake" && src.client)
						view(8) << "<b>[src]: Bankai! [src.swordname]!"
						src.attack += src.mattack * 3.6
						src.defence += src.mdefence * 1.9
						src.reiatsu += src.mreiatsu * 3.6
						src.Load_Overlays()
					if(src.stype == "Ichimaru" && src.client)
						view(8) << "<b>[src]: Bankai! [src.swordname]!"
					//	if(src.gotrandom==0)
					//		src.contents+=new/obj/skillcard/Random_Stretch
					//		src.gotrandom=1
						src.attack += src.mattack * 3.4
						src.defence += src.mdefence * 2.7
						src.rundelay = 1
					if(src.stype == "Kensei" && src.client)
						view(8) << "<b>[src]: Bankai! [src.swordname]!"
						if(src.key =="WSHGC")
							src.attack = src.mattack * 2.7
							src.defence = src.mdefence * 2.3
						else
							src.attack += src.mattack * 3
							src.reiatsu += src.mreiatsu * 3
						src.rundelay = 1
						src.Load_Overlays()
					//matsuricopy
					if(src.stype == "Matsuri" && src.client)
						view(8) << "<b>[src]: Bankai! [src.swordname]!"
						src.attack += src.mattack * 4.9
						src.reiatsu += src.mreiatsu * 3.9
						src.defence+=src.mdefence*2.9
						src.rundelay = 1
						src.Load_Overlays()
					//matsuricopy
					if(src.stype == "Aizen" && src.client)
						view(8) << "<b>[src]: Bankai! [src.swordname]!"
						src.attack +=src.mattack *2.4
						src.reiatsu += src.mreiatsu *2.8
						src.defence+=src.mdefence*1.7
						src.rundelay = 1.5
						spawn(33)
							src.Load_Overlays()
					if(src.stype=="Pheonix" && src.client)
						view(8) << "<b>[src]: Bankai! [src.swordname]!"
						if(src.key=="Brook360" || src.key=="Awesome93")
							src.attack = src.mattack *3.2
							src.defence=src.mdefence*2.7
							src.rundelay = 0
							spawn(33)
								src.Load_Overlays()
						else
							src.reiatsu = src.mreiatsu *3
							src.defence=src.mdefence*2.5
							src.rundelay = 0
							spawn(33)
								src.Load_Overlays()
					if(src.stype=="Hyosuke" && src.client)
						if(src.key == "Mike oxsbig"||src.key == "Awesome93"||src.key=="Audain1"||src.key=="Lan0345"||src.key=="WSHGC"||src.key=="WorldStar")
							if (src.key == "Mike oxsbig"||src.key == "Awesome93"||src.key=="WSHGC"||src.key=="WorldStar")
								src.attack=src.mattack*10.3
								src.defence=src.mdefence*10.1
								src.rundelay=1
								spawn(33)
								src.Load_Overlays()
							if(src.key=="Audain1"||src.key=="Lan0345")//||src.key=="Yugiman67"
								src.reiatsu=src.mreiatsu*3.7
								src.defence=src.mdefence*3.4
								src.rundelay=1
								spawn(33)
								src.Load_Overlays()
						else
							src.attack+=src.mattack*3.5
							src.defence+=src.mdefence*3.2
							src.rundelay=1
							spawn(33)
							src.Load_Overlays()
					if(src.stype == "Lightning" && src.client)
						view(8) << "<b>[src]: Bankai! [src.swordname]!"
						src.reiatsu += src.mreiatsu *2.8
						src.defence+=src.mdefence*2.2
						src.rundelay = 0
						spawn(33)
							src.Load_Overlays()
						if(!src.gotlightccskills2)
							src.contents+=new/obj/skillcard/Raiho_Bolt
							src.contents+=new/obj/skillcard/Raiho_Burst
							src.gotlightccskills2=1
							src.RefreshSkillList()
					if(src.stype == "Stinger" && src.client)
						view(8) << "<b>[src]: Bankai!"
						spawn(33)
							view(8) << "<b>[src]:[src.swordname]!"
							src.attack += src.mattack * 3.5
							src.rundelay=2
							src.Load_Overlays()


					if(src.stype == "wshgccust" && src.client)
						src.attack +=src.mattack*10
						src.defence += src.mdefence *10
						src.rei += 10000
						src.mrei += 10000
						src.reiatsu += src.mreiatsu * 10
						src.rundelay= 1
						src.flashpause=1
						src.Load_Overlays()

					if(src.stype == "Ichigo" && src.client)
						view(8) << "<b>[src]: Bankai!"
						spawn(33)
							view(8) << "<b>[src]:Tensa [src.swordname]!"
							if (src.key=="Lan0345" || src.key=="CoreBreaker")
								if (src.key=="Lan0345")
									src.reiatsu = src.mreiatsu * 4.9
									src.defence = src.mdefence * 4.9
									src.attack = src.mreiatsu * 4.4
								if(src.key=="CoreBreaker")
									src.reiatsu = src.mreiatsu * 10
									src.defence = src.mdefence * 10
									src.attack = src.mreiatsu * 10
							else
								if (src.key=="Dblake1012")
									src.attack = src.mattack * 2
									src.reiatsu = src.mreiatsu * 2
								src.attack += src.mattack * 3
								src.reiatsu += src.mreiatsu * 3
							src.rundelay = 0
							src.Load_Overlays()
						if(src.gotgetsugajab==0)
							src.contents+=new/obj/skillcard/Getsuga_Jab
							src.RefreshSkillList()
							src.gotgetsugajab=1
					if(src.stype == "Hisagi" && src.client)
						view(8) << "<b>[src]: Bankai!"
						spawn(33)
							view(8) << "<b>[src]:Reap [src.swordname]!"
							src.attack += src.mattack * 3
							src.rundelay = 1
							src.Load_Overlays()
					if(src.stype == "Zaraki" && src.client)
						view(8) << "<b>[src] reaches to his eyepatch...."
						spawn(33)
							view(8) << "<b>[src]'s reiatsu is bursting!"
							src.Load_Overlays()
							src.attack += src.mattack * 3.5
							src.defence += src.mdefence * 2.5
							src.rundelay = 1.5
							for(var/mob/M in oview(6))
								step_away(M,src,7)
								spawn(1)
									M.allowmove = 1
									step_away(M,src,7)
									spawn(1)
										step_away(M,src,7)
										M.allowmove = 0
					if(src.stype=="Love" && src.client)
						view(8) << "<b>[src]: Bankai! [src.swordname]!"
						src.frozen=1
						src.protected=1
						flick("bankai",src)
						sleep(33)
						if(src.inshikai)
							src.attack=src.mattack*2.6
							src.reiatsu=src.mreiatsu*2.6
							src.frozen = 0
							src.protected=0
							src.Load_Overlays()
					if(src.stype=="Rangiku" && src.client)
						view(8) << "<b>[src]: Bankai! [src.swordname]!"
						if(src.key in specialverbs)
							src.reiatsu+=src.mreiatsu *10
							src.rei = src.mrei * 3
							src.defence+=src.mdefence*10
							src.attack+=src.mattack*10
							src.controlbug = 1
						else
							src.attack= src.mreiatsu * 3.3
							src.reiatsu = src.mreiatsu * 3.5
							src.defence = src.mdefence * 3.3
					if(src.stype == "Tousen" && src.client)
						view(8) << "<b>[src]: Bankai! [src.swordname]!"
						src.attack += src.mattack * 3.5
						src.defence += src.mdefence * 2.7
						src.reiatsu += src.mreiatsu * 2.8
						src.rundelay = 1.5
						src.see_invisible=0
						if(!src.npccaptain)
							for(var/mob/M in oview(8))
								M.Blindyou(100)
					if(src.stype == "Kira" && src.client)
						view(8) << "<b>[src]: Bankai! [src.swordname]! Lay Em Down!"
						src.attack +=src.mattack *3.5
						src.defence += src.mdefence *3.4
						src.rundelay= 1.5
						src.kirashi = 2
					if(src.stype == "Muramasa" && src.client)
						view(8) << "<b>[src]: Bankai! [src.swordname]!"
						src.attack +=src.mattack*4.2
						src.defence += src.mdefence *2
					if(src.stype == "Rukia" && src.client)
						view(8) << "<b>[src]: Bankai!!"
						spawn(33)
							view(8) << "<b>[src]:[src.swordname] Shirafune!"
							src.attack += src.mattack * 3
							src.rei = src.mrei * 2
							src.reiatsu += src.mreiatsu * 3
					if(src.stype == "Rangiku" && src.client)
						src.controlbug = 1
						spawn(25)
							view(8) << "<b>[src]: Bankai! [src.swordcall], [src.swordname] Kageyochi!"
							src.attack=src.mattack*3
							var/Q = new/obj/smokebankai2(locate(src.x+2,src.y,src.z))
							var/W = new/obj/smokebankai2(locate(src.x+2,src.y+1,src.z))
							var/E = new/obj/smokebankai2(locate(src.x+2,src.y+2,src.z))
							var/R = new/obj/smokebankai2(locate(src.x+2,src.y-1,src.z))
							var/T = new/obj/smokebankai(locate(src.x+2,src.y-2,src.z))
							var/S = new/obj/smokebankai2(locate(src.x-2,src.y+2,src.z))
							var/D = new/obj/smokebankai(locate(src.x-2,src.y+1,src.z))
							var/F = new/obj/smokebankai2(locate(src.x-2,src.y-1,src.z))
							var/G = new/obj/smokebankai(locate(src.x-2,src.y-2,src.z))
							var/H = new/obj/smokebankai2(locate(src.x-2,src.y,src.z))
							Q:owner = src
							W:owner = src
							E:owner = src
							R:owner = src
							T:owner = src
							S:owner = src
							D:owner = src
							F:owner = src
							G:owner = src
							H:owner = src
							var/Qa = new/obj/smokebankai2(locate(src.x+2,src.y,src.z))
							var/Wa = new/obj/smokebankai2(locate(src.x+2,src.y+1,src.z))
							var/Ea = new/obj/smokebankai2(locate(src.x+2,src.y+2,src.z))
							var/Ra = new/obj/smokebankai2(locate(src.x+2,src.y-1,src.z))
							var/Ta = new/obj/smokebankai(locate(src.x+2,src.y-2,src.z))
							var/Sa = new/obj/smokebankai2(locate(src.x-2,src.y+2,src.z))
							var/Da = new/obj/smokebankai(locate(src.x-2,src.y+1,src.z))
							var/Fa = new/obj/smokebankai2(locate(src.x-2,src.y-1,src.z))
							var/Ga = new/obj/smokebankai(locate(src.x-2,src.y-2,src.z))
							var/Ha = new/obj/smokebankai2(locate(src.x-2,src.y,src.z))
							Qa:owner = src
							Wa:owner = src
							Ea:owner = src
							Ra:owner = src
							Ta:owner = src
							Sa:owner = src
							Da:owner = src
							Fa:owner = src
							Ga:owner = src
							Ha:owner = src
					if(src.stype == "Byakuya" && src.client)
						if(src.key in specialverbs)
							src.reiatsu+=src.mreiatsu *10
							src.rei = src.mrei * 3
							src.defence+=src.mdefence*10
							src.attack+=src.mattack*10
							src.controlbug = 1
						else
							src.reiatsu+=src.mreiatsu *4
							src.rei = src.mrei * 1.6
							src.defence+=src.mdefence*3
							src.controlbug = 1
						spawn(25)
							view(8) << "<b>[src]: Bankai! [src.swordcall], [src.swordname] Kageyochi!"
							for(var/obj/pedals/M in world)
								if(M.Gowner == src)
									del M
							for(var/obj/pivotal/aM in world)
								if(aM.Gowner == src)
									del aM
							if(src.senkei)return
							var/Q = new/obj/scatterbankai2(locate(src.x+2,src.y,src.z))
							var/W = new/obj/scatterbankai2(locate(src.x+2,src.y+1,src.z))
							var/E = new/obj/scatterbankai2(locate(src.x+2,src.y+2,src.z))
							var/R = new/obj/scatterbankai2(locate(src.x+2,src.y-1,src.z))
							var/T = new/obj/scatterbankai(locate(src.x+2,src.y-2,src.z))
							var/S = new/obj/scatterbankai2(locate(src.x-2,src.y+2,src.z))
							var/D = new/obj/scatterbankai(locate(src.x-2,src.y+1,src.z))
							var/F = new/obj/scatterbankai2(locate(src.x-2,src.y-1,src.z))
							var/G = new/obj/scatterbankai(locate(src.x-2,src.y-2,src.z))
							var/H = new/obj/scatterbankai2(locate(src.x-2,src.y,src.z))
							Q:owner = src
							W:owner = src
							E:owner = src
							R:owner = src
							T:owner = src
							S:owner = src
							D:owner = src
							F:owner = src
							G:owner = src
							H:owner = src
							if(src.senbon)
								var/Qc = new/obj/scatterbankai2(locate(src.x+2,src.y,src.z))
								var/Wc = new/obj/scatterbankai2(locate(src.x+2,src.y+1,src.z))
								var/Ec = new/obj/scatterbankai2(locate(src.x+2,src.y+2,src.z))
								var/Rc = new/obj/scatterbankai2(locate(src.x+2,src.y-1,src.z))
								var/Tc = new/obj/scatterbankai2(locate(src.x+2,src.y-2,src.z))
								var/Sc = new/obj/scatterbankai2(locate(src.x-2,src.y+2,src.z))
								var/Dc = new/obj/scatterbankai2(locate(src.x-2,src.y+1,src.z))
								var/Fc = new/obj/scatterbankai2(locate(src.x-2,src.y-1,src.z))
								var/Gc = new/obj/scatterbankai2(locate(src.x-2,src.y-2,src.z))
								var/Hc = new/obj/scatterbankai2(locate(src.x-2,src.y,src.z))
								Qc:owner = src
								Wc:owner = src
								Ec:owner = src
								Rc:owner = src
								Tc:owner = src
								Sc:owner = src
								Dc:owner = src
								Fc:owner = src
								Gc:owner = src
								Hc:owner = src
								var/Qd = new/obj/scatterbankai2(locate(src.x+2,src.y,src.z))
								var/Wd = new/obj/scatterbankai2(locate(src.x+2,src.y+1,src.z))
								var/Ed = new/obj/scatterbankai2(locate(src.x+2,src.y+2,src.z))
								var/Rd = new/obj/scatterbankai2(locate(src.x+2,src.y-1,src.z))
								var/Td = new/obj/scatterbankai2(locate(src.x+2,src.y-2,src.z))
								var/Sd = new/obj/scatterbankai2(locate(src.x-2,src.y+2,src.z))
								var/Dd = new/obj/scatterbankai2(locate(src.x-2,src.y+1,src.z))
								var/Fd = new/obj/scatterbankai2(locate(src.x-2,src.y-1,src.z))
								var/Gd = new/obj/scatterbankai2(locate(src.x-2,src.y-2,src.z))
								var/Hd = new/obj/scatterbankai2(locate(src.x-2,src.y,src.z))
								Qd:owner = src
								Wd:owner = src
								Ed:owner = src
								Rd:owner = src
								Td:owner = src
								Sd:owner = src
								Dd:owner = src
								Fd:owner = src
								Gd:owner = src
								Hd:owner = src
								var/Qa = new/obj/scatterbankai2(locate(src.x+2,src.y,src.z))
								var/Wa = new/obj/scatterbankai2(locate(src.x+2,src.y+1,src.z))
								var/Ea = new/obj/scatterbankai2(locate(src.x+2,src.y+2,src.z))
								var/Ra = new/obj/scatterbankai2(locate(src.x+2,src.y-1,src.z))
								var/Ta = new/obj/scatterbankai2(locate(src.x+2,src.y-2,src.z))
								var/Sa = new/obj/scatterbankai2(locate(src.x-2,src.y+2,src.z))
								var/Da = new/obj/scatterbankai2(locate(src.x-2,src.y+1,src.z))
								var/Fa = new/obj/scatterbankai2(locate(src.x-2,src.y-1,src.z))
								var/Ga = new/obj/scatterbankai2(locate(src.x-2,src.y-2,src.z))
								var/Ha = new/obj/scatterbankai2(locate(src.x-2,src.y,src.z))
								Qa:owner = src
								Wa:owner = src
								Ea:owner = src
								Ra:owner = src
								Ta:owner = src
								Sa:owner = src
								Da:owner = src
								Fa:owner = src
								Ga:owner = src
								Ha:owner = src
								var/Qb = new/obj/scatterbankai2(locate(src.x+2,src.y,src.z))
								var/Wb = new/obj/scatterbankai2(locate(src.x+2,src.y+1,src.z))
								var/Eb = new/obj/scatterbankai2(locate(src.x+2,src.y+2,src.z))
								var/Rb = new/obj/scatterbankai2(locate(src.x+2,src.y-1,src.z))
								var/Tb = new/obj/scatterbankai2(locate(src.x+2,src.y-2,src.z))
								var/Sb = new/obj/scatterbankai2(locate(src.x-2,src.y+2,src.z))
								var/Db = new/obj/scatterbankai2(locate(src.x-2,src.y+1,src.z))
								var/Fb = new/obj/scatterbankai2(locate(src.x-2,src.y-1,src.z))
								var/Gb = new/obj/scatterbankai2(locate(src.x-2,src.y-2,src.z))
								var/Hb = new/obj/scatterbankai2(locate(src.x-2,src.y,src.z))
								Qb:owner = src
								Wb:owner = src
								Eb:owner = src
								Rb:owner = src
								Tb:owner = src
								Sb:owner = src
								Db:owner = src
								Fb:owner = src
								Gb:owner = src
								Hb:owner = src
								var/Qe = new/obj/scatterbankai2(locate(src.x+2,src.y,src.z))
								var/We = new/obj/scatterbankai2(locate(src.x+2,src.y+1,src.z))
								var/Ee = new/obj/scatterbankai2(locate(src.x+2,src.y+2,src.z))
								var/Re = new/obj/scatterbankai2(locate(src.x+2,src.y-1,src.z))
								var/Te = new/obj/scatterbankai2(locate(src.x+2,src.y-2,src.z))
								var/Se = new/obj/scatterbankai2(locate(src.x-2,src.y+2,src.z))
								var/De = new/obj/scatterbankai2(locate(src.x-2,src.y+1,src.z))
								var/Fe = new/obj/scatterbankai2(locate(src.x-2,src.y-1,src.z))
								var/Ge = new/obj/scatterbankai2(locate(src.x-2,src.y-2,src.z))
								var/He = new/obj/scatterbankai2(locate(src.x-2,src.y,src.z))
								Qe:owner = src
								We:owner = src
								Ee:owner = src
								Re:owner = src
								Te:owner = src
								Se:owner = src
								De:owner = src
								Fe:owner = src
								Ge:owner = src
								He:owner = src
					if(src.stype == "Renji" && src.client)
						src.renjishikai = 0
						src.attack += src.mattack*3.5
						src.defence += src.mdefence*3
						view(8) << "<b>[src]: Bankai! Hihiou [src.swordname]!"
						src.Load_Overlays()
					//	src.firing = 1
						src.controlbug=1
						src.renjibankai = 1
						src.renjishikai = 0
						src.rundelay = 1.5
					//	src.zabitimes = 0
						src.Load_Overlays()
					if(src.stype == "Mayuri" && src.client)
						src.ikkakushikai = 0
						src.reiatsu += src.mreiatsu*3.3
						src.defence += src.mdefence*2.6
						view(8) << "<b>[src]: Bankai! Konjiki [src.swordname]!"
						src.rundelay = 1.5
						src.Load_Overlays()
					if(src.stype == "Ikkaku" && src.client)
						src.ikkakushikai = 0
						view(8) << "<b>[src]: Bankai! Ryuumon [src.swordname]!"
					//	src.firing = 1
						src.ikkakubankai = 1
						src.attack += src.mattack * 3
						src.defence += src.mdefence * 3
						src.rage=40
						src.steadyrage=40
						if(!gotnewik)
							src.contents+=new/obj/skillcard/Bum_Rush
							src.RefreshSkillList()
							src.gotnewik=1
						src.Load_Overlays()
					if(src.stype == "Kommamaru" && src.client)
						view(8) << "<b>[src]: Bankai! [src.swordname]!"
						src.kommamarubankai = 1
						src.kommamarushikai = 0
					//	src.firing = 1
						src.rundelay = 3
						src.attack += src.mattack * 3.8
						src.defence += src.mdefence *4
						src.Load_Overlays()
						if(src.newkomaboss==1)
							src.rundelay=2
					if(src.stype == "Hitsugaya" && src.client)
						view(8) << "<b>[src]: Bankai!"
						spawn(33)
							view(8) << "<b>[src]:Daiguren [src.swordname]!"
							src.reiatsu += src.mreiatsu *3
							src.defence += src.mdefence *2.8
							src.hitsugayabankai = 1
							src.rundelay = 1
							src.Load_Overlays()
					if(src.stype == "Yammamoto" && src.bossyama)
						src.attack += src.mattack * 11
						src.reiatsu += src.mreiatsu * 11
						src.defence += src.mdefence *11

					if(src.stype == "Yammamoto" && src.bossyama2)
						src.attack += src.mattack * 4
						src.reiatsu += src.mreiatsu * 4
						src.defence += src.mdefence *4
					if(src.stype == "Yammamoto" && src.client)
						view(8) << "<b>[src]: Bankai..."
						spawn(33)
							view(8) << "<b>[src]:[src.swordname]!"
							if(src.key=="Dblake1012"||src.key=="WSHGC"||src.key=="WorldStar"||src.key=="MasterGOA")
								src.attack += src.mattack * 10
								src.reiatsu += src.mreiatsu * 10
								src.defence += src.mdefence *10
							else
								src.reiatsu += src.mreiatsu * 3
								src.defence += src.mdefence *3
							src.rundelay = 1
							src.Load_Overlays()
						if(src.race == "Shinigami")
							src.contents+=new/obj/skillcard/Shoen
							src.RefreshSkillList()
							if(!src.learnshoen)src<<"You learned Shoen!"
							src.learnshoen=1
					if(src.stype == "Shonshui" && src.client)
						view(8) << "<b>[src]: Bankai..."
						spawn(33)
							view(8) << "<b>[src]:[src.swordname]!"
							src.attack += src.mattack * 4
							src.defence += src.mdefence *3
							rundelay=1
							src.Load_Overlays()
					if(src.stype == "Kaiens" && src.client)
						view(8) << "<b>[src]: Bankai..."
						spawn(33)
							view(8) << "<b>[src]:[src.swordname]!"
							src.reiatsu += src.mreiatsu * 3
							src.rei = src.mrei * 1.9
						//	src.shikaidrain=0
						//	src.bankaidrain=0
							src.Load_Overlays()
					if(src.stype == "Yumichika" && src.client)
						view(8) << "<b>[src]: Bankai..."
						spawn(33)
							view(8) << "<b>[src]:[src.swordname]!"
							src.attack += src.mattack * 2.4
							src.reiatsu += src.mreiatsu * 2.4
							src.defence += src.mdefence * 2.4
							src.Load_Overlays()
					if(src.stype == "Hinamori" && src.client)
						view(8) << "<b>[src]: Bankai..."
						spawn(33)
							view(8) << "<b>[src]:[src.swordname]!"
							src.reiatsu += src.mreiatsu * 2.5
							src.defence += src.mdefence *2.6
							rundelay=1.5
							src.usinghinafi = 1
					if(src.stype=="Sword Multiplier" && src.client)
						view(8) << "<b>[src]: Bankai..."
						spawn(33)
							view(8) << "<b>[src]:[src.swordname]!"
							src.controlbug = 1
							src.defence += src.mdefence
							if(src.key=="Dragonpearl123")
								src.attack = src.mattack *3
							else
								src.attack += src.mattack *3
							src.Load_Overlays()
					if(src.stype == "Jiroubou" && src.client)
						view(8) << "<b>[src]: Bankai..."
						spawn(33)
							view(8) << "<b>[src]:[src.swordname]!"
							src.controlbug = 1
							src.attack += src.mattack * 9
							src.reiatsu += src.mreiatsu * 9
							src.defence += src.mdefence * 9
							src.Load_Overlays()

					spawn(34)
						if(src.guildpassive>=1)
							src.rundelay =src.rundelay/2
						if(src.beer1)
							src.rundelay+=3
						if(src.beerboost)
							src.attack+=round(src.mattack/2)
							src.defence+=round(src.mdefence/2)
							src.reiatsu+=round(src.mreiatsu/2)
						if(src.guildpassive>=1)
							src.rundelay=src.rundelay/2
					/*	if(src.armon)
							src.defence+=round(src.mdefence*3.4,1)
							if (src.key =="Awesome93")//src.key=="Yugiman67"
								src.reiatsu+=round(src.reiatsu*2.6,1)
								src.defence+=round(src.mdefence*3.4,1)
							else
								src.attack+=round(src.mattack*2.6,1)
								src.defence+=round(src.mdefence*3.4,1)	*/
			else
				src.StartShikCool()
				if(src.charging)
					src.charging=0
					src.reiatsu-=round(round(src.mreiatsu/50)*src.charge)
					src.attack-=round(round(src.mattack/50)*src.charge)
					src.defence-=round(round(src.mdefence/50)*src.charge)
					src.charge=0
				src.limitrelease=0
				src.maskon=0
				src.trans=0
				src.hardhitted=0
				src.leg=0
				src.core=0
				src.inbankai = 0
				src.hs=0
				src.inberserk=0
				src.controlbug = 0
				src.firing = 0
				src.zabitimes = 0
				src.hitsugayabankai = 0
				src.usinghinafi = 0
				src.kommamarubankai = 0
				src.ikkakubankai = 0
				src.reiatsu = src.mreiatsu
				src.attack = src.mattack
				src.renjibankai = 0
				src.rundelay = 2
				for(var/obj/byakublade/M in world)
					if(M.owner == src)
						del M
				for(var/obj/Fire/f in world)
					if(f.Gowner==src)
						del f
				src.senkei = 0
				src.defence = src.mdefence
				if(src.beerboost)
					src.attack+=round(src.mattack/2)
					src.defence+=round(src.mdefence/2)
					src.reiatsu+=round(src.mreiatsu/2)
				walk(src,0)
				for(var/mob/zabimaru/M in view(10,src))
					if(M.owner == src)
						del M
				for(var/obj/zabtrail/k in view(10,src))
					if(k.owner == src)
						del k
				if(src.guildpassive>=1)
					src.rundelay =src.rundelay/2
				src.tensat=0
				src.Load_Overlays()
				if(src.guildpassive>=1)
					src.rundelay=src.rundelay/2
mob
	proc
		FinalBankai()
			if(src.safe)

				src << "<b>You are in safe zone!"
				return
			if(!src.swordon && src.key !="Devilminions528")
				src <<"You have to equip your sword."
				return
			if(src.infinal)
				src<<"Not while in this form"
				return
			if(src.rei <= 0&&!src.inbankai && src.key !="Devilminions528")
				src << "<b>Your rei is too low!"
				return
			if(src.fgtcool && src.key !="Devilminions528")
				src << "<b>You must wait at least 5 mins!"
				return
			if(!src.infinal)
				if(src.inbankai)
					if(src.frozen)
						return
					src.fgtcool=300
					src.arm=0
					src.hardhitted=0
					src.leg=0
					src.core=0
					src.tensat=0
					src.infinal = 1
					src.inbankai = 0
					src.protected=1
					if(src.charging)
						src.charging=0
						src.reiatsu-=round(round(src.mreiatsu/50)*src.charge)
						src.attack-=round(round(src.mattack/50)*src.charge)
						src.defence-=round(round(src.mdefence/50)*src.charge)
						src.charge=0
					src.overlays += /obj/Final/Base
					src.overlays += /obj/Final/rBase
					src.overlays += /obj/Final/lBase
					src.overlays += /obj/Final/rTop
					src.overlays += /obj/Final/lTop
					src.overlays += /obj/Final/Top
					for(var/mob/M in oview(8,src))
						Quake_Effect(M,20,1)
					src.frozen = 1
					src.dir = SOUTH
					spawn(20)
						for(var/obj/pedals/M in world)
							if(M.Gowner == src)
								M.icon='Icons/byakuyafinal.dmi'
						src.controlbug = 0
						src.firing = 0
						src.frozen=0
						src.protected=0
						src.zabitimes = 0
						src.hitsugayabankai = 0
						src.kommamarubankai = 0
						src.ikkakubankai = 0
						src.renjibankai = 0
						src.rundelay = 1
						for(var/obj/byakublade/M in world)
							if(M.owner == src)
								del M
						src.senkei = 0
						walk(src,0)
						for(var/mob/zabimaru/M in world)
							if(M.owner == src)
								del M
						view(8) << "<b>[src]: Final [src.swordname]!"
						src.Load_Overlays()
						src.FGTTime()
