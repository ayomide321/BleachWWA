



obj/wshgccustaura
	icon='Icons/wshgcaura.dmi'
	layer=MOB_LAYER+12
	a1
		icon_state="0,0"
		pixel_x=-32
		pixel_y=0

	a2
		icon_state="1,0"
		pixel_x=0
		pixel_y=0
	a3
		icon_state="2,0"
		pixel_x=32
		pixel_y=0
	a4
		icon_state="0,1"
		pixel_x=-32
		pixel_y=32
	b1
		icon_state="1,1"
		pixel_x=0
		pixel_y=32
	b2
		icon_state="2,1"
		pixel_x=32
		pixel_y=32
	b3
		icon_state="0,2"
		pixel_x=-32
		pixel_y=64
	b4
		icon_state="1,2"
		pixel_x=0
		pixel_y=64
	c1
		icon_state="2,2"
		pixel_x=32
		pixel_y=64




mob/proc
	Load_Overlays()
		var/L[0]
		var/h3
		src.overlays=0
		src.underlays=0


	//	var
		//	list/event_overlays = new
		//	shirt = null

		if(team_deathmatch)
			if(team_deathmatch.checkTeam(src) != null && team_deathmatch.status <> "Join")
				if(src in team_deathmatch.white_team)
					L += /obj/tdm/whiteteam
				//	shirt = 'Clothes/BleachShirtwhite.dmi'
				//	event_overlays += shirt
				else if(src in team_deathmatch.black_team)
					L += /obj/tdm/blackteam
				//	shirt = 'Clothes/BleachShirt.dmi'
				//	event_overlays += shirt

			if(!src in team_deathmatch.white_team)	L -= /obj/tdm/whiteteam
			if(!src in team_deathmatch.black_team)	L -= /obj/tdm/blackteam

		if(src.stype == "wshgccust")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Thanscust
				L -= weapon
				L += /obj/wshgccustaura/a1
				L += /obj/wshgccustaura/a2
				L += /obj/wshgccustaura/a3
				L += /obj/wshgccustaura/a4
				L += /obj/wshgccustaura/b1
				L += /obj/wshgccustaura/b2
				L += /obj/wshgccustaura/b3
				L += /obj/wshgccustaura/b4
				L += /obj/wshgccustaura/c1
				L +=/obj/petalpieces/up
				L +=/obj/petalpieces/down
				L +=/obj/petalpieces/left
				L +=/obj/petalpieces/right
				L +=/obj/petalpieces/middle

		//if(src.stype == "Maycustez" && src.inshikai)
		if(src.key == "WitchOfEastEnd")
			src.icon='Icons/BlankBase.dmi'
			L+=/obj/maycustte


		if(src.race=="Yammy Boss"||src.race=="Yammy Boss2"||src.race=="Yammy Boss3")
			src.icon='Icons/BlankBase.dmi'
			src.overlays+=/obj/releases/YammyRessIcon/yam00
			src.overlays+=/obj/releases/YammyRessIcon/yam01
			src.overlays+=/obj/releases/YammyRessIcon/yam02
			src.overlays+=/obj/releases/YammyRessIcon/yam03
			src.overlays+=/obj/releases/YammyRessIcon/yam04
			src.overlays+=/obj/releases/YammyRessIcon/yam05
			src.overlays+=/obj/releases/YammyRessIcon/yam10
			src.overlays+=/obj/releases/YammyRessIcon/yam11
			src.overlays+=/obj/releases/YammyRessIcon/yam12
			src.overlays+=/obj/releases/YammyRessIcon/yam13
			src.overlays+=/obj/releases/YammyRessIcon/yam14
			src.overlays+=/obj/releases/YammyRessIcon/yam15
			src.overlays+=/obj/releases/YammyRessIcon/yam20
			src.overlays+=/obj/releases/YammyRessIcon/yam21
			src.overlays+=/obj/releases/YammyRessIcon/yam22
			src.overlays+=/obj/releases/YammyRessIcon/yam23
			src.overlays+=/obj/releases/YammyRessIcon/yam24
			src.overlays+=/obj/releases/YammyRessIcon/yam25
			src.overlays+=/obj/releases/YammyRessIcon/yam30
			src.overlays+=/obj/releases/YammyRessIcon/yam31
			src.overlays+=/obj/releases/YammyRessIcon/yam32
			src.overlays+=/obj/releases/YammyRessIcon/yam33
			src.overlays+=/obj/releases/YammyRessIcon/yam34
			src.overlays+=/obj/releases/YammyRessIcon/yam35
			src.overlays+=/obj/releases/YammyRessIcon/yam40
			src.overlays+=/obj/releases/YammyRessIcon/yam41
			src.overlays+=/obj/releases/YammyRessIcon/yam42
			src.overlays+=/obj/releases/YammyRessIcon/yam43
			src.overlays+=/obj/releases/YammyRessIcon/yam44
			src.overlays+=/obj/releases/YammyRessIcon/yam45
			src.overlays+=/obj/releases/YammyRessIcon/yam50
			src.overlays+=/obj/releases/YammyRessIcon/yam51
			src.overlays+=/obj/releases/YammyRessIcon/yam52
			src.overlays+=/obj/releases/YammyRessIcon/yam53
			src.overlays+=/obj/releases/YammyRessIcon/yam54
			src.overlays+=/obj/releases/YammyRessIcon/yam55
			return
		if(src.race=="Dark Pheonix"||src.race=="Dark Pheonix2"||src.race=="Dark Pheonix3")
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/Dark_Pheonix/dp00
			src.overlays += /obj/Dark_Pheonix/dp01
			src.overlays += /obj/Dark_Pheonix/dp02
			src.overlays += /obj/Dark_Pheonix/dp10
			src.overlays += /obj/Dark_Pheonix/dp11
			src.overlays += /obj/Dark_Pheonix/dp12
			src.overlays += /obj/Dark_Pheonix/dp20
			src.overlays += /obj/Dark_Pheonix/dp21
			src.overlays += /obj/Dark_Pheonix/dp22
			return
		if(src.race=="Fire Demon"||src.race=="Fire Demon2"||src.race=="Fire Demon3")
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/Fire_Demon/fd00
			src.overlays += /obj/Fire_Demon/fd01
			src.overlays += /obj/Fire_Demon/fd02
			src.overlays += /obj/Fire_Demon/fd10
			src.overlays += /obj/Fire_Demon/fd11
			src.overlays += /obj/Fire_Demon/fd12
			return
		if(src.is_dnpc== 1)
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/Red_Demon/top
			src.overlays += /obj/Red_Demon/bottom
			return
		if(src.is_dnpc == 2)
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/Blue_Demon/botleft
			src.overlays += /obj/Blue_Demon/botright
			src.overlays += /obj/Blue_Demon/topleft
			src.overlays += /obj/Blue_Demon/topright
			return
		if(src.is_dnpc == 3)
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/Stinox/stinox00
			src.overlays += /obj/Stinox/stinox01
			src.overlays += /obj/Stinox/stinox10
			src.overlays += /obj/Stinox/stinox11
			return
		if(src.is_dnpc == 4)
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/SwampMonster/Swamp1
			src.overlays += /obj/SwampMonster/Swamp2
			src.overlays += /obj/SwampMonster/Swamp3
			src.overlays += /obj/SwampMonster/Swamp4
			return
		if(src.is_dnpc == 5)
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/Green_Adj/adj00
			src.overlays += /obj/Green_Adj/adj10
			src.overlays += /obj/Green_Adj/adj20
			src.overlays += /obj/Green_Adj/adj01
			src.overlays += /obj/Green_Adj/adj11
			src.overlays += /obj/Green_Adj/adj21
			src.overlays += /obj/Green_Adj/adj02
			src.overlays += /obj/Green_Adj/adj12
			src.overlays += /obj/Green_Adj/adj22
			src.overlays += /obj/Green_Adj/adj03
			src.overlays += /obj/Green_Adj/adj13
			src.overlays += /obj/Green_Adj/adj23
			src.overlays += /obj/Green_Adj/adj04
			src.overlays += /obj/Green_Adj/adj14
			src.overlays += /obj/Green_Adj/adj24
			return
		if(src.is_dnpc == 6)
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/Demon_Adj/bottomleft
			src.overlays += /obj/Demon_Adj/bottomright
			src.overlays += /obj/Demon_Adj/topleft
			src.overlays += /obj/Demon_Adj/topright
			return
		if(src.susanos==2)
			src.overlays+=/obj/stage2/s1
			src.overlays+=/obj/stage2/s2
			src.overlays+=/obj/stage2/s3
			src.overlays+=/obj/stage2/s4
			src.overlays+=/obj/stage2/s5
			src.overlays+=/obj/stage2/s6
			src.overlays+=/obj/stage2/s7
			src.overlays+=/obj/stage2/s8
			src.overlays+=/obj/stage2/s9
			src.overlays+=/obj/stage2/s10
			src.overlays+=/obj/stage2/s11
			src.overlays+=/obj/stage2/s12
			src.overlays+=/obj/stage2/s13
			src.overlays+=/obj/stage2/s14
			src.overlays+=/obj/stage2/s15
			src.overlays+=/obj/stage2/s16
			src.overlays+=/obj/stage2/s17
		if(src.amated==1)
			src.overlays+=/obj/amatover
		if(src.Yokai1==1)
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/Yokai/Yokai11
			src.overlays += /obj/Yokai/Yokai12
		if(src.Yokai2==1)
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/Yokai2/Yokai21
			src.overlays += /obj/Yokai2/Yokai22
		if(src.Yokai3==1)
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/Yokai3/YokaiBottomMiddle
			src.overlays += /obj/Yokai3/YokaiBottomLeft
			src.overlays += /obj/Yokai3/YokaiBottomRight
			src.overlays += /obj/Yokai3/YokaiTop1Mid
			src.overlays += /obj/Yokai3/YokaiTop1Left
			src.overlays += /obj/Yokai3/YokaiTop1Right
			src.overlays += /obj/Yokai3/YokaiTop2Mid
			src.overlays += /obj/Yokai3/YokaiTop2Left
			src.overlays += /obj/Yokai3/YokaiTop2Right
		if(src.Yokai4==1)
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/Yokai4/YokaiLeftBot
			src.overlays += /obj/Yokai4/YokaiRightBot
			src.overlays += /obj/Yokai4/YokaiTopLeft
			src.overlays += /obj/Yokai4/YokaiTopRight
		if(src.newkomaboss==1)
			src.icon='Icons/BlankBase.dmi'
			src.overlays+=/obj/komaboss/bot1left2
			src.overlays+=/obj/komaboss/bot1left1
			src.overlays+=/obj/komaboss/bot1right1
			src.overlays+=/obj/komaboss/bot1right2
			src.overlays+=/obj/komaboss/bot2left2
			src.overlays+=/obj/komaboss/bot2left1
			src.overlays+=/obj/komaboss/bot2right1
			src.overlays+=/obj/komaboss/bot2right2
			src.overlays+=/obj/komaboss/bot3left2
			src.overlays+=/obj/komaboss/bot3left1
			src.overlays+=/obj/komaboss/bot3right1
			src.overlays+=/obj/komaboss/bot3right2
			src.overlays+=/obj/komaboss/bot4left2
			src.overlays+=/obj/komaboss/bot4left1
			src.overlays+=/obj/komaboss/bot4right1
			src.overlays+=/obj/komaboss/bot4right2
		if(src.lorelei==1)
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/Pheonix/botleft11
			src.overlays += /obj/Pheonix/botleft12
			src.overlays += /obj/Pheonix/botleft13
			src.overlays += /obj/Pheonix/botleft21
			src.overlays += /obj/Pheonix/botleft22
			src.overlays += /obj/Pheonix/botleft23
			src.overlays += /obj/Pheonix/botleft31
			src.overlays += /obj/Pheonix/botleft32
			src.overlays += /obj/Pheonix/botleft33
		if(src.crownprince==1||src.iswandevent)
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/vandprince/botleft
			src.overlays += /obj/vandprince/botmid
			src.overlays += /obj/vandprince/botright
			src.overlays += /obj/vandprince/midleft
			src.overlays += /obj/vandprince/midmid
			src.overlays += /obj/vandprince/midright
			src.overlays += /obj/vandprince/topleft
			src.overlays += /obj/vandprince/topmid
			src.overlays += /obj/vandprince/topright
			return
		if(src.lorelei==2)
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/redwolf/bl
			src.overlays += /obj/redwolf/br
			src.overlays += /obj/redwolf/tl
			src.overlays += /obj/redwolf/tr
		if(src.race=="Hollow" && src.key !="WitchOfEastEnd")
			if(src.colorr=="Blue"&&src.ctf==2)
				src.overlays += /obj/blue
			if(src.colorr=="Red"&&src.ctf==2)
				src.overlays += /obj/red
			if(src.flags=="blue")
				src.overlays += /obj/blueflag
			if(src.flags=="red")
				src.overlays += /obj/redflag
			if(src.in_team)
				src.overlays += /obj/gl
			if(src.hollowtype == "tutorial" && src.key !="WitchOfEastEnd")
				src.icon='Icons/BlankBase.dmi'
				src.overlays += /obj/TutHollow/BotLeft
				src.overlays += /obj/TutHollow/BotRight
				src.overlays += /obj/TutHollow/TopRight
				src.overlays += /obj/TutHollow/TopLeft
			if(src.hollowtype=="labtype1" && src.key !="WitchOfEastEnd")
				src.icon='Icons/BlankBase.dmi'
				src.overlays+=/obj/PantherHollow/BL
				src.overlays+=/obj/PantherHollow/BR
				src.overlays+=/obj/PantherHollow/TL
				src.overlays+=/obj/PantherHollow/TR
			if(src.hollowtype=="new adjuchas" && src.key !="WitchOfEastEnd")
				src.icon='Icons/BlankBase.dmi'
				src.overlays+=/obj/TallAdju/BottomLeft
				src.overlays+=/obj/TallAdju/BottomRight
				src.overlays+=/obj/TallAdju/Bottom2Left
				src.overlays+=/obj/TallAdju/Bottom2Right
				src.overlays+=/obj/TallAdju/Bottom3Left
				src.overlays+=/obj/TallAdju/Bottom3Right
				src.overlays+=/obj/TallAdju/Bottom4Left
				src.overlays+=/obj/TallAdju/Bottom4Right
			if(src.hollowtype == "wolf" && src.key !="WitchOfEastEnd")
				src.icon='Icons/blank.dmi'
				src.overlays += /obj/wolf1
				src.overlays += /obj/wolf2
				src.overlays += /obj/wolf3
				src.overlays += /obj/wolf4
			if(src.hollowtype=="swampboss" && src.key !="WitchOfEastEnd")
				src.icon='Icons/BlankBase.dmi'
				src.overlays += /obj/SwampMonster/Swamp1
				src.overlays += /obj/SwampMonster/Swamp2
				src.overlays += /obj/SwampMonster/Swamp3
				src.overlays += /obj/SwampMonster/Swamp4
			if(src.hollowtype=="swampmini" && src.key !="WitchOfEastEnd")
				src.icon='Icons/demon monster.dmi'
			if(src.hollowtype =="Kushanada" && src.key !="WitchOfEastEnd")
				src.icon='Icons/BlankBase.dmi'
				src.overlays += /obj/Kushanada/hellbotleft1
				src.overlays += /obj/Kushanada/hellbotleft2
				src.overlays += /obj/Kushanada/hellbotright2
				src.overlays += /obj/Kushanada/hellbotright1
				src.overlays += /obj/Kushanada/hellmiddleleft1
				src.overlays += /obj/Kushanada/hellmiddleleft2
				src.overlays += /obj/Kushanada/hellmiddleright1
				src.overlays += /obj/Kushanada/hellmiddleright2
				src.overlays += /obj/Kushanada/helltopleft1
				src.overlays += /obj/Kushanada/helltopleft2
				src.overlays += /obj/Kushanada/helltopright1
				src.overlays += /obj/Kushanada/helltopright2
			if(src.hollowtype == "bat" && src.key !="WitchOfEastEnd")
				src.icon='Icons/BlankBase.dmi'
				src.overlays += /obj/bat
			if(src.hollowtype == "devil" && src.key !="WitchOfEastEnd")
				src.icon='Icons/BlankBase.dmi'
				src.overlays += /obj/demonboss1
				src.overlays += /obj/demonboss2
				src.overlays += /obj/demonboss3
				src.overlays += /obj/demonboss4
				src.overlays += /obj/demonboss5
				src.overlays += /obj/demonboss6
				src.overlays += /obj/demonboss7
				src.overlays += /obj/demonboss8
				src.overlays += /obj/demonboss9
			if(src.hollowtype == "Reaper" && src.key !="WitchOfEastEnd")
				src.icon='Icons/BlankBase.dmi'
				src.overlays += /obj/reaper1
				src.overlays += /obj/reaper2
			if(src.hollowtype == "demon" && src.key !="WitchOfEastEnd")
				src.icon='Icons/BlankBase.dmi'
				src.overlays += /obj/demon1
				src.overlays += /obj/demon2
				src.overlays += /obj/demon3
				src.overlays += /obj/demon4
			if(src.hollowtype == "strong" && src.key !="WitchOfEastEnd")
				src.overlays += /obj/nstrong1
				src.overlays += /obj/nstrong2
				src.overlays += /obj/nstrong3
				src.overlays += /obj/nstrong4
			if(src.hollowtype == "meno" && src.key !="WitchOfEastEnd")
				src.icon='Icons/BlankBase.dmi'
				src.overlays += /obj/Menos/m1
				src.overlays += /obj/Menos/m2
				src.overlays += /obj/Menos/m3
				src.overlays += /obj/Menos/m4
				src.overlays += /obj/Menos/m5
				src.overlays += /obj/Menos/m6
				src.overlays += /obj/Menos/m7
				src.overlays += /obj/Menos/m8
			if(src.hollowtype == "adjucha" && src.key !="WitchOfEastEnd")
				src.icon='Icons/BlankBase.dmi'
				if(src.adjhollowtype==0)
					src.overlays += /obj/Adjucha/a1
					src.overlays += /obj/Adjucha/a2
					src.overlays += /obj/Adjucha/a3
					src.overlays += /obj/Adjucha/b1
					src.overlays += /obj/Adjucha/b2
					src.overlays += /obj/Adjucha/b3
					src.overlays += /obj/Adjucha/c1
					src.overlays += /obj/Adjucha/c2
					src.overlays += /obj/Adjucha/c3
					src.overlays += /obj/Adjucha/d1
					src.overlays += /obj/Adjucha/d2
					src.overlays += /obj/Adjucha/d3
					src.overlays += /obj/Adjucha/e1
					src.overlays += /obj/Adjucha/e2
					src.overlays += /obj/Adjucha/e3
					src.overlays += /obj/Adjucha/f1
					src.overlays += /obj/Adjucha/f2
					src.overlays += /obj/Adjucha/f3
				if(src.adjhollowtype==1 && src.key !="WitchOfEastEnd")
					src.overlays+=/obj/smalladjucha/wolfbot1
					src.overlays+=/obj/smalladjucha/wolfbot2
					src.overlays+=/obj/smalladjucha/wolfbot3
					src.overlays+=/obj/smalladjucha/wolfmid1
					src.overlays+=/obj/smalladjucha/wolfmid2
					src.overlays+=/obj/smalladjucha/wolfmid3
					src.overlays+=/obj/smalladjucha/wolftop1
					src.overlays+=/obj/smalladjucha/wolftop2
					src.overlays+=/obj/smalladjucha/wolftop3
				if(src.adjhollowtype==2 && src.key !="WitchOfEastEnd")//tall green
					src.overlays+=/obj/TallAdju/BottomLeft
					src.overlays+=/obj/TallAdju/BottomRight
					src.overlays+=/obj/TallAdju/Bottom2Left
					src.overlays+=/obj/TallAdju/Bottom2Right
					src.overlays+=/obj/TallAdju/Bottom3Left
					src.overlays+=/obj/TallAdju/Bottom3Right
					src.overlays+=/obj/TallAdju/Bottom4Left
					src.overlays+=/obj/TallAdju/Bottom4Right
				if(src.adjhollowtype==3 && src.key !="WitchOfEastEnd")//panther
					src.overlays+=/obj/PantherHollow/BL
					src.overlays+=/obj/PantherHollow/BR
					src.overlays+=/obj/PantherHollow/TL
					src.overlays+=/obj/PantherHollow/TR

			return
		if(src.pants)L+=pants
		if(src.shirt)L+=src.shirt
		if(src.wearingsanta)L+=/obj/SantaHat
		if(src.wearingmati)L+=/obj/MatiVaiMask
		if(src.wearingapollo)L+=/obj/ApolloVaiMask
		if(src.wearingzeref1)L+=/obj/ZerefVaiMask1
		if(src.wearingzeref2)L+=/obj/ZerefVaiMask2
		if(src.shoes)L+=src.shoes
		if(src.jacket)L+=src.jacket
		switch(src.arrancarmask)
			if(1)
				h3='arrancar1.dmi'
			if(2)
				h3='arrancar2.dmi'
			if(3)
				h3='arrancar3.dmi'
		if(src.amated==1)
			src.overlays+=/obj/amatover
		if(hair_type)
			L+= hair_type
			if(src.stype== "Maycustez"||src.ressurection&&src.ressurectiontype=="Skeleton"||src.ressurection&&src.ressurectiontype=="Del Toro")
				L-=hair_type
			if(src.trans||src.trans3)
				L+=/obj/ssj1
				if(src.susanos==2)
					src.overlays+=/obj/stage2/s1
					src.overlays+=/obj/stage2/s2
					src.overlays+=/obj/stage2/s3
					src.overlays+=/obj/stage2/s4
					src.overlays+=/obj/stage2/s5
					src.overlays+=/obj/stage2/s6
					src.overlays+=/obj/stage2/s7
					src.overlays+=/obj/stage2/s8
					src.overlays+=/obj/stage2/s9
					src.overlays+=/obj/stage2/s10
					src.overlays+=/obj/stage2/s11
					src.overlays+=/obj/stage2/s12
					src.overlays+=/obj/stage2/s13
					src.overlays+=/obj/stage2/s14
					src.overlays+=/obj/stage2/s15
					src.overlays+=/obj/stage2/s16
					src.overlays+=/obj/stage2/s17
			if(src.rinneg)
				L+=/obj/rinnegan
			//if(src.twilightboost)
				//L+=/obj/Twilight_Boost
		if(src.wings==2)
			src.overlays += /obj/HWing2/w1
			src.overlays += /obj/HWing2/w2
			src.overlays += /obj/HWing2/w3
		if(h3)
			if(!src.ressurection)
				var/obj/j3=new/obj
				j3.pixel_y=1
				j3.icon=h3
				j3.layer=MOB_LAYER+3
				L+= j3
				if(src.arrancarmask==1)
					var/obj/j3s=new/obj
					j3s.pixel_y=8
					j3s.icon='Icons/arrancar1.1.dmi'
					j3s.layer=MOB_LAYER+3
					L+= j3s
					spawn(2)
					del j3s
				spawn(2)
				del j3
		if(src.maskon&&src.maskuses>9&&src.vasto==0)
			switch(mask)
				if(1)
					L+=/obj/VisoredMasks/Mask1
				if(2)
					L+=/obj/VisoredMasks/Mask2
				if(3)
					L+=/obj/VisoredMasks/Mask3
				if(4)
					L+=/obj/VisoredMasks/Mask4
				if(5)
					L+=/obj/VisoredMasks/Mask5
				if(7)
					L+=/obj/VisoredMasks/Mask7
		if(src.maskon&&src.vasto==1)
			L+=/obj/VisoredMasks/Mask6
	/*		L+=src.veye
			L+=src.vmask
			L+=src.vstripe
			L+=/obj/Vaimask/v4*/
		if(special)L+=special
		if(undershirt) L+=undershirt
		if(src.soccer)
			L+=/obj/soccerball
		if(overshirt)
			L+=overshirt
		if(legarmor) L+=legarmor
		if(armor)L+=armor
		if(armarmor)L+=armarmor
		if(blindfold)
			L+=/obj/facearmor/s6
		if(glasses)L+=glasses/*
			var/obj/j2=new/obj
			j2.pixel_y=3
			j2.icon=glasses
			j2.layer=MOB_LAYER+5
			L+=j2
			spawn(2)
			del j2*/
		if(facearmor)L+=facearmor/*
			var/obj/j2=new/obj
			j2.pixel_y=3
			j2.icon=facearmor
			j2.layer=MOB_LAYER+5
			L+=j2
			spawn(2)
			del j2*/
		if(cloak)L+=cloak
		if(back)L+=back
		if(weapon)L+=weapon
		if(src.segunda)
			L+=/obj/blacktail
			L+=/obj/horns
		if(src.limitrelease && src.key != "Not|WSHGC")
			if(src.race=="Shinigami")
				L+=/obj/lrelease/a1
				L+=/obj/lrelease/a2
				L+=/obj/lrelease/a3
				L+=/obj/lrelease/a4
			else
				L+=/obj/auramess2/a1
				L+=/obj/auramess2/a2
				L+=/obj/auramess2/a3
				L+=/obj/auramess2/a4
		if(src.ressurectiontype=="Scientist"&&src.ressurection==1)
			L-=weapon
			L+=/obj/releases/Szayel1
			L+=/obj/releases/Szayel2
			L+=/obj/releases/Szayel3
		if(src.ressurectiontype=="Wonderweiss"&&src.ressurection==1)
			L-=weapon
			L+=/obj/releases/Wonder1
			L+=/obj/releases/Wonder2
			L+=/obj/releases/Wonder3
		if(src.ressurectiontype=="Halibel"&&src.ressurection==1)
			L-=weapon
			L+=/obj/releases/Halibel
		if(src.ressurectiontype=="Nnoitra"&&src.ressurection==1)
			L-=weapon
			if(src.wound>=75)
				L+=/obj/Zanpakutou/Nnoitra/a1
				L+=/obj/Zanpakutou/Nnoitra/a2
				L+=/obj/Zanpakutou/Nnoitra/a3
				L+=/obj/Zanpakutou/Nnoitra/a4
				L+=/obj/Zanpakutou/Nnoitra/a5
			if(src.wound<75)
				L+=/obj/Zanpakutou/Nnoitra/n1
				L+=/obj/Zanpakutou/Nnoitra/n2
				L+=/obj/Zanpakutou/Nnoitra/n3
				L+=/obj/Zanpakutou/Nnoitra/n4
				L+=/obj/Zanpakutou/Nnoitra/n5
		if(src.ulqgotsword)
			L+=/obj/Zanpakutou/Ulq
		if(src.ressurectiontype=="Shooter"&&src.ressurection==1)
			L-=weapon
			if(!src.dualon)
				L+=/obj/Zanpakutou/Gun
			if(src.dualon)
				L+=/obj/Zanpakutou/Dual
			L+=/obj/Zanpakutou/StarkMask
		if(src.ressurectiontype=="Ulq"&&src.ressurection==1)
			L-=weapon
			L+=/obj/Ulqmask
			L+=/obj/Ulqwings/w1
			L+=/obj/Ulqwings/w2
			L+=/obj/Ulqwings/w3
		if(src.ressurectiontype=="Luppi"&&src.ressurection==1)
			L-=weapon
			L+=/obj/releases/Luppi
		if(src.ressurectiontype=="Tijereta"&&src.ressurection==1)
			L-=weapon
			L+=/obj/releases/Tijereta
		if(src.ressurectiontype=="Yammy"&&src.ressurection==1)
			L-=weapon
			L+=/obj/releases/YammyRessIcon/yam00
			L+=/obj/releases/YammyRessIcon/yam01
			L+=/obj/releases/YammyRessIcon/yam02
			L+=/obj/releases/YammyRessIcon/yam03
			L+=/obj/releases/YammyRessIcon/yam04
			L+=/obj/releases/YammyRessIcon/yam05
			L+=/obj/releases/YammyRessIcon/yam10
			L+=/obj/releases/YammyRessIcon/yam11
			L+=/obj/releases/YammyRessIcon/yam12
			L+=/obj/releases/YammyRessIcon/yam13
			L+=/obj/releases/YammyRessIcon/yam14
			L+=/obj/releases/YammyRessIcon/yam15
			L+=/obj/releases/YammyRessIcon/yam20
			L+=/obj/releases/YammyRessIcon/yam21
			L+=/obj/releases/YammyRessIcon/yam22
			L+=/obj/releases/YammyRessIcon/yam23
			L+=/obj/releases/YammyRessIcon/yam24
			L+=/obj/releases/YammyRessIcon/yam25
			L+=/obj/releases/YammyRessIcon/yam30
			L+=/obj/releases/YammyRessIcon/yam31
			L+=/obj/releases/YammyRessIcon/yam32
			L+=/obj/releases/YammyRessIcon/yam33
			L+=/obj/releases/YammyRessIcon/yam34
			L+=/obj/releases/YammyRessIcon/yam35
			L+=/obj/releases/YammyRessIcon/yam40
			L+=/obj/releases/YammyRessIcon/yam41
			L+=/obj/releases/YammyRessIcon/yam42
			L+=/obj/releases/YammyRessIcon/yam43
			L+=/obj/releases/YammyRessIcon/yam44
			L+=/obj/releases/YammyRessIcon/yam45
			L+=/obj/releases/YammyRessIcon/yam50
			L+=/obj/releases/YammyRessIcon/yam51
			L+=/obj/releases/YammyRessIcon/yam52
			L+=/obj/releases/YammyRessIcon/yam53
			L+=/obj/releases/YammyRessIcon/yam54
			L+=/obj/releases/YammyRessIcon/yam55
		if(src.ressurectiontype=="Aguila"&&src.ressurection==1)
			L-=weapon
			L+=/obj/releases/Agui1
			L+=/obj/releases/Agui2
			L+=/obj/releases/Agui3
		if(src.ressurectiontype=="Healer"&&src.ressurection==1)
			L += /obj/Zanpakutou/Zangetsu/a1
			L += /obj/Zanpakutou/Zangetsu/a2
			L += /obj/Zanpakutou/Zangetsu/a3
			L += /obj/Zanpakutou/Zangetsu/a4
			L+=/obj/greenauraheal/b1
			L+=/obj/greenauraheal/b2
			L+=/obj/greenauraheal/b3
			L+=/obj/greenauraheal/b4
			L+=/obj/greenauraheal/b5
			L+=/obj/greenauraheal/b6
			L+=/obj/greenauraheal/b7
			L+=/obj/greenauraheal/b8
			L+=/obj/greenauraheal/b9
			L+=/obj/custom/orgsuit13
			L-=weapon
			L -= /obj/ichigoclothes
		if(src.ressurectiontype=="Skeleton"&&src.ressurection==1)
			L-=weapon
			L-=overshirt
			L-=cloak
			src.overlays+=/obj/releases/Skeleton
			src.overlays+=/obj/releases/Skeleton1
			src.overlays+=/obj/releases/Skeleton2
			if(src.segunda)
				src.overlays+=/obj/blacktail
				src.overlays+=/obj/horns
			if(src.colorr=="Blue"&&src.ctf==2)
				src.overlays += /obj/blue
			if(src.colorr=="Red"&&src.ctf==2)
				src.overlays += /obj/red
			if(src.flags=="blue")
				src.overlays += /obj/blueflag
			if(src.flags=="red")
				src.overlays += /obj/redflag
			return
		if(src.ressurectiontype=="Freezing Panther"&&src.ressurection==1)
			L-=weapon
			L+=/obj/hitsugrim/bl
			L+=/obj/hitsugrim/bm
			L+=/obj/hitsugrim/br
			L+=/obj/hitsugrim/ml
			L+=/obj/hitsugrim/mm
			L+=/obj/hitsugrim/mr
			L+=/obj/hitsugrim/tl
			L+=/obj/hitsugrim/tm
			L+=/obj/hitsugrim/tr
			src.icon='Icons/BlankBase.dmi'
		if(src.ressurectiontype=="Zommari"&&src.ressurection==1)
			L-=weapon
			L+=/obj/releases/Zommari
		if(src.ressurectiontype=="Nell"&&src.ressurection==1)
			L-=weapon
			L-=overshirt
			L-=cloak
			L+=/obj/releases/Nell5
			L+=/obj/releases/Nell1
			L+=/obj/releases/Nell2
			L+=/obj/releases/Nell3
			L+=/obj/releases/Nell4
			L+=/obj/releases/Nell6
		if(src.ressurectiontype=="Volcanica"&&src.ressurection==1)
			L-=weapon
			L+=/obj/releases/Volcanica
		if(src.ressurectiontype=="Dordoni"&&src.ressurection==1)
			L-=weapon
			L+=/obj/releases/Dordoni1
			L+=/obj/releases/Dordoni2
			L+=/obj/releases/Dordoni3
			L+=/obj/releases/Dordoni4
		if(src.ressurectiontype=="Pantera"&&src.ressurection==1)
			L-=weapon
			L-=overshirt
			L-=cloak
			L+=/obj/releases/Pantera
		if(src.ressurectiontype=="Del Toro"&&src.ressurection==1)
			L-=weapon
			//L-=overshirt
			//L-=cloak
//			L+=/obj/releases/Del1
//			L+=/obj/releases/Del2
//			L+=/obj/releases/Del3
//			L+=/obj/releases/DelToro
			L+=/obj/releases/newdel/delb1
			L+=/obj/releases/newdel/delb2
			L+=/obj/releases/newdel/delb3
			L+=/obj/releases/newdel/delb4
			L+=/obj/releases/newdel/del2b1
			L+=/obj/releases/newdel/del2b2
			L+=/obj/releases/newdel/del2b3
			L+=/obj/releases/newdel/del2b4
			L+=/obj/releases/newdel/del3b1
			L+=/obj/releases/newdel/del3b2
			L+=/obj/releases/newdel/del3b3
			L+=/obj/releases/newdel/del3b4
			L+=/obj/releases/newdel/del4b1
			L+=/obj/releases/newdel/del4b2
			L+=/obj/releases/newdel/del4b3
			L+=/obj/releases/newdel/del4b4
	/*	if(src.ressurectiontype=="Nell"&&src.ressurection==1)
			L-=weapon
			//L-=overshirt
			//L-=cloak
			L+=/obj/releases/Nel1
			L+=/obj/releases/Nel2
			L+=/obj/releases/Nel3
			L+=/obj/releases/NelToro*/
		if(src.stype=="Shinji")
			if(src.inshikai)
				L-=weapon
				L+=/obj/Zanpakutou/ShinjiShikai
			if(src.inbankai)
				L-=weapon
				L+=/obj/Zanpakutou/ShinjiShikai2
		if(src.stype == "Zaraki")
			if(src.inshikai)
				L-=weapon
				L+=/obj/Zanpakutou/ZaShikai1
				L+=/obj/Zanpakutou/ZaShikai2
				L+=/obj/Zanpakutou/ZaShikai3
				L+=/obj/Zanpakutou/ZaShikai4
				L+=/obj/Zanpakutou/ZaShikai5
				L+=/obj/Zanpakutou/ZaShikai6
				L+=/obj/Zanpakutou/ZaShikai7
				L+=/obj/Zanpakutou/ZaShikai8
				L+=/obj/Zanpakutou/ZaShikai9
				L += /obj/rage
				L += /obj/rage1
			if(src.inbankai&&!src.inberserk)
				L-=weapon
				L += /obj/aura/a1
				L += /obj/aura/a2
				L += /obj/aura/a3
				L += /obj/aura/a4
				L += /obj/aura/b1
				L += /obj/aura/b2
				L += /obj/aura/b3
				L += /obj/aura/b4
				L += /obj/aura/c1
				L += /obj/aura/c2
				L += /obj/aura/c3
				L += /obj/aura/c4
				L += /obj/aura/d1
				L += /obj/aura/d2
				L += /obj/aura/d3
				L += /obj/aura/d4
				L+=/obj/Zanpakutou/ZaShikai1
				L+=/obj/Zanpakutou/ZaShikai2
				L+=/obj/Zanpakutou/ZaShikai3
				L+=/obj/Zanpakutou/ZaShikai4
				L+=/obj/Zanpakutou/ZaShikai5
				L+=/obj/Zanpakutou/ZaShikai6
				L+=/obj/Zanpakutou/ZaShikai7
				L+=/obj/Zanpakutou/ZaShikai8
				L+=/obj/Zanpakutou/ZaShikai9
			if(src.inbankai&&src.inberserk)
				L += /obj/kenaura/a1
				L += /obj/kenaura/a2
				L += /obj/kenaura/a3
				L += /obj/kenaura/a4
				L += /obj/kenaura/a11
				L += /obj/kenaura/a21
				L += /obj/kenaura/a31
				L += /obj/kenaura/a41
				L += /obj/kenaura/a111
				L += /obj/kenaura/a211
				L += /obj/kenaura/a311
				L += /obj/kenaura/a411
				L += /obj/kenaura/a1111
				L += /obj/kenaura/a2111

		if(src.ressurectiontype=="wshgcdark")
			if(src.ressurection)
				L += /obj/DarkBatBW78999/w1
				L += /obj/DarkBatBW78999/w2
				L += /obj/DarkBatBW78999/w3

		if(src.ressurectiontype=="Dark Bat")
			if(src.ressurection)
				L += /obj/DarkBatB
				L += /obj/DarkBatB/w1
				L += /obj/DarkBatB/w2
				L += /obj/DarkBatB/w3
				L += /obj/DarkBatS/Rukia

		if(src.ftype == "Dark Bat")
			if(src.infull)
				L += /obj/DarkBatS/Rukia
				L -= weapon
			if(src.inafull)
				L += /obj/DarkBatB
				L += /obj/DarkBatB/w1
				L += /obj/DarkBatB/w2
				L += /obj/DarkBatB/w3
				L += /obj/DarkBatS/Rukia
		if(src.stype == "Dark Bat")
			if(src.inshikai)
				L += /obj/DarkBatS/Rukia
				L -= weapon
			if(src.inbankai)
				L += /obj/DarkBatB
				L += /obj/DarkBatB/w1
				L += /obj/DarkBatB/w2
				L += /obj/DarkBatB/w3
				L += /obj/DarkBatS/Rukia
				//L += /obj/DarkBatB/DarkBatWhite
				//L += /obj/DarkBatB/RukiaRelease
				L -= weapon
		if(src.stype == "Rukia")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Rukia
				L -= weapon
		if(src.stype == "Ichimaru")
			if(src.inshikai||src.inbankai)
				L -= weapon
				if(!src.extending)
					L += /obj/Zanpakutou/Shinsou
		if(src.stype == "Hisagi")
			if(src.inshikai)
				L += /obj/Zanpakutou/Hisagi
				L += /obj/Zanpakutou/Hisagi2
				L -= weapon
			if(src.inbankai)
				L += /obj/Zanpakutou/Hisagib
				L += /obj/Zanpakutou/Hisagi2b
				L -= weapon
		if(src.stype=="Shusuke")
			if(src.inshikai)
				L+=/obj/Shusuke/Shikai
				L-=weapon
			if(src.inbankai)
				L+=/obj/Shusuke/b1
				L+=/obj/Shusuke/b2
				L+=/obj/Shusuke/b3
				L+=/obj/Shusuke/b4
				L+=/obj/Shusuke/b5
				L+=/obj/Shusuke/b6
				L+=/obj/Shusuke/b7
				L+=/obj/Shusuke/b8
				L+=/obj/Shusuke/b9
				L-=weapon
		if(src.stype=="Pheonix")
			if(src.inshikai||src.inbankai)
				L+=/obj/Zanpakutou/Customzan/MidLeft
				L+=/obj/Zanpakutou/Customzan/MidMid
				L+=/obj/Zanpakutou/Customzan/MidRight
				L+=/obj/Zanpakutou/Customzan/TopLeft
				L+=/obj/Zanpakutou/Customzan/TopMid
				L+=/obj/Zanpakutou/Customzan/TopRight
				L+=/obj/Zanpakutou/Customzan/Aurabot
				L+=/obj/Zanpakutou/Customzan/Auramid
				L+=/obj/Zanpakutou/Customzan/Auratop
				L-=weapon
		if(src.stype=="Hyosuke")
			if(src.inshikai||src.inbankai)
				L+=/obj/Custzana/b1
				L+=/obj/Custzana/b2
				L+=/obj/Custzana/b3
				L+=/obj/Custzana/b4
				L+=/obj/Custzana/b5
				L+=/obj/Custzana/b6
				L+=/obj/Custzana/b7
				L+=/obj/Custzana/b8
				L+=/obj/Custzana/b9
				L+=/obj/Custzana/b10
		if(src.stype=="Lightning")
			if(src.inshikai)
				L+=/obj/Zanpakutou/CCLeut
				L+=/obj/Zanpakutou/CCLeut2
				L-=weapon
			if(src.inbankai)
		//		L+=/obj/Zanpakutou/CCLeut
				L+=/obj/Zanpakutou/CCLeut2
				L+=/obj/Zanpakutou/CCLeut3
				L-=weapon
		if(src.stype == "Renji")
			if(src.inshikai)
				L -= weapon
				if(!src.extending)
					L += /obj/Zanpakutou/Zabimaru
			if(src.inbankai)
				L+=/obj/Zanpakutou/Zabimaru_Bankai
				L+=/obj/renjiclothes
				L-=cloak
				L -= weapon
				L-=/obj/Zanpakutou/Zabimaru
				L+=/obj/zabimaru/body/b1
				L+=/obj/zabimaru/body/b2
				L+=/obj/zabimaru/body/b3
				L+=/obj/zabimaru/body/b4
				L+=/obj/zabimaru/body/b5
				L+=/obj/zabimaru/body/top/b1
				L+=/obj/zabimaru/body/top/b2
				L+=/obj/zabimaru/body/top/b3
				L+=/obj/zabimaru/body/top/b4
				L+=/obj/zabimaru/body/top/b5
				if(!src.extending)
					L+=/obj/zabimaru/body/up/b1
					L+=/obj/zabimaru/body/up/b2
					L+=/obj/zabimaru/body/up/b3
					L+=/obj/zabimaru/body/up/b4
					L+=/obj/zabimaru/body/up/b5
					L+=/obj/zabimaru/body/up/b6
					L+=/obj/zabimaru/body/up/b7
		if(src.stype == "Kira")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Kira
				L -= weapon
		if(src.stype == "Byakuya"||src.stype == "Rangiku" && src.key != "Dragonpearl123")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Byakuya
				L -= weapon
		if(src.stype=="Byakuya")
			if(src.inshikai||src.inbankai)
				if(!src.senkei&&!src.safezone)
					L +=/obj/petalpieces/up
					L +=/obj/petalpieces/down
					L +=/obj/petalpieces/left
					L +=/obj/petalpieces/right
					L +=/obj/petalpieces/middle
		if(src.stype=="Byakuya"&&src.key=="Dragonpearl123")
			if(src.inshikai||src.inbankai)
				if(!src.senkei&&!src.safezone)
					L +=/obj/petalpieces/up
					L +=/obj/petalpieces/down
					L +=/obj/petalpieces/left
					L +=/obj/petalpieces/right
					L +=/obj/petalpieces/middle
					L += /obj/rage
					L += /obj/rage1
		if(src.stype == "Rangiku"&&src.key=="Dragonpearl123")
			if(src.inshikai)
				L +=/obj/smokepieces/up
				L +=/obj/smokepieces/down
				L +=/obj/smokepieces/left
				L +=/obj/smokepieces/right
				L +=/obj/smokepieces/mid
				L += /obj/rage
				L += /obj/rage1
			if(src.inbankai)
				L +=/obj/smokepieces/up
				L +=/obj/smokepieces/down
				L +=/obj/smokepieces/left
				L +=/obj/smokepieces/right
				L +=/obj/smokepieces/mid
				L += /obj/aura/a1
				L += /obj/aura/a2
				L += /obj/aura/a3
				L += /obj/aura/a4
				L += /obj/aura/b1
				L += /obj/aura/b2
				L += /obj/aura/b3
				L += /obj/aura/b4
				L += /obj/aura/c1
				L += /obj/aura/c2
				L += /obj/aura/c3
				L += /obj/aura/c4
				L += /obj/aura/d1
				L += /obj/aura/d2
				L += /obj/aura/d3
				L += /obj/aura/d4
		if(src.smoking)
			L +=/obj/smokepieces/up
			L +=/obj/smokepieces/down
			L +=/obj/smokepieces/left
			L +=/obj/smokepieces/right
			L +=/obj/smokepieces/mid
			L += /obj/rage
			L += /obj/rage1
		if(src.senkei)
			L += /obj/Byakusword
		if(src.stype == "Hinamori")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Hinamori
				L -= weapon
		if(src.stype == "Ikkaku")
			if(src.inshikai)
				L += /obj/Zanpakutou/Ikkaku
				L -= weapon
			if(src.inbankai)
				L += /obj/nikkaku1
				L += /obj/nikkaku2
				L += /obj/nikkaku3
				L += /obj/nikkaku4
				L += /obj/nikkaku5
				L += /obj/nikkaku6
				if(src.rage>=12.5&&src.rage<15)
					L += /obj/nikkaku3d1
					L += /obj/nikkaku4d1
					L += /obj/nikkaku5d1
					L += /obj/nikkaku6d1
				if(src.rage>=15&&src.rage<17.5)
					L += /obj/nikkaku3d2
					L += /obj/nikkaku4d2
					L += /obj/nikkaku5d2
					L += /obj/nikkaku6d2
				if(src.rage>=17.5&&src.rage<20)
					L += /obj/nikkaku3d3
					L += /obj/nikkaku4d3
					L += /obj/nikkaku5d3
					L += /obj/nikkaku6d3
				if(src.rage>=20)
					L += /obj/nikkaku3d4
					L += /obj/nikkaku4d4
					L += /obj/nikkaku5d4
					L += /obj/nikkaku6d4
				L-=weapon
		if(src.stype == "Tousen")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Tousen
				L -= weapon
		//matsuricopy
		if(src.stype == "Matsuri")
			if(src.inshikai)
				L += /obj/Zanpakutou/MatsShikai1
				L += /obj/Zanpakutou/MatsShikai2
				L += /obj/Zanpakutou/MatsShikai3
				L += /obj/Zanpakutou/MatsShikai4
				L += /obj/Zanpakutou/MatsShikai5
				L += /obj/Zanpakutou/MatsShikai6
				L += /obj/Zanpakutou/MatsShikai7
				L += /obj/Zanpakutou/MatsShikai8
				L += /obj/Zanpakutou/MatsShikai9
				L -= weapon
			if(src.inbankai)
				L += /obj/Zanpakutou/MatsBankai1
				L += /obj/Zanpakutou/MatsBankai2
				L += /obj/Zanpakutou/MatsBankai3
				L += /obj/Zanpakutou/MatsBankai4
				L += /obj/Zanpakutou/MatsBankai5
				L += /obj/Zanpakutou/MatsBankai6
				L += /obj/Zanpakutou/MatsBankai7
				L += /obj/Zanpakutou/MatsBankai8
				L += /obj/Zanpakutou/MatsBankai9
				L -= weapon
		//end matsuricopy
		if(src.stype == "Kensei")
			if(src.inshikai)
				L += /obj/Zanpakutou/Kensei
				L -= weapon
			if(src.inbankai)
				L += /obj/Zanpakutou/Kenseib
				L -= weapon
		if(src.stype == "Urahara")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Urahara
				L -= weapon
		if(src.trans10)
			L+=/obj/QuincyVandAura/BL
			L+=/obj/QuincyVandAura/BM
			L+=/obj/QuincyVandAura/BR
			L+=/obj/QuincyVandAura/ML
			L+=/obj/QuincyVandAura/M
			L+=/obj/QuincyVandAura/MR
			L+=/obj/QuincyVandAura/TL
			L+=/obj/QuincyVandAura/TM
			L+=/obj/QuincyVandAura/TR
		if(!src.trans10)
			L-=/obj/QuincyVandAura/BL
			L-=/obj/QuincyVandAura/BM
			L-=/obj/QuincyVandAura/BR
			L-=/obj/QuincyVandAura/ML
			L-=/obj/QuincyVandAura/M
			L-=/obj/QuincyVandAura/MR
			L-=/obj/QuincyVandAura/TL
			L-=/obj/QuincyVandAura/TM
			L-=/obj/QuincyVandAura/TR

		if(src.inVandBoost)
			L+=/obj/QuincyVandAura/BL
			L+=/obj/QuincyVandAura/BM
			L+=/obj/QuincyVandAura/BR
			L+=/obj/QuincyVandAura/ML
			L+=/obj/QuincyVandAura/M
			L+=/obj/QuincyVandAura/MR
			L+=/obj/QuincyVandAura/TL
			L+=/obj/QuincyVandAura/TM
			L+=/obj/QuincyVandAura/TR
		if(!src.inVandBoost)
			L-=/obj/QuincyVandAura/BL
			L-=/obj/QuincyVandAura/BM
			L-=/obj/QuincyVandAura/BR
			L-=/obj/QuincyVandAura/ML
			L-=/obj/QuincyVandAura/M
			L-=/obj/QuincyVandAura/MR
			L-=/obj/QuincyVandAura/TL
			L-=/obj/QuincyVandAura/TM
			L-=/obj/QuincyVandAura/TR
		if(src.trans6)
			L+=/obj/VaiRageAura/BR
			L+=/obj/VaiRageAura/BL
			L+=/obj/VaiRageAura/TR
			L+=/obj/VaiRageAura/TL
		if(!src.trans6)
			L-=/obj/VaiRageAura/BR
			L-=/obj/VaiRageAura/BL
			L-=/obj/VaiRageAura/TR
			L-=/obj/VaiRageAura/TL
		if(src.stype == "Muramasa")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Muramasa
				L -= weapon
		if(src.stype == "Stinger")
			if(src.inshikai)
				L += /obj/Zanpakutou/Stinger
				L -= weapon
			if(src.inbankai)
				L += /obj/Zanpakutou/Torpedo
				L += /obj/Zanpakutou/Torpedo2
				L -= weapon
		if(src.stype == "Unohana")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Unohana
				L -= weapon
			if(src.inbankai)
				L += /obj/unohana/a1
				L += /obj/unohana/a2
				L += /obj/unohana/a3
				L += /obj/unohana/a4
				L += /obj/unohana/a5
				L += /obj/unohana/a6
				L += /obj/unohana/b1
				L += /obj/unohana/b2
				L += /obj/unohana/b3
				L += /obj/unohana/b4
				L += /obj/unohana/b5
				L += /obj/unohana/b6
				L += /obj/unohana/c1
				L += /obj/unohana/c2
				L += /obj/unohana/c3
				L += /obj/unohana/c4
				L += /obj/unohana/c5
				L += /obj/unohana/c6
				L += /obj/unohana/d1
				L += /obj/unohana/d2
				L += /obj/unohana/d3
				L += /obj/unohana/d4
				L += /obj/unohana/d5
				L += /obj/unohana/d6
				L += /obj/unohana/e1
				L += /obj/unohana/e2
				L += /obj/unohana/e3
				L += /obj/unohana/e4
				L += /obj/unohana/e5
				L += /obj/unohana/e6
				L += /obj/unohana/f1
				L += /obj/unohana/f2
				L += /obj/unohana/f3
				L += /obj/unohana/f4
				L += /obj/unohana/f5
				L += /obj/unohana/f6
		if(src.stype == "Ukitake")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Ukitake
				L -= weapon
		if(src.stype == "Ichigo")
			if(src.inshikai)
				L += /obj/Zanpakutou/Zangetsu/a1
				L += /obj/Zanpakutou/Zangetsu/a2
				L += /obj/Zanpakutou/Zangetsu/a3
				L += /obj/Zanpakutou/Zangetsu/a4
				L -= /obj/ichigoclothes
				L -= weapon
			if(src.inbankai)
				if(!src.isfgt)
					if(!src.inbankai2)
						L+=/obj/ichigoclothes
					if(src.inbankai2)
						L+=/obj/ichigoclothes2
					L-=cloak
					L-=/obj/Zanpakutou/Zangetsu
					L+=/obj/Zanpakutou/Tensa
					L -= weapon
					if(src.race=="Bankai")
						L-=/obj/ichigoclothes
		if(src.stype == "Yumichika")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Yumichika
				//if(src.inbankai)
				//	L += /obj/Zanpakutou/YumichikaGlow
				L -= weapon
		if(src.stype=="Fujimaru")
			if(src.inshikai)
				L+=/obj/Zanpakutou/Fujishikaiover
				L-=weapon
			if(src.inbankai)
				L+=/obj/Zanpakutou/Fujibankaiover
/*				L+=/obj/Zanpakutou/Susano1
				L+=/obj/Zanpakutou/Susano2
				L+=/obj/Zanpakutou/Susano3
				L+=/obj/Zanpakutou/Susano4
				L+=/obj/Zanpakutou/Susano5
				L+=/obj/Zanpakutou/Susano6*/
				L-=weapon
		if(src.stype=="Love")
			if(src.inshikai||src.inbankai)
				L+=/obj/Zanpakutou/Love
				L+=/obj/Zanpakutou/Love2
				L+=/obj/Zanpakutou/Love3
				L+=/obj/Zanpakutou/Love4
				L-=weapon
		if(src.stype == "Shonshui")
			if(src.inshikai||src.inbankai)
				//L += /obj/Zanpakutou/Shonshui
				L +=/obj/Zanpakutou/Shonshui2
				L +=/obj/Zanpakutou/Shonshui3
				L +=/obj/Zanpakutou/Shonshui4
				L +=/obj/Zanpakutou/Shonshui5
				L -= weapon
		if(src.stype == "Kaiens")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Kaien
				L -= weapon
		if(src.stype == "Mayuri" && src.key !="WitchOfEastEnd")
			if(src.inshikai)
				L += /obj/Zanpakutou/Mayuri
				L -= weapon
			if(src.inbankai)
				L += /obj/Zanpakutou/Mayuri
				L -= weapon
				L += /obj/Zanpakutou/Mayuri/M1
				L += /obj/Zanpakutou/Mayuri/M2
				L += /obj/Zanpakutou/Mayuri/M3
				L += /obj/Zanpakutou/Mayuri/M4
				L += /obj/Zanpakutou/Mayuri/M5
				L += /obj/Zanpakutou/Mayuri/M6
				L += /obj/Zanpakutou/Mayuri/M7
				L += /obj/Zanpakutou/Mayuri/M8
				L += /obj/Zanpakutou/Mayuri/M9
		if(src.stype == "Yammamoto")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/RyuujinJakka
				L -= weapon
			if(src.inshikai)
				L += /obj/FireAura/a1
				L += /obj/FireAura/a2
				L += /obj/FireAura/a3
				L += /obj/FireAura/a4
			if(src.inbankai)
				L -= /obj/FireAura/a1
				L -= /obj/FireAura/a2
				L -= /obj/FireAura/a3
				L -= /obj/FireAura/a4
		if(src.stype == "Kommamaru")
			if(src.inbankai)
				/*L += /obj/Kbankai/k01
				L += /obj/Kbankai/k011
				L += /obj/Kbankai/k0111
				L += /obj/Kbankai/k01111
				L += /obj/Kbankai/k1
				L += /obj/Kbankai/k11
				L += /obj/Kbankai/k111
				L += /obj/Kbankai/k1111
				L += /obj/Kbankai/k21
				L += /obj/Kbankai/k211
				L += /obj/Kbankai/k2111
				L += /obj/Kbankai/k21111
				L += /obj/Kbankai/k31
				L += /obj/Kbankai/k311
				L += /obj/Kbankai/k3111
				L += /obj/Kbankai/k31111
				L += /obj/Kbankai/k41
				L += /obj/Kbankai/k411
				L += /obj/Kbankai/k4111
				L += /obj/Kbankai/k41111*/
				L +=/obj/Kban/a1
				L +=/obj/Kban/a2
				L +=/obj/Kban/a3
				L +=/obj/Kban/a4
				L +=/obj/Kban/b0
				L +=/obj/Kban/b1
				L +=/obj/Kban/b2
				L +=/obj/Kban/b3
				L +=/obj/Kban/b4
				L +=/obj/Kban/b5
				L +=/obj/Kban/c0
				L +=/obj/Kban/c1
				L +=/obj/Kban/c2
				L +=/obj/Kban/c3
				L +=/obj/Kban/c4
				L +=/obj/Kban/c5
				L +=/obj/Kban/d0
				L +=/obj/Kban/d1
				L +=/obj/Kban/d2
				L +=/obj/Kban/d3
				L +=/obj/Kban/d4
				L +=/obj/Kban/d5
				L +=/obj/Kban/e0
				L +=/obj/Kban/e1
				L +=/obj/Kban/e2
				L +=/obj/Kban/e3
				L +=/obj/Kban/e4
				L +=/obj/Kban/e5
				L +=/obj/Kban/f0
				L +=/obj/Kban/f1
				L +=/obj/Kban/f2
				L +=/obj/Kban/f3
				L +=/obj/Kban/f4
				L +=/obj/Kban/g2
				L +=/obj/Kban/g3
		if(src.stype=="Sword Multiplier")
			if(src.inshikai||src.inbankai)
				L+=/obj/Floatingswordzan/top2
				L+=/obj/Floatingswordzan/top
				L+=/obj/Floatingswordzan/left
				L+=/obj/Floatingswordzan/right
				L -= weapon
		if(src.firesworduse)
			L += /obj/Zanpakutou/fireswordnew/b1
			L += /obj/Zanpakutou/fireswordnew/b2
			L += /obj/Zanpakutou/fireswordnew/b3
			L += /obj/Zanpakutou/fireswordnew/b4
			L += /obj/Zanpakutou/fireswordnew/b5
			L += /obj/Zanpakutou/fireswordnew/b6
			L += /obj/Zanpakutou/fireswordnew/b7
			L += /obj/Zanpakutou/fireswordnew/b8
			L += /obj/Zanpakutou/fireswordnew/b9
			L+=weapon
		if(src.stype == "Jiroubou")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Jiroubou
				L -= weapon
				if(src.hs)
					L+= /obj/jiroaura
		if(src.stype == "Hitsugaya")
			if(src.inshikai)
				L += /obj/Zanpakutou/Toushi
			if(src.inbankai)
				L += /obj/Zanpakutou/Toushi
				L += /obj/hwings1
				L += /obj/hwings2
				L += /obj/hwings3
				L += /obj/hwings4
				L += /obj/hwings5
				L += /obj/hwings6
				L += /obj/hwings7
				L += /obj/hwings8
				L += /obj/hwings9
				L += /obj/hwings10
		if(src.hellon == 1)
			L -= weapon
			L += /obj/Hell/Hell_Armor
		if(src.armon == 1)
			L -= weapon
			L += /obj/Arm/Arm1
		if(src.armon == 2)
			L -= weapon
			L += /obj/Arm/Arm2
		if(src.armon == 3)
			L -= weapon
			L += /obj/Arm/Arm3
		if(src.armon == 4)
			L -= weapon
			L += /obj/Arm/Arm4
			L += /obj/Arm/Arm3
		if(src.dparmon)
			L -= weapon
			L += /obj/Arm/Arm4
			L += /obj/Arm/Arm3
		if(src.lamuerte)
			L += /obj/SadoCharge
		if(src.directo||src.besar)
			L += 'Icons/eldirectocharge.dmi'
		if(src.sanrei)
			L += /obj/sanrei
		if(src.bowon&&!src.sanrei&&!src.spiritweapon)
			if(!src.seelsword)
				L += image('Icons/QuincyBow1V.dmi',,,MOB_LAYER+4)
		if(src.sanrei&&src.bowon&&!src.gotfinal2&&!src.spiritweapon)
			if(!src.seelsword)
				L += image('Icons/QuincyBow2V.dmi',,,MOB_LAYER+4)
		if(src.sanrei&&src.bowon&&src.gotfinal2&&!src.finalb&&!src.spiritweapon)
			L -= image('Icons/QuincyBow2V.dmi',,,MOB_LAYER+4)
			if(!src.seelsword)
				L += image('Icons/QuincyBow4V.dmi',,,MOB_LAYER+4)
		if(src.finalb && src.gotfinal2)
			L -= image('Icons/QuincyBow4V.dmi',,,MOB_LAYER+4)
			if(!src.seelsword&&!src.spiritweapon)
				L += image('Icons/QuincyBowFFV.dmi',,,MOB_LAYER+4)
			L += /obj/Wing/w1
			L += /obj/Wing/w2
		if(src.finalb && !src.gotfinal2)
			L += /obj/Wing/w1
			L += /obj/Wing/w2
		if(src.bowon&&src.spiritweapon==1)
			L += image('Icons/Guns2.dmi',,,MOB_LAYER+4)
		if(src.bowon&&src.spiritweapon==2)
			L += /obj/Seelesword
		if(src.seelsword)
			L += /obj/Seelesword
		if(src.inran)
			L += /obj/ran
		if(src.shunko||src.tshunko)
			L += /obj/shunko
		if(src.colorr == "Blue"&&src.ctf==2)
			L += /obj/blue
		if(src.colorr=="Red"&&src.ctf==2)
			L += /obj/red
		if(src.flags=="blue")
			L += /obj/blueflag
		if(src.flags=="red")
			L += /obj/redflag
		if(src.in_team)
			L += /obj/gl
		if(src.tensat)
			L += /obj/Zanpakutou/Tensat
		if(src.tekkaion)
			src.overlays+=/obj/tekkaisado
		if(src.infinal&&src.race!="Fullbringer")
			L -= weapon
			L += /obj/Zanpakutou/Final
			L += /obj/finalclothes
		if(src.smoking)
			src.overlays+=/obj/smokepieces/mid
			src.overlays+=/obj/smokepieces/up
			src.overlays+=/obj/smokepieces/down
			src.overlays+=/obj/smokepieces/right
			src.overlays+=/obj/smokepieces/left
		if(src.infull)
			L -= weapon
			if(src.ftype=="Fire Doll")
				L += /obj/Zanpakutou/FireBount/F1
				L += /obj/Zanpakutou/FireBount/F2
				L += /obj/Zanpakutou/FireBount/F3
				L += /obj/Zanpakutou/FireBount/F4
				L += /obj/Zanpakutou/FireBount/F5
			if(src.ftype=="Shishigawara")
				L+=weapon
			if(src.ftype=="Tsukishima")
				L += /obj/Zanpakutou/Tsukishima
			if(src.ftype=="Wings")
				L += /obj/Zanpakutou/awings/right
				L += /obj/Zanpakutou/awings/left
				L+=weapon
			if(src.ftype=="Samurai")
				L += /obj/Zanpakutou/swordfb/b1
				L += /obj/Zanpakutou/swordfb/b2
				L += /obj/Zanpakutou/swordfb/b3
				L += /obj/Zanpakutou/swordfb/b4
				L += /obj/Zanpakutou/swordfb/b5
				L += /obj/Zanpakutou/swordfb/b6
				L += /obj/Zanpakutou/swordfb/b7
				L += /obj/Zanpakutou/swordfb/b8
				L += /obj/Zanpakutou/swordfb/b9
				L+=weapon
			if(src.ftype=="Ginjo")
				L += /obj/Zanpakutou/Ginjo
			if(src.ftype=="Jackie"||src.ftype=="Yukio"||src.ftype=="Shishigawara")
				L+=weapon
			if(src.ftype=="Ichigo")
				L += /obj/Zanpakutou/Ichigo_F
				L += /obj/Zanpakutou/Ichigo_F2
				if(src.getsugaring>=150)
					L += /obj/fichigoclothes
					L -= /obj/Zanpakutou/Ichigo_F
					L -= /obj/Zanpakutou/Ichigo_F2
					L += /obj/Zanpakutou/Ichigo_F3
					L-= cloak
			if(src.ftype=="Water Doll")
				L += /obj/Zanpakutou/WaterDoll/F1
				L += /obj/Zanpakutou/WaterDoll/F2
				L += /obj/Zanpakutou/WaterDoll/F3
				L += /obj/Zanpakutou/WaterDoll/F4
				L += /obj/Zanpakutou/WaterDoll/F5
				L += /obj/Zanpakutou/WaterDoll/F6
				L += /obj/Zanpakutou/WaterDoll/F7
				L += /obj/Zanpakutou/WaterDoll/F8
				L += /obj/Zanpakutou/WaterDoll/F9
		if(src.inafull)
			L -= weapon
			if(src.ftype=="Shishigawara")
				L += weapon
			if(src.ftype=="Ichigo")
				L += /obj/weapon/sword
				L += /obj/fichigoclothes2
				L -= cloak
			if(src.ftype=="Ginjo")
				L += /obj/Zanpakutou/Ginjo2
				L += /obj/fichigoclothes2
			if(src.ftype=="Tsukishima")
				L += /obj/Zanpakutou/Tsukishima
			if(src.ftype=="Jackie")
				L += /obj/Zanpakutou/Jackie
			if(src.ftype=="Wings")
				L += /obj/Zanpakutou/awings/right
				L += /obj/Zanpakutou/awings/left
				L+=weapon
			if(src.ftype=="Samurai")
				L+=weapon
				L += /obj/Zanpakutou/swordfb/b1
				L += /obj/Zanpakutou/swordfb/b2
				L += /obj/Zanpakutou/swordfb/b3
				L += /obj/Zanpakutou/swordfb/b4
				L += /obj/Zanpakutou/swordfb/b5
				L += /obj/Zanpakutou/swordfb/b6
				L += /obj/Zanpakutou/swordfb/b7
				L += /obj/Zanpakutou/swordfb/b8
				L += /obj/Zanpakutou/swordfb/b9
				L += /obj/Zanpakutou/swordfbaura/topleft
				L += /obj/Zanpakutou/swordfbaura/topright
				L += /obj/Zanpakutou/swordfbaura/botleft
				L += /obj/Zanpakutou/swordfbaura/botright
			if(src.ftype=="wshgcfb")
				L+=weapon
			/*	L += /obj/Zanpakutou/swordfb/b1
				L += /obj/Zanpakutou/swordfb/b2
				L += /obj/Zanpakutou/swordfb/b3
				L += /obj/Zanpakutou/swordfb/b4
				L += /obj/Zanpakutou/swordfb/b5
				L += /obj/Zanpakutou/swordfb/b6
				L += /obj/Zanpakutou/swordfb/b7
				L += /obj/Zanpakutou/swordfb/b8
				L += /obj/Zanpakutou/swordfb/b9	*/
				L += /obj/Zanpakutou/wshgcfbaura/topleft
				L += /obj/Zanpakutou/wshgcfbaura/topright
				L += /obj/Zanpakutou/wshgcfbaura/botleft
				L += /obj/Zanpakutou/wshgcfbaura/botright
			if(src.ftype=="Fire Doll")
				L += /obj/Zanpakutou/FireDoll/F1
				L += /obj/Zanpakutou/FireDoll/F2
				L += /obj/Zanpakutou/FireDoll/F3
				L += /obj/Zanpakutou/FireDoll/F4
				L += /obj/Zanpakutou/FireDoll/F5
				L += /obj/Zanpakutou/FireDoll/F6
				L += /obj/Zanpakutou/FireDoll/F7
				L += /obj/Zanpakutou/FireDoll/F8
				L += /obj/Zanpakutou/FireDoll/F9
			if(src.ftype=="Water Doll")
				L += /obj/Zanpakutou/WaterDoll/F1
				L += /obj/Zanpakutou/WaterDoll/F2
				L += /obj/Zanpakutou/WaterDoll/F3
				L += /obj/Zanpakutou/WaterDoll/F4
				L += /obj/Zanpakutou/WaterDoll/F5
				L += /obj/Zanpakutou/WaterDoll/F6
				L += /obj/Zanpakutou/WaterDoll/F7
				L += /obj/Zanpakutou/WaterDoll/F8
				L += /obj/Zanpakutou/WaterDoll/F9
			if(src.ftype=="Yukio")
				L+=weapon
				L += image('Icons/armband.dmi',,,MOB_LAYER+4)
		if(src.wound>=75)
			L += /obj/bloodybase
			L += /obj/bloodybase2
		if(src.wound>=100)
			L += /obj/bloodyneck
		if(src.goingress&&src.race=="Arrancar")
			L += /obj/auramess/a1
			L += /obj/auramess/a2
			L += /obj/auramess/a3
			L += /obj/auramess/a4
		src.overlays=L
		if(src.GedonKido==1)
			src.overlays += /obj/GedonAura/Aura
		if(src.inPeaceBoost)
			src.overlays+=/obj/PeaceBoost/skin
			src.overlays+=/obj/PeaceBoost/sword
		if(src.inHolZan && src.key != "Shadow9927")
			src.overlays+=/obj/HollowZangetsu/Top
			src.overlays+=/obj/HollowZangetsu/Bot
		if(src.inHolZan && src.key == "Shadow9927")
			src.overlays+=/obj/cottonZangetsu3/a1
			src.overlays+=/obj/cottonZangetsu3/a2
			src.overlays+=/obj/cottonZangetsu3/a3
			src.overlays+=/obj/cottonZangetsu3/a4
	/*	if(src.inHolZan && src.key == "Devilminions528")
			src.overlays+=/obj/cottonZangetsu2/c1
			src.overlays+=/obj/cottonZangetsu2/c2
			src.overlays+=/obj/cottonZangetsu2/c3
			src.overlays+=/obj/cottonZangetsu2/c4
			src.overlays+=/obj/cottonZangetsu2/c5
			src.overlays+=/obj/cottonZangetsu2/c6
			src.overlays+=/obj/cottonZangetsu2/c7
			src.overlays+=/obj/cottonZangetsu2/c8
			src.overlays+=/obj/cottonZangetsu2/c9
			src.overlays+=/obj/cottonZangetsu2/c10
			src.overlays+=/obj/cottonZangetsu2/c11
			src.overlays+=/obj/cottonZangetsu2/c12
			src.overlays+=/obj/cottonZangetsu2/c13
			src.overlays+=/obj/cottonZangetsu2/c14
			src.overlays+=/obj/cottonZangetsu2/c15
			src.overlays+=/obj/cottonZangetsu2/c16	*/
		if(src.swordrealbound)
			src.overlays+=/obj/swordfbfreeze/b1
			src.overlays+=/obj/swordfbfreeze/b2
			src.overlays+=/obj/swordfbfreeze/b3
			src.overlays+=/obj/swordfbfreeze/b4
			src.overlays+=/obj/swordfbfreeze/b5
			src.overlays+=/obj/swordfbfreeze/b6
			src.overlays+=/obj/swordfbfreeze/b7
			src.overlays+=/obj/swordfbfreeze/b8
			src.overlays+=/obj/swordfbfreeze/b9
		if(src.wingbound)
			src.overlays+=/obj/WingBind
		if(src.realbound)
			src.overlays+=/obj/custombind/b1
			src.overlays+=/obj/custombind/b2
			src.overlays+=/obj/custombind/b3
			src.overlays+=/obj/custombind/b4
			src.overlays+=/obj/custombind/b5
			src.overlays+=/obj/custombind/b6
			src.overlays+=/obj/custombind/b7
			src.overlays+=/obj/custombind/b8
			src.overlays+=/obj/custombind/b9
		if(src.angeled)
			var/obj/il=new/obj
			il.icon=src.icon
			il.overlays=src.overlays
			il.pixel_x=10
			//il.icon-=rgb(0,0,0,100)
			src.overlays+=il
		/*if(src.arelease)
			src.Affirm_Icon()
			src.icon+=rgb(src.releasered,src.releasegreen,src.releaseblue,255)*/
			/*if(src.releasecolor=="Red")
				src.icon+=rgb(250,0,0,255)
			if(src.releasecolor=="Green")
				src.icon+=rgb(0,250,0,255)
			if(src.releasecolor=="Blue")
				src.icon+=rgb(0,0,250,255)
			if(src.releasecolor=="Yellow")
				src.icon+=rgb(250,250,0,255)
			if(src.releasecolor=="Purple")
				src.icon+=rgb(250,0,250,255)*/



obj/Zanpakutou
	pixel_y=1
	Tousen
		icon='Icons/tousen.dmi'
		layer=MOB_LAYER+8