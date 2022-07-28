
mob/proc
	Respec()
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
			src.levelpoints=flevel*15

		src.combos=0
		if(src.level==50||src.level==100||src.level==200||src.level==400||src.level==1000)
			src.combos+=1
		if(!src.Rebirthed)
			src.skillspassive=round(flevel/10,1)
		if(src.Rebirthed)
			src.skillspassive=round(flevel/5,1)
		if(src.Rebirthed)
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
			src.mrei += 4000
			src.mattack+=4000
			src.attack+=4000
			src.mdefence+=4000
			src.defence+=4000
			src.mreiatsu+=4000
			src.reiatsu+=4000
			src.rawbuff+=4000
		if(src.SecondRebirth)
			src.combos+=1
			src.mhealth += 2000
			src.mrei += 2000
			src.mattack+=2000
			src.attack+=2000
			src.mdefence+=2000
			src.defence+=2000
			src.mreiatsu+=2000
			src.reiatsu+=2000
			src.rawbuff+=2000
		if(src.SecondRebirth1k==1)
			src.mhealth += 2000
			src.mrei += 5000
			src.mattack+=5000
			src.attack+=5000
			src.mdefence+=5000
			src.defence+=5000
			src.mreiatsu+=5000
			src.reiatsu+=5000
			src.rawbuff+=5000
		if(src.Lvl1000Boost == 1)
			src.combos+=1
			src.mhealth += 2500
			src.mrei += 2500
			src.mattack+=2500
			src.attack+=2500
			src.mdefence+=2500
			src.defence+=2500
			src.mreiatsu+=2500
			src.reiatsu+=2500
			src.rawbuff+=2500
		if(src.Lvl1000BoostRB == 1)
			src.mhealth += 5000
			src.mrei += 3000
			src.mattack+=3000
			src.attack+=3000
			src.mdefence+=3000
			src.defence+=3000
			src.mreiatsu+=3000
			src.reiatsu+=3000
			src.rawbuff+=3000

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
			src.mreiatsu+=1500
			src.rawbuff+=1500
			src.mhealth += 25000
			src.mrei += 2000
		if(src.evilgood=="Good")
			src.mattack += 1000
			src.mdefence += 1000
			src.mreiatsu += 1000
			src.rawbuff+=1000
			src.mrei += 2000

		src.levelpoints+=src.boughtlevelpoints
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



