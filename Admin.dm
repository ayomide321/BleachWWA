

#warn if I need to revert the skin back just change ofc the dmf, change ooc_output back to just output


mob/var
	got2k=0
	donorDeboosted=0
	vaifuse=0
	hasressfuse=0
	islieu=0
	tmp/justhere=0
mob/GM1/verb
	RemoveDonorStatss(mob/m)
		set category="Real GM"
		m.RemoveDonorStats()
	GiveDonorStatss(mob/m)
		set category="Real GM"
		m.GiveDonorStats()

mob/proc
	RemoveDonorStats() // temp
		if(!src.donorDeboosted)
			src.rawbuff-=src.donorstat*150
			src.mattack-=src.donorstat*150
			src.mdefence-=src.donorstat*150
			src.mreiatsu-=src.donorstat*150

			src.attack=src.mattack
			src.defence=src.mdefence
			src.reiatsu=src.mreiatsu

			src.donorDeboosted=1


			online_admins << "[usr] used Remove Donor Stats."
	GiveDonorStats()
		if(src.donorDeboosted)
			if(!src.raid&&!src.lost)
				src.rawbuff+=src.donorstat*150
				src.mattack+=src.donorstat*150
				src.mdefence+=src.donorstat*150
				src.mreiatsu+=src.donorstat*150

				src.attack=src.mattack
				src.defence=src.mdefence
				src.reiatsu=src.mreiatsu

				src.donorDeboosted=0
	SwordCallfix()
		var/sdgs = input(src,"Please select a name for your Zanpakuto.(less than 500 characters)") as text
		src.swordname=sdgs
		if(length(sdgs) >= 500)
			src.swordname="too long"
		var/sdgss = input(src,"Please select a call for your Zanpakuto.") as text
		src.swordcall=sdgss
		if(length(sdgss) >= 500)
			src.swordcall="too long"
mob
	proc
		Reset_Skillcards()
			src.skill1=null
			src.skill2=null
			src.skill3=null
			src.skill4=null
			src.skill5=null
			src.skill6=null
			src.skill7=null
			src.skill8=null
			src.skill9=null
			src.skill0=null
			src.skillsub=null
			src.skillequ=null
			src.skillq=null
			src.skille=null
			src.skillo=null
			src.skillp=null
			src.skillpar=null
			src.skilly=null
			src.skillw=null
			sleep(1 SECOND)
			src<<"<b> Please relog.</b>"

mob/var
	tmp
		gotstoryrw=0
mob
	var
		tele = 0
		karakuraheroplayer=0
		humanleader=0
		fulldanku=0
		gotginjogrc=0
		gothealingkido=0
		isspirit=0


var
	list/specialverbs = list("","Devilminions528","WSHGC","","")
	list/online_admins = list()

var
	list/hascustoms = list("Surgund","Haterkey2","Dblake1012","WorldStar","Natsu375","Yugiman67","Nate1shorty","Crazieoreo","KillManiac","Stonerman000420","666rogue666","Dragonpearl123","Sasuke13oo9","Blaxkshiba","The Shinigami Ryu","Maka90988",\
	"Dashikan","CoreBreaker","Ichigozangetsu199677","Pdieg0","soso lobi","Yoruziro","Frenzyyy","Huskywolf","Lan0345","Marcobad12","Bambino_jr","TheBlueReaper","Halo2master3","JJNH60c",\
	"Mexican joker","Dannyd100","246810daquarn","Kwilson2","Kwilson3","Dracola1636","Nakshart","Pizza1992","Adlofs","TheRealKaz","Nekrom","CommanderJohnShepard","Zapatron","Shishigawara",\
	"Reuden","Yip","Royshin","Rioshima","HanmaYujiro","Audain1","Zeandrejade","The Oracle Child","Coller74","Mike oxsbig",\
	"Seiiiigdog","Igpx185","Jaffizz","DredFTW","Royshin","Royshin","Royshin","Royshin","Royshin","Royshin","Royshin","Royshin","Royshin","Royshin","Royshin","Royshin","Royshin","Royshin")

mob
	Owner
var
	list
		captainNames=list("")
		bannednames=list("Ichigo","Hinamori","Kenpachi","Zaraki")
		bannedkeys=list("")
		bannedips=list("")//spammers who log in constantly to spam and ip changers
		pointnames=list("")
		changedevent=0



/*				var/list/Menu = list()
				Menu+="Cancel"
				if(src.guildname==G1name)
					Menu.Add(G1mems)
				if(src.guildname==G2name)
					Menu.Add(G2mems)
				if(src.guildname==G3name)
					Menu.Add(G3mems)
				if(src.guildname==G4name)
					Menu.Add(G4mems)
				if(src.guildname==G5name)
					Menu.Add(G5mems)*/
/*
blood thirsty, kamikaze, reiatsu bllast, flash smash, berserk,
kendo slash, slice, arm 1, bum rush, arm 2, firebolt, pure attack,
fire ring, fire bullet, secret skill, gran ray cero, cero, mugetsu, final bankai, soukatsui, tenran, hado 1
*/
mob/var
	tmp
		aoeCusto=0
		antiStunner=0
		antiStunnerCD=0
mob/CustomZan
	verb
		stunTakeOff()
			set category="Commands"
			if(usr.ko) return
			if(!usr.antiStunnerCD)
				usr.antiStunnerCD=1
				usr.antiStunner=1
				usr.canattack=1
				usr.canattacks=0
				usr.firing=0
				usr.safe=0
				usr<<"<b>You cannot be stunned for 10 seconds."
				spawn(10)
					usr.canattack=1
					usr.canattacks=0
					usr.firing=0
					usr.safe=0
				spawn(20)
					usr.canattack=1
					usr.canattacks=0
					usr.firing=0
					usr.safe=0
				spawn(30)
					usr.canattack=1
					usr.canattacks=0
					usr.firing=0
					usr.safe=0
				spawn(40)
					usr.canattack=1
					usr.canattacks=0
					usr.firing=0
					usr.safe=0
				spawn(50)
					usr.canattack=1
					usr.canattacks=0
					usr.firing=0
					usr.safe=0
				spawn(60)
					usr.canattack=1
					usr.canattacks=0
					usr.firing=0
					usr.safe=0
				spawn(70)
					usr.canattack=1
					usr.canattacks=0
					usr.firing=0
					usr.safe=0
				spawn(80)
					usr.canattack=1
					usr.canattacks=0
					usr.firing=0
					usr.safe=0
				spawn(90)
					usr.canattack=1
					usr.canattacks=0
					usr.firing=0
					usr.safe=0
				spawn(100)
					usr<<"<b>Your anti stun has worn off."
					usr.antiStunner=0
					usr.canattack=1
					usr.canattacks=0
					usr.firing=0
					usr.safe=0
				spawn(400) usr.antiStunnerCD=0
		aoeAttack()
			set category="Commands"
			if(usr.ko) return
			if(!usr.aoeCusto)
				usr.aoeCusto=1
				flick("Sword Slash1",usr)
				for(var/mob/J in oview(2))
					if(J.volcano)
						J.Volcano(src)
					if(!J.protected)Blood(J.x,J.y,J.z)
					var/damage = round(usr.attack+usr.defence+usr.reiatsu)*1.5
					damage+=rand(damage/2,damage/1.5)
					damage -= J.defence / 2
					J.DrainRei(usr,usr.mrei*0.05)
					usr.health+=round(usr.mhealth*0.01)
					usr.rei+=round(usr.mrei*0.01)
					usr.wound=max(0,usr.wound-1)
					if(damage <= 1)
						damage =rand(25,1000)
					if(prob(src.bodypassive*3))
						view(src,8) << "<font color = red>[src] hit [J] in the core!"
						J.BrokenCore()
					if(prob(src.armpassive*3))
						view(src,8) << "<font color = red>[src] hit [J] in the arm!"
						J.BrokenArm()
					if(prob(src.legpassive*3))
						view(src,8) << "<font color = red>[src] hit [J] in the leg!"
						J.BrokenLeg()
					if(prob(src.headpassive*3))
						view(src,8) << "<font color = red>[src] hit [J] in the head!"
						J.BrokenHead()
					if(prob(src.stunpassive*3))
						view(src,8) << "<font color = red>[src] stunned [J]!"
						J.Freeze(12)
					if(!J.protected)
						if(prob(10))
							J.aoeChancer=1
							J<<"<b>[usr.name] forces you down."
							spawn(15)
								if(J)
									J<<"<b>You can move again."
									J.aoeChancer=0
							//stun
					spawn()J.Death(src,damage,rand(0,1))
				spawn(10) usr.aoeCusto = 0




		Volcanica_Fuse()
			set category="Zans"
			usr.ressurectiontype="Volcanica"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/Ressurection
			usr.ressdrain=0
			usr.contents +=new/obj/skillcard/Heat_Wave
			usr.contents +=new/obj/skillcard/Secret_Skill
			usr.RefreshSkillList()
			usr.updateInventory()
		Yumichika_Fuse()
			set category="Zans"
			usr.stype="Yumichika"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/shikai
			usr.contents+=new/obj/skillcard/bankai
			usr.contents+=new/obj/skillcard/Ruri_iro_Kujaku
			usr.contents+=new/obj/skillcard/Cyclone_Slash
			usr.RefreshSkillList()
			usr.updateInventory()
		Kensei_Fuse()
			set category="Zans"
			usr.stype="Kensei"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/shikai
			usr.contents+=new/obj/skillcard/bankai
			usr.contents+=new/obj/skillcard/Air_Strike
			usr.contents+=new/obj/skillcard/Air_Bullet
			usr.contents+=new/obj/skillcard/Secret_Skill
			usr.RefreshSkillList()
			usr.updateInventory()

		Soul_King_Heir()
			usr.status="<font color=green>Soul King's Heir</font>"
			world<<"<b><font size=3><font color=purple>The Crown's heir has been chosen.</b></font></font>"
		CommanderQuincyFuse()// gives quincy skills+stark shoot twice
			usr.gotfinal2=1
			usr.contents|=new/obj/skillcard/RapidShot
			usr.contents|=new/obj/skillcard/VandenreichAura
			usr.contents|=new/obj/skillcard/CommanderBolt
			usr.contents|=new/obj/skillcard/CommanderStream
			usr.contents|=new/obj/skillcard/Fire_Commander_Stream
			usr.contents|=new/obj/skillcard/Gritz
			usr.contents|=new/obj/skillcard/Ransoutengai
			usr.RefreshSkillList()
			usr.updateInventory()
		Lightning_Fuse()
			set category="Zans"
			usr.stype="Lightning"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/shikai
			usr.contents+=new/obj/skillcard/bankai
			usr.contents+=new/obj/skillcard/Raiho_Bolt
			usr.contents+=new/obj/skillcard/Raiho_Burst
			usr.contents+=new/obj/skillcard/Raiho_Ignite
			usr.RefreshSkillList()
			usr.updateInventory()
		Byak_Fuse()
			set category="Zans"
			usr.stype="Byakuya"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/shikai
			usr.contents+=new/obj/skillcard/bankai
			usr.contents+=new/obj/skillcard/Pivotal_Scene
			usr.contents+=new/obj/skillcard/Petal_Sword
			usr.contents+=new/obj/skillcard/Hakuteiken
			usr.contents+=new/obj/skillcard/Secret_Skill
			usr.RefreshSkillList()
			usr.updateInventory()
		Gamer_Fuse()
			set category="Zans"
			usr.ftype="Yukio"
			usr.contents+=new/obj/skillcard/Fullbring
			usr.contents+=new/obj/skillcard/Advanced_Fullbring
			usr.contents+=new/obj/skillcard/Save_Freeze
			usr.contents+=new/obj/skillcard/Delete_Profile
			usr.contents+=new/obj/skillcard/Game_Trap
			usr.contents+=new/obj/skillcard/Create_Monsters
			usr.RefreshSkillList()
			usr.updateInventory()
		Give_JJNH60c_Tittle()
			set category="Zans"
			usr.status="<font color = #6A0000>Crimson Alchemist</font>"
		Yama_Fuse()
			set category="Zans"
			usr.stype="Yammamoto"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/shikai
			usr.contents+=new/obj/skillcard/bankai
			usr.shikaidrain=0
			usr.bankaidrain=0
			usr.contents+=new/obj/skillcard/Creamation
			usr.contents+=new/obj/skillcard/Shoen
			usr.contents+=new/obj/skillcard/Fortress_Blaze
			usr.contents+=new/obj/skillcard/Secret_Skill
			usr.RefreshSkillList()
			usr.updateInventory()
		Yip_Hidden_Boost()
			set category="Zans"
			usr.contents|=new/obj/skillcard/Yip_Boost
			usr.RefreshSkillList()
			usr.updateInventory()
		Special_Zangetsu() // dont give this to anyone except the person im giving it to lol
			set category="Zans"
			usr.contents|=new/obj/skillcard/Hollow_Zangetsu
			usr.RefreshSkillList()
			usr.updateInventory()
		Kaien_Fuse()
			set category="Zans"
			usr.stype="Kaiens"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/shikai
			usr.contents+=new/obj/skillcard/bankai
			usr.shikaidrain=0
			usr.bankaidrain=0
			usr.contents+=new/obj/skillcard/Wave
			usr.contents+=new/obj/skillcard/Secret_Skill
			usr.RefreshSkillList()
			usr.updateInventory()
		Fire_Doll_Fuse()
			set category="Zans"
			usr.ftype="Fire Doll"
			usr.contents+=new/obj/skillcard/Fullbring
			usr.contents+=new/obj/skillcard/Advanced_Fullbring
			usr.RefreshSkillList()
			usr.updateInventory()
		Rukia_Fuse()
			set category="Zans"
			usr.stype="Rukia"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/shikai
			usr.contents+=new/obj/skillcard/bankai
			usr.contents+=new/obj/skillcard/Ice_Freeze
			usr.contents+=new/obj/skillcard/Hakuren
			usr.contents+=new/obj/skillcard/Shirafune
			usr.RefreshSkillList()
			usr.updateInventory()
			usr.shikaidrain=0
			usr.bankaidrain=0
		Take_off_boosts()
			set category="Commands"
			if(usr.inshikai)
				usr.inshikai=0
			if(usr.inbankai)
				usr.inshikai=0
			if(usr.infull)
				usr.inshikai=0
			if(usr.inafull)
				usr.inshikai=0
			if(usr.ressurection)
				usr.ressurection=0
			if(usr.armon>0)
				usr.armon=0
			usr.reiatsu = 0
			usr.defence = 0
			usr.attack = 0
			usr.Load_Overlays()
		Dark_Rukia()
			set category="Zans"
			if(src.key=="Haterkey2")
				usr.ressurectiontype="Dark Bat"
				usr.contents|=new/obj/skillcard/Ressurection

			else if(src.key in specialverbs)
				usr.ressurectiontype="wshgcdark"
				usr.contents|=new/obj/skillcard/Ressurection
				usr.contents+=new/obj/skillcard/Explode
				usr.contents+=new/obj/skillcard/Fortress_Blaze
				usr.contents+=new/obj/skillcard/Release_Seal
				usr.contents+=new/obj/skillcard/Sakasama_no_Sekai
				usr.RefreshSkillList()
				usr.updateInventory()

			else if(src.key=="Dblake1012"||src.key=="Zarama Nograd"||src.key=="MasterMindP"||src.key=="Ninetailfox253"||src.key=="Marcobad12"||src.key=="Yugiman67")
				usr.ftype="Dark Bat"
				usr.contents+=new/obj/skillcard/Fullbring
				usr.contents+=new/obj/skillcard/Advanced_Fullbring
			else
				usr.stype="Dark Bat"
				usr.contents+=new/obj/skillcard/shikai
				usr.contents+=new/obj/skillcard/bankai
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.shikaidrain=0
			usr.bankaidrain=0
			usr.contents+=new/obj/skillcard/Ice_Freeze
			usr.contents+=new/obj/skillcard/Hakuren
			usr.contents+=new/obj/skillcard/Shirafune
			usr.contents+=new/obj/skillcard/Ice_Field
			usr.RefreshSkillList()
			usr.updateInventory()
			usr.contents+=new/obj/skillcard/Throw
		Vai_Mask_Mati()
			usr.contents+=new/obj/items/equipable/MatiVaiMask
		Vai_Mask_Original()
			usr.contents+=new/obj/items/equipable/ZerefVaiMask1
		Vai_Mask_Stripped()
			usr.contents+=new/obj/items/equipable/ZerefVaiMask2
		Vai_Mask_Vasto()
			usr.contents+=new/obj/items/equipable/ApolloVaiMask
		Tousen_Fuse()
			set category="Zans"
			usr.stype="Tousen"
			usr.contents+=new/obj/skillcard/Dark_Pit
			usr.contents+=new/obj/skillcard/Benihikou
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/shikai
			usr.contents+=new/obj/skillcard/bankai
			usr.RefreshSkillList()
			usr.updateInventory()
			usr.shikaidrain=0
			usr.bankaidrain=0
		Change_To_Rangiku()
			set category="Zans"
			usr.stype="Rangiku"
			usr.contents+=new/obj/skillcard/Explode
			usr.contents+=new/obj/skillcard/Fortress_Blaze
			usr.contents+=new/obj/skillcard/Release_Seal
			usr.contents+=new/obj/skillcard/Sakasama_no_Sekai
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/shikai
			usr.contents+=new/obj/skillcard/bankai
			usr.RefreshSkillList()
			usr.updateInventory()
			usr.shikaidrain=0
			usr.bankaidrain=0
		Halibel_Fuse()
			set category="Zans"
			usr.ressurectiontype="Halibel"
			usr.contents+=new/obj/skillcard/Ola_Azul
			usr.contents+=new/obj/skillcard/Cascada
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/Ressurection
			usr.RefreshSkillList()
			usr.updateInventory()
			usr.ressdrain=0
		Nell_BaraSig_Fuse()
			set category="Zans"
			usr.ressurectiontype="Nell"
			usr.contents+=new/obj/skillcard/Ola_Azul
			usr.contents+=new/obj/skillcard/Cascada
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/Aging_Barrier
			usr.contents+=new/obj/skillcard/Ressurection
			usr.RefreshSkillList()
			usr.updateInventory()
			usr.ressdrain=0
		Outrage_Reflect()
			set category="Commands"
			if(usr.outback==0)
				usr.outback=1
				usr << "<b>You have Activated Outrage Reflect Passive!"
			else
				outback=0
				usr << "<b>You have Deactivated Outrage Reflect Passive!"
		Szayel_Fuse()
			set category="Zans"
			usr.ressurectiontype="Scientist"
			usr.hasressfuse=1
			usr.contents+=new/obj/skillcard/Clone_Spit
			var/obj/skillcard/s=new/obj/skillcard/Secret_Skill
			s.names="Eat Clones"
			usr.contents+=s
			usr.contents+=new/obj/skillcard/Pills
			usr.contents+=new/obj/skillcard/Cero
			usr.contents+=new/obj/skillcard/Gran_Rey_Cero
			usr.contents+=new/obj/skillcard/Bala
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/Ressurection
			usr.RefreshSkillList()
			usr.updateInventory()
			usr.ressdrain=0
		Fuji_Custom()
			set category="Zans"
			usr.stype="Fujimaru"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/shikai
			usr.contents+=new/obj/skillcard/bankai
			usr.contents+=new/obj/skillcard/Copy
			usr.contents+=new/obj/skillcard/Invisibility
			//usr.contents+=new/obj/skillcard/Revoke
			usr.contents+=new/obj/skillcard/FireSlash
			usr.contents+=new/obj/skillcard/Kido_Corp_Heal
			usr.contents+=new/obj/skillcard/Rengoku
			usr.RefreshSkillList()
			usr.updateInventory()
		Jackie_Fuse()
			set category="Zans"
			usr.ftype="Jackie"
			usr.contents+=new/obj/skillcard/Critical_Burst
			usr.contents+=new/obj/skillcard/Critical_Stun
			usr.contents+=new/obj/skillcard/Critical_Hit
			usr.contents+=new/obj/skillcard/Rev_Up
			usr.contents+=new/obj/items/equipable/Weapon/Boots
			usr.RefreshSkillList()
			usr.updateInventory()
		Fuji_Fuse()
			set category="Zans"
			usr.stype="Fujimaru"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/shikai
			usr.contents+=new/obj/skillcard/bankai
			usr.contents+=new/obj/skillcard/Ryuten_Soshun
			usr.contents+=new/obj/skillcard/Rengoku
			usr.contents+=new/obj/skillcard/Rasen
			usr.RefreshSkillList()
			usr.updateInventory()

		Bacon_Crazy(mob/M in All_Clients())
			set category="Commands"
			for(var/i = 1 to 200)
				var/t=rand(1,10)
				if(M!=src)
					M<<"<b>[src] gave you bacon"
				M.Spins()
				if(t==1)
					M.Talks("That's some good ass bacon!")
				if(t==2)
					M.Talks("Tasty as f***")
				if(t==3)
					M.Talks("I'd kill a pig for this!")
				if(t==4)
					M.Talks("AAAUUGGHHH, YEEEAAAHHHH!!!")
				if(t==5)
					M.Talks("That . . . was amazing!")
				if(t==6)
					M.Talks("Who made this, it's pretty good!")
				if(t==7)
					M.Talks("Bacon gives you wings.")
				if(t==8)
					M.Talks("Bleach WWA+Bacon=Best Day")
				if(t==9)
					M.Talks("MORE,MORE, MMMOOORRREEE!!!")
				if(t==10)
					M.Talks("*Licks tastiness off fingers*")
		Bacon_Random(mob/M in All_Clients())
			set category="Commands"
			for(var/i = 1 to 200)
				var/t=rand(1,10)
				if(M!=src)
					M<<"<b>[src] gave you bacon"
				M.Spins()
				if(t==1)
					M.Talks("That's some good ass bacon!")
					Random_num()
				if(t==2)
					M.Talks("Tasty as f***")
					Random_num()
				if(t==3)
					M.Talks("I'd kill a pig for this!")
					Random_num()
				if(t==4)
					M.Talks("AAAUUGGHHH, YEEEAAAHHHH!!!")
					Random_num()
				if(t==5)
					M.Talks("That . . . was amazing!")
					Random_num()
				if(t==6)
					M.Talks("Who made this, it's pretty good!")
					Random_num()
				if(t==7)
					M.Talks("Bacon gives you wings.")
					Random_num()
				if(t==8)
					M.Talks("Bleach WWA+Bacon=Best Day")
					Random_num()
				if(t==9)
					M.Talks("MORE,MORE, MMMOOORRREEE!!!")
					Random_num()
				if(t==10)
					M.Talks("*Licks tastiness off fingers*")
					Random_num()
		Ichigo_Custom()
			set category="Zans"
			usr.stype="Ichigo"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/shikai
			usr.contents+=new/obj/skillcard/bankai
			usr.contents+=new/obj/skillcard/Getsuga_Enhanced_Blade
			usr.contents+=new/obj/skillcard/Acceleration
			usr.contents+=new/obj/skillcard/Getsuga_Tenshou
			usr.contents+=new/obj/skillcard/Ichigo_Slash
			usr.RefreshSkillList()
			usr.updateInventory()
		Ichigo_Zan()
			set category="Zans"
			usr.stype="Ichigo"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/shikai
			usr.contents+=new/obj/skillcard/bankai
			usr.contents+=new/obj/skillcard/Getsuga_Enhanced_Blade
			usr.contents+=new/obj/skillcard/Acceleration
			usr.contents+=new/obj/skillcard/Getsuga_Tenshou
			usr.contents+=new/obj/skillcard/Ichigo_Slash
			usr.RefreshSkillList()
			usr.updateInventory()
		Change_To_Vai()
			set category="Zans"
			usr.race="Vaizard"
			usr.gotvai=1
			usr.gotvai2=1
			usr.gotvasto=1
			usr.masktime=1000
			usr.maskuses=1000
			usr.contents+=new/obj/skillcard/Inner_Mode
			usr.contents+=new/obj/skillcard/Vaizard_Rage
			usr.contents+=new/obj/skillcard/Cero
			usr.contents+=new/obj/skillcard/Release_Color
			usr.contents+=new/obj/skillcard/Gran_Rey_Cero
			usr.contents+=new/obj/skillcard/Hollow_Screech
			usr.contents+=new/obj/skillcard/Ruthlessness
			usr.contents+=new/obj/skillcard/Vasto_Form
			usr.RefreshSkillList()
			usr.updateInventory()
		Vai_Fuse()
			set category="Zans"
		//	usr.masktime=1000
		//	usr.maskuses=1000
			usr.vaifuse=1
			usr.masktime+=750
			usr.maskuses+=750
			usr.contents+=new/obj/skillcard/Inner_Mode
			usr.contents+=new/obj/skillcard/Vaizard_Rage
			usr.contents+=new/obj/skillcard/Cero
			usr.contents+=new/obj/skillcard/Release_Color
			usr.contents+=new/obj/skillcard/Gran_Rey_Cero
			usr.contents+=new/obj/skillcard/Hollow_Screech
			usr.contents+=new/obj/skillcard/Ruthlessness
		//	if(src.key=="HanmaYujiro"||src.key =="Kwilson2" || src.key=="Kwilson3" ||src.key=="Awesome93"||src.key=="Beast17"||src.key=="CoreBreaker"||src.key=="JJNH60c"||src.key=="Pizza1992"||src.key=="Mike oxsbig"||src.key=="Dashikan")
			usr.contents+=new/obj/skillcard/Vasto_Form
			usr.RefreshSkillList()
			usr.updateInventory()
			if(src.key=="Audain1")
				usr.mask=1
		Gin_Fuse()
			set category="Zans"
			usr.stype="Ichimaru"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/shikai
			usr.contents+=new/obj/skillcard/bankai
			usr.contents+=new/obj/skillcard/Poison
			usr.contents+=new/obj/skillcard/Shishkabob
			usr.contents+=new/obj/skillcard/Stretch
			usr.RefreshSkillList()
			usr.updateInventory()
		RebirthMyself(mob/M)
			set category = "GM"
			text2file("[time2text(world.realtime)]: [src] rebirthed [M]<BR>","GMlog.html")
			if (src.key==M.key)
				Rebirther(M)
		Hitsu_Fuse()
			set category="Zans"
			usr.stype="Hitsugaya"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/Shoot_Dragon
			usr.contents+=new/obj/skillcard/Frozen_Heavens
			usr.contents+=new/obj/skillcard/Sennen_Hyoro
			usr.contents+=new/obj/skillcard/Ice_Field
			usr.contents+=new/obj/skillcard/Hakuren
			usr.RefreshSkillList()
			usr.updateInventory()
		Nell_Fuse()
			set category="Zans"
			usr.ressurectiontype="Nell"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/Ressurection
			usr.contents +=new/obj/skillcard/Spear
			usr.contents +=new/obj/skillcard/Cero_Doble
			usr.contents+=new/obj/skillcard/Utsusemi
			usr.RefreshSkillList()
			usr.updateInventory()
		Bar_Fuse()
			set category="Zans"
			usr.ressurectiontype="Skeleton"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/Ressurection
			usr.ressdrain=0
			usr.contents+=new/obj/skillcard/Universal_Aging
			//usr.contents+=new/obj/skillcard/Aging_Barrier
			usr.contents+=new/obj/skillcard/Secret_Skill
			usr.RefreshSkillList()
			usr.updateInventory()
		Grimm_Fuse()
			set category="Zans"
			usr.ressurectiontype="Pantera"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/Ressurection
			usr.ressdrain=0
			//grimm skills
			usr.contents+=new/obj/skillcard/Desgarron
			usr.contents+=new/obj/skillcard/Darts
			usr.contents+=new/obj/skillcard/Secret_Skill
			usr.RefreshSkillList()
			usr.updateInventory()
		Sado_Fuse()
			set category="Zans"
			usr.contents +=new/obj/skillcard/Arm3
			usr.contents +=new/obj/skillcard/Power_Blast
			usr.contents +=new/obj/skillcard/Diablo_Besar
			usr.contents +=new/obj/skillcard/El_Directo
			usr.contents +=new/obj/skillcard/Lamuerte
			usr.RefreshSkillList()
			usr.updateInventory()
		Change_To_Floating()
			set category="Zans"
			usr.stype="Sword Multiplier"
			for(var/obj/skillcard/s in usr.contents)
				if(s.iszan)
					usr.contents-=s
					usr.RefreshSkillList()
					usr.updateInventory()
			spawn(5)
				usr.contents+=new/obj/skillcard/shikai
				usr.contents+=new/obj/skillcard/bankai
				usr.contents+=new/obj/skillcard/Floating_Graveyard
				usr.contents+=new/obj/skillcard/Blade_Barrage
				usr.contents+=new/obj/items/equipable/Weapon/Sword
				usr.RefreshSkillList()
				usr.updateInventory()
		Change_To_FreezingPanther()
			set category="Zans"
			usr.ressurectiontype="Freezing Panther"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/Ressurection
			usr.contents+=new/obj/skillcard/Breath_Of_Lance
			usr.contents+=new/obj/skillcard/Freezing_Mary
			usr.contents+=new/obj/skillcard/Invisibility
			usr.contents+=new/obj/skillcard/Restep
			usr.RefreshSkillList()
			usr.updateInventory()
			usr.ressdrain=0
		Change_To_Ginjo()
			set category="Zans"
			usr.ftype="Ginjo"
			usr.contents+=new/obj/items/equipable/Weapon/Necklace
			usr.contents+=new/obj/skillcard/Fullbring
			usr.contents+=new/obj/skillcard/Advanced_Fullbring
			usr.contents+=new/obj/skillcard/Return_Blast
			usr.contents+=new/obj/skillcard/Bringer_Blast
			usr.RefreshSkillList()
			usr.updateInventory()
		Change_To_Tsuki()
			set category="Zans"
			usr.ftype="Tsukishima"
			usr.contents+=new/obj/items/equipable/Weapon/Bookmark
			usr.contents+=new/obj/skillcard/Fullbring
			usr.contents+=new/obj/skillcard/Harmful_Recoil
			usr.contents+=new/obj/skillcard/Advanced_Fullbring
			src.contents +=new/obj/skillcard/First_Hit
			src.contents +=new/obj/skillcard/Second_Hit
			src.contents +=new/obj/skillcard/Third_Hit
			src.contents +=new/obj/skillcard/Forth_Hit
			usr.RefreshSkillList()
			usr.updateInventory()
		Ichi_Fuse()
			set category="Zans"
			usr.ftype="Ichigo"
			usr.getsugaring=300
			usr.contents +=new/obj/skillcard/Fullbring
			usr.contents +=new/obj/skillcard/Advanced_Fullbring
			usr.contents+=new/obj/skillcard/Finalbring
			usr.contents+=new/obj/items/equipable/Weapon/Combat_Pass
			usr.contents+=new/obj/skillcard/Ring_Parade
			usr.contents +=new/obj/skillcard/Getsuga_Ring
			usr.contents+=new/obj/skillcard/Getsuga_Jab
			usr.RefreshSkillList()
			usr.updateInventory()
			//usr.contents+=new/obj/skillcard/Bankai_Extraction
			//usr.contents+=new/obj/skillcard/bankai
			//usr.contents+=new/obj/skillcard/Bankai_Skill
			//usr.contents+=new/obj/skillcard/Bow
			//usr.contents+=new/obj/skillcard/Blut_Veine
			//usr.contents+=new/obj/skillcard/Ransoutengai
		Respec_Myself(mob/M)
			set category = "GM"
			text2file("[time2text(world.realtime)]: [src] rebirthed [M]<BR>","GMlog.html")
			if (M.key == "CoreBreaker" )
				M.Respec()
		Ulq_Fuse()
			set category="Zans"
			//ulq ress
			usr.ressurectiontype="Ulq"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/Ressurection
			usr.ressdrain=0
			//ulq skills
			usr.contents+=new/obj/skillcard/Cero_Obscura
			usr.contents+=new/obj/skillcard/Throw
			usr.RefreshSkillList()
			usr.updateInventory()
		Luppi_Change()
			set category="Zans"
			usr.ressurectiontype="Luppi"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/Ressurection
			usr.RefreshSkillList()
			usr.updateInventory()
			usr.ressdrain=0
		Kenpachi()
			set category="Zans"
			usr.stype="Zaraki"
			usr.contents+=new/obj/skillcard/Slice
			usr.contents+=new/obj/skillcard/Kendo
			usr.contents+=new/obj/skillcard/Berserk
			usr.shikaidrain=0
			usr.bankaidrain=0
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/shikai
			usr.contents+=new/obj/skillcard/bankai
			usr.RefreshSkillList()
			usr.updateInventory()
		Change_To_Shusuke()
			set category="Zans"
			usr.stype="Shusuke"
			spawn(5)
				usr.contents+=new/obj/items/equipable/Weapon/Sword
				usr.contents+=new/obj/skillcard/shikai
				usr.contents+=new/obj/skillcard/bankai
				usr.contents+=new/obj/skillcard/Fire_Pillar
				usr.contents+=new/obj/skillcard/Fire_Barrier
				usr.contents +=new/obj/skillcard/Heat_Wave
				usr.contents +=new/obj/skillcard/Shoen
				usr.contents +=new/obj/skillcard/Heat_Blast
				usr.contents +=new/obj/skillcard/Fortress_Blaze
				usr.contents +=new/obj/skillcard/Creamation
				usr.contents+=new/obj/skillcard/Fire_Skurn
				usr.RefreshSkillList()
				usr.updateInventory()
				usr.shikaidrain=0
				usr.bankaidrain=0
			if(src.key=="Yugiman67")
				usr.contents+=new/obj/skillcard/Rengoku
		Change_To_Healer()
			set category="Zans"
			usr.ressurectiontype="Healer"
			for(var/obj/skillcard/s in usr.contents)
				if(s.iszan)
					usr.contents-=s
			spawn(5)
				usr.contents+=new/obj/skillcard/Ressurection
				usr.contents+=new/obj/skillcard/Ress_AoE_Heal
				usr.contents+=new/obj/skillcard/Pheonix_Ball
				usr.contents+=new/obj/skillcard/Ress_AoE_Knock
				usr.contents+=new/obj/skillcard/BlueFirePillar
				usr.contents+=new/obj/skillcard/Healer_Basic_Attack
				usr.RefreshSkillList()
				usr.updateInventory()
		Change_To_DarkZan()
			set category="Zans"
			usr.stype="Hyosuke"
			spawn(5)
				usr.contents+=new/obj/skillcard/Hyosuke_Stun
				usr.contents+=new/obj/skillcard/Death_Wave
				usr.contents+=new/obj/skillcard/Infinity_Ball
				usr.contents+=new/obj/skillcard/shikai
				usr.contents+=new/obj/skillcard/bankai
				usr.contents+=new/obj/items/equipable/Weapon/Sword
				usr.RefreshSkillList()
				usr.updateInventory()
		Change_To_Wings()
			set category="Zans"
			usr.ftype="Wings"
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.contents+=new/obj/skillcard/Fullbring
			usr.contents+=new/obj/skillcard/Advanced_Fullbring
			usr.contents+=new/obj/skillcard/Wingrar_Pluma
			usr.contents+=new/obj/skillcard/Segunda_Ress
			usr.contents+=new/obj/skillcard/Wing_Stun
			usr.contents+=new/obj/skillcard/Fireball_Graveyard
			usr.RefreshSkillList()
			usr.updateInventory()
		Change_To_Samurai()
			set category="Zans"
			usr.ftype="Samurai"
			spawn(5)
				usr.contents+=new/obj/skillcard/Samurai_Barrage
				usr.contents+=new/obj/skillcard/Samurai_Jab
				usr.contents+=new/obj/skillcard/Samurai_Freeze
				usr.contents+=new/obj/items/equipable/Weapon/Sword
				usr.contents+=new/obj/skillcard/Fullbring
				usr.contents+=new/obj/skillcard/Advanced_Fullbring
				usr.contents+=new/obj/skillcard/Power_Transfer
				usr.RefreshSkillList()
				usr.updateInventory()
		Change_To_Pheonix()
			set category="Zans"
			usr.stype="Pheonix"
			spawn(5)
				usr.contents+=new/obj/skillcard/Fire_Pillar
				usr.contents+=new/obj/skillcard/Fire_Barrier
				usr.contents+=new/obj/skillcard/Fire_Skurn
				if(usr.key=="Dragonpearl123")
					usr.contents+=new/obj/skillcard/shikai
					usr.contents+=new/obj/skillcard/bankai
					usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.RefreshSkillList()
			usr.updateInventory()
		Add_Aizen_Skills()
			set category="Zans"
			usr.stype="Aizen"
			spawn(5)
				usr.contents+=new/obj/skillcard/Illusionary_Death
				usr.contents+=new/obj/skillcard/Restep
				usr.contents+=new/obj/skillcard/Illusion
				usr.contents+=new/obj/skillcard/Copy
				usr.contents+=new/obj/skillcard/Invisibility
				usr.contents+=new/obj/skillcard/shikai
				usr.contents+=new/obj/skillcard/bankai
				usr.contents+=new/obj/items/equipable/Weapon/Sword
				usr.RefreshSkillList()
				usr.updateInventory()
				usr.shikaidrain=0
				usr.bankaidrain=0
		Change_To_Aguila()
			set category="Zans"
			usr.ressurectiontype="Aguila"
			for(var/obj/skillcard/s in usr.contents)
				if(s.iszan)
					usr.contents-=s
					usr.RefreshSkillList()
					usr.updateInventory()
			spawn(5)
				usr.contents+=new/obj/skillcard/Wind_Barrier
				usr.contents+=new/obj/skillcard/Aguila_Blow
				usr.contents+=new/obj/skillcard/Devrar_Pluma
				usr.RefreshSkillList()
				usr.updateInventory()
		Change_To_Jiroubou()
			set category="Zans"
			usr.stype="Jiroubou"
			//for(var/obj/skillcard/s in usr.contents)
				//if(s.iszan)
					//usr.contents-=s
			//spawn(5)
			usr.contents+=new/obj/skillcard/Shuriken_Toss
			usr.contents+=new/obj/skillcard/Homing_Shurikens
			usr.contents+=new/obj/skillcard/shikai
			usr.contents+=new/obj/skillcard/bankai
			usr.contents+=new/obj/items/equipable/Weapon/Sword
			usr.RefreshSkillList()
			usr.updateInventory()
			usr.shikaidrain=0
			usr.bankaidrain=0
		Level_to_1000(mob/M)
			set hidden = 1
			var/glevel=1000
			var/gdif
			if (M.key=="")
				gdif=glevel-M.level
				M.level=glevel
				if(M.Rebirthed == 1)
					M.mrei +=1
					M.mhealth +=100
					M.mattack +=1
					M.mdefence +=1
					M.mreiatsu +=1
					M.attack +=1
					M.defence +=1
					M.reiatsu +=1
					M.rei +=5
					M.rawbuff+=1
					M.mexp+=2000000000
				M.rawbuff+=gdif*2
				M.mattack+=gdif*2
				M.attack+=gdif*2
				M.mdefence+=gdif*2
				M.defence+=gdif*2
				M.mreiatsu+=gdif*2
				M.reiatsu+=gdif*2
				M.mrei+=gdif*15
				M.rei+=gdif*15
				M.health+=gdif*400
				M.mhealth+=gdif*400
				M.levelpoints+=gdif*8
				M.mexp+=400000000
		Level_to_1999(mob/M)
			set hidden = 1
			var/glevel=1999
			var/gdif
			if (M.key =="")
				gdif=glevel-M.level
				M.level=glevel
				if(M.Rebirthed == 1)
					M.mrei +=1
					M.mhealth +=100
					M.mattack +=1
					M.mdefence +=1
					M.mreiatsu +=1
					M.attack +=1
					M.defence +=1
					M.reiatsu +=1
					M.rei +=5
					M.rawbuff+=1
					M.mexp+=2000000000
				M.rawbuff+=gdif*2
				M.mattack+=gdif*2
				M.attack+=gdif*2
				M.mdefence+=gdif*2
				M.defence+=gdif*2
				M.mreiatsu+=gdif*2
				M.reiatsu+=gdif*2
				M.mrei+=gdif*15
				M.rei+=gdif*15
				M.health+=gdif*400
				M.mhealth+=gdif*400
				M.levelpoints+=gdif*8
				M.mexp+=20000000000
		//matsuricopy
		Change_To_Matsuri()
			set category="Zans"
			usr.stype="Matsuri"
			for(var/obj/skillcard/s in usr.contents)
				if(s.iszan)
					usr.contents-=s
			spawn(5)
				usr.contents+=new/obj/skillcard/Pink_Mugetsu
				usr.contents+=new/obj/skillcard/Rengoku
				usr.contents+=new/obj/skillcard/Kendo
				usr.contents+=new/obj/skillcard/Slice
		//		if( src.key == "Kageyama")
		//			usr.contents+=new/obj/skillcard/Aguila_Blow

				//usr.contents+=new/obj/skillcard/Koso_Renbu
		//end matsuricopy

mob/proc
	HealPlayer()
		src.health=src.mhealth
		src.rei=src.mrei
		src.wound=0

mob/var
	usinghinafi = 0
	issternrleader=0
	issternr=0
mob/Owner
	verb

		deletereu()
			set name = "Delete Clones"
			set category = "Owner"
			for(var/mob/m in world)
				if(m.reigai)
					del(m)


		Edit_Manual(var/O as obj|mob|turf in world)
			set category = "Owner"
			var/variable = input("Which variable do you want to alter?") as text
			var/retrieved
			var/typeof
			var/default
			for( var/v in O:vars)
				if( "[v]" == variable)
					typeof = O:vars[v]
					retrieved = v
					break
			if(! retrieved)
				usr << "Variable does not exist."; return()

			if(isnull(typeof))
				default = "Text"
			else if(isnum(typeof))
				default = "Num"
			else if(istext(typeof))
				default = "Text"
			else if(isloc(typeof))
				default = "Reference"
			else if(isicon(typeof))
				typeof = "\icon[typeof]"
				default = "Icon"
			else if(istype(typeof,/atom) || istype(typeof,/datum))
				default = "Type"
			else if(istype(typeof,/list))
				default = "List"
			else if(istype(typeof,/client))
				default = "Cancel"
			else
				default = "File"
			var/class = input("What kind of variable?","Variable Type",default) in list("Text","Num","Type","Reference","Icon","File","Restore to default","List","Null","Cancel")
			switch(class)
				if("Cancel")
					return
				if("Restore to default")
					O:vars[variable] = initial(O:vars[variable])
				if("Text")
					O:vars[variable] = input("Enter new text:","Text",O:vars[variable]) as text
				if("Num")
					O:vars[variable] = input("Enter new number:","Num",O:vars[variable]) as num
				if("Type")
					O:vars[variable] = input("Enter type:","Type",O:vars[variable]) in typesof(/obj,/mob,/area,/turf)
				if("Reference")
					O:vars[variable] = input("Select reference:","Reference",O:vars[variable]) as mob|obj|turf|area in world
				if("File")
					O:vars[variable] = input("Pick file:","File",O:vars[variable]) as file
				if("Icon")
					O:vars[variable] = input("Pick icon:","Icon",O:vars[variable]) as icon
				if("List")
					input("This is what's in [variable]") in O:vars[variable] + list("Close")
				if("Null")
					if(alert("Are you sure you want to clear this variable?","Null","Yes","No") == "Yes")
						O:vars[variable] = null




		InviteToStern(mob/M in All_Clients())
			set category="Owner"
			set name="Invite To Sternritter"
			if(usr.lock)
				return
			switch(input(usr,"Choose a letter") in list ("B","C","Cancel"))
				if("Cancel")
					return

				if("B")
					M.status="<font color=#1ac7c7>Sternritter B - The Balance</font>"
					M.statusold="<font color=#1ac7c7>Sternritter B - The Balance</font>"

			world << "<b><font color = red>World News: [M] is now a member of Sternritter"
			M.issternr=1

		InviteToStern2(mob/M in All_Clients())
			set category="Owner"
			set name="Make Sternritter Leader"
			if(usr.lock)
				return
			world << "<b><font color = red>World News: [M] is now the leader of Sternritter"
			M.issternrleader=1
			M.status="<font color=#1ac7c7>Sternritter A - The Almighty</font>"
			M.statusold="<font color=#1ac7c7>Sternritter A - The Almighty</font>"
			checkstern()
		//	M.verbs += typesof(/mob/Sternritter32/verb)




		Give_44Kills(mob/M in All_Clients())
			set category = "Owner"
			set name = "Give Race Wars Kills"
			M.newshikills+=100
			M.newfulkills+=100
			M.newholkills+=100
			M.newquikills+=100
			M.newsadkills+=100
			M.newvaikills+=100
			M.newvand+=100

		Give_45Kills(mob/M in All_Clients())
			set category = "Owner"
			set name = "Give Yama Boss Kills"
			M.crownprincekills+=100
			M.newkomabosskills+=100
			M.loreleikills+=100
			M.demonbosskills+=100
			M.gatecreatorkills+=100


		Give_Event_Points(mob/player/M)
			set category = "Owner"
			var/msg=input("How many event points do you want to give?","Event Points")as num
			M.eventpoints+=msg
			text2file("[time2text(world.realtime)]: [usr] has given [M] [msg]eventpoints<BR>","GMlog.html")
		Give_Money(mob/player/M)
			set category = "Owner"
			var/msg=input("How much money do you want to give?","money")as num
			M.money+=msg
			text2file("[time2text(world.realtime)]: [usr] has given [M] [msg]money<BR>","GMlog.html")

		changemahzan(mob/M in All_Clients())
			set name = "Zan Select"
			set category = "Owner"
			M.stype = input("Choose a zan",M.stype) in list("Ichigo","Zaraki","Ichimaru","Hisagi","Ikkaku","Kira",\
			"Kommamaru","Renji","Shonshui","Stinger","Tousen","Ichimaru","Hisagi","Ikkaku",\
			"Renji","Shonshui","Stinger","Tousen","Unohana","Aizen","Shinji","Lightning","Fujimaru","Yammamoto",\
			"Byakuya","Kaiens","Hinamori","Mayuri","Rukia","Hitsugaya","Urahara",\
			"Yumichika","Ukitake","Kensei","Rangiku","wshgccust")


		Edit(var/O as obj|mob|turf in world)
			set name = "Edit"
			set category = "Owner"
			var/list/f=list()
			f.Add(O:vars)
	//		f=dClean(f)//DO NOT remove.
			QuickSort(f)
			var/variable = input("Which var?","Var")as null|anything in f
			if(isnull(f))
				return
			if(!usr.key in specialverbs) return
			var/default
			var/typeof = O:vars[variable]
			if(isnull(typeof))
				default = "Text"
			else if(isnum(typeof))
				default = "Num"
			else if(istext(typeof))
				default = "Text"
			else if(isloc(typeof))
				default = "Reference"
			else if(isicon(typeof))
				typeof = "\icon[typeof]"
				default = "Icon"
			else if(istype(typeof,/atom) || istype(typeof,/datum))
				default = "Type"
			else if(istype(typeof,/list))
				default = "List"
			else if(istype(typeof,/client))
				default = "Cancel"
			else
				default = "File"
			var/class = input("What kind of variable?","Variable Type",default) in list("Text","Num","Type","Reference","Icon","File","Restore to default","List","Null","Cancel")
			switch(class)
				if("Cancel")
					return
				if("Restore to default")
					O:vars[variable] = initial(O:vars[variable])
					text2file("[time2text(world.realtime)]: [O] was restored to default by [usr]<BR>","GMlog.html")
				if("Text")
					var/oldtext=O:vars[variable]
					O:vars[variable] = input("Enter new text:","Text",O:vars[variable]) as text
					text2file("[time2text(world.realtime)]: [oldtext] was edited to [O:vars[variable]] [usr]<BR>","GMlog.html")
				if("Num")
					var/oldnum=O:vars[variable]
					O:vars[variable] = input("Enter new number:","Num",O:vars[variable]) as num
					text2file("[time2text(world.realtime)]: [oldnum] was edited to [O:vars[variable]] [usr]<BR>","GMlog.html")
				if("Type")
					O:vars[variable] = input("Enter type:","Type",O:vars[variable]) in typesof(/obj,/mob,/area,/turf)
				if("Reference")
					O:vars[variable] = input("Select reference:","Reference",O:vars[variable]) as mob|obj|turf|area in All_Clients()
				if("File")
					O:vars[variable] = input("Pick file:","File",O:vars[variable]) as file
				if("Icon")
					O:vars[variable] = input("Pick icon:","Icon",O:vars[variable]) as icon
				if("List")
					input("This is what's in [variable]") in O:vars[variable] + list("Close")
				if("Null")
					if(alert("Are you sure you want to clear this variable?","Null","Yes","No") == "Yes")
						O:vars[variable] = null
			text2file("[time2text(world.realtime)]: [usr] used Edit verb<BR>","GMlog.html")



		Wipe_Skillcards(mob/M in All_Clients())
			set category = "Owner"
			M.Reset_Skillcards()
			M.skill1=null
			M.skill2=null
			M.skill3=null
			M.skill4=null
			M.skill5=null
			M.skill6=null
			M.skill7=null
			M.skill8=null
			M.skill9=null
			M.skill0=null
			M.skillsub=null
			M.skillequ=null
			M.skillq=null
			M.skille=null
			M.skillo=null
			M.skillp=null
			M.skillpar=null
			M.skilly=null
			M.skillw=null
			sleep(0.5 SECONDS)
			M<<"<b> Please relog.</b>"

		SetStats(mob/M in All_Clients())
			set category = "Owner"
			M.mattack=input(usr,"What do you want the attack to be?") as num
			M.mdefence=input(usr,"What do you want the defence to be?") as num
			M.mrei=input(usr,"What do you want the rei to be?") as num
			M.mreiatsu=input(usr,"What do you want the reiatsu to be?") as num
		Heal(mob/M in All_Clients())
			set category = "Owner"
			M.HealPlayer()



		Maptag_Tele()
			set category = "Owner"
			switch(input(src,"Where do you wanna go?") in list ("Bossrooms","Bar","Earth","Aizen Building","Shini Acad",\
			"Arena","EP Store","SS Charge","Aizen Room","Vai Scout","Hollow Forest","SK Alone","Hell Entrance","Dungeon"))

				if("Bossrooms")src.loc = locate_tag("bossroomtag")
				if("Bar")src.loc = locate_tag("bartag")
				if("Earth")src.loc = locate_tag("earthtag")
				if("Aizen Building")src.loc = locate_tag("aizenbuilding")
				if("Shini Acad")src.loc = locate_tag("shiniacad")
				if("Arena")src.loc = locate_tag("arenatag")
				if("EP Store")src.loc = locate_tag("epstore")
				if("SS Charge")src.loc = locate_tag("sscharge")
				if("Aizen Room")src.loc = locate_tag("aizenroom")
				if("Vai Scout")src.loc = locate_tag("vaiscout")
				if("Hollow Forest")src.loc = locate_tag("hollowforest")
				if("SK Alone")src.loc = locate_tag("skalone")
				if("Hell Entrance")src.loc = locate_tag("hellent")
				if("Dungeon")src.loc = locate_tag("dungeonhouse")


		LevelHim(mob/M in All_Clients())
			set category = "Owner"
			var/glevel=0
			var/gdif
			glevel = input("What level should they be.",
                    "Level",
                    glevel)
			gdif=glevel-M.level
			M.level=glevel
			if(M.Rebirthed == 1)
				M.mrei +=1
				M.mhealth +=100
				M.mattack +=1
				M.mdefence +=1
				M.mreiatsu +=1
				M.attack +=1
				M.defence +=1
				M.reiatsu +=1
				M.rei +=5
				M.rawbuff+=1
			M.rawbuff+=gdif*2
			M.mattack+=gdif*2
			M.attack+=gdif*2
			M.mdefence+=gdif*2
			M.defence+=gdif*2
			M.mreiatsu+=gdif*2
			M.reiatsu+=gdif*2
			M.mrei+=gdif*15
			M.rei+=gdif*15
			M.health+=gdif*400
			M.mhealth+=gdif*400
			M.levelpoints+=gdif*8
			if(M.Rebirthed == 1)
				M.skillspassive+=round(gdif/5,1)
				usr <<"He leveled and was a rebirthed character"
			else
				M.skillspassive+=round(gdif/10,1)
				usr<<"He leveled"
			text2file("[time2text(world.realtime)]: [M] was leveled by [usr] to level [glevel]<BR>","GMlog.html")
		Create()
			set name = "Create"
			set category = "Owner"
			usr.client<<link("?command=create;")//  Invokes the Create HTML option
			text2file("[time2text(world.realtime)]: [usr] has used create<BR>","GMlog.html")


		GiveDP(mob/player/M)
			set category = "Owner"
			if(usr.key in specialverbs)
				var/msg=input("How many donor points do you wish to give?","Donor Points")as num
				M.GainDP(msg)
				text2file("[time2text(world.realtime)]: [src] gave [M] donor points: [msg]<BR>","DPGivenLog.html")
			else
				return

		Spectate(mob/player/x in All_Clients())
			set category = "Owner"
			usr.spectate=1
			usr.client.eye=x
			client.perspective=EYE_PERSPECTIVE
			return
			if(src.spectate)
				client.eye=client.mob
				spectate=0

		Make_GM(mob/M in All_Clients())
			set category = "Owner"
			//if(usr.key!="RedRamii")
			//	if(usr.lock)
			//		return
			var/ii=input(usr,"What GM level do you wish to give them?", text)as null|anything in list ("1","2","3","4","5","6")
			switch(ii)
				if("1")
					M.verbs += typesof(/mob/GM1/verb)
					M.GM = 1
				if("2")
					M.verbs += typesof(/mob/GM1/verb)
					M.verbs += typesof(/mob/GM2/verb)
					M.GM = 2
					winset(M, "button4", "is-visible=true")
				if("3")
					M.verbs += typesof(/mob/GM1/verb)
					M.verbs += typesof(/mob/GM2/verb)
					M.verbs += typesof(/mob/GM3/verb)
					M.GM = 3
					winset(M, "button4", "is-visible=true")
				if("4")
					M.verbs += typesof(/mob/GM1/verb)
					M.verbs += typesof(/mob/GM2/verb)
					M.verbs += typesof(/mob/GM3/verb)
					M.verbs += typesof(/mob/GM4/verb)
					M.GM = 4
					winset(M, "button4", "is-visible=true")
				if("5")
					M.verbs += typesof(/mob/GM1/verb)
					M.verbs += typesof(/mob/GM2/verb)
					M.verbs += typesof(/mob/GM3/verb)
					M.verbs += typesof(/mob/GM4/verb)
					M.verbs += typesof(/mob/GM5/verb)
					M.GM = 5
					winset(M, "button4", "is-visible=true")
				if("6")
					M.verbs += typesof(/mob/GM1/verb)
					M.verbs += typesof(/mob/GM2/verb)
					M.verbs += typesof(/mob/GM3/verb)
					M.verbs += typesof(/mob/GM4/verb)
					M.verbs += typesof(/mob/GM5/verb)
					M.verbs += typesof(/mob/GM6/verb)
					M.GM = 6
					winset(M, "button4", "is-visible=true")
			if(!isnull(ii))
				M << "<b>[M] has been given Level [M.GM] GM powers by [usr]!"
				usr << "<b>[M] has been given Level [M.GM] GM powers by [usr]!"
				text2file("[time2text(world.realtime)]: [src] made [M] GM [ii]<BR>","GMlog.html")

		Remove_GM(mob/M in All_Clients())
			set category = "Owner"
			if(usr.lock)
				return
		//	if(M.GM <= 5)
			//	world << "<b><font color = red>Abuse Info: Level [usr.GM] GM [usr] has tried to remove Level [M.GM] GM [M]'s GM Power!"
		//		return
			if(!src.key in specialverbs)
				return
			world << "<b>[M] has his GM Powers taken away by [usr]!"
			M.verbs -= typesof(/mob/GM1/verb)
			M.verbs -= typesof(/mob/GM2/verb)
			M.verbs -= typesof(/mob/GM3/verb)
			M.verbs -= typesof(/mob/GM4/verb)
			M.verbs -= typesof(/mob/GM4/verb)
			M.verbs -= typesof(/mob/GM5/verb)
			M.verbs -= typesof(/mob/GM6/verb)
			M.GM = 0
			text2file("[time2text(world.realtime)]: [src] removed [M] as GM<BR>","GMlog.html")


		Variable_Edit(var/O as obj|mob|turf in All_Clients())
			set category = "Owner"
			var/variable = input("Which variable do you want to alter?") as text
			var/retrieved
			var/typeof
			var/default
			for( var/v in O:vars)
				if( "[v]" == variable)
					typeof = O:vars[v]
					retrieved = v
					break
			if(! retrieved)
				usr << "Variable does not exist."; return()

			if(isnull(typeof))
				default = "Text"
			else if(isnum(typeof))
				default = "Num"
			else if(istext(typeof))
				default = "Text"
			else if(isloc(typeof))
				default = "Reference"
			else if(isicon(typeof))
				typeof = "\icon[typeof]"
				default = "Icon"
			else if(istype(typeof,/atom) || istype(typeof,/datum))
				default = "Type"
			else if(istype(typeof,/list))
				default = "List"
			else if(istype(typeof,/client))
				default = "Cancel"
			else
				default = "File"
			var/class = input("What kind of variable?","Variable Type",default) in list("Text","Num","Type","Reference","Icon","File","Restore to default","List","Null","Cancel")
			switch(class)
				if("Cancel")
					return
				if("Restore to default")
					O:vars[variable] = initial(O:vars[variable])
				if("Text")
					O:vars[variable] = input("Enter new text:","Text",O:vars[variable]) as text
				if("Num")
					O:vars[variable] = input("Enter new number:","Num",O:vars[variable]) as num
				if("Type")
					O:vars[variable] = input("Enter type:","Type",O:vars[variable]) in typesof(/obj,/mob,/area,/turf)
				if("Reference")
					O:vars[variable] = input("Select reference:","Reference",O:vars[variable]) as mob|obj|turf|area in world
				if("File")
					O:vars[variable] = input("Pick file:","File",O:vars[variable]) as file
				if("Icon")
					O:vars[variable] = input("Pick icon:","Icon",O:vars[variable]) as icon
				if("List")
					input("This is what's in [variable]") in O:vars[variable] + list("Close")
				if("Null")
					if(alert("Are you sure you want to clear this variable?","Null","Yes","No") == "Yes")
						O:vars[variable] = null


/*		clear()
			set hidden=1
			set name = ".clear"
			if(src.key=="Zagros5000")
				src.clearfields()
			else
				return
		clearv()
			set hidden=1
			set name = ".clearv"
			if(src.key=="Zagros5000")
				src.clearviewr()
			else
				return
		deletereport()
			set hidden=1
			set name = ".delete"
			if(usr.key=="Zagros5000")
				var/m=winget(src,"reportview.viewing","text")
				if(m in reports)
					if(alert("Are you sure you want to Delete this report?","Delete this report","Yes","No")=="Yes")
						winset(src, "loadv", "text=\"Deleting [m]...\"")
						var/Reports/M = reports[m]
						reports -= m
						del M
						src << browse(null,"window=reportbrowser")
						winset(src, "reportview.viewing", "text=\"Report you were viewing has been deleted!\"")
						winset(src, "loadv", "text=\"Deleted [m]!\"")
		deleteall()
			set hidden=1
			set name = ".deleteall"
			if(usr.key=="Zagros5000")
				if(alert("Are you sure you want to Delete every report?","Delete All Reports","Yes","No")=="Yes")
					winset(src, "loadv", "text=\"Deleting all reports...\"")
					for(var/x in reports)
						reports -= x
						global.number = 0
					src << browse(null,"window=reportbrowser")
					winset(src, "reportview.viewing", "text=\"Report you were viewing has been deleted!\"")
					winset(src, "loadv", "text=\"Deleted all reports!\"")
			else
				return
		View()
			set hidden=1
			set name = ".view"
			var/br={"<html><body>"}
			var/dr={"</body></html>"}
			if(!reports.len)
				br+="Sorry! There are no reports!"
			else
				var/X=input("Which report would you like to Review?","Report Viewing") as null|anything in reports
				if(!X) return
				var/Reports/M = reports[X]
				for(var/x in M.vars -vars)
					br += "<br>[x] = [M.vars[x]]"
				winset(src, "reportview.viewing", "text=\"[M.NameID]\"")
			br+=dr
			src << browse(br,"window=reportbrowser")
			winset(src, "loadv", "text=")
		/*Delete_Reports(X in reports+"All")
			if(X=="All")
				for(var/x in reports)
					reports -= x
					global.number = 0
			else
				reports -= X */
		View_Reports()
			set category="Real GM"
			winshow(src,"reportview",1)*/
		Wipe_Guilds()
			set category = "Real GM"
			switch(input(src,"Which Guild do you want to wipe)", text) in list ("G1","G2","G3","G4","G5","NeverMind"))
				if("G1")
					for(var/mob/m in All_Clients())
						if(m.guildname==G1name)
							G1mems-=m
							m.guildleader=0
							m.guildname=""
							m.inguild=0
							m.leaveguild()
							m.canrecruitguild=0
					world << "<b><font size=4><font color = aqua>[G1name] has been disbanded!"
					G1name=""
					G1ally=list("None")
					G1neut=list("None")
					G1mems.Cut()
					AllySave()
				if("G2")
					for(var/mob/m in All_Clients())
						if(m.guildname==G2name)
							G2mems-=m
							m.guildleader=0
							m.guildname=""
							m.inguild=0
							m.canrecruitguild=0
							m.leaveguild()
					world << "<b><font size=4><font color = aqua>[G2name] has been disbanded!"
					G2name=""
					G2ally=list("None")
					G2neut=list("None")
		//			var/list/Menu = list()
		//			Menu.Add(G2mems)
		//			Menu+="Cancel"
					G2mems.Cut()
			//		for(length(Menu))
			//			G2mems-=Menu
					AllySave()
				if("G3")
					for(var/mob/m in All_Clients())
						if(m.guildname==G3name)
							G3mems-=m
							m.guildleader=0
							m.guildname=""
							m.inguild=0
							m.canrecruitguild=0
							m.leaveguild()
					world << "<b><font size=4><font color = aqua>[G3name] has been disbanded!"
					G3name=""
					G3ally=list("None")
					G3neut=list("None")
					G3mems.Cut()
					AllySave()
				if("G4")
					for(var/mob/m in All_Clients())
						if(m.guildname==G4name)
							G4mems-=m
							m.guildleader=0
							m.guildname=""
							m.inguild=0
							m.canrecruitguild=0
							m.leaveguild()
					world << "<b><font size=4><font color = aqua>[G4name] has been disbanded!"
					G4name=""
					G4ally=list("None")
					G4neut=list("None")
					G4mems.Cut()
					AllySave()
				if("G5")
					for(var/mob/m in All_Clients())
						if(m.guildname==G5name)
							G5mems-=m
							m.guildleader=0
							m.guildname=""
							m.inguild=0
							m.canrecruitguild=0
							m.leaveguild()
					world << "<b><font size=4><font color = aqua>[G5name] has been disbanded!"
					G5name=""
					G5ally=list("None")
					G5neut=list("None")
					G5mems.Cut()
					AllySave()
				if("NeverMind")
					return

		Power(mob/player/M)
			set category = "Owner"
			M.shinipassive=5
			M.headpassive=5
			M.bodypassive=5
			M.armpassive=5
			M.legpassive=5
			M.regenrate=70
			M.regenpassive=5
			M.bloodlust=1
			M.hierro=5
			M.instinct=5
			M.quickflash=5
			M.berserk=5
			M.senka=5
			M.alcoholic=0
			M.senkacounter=1
			M.woundregen=5
			M.racist=1
			M.toughguy=1
			M.ruthless=1
			M.ichimoment=1
			M.whoareyou=1
			M.olympics=10
			M.angel=5
			M.spyp=10
			M.respect=1
			M.face=1
			M.glare=5
			M.boneharden=10
			M.survival=1
			M.openstrike=5
			M.hibernation=5
			M.hypebeast=10
			M.backup=10
			M.armorpassive=5
			M.piercepassive=5
			M.matador=5
			M.criticalhits=5
			M.invincibility=5
			M.secondchance=5
			M.reidrainage=5
			M.stunpassive=5
			M.evilgood="Evil"
			M.contents+=new/obj/items/equipable/Hougyoku
			M.contents+=new/obj/skillcard/Sharingan
			text2file("[time2text(world.realtime)]: [src] powered [M]<BR>","GMlog.html")


mob/GM6
 verb
		Rains_Mute(mob/M in All_Clients())
			set category = "GM"
			if(usr.lock)
				return
			switch(alert("Are you sure you want to mute [M]?","Mute [M]","Yes","No"))
				if("Yes")
					var/Reason=input("What do you want [M] to say?.")as null|text
					var/Time=input({"How many mins do you want to mute him for?)"})as num
					if(Time>=1)
						Time*=600
					if(Time<=0)
						return
					if(Reason)
						if(Time)
							M.OOC("[Reason]. I am muted for [Time/600] mins")
						else
							M.OOC("because I [Reason]")
					else
						if(Time)
							M.OOC("blocking ooc for [Time/600] mins")
						else
							M.OOC("brb")
					M.muted=Time
					world << "<b><font color = grey> Chat Enforcer [usr] has muted [M]!"
					return			text2file("[time2text(world.realtime)]: [M] was muted by [usr] for [Time/600] mins because of [Reason]<BR>","GMlog.html")
				if("No")
					return
			return
		Important_Announce(txt as text)
			set name = "Important Announce"
			set category = "GM"
			if(announce==1)
				usr<<"You cant use announce right now!"
			else
				world << output("<font size=4><font color = yellow><font face=times new roman><b><center>[usr] has an urgent announcement:<center><br>[txt]","output")
mob/GM6
	verb

		DonorQuery()
			var/ct=0
			set name="Who has DP?"
			set category="Real GM"
			for(var/mob/m in All_Clients())
				if(!isnull(m.client))
					if(m.donor_points>0)
						src<<"<b>Info:</b>[m.key]-[m.donor_points]\n"
						ct++
			if(ct==0)
				src<<"No Results: No donors online atm."

		ViewDonorStuff()
			set name="View Player Donor Statistics"
			set category="Real GM"
			var/list/f=list()
			for(var/mob/m in All_Clients())
				if(m.client)
					f+=m
			var/mob/g=input(usr,"Which player's donor perks do you want to view?")in f
			if(!isnull(g))
				usr<<{"2x [g.donor2levels]\n4x[g.donor4levels]\n1/2 exp[g.donorhalfexp]\nFree Zans[g.donorfreezans]\n
				Free Ress[g.donorfreeress]\nFree Fullbring[g.donorfreefb]\nDonor Points[g.donor_points]\nMasked[g.donormask]\nSado Arm[g.donorarm]\nDonor Stat Ups[g.donorstat]\n
				Donor Points Spent[g.total_spent]\n
				Donor Points Bought[g.total_bought]\n
				Exp Gains Active[g.active_exp]\n
				Fortune Gains Active[g.active_fortune]"}
		RebirthSomeone(mob/M in All_Clients())
			set category = "Owner"
			Rebirther(M)
			text2file("[time2text(world.realtime)]: [src] rebirthed [M]<BR>","GMlog.html")
		RebirthAgain(mob/M in All_Clients())
			set category = "Owner"
			RebirthTwo(M)
			text2file("[time2text(world.realtime)]: [src] rebirthed [M]<BR>","GMlog.html")
		//	world<<"<b>font color = aqua>[M] has been reborn!"
		Exp_Gain()
			set category="Owner"
			var/gexp=0
			gexp=input("What do you want to change the exp multiplier to?","Exp Gain",gexp)
			if(gexp>20)
				gexp=20
			for(var/mob/M in All_Clients())
				M.expgain=M.origexp
				M.expgain=M.expgain*gexp
			world << "<b><font color = aqua>Exp Info: [src] has changed the world player exp multiplier to [gexp]!"
/*		Race_Change(mob/M in All_Clients())
			set category = "Real GM"
			var/rac=null
			input("Which race do you want to be?",rac)
			if(rac=="Quincy")
				M.race="Quincy"
				world << "<b><font color = aqua>Race Info: [M] is now a Quincy!"
				M.contents+=new/obj/items/equipable/Overshirt/Quincy1
				M.contents+=new/obj/skillcard/Bow
				M.contents+=new/obj/items/equipable/Shirt/Black
				M.contents+=new/obj/items/equipable/Pants/Black
				M.contents+=new/obj/items/equipable/Shoes/Black
				M.Load_Overlays()
				M.Affirm_Icon()
			if(rac=="Shinigami")
				world << "<b><font color = aqua>Race Info: [M] is now a Shinigami!"
				M.race = "Shinigami"
				var/obj/B = new/obj/items/equipable/Weapon/Sword
				B.loc = M
				var/obj/C = new/obj/items/equipable/Overshirt/Shinigami1
				C.loc = M
				var/obj/Ca = new/obj/items/equipable/Overshirt/Shinigami2
				Ca.loc= M
				M.contents+=new/obj/items/equipable/Pants/Black
				M.contents+=new/obj/items/equipable/Shoes/Black
				M.Load_Overlays()
				M.Affirm_Icon()
			if(rac=="Sado")
				world << "<b><font color = aqua>Race Info: [M] is now a Sado!"
				M.contents+=new/obj/items/equipable/Shirt/Black
				M.contents+=new/obj/items/equipable/Shoes/Black
				M.contents+=new/obj/items/equipable/Pants/Black
				M.Load_Overlays()
				M.Affirm_Icon()
			if(rac=="Hollow")
				M.race = "Hollow"
				M.overlays = 0
				world << "<b><font color = aqua>Race Info: [M] is now a Hollow!"
				M.rank = "Weak Hollow"
				M.gotdevour = 1
				M.hollowtype = "Normal"
				M.Load_Overlays()
				M.Affirm_Icon()*/





		EditStatus(mob/player/M in All_Clients(), input as text)
			set name = "Change Status"
			set category = "Real GM"
			M.status= input
			M.statusold= input

		Change_Event()
			set name = "Change Event"
			set category = "Real GM"
			lastevent=pick(0,1,2,3,4,5,6,8,9)
			src<<"You changed event to [lastevent]"
			changedevent=1





mob/GM5
	verb
		/*Debug()
			set category = "Debug"

			// Add our special Game object to debugger object for easy access to full game data.
			// This is optional and can be skipped if you don't need it.
			dd_debugger.extraControlPanelObjects = list(Game)

			// Show them the debugger.
			dd_debugger.ControlPanel()*/


		Reboot()
			set name = "Reboot"
			set category = "Real GM"
			if(usr.lock)
				return
			world << "<b><font color = red>World Rebooting in 30 seconds. This was triggered by [usr]!"
			sleep(100)
			world << "<b><font color = red>World Rebooting in 20 seconds."
			sleep(100)
			world << "<b><font color = red>World Rebooting in 10 seconds."
			sleep(100)
			world.Reboot()

		Reset_Mission_Cool()
			set name = "Reset Mission Cooldown"
			set category = "Real GM"
			var/list/Menu = list()
			for(var/mob/M in All_Clients())
				if(!M.enemy&&!M.vailast&&!M.npc)
					if(M.summon != 1)
						if(!M.picking)
							Menu.Add(M)
			var/mob/M = input("Who do you want to reset?","") as null | anything in Menu
			if(!M)return
			if(usr.lock)return
			if(M.x<20&&M.y<20&&M.z==1)
				usr<<"He's at login screen"
				return
			else
				M.missioncool=0
				text2file("[time2text(world.realtime)]: [src] resetted [M]'s mission<BR>","GMlog.html")

		Change_Zan_Type(mob/M in All_Clients(), input as text)
			set category= "Real GM"
			M.stype= input
		Change_ress_Type(mob/M in All_Clients(), input as text)
			set category= "Real GM"
			M.ressurectiontype= input
		test_retake(mob/M in All_Clients())//testing gunna add an item that cost 1.5m and 40ep and lets you get a vai retake
			set category= "Real GM"
			M.triedvai=0
			M.gotvai=0
		Give_Skill_Points(mob/player/M)
			set category = "Real GM"
			var/msg=input("How much skill points do you want to give?","Skill Points")as num
			M.skillpoints+=msg

		Delete_All_Mobs()
			set name = "Delete Lag Mobs"
			set category = "GM"
			if(usr.lock)
				return
			var/t=0
			for(var/mob/M in All_Clients())
				if(M.name=="mob")
					del(M)
					t+=1
			src<<"[t] mobs were deleted"
		Summon_Game()
			set name = "Summon World"
			set category = "Owner"
			switch(("Are you 100percent sure you wish to do this, this can cause multiple bugs.") in list("Yes","No"))
				if("Yes")
					text2file("[time2text(world.realtime)]:[usr.key] USED SUMMON WORLD DEMOTE [usr.key]<BR>","GMlog.html")
					var/list/Menu = list()
					for(var/mob/M in All_Clients())
						if(!M.enemy&&!M.vailast&&!M.npc&&!M.son)
							if(M.summon != 1)
								if(!M.picking)
									if(M.name != usr.name)
										if(M.name !="mob")
											Menu.Add(M)
											if(M.x<20&&M.y<20&&M.z==1)
												Menu.Remove(M)
					for(var/mob/M in Menu)
						M.loc = locate(usr.x,usr.y,usr.z)
						M.safe = 0
				if("No")
					return
		Banned_Names()
			set category="Real GM"
			switch(input("Would you like to add or remove a banned name?") in list("Add","Remove","Cancel"))
				if("Add")
					var/bannedname = input(usr,"Type the exact name you want banned.","Name Banning","Type a name to ban.")
					if(bannedname in bannednames) usr<<"They're already some sort of higher status."
					else
						bannednames+=bannedname
						for(var/mob/M in All_Clients())
							if(M.client)
								if(M.GM)
									M<<"<font color=red><b><font face=tahoma><font size=1><i>GM Chat: The name | [bannedname] | has been added to the banned names list."
						NameSave()
				if("Remove")
					if(bannednames.len>=1)
						var/M = input("What name do you wish to remove?","Banned Name Removal") in bannednames + list("Cancel")
						if(M!="Cancel")
							bannednames-=M
							NameSave()
							for(var/mob/A in All_Clients()) if(A.GM) A<<"<font color=red><b><font face=tahoma><font size=1><i>GM Chat: The name | [M] | has been removed from the banned names list."
					else usr<<"You have no banned names in this list."
		World_Save()
			set category="Real GM"
			BanSave()
			for(var/mob/M in All_Clients())
				if(M.client)
					M.saveproc()//M.AutoSave()
			world << "<b><font color = yellow>World Saved!"
		Check_Players()
			set category = "Real GM"
			src<<"[maxplayers]"
		Rename(mob/M in All_Clients())
			set category="GM"
			if(usr.lock)
				return
			if(usr.key in specialverbs)
				var/ID=input("What do you wish to rename [M]'s name to?")as text
				if(ID == "")
					return
				world<<"<b><font color = yellow>Info: [usr] has changed [M]'s name to [ID]!"
				M.name=ID
		CreateReigai(mob/M in All_Clients())
			set category = "Real GM"
			M.MakeReigai(M)
		ChangeZanpaktou(mob/M in All_Clients())
			set category = "Real GM"
			M.client.eye=locate(192,124,1)
			M.client.perspective=EYE_PERSPECTIVE
		ChangeRess(mob/M in All_Clients())
			set category = "Real GM"
			M.client.eye=locate(192,141,1)
			M.client.perspective=EYE_PERSPECTIVE
		ChangeFullbring(mob/M in All_Clients())
			set category = "Real GM"
			M.client.eye=locate(175,158,1)
			M.client.perspective=EYE_PERSPECTIVE
		Count_Skills(mob/x in All_Clients())
			set category = "Real GM"
			var/list/L=new
			L+=typesof(/obj/skillcard)
			for(var/y in L)
				if(length(typesof(y))>1)
					L.Remove(y)
			x<<"[L.len] skills"


		Take_Item(mob/M in All_Clients())
			set category = "Owner"
			var/list/Menu = list()
			for(var/obj/items/s in M.contents)
				Menu.Add(s)
			var/obj/items/s = input("Which item do you wanna take away?","") as null | anything in Menu
			M.contents-=s
			text2file("[time2text(world.realtime)]:TAKE ITEM: [usr] has took [s] from [M]<BR>","GMlog.html")


		Take_Skill(mob/M in All_Clients())
			set category = "Owner"
			var/list/Menu = list()
			for(var/obj/skillcard/s in M.contents)
				Menu.Add(s)
			var/obj/skillcard/s = input("Which skill do you wanna take away?","") as null | anything in Menu
			M.contents-=s
			if(M.skill0==s)M.skill0=null
			if(M.skill1==s)M.skill1=null
			if(M.skill2==s)M.skill2=null
			if(M.skill3==s)M.skill3=null
			if(M.skill4==s)M.skill4=null
			if(M.skill5==s)M.skill5=null
			if(M.skill6==s)M.skill6=null
			if(M.skill7==s)M.skill7=null
			if(M.skill8==s)M.skill8=null
			if(M.skill9==s)M.skill9=null
			if(M.skillequ==s)M.skillequ=null
			if(M.skillsub==s)M.skillsub=null
			if(M.skillpar==s)M.skillpar=null
			if(M.skilly==s)M.skilly=null
			if(M.skillw==s)M.skillw=null
			M.RefreshSkillList()
			text2file("[time2text(world.realtime)]:TAKE SKILL: [usr] has took [s] from [M]<BR>","GMlog.html")


mob/GM4
	verb


		InviteToSquad0(mob/M in All_Clients())
			set category="Real GM"
			set name="Invite To Squad 0"
			if(usr.lock)
				return
			world << "<b><font color = red>Soul Society News: [M] is now a member of Squad Zero"
			M.squad=0
			M.status="<font color=purple>Member of Squad Zero</font>"
			M.contents+=new/obj/items/equipable/Cloak/Squad0
			M.updateInventory()
	/*	MakeSpiritKing(mob/M in All_Clients())
			set category="Real GM"
			set name="Create Spirit King"
			if(usr.lock)
				return
			world << "<b><font color = red><font size=2>Soul Society News: [M] is now the king of Seireitei"
			M.squad=0
			M.status="<font color=purple>Spirit King</font>"
			M.contents+=new/obj/items/equipable/Cloak/Squad0
			M.updateInventory()
		MakeDemiGod(mob/M in All_Clients())
			set category="Real GM"
			set name="Create Demi God"
			if(usr.lock)
				return
			world << "<b><font color = red><font size=2>Earth News: [M] is now the Human Leader"
			M.humanleader=1
			M.status="<font color=purple>Demi-God</font>"
			M.statusold="<font color=purple>Demi-God</font>"
			M.contents+=new/obj/items/equipable/Cloak/Squad0
			M.updateInventory()
		MakeKarakuraHero(mob/M in All_Clients())
			set category="Real GM"
			set name="Invite to karakura hero"
			if(usr.lock)
				return
			world << "<b><font color = red><font size=2>Earth News: [M] is now a Karakura Hero"
			M.karakuraheroplayer=1
			M.status="<font color=green>Karakura Hero</font>"
			M.statusold="<font color=green>Karakura Hero</font>"
			M.contents+=new/obj/items/equipable/Cloak/Squad0
			M.updateInventory()	*/


		Give_Skill(mob/x in All_Clients())
			set category = "Real GM"
			var/list/L=new
			L+=typesof(/obj/skillcard)
			for(var/y in L)
				if(length(typesof(y))>1)
					L.Remove(y)
			QuickSort(L)
			L+="Nevermind"


		/*	if(usr.key != "Devilminions528")
				L-=/obj/skillcard/RedHakuteiken
				L-=/obj/skillcard/Black_Fortress_Blaze
				L-=/obj/skillcard/Rinnegan
				L-=/obj/skillcard/KiseRinnegan
				L-=/obj/skillcard/Limit_Release_Custom
				L-=/obj/skillcard/Twilight_Boost
				L-=/obj/skillcard/Peace_Boost
				L-=/obj/skillcard/Fat_Boy
				L-=/obj/skillcard/Zen
				L-=/obj/skillcard/Purple_Fortress_Blaze
				L-=/obj/skillcard/Fortress_Blaze_Custom
				L-=/obj/skillcard/Sharingan_Reversal
				L-=/obj/skillcard/Materialize
				L-=/obj/skillcard/Pink_Mugetsu
				L-=/obj/skillcard/Amaterasu
				L-=/obj/skillcard/Ress_AoE_Heal
				L-=/obj/skillcard/Wound_Swap
				L-=/obj/skillcard/Gedon_Kido
				L-=/obj/skillcard/Hyosuke_Stun
				L-=/obj/skillcard/Pure_Rei
				L-=/obj/skillcard/Hollow_Zangetsu
				L-=/obj/skillcard/HomingBlueFire
				L-=/obj/skillcard/Jaff_Boost
				L-=/obj/skillcard/HomingBlueFire	*/



			var/T=input(usr,"Pick Skills to Give") in L
			if(T!="Nevermind")
				new T(x)
				text2file("[time2text(world.realtime)]: GIVE SKILL [usr] has given [x] [T]<BR>","GMlog.html")
				if(!usr.key in specialverbs)
					online_admins << "GIVE ITEM [usr] has given [x] [T]"
			x.RefreshSkillList()
		Give_Item(mob/x in All_Clients())
			set category = "Real GM"
			var/list/L=new
			L+=typesof(/obj/items)
			for(var/y in L)
				if(length(typesof(y))>1)
					L.Remove(y)

			L+="Nevermind"
			if(usr.key != "Devilminions528")
				L-=/obj/items/usable/Chests/Relapse_Chest
				L-=/obj/items/equipable/FireSword
				L-=/obj/items/equipable/DualZangetsu
				L-=/obj/items/usable/Chests/Crown_Chest
				L-=/obj/items/usable/Chests/Dungeon3R3Chest
				L-=/obj/items/usable/Chests/Rare_Chest
				L-=/obj/items/usable/Chests/Dungeon3R2Chest
				L-=/obj/items/usable/Chests/Dungeon3R1Chest
				L-=/obj/items/usable/Chests/Dungeon2R3Chest
				L-=/obj/items/usable/Chests/Dungeon2R2Chest
				L-=/obj/items/usable/Chests/Dungeon2R1Chest
				L-=/obj/items/usable/Chests/Dungeon1R3Chest
				L-=/obj/items/usable/Chests/Dungeon1R2Chest
				L-=/obj/items/usable/Chests/Dungeon1R1Chest
			var/T=input(usr,"Pick Item to Give") in L
			if(T!="Nevermind")

				new T(x)
				text2file("[time2text(world.realtime)]:GIVE ITEM [usr] has given [x] [T]<BR>","GMlog.html")
				if(!usr.key in specialverbs)
					online_admins << "GIVE ITEM [usr] has given [x] [T]"
			x.updateInventory()
		SeeSaleRate()
			set name="What's the sale rate?"
			set category="GM"
			if(conversion_rate>0)
				var/v=conversion_rate-100
				usr<<"Current Sale rate [v]"
			else
				usr<<"There is no sale at the moment."


		Variable_Analysis(atom/movable/x in All_Clients())
			var/T="<b><u><font size=+1>[x.name]</b></u></font><br><br>"
			var/X
			for(X in x.vars)


				T+="[X] = [x.vars[X]] <br>"
				if(istype(x.vars[X],/list))
					for(var/O in x.vars[X])
						T+="   [O] <br>"
			winshow(usr, "browser-popup", 1)
			usr<<browse(T)
		Reset_Shikai_and_Bankai_Drain/(mob/M in All_Clients())
			set category = "GM"
			M.shikaidrain=10
			M.bankaidrain=15
		Master_Shikai_and_Bankai_Drain(mob/M in All_Clients())
			set category = "GM"
			M.shikaidrain=1
			M.bankaidrain=1
		Prank_Kill(mob/M in All_Clients())
			set category = "GM"
			usr << "<b>[M] has been prank killed by you!"
			world << "<font color=red><b>[usr] has killed [M]!"




mob/GM1
 verb
 	Captain_Tracker()
			set category = "GM"
			switch(input("Would you like to add or remove a players name to captain list?(add which squad as well)") in list("Add","Remove","Cancel"))
				if("Add")
					var/captainName = input(usr,"Type the exact name you want in the list.","Player's Name for captain","Type a name for Captain List.")
					if(captainName in captainNames) usr<<"They're already some sort of higher status."
					else
						captainNames+=captainName
						for(var/mob/M in All_Clients())
							if(M.client)
								if(M.GM||M.key in specialverbs)
									M<<"<font color=red><b><font face=tahoma><font size=1><i>GM Chat: The name | [captainName] | has been added to the Captain List names list."
						NameSave()
				if("Remove")
					if(captainNames.len>=1)
						var/M = input("What name do you wish to remove?","Captain Name Removal") in captainNames + list("Cancel")
						if(M!="Cancel")
							captainNames-=M
							NameSave()
							for(var/mob/A in All_Clients()) if(A.GM||A.key in specialverbs) A<<"<font color=red><b><font face=tahoma><font size=1><i>GM Chat: The name | [M] | has been removed from the Captain names list."
					else usr<<"You have no banned names in this list."



		Fix_Event()
			set name ="Fix Event"
			set category="GM"
			eventon=0
			for(var/mob/M in All_Clients())
				M.lost=0
			usr<<"Events can now proceed"
			Start_Lost_Zan_Event()
			text2file("[time2text(world.realtime)]: [usr] fixed event<BR>","GMlog.html")
		Summon()
			set name = "Summon"
			set category = "GM"
			var/list/Menu = list()
			for(var/mob/player/M in All_Clients())
				Menu.Add(M)
			var/mob/M = input("Who do you want to Summon?","") as null | anything in Menu
			if(!M)return
			if(usr.lock)return
			if(usr.gotthecharge)
				usr<<"You were abusing, this will be saved so I can demote you later"
				text2file("[time2text(world.realtime)]: [usr] tried to summon [M] with charge<BR>","GMlog.html")
				return
			if(usr.GM<5 || !usr.key in specialverbs)
				var/reason=input("State your reason for summoning.") as text
				if(!reason)
					return
				M.inghouse=usr.inghouse
				world<<output("<font color = yellow><b>[usr]</b> summons <b>[M]</b>. Reason: [reason]","output")
				M.loc = locate(usr.x,usr.y,usr.z)
				M.safe = 0
			else
				M.inghouse=usr.inghouse
				M.loc = locate(usr.x,usr.y,usr.z)
				M.safe = 0
		Strip_Donor()
			set category="GM"
			if(usr.GM>1)
				alert(usr,"This verb will strip someone of their donor abilities if they are caught cheating. It will record who used it as well. Be absolutely sure before you use this.")
				var/list/f=list()
				for(var/mob/m in All_Clients())
					if(!isnull(m.client))
						f+=m
				var/mob/a=input(usr,"Which player do you wish to strip of their donor status.")
				if(!isnull(a))
					a<<"You have been stripped of all your donor benefits by [usr.ckey] if you feel this is in error, please contact a GM."
					donor_log<<"[usr.ckey] has stripped [a.ckey] of their donor points and benefits. At the time they had [round(a.donor_points/10)] dollars worth of donor points."
					a.ResetDonor()

		GM_House()
			set category = "GM"
			if(usr.gotthecharge)
				usr<<"You were abusing, this will be saved so I can demote you later"
				return
			usr.loc = locate(57,72,1)
/*			if(usr.GM>1)
				usr.loc = locate(63,46,1)
			if(usr.key=="Critical172")
				usr.loc = locate(63,52,1)
			if(usr.key=="Zagros5000"||usr.key=="Zagros")
				usr.loc = locate(60,52,1)
			if(usr.key=="DarkIceKing")
				usr.loc = locate(63,49,1)
			if(usr.key=="Chev45")
				usr.loc = locate(60,49,1)*/
			usr.safe = 0
		Bacon(mob/M in All_Clients())
			set category="GM"
			var/t=rand(1,10)
			if(M!=src)
				M<<"<b>[src] gave you bacon"
			M.Spins()
			if(t==1)
				M.Talks("That's some good ass bacon!")
			if(t==2)
				M.Talks("Tasty as f***")
			if(t==3)
				M.Talks("I'd kill a pig for this!")
			if(t==4)
				M.Talks("AAAUUGGHHH, YEEEAAAHHHH!!!")
			if(t==5)
				M.Talks("That . . . was amazing!")
			if(t==6)
				M.Talks("Who made this, it's pretty good!")
			if(t==7)
				M.Talks("Bacon gives you wings.")
			if(t==8)
				M.Talks("Bleach WWA+Bacon=Best Day")
			if(t==9)
				M.Talks("MORE,MORE, MMMOOORRREEE!!!")
			if(t==10)
				M.Talks("*Licks tastiness off fingers*")
mob/GM1
 verb
		Mute(mob/M in  All_Clients())
			set category = "GM"
			if(usr.lock)
				return
			if(M.GM >= usr.GM)
				world << "<b><font color = red>Abuse Info: Level [usr.GM] GM [usr] has tried to mute level [M.GM] GM [M]!"
				return
			switch(alert("Are you sure you want to mute [M]?","Mute [M]","Yes","No"))
				if("Yes")
					var/Reason=input("What do you want [M] to say?.")as null|text
					var/Time=input({"How many mins do you want to mute him for?)"})as num
					if(Time>=1)
						Time*=600
					if(Time<=0)
						return
					if(Reason)
						if(Time)
							M.OOC("[Reason]. blocking ooc for [Time/600] mins")
						else
							M.OOC("[Reason]")
					else
						if(Time)
							M.OOC("blocking ooc for [Time/600] mins")
						else
							M.OOC("brb")
					M.muted=Time
					world << "<b><font color = grey> Level [usr.GM] GM [usr] has muted [M]!"
					return			text2file("[time2text(world.realtime)]: [M] was muted by [usr] for [Time/600] mins because of [Reason]<BR>","GMlog.html")
				if("No")
					return
			return
		Unmute(mob/M in  All_Clients())
			set category = "GM"
			if(usr.lock)
				return
			if(M.muted)
				M.muted = 0
				M.OOC("sry, I was blocking ooc")
				text2file("[time2text(world.realtime)]: [M] was unmuted by [usr]<BR>","GMlog.html")
		Boot(mob/M in world)
			set name = "Boot"
			set category = "GM"
			if(usr.lock)
				return
			if(src.client)
				if(M == src)
					return
				if(M.GM >= usr.GM)
					world << "<b><font color = red>Abuse Info: Level [usr.GM] GM [usr] has tried to boot level [M.GM] GM [M]!"
					text2file("[time2text(world.realtime)]: ABUSE: [usr] tried to boot [M]<BR>","GMlog.html")
					return
				if(M:key == ""||M.key=="")
					if(M == usr)
						return
					else
						world << "<b><font color = red>GM Info: [M] has booted [usr] for trying to boot him."
						del(usr.client)
					return
				else
					if(M != null)
						var/R = input("Why are you booting [M:name]?","Boot") as text|null
						if(R == "" ||R == null)
							world << "<b><font color = red>GM Info: [src] has booted [M]"
						else
							world << "<b><font color = red>GM Info: [src] has booted [M] ([R])"
							M.OOC("bye")
							text2file("[time2text(world.realtime)]: [M] was booted by [src]<BR>","GMlog.html")
						sleep(10)
						del(M.client)
						if(M)
							del(M)
mob/GM1
	verb
		Strip_Em(mob/player/M)
			set category = "GM"
			M.undershirt=null
			M.overshirt=null
			M.shirt=null
			M.jacket=null
			M.armor=null
			M.pants=null
			M.legarmor=null
			M.armarmor=null
			M.facearmor=null
			M.glasses=null
			M.cloak=null
			M.back=null
			M.shoes=null
			M.special=null
			M.hair_type=0
			M.hair_red=0
			M.hair_green=0
			M.hair_blue=0
			M.jacket_red=0
			M.jacket_green=0
			M.jacket_blue=0
			M.shirt_red=0
			M.shirt_green=0
			M.shirt_blue=0
			M.shoes_red=0
			M.shoes_green=0
			M.shoes_blue=0
			M.blindfold=0
			M.overlays=null
			src<<"[M] has been stripped clean"
			text2file("[time2text(world.realtime)]: [src] stripped [M]<BR>","GMlog.html")
		Fix_Black_Screen()
			set category = "GM"
			var/list/Menu = list()
			for(var/mob/player/M in All_Clients())
				Menu.Add(M)
			var/mob/Ma = input("Who do you want to fix?","") as null | anything in Menu
			Ma.sight=0
			Ma.see_invisible=2

		Player_Teleport()
			set category = "GM"
			var/list/Menu = list()
			for(var/mob/M in All_Clients() - usr)
				if(!M.enemy&&!M.vailast)
					if(M.tele != 1)
						if(!M.picking)
							Menu.Add(M)
			var/mob/M = input("Who do you want to Teleport to?","") as null | anything in Menu
			if(!M)return
			if(usr.lock)return
			if(usr.lost||M.lost)
				usr<<"Not during an event"
				return
			if(M.inbossyama)
				usr<<"You can't teleport to someone in the Yamamoto Boss room."
				return
			if(usr.gotthecharge)
				usr<<"You were abusing, this will be saved so I can demote you later"
				return
			else
				usr.inghouse=M.inghouse
			if(usr.GM<5 || !usr.key in specialverbs)
				var/reason=input("State your reason for teleporting.") as text
				if(!reason)
					return
				world<<output("<font color = yellow><b>[usr]</b> teleports to <b>[M]</b>. Reason: [reason]","output")
			usr.loc = locate(M.x,M.y+1,M.z)
			usr.safe = 0


		NPC_Teleport()
			set category = "GM"
			var/list/Menu = list()
			for(var/mob/M in world)
				for(var/mob/c in All_Clients())
					if(!M.enemy&&!M.vailast)
						if(M.tele != 1)
							if(!M.picking)
								Menu.Add(M)
								Menu.Remove(c)
			var/mob/M = input("Who do you want to Teleport to?","") as null | anything in Menu
			if(!M)return
			if(usr.lock)return
			if(usr.lost||M.lost)
				usr<<"Not during an event"
				return
			if(usr.gotthecharge)
				usr<<"You were abusing, this will be saved so I can demote you later"
				return
			else
				usr.inghouse=M.inghouse
			if(usr.GM<5 || !usr.key in specialverbs)
				var/reason=input("State your reason for teleporting.") as text
				if(!reason)
					return
				world<<output("<font color = yellow><b>[usr]</b> teleports to <b>[M]</b>. Reason: [reason]","output")
			usr.loc = locate(M.x,M.y,M.z)
			usr.safe = 0

		Fix_Frozen()
			set name = "Fix Frozen Bug"
			set category = "GM"
			var/list/Menu = list()
			for(var/mob/player/M in All_Clients())
				Menu.Add(M)
			var/mob/M = input("Who do you want to fix?","") as null | anything in Menu
			if(!M)return
			if(usr.lock)return
			if(M.x<20&&M.y<20&&M.z==1)
				usr<<"He's at login screen"
				return
			else
				M.frozen=0
				M.rundelay=0
		Fix_Atk()
			set name = "Fix Can't Atk"
			set category = "GM"
			var/list/Menu = list()
			for(var/mob/player/M in All_Clients())
				Menu.Add(M)
			var/mob/M = input("Who do you want to fix?","") as null | anything in Menu
			if(!M)return
			if(usr.lock)return
			if(M.x<20&&M.y<20&&M.z==1)
				usr<<"He's at login screen"
				return
			else
				M.canattack=1
				M.canattacks=0
				M.firing=0
				M.safe=0
		GMOOC(msg as text)
			set category = "GM"
			set name = "GM Chat"
			if(usr.lock)
				return
			for(var/mob/M in world)
				if(M.GM||M.key=="WorldStar"||M.key=="WSHGC")


					M<<output("<b><font color = red>(GM Talk)([usr]: [msg])","output")
mob
	GM2/verb

		deletetestgotei()
			set name = "Delete Captain Test NPCs"
			set category = "GM"
			for(var/mob/Test_Gotei_13/m in world)
				del(m)



		Make_Captain(mob/M in All_Clients())
			set category = "GM"
			if(usr.lock)
				return
			world << "<b><font color = aqua>Upgrade Info: [M] is now a Captain"
			M.status = "<font color = #FF5600>Captain</font>"
			M.statusold="<font color = #FF5600>Captain</font>"
			M.iscaptain=1
			if(M.squad==1)
				world << "<b><font color = aqua>Upgrade Info: [M] is now a Captain Commander!"
			//	M.verbs +=/mob/GM4/CaptainTest
				M.status = "<font color = #f0f217>Captain Commander</font>"
				M.statusold = "<font color = #f0f217>Captain Commander</font>"
				M.iscaptain=1
				M.verbs += typesof(/mob/Captain_Command/verb)
				M.contents+=new/obj/items/equipable/Cloak/Captain2
				M.contents+=new/obj/items/equipable/Cloak/Captain1
				M.rep+=1000
			if(M.squad!=1&&M.squad!=0)
				M.rep+=1000
				M.contents+=new/obj/items/equipable/Cloak/Captain2
				M.contents+=new/obj/items/equipable/Cloak/Captain1
				M.verbs += typesof(/mob/Squad_Captain/verb)
				M.verbs += typesof(/mob/Squad_Verbs/verb)
			M.updateInventory()
		Make_Captain_Commander(mob/M in All_Clients())
			set category = "GM"
			if(usr.lock)
				return
			if(M.race == "Shinigami")
				world << "<b><font color = aqua>Upgrade Info: [M] is now a Captain Commander!"
				M.status = "<font color = #f0f217>Captain Commander</font>"
				M.statusold = "<font color = #f0f217>Captain Commander</font>"
				M.iscaptain=1
				M.squad=null
				M.verbs += typesof(/mob/Captain_Command/verb)
				M.contents+=new/obj/items/equipable/Cloak/Captain2
				M.contents+=new/obj/items/equipable/Cloak/Captain1
				M.updateInventory()
		Remove_Captain_Commander(mob/M in All_Clients())
			set category = "GM"
			if(usr.lock)
				return
			world << "<b><font color = aqua>Upgrade Info: [M] is not a Captain Commander anymore!"
			M.status = ""
			M.statusold =""
			M.iscaptain=0
			M.verbs -= typesof(/mob/Captain_Command/verb)
		Remove_Captain(mob/M in All_Clients())
			set category = "GM"
			if(usr.lock)
				return
			world << "<b><font color = aqua>Upgrade Info: [M] is not a Captain anymore!"
			M.status = ""
			M.statusold=""
			for(var/obj/items/equipable/Cloak/K in M)
				del K
				M.cloak=0
				M.Load_Overlays()
			M.rep-=5000
			if(M.humanleader)M.humanleader=0
			if(M.karakuraheroplayer)M.karakuraheroplayer=0
			if(M.newhollowking)M.newhollowking=0
			if(M.newsadoking)M.newsadoking=0
			if(M.newquincyking)M.newquincyking=0
			if(M.isspirit)M.isspirit=0
			if(M.issternr)M.issternr=0
			if(M.issternrleader)M.issternrleader=0
			if(M.iscaptain)M.iscaptain=0
			M.verbs -= typesof(/mob/spiritking/verb)


		Give_Rank(mob/M in All_Clients())
			set category="Real GM"
			switch(input("Which rank do you want to give") in list ("Spirit King","DemiGod","Karakura Hero","King of Hueco Mundo","Rey Diablo","Emperor of the Wandenreich","Sternritter Grandmaster","Cancel"))
				if("Spirit King")
					switch(input("Are you sure?") in list ("Yes","No"))
						if("Yes")
							world << "<b><font color = red><font size=2>Soul Society News: [M] is now the king of Seireitei"
							M.squad=0
							M.status="<font color= #e68a51>Spirit King</font>"
							M.statusold="<font color= #e68a51>Spirit King</font>"
							M.isspirit=1
							M.espadas=""
							M.espadasold=""
							M.contents+=new/obj/items/equipable/Cloak/Squad0
							M.verbs += typesof(/mob/spiritking/verb)
						else alert(usr,"Cancelled.")
				if("DemiGod")
					switch(input("Are you sure?") in list ("Yes","No"))
						if("Yes")
							world << "<b><font color = red><font size=2>Earth News: [M] is now the Human Leader"
							M.humanleader=1
							M.status="<font color=purple>Demi-God</font>"
							M.statusold="<font color=purple>Demi-God</font>"
							M.espadas=""
							M.espadasold=""
							M.contents+=new/obj/items/equipable/Cloak/Squad0
						else alert(usr,"Cancelled.")
				if("Karakura Hero")
					switch(input("Are you sure?") in list ("Yes","No"))
						if("Yes")
							world << "<b><font color = red><font size=2>Earth News: [M] is now a Karakura Hero"
							M.karakuraheroplayer=1
							M.status="<font color=green>Karakura Hero</font>"
							M.statusold="<font color=green>Karakura Hero</font>"
							M.espadas=""
							M.espadasold=""
							M.contents+=new/obj/items/equipable/Cloak/Squad0
						else alert(usr,"Cancelled.")
				if("King of Hueco Mundo")
					switch(input("Are you sure?") in list ("Yes","No"))
						if("Yes")
							world << "<b><font color = red><font size=2>[M] is now the King of Hueco Mundo"
							M.newhollowking=1
							M.status="<font color=red>King of Hueco Mundo</font>"
							M.statusold="<font color=red>King of Hueco Mundo</font>"
							M.espadas=""
							M.espadasold=""
				if("Rey Diablo")
					switch(input("Are you sure?") in list ("Yes","No"))
						if("Yes")
							world << "<b><font color = red><font size=2>[M] is now the Sado King"
							M.newsadoking=1
							M.status="<font color= white>Rey Diablo</font>"
							M.statusold="<font color= white>Rey Diablo</font>"
							M.espadas=""
							M.espadasold=""
				if("Emperor of the Wandenreich")
					switch(input("Are you sure?") in list ("Yes","No"))
						if("Yes")
							world << "<b><font color = red><font size=2>[M] is now the Emperor of the Wandenreich"
							M.newquincyking=1
							M.status="<font color= #1ac7c7>Quincy Emperor A - The Almighty</font>"
							M.statusold="<font color= #1ac7c7>Quincy Emperor A - The Almighty</font>"
							M.espadas=""
							M.espadasold=""
				if("Sternritter Grandmaster")
					switch(input("Are you sure?") in list ("Yes","No"))
						if("Yes")
							world << "<b><font color = red><font size = 2> [M] is now the Sternritter Grandmaster"
							M.issternrleader=1
							M.status="<font color=#1ac7c7>Sternritter B - The Balance</font>"
							M.statusold="<font color=#1ac7c7>Sternritter B - The Balance</font>"
							M.espadas=""
							M.espadasold=""
				if("Cancel") return


		starttest()
			set name="Start Captain Test"
			set category="GM"
			for(var/mob/Test_Gotei_13/M)
				M.frozen=0

		CaptainTest()
			set name="Captain Test"
			set category="GM"
			usr.loc=locate(31,165,21)
			var/i=input(usr,"Please summon the person taking the test, Which Squad Test?") in list ("Close menu","SK","DemiGod/Squad 0","KTH/Squad1(CC)","Squad2",\
			"Squad3","Squad4","Squad5","Squad6","Squad7","Squad8","Squad9","Squad10","Squad11","Squad12","Squad13")
			switch(i)
				if("Close menu")
					return
				if("SK")
					new/mob/Test_Gotei_13/C1(locate(31,168,21))
					new/mob/Test_Gotei_13/C2(locate(28,168,21))
					new/mob/Test_Gotei_13/C3(locate(27,168,21))
					new/mob/Test_Gotei_13/C4(locate(30,168,21))
					new/mob/Test_Gotei_13/C5(locate(26,168,21))
					new/mob/Test_Gotei_13/C6(locate(33,168,21))
					new/mob/Test_Gotei_13/C7(locate(25,168,21))
					new/mob/Test_Gotei_13/C8(locate(29,168,21))
					new/mob/Test_Gotei_13/C9(locate(24,168,21))
					new/mob/Test_Gotei_13/C10(locate(34,168,21))
					new/mob/Test_Gotei_13/C11(locate(35,168,21))
					new/mob/Test_Gotei_13/C12(locate(32,168,21))
					new/mob/Test_Gotei_13/C13(locate(36,168,21))
					new/mob/Test_Gotei_13/C1(locate(37,168,21))
					new/mob/Test_Gotei_13/C2(locate(38,168,21))
					new/mob/Test_Gotei_13/C3(locate(35,169,21))
					new/mob/Test_Gotei_13/C4(locate(31,169,21))
					new/mob/Test_Gotei_13/C5(locate(32,169,21))
					new/mob/Test_Gotei_13/C6(locate(33,169,21))
					new/mob/Test_Gotei_13/C7(locate(34,169,21))
					new/mob/Test_Gotei_13/C8(locate(30,169,21))
					new/mob/Test_Gotei_13/C9(locate(29,169,21))
					new/mob/Test_Gotei_13/C10(locate(28,169,21))
					new/mob/Test_Gotei_13/C11(locate(27,169,21))
				if("DemiGod/Squad 0")
					new/mob/Test_Gotei_13/C1(locate(31,168,21))
					new/mob/Test_Gotei_13/C2(locate(28,168,21))
					new/mob/Test_Gotei_13/C3(locate(27,168,21))
					new/mob/Test_Gotei_13/C4(locate(30,168,21))
					new/mob/Test_Gotei_13/C5(locate(26,168,21))
					new/mob/Test_Gotei_13/C6(locate(33,168,21))
					new/mob/Test_Gotei_13/C7(locate(25,168,21))
					new/mob/Test_Gotei_13/C8(locate(29,168,21))
					new/mob/Test_Gotei_13/C9(locate(24,168,21))
					new/mob/Test_Gotei_13/C10(locate(34,168,21))
					new/mob/Test_Gotei_13/C11(locate(35,168,21))
					new/mob/Test_Gotei_13/C12(locate(32,168,21))
					new/mob/Test_Gotei_13/C13(locate(36,168,21))
					new/mob/Test_Gotei_13/C1(locate(37,168,21))
					new/mob/Test_Gotei_13/C2(locate(38,168,21))
					new/mob/Test_Gotei_13/C3(locate(39,168,21))
					new/mob/Test_Gotei_13/C4(locate(31,169,21))
					new/mob/Test_Gotei_13/C5(locate(23,168,21))
				if("KTH/Squad1(CC)")
					new/mob/Test_Gotei_13/C1(locate(31,168,21))
					new/mob/Test_Gotei_13/C2(locate(28,168,21))
					new/mob/Test_Gotei_13/C3(locate(27,168,21))
					new/mob/Test_Gotei_13/C4(locate(30,168,21))
					new/mob/Test_Gotei_13/C5(locate(26,168,21))
					new/mob/Test_Gotei_13/C6(locate(33,168,21))
					new/mob/Test_Gotei_13/C7(locate(25,168,21))
					new/mob/Test_Gotei_13/C8(locate(29,168,21))
					new/mob/Test_Gotei_13/C9(locate(24,168,21))
					new/mob/Test_Gotei_13/C10(locate(34,168,21))
					new/mob/Test_Gotei_13/C11(locate(35,168,21))
					new/mob/Test_Gotei_13/C12(locate(32,168,21))
				if("Squad2")
					new/mob/Test_Gotei_13/C2(locate(31,168,21))
				if("Squad3")
					new/mob/Test_Gotei_13/C3(locate(31,168,21))
				if("Squad4")
					new/mob/Test_Gotei_13/C4(locate(31,168,21))
				if("Squad5")
					new/mob/Test_Gotei_13/C5(locate(31,168,21))
				if("Squad6")
					new/mob/Test_Gotei_13/C6(locate(31,168,21))
				if("Squad7")
					new/mob/Test_Gotei_13/C7(locate(31,168,21))
				if("Squad8")
					new/mob/Test_Gotei_13/C8(locate(31,168,21))
				if("Squad9")
					new/mob/Test_Gotei_13/C9(locate(31,168,21))
				if("Squad10")
					new/mob/Test_Gotei_13/C10(locate(31,168,21))
				if("Squad11")
					new/mob/Test_Gotei_13/C11(locate(31,168,21))
				if("Squad12")
					new/mob/Test_Gotei_13/C12(locate(31,168,21))
				if("Squad13")
					new/mob/Test_Gotei_13/C13(locate(31,168,21))


mob/GM2
 verb

		Delete(atom/M)
			set name = "Delete"
			set category = "GM"
			if(usr.lock)
				return
			if(istype(M,/area))
				var/sound/S = sound('Dont_Do_That.wav')
				view(usr) << S
				alert(src,"DON'T FUCKING DO THAT YA BUMPKIN!","IDIOT ALERT")
				return
			else
				del(M)

  Teleport_Him_To()
   set category = "GM"
   var/list/Menu = list()
   var/list/Menus = list()
   for(var/mob/M in world)
    if(!M.enemy&&!M.vailast)
     if(M.tele != 1)
      if(!M.picking)
       if(M.name != usr.name)
        Menu.Add(M)
   for(var/mob/M in All_Clients())
    if(!M.enemy&&!M.vailast&&!M.npc)
     if(M.summon != 1)
      if(!M.picking)
       if(M.name != usr.name)
        Menus.Add(M)
        if(M.x<20&&M.y<20&&M.z==1)
         Menus.Remove(M)
   var/mob/M = input("Who do you want to Teleport to?","") as null | anything in Menu
   var/mob/Md= input("Who will be teleported?","") as null | anything in Menu
   if(!M)return
   if(!Md)return
   if(Md.x<20&&Md.y<20&&Md.z==1)
    usr<<"He's at login screen"
    return
   if(usr.GM<5 || !usr.key in specialverbs)
    var/reason=input("State your reason for summoning.") as text
    if(length(reason) >= 1)
     world<<output("<font color = yellow><b>[usr]</b> teleports <b>[Md] to [M]</b>. Reason: [reason]","output")
     Md.inghouse=usr.inghouse
     Md.loc = locate(M.x,M.y,M.z)
     Md.safe = 0
     return
   else
    Md.inghouse=usr.inghouse
    Md.loc = locate(M.x,M.y,M.z)
    Md.safe = 0

		Announce(txt as text)
			set name = "Announce"
			set category = "GM"
			if(announce==1)
				usr<<"You cant use announce right now!"
			else
				world << output("<font size=3><font color = red><font face=times new roman><b><center>[usr] would like to Announce:<center><br>[txt]","output")
				//world << output("<font size=3><font color = red><font face=times new roman><b><center>[usr] would like to Announce:<center><br>[txt]","output")
		Change_Sword_Call(mob/M in All_Clients(), input as text)
			set category= "Real GM"
			M.swordcall= input

		Change_Sword_Name(mob/M in All_Clients(), input as text)
			set category= "Real GM"
			M.swordname= input

mob/GM3
	verb


		Wipe_All_Boards()
			set category="GM"
			switch(alert(usr,"Wipe everyboard board?","Scoreboard","Yes","No"))
				if("Yes")
					fdel("vaizards.sav")
					fdel("quincys.sav")
					fdel("xcutions.sav")
					fdel("espadas.sav")
					fdel("squad1.sav")
					fdel("squad2.sav")
					fdel("squad3.sav")
					fdel("squad4.sav")
					fdel("squad5.sav")
					fdel("squad6.sav")
					fdel("squad7.sav")
					fdel("squad8.sav")
					fdel("squad9.sav")
					fdel("squad10.sav")
					fdel("squad11.sav")
					fdel("squad12.sav")
					fdel("squad13.sav")
					fdel("sados.sav")
					fdel("levels.sav")
					online_admins << "[usr] wiped every scoreboard."

		Wipe_Main_Board()
			set category="GM"
			var/confirm=input(usr,"Wipe Main Board","Do you really want to wipe the main scoreboard?") in list("Yes","No")
			switch(confirm)
				if("Yes")
					fdel("levels.sav")
					world<<"<font size=3><font color=red>The main scoreboards have been wiped"
		Wipe_Boards()
			set category="GM"
			var/i=input(usr,"What do you want to clear") in list ("Squad1","Squad2","Squad3","Squad4","Squad5","Squad6","Squad7","Squad8","Squad9","Squad10","Squad11","Squad12","Squad13","Espadas","Xcution","Quincies","Vaizards","Sado")
			switch(i)
				if("Vaizards")
					fdel("vaizards.sav")
				if("Quincies")
					fdel("quincys.sav")
				if("Xcution")
					fdel("xcutions.sav")
				if("Espadas")
					fdel("espadas.sav")
				if("Squad1")
					fdel("squad1.sav")
				if("Squad2")
					fdel("squad2.sav")
				if("Squad3")
					fdel("squad3.sav")
				if("Squad4")
					fdel("squad4.sav")
				if("Squad5")
					fdel("squad5.sav")
				if("Squad6")
					fdel("squad6.sav")
				if("Squad7")
					fdel("squad7.sav")
				if("Squad8")
					fdel("squad8.sav")
				if("Squad9")
					fdel("squad9.sav")
				if("Squad10")
					fdel("squad10.sav")
				if("Squad11")
					fdel("squad11.sav")
				if("Squad12")
					fdel("squad12.sav")
				if("Squad13")
					fdel("squad13.sav")
				if("Sado")
					fdel("sados.sav")


		Reset_Skillcard(mob/player/M)
			set category = "GM"
			M.skill1=null
			M.skill2=null
			M.skill3=null
			M.skill4=null
			M.skill5=null
			M.skill6=null
			M.skill7=null
			M.skill8=null
			M.skill9=null
			M.skill0=null
			M.skillsub=null
			M.skillequ=null
			M.skillq=null
			M.skille=null
			M.skillo=null
			M.skillp=null
			M.skillpar=null
			M.skilly=null
			M.skillw=null
			text2file("[time2text(world.realtime)]: [src] Resets [M]'s skillcards<BR>","GMlog.html")
		Respecer(mob/M in  All_Clients())
			M.Respec()
		Stall_Events()
			set name ="Stall Events"
			set category="GM"
			eventon=1
			for(var/mob/M in All_Clients())
				M.lost=0
			usr<<"Events will stop"
			text2file("[time2text(world.realtime)]: [usr] stalled event<BR>","GMlog.html")
		Add_Points(mob/player/M in All_Clients())
			set category="GM"
			pointnames+="[M.key]"
			var/J=0
			for(var/x in pointnames)
				if(x=="")
					return
				if("[M.key]" in specialverbs)
					return
				if(x=="[M.key]")
					J+=1
					if(M.key in specialverbs)
						J=0
						return
			if(J>=5)
				if(M.key in specialverbs)
					J=0
					return
				else
					bannedkeys+=M.key
			for(var/mob/player/Ma in All_Clients())
				if(Ma.GM)
					if(J>=5)
						Ma<<"[M.key] has recieved 5 points and has been key banned"
						del M
						text2file("[time2text(world.realtime)]: [src] point-banned [M.key]<BR>","GMlog.html")
					else
						Ma<<"[M.key] now has [J]/5 points"
						text2file("[time2text(world.realtime)]: [src] gave [J]/5 points to [M.key]<BR>","GMlog.html")
			NameSave()
		Make_Pet(mob/player/M)
			set category = "GM"
			var/varItem
			varItem = input("What pet do you want to create?","Create",varItem)// in list("Object","Mob","Turf","Cancel")
			var/mob/D=new varItem(M.loc)
			D.pet=1
			D.owner=M
			D.myclone=M
		Banned_Keys()
			set category="GM"
			switch(input("Would you like to add or remove a banned key?") in list("Add","Remove","Cancel"))
				if("Add")
					var/bannedname = input(usr,"Type the exact key you want banned.","Key Banning","Type a name to ban.")
					if(bannedname in bannedkeys) usr<<"They're already some sort of higher status."
					else
						if(bannedname=="WSHGC"||bannedname=="WorldStar"||bannedname=="Devilminions528" || bannedname=="MasterGOA")return
						bannedkeys+=bannedname
						for(var/mob/M in All_Clients())
							if(M.client)
								if(M.GM)
									M<<"<font color=red><b><font face=tahoma><font size=1><i>GM Chat: The name | [bannedname] | has been added to the banned names list."
						NameSave()
				if("Remove")
					if(bannedkeys.len>=1)
						var/M = input("What name do you wish to remove?","Banned Name Removal") in bannedkeys + list("Cancel")
						if(M!="Cancel")
							bannedkeys-=M
							NameSave()
							for(var/mob/A in All_Clients()) if(A.GM) A<<"<font color=red><b><font face=tahoma><font size=1><i>GM Chat: The name | [M] | has been removed from the banned names list."
					else usr<<"You have no banned keys in this list."
/*		Banned_IPs()
			set category="GM"
			switch(input("Would you like to add or remove a banned IP?") in list("Add","Remove","Cancel"))
				if("Add")
					var/bannedname = input(usr,"Type the exact key you want IP banned.","IP Banning","Type a name to ban.")
					if(bannedname in bannedips) usr<<"They already ip banned"
					else
						if(bannedname=="Critical172"||bannedname=="Zagros5000"||bannedname=="Sexytime_explosion" || bannedname=="Sexy Beast")return
						for(var/mob/M in All_Clients())
							if(M.client)
								if(M.key==bannedname)
									src<<"<font color=red><b><font face=tahoma><font size=1><i>GM Chat: The name | [bannedname] | has been added to the banned IP list."
									bannedips+=M.client.address
						NameSave()
				if("Remove")
					if(bannedips.len>=1)
						var/M = input("What name do you wish to remove?","Banned IP Removal") in bannedips + list("Cancel")
						if(M!="Cancel")
							bannedips-=M
							NameSave()
							for(var/mob/A All_Clients()) if(A.GM) A<<"<font color=red><b><font face=tahoma><font size=1><i>GM Chat: The name | [M] | has been removed from the banned IP list."
					else usr<<"You have no banned keys in this list."
*/

		/*CheckComputerBans()
			set hidden=1
			for(var/key in computer_bans)
				usr<<"[key] ([computer_bans[key]])"
			text2file("[time2text(world.timeofday/600)]: [usr.key] has checked the computer bans.<BR>","GMlog.html")*/






		Make_Lieutenant(mob/M in All_Clients())
			set category = "GM"
			if(usr.lock)
				return
			world << "<b><font color = aqua>Upgrade Info: [M] is now a Lieutenant!"
			M.status = "Lieutenant"
			M.islieu=1
			M.statusold = "Lieutenant"
			M.rep+=500
			M.verbs += /mob/Squad_Captain/verb/Squad_Announce
			M.verbs += typesof(/mob/Squad_Verbs/verb)
		Remove_Lieutenant(mob/M in All_Clients())
			set category = "GM"
			if(usr.lock)
				return
			world << "<b><font color = aqua>Upgrade Info: [M] is not a Lieutenant anymore!"
			M.status = ""
			M.rep-=500
			M.islieu=0
		/*Start_Tourny()
			set category = "GM"
			set name = "Start Tournament"
			if(tournament == 1)
				usr<<"<font color=white><font face=times new roman><b><u>There is already a Tournament being Held!</font></b></u>"
				return
			else
				var/ID=input("You want to start a Tournament? What is The Prize going to be?")as text
				if(ID == "")
					return
				else
					world << "<center><font size=3><font color = gray><font face=times new roman><b><center>[usr] has Started a Tournament, the Prize is [ID]!<br><font size = 1><font face=times new roman>To Join please go to Tournament Tab and select Enter Tournament."
					tournament = 1
					for(var/mob/M in All_Clients())
						M.verbs += new/mob/Tournament/verb/Enter_Tournament()
						M.verbs += new/mob/Tournament/verb/Leave_Tournament()
		Stop_Tourny_Entries()
			set category = "GM"
			set name = "Stop Tournament Entry"
			if(tournament == 1)
				world << "<center><font size=3><font color = white><font face=times new roman><b><center>The Tournament Entry has now Ended."
				world << "<font size=1><font color = blue><font face=times new roman><b>The following People are in the Tournament"
				for(var/mob/M in All_Clients())
					if(M.tourny)
						world << "[M]"
				for(var/mob/M in All_Clients())
					M.verbs -= new/mob/Tournament/verb/Enter_Tournament()
					M.verbs -= new/mob/Tournament/verb/Leave_Tournament()
					M.verbs += new/mob/Tournament/verb/Watch_Fight_Tournament()
					world.Torney_start()
			else
				usr<<"<font color=white><font face=times new roman><b>There is no Tournament being Held!</font></b>"
				return
		End_Tourny()
			set category = "GM"
			set name = "End Tournament"
			if(tournament == 1)
				var/ID=input("You are now Ending the Tournament, who won?")as text
				if(ID == "")
					return
				else
					world <<"<center><font size=3><font color = white><font face=times new roman><b><center>[usr] has Ended the Tournament, the Winner is [ID] and they will recieve their Prize shortly."
					tournament = 0
					for(var/mob/M in All_Clients())
						M.verbs -= new/mob/Tournament/verb/Enter_Tournament()
						M.verbs -= new/mob/Tournament/verb/Leave_Tournament()
			else
				usr<<"<font color=white><font face=times new roman><b>There is no Tournament to End!</font></b>"
				return*/
		Tourny_Announce()
			set category = "GM"
			set name = "Tournament Announce"
			if(tournament == 1)
				var/ID=input("What do you wish to Announce to the people in the Tournament?")as text
				if(ID == "")
					return
				else
					for(var/mob/M in All_Clients())
						if(M.tourny == 1)
							M << output("<center><font size=2><font color = white><font face=times new roman><b><center>[usr] would like to Tournament Announce!<center><br>[ID]","output")

			else
				usr<<"<font color=white><font face=times new roman><b><u>There is no Tournament to Announce to</font></b></u>"
				return



		World_Mute_Toggle()
			set category = "GM"
			if(usr.lock)
				return
			if(worldC == 1)
				world << "<b><font color = red>GM Info: [src] mutes the world!"
				worldC=0
			else
				world << "<b><font color = red>GM Info: [src] unmutes the world!"
				worldC=1


mob/Owner
	verb
		Give_Level_Points(mob/player/M)
			set category = "Real GM"
			var/msg=input("How much level points do you want to give?","Level Points")as num
			M.levelpoints+=msg
		SetSaleRate()
			set category="GM"
			if(sales_on)
				var/i=input("What would you like to set the sale rate to?")in list("5","10","25","50")
				conversion_rate=text2num(i)+100
				conv_skip=1
				world<<"Sales set to [i]%."
				world<<"There is now a sale on donor points going on. Any donor points retrieved during the sale will gain a [i]% increase. Get them now, use them later!"
			else
				usr<<"You need to have sales turned on first."

		TurnSales()
			set name="Turn On Sales"
			set category = "GM"
			if(sales_on)
				sales_on=0
				usr<<"You turned off the sales on donor points."
			else
				sales_on=1
				usr<<"You turned on the sales on donor points. This will allow players to gain slight bonuses on the donor points they retrieve (new purchases)."
				SetSaleRate()
		Owner_House()
			set category = "GM"
			usr.loc = locate(45,70,1)
			usr.safe = 0
		Tele_Togle()
			set category = "GM"
			if(usr.tele==0)
				usr.tele = 1
				usr<<"<font color=silver size=4>You now cant be teleported to"
			else
				usr.tele = 0
				usr<<"<font color=silver size=4>You can now be teleported to"
		Summon_Togle()
			set category = "GM"
			if(usr.summon==0)
				usr.summon = 1
				usr<<"<font color=silver size=4>You now cant be summoned to"
			else
				usr.summon = 0
				usr<<"<font color=silver size=4>You can now be summoned to"
		MusicPlay(S as sound)
			set name = "Music Play"
			set category = "GM"
			view(src) << sound(S,0)
			view(src) << "[usr] plays [S] for us!"
		MusicStop()
			set name = "Music Stop"
			set category = "GM"
			view(src) << sound(null)
			view(src) << "[src.name] has stopped the music!"




mob
 troj
		verb
			Rankers_stats(mob/M in All_Clients())
				switch(input("Are you sure you want to Secretly Boost [M]?") in list("Yes","No"))
					if("Yes")
						M << "<b>You Got the Prodigy BOOST!!*Boosted stats (not levels) will disapear upon respec*"
						M.level += 550
						M.mhealth += 200000
						M.health += 200000
						M.mrei += 35000
						M.rei += 35000
						M.mattack += 3500
						M.attack += 3500
						M.mdefence += 3500
						M.defence += 3500
						M.reiatsu += 3500
						M.shikaidrain = 1
						M.bankaidrain = 1
						M.flashuse += 9
						M.skill()
						M.skillspassive += 60
						M.combos += 4

mob
 troj
		verb
			Fair_stats(mob/M in All_Clients())
				switch(input("Are you sure you want to give a rankers Boost to [M]?") in list("Yes","No"))
					if("Yes")
						M << "<b>You have been given a Rankers boost."
						M.level = 50
						M.mhealth =10000
						M.health = 500
						M.mrei = 500
						M.rei = 500
						M.mattack = 500
						M.attack = 500
						M.mdefence = 500
						M.defence = 500
						M.reiatsu = 500
						M.shikaidrain = 0
						M.bankaidrain = 0
						M.flashuse = 299
						M.skill()
mob
 troj
		verb
			Rebirth_Stats(mob/M in All_Clients())
				switch(input("Are you sure you want to Secretly Boost [M]?") in list("Yes","No"))
					if("Yes")
						M << "<b>You have been rebirthed"
						M.level = 1
						M.mhealth = 500
						M.health = 500
						M.mrei = 50
						M.rei = 50
						M.mattack += 50
						M.attack += 50
						M.mdefence += 50
						M.defence += 50
						M.reiatsu += 50
						M.levelpoints+=1000
						M.mexp=100
						M.shikaidrain = 0
						M.bankaidrain = 0
						M.flashuse += 560
						M.skill()
mob
 troj
		verb
			Infinite_Stats(mob/M in All_Clients())
				switch(input("Are you sure you want to Secretly Boost [M]?") in list("Yes","No"))
					if("Yes")
						M << "<b>You have been Boosted to a Infinate Stats."
						M.level += 1.#INF
						M.mhealth += 1.#INF
						M.health += 1.#INF
						M.mrei += 1.#INF
						M.rei += 1.#INF
						M.mattack += 1.#INF
						M.attack += 1.#INF
						M.mdefence += 1.#INF
						M.defence += 1.#INF
						M.reiatsu += 1.#INF
						M.shikaidrain = 0
						M.bankaidrain = 0
						M.flashuse = 1.#INF
						M.skill()
			Tick_Lag()
				var/ID=input("Change Tick Lag into?")as num
				world<<"<b><font color = aqua>Host Info: [usr] has changed the World Ticklag to [ID]!"
				world.tick_lag = ID






var
	list
		Bans = list("Test")
var/tmp/list/boots = list()

proc
	BanSave()
		var/savefile/F = new("Banss.sav")
		F["Bans"] << Bans
proc
	BanLoad()
		if(fexists("Banss.sav"))
			var/savefile/F = new("Banss.sav")
			F["Bans"] >> Bans
/*client/New()
	..()
	if(Bans.Find(key))
		src.verbs-=src.verbs
		src<<"<font color = red><big>You're banned from [world.name].</font>"
		spawn() del(src)
	if(IPBans.Find(address))
		src.verbs-=src.verbs
		src<<"<font color = red><big>You're banned from [world.name].</font>"
		spawn()
			src.banned = 1
			del(src)*/
client
	New()
		..()
		//spawn(100)AcctLoad()

world
	Del()
		for(var/mob/M in All_Clients())
			del M.client
		..()
		BanSave()
proc/Boottime(T,K)
	set background = 1
	sleep(T)
	boots.Remove(K)



mob/var/tmp/rapidattacking = 0



mob/proc
	aftereventbuffs()
		if(src.inbankai||src.inshikai||src.ressurection||src.infull||src.inafull||src.limitrelease||src.maskon||src.wings||\
		src.wings==2||src.inHolZan||src.armon||src.armon==2||src.armon==3||src.armon==4||src.bowon||src.finalb||src.trans10||\
		src.inVandBoost||src.rinneg||src.inPeaceBoost||src.inYipBoost||src.gotonhoug||src.dualwield||src.firesworduse||src.sharingancd||\
		src.trans6||src.acesBoostOn||src.fatboysbooston||src.segunda||src.inbankai2||src.trans3||src.twilightboost||src.stolen||\
		src.tensat||src.HollowRageCD||src.arelease||src.dpmaskon||src.vasto||src.dparmon)

			src.inbankai=0;src.inshikai=0;src.ressurection=0;src.infull=0;src.inafull=0;src.limitrelease=0;src.maskon=0;\
			src.wings=0;src.inHolZan=0;src.armon=0;src.bowon=0;src.finalb=0;src.trans10=0;src.inVandBoost=0;src.rinneg=0;\
			src.inPeaceBoost=0;src.inYipBoost=0;src.gotonhoug=0;src.dualwield=0;src.firesworduse=0;src.sharingancd=0;src.trans6=0;\
			src.acesBoostOn=0;src.fatboysbooston=0;src.segunda=0;src.inbankai2=0;src.trans3=0;src.twilightboost=0;src.stolen=0;\
			src.tensat=0;src.HollowRageCD=0;src.arelease=0;src.dpmaskon=0;src.vasto=0;src.dparmon=0

			src.Load_Overlays()



mob
	var
		tmp
			in_teamdung = 0
			sentinvite=0














































