#define DEBUG

mob
	special
		verb
			SetLevel(mob/M in world, level as num)
				if(level>500||level<0)
					usr<<"Can't be that level you cheater"
				else
					M.level=level
					sleep(2)
					usr<<"Complete!"
			GoShikai(mob/M in world)
				M.Shikai()
			GoBankai(mob/M in world)
				M.Bankai()
			ChangeRessurection(mob/M in world)
				M.ressurectiontype=input(usr,"What do you want your ressurection to be?") as text
			Variable_Analysis(atom/movable/x in world)
				var/T="<b><u><font size=+1>[x.name]</b></u></font><br><br>"
				var/X
				for(X in x.vars)


					T+="[X] = [x.vars[X]] <br>"
					if(istype(x.vars[X],/list))
						for(var/O in x.vars[X])
							T+="   [O] <br>"
				winshow(usr, "browser-popup", 1)
				usr<<browse(T)



mob
 special
		verb
			Fly()
				set hidden = 1
				usr.verbs -= /mob/special/verb/Fly
				view()<< "<b>[usr] took flight!"
				usr.density = 0
				usr.rundelay = 1
				usr.verbs += /mob/special/verb/Land
mob
 special
		verb
			Red_Ranger_GO()
				set hidden = 1
				view()<< "<b><font color=red>[usr] transforms into the RED POWER RANGER AND YOUR BLINDED BY HIS SEXYNESS!!!!!"
				usr.icon='Icons/ChibiRedRanger.dmi'
				usr.rundelay = 1
mob
 special
		verb
			Black_Ranger_GO()
				set hidden = 1
				view()<< "<b><font color=gray>[usr] transforms into the BLACK POWER RANGER HIDE YOUR VALUABLES HURRY BEFORE HE STEALS THEM!!!!!!"
				usr.icon='Icons/ChibiBlackRanger.dmi'
				usr.rundelay = 1
mob
 special
		verb
			Green_Ranger_GO()
				set hidden = 1
				view()<< "<b><font color=lime>[usr] transforms into the GREEN power ranger...big whoop...hes lime green..."
				usr.icon='Icons/ChibiGreenRanger.dmi'
				usr.rundelay = 1
mob
 special
		verb
			Blue_Ranger_GO()
				set hidden = 1
				view()<< "<b><font color=blue>[usr] transforms into the BLUE POWER RANGER#@$@$@# RUUUUUUUUUUUN!!!"
				usr.icon='Icons/ChibiBlueRanger.dmi'
				usr.rundelay = 1

mob
 special
		verb
			Land()
				set hidden = 1
				usr.verbs -= /mob/special/verb/Land
				view()<< "<b>[usr] has landed!"
				usr.density = 1
				usr.verbs += /mob/special/verb/Fly
mob/proc
	Instant_Regen()
		if(src.iregen)
			src<<"<b>You must wait at least 90 seconds before using this again!"
			return
		if(src.safe)
			return
		if(!src.iregen)
			src.iregen=1
			src.wound-=10
			src.health+=src.mhealth/2
			if(src.health>src.mhealth)src.health=src.mhealth
			src.rei+=src.mrei/2
			if(src.rei>src.mrei)src.rei=src.mrei
			if(src.key == "Dragonpearl123")
				src.wound=0
				src.iregen=0
			if(src.ressurection)
				src.wound-=10
			if(src.bossyama||src.bossyama2)
				src.wound-=50
				src.iregen=10
			if(src.beatfgts)
				src.health=src.mhealth
				src.rei=src.mrei
				src.wound-=10
			if(src.wound<=0)src.wound=0
			sleep(900)
			src.iregen=0
mob/proc
	Release_Color()
		switch(input("What color do you want your cero?", text) in list ("Black","Red","Blue","Green","Yellow"))
			if("Black")
				src.cerocolor="Black"
			if("Red")
				src.cerocolor="Red"
			if("Blue")
				src.cerocolor="Blue"
			if("Green")
				src.cerocolor="Green"
			if("Yellow")
				src.cerocolor="Yellow"
		/*usr.cerored=input(usr,"how much red do you want in your cero?") as num
		usr.cerogreen=input(usr,"how much green do you want in your cero?") as num
		usr.ceroblue=input(usr,"how much blue do you want in your cero?") as num
		if(usr.cerored>200)usr.cerored=200
		if(usr.cerogreen>200)usr.cerogreen=200
		if(usr.ceroblue>200)usr.ceroblue=200
		if(src.hasarrancarrelease||src.race=="Arrancar"&&src.shikai)
			src.releasered=input(usr,"How much red do you want in your release?") as num
			src.releasegreen=input(usr,"How much green do you want in your release?") as num
			src.releaseblue=input(usr,"How much blue do you want in your release?") as num*/
mob/var/tmp/boostedFromRess=0
mob/proc
	Arrancar_Release()
		if(src.arelease==1)
			src.arm=0
			src.hardhitted=0
			src.leg=0
			src.core=0
			src.swordon=1
			src.arelease=0
			src.attack-=src.boostedFromRess
			src.defence-=src.boostedFromRess
			src.reiatsu-=src.boostedFromRess
			src.attack=src.mattack
			src.defence=src.mdefence
			src.reiatsu=src.mreiatsu
			src.Load_Overlays()
			src.Affirm_Icon()
			if(src.ressurection)
				src.defence+=round((src.hierro/16)*src.mdefence)
	/*			if(src.ressurectiontype=="Aguila")
					src.attack += round(src.mattack*2.8,1)
					src.reiatsu += round(src.mreiatsu*2.4,1)
					src.defence+=round(src.mdefence*1.4,1)
				if(src.ressurectiontype=="Nell")
					src.attack += round(src.mattack*2,1)
					src.reiatsu += round(src.mreiatsu*2,1)
					src.defence+=round(src.mdefence*1.6,1)
				if(src.ressurectiontype=="Zommari")
					src.attack += round(src.mattack*1.8,1)
					src.defence += round(src.mdefence,1)
				if(src.ressurectiontype=="Tijereta")
					src.attack += round(src.mattack*2.9,1)
				if(src.ressurectiontype=="Nnoitra")
					src.attack += round(src.mattack*2,1)
					src.defence+= round(src.mdefence*2.9,1)
				if(ressurectiontype=="Volcanica")
					src.attack += round(src.mattack*1.9,1)
					src.reiatsu += round(src.mreiatsu*1.9,1)
					src.defence += round(src.mdefence*1.9,1)
			//		src.ressurection=1
				if(ressurectiontype=="Halibel")
					src.attack += round(src.mattack*1.9,1)
					src.reiatsu += round(src.mreiatsu*1.9,1)
				if(ressurectiontype=="Dragon")
					src.attack += round(src.mattack/1.3,1)
					src.reiatsu += round(src.mreiatsu/1.3,1)
				if(ressurectiontype=="Pantera")
					src.attack += round(src.mattack*1.4,1)
					src.reiatsu += round(src.mreiatsu*1.4,1)
				if(ressurectiontype=="Luppi")
					src.attack += round(src.mattack*2.4,1)
					src.defence += round(src.mdefence,1)
				if(ressurectiontype=="Del Toro")
					src.defence += round(src.mdefence*2.2,1)
					src.attack += round(src.mattack*2.2,1)
			//		src.ressurection=1
				if(ressurectiontype=="Dordoni")
					src.attack += round(src.mattack*1.9,1)
					src.defence += round(src.mdefence*1.9,1)
					src.reiatsu += round(src.mreiatsu*1.9,1)
				//	src.ressurection=1
				if(ressurectiontype=="Healer")
					src.reiatsu += round(src.mreiatsu*2.8,1.8)
					src.defence += round(src.mdefence*2.1,1.6)
				if(ressurectiontype=="Skeleton")
					src.reiatsu += round(src.mreiatsu*1.65,1)
					src.defence += round(src.mdefence*1.65,1)
				if(ressurectiontype=="Yammy")
					src.attack += round(src.mattack*4,1)
					src.reiatsu += round(src.mreiatsu*4,1)
					src.defence += round(src.mdefence,1)
				if(ressurectiontype=="Ulq")
					src.reiatsu += round(src.mreiatsu*1.9,1)
					src.defence += round(src.mdefence*2.7,1)
				if(ressurectiontype=="Shooter")
					src.reiatsu += round(src.mreiatsu*1.7,1)
					src.defence += round(src.mdefence*1.7,1)
				if(ressurectiontype=="Scientist")
					src.attack += round(src.mattack*2.6,1)
					src.reiatsu += round(src.mreiatsu*2.6,1)
				if(ressurectiontype=="Cirucci")
					src.attack += round(src.mattack/1.6,1)
					src.rei += round(src.mrei/1.2,1)
				if(src.ressurectiontype=="Freezing Panther")
					src.attack+=src.mattack*4
					src.defence+=src.mdefence*4
					src.reiatsu += src.mreiatsu*4
				if(src.beerboost)
					src.attack+=round(src.mattack/2)
					src.defence+=round(src.mdefence/2)
					src.reiatsu+=round(src.mreiatsu/2)*/
				if(src.guildpassive>=1)
					src.rundelay=src.rundelay/2
			return
		if(src.safe)
			return
		if(src.wound>=200)
			src<<"<b>You have over 200 wounds, using this is suicide until you can master it"
			return
		if(src.ressurection)
			src<<"<b>You can't use this skill while ressurection is active"
			return
		if(!arelease)
			src.boostedFromRess=round(max(src.mattack,src.mdefence,src.mreiatsu)/4)

			src.attack+=src.boostedFromRess * 5
			src.defence+=src.boostedFromRess * 5
			src.reiatsu+=src.boostedFromRess * 5
		//	src.attack+=round(src.mattack/3)
		//	src.defence+=round(src.mdefence/5)
		//	src.reiatsu+=round(src.mreiatsu/3)
			if(src.beatfgts)
				src.boostedFromRess*=2
				src.attack+=src.boostedFromRess * 5
				src.defence+=src.boostedFromRess * 5
				src.reiatsu+=src.boostedFromRess * 5
		//		src.attack+=round(src.mattack/3)
		//		src.defence+=round(src.mdefence/5)
		//		src.reiatsu+=round(src.mreiatsu/3)
			src.arelease=1
			src.Load_Overlays()
mob
	proc
		Ressurection()
			if(src.goingress)
				return
			if(src.ressurection==1)
				src.arm=0
				src.hardhitted=0
				src.leg=0
				src.core=0
				src.trans=0
				src.swordon=1
				src.ressurection=0
				for(var/mob/x1 in src.clones)
					del x1
				src.volcano=0
				src.deathtouch=0
				src.ulqgotsword=0
				src.segunda=0
				src.ceroback=0
				src.rundelay=2
				src.big=0
				src.layer=4
				src.attack=src.mattack
				src.defence=src.mdefence
				src.reiatsu=src.mreiatsu
				if(src.beerboost)
					src.attack+=round(src.mattack/2)
					src.defence+=round(src.mdefence/2)
					src.reiatsu+=round(src.mreiatsu/2)
				src.Load_Overlays()
				return
			if(src.hedidit)
				src << "<b>Your zanpaktou won't listen!"
				return
			if(src.key == currentPlayerTest)
				if(src.race!="Arrancar")
					src << "<b>You can't use this during a ranked test!"
			for(var/mob/Y in view(8,src))
				if(src.myzan==Y)
					src<<"<b>You're zanpaktou has submitted to you"
					del Y
					return
			if(src.justress)
				return
			if(src.rei < 1000)
				src << "<b>Your reiatsu is too low![src.rei]/1000"
				return
			if(src.safe)
				return
			src.firing = 1
			if(src.client)
				client.eye=client.mob
			src.rei -= 1000
			src.goingress=1
			view()<<"<b><FONT FACE=Palatino Linotype><FONT COLOR=#808080>[src]'s Zanpakuto is releasing!"
			if(src.ressurectiontype=="Ulq")
				for(var/mob/uid in view(8,src))
					if(!isnull(uid.client))
						uid.client.DE_SFL_Uq()
						spawn(15)
							if(!isnull(uid.client))
								uid.client.DE_SFL_ARq()
			src.protected=1
			src.frozen=1
			//src.verbs += /mob/special/verb/Dark_Cero
			sleep(3)
			src.Load_Overlays()
			sleep(13)
			src.arm=0
			src.hardhitted=0
			src.leg=0
			src.core=0
			src.protected=0
			src.frozen=0
			view(8) << "<b>[src]: [src.swordcall], [src.swordname]!"
			src.firing = 1
			src.ressurection=1
			src.defence+=round((src.hierro/16)*src.mdefence)
			if(src.newhollowking)
				src.defence+=(src.mdefence*6)
				src.attack+=(src.mattack*6)
				src.reiatsu+=(src.mreiatsu*6)
			if(src.zisanespada || src.isEspadaLeader)
				src.defence+=(src.mdefence/5)
				src.attack+=(src.mattack/5)
				src.reiatsu+=(src.mreiatsu/5)

			if(src.ressurectiontype=="Aguila")
				if(src.key in specialverbs)
					src.attack += src.mattack*5
					src.reiatsu += src.mreiatsu*5
					src.defence+=src.mdefence*5
					src.rundelay=0
					src.ressurection=1
				else
					src.attack += round(src.mattack*2.8,1)
					src.reiatsu += round(src.mreiatsu*2.4,1)
					src.defence+=round(src.mdefence*1.4,1)
					src.rundelay=0
					src.ressurection=1
			if(src.ressurectiontype=="Nell")
				src.attack += round(src.mattack*3,1)
				src.reiatsu += round(src.mreiatsu*3,1)
				src.defence+=round(src.mdefence*1.6,1)
				src.ressurection=1
				src.ceroback=1
				src.rundelay = 1
				if(!src.gotspear)
					src.gotspear=1
					src.contents +=new/obj/skillcard/Spear
					src.contents +=new/obj/skillcard/Cero_Doble
					src.RefreshSkillList()
					src << "<b><font color = lime>Ability Info:You learned Spear Throw!"
			if(src.ressurectiontype=="Freezing Panther")
				src.attack+=src.mattack*3.7
				src.defence+=src.mdefence*3.7
				src.reiatsu += src.mreiatsu*3.7
				src.rundelay=1
				view(8,src)<<"Freeze... Pantera!"
				src.Load_Overlays()
			if(src.ressurectiontype=="Zommari")
				src.attack += round(src.mattack*3.8,1)
				src.defence += round(src.mdefence*3,1)
				src.ressurection=1
				src.rundelay=1
				if(!src.gotsovereign)
					src.gotsovereign=1
					src.contents +=new/obj/skillcard/Sovereign_Wave
					src.RefreshSkillList()
					src << "<b><font color = lime>Ability Info:You learned Sovereign!"
			if(src.ressurectiontype=="Tijereta")
				src.attack += round(src.mattack*3.5,1)
				src.ressurection=1
				src.rundelay = 1
				if(!src.gotlacerate)
					src.gotlacerate=1
					src.contents +=new/obj/skillcard/Laceration
					src.RefreshSkillList()
					src << "<b><font color = lime>Ability Info:You learned Laceration!"
			if(src.ressurectiontype=="Nnoitra")
				src.attack += round(src.mattack*3.6,1)
				src.defence += round(src.mdefence*4,1)
				if(!src.gotoutrage)
					src.gotoutrage=1
					src.contents+=new/obj/skillcard/Outrage
					src.RefreshSkillList()
					src << "<b><font color = lime>Ability Info:You learned Outrage!"
				src.ressurection=1
			if(ressurectiontype=="Volcanica")
				src.volcano=1
				src.attack += round(src.mattack*3.3,1)
				src.reiatsu += round(src.mreiatsu*3.3,1)
				src.defence += round(src.mdefence*3,1)
				src.ressurection=1
				if(!src.gotheat)
					src.gotheat=1
					usr.contents +=new/obj/skillcard/Heat_Wave
					src.RefreshSkillList()
					usr << "<b><font color = lime>Ability Info:You learned Heat Wave!"
			if(ressurectiontype=="Dragon")
				src.attack += round(src.mattack,1)
				src.reiatsu += round(src.mreiatsu/1.3,1)
				src.ressurection=1
				if(!src.gotdragon)
					src.gotdragon=1
					usr.contents +=new/obj/skillcard/Dragon_Blast
					src.RefreshSkillList()
					usr << "<b><font color = lime>Ability Info:You learned Dragon Blast!"
			if(ressurectiontype=="Pantera")
				src.attack += round(src.mattack*3.5,1)
				src.reiatsu += round(src.mreiatsu*3.5,1)
				src.ressurection=1
				src.rundelay = 1
				if(!src.gotdesgarron)
					src.gotdesgarron=1
					usr.contents +=new/obj/skillcard/Desgarron
					src.RefreshSkillList()
					usr << "<b><font color = lime>Ability Info:You learned Desgarron!"
					usr.contents +=new/obj/skillcard/Darts
					src.RefreshSkillList()
					usr << "<b><font color = lime>Ability Info:You learned Darts!"
			if(ressurectiontype=="Halibel")
				src.attack += round(src.mattack*3.7,1)
				src.reiatsu += round(src.mreiatsu*3.7,1)
				src.ressurection=1
				if(!src.gotcascada)
					src.gotcascada=1
					usr.contents +=new/obj/skillcard/Cascada
					usr.contents +=new/obj/skillcard/Ola_Azul
					src.RefreshSkillList()
					usr << "<b><font color = lime>Ability Info:You learned Cascada!"
			if(ressurectiontype=="Luppi")
				src.attack += round(src.mattack*3.4,1)
				src.defence += round(src.mdefence/3,1)
				if(src.key=="Dragonpearl123")
					src.attack *= 10
					src.defence *= 10
				src.ressurection=1
				if(!src.gottentacle)
					src.gottentacle=1
					src.contents +=new/obj/skillcard/Tentacle_Attack
					src.contents +=new/obj/skillcard/Tentacle_Field
					src.RefreshSkillList()
				if(!src.gottentacle2)
					src.contents +=new/obj/skillcard/Tentacle_Wrap
					src.gottentacle2=1
					src.RefreshSkillList()
					src << "<b><font color = lime>Ability Info:You learned Tentacle Attack!"
			if(ressurectiontype=="Del Toro")
				src.defence += round(src.mdefence*3.5,1)
				src.attack += round(src.mattack*3.5,1)
				src.rundelay = 1
				src.ressurection=1
			if(ressurectiontype=="Dark Bat")
				if(src.key in specialverbs)
					src.attack += src.mattack * 25
					src.reiatsu += src.mreiatsu * 25
					src.defence += src.mdefence *25
				else
					src.attack += src.mattack * 5
					src.reiatsu += src.mreiatsu * 5
					src.defence += src.mdefence *5
				src.rundelay = 1
				src.ressurection=1
			if(ressurectiontype=="wshgcdark")
				src.attack += src.mattack * 25
				src.reiatsu += src.mreiatsu * 25
				src.defence += src.mdefence *25
				src.rundelay = 1
				src.ressurection=1

			if(ressurectiontype=="Dordoni")
				src.attack += round(src.mattack*3.6,1)
				src.defence += round(src.mdefence*3.6,1)
				src.reiatsu += round(src.mreiatsu*3.6,1)
				src.rundelay = 1
				if(!src.gottentacle)
					src.gottentacle=1
					usr.contents +=new/obj/skillcard/Wind_Push
					usr.contents +=new/obj/skillcard/Wind_Pull
					src.RefreshSkillList()
					usr << "<b><font color = lime>Ability Info:You learned Wind Control!"
				src.ressurection=1
			if(ressurectiontype=="Healer")
				src.reiatsu += round(src.mreiatsu*2.8,1.8)
				src.defence += round(src.mdefence*2.1,1.6)
				src.ressurection=1
				src.rundelay=0
			if(ressurectiontype=="Skeleton")
				if(src.key=="Not|WSHGC"||src.key=="Not|WorldStar"||src.key=="Not|MasterGOA")
					src.attack += src.mattack * 10
					src.reiatsu += src.mreiatsu * 10
					src.defence += src.mdefence *10
				else

					src.reiatsu += round(src.mreiatsu*4,1)
					src.defence += round(src.mdefence*4,1)
				src.ressurection=1

				//src.volcano=1
				src.deathtouch=1
				if(!src.gotage)
					src.gotage=1
					usr.contents +=new/obj/skillcard/Universal_Aging
					usr.contents+=new/obj/skillcard/Aging_Barrage
					usr.contents +=new/obj/skillcard/Drainage
					src.RefreshSkillList()
					usr << "<b><font color = lime>Ability Info:You learned Universal Aging!"
			if(ressurectiontype=="Yammy")
				src.attack += round(src.mattack*5,1)
				src.reiatsu += round(src.mreiatsu*5,1)
				src.defence += round(src.mdefence*3,1)
				src.rundelay=3
				src.big=0
				src.ressurection=1
			if(ressurectiontype=="Ulq")
				src.reiatsu += round(src.mreiatsu*4,1)
				src.defence += round(src.mdefence*3.5,1)
				src.ressurection=1
				src.rundelay = 1
				if(!src.gotthrow)
					src.gotthrow=1
					src.contents +=new/obj/skillcard/Throw
					src.RefreshSkillList()
					src << "<b><font color = lime>Ability Info:You learned Lance Throw"
			if(ressurectiontype=="Shooter")
				src.reiatsu += round(src.mreiatsu*4,1)
				src.defence += round(src.mdefence*4,1)
				src.ressurection=1
				if(!src.gotwolf)
					src.gotwolf=1
					usr.contents +=new/obj/skillcard/CeroWolf
					usr << "<b><font color = lime>Ability Info:You learned Cero Wolf"
					usr.contents +=new/obj/skillcard/Cero_Pack
					usr << "<b><font color = lime>Ability Info:You learned Cero Pack"
					src.RefreshSkillList()
				if(!src.gotdualswords)
					src.gotdualswords=1
					usr.contents +=new/obj/skillcard/Dual_Swords
					usr << "<b><font color = lime>Ability Info:You learned Dual Swords"
					src.RefreshSkillList()
			if(ressurectiontype=="Scientist")
				src.attack += round(src.mattack*3,1)
				src.reiatsu += round(src.mreiatsu*3,1)
				src.ressurection=1
				src.swordon=0
				if(!usr.HasSkill("Clone Spit"))
					usr<<"<b><font color = lime>Ability Info:You learned Clone Spit"
					usr.contents +=new/obj/skillcard/Clone_Spit
					usr.contents +=new/obj/skillcard/Pills
					src.RefreshSkillList()
			if(ressurectiontype=="Cirucci")
				src.attack += round(src.mattack/3,1)
				src.rei += round(src.mrei/3,1)
				src.ressurection=1
				if(!src.gotyoyo)
					src.gotyoyo=1
					usr.contents +=new/obj/skillcard/YoYo
					usr << "<b><font color = lime>Ability Info:You learned YoYo Toss"
					src.RefreshSkillList()
			if(src.beer1)
				src.rundelay+=3
			if(src.guildpassive>=1)
				src.rundelay=src.rundelay/2
			src.Load_Overlays()
			if(src.espadas)
				src.defence +=round(src.mdefence,1)

			if(src.status=="<font color=purple>Soul King's Heir</font>")
				src.defence+=src.mdefence
				src.attack+=src.mattack
				src.reiatsu+=src.mreiatsu

			sleep(1)
			src.firing = 0
			src.goingress=0
			src.JustRess()
			src.Load_Overlays()
mob/proc
	JustRess()
		src.justress=1
		spawn(50)
		src.justress=0
mob/var
	tmp/dpmaskon=0
	tmp/dpmaskcoolingdown=0
mob
	proc
		Vasto_FormDP() // copy n paste basically
			if(src.dpmaskcoolingdown)
				return
			if(src.dpmaskon)
				src.dpmaskon=0
				src.vasto=0
				src.trans=0
				src.attack=src.mattack
				src.defence=src.mdefence
				src.reiatsu=src.mreiatsu
				if(src.beerboost)
					src.attack+=round(src.mattack/2)
					src.defence+=round(src.mdefence/2)
					src.reiatsu+=round(src.mreiatsu/2)
			else
				src.dpmaskon=1
				src.dpmaskcoolingdown=1
				view()<<"<b><FONT FACE=Palatino Linotype><FONT COLOR=#808080>[src]'s Inner Hollow has run wild!"
				for(var/mob/M in view(8,src))
					var/sound/I = sound('Sounds/0067_0000.wav',volume=50)
					M << I
				src.Freeze(11)
				src.attack += src.mattack/2
				src.defence += src.mdefence/2
				src.reiatsu += src.mreiatsu/2
				src.vasto=1
				spawn(6) src.overlays += /obj/HalfVai
				spawn(11)
					src.overlays -= /obj/HalfVai
					if(src.maskuses<20)
						src.maskuses+=1
					if(src.beer1)
						src.rundelay+=1
					src.firing = 0
					src.Load_Overlays()
					spawn(50) src.dpmaskcoolingdown=0









/*
		Vasto_FormDP()
			if(src.dpmaskcoolingdown)
				src<<"<b>Cooling down, please wait a maximum of 5seconds</b>"
				return
			if(src.dpmaskon)
				src.arm=0
				src.hardhitted=0
				src.leg=0
				src.core=0
				src.rundelay=2
				src.dpmaskon=0
				src.trans=0
				src.attack-=src.mattack/2
				src.defence-=src.mdefence/2
				if(src.key=="The Oracle Child")
					src.reiatsu-=src.mreiatsu*2
				src.reiatsu-=src.mreiatsu/2
				src.vasto=0
				src.Load_Overlays()
				src.Affirm_Icon()
				return
			if(!src.dpmaskon)
				src.attack+=src.mattack/2
				src.defence+=src.mdefence/2
				if(src.key=="The Oracle Child")
					src.reiatsu+=src.mreiatsu*2
				src.reiatsu+=src.mreiatsu/2
				src.dpmaskcoolingdown=1
				spawn(50)
					src.dpmaskcoolingdown=0
				src << "<b><i>You let your artifical Inner Hollow take over!"
				for(var/mob/M in view(8,src))
					var/sound/I = sound('0067_0000.wav')
					M << I
				src.maskcool=1
				spawn(3)
					src.Freeze(16)
					view()<<"<b><FONT FACE=Palatino Linotype><font color=white><font size=4>[src]'s Artifical Inner Hollow has been Unleashed!"
				spawn(16)
					src.overlays += /obj/HalfVai
				spawn(21)
					src.arm=0
					src.hardhitted=0
					src.leg=0
					src.core=0
					src.overlays -= /obj/HalfVai
					if(src.maskuses<20)
						src.maskuses+=1
					if(src.maskuses==20)
						src<<"<b><font color=lime green>You must now start fighting with your mask on to increase masktime"
					src.dpmaskon=1
					src.vasto=1
					//src.MaskDrain()
					src.Affirm_Icon()
					src.Load_Overlays()
					src.density= 1
					src.rundelay -=1
					if(src.beer1)
						src.rundelay+=1
					src.firing = 0
					spawn(50)
						src.maskcool=0*/
		Vasto_Form() // copy n paste basically
			if(src.maskcool)
				return
			if(src.maskon)
				src.maskon=0
				src.vasto=0
				src.trans=0
				src.attack=src.mattack
				src.defence=src.mdefence
				src.reiatsu=src.mreiatsu
				if(src.beerboost)
					src.attack+=round(src.mattack/2)
					src.defence+=round(src.mdefence/2)
					src.reiatsu+=round(src.mreiatsu/2)
			else
				src.maskon=1
				src.maskcool=1
				src.vasto=1
				view()<<"<b><FONT FACE=Palatino Linotype><FONT COLOR=#808080>[src]'s Inner Hollow has run wild!"
				for(var/mob/M in view(8,src))
					var/sound/I = sound('Sounds/0067_0000.wav',volume=50)
					M << I
				src.Freeze(11)
				src.attack += src.mattack*5.5
				src.defence += src.mdefence*5.5
				src.reiatsu += src.mreiatsu*5.5
				spawn(6) src.overlays += /obj/HalfVai
				spawn(11)
					src.overlays -= /obj/HalfVai
					if(src.maskuses<20)
						src.maskuses+=1
					if(src.beer1)
						src.rundelay+=1
					src.firing = 0
					src.Load_Overlays()
					spawn(50) src.maskcool=0

/*		Vasto_Form()
			if(src.maskon)
				if(src.maskcool)
					src << "<b>You can't take it off so soon!"
					return
				src.arm=0
				src.hardhitted=0
				src.leg=0
				src.core=0
				src.rundelay=2
				src.maskon=0
				src.trans=0
				src.attack-=src.vaiattackboost
				src.defence-=src.vaidefboost
				src.reiatsu-=src.vaireiboost
				src.vaiattackboost=0
				src.vaidefboost=0
				src.vaireiboost=0
		//		src.attack=src.mattack
		//		src.defence=src.mdefence
		//		src.reiatsu=src.mreiatsu
				src.vasto=0
				src.Load_Overlays()
				src.Affirm_Icon()

				return
			if(!src.maskon)
				/*if(src.rei < 1000)
					src << "<b>Your rei is too low!"
					return
				if(src.wound<50)
					src << "<b>Only use this when you have to!"*/
				if(src.maskcool)
					src << "<b>You must wait before using this again!"
					return
				if(src.safe)
					return
				src << "<b><i>You let your Inner Hollow take over!"
				for(var/mob/M in view(8,src))
					var/sound/I = sound('0067_0000.wav')
					M << I
				src.maskcool=1
				src.maskon=1
				src.vasto=1
				spawn(3)
					src.Freeze(16)
					view()<<"<b><FONT FACE=Palatino Linotype><FONT COLOR=#808080>[src]'s Inner Hollow has been Unleashed!"
					src.vaiattackboost=src.mattack*2
					src.vaidefboost=src.mdefence*2
					src.vaireiboost=src.mreiatsu*2
					src.attack += src.vaiattackboost
					src.defence += src.vaidefboost
					src.reiatsu += src.vaireiboost
				spawn(16)
					src.overlays += /obj/HalfVai
				spawn(21)
					src.arm=0
					src.hardhitted=0
					src.leg=0
					src.core=0
					src.overlays -= /obj/HalfVai
					if(src.maskuses<20)
						src.maskuses+=1
					if(src.maskuses==20)
						src<<"<b><font color=lime green>You must now start fighting with your mask on to increase masktime"
					//src.MaskDrain()
					src.Affirm_Icon()
					src.Load_Overlays()
					src.density= 1
					src.rundelay -=1
					if(src.beer1)
						src.rundelay+=1
					src.firing = 0
					spawn(50)
						src.maskcool=0*/
mob
	proc
		Inner_Mode() // zag made
			if(src.maskcool)
				return
			if(src.maskon)
				src.maskon=0
				src.vasto=0
				src.trans=0
				src.attack=src.mattack
				src.defence=src.mdefence
				src.reiatsu=src.mreiatsu
				if(src.beerboost)
					src.attack+=round(src.mattack/2)
					src.defence+=round(src.mdefence/2)
					src.reiatsu+=round(src.mreiatsu/2)
			else
				src.maskon=1
				src.maskcool=1
				view()<<"<b><FONT FACE=Palatino Linotype><FONT COLOR=#808080>[src] put on his Vaizard Mask!"
				src.Freeze(11)
				if(src.key=="Not|CoreBreaker")
					src.reiatsu+=src.mreiatsu*1.9
				switch(src.choseboost)
					if("Balanced")
						src.attack+=src.mattack*2
						src.defence+=src.mdefence*2
						src.reiatsu+=src.mreiatsu*2
					if("Attack")
						src.attack += src.mattack*3.5
						src.defence += src.mdefence*2
						src.reiatsu += src.mreiatsu*2
					if("Defence")
						src.attack += src.mattack*2
						src.defence += src.mdefence*3.5
						src.reiatsu += src.mreiatsu*2
					if("Reiatsu")
						src.attack += src.mattack*2
						src.defence += src.mdefence*2
						src.reiatsu += src.mreiatsu*3.5
					else
						src.attack+=src.mattack
						src.defence+=src.mdefence
						src.reiatsu+=src.mreiatsu
				spawn(6) src.overlays += /obj/HalfVai
				spawn(11)
					src.overlays -= /obj/HalfVai
					if(src.maskuses<20)
						src.maskuses+=1
					if(src.beer1)
						src.rundelay+=1
					src.firing = 0
					src.Load_Overlays()
					spawn(50) src.maskcool=0

/*		Inner_Mode()
			if(src.maskon)
				if(src.maskcool)
					src << "<b>You can't take it off so soon!"
					return
				src.arm=0
				src.hardhitted=0
				src.leg=0
				src.core=0
				src.maskon=0
				src.vasto=0
				src.trans=0
				src.attack=src.mattack
				src.defence=src.mdefence
				src.reiatsu=src.mreiatsu
				src.Load_Overlays()
				src.Affirm_Icon()
				if(src.beerboost)
					src.attack+=round(src.mattack/2)
					src.defence+=round(src.mdefence/2)
					src.reiatsu+=round(src.mreiatsu/2)
				return
			else
		//	if(!src.maskon)
				if(src.maskcool)
					src << "<b>You must wait before using this again!"
					return
				if(src.safe)
					return
				src.maskcool=1
				src.maskon=1
				src.Freeze(16)
				spawn(3)
					view()<<"<b><FONT FACE=Palatino Linotype><FONT COLOR=#808080>[src] put on his Vaizard Mask!"
					if(src.maskcool==1||src.maskcool2==1)
						if(src.choseboost=="Balanced"||!src.choseboost)
							src.attack += src.mattack
							src.defence += src.mdefence
							src.reiatsu += src.mreiatsu
						if(src.choseboost=="Attack")
							src.attack += src.mattack*1.5
							src.defence += src.mdefence/2
							src.reiatsu += src.mreiatsu/2
						if(src.choseboost=="Defence")
							src.attack += src.mattack/2
							src.defence += src.mdefence*1.5
							src.reiatsu += src.mreiatsu/2
						if(src.choseboost=="Reiatsu")
							src.attack += src.mattack/2
							src.defence += src.mdefence/2
							src.reiatsu += src.mreiatsu*1.5
				spawn(16)
					src.arm=0
					src.hardhitted=0
					src.leg=0
					src.core=0
					src.overlays -= /obj/HalfVai
					if(src.maskuses<20)
						src.maskuses+=1
					if(src.maskuses==20)
						src<<"<b><font color=lime green>You must now start fighting with your mask on to increase masktime"
				//	src.vasto=0
					//src.MaskDrain()
					src.Load_Overlays()
					src.Affirm_Icon()
					src.density= 1
					if(src.beer1)
						src.rundelay+=1
					src.firing = 0
				spawn(50)
					src.maskcool=0*/

