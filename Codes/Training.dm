

obj
 vaion
		icon = 'Icons/vaizardon.dmi'
		layer = 124
		zer = 1
		New()
			spawn(7)
			del src
mob
 var
		masktime = 100





obj
 inoueshield
		icon = 'Icons/inoueshield.dmi'
		zer = 1
		density=1
		layer=300
		New()
			for(var/mob/M in view(0,src))
				if(!M.ko)
					M.frozen=1
					M.protected=1
					M.canattacks=1
					src.ppl+=M
			sleep(80)
			del src
		Del()
			for(var/mob/M in view(0,src))
				M.frozen=0
				M.protected=0
				M.canattacks=0
				M.shelda=0
			for(var/mob/M in ppl)
				M.frozen=0
				M.protected=0
				M.canattacks=0
				M.shelda=0
			..()
		var/list/ppl=new
obj
	bloodshield
		icon = 'Icons/bloodmistshield.dmi'
		density=1
		zer = 1
		layer=12
		Del()
			flick("del",src)
			sleep(6)
			..()
obj
 kidocorpheal
		icon = 'Icons/HealingBarrier.dmi'
		icon_state="on"
		layer = 69
		New()
			var/q = 0
			spawn(1)
			scab
				if(q > 13)
					del src
				q += 1
				var/mob/O=src.Gowner
				for(var/mob/M in oview(src,0))
					if(M.lost&&lastevent==5||M.lost&&lastevent==4)
						if(O.race=="Kido Corps")
							M.health += O.defence*0.5
							view(M,8) << "<b><font color = white>[M] is being healed by [src] for [O.reiatsu*0.5] health!"
						else
							M.health += O.defence*0.3
							view(M,8) << "<b><font color = white>[M] is being healed by [src] for [O.reiatsu*0.3] health!"
					else
						M.health += O.defence*1.2
						M.wound-=rand(0,2)
					view(M,8) << "<b><font color = white>[M] is being healed by [src] for [O.reiatsu*1.2] health!"
					M.rei += O.mrei/20
					if(M.health >= M.mhealth)M.health = M.mhealth
					if(M.rei >= M.mrei)M.rei = M.mrei
					if(M.wound < 0)M.wound=0
				spawn(10)
					goto scab
obj
	dungeonaoeheal
		New()
			var/q = 0
			spawn(1)
			scab
				if(q > 13)
					del src
				q += 1
				var/mob/O=src.Gowner
				for(var/mob/M in view(src,1))
					if(M.z==27||M.z==28)
						if(M.dteamid == O.dteamid)
							M.overlays+=new/obj/Heal_Overlay/bl
							M.overlays+=new/obj/Heal_Overlay/br
							M.overlays+=new/obj/Heal_Overlay/tl
							M.overlays+=new/obj/Heal_Overlay/tr
							M.health += M.mhealth*0.02
							M.wound-=rand(0,1)
							M.rei += O.mrei/30
							view(M,8) << "<b><font color = #FFBF00>[M] got healed by AOE Heal for [M.mhealth*0.02] health!"
							if(M.health >= M.mhealth)M.health = M.mhealth
							if(M.rei >= M.mrei)M.rei = M.mrei
							if(M.wound < 0)M.wound=0
							spawn(5)
								M.overlays-=/obj/Heal_Overlay/bl
								M.overlays-=/obj/Heal_Overlay/br
								M.overlays-=/obj/Heal_Overlay/tl
								M.overlays-=/obj/Heal_Overlay/tr
				spawn(10)
					goto scab
obj
 inoueheal
		icon = 'Icons/inoueheal.dmi'
		layer = 69
		New()
			var/q = 0
			spawn(1)
			scab
				if(q > 13)
					del src
				q += 1
				var/mob/O=src.Gowner
				for(var/mob/M in oview(src,0))
					if(M.z==27||M.z==28)
						if(M.dteamid == O.dteamid)
							M.health += O.mhealth*0.0006
							M.wound-=rand(0,1)
							M.rei += O.mrei/20
							view(M,8) << "<b><font color = #FFBF00>[M] got healed by Souten Kissun for [O.mhealth*0.0006] health!"
							if(M.health >= M.mhealth)M.health = M.mhealth
							if(M.rei >= M.mrei)M.rei = M.mrei
							if(M.wound < 0)M.wound=0
							spawn(10)
							goto scab
					else
						if(M.lost&&lastevent==5||M.lost&&lastevent==4)
							M.health += O.defence*0.5
							view(M,8) << "<b><font color = #FFBF00>[M] got healed by Souten Kissun for [O.defence*0.5] health!"
						else
							M.health += O.defence*1.2
							M.wound-=rand(0,2)
							view(M,8) << "<b><font color = #FFBF00>[M] got healed by Souten Kissun for [O.defence*1.2] health!"
						M.rei += O.mrei/20
						if(M.health >= M.mhealth)M.health = M.mhealth
						if(M.rei >= M.mrei)M.rei = M.mrei
						if(M.wound < 0)M.wound=0
				spawn(10)
					goto scab

mob
	proc
		Blood_Mist()
			if(usr.inoueshield)
				usr << "You can't use this while its active"
				return
			if(usr.inouecool)
				usr << "You must wait a few seconds before using it again"
				return
			if(!usr.inouecool)
				usr.inoueshield = 1
				usr.inouecool=1
				usr.protected = 1
				usr.inoueshield = 1