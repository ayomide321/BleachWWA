

mob/Owner/verb/Rebirth()
		set category = "TESTING"
		RebirthRelapse1(src)

mob/Owner/verb/Rebirth2nd()
		set category = "TESTING"
		RebirthRelapse2(src)


mob/var
	rebirthedrelapse=0
	timesRebirthedRel=0
	RebirthedRel=0
	Rebirthed234=0
	Rebirthed123=0

mob/Owner
	verb
		RespecRel()
			set category = "TESTING"
			RespecRelapse()


mob
	Owner
		verb
			RebirthRelapse1(mob/M in world)
				set category = "Owner"
				switch(input(M,"Are you sure you want to prestige?","Prestige", text) in list ("Yes","No"))
					if("Yes")
					/*	if(M.rebirthedrelapse && timesRebirthedRel)
							alert(M,"This is your first prestige rebirth!")
						if(M.rebirthedrelapse==2 && timesRebirthedRel==2)
							alert(M,"This is your second prestige rebirth!")	*/
						AutoSave()
						M.talkingtorb = 1
						switch(input(M,"Are you really really sure you want to rebirth, last chance!?","Rebirth", text) in list ("Yes","No"))
							if("No")
								AutoSave()
								M.talkingtorb = 1
								return
							if("Yes")
							/*	M.RebirthedRel=1
								if(M.timesRebirthedRel && M.rebirthedrelapse)
									M.timesRebirthedRel=2
									M.rebirthedrelapse=2
									M.RebirthedRel=0

								else	if(M.timesRebirthedRel==2 && M.rebirthedrelapse==2)
									M.timesRebirthedRel=3
									M.rebirthedrelapse=3
									M.level=50
									M.RebirthedRel=0	*/
							//	M.timesRebirthedRel=1
							//	M.rebirthedrelapse=1
							//	M.level=20

								M.race = ""
								M.level=20
								M.contents-=M.contents
								M.Rebirthed123 = 1
								M.shinip = 0
								M.earth=0
								M.hollow=0
								M.eventlvpused=0
								spawn()
									switch(input("Are you evil or good?","", text) in list ("Evil","Good"))
										if("Evil")
											M.hashoug=1
										//	M.contents+=new/obj/items/equipable/Hougyoku
											M.evilgood="Evil"
										if("Good")
											M.evilgood="Good"
								spawn()
									switch(input("What race do you wish to rebirth into?","Rebirth", text) in list ("Quincy","Shinigami","Sado", "Hollow","FullBringer"))
										if("Quincy")
											M.race="Quincy"
											world << "<b><font color = aqua>Race Info: [M] Has rebirthed into a Quincy!"
											M.contents+=new/obj/items/equipable/Overshirt/Quincy1
											M.contents+=new/obj/skillcard/Bow
											M.seelsword=1
											M.contents+=new/obj/items/equipable/Shirt/Black
											M.contents+=new/obj/items/equipable/Pants/Black
											M.contents+=new/obj/items/equipable/Shoes/Black
											M.earth=1
											M.Load_Overlays()
											M.Affirm_Icon()
										if("Shinigami")
											world << "<b><font color = white>Race Info: [M] Has rebirthed into a Shinigami!"
											M.race = "Shinigami"
											M.contents+= new/obj/items/equipable/Weapon/Sword
											M.contents+= new/obj/items/equipable/Overshirt/Shinigami1
											M.contents+= new/obj/items/equipable/Overshirt/Shinigami2
											M.shinip = 1
											M.contents+=new/obj/items/equipable/Pants/Black
											M.contents+=new/obj/items/equipable/Shoes/Black
											M.Load_Overlays()
											M.Affirm_Icon()
										if("Sado")
											M.race="Sado"
											world << "<b><font color = purple>Race Info: [M] Has rebirthed into a Sado!"
											M.contents+=new/obj/items/equipable/Shirt/Black
											M.contents+=new/obj/items/equipable/Shoes/Black
											M.contents+=new/obj/items/equipable/Pants/Black
											M.contents+=new/obj/skillcard/Return_Blast
											M.earth=1
											M.Load_Overlays()
											M.Affirm_Icon()
										if("FullBringer")
											M.race="Fullbringer"
											world << "<b><font color = green>Race Info: [M] Has rebirthed into a Fullbringer!"
											M.contents+=new/obj/items/equipable/Shirt/Black
											M.contents+=new/obj/items/equipable/Shoes/Black
											M.contents+=new/obj/items/equipable/Pants/Black
											M.earth=1
											M.Load_Overlays()
											M.Affirm_Icon()
										if("Hollow")
											M.race = "Hollow"
											M.overlays = 0
											world << "<b><font color = gray>Race Info: [M] Has rebirthed into a Hollow!"
											M.rank = "Weak Hollow"
											M.gotdevour = 1
											M.hollowtype = "Normal"
											M.hollow=1
											M.Load_Overlays()
											M.Affirm_Icon()





								M.overlays = 0
								M.choseboost=0
								M.combos+=1
								M.contents+=new/obj/skillcard/Sense
								M.contents+=new/obj/skillcard/Hide_Presence
								M.contents+=new/obj/skillcard/Flash_Step
								M.contents+=new/obj/skillcard/Flashing_Attack
								M.contents+=new/obj/skillcard/Spiritual_Pressure
								M.exp=0
								M.mexp=1
								if(M.gotdualzan)
									M.contents+=new/obj/items/equipable/DualZangetsu
							//	if(M.evilgood=="Evil" && M.hashoug)
							//		M.contents+=new/obj/items/equipable/Hougyoku
								if(M.blackflames)
									M.contents+=new/obj/skillcard/Amaterasu
								if(M.eyesofgod)
									M.contents+=new/obj/skillcard/Rinnegan
								if(M.donorarm)
									M.contents+=new/obj/skillcard/Sado_ArmDP
								if(M.gotsharingan)
									M.contents+=new/obj/skillcard/Sharingan
								if(M.donormask)
									M.contents+=new/obj/skillcard/Vasto_FormDP
									M.maskuses=1000
								M.contents+=new/obj/skillcard/Release_Color
							//	M.eventpoints += 25
							//	M.money += 50000
								M.shinipassive=0
								M.headpassive=0
								M.bodypassive=0
								M.armpassive=0
								M.legpassive=0
							//	M.rebirthedrelapse=1
								M.powerhit=0
								M.regenrate=100
								M.regenpassive=0
								M.bloodlust=0
								M.hierro=0
								M.instinct=0
								M.quickflash=0
								M.berserk=0
								M.senka=0
								M.combat1=0
								M.combat2=0
								M.combat3=0
								M.choseyet=0
								M.hasarrancarrelease=0
								M.alcoholic=10
								M.senkacounter=0
								M.woundregen=0
								M.rudecomment=0
								M.canvasto=0
								M.racist=0
								M.toughguy=0
								M.ruthless=0
								M.shikai=0
								M.full=0
								M.gotaccelfb=0
								M.espadas=""
								M.ichimoment=0
								M.whoareyou=0
								M.olympics=0
								M.cannibalism=0
								M.gotruth=0
								M.angel=0
								M.spyp=0
								M.respect=0
								M.face=0
								M.treason=0
								M.loyalty=0
								M.glare=0
								M.boneharden=0
								M.survival=0
								M.openstrike=0
								M.hibernation=0
								M.hypebeast=0
								M.backup=0
								M.armorpassive=0
								M.piercepassive=0
								M.matador=0
								M.gotfgt=0
								M.criticalhits=0
								M.invincibility=0
								M.secondchance=0
								M.reidrainage=0
								M.beatfgts=0
								M.gotsense=0
								M.beatashell=0
								M.stunpassive=0
								M.rei=M.mrei
								M.triedvai=0
								M.gotsanrei=0
								M.gotvai=0
								M.gotvai2=0
								M.gotvasto= 0
								M.espadasold=null
								M.squad=""
								M.squadid=null
								M.rank=""
								M.health=M.mhealth
								M.attack=M.mattack
								M.defence=M.mdefence
								M.reiatsu=M.mreiatsu
								M.stype= ""
								M.ressurectiontype= ""
								M.swordcall= ""
								M.swordname= ""
								M.ressurection=0
								M.status = ""
								M.ftype = 0
								M.swordon=0
								M.gotrev=0
								M.canbuyseele=0
								M.hasaseele=0
								M.kicks=0
								M.thits=0
								M.gothits=0
								M.gotring=0
								M.gotbringerb=0
								M.gotgame=0
								M.gotkick=0
								M.getsugaring=0
								M.bringerblast=0
								M.shielduses=0
								M.gottsubaki=0
								M.gotsheild=0
								M.gotress=0
								M.gotflash=0
								M.gotbum = 0
								M.gotwolf=0
								M.gotyoyo=0
								M.gotlacerate=0
								M.gotdesgarron=0
								M.gotafull=0
								M.gotdragon=0
								M.gotoutrage=0
								M.gotthrow=0
								M.gotspear=0
								M.learnedtogglehina=0
								M.gotshik = 0
								M.arelease=0
								M.chosebex=0
								M.beatkenpachi = 0
								M.gotHollowRage=0
								M.nextrespec=0
								M.gotkido=0
								M.chosespirit=0
								M.spiritweapon=0
								M.gotneg=0
								M.gotaizen=0
								M.needrespec=0
								M.gotfinalfb=0
								M.gotlimitrelease= 0
								M.lreleaseuses= 0
								M.shielduses=0
								M.gotsheild=0
								M.gottsubaki=0
								M.wasstrong=0
								M.wasmenos=0
								M.gotscreech=0
								M.wasadjucha=0
								M.wasvasto=0
								M.respectimes=0
								M.gotaarm=0
								M.bowtype = 0
								M.gotrelease1 = 0
								M.gotrelease2 = 0
								M.gotrelease3 = 0
								M.gotfinal = 0
								M.gotfinal2 = 0
								M.gotcero = 0
								M.gotcero2 = 0
								M.bala = 0
								M.kido1 = 0
								M.kido2 = 0
								M.kido3 = 0
								M.kido4 = 0
								M.kido5 = 0
								M.kido6 = 0
								M.silver1 = 0
								M.silver2 = 0
								M.silver3 = 0
								M.silver4 = 0
								M.silver5 = 0
								M.skillq=null
								M.skille=null
								M.skillo=null
								M.skillp=null
								M.skill0=null
								M.skill1=null
								M.skill2=null
								M.skill3=null
								M.skill4=null
								M.skill5=null
								M.skill6=null
								M.skill7=null
								M.skill8=null
								M.skill9=null
								M.skillequ=null
								M.skillsub=null
							//	M.timesRebirthedRel=1

								M.RespecRelapse()
								M.Reset_Skillcards()



			RebirthRelapse2(mob/M in world)
				set category = "Owner"
				switch(input(M,"Are you sure you want to prestige?","Prestige", text) in list ("Yes","No"))
					if("Yes")
					/*	if(M.rebirthedrelapse && timesRebirthedRel)
							alert(M,"This is your first prestige rebirth!")
						if(M.rebirthedrelapse==2 && timesRebirthedRel==2)
							alert(M,"This is your second prestige rebirth!")	*/
						AutoSave()
						M.talkingtorb = 1
						switch(input(M,"Are you really really sure you want to rebirth, last chance!?","Rebirth", text) in list ("Yes","No"))
							if("No")
								AutoSave()
								M.talkingtorb = 1
								return
							if("Yes")
							/*	M.RebirthedRel=1
								if(M.timesRebirthedRel && M.rebirthedrelapse)
									M.timesRebirthedRel=2
									M.rebirthedrelapse=2
									M.RebirthedRel=0

								else	if(M.timesRebirthedRel==2 && M.rebirthedrelapse==2)
									M.timesRebirthedRel=3
									M.rebirthedrelapse=3
									M.level=50
									M.RebirthedRel=0	*/
							//	M.timesRebirthedRel=1
							//	M.rebirthedrelapse=1
							//	M.level=20

								M.race = ""
								M.level=50
								M.contents-=M.contents
								M.Rebirthed234 = 1
								M.shinip = 0
								M.earth=0
								M.hollow=0
								M.eventlvpused=0
								spawn()
									switch(input("Are you evil or good?","", text) in list ("Evil","Good"))
										if("Evil")
											M.hashoug=1
										//	M.contents+=new/obj/items/equipable/Hougyoku
											M.evilgood="Evil"
										if("Good")
											M.evilgood="Good"
								spawn()
									switch(input("What race do you wish to rebirth into?","Rebirth", text) in list ("Quincy","Shinigami","Sado", "Hollow","FullBringer"))
										if("Quincy")
											M.race="Quincy"
											world << "<b><font color = aqua>Race Info: [M] Has rebirthed into a Quincy!"
											M.contents+=new/obj/items/equipable/Overshirt/Quincy1
											M.contents+=new/obj/skillcard/Bow
											M.seelsword=1
											M.contents+=new/obj/items/equipable/Shirt/Black
											M.contents+=new/obj/items/equipable/Pants/Black
											M.contents+=new/obj/items/equipable/Shoes/Black
											M.earth=1
											M.Load_Overlays()
											M.Affirm_Icon()
										if("Shinigami")
											world << "<b><font color = white>Race Info: [M] Has rebirthed into a Shinigami!"
											M.race = "Shinigami"
											M.contents+= new/obj/items/equipable/Weapon/Sword
											M.contents+= new/obj/items/equipable/Overshirt/Shinigami1
											M.contents+= new/obj/items/equipable/Overshirt/Shinigami2
											M.shinip = 1
											M.contents+=new/obj/items/equipable/Pants/Black
											M.contents+=new/obj/items/equipable/Shoes/Black
											M.Load_Overlays()
											M.Affirm_Icon()
										if("Sado")
											M.race="Sado"
											world << "<b><font color = purple>Race Info: [M] Has rebirthed into a Sado!"
											M.contents+=new/obj/items/equipable/Shirt/Black
											M.contents+=new/obj/items/equipable/Shoes/Black
											M.contents+=new/obj/items/equipable/Pants/Black
											M.contents+=new/obj/skillcard/Return_Blast
											M.earth=1
											M.Load_Overlays()
											M.Affirm_Icon()
										if("FullBringer")
											M.race="Fullbringer"
											world << "<b><font color = green>Race Info: [M] Has rebirthed into a Fullbringer!"
											M.contents+=new/obj/items/equipable/Shirt/Black
											M.contents+=new/obj/items/equipable/Shoes/Black
											M.contents+=new/obj/items/equipable/Pants/Black
											M.earth=1
											M.Load_Overlays()
											M.Affirm_Icon()
										if("Hollow")
											M.race = "Hollow"
											M.overlays = 0
											world << "<b><font color = gray>Race Info: [M] Has rebirthed into a Hollow!"
											M.rank = "Weak Hollow"
											M.gotdevour = 1
											M.hollowtype = "Normal"
											M.hollow=1
											M.Load_Overlays()
											M.Affirm_Icon()





								M.overlays = 0
								M.choseboost=0
								M.combos+=1
								M.contents+=new/obj/skillcard/Sense
								M.contents+=new/obj/skillcard/Hide_Presence
								M.contents+=new/obj/skillcard/Flash_Step
								M.contents+=new/obj/skillcard/Flashing_Attack
								M.contents+=new/obj/skillcard/Spiritual_Pressure
								M.exp=0
								M.mexp=1
								if(M.gotdualzan)
									M.contents+=new/obj/items/equipable/DualZangetsu
							//	if(M.evilgood=="Evil" && M.hashoug)
							//		M.contents+=new/obj/items/equipable/Hougyoku
								if(M.blackflames)
									M.contents+=new/obj/skillcard/Amaterasu
								if(M.eyesofgod)
									M.contents+=new/obj/skillcard/Rinnegan
								if(M.donorarm)
									M.contents+=new/obj/skillcard/Sado_ArmDP
								if(M.gotsharingan)
									M.contents+=new/obj/skillcard/Sharingan
								if(M.donormask)
									M.contents+=new/obj/skillcard/Vasto_FormDP
									M.maskuses=1000
								M.contents+=new/obj/skillcard/Release_Color
							//	M.eventpoints += 25
							//	M.money += 50000
								M.shinipassive=0
								M.headpassive=0
								M.bodypassive=0
								M.armpassive=0
								M.legpassive=0
							//	M.rebirthedrelapse=1
								M.powerhit=0
								M.regenrate=100
								M.regenpassive=0
								M.bloodlust=0
								M.hierro=0
								M.instinct=0
								M.quickflash=0
								M.berserk=0
								M.senka=0
								M.combat1=0
								M.combat2=0
								M.combat3=0
								M.choseyet=0
								M.hasarrancarrelease=0
								M.alcoholic=10
								M.senkacounter=0
								M.woundregen=0
								M.rudecomment=0
								M.canvasto=0
								M.racist=0
								M.toughguy=0
								M.ruthless=0
								M.shikai=0
								M.full=0
								M.gotaccelfb=0
								M.espadas=""
								M.ichimoment=0
								M.whoareyou=0
								M.olympics=0
								M.cannibalism=0
								M.gotruth=0
								M.angel=0
								M.spyp=0
								M.respect=0
								M.face=0
								M.treason=0
								M.loyalty=0
								M.glare=0
								M.boneharden=0
								M.survival=0
								M.openstrike=0
								M.hibernation=0
								M.hypebeast=0
								M.backup=0
								M.armorpassive=0
								M.piercepassive=0
								M.matador=0
								M.gotfgt=0
								M.criticalhits=0
								M.invincibility=0
								M.secondchance=0
								M.reidrainage=0
								M.beatfgts=0
								M.gotsense=0
								M.beatashell=0
								M.stunpassive=0
								M.rei=M.mrei
								M.triedvai=0
								M.gotsanrei=0
								M.gotvai=0
								M.gotvai2=0
								M.gotvasto= 0
								M.espadasold=null
								M.squad=""
								M.squadid=null
								M.rank=""
								M.health=M.mhealth
								M.attack=M.mattack
								M.defence=M.mdefence
								M.reiatsu=M.mreiatsu
								M.stype= ""
								M.ressurectiontype= ""
								M.swordcall= ""
								M.swordname= ""
								M.ressurection=0
								M.status = ""
								M.ftype = 0
								M.swordon=0
								M.gotrev=0
								M.canbuyseele=0
								M.hasaseele=0
								M.kicks=0
								M.thits=0
								M.gothits=0
								M.gotring=0
								M.gotbringerb=0
								M.gotgame=0
								M.gotkick=0
								M.getsugaring=0
								M.bringerblast=0
								M.shielduses=0
								M.gottsubaki=0
								M.gotsheild=0
								M.gotress=0
								M.gotflash=0
								M.gotbum = 0
								M.gotwolf=0
								M.gotyoyo=0
								M.gotlacerate=0
								M.gotdesgarron=0
								M.gotafull=0
								M.gotdragon=0
								M.gotoutrage=0
								M.gotthrow=0
								M.gotspear=0
								M.learnedtogglehina=0
								M.gotshik = 0
								M.arelease=0
								M.chosebex=0
								M.beatkenpachi = 0
								M.gotHollowRage=0
								M.nextrespec=0
								M.gotkido=0
								M.chosespirit=0
								M.spiritweapon=0
								M.gotneg=0
								M.gotaizen=0
								M.needrespec=0
								M.gotfinalfb=0
								M.gotlimitrelease= 0
								M.lreleaseuses= 0
								M.shielduses=0
								M.gotsheild=0
								M.gottsubaki=0
								M.wasstrong=0
								M.wasmenos=0
								M.gotscreech=0
								M.wasadjucha=0
								M.wasvasto=0
								M.respectimes=0
								M.gotaarm=0
								M.bowtype = 0
								M.gotrelease1 = 0
								M.gotrelease2 = 0
								M.gotrelease3 = 0
								M.gotfinal = 0
								M.gotfinal2 = 0
								M.gotcero = 0
								M.gotcero2 = 0
								M.bala = 0
								M.kido1 = 0
								M.kido2 = 0
								M.kido3 = 0
								M.kido4 = 0
								M.kido5 = 0
								M.kido6 = 0
								M.silver1 = 0
								M.silver2 = 0
								M.silver3 = 0
								M.silver4 = 0
								M.silver5 = 0
								M.skillq=null
								M.skille=null
								M.skillo=null
								M.skillp=null
								M.skill0=null
								M.skill1=null
								M.skill2=null
								M.skill3=null
								M.skill4=null
								M.skill5=null
								M.skill6=null
								M.skill7=null
								M.skill8=null
								M.skill9=null
								M.skillequ=null
								M.skillsub=null
								M.skillpar=null
								M.skilly=null
							//	M.timesRebirthedRel=1

								M.RespecRelapse()
								M.Reset_Skillcards()



mob/proc
	RespecRelapse()
		var/flevel=src.level
	//	if(flevel>1500)flevel=1500
		src.levelpoints=0
		src.respectimes+=1
		src.mattack=100
		src.mdefence=100
		src.mreiatsu=100
		src.mrei=50
		src.rawbuff=0
		src.choseboost=0
		src.mhealth=10000
		src.mhealth+=flevel*400
		src.health=src.mhealth
		src.rawbuff+=(flevel*2)+100
		src.mattack+=flevel*2
		src.mdefence+=flevel*2
		src.mreiatsu+=flevel*2
		src.mrei+=flevel*15
		src.mrei+=src.truereiatsu
		if(src.stype=="Kido Class")
			src.levelpoints=flevel*16
		if(src.stype!="Kido Class")
			src.levelpoints=flevel*14
		src.combos=0
		if(src.level==50||src.level==100||src.level==200||src.level==400||src.level==1000)
			src.combos+=1
		if(!src.Rebirthed123)
			src.skillspassive=round(flevel/10,1)
		if(src.Rebirthed123)
			src.skillspassive=round(flevel/5,1)
		if(src.Rebirthed123)
			src.mrei +=flevel*3
			src.mhealth +=flevel*100
			src.mattack +=flevel*3
			src.mdefence +=flevel*3
			src.mreiatsu +=flevel*3
			src.attack +=flevel*3
			src.defence +=flevel*3
			src.reiatsu +=flevel*3
			src.rei +=flevel*5
			src.rawbuff+=flevel*1
			src.mrei += 5000
			src.mattack+=5000
			src.attack+=5000
			src.mdefence+=5000
			src.defence+=5000
			src.mreiatsu+=5000
			src.reiatsu+=5000
			src.rawbuff+=5000
		if(Rebirthed234)
			src.combos+=1
			src.mhealth += 2000
			src.mrei += 5000
			src.mattack+=5000
			src.attack+=5000
			src.mdefence+=5000
			src.defence+=5000
			src.mreiatsu+=5000
			src.reiatsu+=5000
			src.rawbuff+=5000




		if(src.level>=100)
			src.combos+=1
			src.mrei+=100
			src.mhealth+=100
		if(src.level>=200)
			src.combos+=1
			src.mrei+=200
			src.mhealth+=200
		if(src.level>=400)
			src.combos+=1
			src.mhealth+=200
			src.mrei+=200
		if(src.level>=800)
			src.combos+=1
		if(src.level>=1000)
			src.combos+=1
			src.mhealth+=1000
			src.mrei+=1000
		if(src.wasstrong)
			src.mhealth += 100
			src.mrei += 100
			src.mattack += 30
			src.mdefence += 30
			src.rawbuff+=30
			src.mreiatsu += 30
		if(src.wasmenos)
			src.mhealth += 100
			src.mrei += 100
			src.rawbuff+=200
			src.mattack += 200
			src.mdefence += 200
			src.mreiatsu += 200
		if(src.wasadjucha)
			src.mhealth += 500
			src.mrei += 100
			src.mattack += 600
			src.mdefence += 600
			src.mreiatsu += 600
			src.rawbuff+=600
		if(src.wasvasto)
			src.mattack+=1500
			src.mdefence+=1500
			src.reiatsu+=1500
			src.rawbuff+=1500
			src.mhealth += 25000
			src.mrei += 2000
		if(src.evilgood=="Good")
			src.mattack += 1000
			src.mdefence += 1000
			src.mreiatsu += 1000
			src.rawbuff+=1000
			src.mrei += 2000


		src.levelpoints +=eventlvpused*100
		src.shinipassive=0
		src.headpassive=0
		src.bodypassive=0
		src.armpassive=0
		src.legpassive=0
		src.powerhit=0
		src.regenrate=100
		src.regenpassive=0
		src.bloodlust=0
		src.hierro=0
		src.instinct=0
		src.quickflash=0
		src.berserk=0
		src.senka=0
		src.combat1=0
		src.combat2=0
		src.combat3=0
		src.gotaccelfb=0
		src.alcoholic=10
		src.senkacounter=0
		src.woundregen=0
		src.rudecomment=0
		src.racist=0
		src.toughguy=0
		src.ruthless=0
		src.ichimoment=0
		src.whoareyou=0
		src.olympics=0
		src.cannibalism=0
		src.angel=0
		src.spyp=0
		src.respect=0
		src.face=0
		src.treason=0
		src.loyalty=0
		src.glare=0
		src.boneharden=0
		src.survival=0
		src.openstrike=0
		src.hibernation=0
		src.hypebeast=0
		src.backup=0
		src.armorpassive=0
		src.piercepassive=0
		src.matador=0
		src.criticalhits=0
		src.invincibility=0
		src.secondchance=0
		src.reidrainage=0
		src.stunpassive=0
		src.guildpassive=0
		src.marksman=0
		src.rei=src.mrei
		src.health=src.mhealth
		src.attack=src.mattack
		src.defence=src.mdefence
		src.reiatsu=src.mreiatsu
		src.Level_Up()
		src.skill()
		src.donorDeboosted=1
		src.GiveDonorStats()
	//	if(src.key=="Zarama Nograd")
	//		src.mrei+=5000
	//		src.rei+=5000
		src<<"Your character has been respecced."
/*		if(src.justrebirthed)

			src.level=50
			src.levelpoints=0
			src.skillpoints=0
			src.skillspassive=0
			src.Respec()*/