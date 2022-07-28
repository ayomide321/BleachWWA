mob/var
	SecondRebirth=0
	SecondRebirth1k=0
	timesRebirthed=0
	talkingtorb =0
mob/proc
	RebirthTwo(mob/M in world)
		if(M.level>949&&M.Rebirthed>0)
			switch(input("Are you sure you want to rebirth!?","Rebirth", text) in list ("Yes","No"))
				if("No")
					AutoSave()
					M.talkingtorb = 1
					return
				if("Yes")
					AutoSave()
					M.level=50
					M.talkingtorb = 1
					M.race = ""
					M.contents-=M.contents
					M.SecondRebirth=1
					M.shinip = 0
					M.earth=0
					M.hollow=0
					switch(input("What race do you wish to rebirth into?(your second time)","Rebirth", text) in list ("Quincy","Shinigami","Sado", "Hollow","FullBringer"))
						if("Quincy")
							M.race="Quincy"
							world << "<b><font color = aqua>Race Info: [M] Has rebirthed a second time into a Quincy!"
							M.contents+=new/obj/items/equipable/Overshirt/Quincy1
							M.contents+=new/obj/skillcard/Bow
							M.seelsword=1
							M.contents+=new/obj/items/equipable/Shirt/Black
							M.contents+=new/obj/items/equipable/Pants/Black
							M.contents+=new/obj/items/equipable/Shoes/Black
							M.RefreshSkillList()
							M.updateInventory()
							M.earth=1
							M.Load_Overlays()
							M.Affirm_Icon()
						if("Shinigami")
							world << "<b><font color = white>Race Info: [M] Has rebirthed a second time into a Shinigami!"
							M.race = "Shinigami"
							M.contents+= new/obj/items/equipable/Weapon/Sword
							M.contents+= new/obj/items/equipable/Overshirt/Shinigami1
							M.contents+= new/obj/items/equipable/Overshirt/Shinigami2
							M.shinip = 1
							M.contents+=new/obj/items/equipable/Pants/Black
							M.contents+=new/obj/items/equipable/Shoes/Black
							M.RefreshSkillList()
							M.updateInventory()
							M.Load_Overlays()
							M.Affirm_Icon()
						if("Sado")
							M.race="Sado"
							world << "<b><font color = purple>Race Info: [M] Has rebirthed a second time into a Sado!"
							M.contents+=new/obj/items/equipable/Shirt/Black
							M.contents+=new/obj/items/equipable/Shoes/Black
							M.contents+=new/obj/items/equipable/Pants/Black
							M.RefreshSkillList()
							M.updateInventory()
							M.contents+=new/obj/skillcard/Return_Blast
							M.earth=1
							M.Load_Overlays()
							M.Affirm_Icon()
						if("FullBringer")
							M.race="Fullbringer"
							world << "<b><font color = green>Race Info: [M] Has rebirthed a second time into a Fullbringer!"
							M.contents+=new/obj/items/equipable/Shirt/Black
							M.contents+=new/obj/items/equipable/Shoes/Black
							M.contents+=new/obj/items/equipable/Pants/Black
							M.RefreshSkillList()
							M.updateInventory()
							M.earth=1
							M.Load_Overlays()
							M.Affirm_Icon()
						if("Hollow")
							M.race = "Hollow"
							world << "<b><font color = gray>Race Info: [M] Has rebirthed a second time into a Hollow!"
							M.rank = "Weak Hollow"
							M.gotdevour = 1
							M.hollowtype = "Normal"
							M.hollow=1
							M.Load_Overlays()
							M.Affirm_Icon()
					spawn(-1)
						switch(input("Are you evil or good?","", text) in list ("Evil","Good"))
							if("Evil")
								M.hashoug=1
							//	M.contents+=new/obj/items/equipable/Hougyoku
								M.evilgood="Evil"
							if("Good")
								M.evilgood="Good"
					M.overlays = 0
					M.choseboost=0
			/*		M.level = 10
					M.mhealth=10000
					M.mhealth+=M.level*400
					M.health=M.mhealth
					M.mattack=100
					M.rawbuff=0
					M.rawbuff+=(M.level*2)+100
					M.mattack+=M.level*2
					M.mdefence=100
					M.mdefence+=M.level*2
					M.mreiatsu=100
					M.mreiatsu+=M.level*2
					M.mrei=50
					M.mrei+=M.level*15

					M.levelpoints=M.level*8
					M.skillpoints=0
					M.skillspassive=round(M.level/10,2)
					M.combos+=1
					M.mexp=((M.level*M.level*3)+1250)
					M.contents+=new/obj/skillcard/Sense
					M.contents+=new/obj/skillcard/Hide_Presence
					M.contents+=new/obj/skillcard/Flash_Step
					M.contents+=new/obj/skillcard/Flashing_Attack
					M.contents+=new/obj/skillcard/Spiritual_Pressure
*/
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
					if(M.gotdualzan==1)
						M.contents+=new/obj/items/equipable/DualZangetsu
					if(M.gotfiresword)
						M.contents+=new/obj/items/equipable/FireSword
					if(M.evilgood=="Evil")
						M.contents+=new/obj/items/equipable/Hougyoku
					if(M.blackflames==1)
						M.contents+=new/obj/skillcard/Amaterasu
					if(M.eyesofgod==1)
						M.contents+=new/obj/skillcard/Rinnegan
					if(M.donorarm==1)
						M.contents+=new/obj/skillcard/Sado_ArmDP
					if(M.gotsharingan)
						M.contents+=new/obj/skillcard/Sharingan
					if(M.donormask==1)
						M.contents+=new/obj/skillcard/Vasto_FormDP
						M.maskuses=1000
					if(M.gotflashboost)
						M.contents+=new/obj/items/equipable/Armor/Shunsui_Hat
					M.contents+=new/obj/skillcard/Release_Color

					for(rank in activeRankList)
						if(activeRankList[rank]==M.key)
							activeRankList[rank]=""
					for(rank in shiniCaptainList)
						if(shiniCaptainList[rank]==M.key)
							shiniCaptainList[rank]=""
				//	M.eventpoints = 0
				//	M.money += 20000
					M.shinipassive=0
					M.headpassive=0
					M.bodypassive=0
					M.armpassive=0
					M.legpassive=0
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
					M.gotaccelfb=0
					M.rudecomment=0
					M.racist=0
					M.canvasto=0
					M.toughguy=0
					M.ruthless=0
					M.shikai=0
					M.full=0
					M.espadas=null
					M.ichimoment=0
					M.whoareyou=0
					M.olympics=0
					M.cannibalism=0
					M.gotruth=0
					M.angel=0
					M.issternrleader = 0
					M.issternr = 0
					M.isspirit = 0
					M.humanleader = 0
					M.karakuraheroplayer = 0
					M.newhollowking = 0
					M.isEspadaLeader = 0
					M.newsadoking=0
					M.iscaptain=0
					M.iscaptaincommander=0
					M.newquincyking=0
					M.islieu=0
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
					M.Load_Overlays()
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
					M.statusold = ""
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
					M.gotskillssam=0
					M.gotskillssam1=0
					M.gotskillssam2=0
					M.learnedtogglehina=0
					M.gotshik = 0
					M.arelease=0
					M.chosebex=0
					M.beatkenpachi = 0
					M.gotHollowRage=0
					M.nextrespec=0
					M.gotkido=0
					M.chosespirit=0
				/*	M.gotha=0
					M.gotshar= 0
					M.gotatk=0
					M.gotrei=0
					M.gotdef=0
					M.gothyostun=0
					M.gotinre=0
					M.gotarrea=0
					M.gotmini=0	*/
					M.spiritweapon=0
					M.gotneg=0
					M.gotaizen=0
					M.boughtlevelpoints=0
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
					M.waitForRankTest=0
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
					M.skillw=null

					M.timesRebirthed++
					M.RefreshSkillList()
					M.updateInventory()


					M.skill()
					M.Respec()
					M.Level_Up()
					M.Reset_Skillcards()
		else
			M<<"<b>Return to me once you have rebirthed and are atleast level 950</b>"
			return

