mob/var
	gotfujimaruskills=0
	gotlightccskills=0
	gotThromSkills=0
	gotlightccskills2=0
	gotnewkennyskill=0
	tmp
		rengokucd
		rasencd
mob
	proc
		Shikai()
			src.RefreshSkillList()
			if(src.goingress)
				return
			if(src.intdm)
				src << "Can't use that here."
				return
			if(src.stype=="")
				src <<"Talk to Byakuya in Soul Society. He should be on Soukyo Hill."
				return
			if(src.stype=="Kido Class")
				src<<"You can't use this as a Kido Specialist"
				return
			if(src.hedidit)
				src << "<b>Your zanpaktou won't listen!"
				return
			if(src.lostpowers)
				src << "<b>You lost your powers!"
				return
			if(src.safe)
				src << "<b>You are in safe zone!"
				return
			if(!src.swordon && !src.key in specialverbs)
				src <<"Open your bag and equip your sword to activate your Shikai."
				return
			if(src.infinal)
				src<<"Not while in this form"
				return
			if(src.rei <= 0&&!src.inshikai)
				src << "<b>Your rei is too low!"
				return
			if(src.key == currentPlayerTest)
				if(src.race != "Shinigami" || src.race != "Vaizard")
					src << "<b>You can't use this during a Ranked test"
			if(!src.inshikai)
				if(src.inbankai == 0)
					src.arm=0
					src.leg=0
					src.core=0
					if(src.charging)
						src.charging=0
						src.reiatsu-=round(round(src.mreiatsu/50)*src.charge)
						src.attack-=round(round(src.mattack/50)*src.charge)
						//src.defence-=round(round(src.mdefence/50)*src.charge)
						src.charge=0
					src.StartShikCool()
					src.inshikai = 1
				//	view(8) << "<b>[src]: [src.swordcall], [src.swordname]!"
					viewers(src) << output("<b>[src]: [src.swordcall], [src.swordname]!", "output")
					if(src.stype=="Fujimaru")
						if(src.key=="Not|CoreBreaker")
							src.reiatsu=src.mreiatsu*10
							src.defence=src.mdefence*10
							src.rundelay=1
						else
							src.reiatsu=src.mreiatsu*2.1
							src.defence=src.mdefence*1.8
							src.rundelay=1
						if(!src.gotfujimaruskills)
							src.contents+=new/obj/skillcard/Ryuten_Soshun
							src.contents+=new/obj/skillcard/Rengoku
							src.contents+=new/obj/skillcard/Rasen
							src.RefreshSkillList()
							src.gotfujimaruskills=1
						src.Load_Overlays()
					if(src.stype == "Muramasa")
						src.attack = src.mattack * 1.8
						src.contents+=new/obj/skillcard/Materialize
						src.RefreshSkillList()
						src.Load_Overlays()
					if(src.stype == "Maycustez")
						src.attack = src.mattack * 1.8
						src.Load_Overlays()
					//matsuricopy
					if(src.stype=="Shinji")
						src.attack = src.mattack * 1.6
						src.reiatsu = src.mreiatsu * 1.9
						src.Load_Overlays()
						if(!locate(/obj/skillcard/Sakasama_no_Sekai)in src.contents)
							src.contents+=new/obj/skillcard/Sakasama_no_Sekai
							src.RefreshSkillList()
					if(src.stype == "Matsuri")
						src.attack = src.mattack * 2.1
						src.defence=src.mdefence*1.5
						src.reiatsu = src.mreiatsu * 1.1
						src.rundelay = 1.5
						src.Load_Overlays()
					//end matsuricopy
					if(src.stype=="Dark Bat")
						if(src.key=="Dragonpearl123")
							src.attack *= 26
							src.reiatsu *= 26
							src.defence *= 26
						else
							src.attack = src.mattack * 2.6
							src.reiatsu = src.mreiatsu * 2.6
							src.defence = src.mdefence *2.6
						src.Load_Overlays()
					if(src.stype == "Kensei")
						if(src.key=="Not|WSHGC")
							src.attack = src.mattack * 1.6
							src.defence = src.mdefence * 1.6
						else
							src.attack = src.mattack * 1.6
							src.reiatsu = src.mreiatsu * 1.6
						src.Load_Overlays()
					if(src.stype == "wshgccust")
						src.attack +=src.mattack*40
						src.defence += src.mdefence *40
						src.rundelay= 1
						src.flashpause = 1
						src.rei += 10000
						src.mrei += 10000
						src.reiatsu += src.mreiatsu * 40
						src.Load_Overlays()
					if(src.stype=="Hyosuke")
						src.Load_Overlays()
						if(src.key =="Mike oxsbig" || src.key =="Awesome93"||src.key=="Audain1"||src.key=="Lan0345")
							if (src.key =="Mike oxsbig" || src.key =="Awesome93")
								src.attack=src.mattack*6.2
								src.defence=src.mdefence*6.2
								src.rundelay=1
							if(src.key=="Audain1"||src.key=="Lan0345")//||src.key=="Yugiman67"
								src.reiatsu=src.mreiatsu*2.1
								src.defence=src.mdefence*2.1
								src.rundelay=1
						else
							src.attack=src.mattack*2
							src.defence=src.mdefence*2
							src.rundelay=1
					if(src.stype == "Hisagi")
						src.Load_Overlays()
						src.attack = src.mattack * 1.4
						for(var/mob/M in oview(1,src))
							Blood(M.x,M.y,M.z)
							M.Death(src,src.attack,rand(5,10))
					if(src.stype=="Pheonix")
						if(src.key=="Brook360" ||src.key=="Awesome93")
							src.attack = src.attack *2.6
							src.defence=src.mdefence*1.7
							src.rundelay = 0
							src.Load_Overlays()
						else
							src.reiatsu = src.mreiatsu *2.3
							src.defence=src.mdefence*1.5
							src.rundelay = 0
							src.Load_Overlays()
					if(src.stype == "Kira")
						//src.Load_Overlays()
						//var/mob/K
						src.frozen=1
						src.protected=1
						var/L=src.overlays
						flick("RYH",src)
						flick("RYH",L)
						spawn(10)
							src.Load_Overlays()
							src.frozen=0
							src.protected=0
							src.kirashi = 1
							src.attack = src.mattack * 2.5
							src.defence=src.mdefence*2.5
					if(src.stype=="Shusuke")
						src.reiatsu=src.mreiatsu*2.5
						src.defence=src.mreiatsu*2.5
						spawn(5)
							src.Load_Overlays()
					if(src.stype == "Stinger")
						src.Load_Overlays()
						src.attack = src.mattack * 2.3
						src.rundelay=1
					if(src.stype == "Yumichika")
						src.frozen=1
						src.protected=1
						var/L=src.overlays
						flick("Snap",src)
						flick("Snap",L)
						spawn(5)
							flick("Snap",src)
							flick("Snap",L)
						spawn(10)
							src.Load_Overlays()
							src.frozen=0
							src.protected=0
							src.attack = src.mattack * 1.9
							src.reiatsu = src.mreiatsu * 1.9
							src.defence = src.mdefence *1.9
					if(src.stype == "Hinamori")
						src.usinghinafi = 1
						src.frozen=1
						src.protected=1
						if(!src.learnedtogglehina)
							src.learnedtogglehina = 1
							src.contents +=new/obj/skillcard/Hinamori_Blast_Toggle
							src << "You learned the ability to toggle off and on your Zan blast when attacking."
						var/L=src.overlays
						flick("Snap",src)
						flick("Snap",L)
						spawn(5)
							flick("Snap",src)
							flick("Snap",L)
						spawn(10)
							src.Load_Overlays()
							src.frozen=0
							src.protected=0
							src.reiatsu = src.mreiatsu * 1.5
					if(src.stype == "Rukia")
						src.frozen=1
						src.protected=1
						src.overlays += /obj/RukiaRelease
						spawn(12)
							src.frozen=0
							src.protected=0
							src.overlays -= /obj/RukiaRelease
							src.Load_Overlays()
							src.reiatsu = src.mreiatsu * 1.5
					if(src.stype == "Aizen")
						src.frozen=1
						src.protected=1
						flick("Shatter",src)
						src.attack = src.mattack*1.8
						src.reiatsu = src.mreiatsu * 1.8
						spawn(9)
							src.frozen=0
							src.protected=0
							src.Load_Overlays()
					if(src.stype == "Ichigo")
						if (src.key=="Lan0345" || src.key=="Not|CoreBreaker")
							if(src.key=="Lan0345")
								src.reiatsu = src.mreiatsu * 2.9
								src.defence = src.mdefence *2.9
								src.attack = src.mreiatsu * 2.9
							if(src.key=="Not|CoreBreaker")
								src.reiatsu = src.mreiatsu * 5
								src.defence = src.mdefence *5
								src.attack = src.mreiatsu * 5
						else
							if(src.key=="Dblake1012")
								src.attack = src.mattack*2
								src.reiatsu = src.mreiatsu*2
							src.attack = src.mattack*2
							src.reiatsu = src.mreiatsu*2
						src.Load_Overlays()
					if(src.stype == "Ichimaru")
						src.attack = src.mattack*1.8
						src.Load_Overlays()
					if(src.stype=="Sword Multiplier")
						src.controlbug = 1
						src.frozen=1
						src.protected=1
						flick("Shatter",src)
						if(src.key=="Dragonpearl123")
							src.attack *= 26
							src.reiatsu *= 26
							src.defence *= 26
							if(!src.gotThromSkills)
								src.contents+=new/obj/skillcard/Throm_Fortress_Blaze
								src.gotThromSkills=1
						else
							src.attack *= 3
						spawn(9)
							src.frozen=0
							src.protected=0
							src.Load_Overlays()
					if(src.stype == "Jiroubou")
						src.controlbug = 1
						src.frozen=1
						src.protected=1
						var/L=src.overlays
						flick("Shatter",src)
						flick("Shatter",L)
						src.reiatsu = src.mreiatsu * 8
						src.defence = src.mdefence *8
						src.attack = src.mreiatsu * 8
						spawn(9)
							src.frozen=0
							src.protected=0
							src.Load_Overlays()
					if(src.stype == "Rangiku")
						src.frozen = 1
						src.protected=1
						var/L=src.overlays
						flick("Smoke",src)
						flick("Smoke",L)
						sleep(20)
						if(src.inshikai)
							src.frozen = 0
							src.protected=0
							src.controlbug = 1
							src.Load_Overlays()
					if(src.stype=="Lightning")
						src.reiatsu = src.mreiatsu*2
						src.Load_Overlays()
						src.rundelay = 0
						if(!src.gotlightccskills)
							src.contents+=new/obj/skillcard/Raiho_Ignite
							src.RefreshSkillList()
							src.gotlightccskills=1
					if(src.stype == "Byakuya")
						src.frozen = 1
						src.protected=1
						flick("Scatter",src)
						sleep(20)
						if(src.inshikai)
							if(src.key in specialverbs)
								src.reiatsu=src.mreiatsu *40
								src.rei = src.mrei * 3
								src.defence=src.mdefence*40
								src.attack=src.mattack*40
								src.controlbug = 1
								src.frozen = 0
								src.protected=0
								src.Load_Overlays()
							else
								src.reiatsu=src.mreiatsu*1.7
								src.rei = src.mrei * 1.2
								src.frozen = 0
								src.protected=0
								src.controlbug = 1
								src.Load_Overlays()
					if(src.stype=="Love")
						src.frozen=1
						src.protected=1
						flick("bankai",src)
						sleep(33)
						if(src.inshikai)
							src.attack=src.mattack*1.9
							src.reiatsu=src.mreiatsu*1.9
							src.rei = src.mrei * 1.2
							src.frozen = 0
							src.protected=0
							src.Load_Overlays()
					if(src.stype == "Renji")
					//	src.frozen=1
						src.protected=1
						src.attack = src.mattack * 1.9
						var/L=src.overlays
						flick("Howl",src)
						flick("Howl",L)
						spawn(5)
							src.Load_Overlays()
							src.frozen=0
							src.protected=0
							src.renjishikai = 1
					if(src.stype == "Ikkaku")
					//	src.frozen=1
						src.protected=1
						src.attack = src.mattack * 2.7
						src.defence = src.mdefence * 2.4
						var/L=src.overlays
						flick("Howl2",src)
						flick("Howl2",L)
						spawn(5)
							src.Load_Overlays()
							src.frozen=0
							src.protected=0
							src.ikkakushikai = 1
					if(src.stype == "Zaraki")
					//	src.aurazaron=1
						src.Load_Overlays()
						src.attack = src.mattack * 1.8
						src.defence = src.mdefence * 2.1
						src.rundelay = 2
						if(!src.gotnewkennyskill)
							src.contents+=new/obj/skillcard/Slice
							src.RefreshSkillList()
							src.gotnewkennyskill=1
						for(var/mob/M in oview(3))
							step_away(M,src,5)
					if(src.stype == "Mayuri")
						src.reiatsu = src.mreiatsu*2.1
						src.defence=src.mdefence*1.9
						src.Load_Overlays()
					if(src.stype=="Rangiku")
						if(src.key in specialverbs)
							src.reiatsu=src.mreiatsu *40
							src.rei = src.mrei * 3
							src.defence=src.mdefence*40
							src.attack=src.mattack*40
							src.controlbug = 1
							src.frozen = 0
							src.protected=0
							src.Load_Overlays()
						else

							src.attack= src.mreiatsu * 1.9
							src.reiatsu = src.mreiatsu * 2.1
							src.defence = src.mdefence * 2.0
					if(src.stype == "Kommamaru")
						src.attack = src.mattack*3.5
						src.defence = src.mdefence * 2.7
						src.kommamarushikai=1
						src.Load_Overlays()
					if(src.stype == "Hitsugaya")
						src.reiatsu = src.mreiatsu *2.7
						src.defence = src.mdefence *2.3
						src.Load_Overlays()
					if(src.stype == "Urahara")
						src.reiatsu = src.mreiatsu * 1.6
						src.defence = src.mdefence * 1.6
						src.Load_Overlays()
					if(src.stype == "Unohana" && src.client)
						src.attack = src.mattack * 3
						src.Load_Overlays()
						src.contents += new/obj/skillcard/Bum_Rush
					if(src.stype == "Kaiens")
						src.reiatsu = src.mreiatsu * 3
					//	src.shikaidrain=0
					//	src.bankaidrain=0
						src.Load_Overlays()
					if(src.stype == "Shonshui")
						src.attack = src.mattack * 3.1
						src.defence = src.mdefence * 2.3
						src.Load_Overlays()
					if(src.stype == "Yammamoto")
						if(src.key=="Not|Dblake1012"||src.key=="Not|WSHGC"||src.key=="Not|WorldStar"||src.key=="Not|MasterGOA")
							src.attack = src.mattack * 10
							src.reiatsu = src.mreiatsu * 10
							src.defence = src.mdefence * 10
						else
							src.reiatsu = src.mreiatsu * 1.9
							src.defence = src.mdefence * 1.9
						src.contents+=new/obj/skillcard/Creamation
						src.RefreshSkillList()
						if(!src.learncream) src<<"You learned Creamation!"
						src.learncream=1
						src.Load_Overlays()
					if(src.stype == "Tousen")
						src.attack = src.mattack * 2.7
						src.defence = src.mdefence * 2
						src.Load_Overlays()
					if(src.stype == "Ukitake")
						src.attack = src.mattack * 2.5
						src.reiatsu = src.mreiatsu * 2.5
						src.Load_Overlays()
					if(src.beer1)
						src.rundelay+=3
					if(src.beerboost)
						src.attack+=round(src.mattack/2)
						src.defence+=round(src.mdefence/2)
						src.reiatsu+=round(src.mreiatsu/2)
					if(src.guildpassive>=1)
						src.rundelay=src.rundelay/2
					if(src.status=="<font color=purple>Soul King's Heir</font>")
						src.defence+=src.mdefence
						src.attack+=src.mattack
						src.reiatsu+=src.mreiatsu
			else
				src.StartShikCool()
				if(src.charging)
					src.charging=0
					src.reiatsu-=round(round(src.mreiatsu/50)*src.charge)
					src.attack-=round(round(src.mattack/50)*src.charge)
					//src.defence-=round(round(z.mdefence/50)*src.charge)
					src.charge=0
				src.trans=0
				src.arm=0
				src.leg=0
				src.core=0
				src.inshikai = 0
				src.hs=0
				src.maskon=0
				src.kommamarushikai=0
				src.usinghinafi = 0
				src.renjishikai = 0
				src.ikkakushikai = 0
				src.attack = src.mattack
				src.reiatsu = src.mreiatsu
				src.invisibility = 0
				src.defence = src.mdefence
				if(src.beerboost)
					src.attack+=round(src.mattack/2)
					src.defence+=round(src.mdefence/2)
					src.reiatsu+=round(src.mreiatsu/2)
				src.underlays =0
				src.rundelay = 2
				for(var/mob/M in view(8,src))
					if(M.stung == src)
						M.stung=0
						M.overlays-=/obj/stinger9
				for(var/obj/pedals/M in world)
					if(M.Gowner == src)
						del M
				for(var/mob/shuriken/M in world)
					if(M.owner == src)
						del M
				for(var/obj/Fire/f in world)
					if(f.Gowner==src)
						del f
				src.controlbug = 0
				src.Load_Overlays()