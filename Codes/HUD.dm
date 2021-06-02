CHECK
obj
	updatelog
	//	screen_loc = "15,17"
		icon='Icons/UI2 Buttons.dmi'
		icon_state = "update"
		layer = 97
		Click()
			usr.UpdateLog()
	skill_tree
		screen_loc = "16,17"
		icon='Icons/UI2 Buttons.dmi'
		icon_state = "Tree"
		layer = 97
		Click()
			usr.GoCust()
	NewHud
		icon='Icons/Health Bar3.png'
		layer = 97
		s1
			screen_loc = "1,16"
			icon_state = "0,0"
		s2
			screen_loc = "2,16"
			icon_state = "1,0"
		s3
			screen_loc = "3,16"
			icon_state = "2,0"
		s4
			screen_loc = "4,16"
			icon_state = "3,0"
		a1
			screen_loc = "1,17"
			icon_state = "0,1"
		a2
			screen_loc = "2,17"
			icon_state = "1,1"
		a3
			screen_loc = "3,17"
			icon_state = "2,1"
		a4
			screen_loc = "4,17"
			icon_state = "3,1"

mob/verb
	Whisper()
	//	set hidden=1
		if(usr.muted)
			alert("You are muted!")
			return
		var/varPeople = list()
		for(var/mob/player/T in All_Clients())
			varPeople += T
		var/M = input("Who would you wish to whisper to?","Whisper") in varPeople + list("Cancel")
		if(M == "Cancel")
			return
		var/msg=input("What do you wish to whisper to [M]?")as text
		if(M == usr)
			M <<"<b><font size = 1>You cannot whisper to yourself"
			return
		if(length(msg) >= 200)
			alert("Your message is too long.")
			return
		else
			msg = Replace_All(msg,chat_filter)
			msg=S.ParseHTML(msg)
			usr <<output("<b><font size = 1><font color = white>You whisper to [M]:<font color = white> [msg]","output")
			M <<output("<b><font size = 1><font color = white>[usr] whisper to [M]:<font color = white> [msg]","output")

obj
 wing1
		icon = 'Icons/quincyfinalwing.dmi'
		icon_state = "1"
		pixel_x = -32

obj/skillcard
	Ressurection
		names = "Ressurection"
		icon = 'gui.dmi'
		icon_state = "ressurection"
		layer = MOB_LAYER+100
		Click()
			if(istype(usr,/mob/player))
				usr.Arrancar_Release()

obj/skillcard
	shikai
		names = "Shikai"
		icon = 'gui.dmi'
		screen_loc = "16,1"
		icon_state = "shikai"
		layer = MOB_LAYER+100
		Click()
			if(istype(usr,/mob/player))
				usr.Shikai()

obj
	map
		name = "Map"
		icon = 'Icons/UI2 Buttons.dmi'
		screen_loc = "17,17"
		icon_state = "Map"
		layer = 90
		Click()
			if(istype(usr,/mob/player))
				switch(input("Which map would you like to look at?", text) in list ("Karakura Town","Ultimate Forest","Soul Society","Hueco Mundo","Las Noches","Rukongai","Southern Karakura Town","Other","Cancel"))
					if("Cancel")return
					if("Karakura Town")usr.GoCust10()
					if("Ultimate Forest")usr.GoCust11()
					if("Soul Society")usr.GoCust12()
					if("Hueco Mundo")usr.GoCust13()
					if("Las Noches")usr.GoCust14()
					if("Other")usr.GoCust15()
					if("Rukongai")usr.GoCust17()
					if("Southern Karakura Town")usr.GoCust18()
obj
 distrib
		name = "Help"
		icon = 'Icons/UI2 Buttons.dmi'
		screen_loc = "3,15"
		icon_state = "Distribute"
		layer = 90
		Click()
			if(istype(usr,/mob/player))
				switch(input("Which stat do you wish to put up.", text) in list ("Attack","Defence","Reiatsu(Damage)","Rei(Energy)","Cancel"))
					if("Attack")
						var/a
						a=input(usr,"Attack: [usr.mattack] Level Points: [usr.levelpoints]") as num
						if(a>usr.levelpoints)
							a=usr.levelpoints
						if(a<=0)
							a=0
						if(usr.mattack+a>(usr.level)*10+100+usr.rawbuff)
							usr<<"'Attack' cannot exceed [(usr.level)*10+100+usr.rawbuff](5/8 cap) at your current level."
							a=((usr.level)*10+100+usr.rawbuff)-usr.mattack
						usr.levelpoints-=a
						usr.mattack+=a
						usr.attack+=a
						usr.skillpoints+=a
					if("Defence")
						var/a
						a=input(usr,"Defence: [usr.mdefence] Level Points: [usr.levelpoints]") as num
						if(a>usr.levelpoints)
							a=usr.levelpoints
						if(a<=0)
							a=0
						if(usr.mdefence+a>(usr.level)*10+100+usr.rawbuff)
							usr<<"'Defence' cannot exceed [(usr.level)*10+100+usr.rawbuff](5/8 cap) at your current level."
							a=((usr.level)*10+100+usr.rawbuff)-usr.mdefence
						usr.levelpoints-=a
						usr.mdefence+=a
						usr.defence+=a
						usr.health+=a*40
						usr.mhealth+=a*40
						usr.skillpoints+=a
					if("Reiatsu(Damage)")
						var/a
						a=input(usr,"Reiatsu: [usr.mreiatsu] Level Points: [usr.levelpoints]") as num
						if(a>usr.levelpoints)
							a=usr.levelpoints
						if(a<=0)
							a=0
						if(usr.mreiatsu+a>(usr.level)*10+100+usr.rawbuff)
							usr<<"'Reiatsu' cannot exceed [(usr.level)*10+100+usr.rawbuff](5/8 cap) at your current level."
							a=((usr.level)*10+100+usr.rawbuff)-usr.mreiatsu
						usr.levelpoints-=a
						usr.mreiatsu+=a
						usr.reiatsu+=a
						usr.skillpoints+=a
					if("Rei(Energy)")
						var/a
						a=input(usr,"Rei: [usr.mrei] Level Points: [usr.levelpoints]") as num
						if(a>usr.levelpoints)
							a=usr.levelpoints
						if(a<=0)
							a=0
						usr.levelpoints-=a
						usr.mrei+=a*5
						usr.skillpoints+=a



obj
 help
		name = "Help"
		icon = 'Icons/UI2 Buttons.dmi'
		screen_loc = "4,15"
		icon_state = "Guide"
		layer = 90
		Click()
			if(istype(usr,/mob/player))
				usr.GoCust3()
			usr<<output("Here are the new rules for the game.The new rules are as follows:","output")
			usr<<output("1.No excessive caps in OOC. Note: You can still use caps","output")
			usr<<output("2.No racism.","output")
			usr<<output("3.No spam.","output")
			usr<<output("4.No pornographic links or pics.","output")
			usr<<output("5.No excessive raging.","output")
			usr<<output("6.No GM or player disrespect.","output")
		//	usr<<output("8.No multi-keying.","output")
	//		usr<<output("9.No PvP in the middle of Crossroads.","output")
			usr<<output("10.No using GM help for ludicrous reasons.","output")
			usr<<output("11.No PvP in the purple portal without the other person's consent(ONLY IN THE PURPLE PORTAL).","output")
			usr<<output("12.Refrain from killing players below the level of 150.","output")
			usr<<output("13.No blocking doors or entrances with moves(ie. game trap, tousen bankai etc).","output")
			usr<<output("14.No camping spawns DO NOT KILL SPAM PEOPLE.","output")
			usr<<output("15.Listen to all GMs, if they say stop you stop. No talking back no nothing just do it.","output")
			usr<<output("16.No bug abusing. If you happen to find a bug, inform a GM immediately.","output")
		//	usr<<output("17. NO USING ACCELERATION OR ANY SUPER SPEED BOOST WHEN HOLDING THE FLAG IN CAPTURE THE FLAG.","output")
			usr << browse("http://soulwarz.forumotion.com//  ^^copy and paste link into wwa bowser ^^")
			winshow(usr,"browsewindow",2)
			src<<browse_link("http://soulwarz.forumotion.com//",usr)
proc/browse_link(url,recipient,browse_options)
    recipient << browse(\
"<html><head></head><body onLoad=\"parent.location='[url]'\"></body></html>"\
,browse_options)
obj/skillcard
	bankai
		names = "Bankai"
		icon = 'gui.dmi'
		icon_state = "bankai skill"
		layer = 5
		Click()
			if(istype(usr,/mob/player))
				usr.Bankai()



obj
 nikkaku1
		icon_state = "1"
		icon = 'Icons/ikkakubankai.dmi'
		pixel_x=-16
		pixel_y=-30
		layer = 11
 nikkaku2
		icon_state = "2"
		icon = 'Icons/ikkakubankai.dmi'
		pixel_x=16
		pixel_y=-30
		layer = 11
 nikkaku3
		icon_state = "3"
		icon = 'Icons/ikkakubankai.dmi'
		pixel_x=-16
		pixel_y=2
		layer = 11
 nikkaku4
		icon_state = "4"
		icon = 'Icons/ikkakubankai.dmi'
		pixel_x=16
		pixel_y=2
		layer = 11
 nikkaku5
		icon_state = "5"
		icon = 'Icons/ikkakubankai.dmi'
		pixel_x=-16
		pixel_y=34
		layer = 11
 nikkaku6
		icon_state = "6"
		layer = 11
		icon = 'Icons/ikkakubankai.dmi'
		pixel_x=16
		pixel_y=34
 nikkaku3d1
		icon_state = "3 1"
		icon = 'Icons/ikkakudragon.dmi'
		pixel_x=-16
		pixel_y=2
		layer = 12
 nikkaku4d1
		icon_state = "4 1"
		icon = 'Icons/ikkakudragon.dmi'
		pixel_x=16
		pixel_y=2
		layer = 12
 nikkaku5d1
		icon_state = "5 1"
		icon = 'Icons/ikkakudragon.dmi'
		pixel_x=-16
		pixel_y=34
		layer = 12
 nikkaku6d1
		icon_state = "6 1"
		layer = 12
		icon = 'Icons/ikkakudragon.dmi'
		pixel_x=16
		pixel_y=34
 nikkaku3d2
		icon_state = "3 2"
		icon = 'Icons/ikkakudragon.dmi'
		pixel_x=-16
		pixel_y=2
		layer = 12
 nikkaku4d2
		icon_state = "4 2"
		icon = 'Icons/ikkakudragon.dmi'
		pixel_x=16
		pixel_y=2
		layer = 12
 nikkaku5d2
		icon_state = "5 2"
		icon = 'Icons/ikkakudragon.dmi'
		pixel_x=-16
		pixel_y=34
		layer = 12
 nikkaku6d2
		icon_state = "6 2"
		layer = 12
		icon = 'Icons/ikkakudragon.dmi'
		pixel_x=16
		pixel_y=34
 nikkaku3d3
		icon_state = "3 3"
		icon = 'Icons/ikkakudragon.dmi'
		pixel_x=-16
		pixel_y=2
		layer = 12
 nikkaku4d3
		icon_state = "4 3"
		icon = 'Icons/ikkakudragon.dmi'
		pixel_x=16
		pixel_y=2
		layer = 12
 nikkaku5d3
		icon_state = "5 3"
		icon = 'Icons/ikkakudragon.dmi'
		pixel_x=-16
		pixel_y=34
		layer = 12
 nikkaku6d3
		icon_state = "6 3"
		layer = 12
		icon = 'Icons/ikkakudragon.dmi'
		pixel_x=16
		pixel_y=34
 nikkaku3d4
		icon_state = "3 4"
		icon = 'Icons/ikkakudragon.dmi'
		pixel_x=-16
		pixel_y=2
		layer = 12
 nikkaku4d4
		icon_state = "4 4"
		icon = 'Icons/ikkakudragon.dmi'
		pixel_x=16
		pixel_y=2
		layer = 12
 nikkaku5d4
		icon_state = "5 4"
		icon = 'Icons/ikkakudragon.dmi'
		pixel_x=-16
		pixel_y=34
		layer = 12
 nikkaku6d4
		icon_state = "6 4"
		layer = 12
		icon = 'Icons/ikkakudragon.dmi'
		pixel_x=16
		pixel_y=34
 ikkaku7
		icon_state = "1,0"
		icon = 'Icons/ikkakubankai.dmi'
		pixel_x=-32
		pixel_y=-32
		layer = 111
 ikkaku8
		icon_state = "2,0"
		icon = 'Icons/ikkakubankai.dmi'
		pixel_y=-32
		layer = 111
 ikkaku9
		icon_state = "3,0"
		pixel_y=-32
		pixel_x=032
		layer = 111
		icon = 'Icons/ikkakubankai.dmi'
obj
 bankai1
		icon_state = "3,1"
		icon = 'Icons/bankai.dmi'
		pixel_x=32
		layer = 111
 bankai2
		icon_state = "1,1"
		icon = 'Icons/bankai.dmi'
		pixel_x=-32
		layer = 111
obj
 bankai3
		icon_state = "3,2"
		icon = 'Icons/bankai.dmi'
		pixel_x=32
		pixel_y=32
		layer = 111
 bankai4
		icon_state = "1,2"
		icon = 'Icons/bankai.dmi'
		pixel_x=-32
		pixel_y=32
		layer = 111
 bankai5
		icon_state = "2,2"
		icon = 'Icons/bankai.dmi'
		pixel_y=32
		layer = 111
 bankai6
		icon_state = "2,1"
		layer = 111
		icon = 'Icons/bankai.dmi'
obj/newbankaiaura
	icon='Icons/new bankai aura.dmi'
	layer=111
	BL
		icon_state="0,0"
		pixel_x=-32
	B
		icon_state="1,0"
	BR
		icon_state="2,0"
		pixel_x=32
	BL2
		icon_state="0,1"
		pixel_x=-32
		pixel_y=32
	B2
		icon_state="1,1"
		pixel_y=32
	BR2
		icon_state="2,1"
		pixel_x=32
		pixel_y=32
	BL3
		icon_state="0,2"
		pixel_y=64
		pixel_x=-32
	B3
		icon_state="1,2"
		pixel_y=64
	BR3
		icon_state="2,2"
		pixel_y=64
		pixel_x=32

mob
	proc
		Dark_Pit()
			if(usr.trappingcd)
				src<<"You must wait at least 2 minutes"
				return
			if(!usr.inbankai)
				usr << "Use Bankai first"
				return
			if(usr.inbankai)
				if(!usr.stype=="Tousen")
					usr << "You need a different zanpakutou"
					return
				if(!usr.trappingcd)
					for(var/mob/S in oview(5,usr))
						S.Untarget()
					usr.trappingcd=1
					var/obj/A = new/obj/Tbankai/t1(locate(usr.x-4,usr.y-3,usr.z))
					var/obj/A1 = new/obj/Tbankai/t2(locate(usr.x-2,usr.y-3,usr.z))
					var/obj/A2 = new/obj/Tbankai/t3(locate(usr.x-1,usr.y-3,usr.z))
					var/obj/A3 = new/obj/Tbankai/t4(locate(usr.x,usr.y-3,usr.z))
					var/obj/A4 = new/obj/Tbankai/t5(locate(usr.x+1,usr.y-3,usr.z))
					var/obj/A5 = new/obj/Tbankai/t6(locate(usr.x+2,usr.y-3,usr.z))
					var/obj/A6 = new/obj/Tbankai/t7(locate(usr.x+3,usr.y-3,usr.z))
					var/obj/A7 = new/obj/Tbankai/t8(locate(usr.x+5,usr.y-3,usr.z))
					var/obj/A8 = new/obj/Tbankai/t9(locate(usr.x+6,usr.y-3,usr.z))
					var/obj/A9 = new/obj/Tbankai/t10(locate(usr.x-4,usr.y-2,usr.z))
					var/obj/B = new/obj/Tbankai/t11(locate(usr.x-3,usr.y-2,usr.z))
					var/obj/B1 = new/obj/Tbankai/t12(locate(usr.x-2,usr.y-2,usr.z))
					var/obj/B2 = new/obj/Tbankai/t13(locate(usr.x-1,usr.y-2,usr.z))
					var/obj/B3 = new/obj/Tbankai/t14(locate(usr.x,usr.y-2,usr.z))
					var/obj/B4 = new/obj/Tbankai/t15(locate(usr.x+1,usr.y-2,usr.z))
					var/obj/B5 = new/obj/Tbankai/t16(locate(usr.x+2,usr.y-2,usr.z))
					var/obj/B6 = new/obj/Tbankai/t17(locate(usr.x+3,usr.y-2,usr.z))
					var/obj/B7 = new/obj/Tbankai/t18(locate(usr.x+4,usr.y-2,usr.z))
					var/obj/B8 = new/obj/Tbankai/t19(locate(usr.x+5,usr.y-2,usr.z))
					var/obj/C = new/obj/Tbankai/t20(locate(usr.x-3,usr.y-1,usr.z))
					var/obj/C1 = new/obj/Tbankai/t21(locate(usr.x-2,usr.y-1,usr.z))
					var/obj/C2 = new/obj/Tbankai/t22(locate(usr.x-1,usr.y-1,usr.z))
					var/obj/C3 = new/obj/Tbankai/t23(locate(usr.x,usr.y-1,usr.z))
					var/obj/C4 = new/obj/Tbankai/t24(locate(usr.x+1,usr.y-1,usr.z))
					var/obj/C5 = new/obj/Tbankai/t25(locate(usr.x+2,usr.y-1,usr.z))
					var/obj/C6 = new/obj/Tbankai/t26(locate(usr.x+3,usr.y-1,usr.z))
					var/obj/C7 = new/obj/Tbankai/t27(locate(usr.x+4,usr.y-1,usr.z))
					var/obj/C8 = new/obj/Tbankai/t28(locate(usr.x+5,usr.y-1,usr.z))
					var/obj/C9 = new/obj/Tbankai/t29(locate(usr.x-3,usr.y,usr.z))
					var/obj/D = new/obj/Tbankai/t30(locate(usr.x-2,usr.y,usr.z))
					var/obj/D1 = new/obj/Tbankai/t31(locate(usr.x-1,usr.y,usr.z))
					var/obj/D2 = new/obj/Tbankai/t32(locate(usr.x,usr.y,usr.z))
					var/obj/D3 = new/obj/Tbankai/t33(locate(usr.x+1,usr.y,usr.z))
					var/obj/D4 = new/obj/Tbankai/t34(locate(usr.x+2,usr.y,usr.z))
					var/obj/D5 = new/obj/Tbankai/t35(locate(usr.x+3,usr.y,usr.z))
					var/obj/D6 = new/obj/Tbankai/t36(locate(usr.x+4,usr.y,usr.z))
					var/obj/D7 = new/obj/Tbankai/t37(locate(usr.x-3,usr.y+1,usr.z))
					var/obj/D8 = new/obj/Tbankai/t38(locate(usr.x-2,usr.y+1,usr.z))
					var/obj/D9 = new/obj/Tbankai/t39(locate(usr.x-1,usr.y+1,usr.z))
					var/obj/E = new/obj/Tbankai/t40(locate(usr.x,usr.y+1,usr.z))
					var/obj/E1 = new/obj/Tbankai/t41(locate(usr.x+1,usr.y+1,usr.z))
					var/obj/E2 = new/obj/Tbankai/t42(locate(usr.x+2,usr.y+1,usr.z))
					var/obj/E3 = new/obj/Tbankai/t43(locate(usr.x+3,usr.y+1,usr.z))
					var/obj/E4 = new/obj/Tbankai/t44(locate(usr.x+4,usr.y+1,usr.z))
					var/obj/E5 = new/obj/Tbankai/t45(locate(usr.x-3,usr.y+2,usr.z))
					var/obj/E6 = new/obj/Tbankai/t46(locate(usr.x-2,usr.y+2,usr.z))
					var/obj/E7 = new/obj/Tbankai/t47(locate(usr.x-1,usr.y+2,usr.z))
					var/obj/E8 = new/obj/Tbankai/t48(locate(usr.x,usr.y+2,usr.z))
					var/obj/E9 = new/obj/Tbankai/t49(locate(usr.x+1,usr.y+2,usr.z))
					var/obj/F = new/obj/Tbankai/t50(locate(usr.x+2,usr.y+2,usr.z))
					var/obj/F1 = new/obj/Tbankai/t51(locate(usr.x+3,usr.y+2,usr.z))
					var/obj/F2 = new/obj/Tbankai/t52(locate(usr.x+4,usr.y+2,usr.z))
					var/obj/F3 = new/obj/Tbankai/t53(locate(usr.x-2,usr.y+3,usr.z))
					var/obj/F4 = new/obj/Tbankai/t54(locate(usr.x-1,usr.y+3,usr.z))
					var/obj/F5 = new/obj/Tbankai/t55(locate(usr.x,usr.y+3,usr.z))
					var/obj/F6 = new/obj/Tbankai/t56(locate(usr.x+1,usr.y+3,usr.z))
					var/obj/F7 = new/obj/Tbankai/t57(locate(usr.x+2,usr.y+3,usr.z))
					var/obj/F8 = new/obj/Tbankai/t58(locate(usr.x+3,usr.y+3,usr.z))
					var/obj/F9 = new/obj/Tbankai/t59(locate(usr.x-1,usr.y+4,usr.z))
					var/obj/G = new/obj/Tbankai/t60(locate(usr.x,usr.y+4,usr.z))
					var/obj/G1 = new/obj/Tbankai/t61(locate(usr.x+1,usr.y+4,usr.z))
					var/obj/G2 = new/obj/Tbankai/t62(locate(usr.x+2,usr.y+4,usr.z))
					A.owner=usr
					A1.owner=usr
					A2.owner=usr
					A3.owner=usr
					A4.owner=usr
					A5.owner=usr
					A6.owner=usr
					A7.owner=usr
					A8.owner=usr
					B.owner=usr
					B1.owner=usr
					B2.owner=usr
					B3.owner=usr
					B4.owner=usr
					B5.owner=usr
					B6.owner=usr
					B7.owner=usr
					B8.owner=usr
					A9.owner=usr
					C.owner=usr
					C1.owner=usr
					C2.owner=usr
					C3.owner=usr
					C4.owner=usr
					C5.owner=usr
					C6.owner=usr
					C7.owner=usr
					C8.owner=usr
					C9.owner=usr
					D.owner=usr
					D1.owner=usr
					D2.owner=usr
					D3.owner=usr
					D4.owner=usr
					D5.owner=usr
					D6.owner=usr
					D7.owner=usr
					D8.owner=usr
					D9.owner=usr
					E.owner=usr
					E1.owner=usr
					E2.owner=usr
					E3.owner=usr
					E4.owner=usr
					E5.owner=usr
					E6.owner=usr
					E7.owner=usr
					E8.owner=usr
					E9.owner=usr
					F.owner=usr
					F1.owner=usr
					F2.owner=usr
					F3.owner=usr
					F4.owner=usr
					F5.owner=usr
					F6.owner=usr
					F7.owner=usr
					F8.owner=usr
					F9.owner=usr
					G.owner=usr
					G1.owner=usr
					G2.owner=usr
					tousen=1
					sleep(1200)
					usr.trappingcd=0
obj/skillcard
 Scene_of_Massacre
		names = "Scene of Massacre"
		icon = 'gui.dmi'
		screen_loc = "15,1"
		icon_state = "scene of massacre"
		layer = MOB_LAYER+100
		iszan=1
mob
	proc
		Scene_of_Massacre()
			if(src.stype!="Byakuya")
				src << "You need a different zanpakutou"
				return
			if(!src.inbankai)
				src << "Use Bankai first"
				return
			if(src.scenecool)
				src <<"You must wait at least 2 minutes to use this again"
				return
			if(!src.senkei)
				for(var/obj/pedals/G in view(7,src))
					if(G.Gowner == src)
						del G
				for(var/obj/pivotal/aM in view(7,src))
					if(aM.Gowner == src)
						del aM
				src.scenecool=1
				src.senkei = 1
				src.controlbug = 1
				src.Load_Overlays()
				view(src,8) << "<b>[src]: Senkei...[src.swordname] Kageyoshi!"
				if(src.etarget)src.Facedir(src.etarget)
				var/obj/A = new/obj/byakublade(locate(src.x-7,src.y-3,src.z))
				spawn(0)
					flick("create",A)
			//		A.icon_state=""
				var/obj/A1 = new/obj/byakublade(locate(src.x-7,src.y-2,src.z))
				spawn(2)
					flick("create",A1)
			//		A1.icon_state=""
				var/obj/A2 = new/obj/byakublade(locate(src.x-7,src.y-1,src.z))
				spawn(4)
					flick("create",A2)
			//		A2.icon_state=""
				var/obj/A3 = new/obj/byakublade(locate(src.x-7,src.y,src.z))
				spawn(6)
					flick("create",A3)
			//		A3.icon_state=""
				var/obj/A4 = new/obj/byakublade(locate(src.x-7,src.y+1,src.z))
				spawn(8)
					flick("create",A4)
			//		A4.icon_state=""
				var/obj/A5 = new/obj/byakublade(locate(src.x-7,src.y+2,src.z))
				spawn(10)
					flick("create",A5)
			//		A5.icon_state=""
				var/obj/A6 = new/obj/byakublade(locate(src.x-7,src.y+3,src.z))
				spawn(12)
					flick("create",A6)
			//		A6.icon_state=""
				var/obj/A7 = new/obj/byakublade(locate(src.x+7,src.y-3,src.z))
				spawn(44)
					flick("create",A7)
			//		A7.icon_state=""
				var/obj/A8 = new/obj/byakublade(locate(src.x+7,src.y-2,src.z))
				spawn(46)
					flick("create",A8)
			//		A8.icon_state=""
				var/obj/A9 = new/obj/byakublade(locate(src.x+7,src.y-1,src.z))
				spawn(48)
					flick("create",A9)
			//		A9.icon_state=""
				var/obj/B = new/obj/byakublade(locate(src.x+7,src.y,src.z))
				spawn(50)
					flick("create",B)
			//		B.icon_state=""
				var/obj/B1 = new/obj/byakublade(locate(src.x+7,src.y+1,src.z))
				spawn(52)
					flick("create",B1)
			//		B1.icon_state=""
				var/obj/B2 = new/obj/byakublade(locate(src.x+7,src.y+2,src.z))
				spawn(54)
					flick("create",B2)
			//		B2.icon_state=""
				var/obj/B3 = new/obj/byakublade(locate(src.x+7,src.y+3,src.z))
				spawn(56)
					flick("create",B3)
				//	B3.icon_state=""
				var/obj/B4 = new/obj/byakublade(locate(src.x-3,src.y+7,src.z))
				spawn(28)
					flick("create",B4)
			//		B4.icon_state=""
				var/obj/B5 = new/obj/byakublade(locate(src.x-2,src.y+7,src.z))
				spawn(30)
					flick("create",B5)
			//		B5.icon_state=""
				var/obj/B6 = new/obj/byakublade(locate(src.x-1,src.y+7,src.z))
				spawn(32)
					flick("create",B6)
			//		B6.icon_state=""
				var/obj/B7 = new/obj/byakublade(locate(src.x,src.y+7,src.z))
				spawn(34)
					flick("create",B7)
			//		B7.icon_state=""
				var/obj/B8 = new/obj/byakublade(locate(src.x+1,src.y+7,src.z))
				spawn(36)
					flick("create",B8)
			//		B8.icon_state=""
				var/obj/B9 = new/obj/byakublade(locate(src.x+2,src.y+7,src.z))
				spawn(38)
					flick("create",B9)
			//		B9.icon_state=""
				var/obj/C = new/obj/byakublade(locate(src.x+3,src.y+7,src.z))
				spawn(40)
					flick("create",C)
			//		C.icon_state=""
				var/obj/C1 = new/obj/byakublade(locate(src.x-3,src.y-7,src.z))
				spawn(16)
					flick("create",C1)
			//		C1.icon_state=""
				var/obj/C2 = new/obj/byakublade(locate(src.x-2,src.y-7,src.z))
				spawn(18)
					flick("create",C2)
			//		C2.icon_state=""
				var/obj/C3 = new/obj/byakublade(locate(src.x-1,src.y-7,src.z))
				spawn(20)
					flick("create",C3)
			//		C3.icon_state=""
				var/obj/C4 = new/obj/byakublade(locate(src.x,src.y-7,src.z))
				spawn(22)
					flick("create",C4)
			//		C4.icon_state=""
				var/obj/C5 = new/obj/byakublade(locate(src.x+1,src.y-7,src.z))
				spawn(24)
					flick("create",C5)
			//		C5.icon_state=""
				var/obj/C6 = new/obj/byakublade(locate(src.x+2,src.y-7,src.z))
				spawn(26)
					flick("create",C6)
			//		C6.icon_state=""
				var/obj/C7 = new/obj/byakublade(locate(src.x+3,src.y-7,src.z))
				spawn(28)
					flick("create",C7)
			//		C7.icon_state=""
				var/obj/C8 = new/obj/byakublade(locate(src.x-6,src.y-4,src.z))
				spawn(2)
					flick("create",C8)
			//		C8.icon_state=""
				var/obj/C9 = new/obj/byakublade(locate(src.x-5,src.y-5,src.z))
				spawn(4)
					flick("create",C9)
			//		C9.icon_state=""
				var/obj/D1 = new/obj/byakublade(locate(src.x-4,src.y-6,src.z))
				spawn(6)
					flick("create",D1)
			//		D1.icon_state=""
				var/obj/D2 = new/obj/byakublade(locate(src.x+4,src.y+6,src.z))
				spawn(50)
					flick("create",D2)
			//		D2.icon_state=""
				var/obj/D3 = new/obj/byakublade(locate(src.x+5,src.y+5,src.z))
				spawn(52)
					flick("create",D3)
			//		D3.icon_state=""
				var/obj/D4 = new/obj/byakublade(locate(src.x+6,src.y+4,src.z))
				spawn(54)
					flick("create",D4)
			//		D4.icon_state=""
				var/obj/D5 = new/obj/byakublade(locate(src.x+6,src.y+5,src.z))
				spawn(46)
					flick("create",D5)
			//		D5.icon_state=""
				var/obj/D6 = new/obj/byakublade(locate(src.x+5,src.y+6,src.z))
				spawn(44)
					flick("create",D6)
			//		D6.icon_state=""
				var/obj/D7 = new/obj/byakublade(locate(src.x+4,src.y+7,src.z))
				spawn(42)
					flick("create",D7)
				//	D7.icon_state=""
				var/obj/D8 = new/obj/byakublade(locate(src.x-4,src.y-7,src.z))
				spawn(14)
					flick("create",D8)
				//	D8.icon_state=""
				var/obj/D9 = new/obj/byakublade(locate(src.x-5,src.y-6,src.z))
				spawn(12)
					flick("create",D9)
				//	D9.icon_state=""
				var/obj/D = new/obj/byakublade(locate(src.x-6,src.y-5,src.z))
				spawn(10)
					flick("create",D)
				//	D.icon_state=""
				var/obj/E1 = new/obj/byakublade(locate(src.x-6,src.y+4,src.z))
				spawn(14)
					flick("create",E1)
				//	E1.icon_state=""
				var/obj/E2 = new/obj/byakublade(locate(src.x-5,src.y+5,src.z))
				spawn(16)
					flick("create",E2)
				//	E2.icon_state=""
				var/obj/E3 = new/obj/byakublade(locate(src.x-4,src.y+6,src.z))
				spawn(18)
					flick("create",E3)
			//		E3.icon_state=""
				var/obj/E4 = new/obj/byakublade(locate(src.x+4,src.y-6,src.z))
				spawn(38)
					flick("create",E4)
			//		E4.icon_state=""
				var/obj/E5 = new/obj/byakublade(locate(src.x+5,src.y-5,src.z))
				spawn(40)
					flick("create",E5)
			//		E5.icon_state=""
				var/obj/E6 = new/obj/byakublade(locate(src.x+6,src.y-4,src.z))
				spawn(42)
					flick("create",E6)
			//		E6.icon_state=""
				var/obj/E7 = new/obj/byakublade(locate(src.x-6,src.y+5,src.z))
				spawn(22)
					flick("create",E7)
		//			E7.icon_state=""
				var/obj/E8 = new/obj/byakublade(locate(src.x-5,src.y+6,src.z))
				spawn(24)
					flick("create",E8)
		//			E8.icon_state=""
				var/obj/E9 = new/obj/byakublade(locate(src.x-4,src.y+7,src.z))
				spawn(26)
					flick("create",E9)
		//			E9.icon_state=""
				var/obj/E = new/obj/byakublade(locate(src.x+4,src.y-7,src.z))
				spawn(30)
					flick("create",E)
		//			E.icon_state=""
				var/obj/F = new/obj/byakublade(locate(src.x+5,src.y-6,src.z))
				spawn(32)
					flick("create",F)
		//			F.icon_state=""
				var/obj/F1 = new/obj/byakublade(locate(src.x+6,src.y-5,src.z))
				spawn(34)
					flick("create",F1)
		//			F1.icon_state=""
				var/obj/F2 = new/obj/byakublade(locate(src.x-7,src.y+4,src.z))
				spawn(20)
					flick("create",F2)
		//			F2.icon_state=""
				var/obj/F3 = new/obj/byakublade(locate(src.x+7,src.y-4,src.z))
				spawn(36)
					flick("create",F3)
			//		F3.icon_state=""
				var/obj/F4 = new/obj/byakublade(locate(src.x-7,src.y-4,src.z))
				spawn(8)
					flick("create",F4)
		//			F4.icon_state=""
				var/obj/F5 = new/obj/byakublade(locate(src.x+7,src.y+4,src.z))
				spawn(48)
					flick("create",F5)
		//			F5.icon_state=""
				A:Gowner = src
				A1:Gowner = src
				A2:Gowner = src
				A3:Gowner = src
				A4:Gowner = src
				A5:Gowner = src
				A6:Gowner = src
				A7:Gowner = src
				A8:Gowner = src
				A9:Gowner = src
				B:Gowner = src
				B1:Gowner = src
				B2:Gowner = src
				B3:Gowner = src
				B4:Gowner = src
				B5:Gowner = src
				B6:Gowner = src
				B7:Gowner = src
				B8:Gowner = src
				B9:Gowner = src
				C:Gowner = src
				C1:Gowner = src
				C2:Gowner = src
				C3:Gowner = src
				C4:Gowner = src
				C5:Gowner = src
				C6:Gowner = src
				C7:Gowner = src
				C8:Gowner = src
				C9:Gowner = src
				D:Gowner = src
				D1:Gowner = src
				D2:Gowner = src
				D3:Gowner = src
				D4:Gowner = src
				D5:Gowner = src
				D6:Gowner = src
				D7:Gowner = src
				D8:Gowner = src
				D9:Gowner = src
				E:Gowner = src
				E1:Gowner = src
				E2:Gowner = src
				E3:Gowner = src
				E4:Gowner = src
				E5:Gowner = src
				E6:Gowner = src
				E7:Gowner = src
				E8:Gowner = src
				E9:Gowner = src
				F:Gowner = src
				F1:Gowner = src
				F2:Gowner = src
				F3:Gowner = src
				F4:Gowner = src
				F5:Gowner = src
				sleep(600)
				if(src.senkei)
					src.controlbug = 1
					var/Q = new/obj/pedals(locate(src.x+2,src.y,src.z))
					var/W = new/obj/pedals(locate(src.x+2,src.y+1,src.z))
					var/Es = new/obj/pedals(locate(src.x+2,src.y+2,src.z))
					var/R = new/obj/pedals(locate(src.x+2,src.y-1,src.z))
					var/T = new/obj/pedals(locate(src.x+2,src.y-2,src.z))
					var/S = new/obj/pedals(locate(src.x-2,src.y+2,src.z))
					var/Ds = new/obj/pedals(locate(src.x-2,src.y+1,src.z))
					var/Fs = new/obj/pedals(locate(src.x-2,src.y-1,src.z))
					var/G = new/obj/pedals(locate(src.x-2,src.y-2,src.z))
					var/H = new/obj/pedals(locate(src.x-2,src.y,src.z))
					Q:Gowner = src
					W:Gowner = src
					Es:Gowner = src
					R:Gowner = src
					T:Gowner = src
					S:Gowner = src
					Ds:Gowner = src
					Fs:Gowner = src
					G:Gowner = src
					H:Gowner = src
					var/T1 = new/obj/pedals(locate(src.x+2,src.y-2,src.z))
					var/T2 = new/obj/pedals(locate(src.x-2,src.y+2,src.z))
					var/T3 = new/obj/pedals(locate(src.x-2,src.y+1,src.z))
					var/T4 = new/obj/pedals(locate(src.x-2,src.y-1,src.z))
					var/T5 = new/obj/pedals(locate(src.x-2,src.y-2,src.z))
					var/T6 = new/obj/pedals(locate(src.x-2,src.y,src.z))
					T1:Gowner = src
					T2:Gowner = src
					T3:Gowner = src
					T4:Gowner = src
					T5:Gowner = src
					T6:Gowner = src
					src.senkei = 0
					src.overlays += 'Icons/byakuyashikaisword.dmi'
				sleep(600)
				src.scenecool=0
