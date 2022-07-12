mob/var
	zanchangtimes=0
	eventlvpused=0
obj
 var
		zer = 0


mob
 Ressureccion_Changer
		name = "{NPC}Ressureccion Changer"
		npc = 1
		New()
			..()
			src.HairGen()
			src.arrancarmask=rand(1,14)
			src.overshirt=pick(/obj/cloak/espada/e1,/obj/cloak/espada/e2)
			src.weapon=/obj/weapon/sword
			src.StypeGen()
			src.CeroGen()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(usr.race == "Arrancar")
					if(!usr.gotress)
						usr << "<b>You need to have ress first."
						return
					var/moneyreq=900000-(usr.zanchangtimes*100000)
					var/epreq=25-(usr.zanchangtimes*5)
					if(moneyreq<500000)moneyreq=500000
					if(epreq<10)epreq=10
					if(usr.donorfreeress==1||usr.key == "Dornamu"||usr.key == "Silver9014"||usr.key == "Igyst"||usr.key == "Tarcioblazek"||usr.key == "DevilKnightSparda"||usr.key == "AzureRain"||usr.key == "BlackUchiha777"||usr.key == "Icedpali"||usr.key == "Condemned pizz4")
						moneyreq=0
						epreq=0
					if(holdinghoug=="Hueco Mundo")
						moneyreq-=moneyreq/2
						epreq-=epreq/2
					if(usr.money<moneyreq&&usr.GM<=5)
						usr << "<b>You need at least $[moneyreq] and [epreq] event points"
						return
					if(usr.eventpoints<epreq&&usr.GM<=5)
						usr<<"<b>You need at least [epreq] event points"
						return
					switch(input("Do you want to change your Ress?(This can only be done once per relog)", text) in list ("Yes","No"))
						if("Yes")
							if(usr.GM<=5||usr.donorfreeress!=1||usr.key == "Dornamu"||!usr.key == "Anbukev"||!usr.key == "Tarcioblazek"||!usr.key == "AzureRain"||!usr.key == "DevilKnightSparda"||!usr.key == "BlackUchiha777"||!usr.key == "Icedpali"||!usr.key == "Condemned pizz4")
								usr.money-=moneyreq
								usr.eventpoints-=epreq
							usr.attack=usr.mattack
							usr.defence=usr.mdefence
							usr.reiatsu=usr.mreiatsu
							usr.zanchangtimes+=1
							usr.client.eye=locate(192,141,1)
							usr.client.perspective=EYE_PERSPECTIVE
							usr.gotyoyo=0
							usr.gotwolf=0
							usr.gotthrow=0
							usr.gotage=0
							usr.gotcascada=0
							usr.gotoutrage=0
							usr.gottentacle=0
							usr.gotdesgarron=0
							usr.gotrev=0
							usr.kicks=0
							usr.thits=0
							usr.gothits=0
							usr.gotring=0
							usr.gotbringerb=0
							usr.gotgame=0
							usr.gotkick=0
							usr.getsugaring=0
							usr.bringerblast=0
							usr.shielduses=0
							usr.gottsubaki=0
							usr.gotsheild=0
							usr.gotlacerate=0
							usr.gotdualswords=0
							usr.gotdragon=0
							usr.gotsovereign=0
							usr.gotspear=0
							usr.gotfujimaruskills=0
							usr.Reset_Skillcards()
							usr.skill1=null
							usr.skill2=null
							usr.skill3=null
							usr.skill4=null
							usr.skill5=null
							usr.skill6=null
							usr.skill7=null
							usr.skill8=null
							usr.skill9=null
							usr.skill0=null
							usr.skillsub=null
							usr.skillequ=null
							usr.skillq=null
							usr.skille=null
							usr.skillo=null
							usr.skillp=null
							usr.skillpar=null
							usr.skilly=null
							usr.skillw=null
							usr << "<font color=purple>Your skillbar has been reseted"
							for(var/obj/skillcard/s in usr.contents)
								if(s.iszan)
									usr.contents-=s
									usr.RefreshSkillList()


mob
 Zanpakuto_Changer
		name = "{NPC}Zanpakuto Changer"
		npc = 1
		New()
			..()
			src.HairGen()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(usr.race == "Shinigami"||usr.race == "Vaizard")
					if(!usr.bankai)
						usr << "<b>You need to have bankai first.(Level 400)"
						return
					if(usr.stype=="Kido Class")
						usr<<"You don't use zanpakutous"
						return
					var/moneyreq=900000-(usr.zanchangtimes*100000)
					var/epreq=25-(usr.zanchangtimes*5)
					if(moneyreq<500000)moneyreq=500000
					if(epreq<10)epreq=10
					if(usr.donorfreezans==1||usr.key == "Adlofs"||usr.key == "KillManiac"||usr.key == "Silver9014"||usr.key == "Oksim7"||usr.key == "Anbukev"||usr.key == "Domtay3"||usr.key == "Juter"||usr.key == "Igyst"||usr.key == "Tarcioblazek"||usr.key == "DevilKnightSparda"||usr.key == "Silver1490"||usr.key == "AzureRain"||usr.key == "Xsinx3"||usr.key == "Vash-Da-Trigun"||usr.key == "Stone186"||usr.key == "Jackdriver123"||usr.key == "Lan0345"||usr.key == "Anbutyler18"||usr.key == "BlackUchiha777"||usr.key == "Condemned pizz4"||usr.key == "Billinos"||usr.key == "Badtooth")
						moneyreq=0
						epreq=0
					if(holdinghoug=="Seiretei"&&usr.race=="Shinigami")
						moneyreq-=moneyreq/2
						epreq-=epreq/2
					if(usr.race=="Vaizard"&&holdinghoug=="Earth")
						moneyreq=moneyreq/2
						epreq=epreq/2
					if(usr.money<moneyreq&&usr.GM<=5)
						usr << "<b>You need at least $[moneyreq] and [epreq] event points"
						return
					if(usr.eventpoints<epreq&&usr.GM<=5)
						usr<<"<b>You need at least [epreq] event points"
						return
					switch(input("Do you want to change your Zanpaktou?(This can only be done once per relog)", text) in list ("Yes","No"))
						if("Yes")
							if(usr.GM<=5||usr.donorfreezans!=1)
								usr.money-=moneyreq
								usr.eventpoints-=epreq
							if(usr.inshikai)
								usr.Shikai()
							if(usr.inbankai)
								usr.Bankai()
							usr.attack=usr.mattack
							usr.defence=usr.mdefence
							usr.reiatsu=usr.mreiatsu
							usr.zanchangtimes+=1
							usr.client.eye=locate(192,124,1)
							usr.client.perspective=EYE_PERSPECTIVE
							usr << "<b>You must fight your Zanpaktou's true bankai form to obtain your main skills."
							usr.shikai=0
							usr.mastered=2
							usr.gotrev=0
							usr.kicks=0
							usr.thits=0
							usr.gothits=0
							usr.gotring=0
							usr.gotbringerb=0
							usr.gotfujimaruskills=0
							usr.gotgame=0
							usr.gotkick=0
							usr.getsugaring=0
							usr.bringerblast=0
							usr.gotlightccskills=0
							usr.gotlightccskills2=0
							usr.gotnewkennyskill=0
							usr.shielduses=0
							usr.gottsubaki=0
							usr.gotsheild=0
							usr.gotdesgarron=0
							usr.bankaidrain=1
							usr.shikaidrain=1
							usr << "<font color=purple><b>NOTE:</b>You must first master shikai, then master bankai in order to get all of your skills(This applies to: Muramasa, Jiroubou, Ichigo, Hitsugaya, Aizen, Yammamoto, and Byakuya)."
							usr.skill1=null
							usr.skill2=null
							usr.skill3=null
							usr.skill4=null
							usr.skill5=null
							usr.skill6=null
							usr.skill7=null
							usr.skill8=null
							usr.skill9=null
							usr.skill0=null
							usr.skillsub=null
							usr.skillequ=null
							usr.skillq=null
							usr.skille=null
							usr.skillo=null
							usr.skillp=null
							usr.skillpar=null
							usr.skilly=null
							usr.skillw=null
							usr.Reset_Skillcards()
							usr << "<font color=purple>Your skillbar has been reseted"
							for(var/obj/skillcard/s in usr.contents)
								if(s.iszan)
									usr.contents-=s
									usr.RefreshSkillList()
mob
 Respec
		name = "{NPC}Respec"
		npc = 1
		New()
			..()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.oldspot = src.loc
			src.ClothesGen()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(usr.money<400000&&usr.GM<=5)
					usr << "<b>You need at least $400,000"
					return
				switch(input("Do you want to respec your stats, passives, and combos (boosted stats from events including event shop will be removed permanently)??(You can only respec 4 times, this is your [usr.respectimes]/4)", text) in list ("Yes","No"))
					if("Yes")
						if(usr.respectimes<4||usr.GM>1)
							if(usr.GM<=5)
								usr.money-=400000
							usr.Respec()
/*							var/flevel=usr.level
							if(flevel>1500)flevel=1500
							usr.respectimes+=1
							usr.mattack=100
							usr.mdefence=100
							usr.mreiatsu=100
							usr.mrei=50
							usr.rawbuff=0
							usr.choseboost=0
							usr.mhealth=10000
							usr.mhealth+=flevel*400
							usr.health=usr.mhealth
							usr.rawbuff+=(flevel*2)+100
							usr.mattack+=flevel*2
							usr.mdefence+=flevel*2
							usr.mreiatsu+=flevel*2
							usr.mrei+=flevel*15
							usr.levelpoints=flevel*8
							if(usr.stype=="Kido Class")
								usr.levelpoints+=flevel*8
							usr.combos=0
							if(usr.level==50||usr.level==100||usr.level==200||usr.level==400||usr.level==1000)
								usr.combos+=1
							if(usr.Rebirthed==0)
								usr.skillspassive=round(flevel/10,1)
							if(usr.Rebirthed == 1)
								usr.skillspassive=round(flevel/5,1)
							if(usr.Rebirthed==1)
								usr.mrei += 1000
								usr.mattack+=1000
								usr.attack+=1000
								usr.mdefence+=1000
								usr.defence+=1000
								usr.mreiatsu+=1000
								usr.reiatsu+=1000
								usr.rawbuff+=1000
							if(usr.Lvl1000Boost == 1)
								usr.combos+=1
								usr.mhealth += 1000
								usr.mrei += 1000
								usr.mattack+=1000
								usr.attack+=1000
								usr.mdefence+=1000
								usr.defence+=1000
								usr.mreiatsu+=1000
								usr.reiatsu+=1000
								usr.rawbuff+=1000
							if(usr.Lvl1000BoostRB == 1)
								usr.mhealth += 5000
								usr.mrei += 1500
								usr.mattack+=1500
								usr.attack+=1500
								usr.mdefence+=1500
								usr.defence+=1500
								usr.mreiatsu+=1500
								usr.reiatsu+=1500
								usr.rawbuff+=1500
							if(usr.level>=100)
								usr.combos+=1
								usr.mrei+=100
								usr.mhealth+=100
							if(usr.level>=200)
								usr.combos+=1
								usr.mrei+=200
								usr.mhealth+=200
							if(usr.level>=400)
								usr.combos+=1
								usr.mhealth+=200
								usr.mrei+=200
							if(usr.level>=800)
								usr.combos+=1
							if(usr.level>=1000)
								usr.combos+=1
								usr.mhealth+=1000
								usr.mrei+=1000
							if(usr.wasstrong)
								usr.mhealth += 100
								usr.mrei += 100
								usr.mattack += 30
								usr.mdefence += 30
								usr.rawbuff+=30
								usr.mreiatsu += 30
							if(usr.wasmenos)
								usr.mhealth += 100
								usr.mrei += 100
								usr.rawbuff+=200
								usr.mattack += 200
								usr.mdefence += 200
								usr.mreiatsu += 200
							if(usr.wasadjucha)
								usr.mhealth += 500
								usr.mrei += 100
								usr.mattack += 600
								usr.mdefence += 600
								usr.mreiatsu += 600
								usr.rawbuff+=600
							if(usr.wasvasto)
								usr.mhealth += 5000
								usr.mrei += 2000
							if(usr.evilgood=="Good")
								usr.mattack += 1000
								usr.mdefence += 1000
								usr.mreiatsu += 1000
								usr.rawbuff+=1000
								usr.mrei += 2000
							if(usr.key=="Kowala")
								usr.rawbuff+=5000
								usr.mattack+=5000
								usr.mdefence+=5000
								usr.mreiatsu+=5000
								usr.mhealth+=150000
								usr.mrei+=7500
								usr.attack+=5000
								usr.defence+=5000
								usr.reiatsu+=5000
								usr.rei+=7500
								usr.health+=150000
							if(usr.key=="Sharingan100")
								usr.rawbuff+=3500
								usr.mattack+=3500
								usr.attack+=3500
								usr.mdefence+=3500
								usr.defence+=3500
								usr.mreiatsu+=3500
								usr.reiatsu+=3500
								usr.mrei+=5000
								usr.rei+=5000
								usr.mhealth+=90000
							if(usr.SecondRebirth==1)
								usr.mrei += 3000
								usr.mattack+=3000
								usr.mdefence+=3000
								usr.mreiatsu+=3000
								usr.rawbuff+=3000
							usr.mattack += usr.donorstat*150
							usr.mdefence += usr.donorstat*150
							usr.mreiatsu += usr.donorstat*150
							usr.rawbuff += usr.donorstat*150
							usr.levelpoints +=eventlvpused*100
							usr.shinipassive=0
							usr.headpassive=0
							usr.bodypassive=0
							usr.armpassive=0
							usr.legpassive=0
							usr.powerhit=0
							usr.regenrate=100
							usr.regenpassive=0
							usr.bloodlust=0
							usr.hierro=0
							usr.instinct=0
							usr.quickflash=0
							usr.berserk=0
							usr.senka=0
							usr.combat1=0
							usr.combat2=0
							usr.combat3=0
							usr.gotaccelfb=0
							usr.alcoholic=10
							usr.senkacounter=0
							usr.woundregen=0
							usr.rudecomment=0
							usr.racist=0
							usr.toughguy=0
							usr.ruthless=0
							usr.ichimoment=0
							usr.whoareyou=0
							usr.olympics=0
							usr.cannibalism=0
							usr.angel=0
							usr.spyp=0
							usr.respect=0
							usr.face=0
							usr.treason=0
							usr.loyalty=0
							usr.glare=0
							usr.boneharden=0
							usr.survival=0
							usr.openstrike=0
							usr.hibernation=0
							usr.hypebeast=0
							usr.backup=0
							usr.armorpassive=0
							usr.piercepassive=0
							usr.matador=0
							usr.criticalhits=0
							usr.invincibility=0
							usr.secondchance=0
							usr.reidrainage=0
							usr.stunpassive=0
							usr.guildpassive=0
							usr.marksman=0
							usr.rei=usr.mrei
							usr.health=usr.mhealth
							usr.attack=usr.mattack
							usr.defence=usr.mdefence
							usr.reiatsu=usr.mreiatsu
							usr<<"Your character has been respecced."*/
mob
 Fullbring_Changer
		name = "{NPC}Fullbring Changer"
		npc = 1
		New()
			..()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.FtypeGen()
			src.getsugaring=rand(1,300)
			src.oldspot = src.loc
			src.ClothesGen()
			src.infull=1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(usr.race == "Fullbringer")
					if(!usr.gotshik)
						usr << "<b>You need to have obtained your fullbring first."
						return
					if(usr.money<600000&&usr.GM<=5&&usr.donorfreefb!=1)
						usr << "<b>You need at least $600,000 and 15 event points"
						return
					if(usr.eventpoints<15&&usr.GM<=5&&usr.donorfreefb!=1)
						usr<<"<b>You need at least 15 event points"
						return
					switch(input("Do you want to change your Fullbring?(This can only be done once per relog)", text) in list ("Yes","No"))
						if("Yes")
							if(!usr.donorfreefb)
								usr.money-=600000
								usr.eventpoints-=15
							usr.client.eye=locate(175,158,1)
							usr.client.perspective=EYE_PERSPECTIVE
							usr.gotrev=0
							usr.kicks=0
							usr.thits=0
							usr.gothits=0
							usr.gotring=0
							usr.gotginjogrc=0
							usr.gotbringerb=0
							usr.gotgame=0
							usr.gotkick=0
							usr.gotaccelfb=0
							usr.gotgetsugajab=0
							usr.getsugaring=0
							usr.gotfiredollskills=0
							usr.gotfiredollskills2=0
							usr.gotwaterdollskills=0
							usr.bringerblast=0
							usr.shielduses=0
							usr.gottsubaki=0
							usr.gotsheild=0
							gotwaterdollskills=0
							usr.skill1=null
							usr.skill2=null
							usr.skill3=null
							usr.skill4=null
							usr.skill5=null
							usr.skill6=null
							usr.skill7=null
							usr.skill8=null
							usr.skill9=null
							usr.skill0=null
							usr.skillsub=null
							usr.skillequ=null
							usr.skillq=null
							usr.skille=null
							usr.skillo=null
							usr.skillp=null
							usr.skillpar=null
							usr.skilly=null
							usr.skillw=null
							usr.Reset_Skillcards()
							usr.skill()
							usr << "<font color=purple>Your skillbar has been reseted"
							for(var/obj/skillcard/s in usr.contents)
								if(s.iszan)
									usr.contents-=s
									usr.RefreshSkillList()
							spawn(50)
							if(usr.gotfinalfb==2)
								if(usr.ftype=="Ginjo")
									usr<<"You can now absorb projectiles and gain reiatsu"
									usr.contents+=new/obj/skillcard/Return_Blast
									usr.RefreshSkillList()
								if(usr.ftype=="Ichigo")
									usr.contents+=new/obj/skillcard/Ring_Parade
									usr.RefreshSkillList()
									usr<<"You can now fire Getsuga Rings at a rapid pace"
								if(usr.ftype=="Jackie")
									usr.contents+=new/obj/skillcard/Critical_Burst
									usr.contents+=new/obj/skillcard/Critical_Stun
									usr.RefreshSkillList()
									usr<<"You can now utilize your boots for different effects"
								if(usr.ftype=="Tsukishima")
									usr.contents+=new/obj/skillcard/Harmful_Recoil
									usr.RefreshSkillList()
									usr<<"You can now force enemies to hit themselves"
								if(usr.ftype=="Yukio")
									usr.contents+=new/obj/skillcard/Power_Monsters
									usr.RefreshSkillList()
									usr<<"You can now power your monsters"
mob
	var
		fuseCount=0

		/*
		fuseList = list(/mob/CustomZan/verb/Kensei_Fuse,
					/mob/CustomZan/verb/Vai_Fuse,
					/mob/CustomZan/verb/Sado_Fuse,
					/mob/CustomZan/verb/Tousen_Fuse,
					/mob/CustomZan/verb/Yama_Fuse,
					/mob/CustomZan/verb/Szayel_Fuse,
					/mob/CustomZan/verb/Volcanica_Fuse,
					/mob/CustomZan/verb/Hitsu_Fuse,
					/mob/CustomZan/verb/Ulq_Fuse,
					/mob/CustomZan/verb/Grimm_Fuse,
					/mob/CustomZan/verb/Ichi_Fuse,
					/mob/CustomZan/verb/Halibel_Fuse,
					/mob/CustomZan/verb/Rukia_Fuse,
					/mob/CustomZan/verb/Bar_Fuse,
					/mob/CustomZan/verb/Jackie_Fuse,
					/mob/CustomZan/verb/Nell_Fuse,
					/mob/CustomZan/verb/Gamer_Fuse,
					/mob/CustomZan/verb/Fire_Doll_Fuse,
					/mob/CustomZan/verb/Fuji_Fuse,
					/mob/CustomZan/verb/Byak_Fuse,
					/mob/CustomZan/verb/Kaien_Fuse,
					/mob/CustomZan/verb/Change_To_Ginjo,
					/mob/CustomZan/verb/Change_To_Tsuki,
					/mob/CustomZan/verb/Change_To_Samurai)
		*/
		fuseList = list(("Kensei Fuse") = /mob/CustomZan/verb/Kensei_Fuse,
						("Vaizard Fuse") = /mob/CustomZan/verb/Vai_Fuse,
						("Sado Fuse") = /mob/CustomZan/verb/Sado_Fuse,
						("Tousen Fuse") = /mob/CustomZan/verb/Tousen_Fuse,
						("Yamamoto Fuse") = /mob/CustomZan/verb/Yama_Fuse,
						("Szayel Fuse") = /mob/CustomZan/verb/Szayel_Fuse,
						("Volcanica Fuse") = /mob/CustomZan/verb/Volcanica_Fuse,
						("Hitsugaya Fuse") = /mob/CustomZan/verb/Hitsu_Fuse,
						("Ulquiorra Fuse") = /mob/CustomZan/verb/Ulq_Fuse,
						("Grimmjow Fuse") = /mob/CustomZan/verb/Grimm_Fuse,
						("Ichigo(Fullbring) Fuse") = /mob/CustomZan/verb/Ichi_Fuse,
						("Halibel Fuse") = /mob/CustomZan/verb/Halibel_Fuse,
						("Rukia Fuse") = /mob/CustomZan/verb/Rukia_Fuse,
						("Baraggan Fuse") = /mob/CustomZan/verb/Bar_Fuse,
						("Jackie Fuse") = /mob/CustomZan/verb/Jackie_Fuse,
						("Nell Fuse") = /mob/CustomZan/verb/Nell_Fuse,
						("Yukio Fuse") = /mob/CustomZan/verb/Gamer_Fuse,
						("Fire Doll Fuse") = /mob/CustomZan/verb/Fire_Doll_Fuse,
						("Fujimaru Fuse") = /mob/CustomZan/verb/Fuji_Fuse,
						("Byakuya Fuse") = /mob/CustomZan/verb/Byak_Fuse,
						("Kaien Fuse") = /mob/CustomZan/verb/Kaien_Fuse,
						("Ginjo Fuse") = /mob/CustomZan/verb/Change_To_Ginjo,
						("Tsukishima Fuse") = /mob/CustomZan/verb/Change_To_Tsuki,
						("Yumichika Fuse") = /mob/CustomZan/verb/Yumichika_Fuse,
						("Samurai Fuse") = /mob/CustomZan/verb/Change_To_Samurai)

	DP_Shop_NPC
		name = "{NPC}DP Shop Owner"
		npc = 1
		New()
			..()
			src.ClothesGen()
			src.HairGen()
			src.Load_Overlays()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(usr.donor_points>0)
					var/rebirthcount = usr.timesRebirthed
					var/list/DPList = new
					var/mob/O
					var/FuseCost=750

					//Boosts for higher Level

					/*
					src.contents|=new/obj/skillcard/Hollow_Zangetsu
					src.contents|=new/obj/skillcard/Rinnegan

					*/

					//Fuses
					/*
					src.verbs|=/mob/CustomZan/verb/Kensei_Fuse
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src.verbs|=/mob/CustomZan/verb/Tousen_Fuse
					src.verbs|=/mob/CustomZan/verb/Yama_Fuse
					src.verbs|=/mob/CustomZan/verb/Szayel_Fuse
					src.verbs|=/mob/CustomZan/verb/Volcanica_Fuse
					src.verbs|=/mob/CustomZan/verb/Hitsu_Fuse
					src.verbs|=/mob/CustomZan/verb/Ulq_Fuse
					src.verbs|=/mob/CustomZan/verb/Grimm_Fuse
					src.verbs|=/mob/CustomZan/verb/Ichi_Fuse
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src.verbs|=/mob/CustomZan/verb/Halibel_Fuse
					src.verbs|=/mob/CustomZan/verb/Rukia_Fuse
					src.verbs|=/mob/CustomZan/verb/Bar_Fuse
					src.verbs|=/mob/CustomZan/verb/Jackie_Fuse
					src.verbs|=/mob/CustomZan/verb/Nell_Fuse
					src.verbs|=/mob/CustomZan/verb/Gamer_Fuse
					src.verbs|=/mob/CustomZan/verb/Fire_Doll_Fuse
					src.verbs|=/mob/CustomZan/verb/Fuji_Fuse
					src.verbs|=/mob/CustomZan/verb/Byak_Fuse
					src.verbs|=/mob/CustomZan/verb/Kaien_Fuse
					src.verbs|=/mob/CustomZan/verb/Change_To_Ginjo
					src.verbs|=/mob/CustomZan/verb/Change_To_Tsuki
					src.verbs|=/mob/CustomZan/verb/Change_To_Samurai
					*/
					DPList += fuseList

					DPList += "Red Hakuteiken"

					var/mob/U = input("Which item from the DP store do you want to purchase?", "DP Shop Owner") as null|anything in DPList
					O = fuseList[U]
					if(!O)
						switch(U)
							if("Red Hakuteiken")
								if(usr.redH==0)
									if(usr.UseDP(2000))
										usr.redH=1
										usr.contents|=new/obj/skillcard/RedHakuteiken
										usr.RefreshSkillList()
										usr<<"You've learned the ultimate boost needed to take on your enemies."
								else
									usr<<"You already have Red Hakuteiken."
							else
								usr<<"Feature coming soon."
					else
						if((O in usr.verbs)== 0)
							if(usr.UseDP(FuseCost))
								usr.verbs|=O
								usr<<"You've attained the [U]"
								usr.fuseCount++
						else
							usr<<"You already have the [U]"

					usr.saveproc()
				else
					usr<<"You don't have any donor points to spend."
