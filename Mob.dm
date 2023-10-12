mob
	New()
		if(src.level>=50)src.difficulty+=1
		if(src.level>=100)src.difficulty+=1
		if(src.level>=150)src.difficulty+=1
		if(src.level>=200)src.difficulty+=1
		if(src.level>=250)src.difficulty+=1
		if(src.level>=300)src.difficulty+=1
		if(src.level>=350)src.difficulty+=1
		if(src.level>=400)src.difficulty+=1
		if(src.level>=450)src.difficulty+=1
		if(src.level>=500)src.difficulty+=1
		if(src.level>=600)src.difficulty+=1
		if(src.level>=700)src.difficulty+=1
		if(src.level>=800)src.difficulty+=1
		if(src.level>=1000)src.difficulty+=1
		if(src.level>=1500)src.difficulty+=1
		..()
		if(src.race!="Hollow")
			if(src.level>=200)
				src.fstyle=pick(0,1,2,3,4)
	Move()
		if(src.ko==1)return
		..()
	Bump(A)
		/*if(istype(A,/mob/))
			var/mob/M=A
			if(src.ressurection==1 && src.ressurectiontype=="Del Toro"||src.rushing)//||src.inbankai&&src.stype=="Unohana")
				src.Push(M)*/
		if(istype(A,/turf/))
			var/turf/T=A
			if(T.well)
				if(src.getwater==1)
					usr << output("<B>{Mission Helper}:</B> You got the water, now head back to the farmer.","output")
					src.getwater=0
					src.contents+=new/obj/items/mission/bucketofwater
		..()
mob/var
	tmp
		matadoreds
		gotrammed = 0

mob/proc
	Push(mob/M)
		if(!isnull(M))
			if(M.inbankai&&M.stype=="Unohana"||M.ressurection&&M.ressurectiontype=="Del Toro"||src.ko)
				src.moving=0
				return
			if(usr.gotrammed)
				return
			var/turf/fd=get_step(M,src.dir)
			if(!fd.density)
				//var/obj/craters/rammed/T=new/obj/craters/rammed(locate(M.x,M.y,M.z))
				//T.dir=src.dir
				if(!M.rammed==1)M.rammed=1
				var/damage = round(src.attack/2.5)
				if(src.ressurectiontype=="Del Toro")
					damage = round(src.attack/2)
				if(damage <= 1)
					damage =rand(25,1000)
				if(prob(M.matador*2))
					var/d=pick(1,2)
					M.Facedir(src)
					if(d==1)
						M.dir=turn(M.dir,90)
					if(d==2)
						M.dir=turn(M.dir,-90)
					step(M,src.dir)
					M.matadoreds=1
				if(!M.protected)view(usr,8) << "<b><font color = red>[usr] rammed [M]!"
				usr.gotrammed = 1
				sleep(0.25 SECONDS)
				usr.gotrammed = 0
				var/dr=M.dir
		//		step(M,src.dir)
				M.dir=dr
				spawn(2)
				M.rammed=0
				if(!M.matadoreds)
					M.Death(src,damage,pick(0,0,0,2,1))
					step(M,src.dir)
				M.matadoreds=0
/*				if(src.ressurection)
					var/d=0
					for(var/mob/a in get_step(src,src.dir))
						if(!a.ko)
							d+=1
						else if(d==0)
							step(src,src.dir)
						else
							d=0*/
			else
				return
mob/Shadow
 verb
		Death_Note()
			set category = "Commands"
			var/deathwish=input("Who shall you kill?")as text
			if(deathwish == "")
				return
			world<<"<b><font color = gray><font face=times new roman>Death Sentence:[usr] wrote [deathwish] on his Death Note!"
			for(var/mob/M in world)
				if(M.name == deathwish)
					spawn(10)
						M.health = 0
						M.wound=101
						M.safe = 0
						M.Death(usr)

mob
	proc
		Spiritual_Pressure()
			if(!usr.firing)
				if(usr.shaked)
					return
				else
					usr.shaked = 1
					view(8) << "<b><font color = silver>[usr]: ..."
					for(var/mob/M in oview(8))
						if(M.shaking == 0)
							if(usr.rei > M.rei)
								if(M.client)
									M.client.DE_SFL_Uqs()
								M.shaking = 1
								M.rundelay += 3
								spawn(151)
								if(M)
									if(M.client)
										M.client.DE_SFL_ARqs()
									M.shaking = 0
									M.rundelay -= 3
					sleep(1200)
					usr.shaked = 0
mob
 var
		tmp/shaking = 0

mob
 verb
		Race_Say(msg as text)
			set hidden=1
			if(!usr.OOC)
				return
	//		if(!worldC)
	//			return
			if(length(msg) >= 200)
				alert("<b>Your message is too long.")
				return
			if(usr.GM<4)
				if(usr.muted)
					alert("You are muted!")
					return
			if(msg == "")
				return
			else
				if(spamcheck == TRUE)
					usr << "<b>Please wait before talking again!"
					return
				else
					msg = Replace_All(msg,chat_filter)
					msg=S.ParseHTML(msg)
					usr.spamcheck()
					for(var/mob/player/M in world)
						if(M.shinip==usr.shinip&&M.hollow==usr.hollow&&M.earth==usr.earth&&!M.rstoggle)
							M << output("<b><font color=green>([usr.race])[usr]: [msg]","output")//<font face=times new roman>

mob
	New()
		..()
		if(src.name=="{NPC}Sousuke Aizen"||src.name=="Inner Self"||src.name=="{NPC}Zanpakutou{Whisperer}"||src.illusion)
			return
		src.Affirm_Icon()
		src.Load_Overlays()
mob/proc
	Affirm_Icon()
		//var/icon/i
		if(src.name=="zabimaru"&&src.race=="nothing")return
		if(src.ispedal==1)return
		//if(copytext("[src.name]",1,8)=="{Clone}")return
		if(src.race=="Yammy Boss")
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
		if(src.race=="Dark Pheonix")
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
		if(src.race=="Fire Demon")
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/Fire_Demon/fd00
			src.overlays += /obj/Fire_Demon/fd01
			src.overlays += /obj/Fire_Demon/fd02
			src.overlays += /obj/Fire_Demon/fd10
			src.overlays += /obj/Fire_Demon/fd11
			src.overlays += /obj/Fire_Demon/fd12
			return
		if(src.is_dnpc == 1)
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/Red_Demon/top
			src.overlays += /obj/Red_Demon/bottom
			return
		if(src.is_dnpc == 2)
			src.icon='Icons/Blank.dmi'
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
		if(src.race=="Rogue")
			src.icon='Icons/enemies.dmi'
		if(src.Yokai1==1)
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/Yokai/Yokai11
			src.overlays += /obj/Yokai/Yokai12
		if(src.Yokai2==1)
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/Yokai2/Yokai21
			src.overlays += /obj/Yokai2/Yokai22
		if(src.skurn==1)
			src.icon='Icons/BlankBase.dmi'
			src.overlays+=/obj/PSummon/BotLeft
			src.overlays+=/obj/PSummon/BotRight
			src.overlays+=/obj/PSummon/TopLeft
			src.overlays+=/obj/PSummon/TopRight
		if(src.lorelei==2)
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/redwolf/bl
			src.overlays += /obj/redwolf/br
			src.overlays += /obj/redwolf/tl
			src.overlays += /obj/redwolf/tr
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
		if(src.race=="Blank")
			src.icon='Icons/Blank2.dmi'
		if(src.race=="Hollow")
			if(src.hollowtype == "Reaper")
				src.icon='Icons/BlankBase.dmi'
				src.overlays += /obj/reaper1
				src.overlays += /obj/reaper2
			if(src.hollowtype == "bat")
				src.icon="BlankBase.dmi"
				src.overlays += /obj/bat
			if(src.hollowtype=="labtype1")
				src.icon='Icons/BlankBase.dmi'
				src.overlays+=/obj/PantherHollow/BL
				src.overlays+=/obj/PantherHollow/BR
				src.overlays+=/obj/PantherHollow/TL
				src.overlays+=/obj/PantherHollow/TR
			if(src.hollowtype=="swampboss")
				src.icon='Icons/BlankBase.dmi'
				src.overlays += /obj/SwampMonster/Swamp1
				src.overlays += /obj/SwampMonster/Swamp2
				src.overlays += /obj/SwampMonster/Swamp3
				src.overlays += /obj/SwampMonster/Swamp4
			if(src.hollowtype=="swampmini")
				src.icon='Icons/demon monster.dmi'
			if(src.hollowtype=="new adjuchas")
				src.icon='Icons/BlankBase.dmi'
				src.overlays+=/obj/TallAdju/BottomLeft
				src.overlays+=/obj/TallAdju/BottomRight
				src.overlays+=/obj/TallAdju/Bottom2Left
				src.overlays+=/obj/TallAdju/Bottom2Right
				src.overlays+=/obj/TallAdju/Bottom3Left
				src.overlays+=/obj/TallAdju/Bottom3Right
				src.overlays+=/obj/TallAdju/Bottom4Left
				src.overlays+=/obj/TallAdju/Bottom4Right
			if(src.hollowtype == "devil")
				src.icon = 'BlankBase.dmi'
				src.overlays += /obj/demonboss1
				src.overlays += /obj/demonboss2
				src.overlays += /obj/demonboss3
				src.overlays += /obj/demonboss4
				src.overlays += /obj/demonboss5
				src.overlays += /obj/demonboss6
				src.overlays += /obj/demonboss7
				src.overlays += /obj/demonboss8
				src.overlays += /obj/demonboss9
			if(src.hollowtype =="Kushanada")
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
			if(src.hollowtype == "wolf")
				src.icon = 'BlankBase.dmi'
				src.overlays += /obj/wolf1
				src.overlays += /obj/wolf2
				src.overlays += /obj/wolf3
				src.overlays += /obj/wolf4
			if(src.hollowtype == "demon")
				src.icon = 'BlankBase.dmi'
				src.overlays += /obj/demon1
				src.overlays += /obj/demon2
				src.overlays += /obj/demon3
				src.overlays += /obj/demon4
			if(src.hollowtype == "strong")
				src.icon = 'BlankBase.dmi'
				src.overlays += /obj/nstrong1
				src.overlays += /obj/nstrong2
				src.overlays += /obj/nstrong3
				src.overlays += /obj/nstrong4
			if(src.hollowtype == "tutorial")
				src.overlays += /obj/TutHollow/BotLeft
				src.overlays += /obj/TutHollow/BotRight
				src.overlays += /obj/TutHollow/TopRight
				src.overlays += /obj/TutHollow/TopLeft
			if(src.hollowtype == "meno")
				src.icon='Icons/BlankBase.dmi'
				src.overlays += /obj/Menos/m1
				src.overlays += /obj/Menos/m2
				src.overlays += /obj/Menos/m3
				src.overlays += /obj/Menos/m4
				src.overlays += /obj/Menos/m5
				src.overlays += /obj/Menos/m6
				src.overlays += /obj/Menos/m7
				src.overlays += /obj/Menos/m8
			if(src.hollowtype == "adjucha")
				src.icon = 'BlankBase.dmi'
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
				if(src.adjhollowtype==1)
					src.overlays+=/obj/smalladjucha/wolfbot1
					src.overlays+=/obj/smalladjucha/wolfbot2
					src.overlays+=/obj/smalladjucha/wolfbot3
					src.overlays+=/obj/smalladjucha/wolfmid1
					src.overlays+=/obj/smalladjucha/wolfmid2
					src.overlays+=/obj/smalladjucha/wolfmid3
					src.overlays+=/obj/smalladjucha/wolftop1
					src.overlays+=/obj/smalladjucha/wolftop2
					src.overlays+=/obj/smalladjucha/wolftop3
				if(src.adjhollowtype==2)
					src.overlays+=/obj/TallAdju/BottomLeft
					src.overlays+=/obj/TallAdju/BottomRight
					src.overlays+=/obj/TallAdju/Bottom2Left
					src.overlays+=/obj/TallAdju/Bottom2Right
					src.overlays+=/obj/TallAdju/Bottom3Left
					src.overlays+=/obj/TallAdju/Bottom3Right
					src.overlays+=/obj/TallAdju/Bottom4Left
					src.overlays+=/obj/TallAdju/Bottom4Right
				if(src.adjhollowtype==3)
					src.overlays+=/obj/PantherHollow/BL
					src.overlays+=/obj/PantherHollow/BR
					src.overlays+=/obj/PantherHollow/TL
					src.overlays+=/obj/PantherHollow/TR
			if(src.hollowtype =="vasto")
				src.icon = 'Icons/vasterode.dmi'
			return
		if(src.icon_name=="Base")
			src.icon='Icons/Basenewp.dmi'
		if(src.icon_name=="Lost")
			src.icon='Icons/HollowSelf.dmi'
		if(src.icon_name=="BaseTan")
			src.icon='Icons/BaseShorts.dmi'
		if(src.icon_name=="BaseBlack")
			src.icon='Icons/Basenewb.dmi'
		if(src.icon_name=="BlueRanger")
			src.icon='Icons/ChibiBlueRanger.dmi'
		if(src.icon_name=="GreenRanger")
			src.icon='Icons/ChibiGreenRanger.dmi'
		if(src.icon_name=="RedRanger")
			src.icon='Icons/ChibiRedRanger.dmi'
		if(src.icon_name=="BlackRanger")
			src.icon='Icons/ChibiBlackRanger.dmi'
mob/proc
	Healed()
		usr.alreadyhealed=3
		sleep(600)
		usr.alreadyhealed=2
		sleep(600)
		usr.alreadyhealed=1
		sleep(600)
		usr.alreadyhealed=0
mob/World_Map
	Plastic_Surgeon
		name = "{NPC}Plastic Surgeon"
		icon='Icons/NPCs.dmi'
		icon_state="Doctor"
		npc = 1
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(!usr.shopping)
					src.Talks("Do you want a surgery?")
					usr.client.screen += new/obj/Buy/White
					usr.client.screen += new/obj/Buy/Tan
					usr.client.screen += new/obj/Buy/Black
					usr.client.screen += new/obj/Buy/Pale
					usr.shopping=1
					usr.frozen=1
					return
				if(usr.shopping)
					src.Talks("Come back later")
					for(var/obj/Buy/b in usr.client.screen)
						del b
					usr.shopping=0
					usr.frozen=0
					return
		New()
			src.HairGen()
			src.ClothesGen()
			src.icon_name="Base"
			..()
	Doctor
		name = "{NPC}Doctor"
		icon='Icons/NPCs.dmi'
		icon_state="Doctor"
		npc = 1
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(usr.alreadyhealed)
					src.Talks("You must wait [usr.alreadyhealed] minutes before I can attend to you again!")
					return
				else
					usr.health=usr.mhealth
					usr.rei=usr.mrei
					usr.wound=0
					src.Talks("You should be fully healed!")
					usr.Healed()
					return
		New()
			src.HairGen()
			src.icon_name="Base"
			..()
			spawn(3)
			src.overlays+='Icons/BleachShirt.dmi'
	CR_Doctor
		name = "{NPC}Doctor"
		icon='Icons/NPCs.dmi'
		icon_state="Doctor"
		npc = 1
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				switch(input("What do you need?", text) in list ("Heal","Help","Cancel"))
					if("Heal")
						if(usr.alreadyhealed)
							src.Talks("You must wait [usr.alreadyhealed] minutes before I can attend to you again!")
							return
						else
							usr.health=usr.mhealth
							usr.rei=usr.mrei
							usr.wound=0
							src.Talks("You should be fully healed!")
							usr.Healed()
							return
					if("Help")
						src.Talks("Okay, here's all I know")
						sleep(20)
						src.Talks("Up = Hueco Mundo, from there you can head North to find Las noches or Northeast to find Hollow Forest")
						src.Talks("Down= Soul Society, from there you can find the Squad Acedemy to the West, and Rukongai to the south")
						src.Talks("East= Event shop, you can visit this map and purchase event items/skills at the required price that is")
						src.Talks("West= Uraharas Shop/KarakuraTown or Earth is you may, From there you can find Southern Karakura to the south, Ultimate Forest to the West, and Quincy Tower to the East, other important places can also be found on Earth so keep a look out.")
						return
		New()
			src.HairGen()
			src.icon_name="Base"
			..()
			spawn(3)
			src.overlays+='Icons/BleachShirt.dmi'
mob/Event
	Customer_Service
		name = "{NPC}Customer Service"
		icon='Icons/NPCs.dmi'
		icon_state="Doctor"
		npc = 1
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				src.Talks("This is the event store")
				sleep(10)
				src.Talks("You can buy things here with event points")
				sleep(15)
				src.Talks("You get event points by winning events, the harder the event the more points")
				sleep(20)
				src.Talks("1st Floor:Customer Service, 2nd Floor:Items, 3rd Floor:Skills")
		New()
			src.HairGen()
			src.ClothesGen()
			src.icon_name="Base"
			..()
	Clerk
		name = "{NPC}Clerk"
		icon='Icons/NPCs.dmi'
		icon_state="Doctor"
		npc = 1
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(!usr.shopping)
					src.Talks("What do you want?")
					usr.client.screen += new/obj/Buy/Respec_Ticket
					usr.client.screen += new/obj/Buy/Speed_Pill
					usr.client.screen += new/obj/Buy/Level_Points
					usr.client.screen += new/obj/Buy/Awareness_Pill
					usr.client.screen += new/obj/Buy/Squad_4_Bandaid
					usr.client.screen += new/obj/Buy/Purple_Sprite
					usr.client.screen += new/obj/Buy/Rick_Ross_Meat
					usr.client.screen += new/obj/Buy/Invisibility_Pill
			//		usr.client.screen += new/obj/Buy/DLC
					usr.client.screen += new/obj/Buy/Vai_Retake
					usr.shopping=1
					usr.frozen=1
					return
				if(usr.shopping)
					src.Talks("Come back later")
					for(var/obj/Buy/b in usr.client.screen)
						del b
					usr.shopping=0
					usr.frozen=0
					return
		New()
			src.HairGen()
			src.ClothesGen()
			src.icon_name="Base"
			..()
	Skill_Clerk
		name = "{NPC}Skill Clerk"
		icon='Icons/NPCs.dmi'
		icon_state="Doctor"
		npc = 1
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(!usr.shopping)
					src.Talks("What do you want?")
					usr.client.screen += new/obj/Buy/Pure_Atk
					usr.client.screen += new/obj/Buy/Pure_Def
					usr.client.screen += new/obj/Buy/Pure_Rei
					usr.client.screen += new/obj/Buy/Sharingan
					usr.client.screen += new/obj/Buy/Life_Contract
				//	usr.client.screen += new/obj/Buy/Samurai
					usr.shopping=1
					usr.frozen=1
					return
				if(usr.shopping)
					src.Talks("Come back later")
					for(var/obj/Buy/b in usr.client.screen)
						del b
					usr.shopping=0
					usr.frozen=0
					return
		New()
			src.HairGen()
			src.ClothesGen()
			src.icon_name="Base"
			..()
turf/race/shinigami
	layer=99
	Click()
		if(istype(usr,/mob/player))
			switch(input(usr," Shinigamis live in Seireitei. They use spells and have swords that have hidden powers that are released during Shikai. Then the full power releases in Bankai.", text) in list ("Yes","No"))
				if("Yes")
					if(usr.race=="Human")
						usr.layer=MOB_LAYER
						usr.client.eye=usr
						usr.picking=0
						usr.cansave=1
						usr.shinip=1
						usr.OOC=1
						//usr.AutoSave()
						usr.gotburial = 1
						usr.talkrace = 1
						usr.cankido = 1
						usr.rx=75
						usr.ry=30
						usr.rz=5
						world << "<b><font color = aqua>Race Info: [usr] is now a Shinigami!"
						usr.race = "Shinigami"
						var/obj/B = new/obj/items/equipable/Weapon/Sword
						usr.updateInventory()
						B.loc = usr
						var/obj/C = new/obj/items/equipable/Overshirt/Shinigami1
						usr.updateInventory()
						C.loc = usr
						usr.contents+=new/obj/items/equipable/Overshirt/Shinigami2
						usr.contents+=new/obj/items/equipable/Pants/Black
						usr.contents+=new/obj/items/equipable/Shoes/Black
						usr.updateInventory()
						usr.layer=4
						spawn()usr.Hollow_Story()
turf/race/quincy
	layer=99
	Click()
		if(istype(usr,/mob/player))
			switch(input(usr," Quincies live on Earth. They use a bow and a spiritually charged arrow. During Final Form you will be surging energy you'll get a wing and your arrows will deal more damage..", text) in list ("Yes","No"))
				if("Yes")
					if(usr.race=="Human")
						usr.cansave=1
						usr.OOC=1
						usr.earth=1
						usr.picking=0
						usr.rx=44
						usr.ry=187
						usr.rz=1
						usr.client.eye=usr
						//usr.AutoSave()
						usr.rank = "Quincy"
						usr.talkrace = 1
						world << "<b><font color = aqua>Race Info: [usr] is now a Quincy!"
						usr.race = "Quincy"
						usr.layer=4
						usr.contents+=new/obj/items/equipable/Overshirt/Quincy1
						usr.contents+=new/obj/skillcard/Bow
						usr.contents+=new/obj/items/equipable/Shirt/Black
						usr.contents+=new/obj/items/equipable/Pants/Black
						usr.contents+=new/obj/items/equipable/Shoes/Black
						usr.updateInventory()
						spawn()usr.Hollow_Story()
turf/race/hollow
	layer=99
	Click()
		if(istype(usr,/mob/player))
			switch(input(usr," Hollows live in Hueco Mundo. They are monsters that kill anything to transform and get stronger. When they are strong enough they become arrancars and get a sword like Shinigamis. They can merge with there sword in Ressurection to release their true power.", text) in list ("Yes","No"))
				if("Yes")
					if(usr.race=="Human")
						usr.cansave=1
						usr.OOC=1
						usr.picking=0
						usr.hollow=1
						usr.rx=172
						usr.ry=184
						usr.rz=3
					//	usr.AutoSave()
						usr.race = "Hollow"
						usr.contents+=new/obj/skillcard/Release_Color
						usr.overlays = 0
						usr.icon='Icons/pantherhollow3.dmi'// = pick('spiderhollow.dmi','spiderhollowblue.dmi','spiderhollowgray.dmi','spiderhollowgreen.dmi','spiderhollowred.dmi','spiderhollowyellow.dmi')
						world << "<b><font color = aqua>Race Info: [usr] is now a Hollow!"
						usr.rank = "Weak Hollow"
						usr.gotdevour = 1
						usr.hollowtype = "Normal"
						usr.layer=4
						usr.safe = 0
						usr.client.eye=usr
						spawn()usr.Hollow_Story()
turf/race/sado
	layer=99
	Click()
		if(istype(usr,/mob/player))
			switch(input(usr," Chads(Sados) live on Earth. They use pure strength and have solid built arms. As they upgrade their arm they can shoot beams, blasts, etc. through it and they can reflect blasts, and beams from others as well as give one-hit knockouts.", text) in list ("Yes","No"))
				if("Yes")
					if(usr.race=="Human")
						usr.cansave=1
						usr.OOC=1
						usr.earth=1
						usr.picking=0
						usr.rx=44
						usr.ry=187
						usr.rz=1
						usr.client.eye=usr
						//usr.AutoSave()
						usr.talkrace = 1
						usr.race = "Sado"
						usr.rank = "Weak Sado"
						usr.layer=4
						//usr.gotarm = 1
						world << "<b><font color = aqua>Race Info: [usr] is now a Sado!"
						usr.client.eye=usr
						usr.contents+=new/obj/items/equipable/Shirt/Black
						usr.contents+=new/obj/items/equipable/Shoes/Black
						usr.contents+=new/obj/items/equipable/Pants/Black
						usr.contents+=new/obj/skillcard/Return_Blast
						usr.updateInventory()
						spawn()usr.Hollow_Story()
turf/race/inoue
	layer=99
	Click()
		if(istype(usr,/mob/player))
			switch(input(usr," Inoues live on Earth. They rely heavily on defence and use fairies. Although their attacks may be weakest in the game, they can repel nearly every attack as well as heal and regenerate 2x faster than any other race.", text) in list ("Yes","No"))
				if("Yes")
					if(usr.race=="Human")
						usr.cansave=1
						usr.OOC=1
						usr.earth=1
						usr.picking=0
						usr.client.eye=usr
						//usr.AutoSave()
						usr.talkrace = 1
						usr.race = "Inoue"
						usr.rank = "Weak Inoue"
						usr.ftype= "Inoue"
						usr.layer=4
						//usr.gotarm = 1
						world << "<b><font color = aqua>Race Info: [usr] is now an Inoue!"
						usr.client.eye=usr
						usr.contents+=new/obj/items/equipable/Shirt/Black
						usr.contents+=new/obj/items/equipable/Shoes/Black
						usr.contents+=new/obj/items/equipable/Pants/Black
						usr.updateInventory()
						spawn()usr.Hollow_Story()
turf/race/fullbringer
	layer=99
	Click()
		if(istype(usr,/mob/player))
			switch(input(usr," Fullbringers live on Earth. They take skill to use, they can buy beer 80% off, more coming soon.(This race is now complete, updates to this race are still to come)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.race=="Human")
						usr.cansave=1
						usr.OOC=1
						usr.earth=1
						usr.picking=0
						usr.client.eye=usr
						usr.rx=49
						usr.ry=133
						usr.rz=1
					//	usr.AutoSave()
						usr.talkrace = 1
						usr.race = "Fullbringer"
						usr.rank = "Weak Fullbringer"
						usr.layer=4
						//usr.gotarm = 1
						world << "<b><font color = aqua>Race Info: [usr] is now a Fullbringer!"
						usr.client.eye=usr
						usr.contents+=new/obj/items/equipable/Shirt/Black
						usr.contents+=new/obj/items/equipable/Shoes/Black
						usr.contents+=new/obj/items/equipable/Pants/Black
						usr.updateInventory()
						spawn()usr.Hollow_Story()
mob
 Shinigami_Teacher
		icon = 'NPCs.dmi'
		name = "{NPC}Shinigami Teacher"
		icon_state = "Shinigami"
		npc = 1
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			..()
			src.inshikai=1
			src.HairGen()
			src.overshirt=/obj/overshirt/shinigami/s1
			src.StypeGen()
			src.Load_Overlays()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(usr.race =="Shinigami")
					switch(input(usr,"Would you like to join a squad!", text) in list ("Yes","No"))
						if("Yes")
							if(usr.squad)
								usr<<"You're already in a squad."
								return
							if(usr.level<150)
								usr<<"Your too weak to join a squad, maybe if you're strong enough to get shikai I'll reconsider."
								return
							switch(input(usr,"Which squad do you want to join?(NOTE: All squads provide different benefits and will be shown to you after selection","Squad",text) in list("Kido Corps","1","2","3","4","5","6","7","8","9","10","11","12","13","Cancel"))
								if("Cancel")
									return
								if("Kido Corps")
									if(usr.stype=="Kido Class")
										usr.squad = "Kido Corps"
										usr.status = ""
										usr.Give_Squad_Verbs()
										world << "<b><font color = yellow>Squad Info: [usr] has joined Kido Corps!"
										usr.contents+=new/obj/skillcard/Kido_Corp_Heal
										usr << "You have learned Kido Corp Heal!"
									else
										usr<<"You must be a kido specialist to join this squad"
										return
								if("1")
									switch(alert(usr,"25% Boost to Reiatsu during Bankai. Join?","Squad","Yes","No"))
										if("Yes")
											usr.squad = 1
											usr.status = ""
											usr.Give_Squad_Verbs()
											world << "<b><font color = yellow>Squad Info: [usr] has joined Squad [usr.squad]!"
								if("2")
									switch(alert(usr,"This squad increases your run speed and receives less wounds when using Shunko. Join?","Squad","Yes","No"))
										if("Yes")
											usr.squad = 2
											usr.status = ""
											usr.shundrain=0
											usr.Give_Squad_Verbs()
											world << "<b><font color = yellow>Squad Info: [usr] has joined Squad [usr.squad]!"
								if("3")
									switch(alert(usr,"Can sense everyone on map. Join?","Squad","Yes","No"))
										if("Yes")
											usr.squad = 3
											usr.status = ""
											usr.Give_Squad_Verbs()
											world << "<b><font color = yellow>Squad Info: [usr] has joined Squad [usr.squad]!"
								if("4")
									switch(alert(usr,"Regenerate 33% faster and a Kido Corp Heal. Join?","Squad","Yes","No"))
										if("Yes")
											usr.squad = 4
											usr.status = ""
											usr.Give_Squad_Verbs()
											usr.contents+=new/obj/skillcard/Kido_Corp_Heal
											world << "<b><font color = yellow>Squad Info: [usr] has joined Squad [usr.squad]!"
								if("5")
									switch(alert(usr,"20% chance when damaged, attacker receives 25% of it.. Join?","Squad","Yes","No"))
										if("Yes")
											usr.squad = 5
											usr.status = ""
											usr.Give_Squad_Verbs()
											world << "<b><font color = yellow>Squad Info: [usr] has joined Squad [usr.squad]!"
								if("6")
									switch(alert(usr,"20% boost in Reiatsu and 10% boost in defence when using Bankai. Join?","Squad","Yes","No"))
										if("Yes")
											usr.squad = 6
											usr.status = ""
											usr.Give_Squad_Verbs()
											world << "<b><font color = yellow>Squad Info: [usr] has joined Squad [usr.squad]!"
								if("7")
									switch(alert(usr,"Takes less damage from attacks. Join?","Squad","Yes","No"))
										if("Yes")
											usr.squad = 7
											usr.status = ""
											usr.Give_Squad_Verbs()
											world << "<b><font color = yellow>Squad Info: [usr] has joined Squad [usr.squad]!"
								if("8")
									switch(alert(usr,"This squad gives you a 20% boost to attack, defense, and reiatsu entering bankai. Join?","Squad","Yes","No"))
										if("Yes")
											usr.squad = 8
											usr.status = ""
											usr.Give_Squad_Verbs()
											world << "<b><font color = yellow>Squad Info: [usr] has joined Squad [usr.squad]!"
								if("9")
									switch(alert(usr,"10% chance when attacked the enemy loses target of you. Join?","Squad","Yes","No"))
										if("Yes")
											usr.squad = 9
											usr.status = ""
											usr.Give_Squad_Verbs()
											world << "<b><font color = yellow>Squad Info: [usr] has joined Squad [usr.squad]!"
								if("10")
									switch(alert(usr,"This squad gives you more EXP and money from everything. Join?","Squad","Yes","No"))
										if("Yes")
											usr.squad = 10
											usr.status = ""
											usr.Give_Squad_Verbs()
											world << "<b><font color = yellow>Squad Info: [usr] has joined Squad [usr.squad]!"
								if("11")
									switch(alert(usr,"This squad gives you a 25% attack boost entering Bankai. Join?","Squad","Yes","No"))
										if("Yes")
											usr.squad = 11
											usr.status = ""
											usr.Give_Squad_Verbs()
											world << "<b><font color = yellow>Squad Info: [usr] has joined Squad [usr.squad]!"
								if("12")
									switch(alert(usr,"This squad gives you extra perks(EXP, money, combo passive, skillpoints, and event points) when collecting the lab charge. Join?","Squad","Yes","No"))
										if("Yes")
											usr.squad = 12
											usr.status = ""
											usr.Give_Squad_Verbs()
											world << "<b><font color = yellow>Squad Info: [usr] has joined Squad [usr.squad]!"
								if("13")
									switch(alert(usr,"This squad gives you a 25% defence boost entering Bankai. Join?","Squad","Yes","No"))
										if("Yes")
											usr.squad = 13
											usr.status = ""
											usr.Give_Squad_Verbs()
											usr.contents+=new/obj/skillcard/Kido_Corp_Heal
											world << "<b><font color = yellow>Squad Info: [usr] has joined Squad [usr.squad]!"
mob
	Rantao
		icon = 'NPCs.dmi'
		name = "{NPC}Kageroza"
		icon_state = "Rantao"
		npc = 1
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.ClothesGen()
			src.jacket=1
			src.jacket_red=200
			src.jacket_green=200
			src.jacket_blue=200
			src.oldspot = src.loc
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				switch(input("Would you like to fight your Reigai so you can get stronger!", text) in list ("Yes","No"))
					if("Yes")
						usr.loc=locate(rand(70,90),rand(1,30),14)
						usr.safe=0
						usr.safe=0
						usr.frozen=0
						usr.canattack=1
						usr.protected=0
						usr.lost=1
						usr.wound=0
						usr.health=usr.mhealth
						usr.rei=usr.mrei
						usr.MakeReigai(usr)

mob
 var
		talkrace = 0
mob
	Mob_Skill_Delete
		icon = 'Icons/vasterode.dmi'
		name = "{NPC}Skill Remover"
		npc=1
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
				switch(input("Would you like to delete a skill? This costs 2 event points, Once the skill is removed you cannot get it back.", text) in list ("Yes","No"))
					if("Yes")
						hereDelete
						if(usr.eventpoints <2)
							alert("You do not have enough event points, save up some more so you can remove a skill!")
							return
						else
							var/list/Menu = list()
							for(var/obj/skillcard/s in usr.contents)
								Menu.Add(s)
							var/obj/skillcard/s = input("Which skill do you wanna take away?","") as null | anything in Menu
							usr.contents-=s
							if(usr.skill0==s)usr.skill0=null
							if(usr.skill1==s)usr.skill1=null
							if(usr.skill2==s)usr.skill2=null
							if(usr.skill3==s)usr.skill3=null
							if(usr.skill4==s)usr.skill4=null
							if(usr.skill5==s)usr.skill5=null
							if(usr.skill6==s)usr.skill6=null
							if(usr.skill7==s)usr.skill7=null
							if(usr.skill8==s)usr.skill8=null
							if(usr.skill9==s)usr.skill9=null
							if(usr.skillequ==s)usr.skillequ=null
							if(usr.skillsub==s)usr.skillsub=null
							if(usr.skillpar==s)usr.skillpar=null
							if(usr.skilly==s)usr.skilly=null
							if(usr.skillw==s)usr.skillw=null
							usr.eventpoints -= 2
							switch(input("Would you like to delete another skill?.", text) in list ("Yes","No"))
								if("Yes")
									goto hereDelete
								if("No")
									return
					if("No")
						return

mob
	Bartender
		npc=1
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(usr.race=="Fullbringer")
					if(usr.alreadyhealed)
						usr<<"You must wait [usr.alreadyhealed] minutes before I can heal you again or it'll look suspicious!"
					else
						usr.health=usr.mhealth
						usr.rei=usr.mrei
						usr.wound=0
						usr<<"I fully healed you, don't tell anyone else though!"
						usr.Healed()
						return
				if(!usr.shopping)
					usr.client.screen += new/obj/Buy/Beer
					usr.shopping=1
					usr.frozen=1
					return
				if(usr.shopping)
					for(var/obj/Buy/b in usr.client.screen)
						del b
					usr.shopping=0
					usr.frozen=0
					return
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack");src.HairGen();src.ClothesGen()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
mob
	ShopKeeper
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(!usr.shopping)
					usr.client.screen += new/obj/Buy/Bandage
					usr.client.screen += new/obj/Buy/Max_Potion
					usr.client.screen += new/obj/Buy/Hamburger
					usr.client.screen += new/obj/Buy/Chicken
					usr.client.screen += new/obj/Buy/Turkey
					usr.client.screen += new/obj/Buy/Elixir
					usr.client.screen += new/obj/Buy/Steak
					usr.client.screen += new/obj/Buy/Soda
					usr.client.screen += new/obj/Buy/Potion

					/*usr.client.screen += new/obj/Buy/Ninja
					usr.client.screen += new/obj/Buy/Ninja2
					usr.client.screen += new/obj/Buy/Shunsui
					usr.client.screen += new/obj/Buy/Eyepatch
					usr.client.screen += new/obj/Buy/Headband*/
					usr.client.screen += new/obj/Buy/Blindfold
					usr.client.screen += new/obj/Buy/Kommamaru
					//usr.client.screen += new/obj/Buy/Mayurimask
					usr.client.screen += new/obj/Buy/Byakuya_Scarf
					//usr.client.screen += new/obj/Buy/Suit
					usr.client.screen += new/obj/Buy/Glasses
					usr.client.screen += new/obj/Buy/Shades
					usr.client.screen += new/obj/Buy/Jacket
					usr.client.screen += new/obj/Buy/Shirt
					usr.client.screen += new/obj/Buy/Pants
					usr.client.screen += new/obj/Buy/Thin_Glasses
					usr.client.screen += new/obj/Buy/Urahara_Hat
					usr.shopping=1
					usr.frozen=1
					return
				if(usr.shopping)
					for(var/obj/Buy/b in usr.client.screen)
						del b
					usr.shopping=0
					usr.frozen=0
					return
		HM
			icon = 'Icons/vasterode.dmi'
			name = "{NPC}Shop Owner"
			npc = 1
			New()
				..()
				spawn(2)
				icon='Icons/vasterode.dmi'
		SS
			icon = 'Icons/vasterode.dmi'
			name = "{NPC}Shop Owner"
			npc = 1
			New()
				src.icon_name=pick("Base","BaseTan","BaseBlack")
				src.HairGen()
				src.swordon=1
				src.weapon=/obj/weapon/sword
				src.oldspot = src.loc
				src.overshirt=pick(/obj/overshirt/shinigami/s1,/obj/overshirt/shinigami/s2)
				spawn()src.Affirm_Icon()
				spawn()src.Load_Overlays()
				src.Shikai()
				src.StypeGen()
				..()
		Earth
			icon = 'Icons/vasterode.dmi'
			name = "{NPC}Shop Owner"
			npc = 1
			New()
				..()
				spawn(2)
				src.icon='Icons/urahara.dmi'
mob
	Yoruichi
		icon = 'Icons/Yoruichi.dmi'
		name = "{NPC}Yoruichi"
		npc = 1
		New()
			if(src.name != "{NPC}Yoruichi")
				src.Load_Overlays()
				src.Affirm_Icon()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(usr.race =="Shinigami"||usr.race =="Vaizard")
					switch(input("Would you like to learn the final release of your zanpakutou. Bankai!", text) in list ("Yes","No"))
						if("Yes")
							if(usr.HasSkill("Bankai"))
								usr<<"You don't need training"
								return
							if(usr.HasSkill("Danku"))
								usr<<"You don't need training"
								return
							if(usr.level <400)
								usr<<"You're not strong enough"
							if(usr.bankai == 1)
								if(usr.z==6)return
								usr.wound=0
								usr.loc=locate(rand(1,145),rand(6,140),6)
								usr.dir=NORTH
								var/mob/k=new/mob/Zanpakutou
								k.loc=locate(usr.x,usr.y+5,6)
								k.frozen=1
								usr.frozen=1
								k.stype=usr.stype
								k.wound=0
								k.health=k.mhealth
								k.glasses=/obj/glasses/g2
								k.swordon=1
								k.swordcall=usr.swordcall
								k.swordname=usr.swordname
								k.attack=k.mattack
								k.defence=k.mdefence
								k.reiatsu=k.mreiatsu
								k.race="Bankai"
								k.undershirt=usr.undershirt
								k.overshirt=usr.overshirt
								k.armor=usr.armor
								k.pants=usr.pants
								k.legarmor=usr.legarmor
								k.armarmor=usr.armarmor
								k.facearmor=usr.facearmor
								k.cloak=usr.cloak
								k.back=usr.back
								k.shoes=usr.shoes
								k.special=usr.special
								k.etarget=usr
								k.hair_type=usr.hair_type
								k.hair_red=usr.hair_red
								k.hair_green=usr.hair_green
								k.hair_blue=usr.hair_blue
								k.jacket=usr.jacket
								k.jacket_red=usr.jacket_red
								k.jacket_green=usr.jacket_green
								k.jacket_blue=usr.jacket_blue
								k.shirt=usr.shirt
								k.shirt_red=usr.shirt_red
								k.shirt_green=usr.shirt_green
								k.shirt_blue=usr.shirt_blue
								k.pants_red=usr.pants_red
								k.pants_green=usr.pants_green
								k.pants_blue=usr.pants_blue
								k.name="{NPC}Kido Master"
								k.Load_Overlays()
								sleep(102)
								k.frozen=0
								usr.frozen=0
							else
								usr<<"You should come back after you level up"
mob
	FinalGetsugaTenshou
		name = "Final GetsugaTenshou"
		npc = 1
		infinal=1
		New()
			..()
			src.icon_name="BaseTan"
			src.hair_type=/obj/hair/h4/black
			src.Load_Overlays()
			src.Affirm_Icon()
			spawn(200)
			del src

mob/MissionNPC
	Rebirth_Man
		icon = 'NPCs.dmi'
		icon_state="Bum2"
		name = "Rebirth Man"
		npc = 1
		New()
			if(!src.name == "RebirthMan")
				src.Load_Overlays()
				src.Affirm_Icon()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(1)
				if(usr.Rebirthedpart2==2)
					Rebirther(usr)
mob/MissionNPC
	SecondRebirth
		icon='Icons/NPCs.dmi'
		icon_state="Bum2"
		name="Second Rebirth"
		npc=1
		New()
			if(!src.name == "RebirthMan")
				src.Load_Overlays()
				src.Affirm_Icon()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(1)
				RebirthTwo(usr)
mob
	Ginjo
		name = "Ginjo{Normal}"
		npc = 1
		New()
			..()
			spawn(2)
				src.icon='Icons/NPCs.dmi'
				src.icon_state="Ginjo"
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(usr.race == "Fullbringer")
					switch(input("Are you ready to choose the item you best sync with!", text) in list ("Yes","No"))
						if("Yes")
							if(!usr.gotshik)
								usr.client.eye=locate(175,158,1)
								usr.client.perspective=EYE_PERSPECTIVE
								return
					if(!usr.beatkenpachi&&usr.level>=150)
						switch(input("You will have to defeat me in order to get fullbring. Do you wish to fight me now?", text) in list ("Yes","No"))
							if("Yes")
								if(usr.z==16)return
								usr.safe=0
								usr.wound=0
								usr.loc=locate(rand(110,160),rand(5,60),16)
								usr.dir=EAST
								var/mob/k=new/mob/realGinjo
								k.dir=WEST
								k.loc=locate(usr.x+5,usr.y,16)
								k.frozen=1
								usr.frozen=1
								k.Load_Overlays()
								sleep(10)
								k.frozen=0
								usr.frozen=0

	Tsukishima
		name = "Tsukishima{Normal}"
		npc = 1
		New()
			..()
			spawn(2)
				src.icon='Icons/NPCs.dmi'
				src.icon_state="Tsukishima"
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(usr.race == "Fullbringer")
					if(usr.gotafull==1&&usr.level>=400)
						switch(input("You will have to defeat me in order to upgrade your Fullbring to the fullest extent. Do you wish to fight me now?", text) in list ("Yes","No"))
							if("Yes")
								if(usr.z==16)return
								usr.safe=0
								usr.wound=0
								usr.loc=locate(rand(110,160),rand(5,60),16)
								usr.dir=SOUTH
								var/mob/k=new/mob/realTsukishima
								k.dir=NORTH
								k.loc=locate(usr.x,usr.y-5,16)
								k.frozen=1
								usr.frozen=1
								k.Load_Overlays()
								sleep(10)
								k.frozen=0
								usr.frozen=0
					else
						usr<<"Come back to me later and I can train you to the fullest extent if I  haven't!"
mob/var/talkedtodojo=0

mob
	Dojo
		icon = 'NPCs.dmi'
		icon_state="Dojo"
		name="{NPC}Dojo Owner"
		npc=1
		New()
			if(!src.name == "{NPC}Dojo Owner")
				src.Load_Overlays()
				src.Affirm_Icon()
		verb
			Talk()
				set category= "NPC's"
				set src in oview(2)
				if(usr.talkedtodojo==0)
					usr << output("<font color = purple><B>{NPC}Dojo Owner)Welcome to Bleach World Wide Adventures [usr.name]!","output")
					sleep(25)
					usr << output("<font color = purple><B>{NPC}Dojo Owner)This is an area where you can train in peace, without being PVP'd by Stronger players","output")
					sleep(30)
					usr << output("<font color = purple><B>{NPC}Dojo Owner)Once you leave this area you can not come back and there will be other strong players competing with you","output")
					sleep(25)
					usr << output("<font color = purple><B>{NPC}Dojo Owner)Once you feel you are strong enough to enter into the world of Bleach you may leave through the purple portal","output")
					sleep(30)
					usr << output("<font color = purple><B>{NPC}Dojo Owner)Until then I suggest you kill these npcs","output")
					sleep(20)
					usr << output("<font color = purple><B>{NPC}Dojo Owner)Press (r) to target (u) to untarget (f) to attack and look at the skill tree for available passives/combos and skills","output")
					sleep(20)
					usr << output("<font color = red><B>{NPC}Dojo Owner)I'll teach you how to use my favoruite skill utsusemi","output")
					usr << output("<font color = white><b> Your body has feels like it has more control over controlling reiatsu with your feet","output")
					usr.contents+=new/obj/skillcard/Utsusemi
					sleep(35)
					usr << output("<font color = purple><B>Requirement Info:Shikai level:150 and do byakuyas quests, Bankai level:400 and beat your bankai, Vasto Lorde Hollow level:500","output")
					usr << output("<font color = purple><B>Requirement Info:Minimum req to become an arrancar 220(Highly recommended not to go arrancar until ATLEAST you are an Adjuchas")
					usr << output("<font color = purple><B>Requirement Info:Ress:350,Final Form:220, Final Form 2:400,Fullbring 1: 150 Fullbring advanced :400, Final bring:750","output")
					usr << output("<font color = purple><B>Requirement Info:Final bankai/Mugetsu: level 750; shinigami fight Aizen,Sado arm 4:level 600","output")
					usr << output("<font color = purple><B>Requirement Info:Vandenreich Quincy Level 600","output")
					usr.talkedtodojo=1
					return
				if(usr.talkedtodojo==1)
					usr << output("<font color = purple><B>Good luck!","output")


//mob
//	Yam
//		icon = 'yamamoto.dmi'
//		name = "{NPC}Yamamoto"
//		npc = 1
//		New()
//			if(!src.name == "{NPC}Yamamoto")
//				src.Load_Overlays()
//				src.Affirm_Icon()
//		verb
//			Talk()
//				set category = "NPC's"
//				set src in oview(2)
//				switch(input("Do you want to do the mission Rescue Rukia? You have to invade Soul Society and go through all the shinigamis.", text) in list ("Yes","No"))
//					if("Yes")
//						usr<<"This has been taken out due to lag"
//						return
//						usr.loc=locate(90,8,17)

mob
 ShikaiByakuya
		name = "Byakuya{Normal}"
		npc = 1
		New()
			..()
			src.icon_name="BaseTan"
			src.overshirt=/obj/overshirt/shinigami/s1
			src.cloak=/obj/cloak/captain/c1
			src.hair_type=/obj/hair/h4/black
			src.Load_Overlays()
			src.Affirm_Icon()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(usr.race == "Shinigami"||usr.race =="Vaizard")
					if(!usr.gotshik)
						switch(input("Are you ready to customize your Zanpakutou!", text) in list ("Yes","No","Kido Class"))
							if("Yes")
								if(!usr.gotshik)
									usr.client.eye=locate(192,124,1)
									usr.client.perspective=EYE_PERSPECTIVE
									usr<<"<font color = teal><b>Shinigami Info: After choosing your zanpaktou talk to Byakuya to begin your tasks!"
									return
							if("Kido Class")
								if(!usr.stype)
									switch(input("Would you like to be a Kido Specialist?(NOTE:You will not be able to release your zan with shikai and bankai)", text) in list ("Yes","No"))
										if("Yes")
											if(!usr.stype)
												usr.gotshik=1
												usr.squad="Kido Corps"
												usr.stype="Kido Class"
												usr.contents|=new/obj/skillcard/Kido_Corp_Heal
												return
					if(!usr.shinimish1)
						usr.shinimish1=1
						src.Talks("Test 1:  Go to Hollow Forest and defeat 10 Strong hollows. Located in the far upper right corner of Hueco Mundo.")
						usr.curpart="Part 3: The challenge and purpose of life"
						usr.curmis="Kill [usr.shinimishkills]/10 Strong Hollows"
						usr.storycom=22
						return
					if(usr.shinimish1==1)
						if(usr.shinimishkills>=10)
							usr.shinimish1=2
							src.Talks("Test 2: You must learn Byakurai")
							usr.shinimish2=1
							usr.curpart="Part 3: The challenge and purpose of life"
							usr.curmis="Learn Byakurai"
							usr.storycom=24
						else
							src.Talks("You have killed [usr.shinimishkills]/10 Strong Hollows")
						return
					if(usr.shinimish2==1)
						if(usr.HasSkill("Byakurai"))
							usr.shinimish2=2
							src.Talks("Test 3: You must go to Yammamato(near Soul Society Portal) and do 2 D rank missions")
							usr.curpart="Part 3: The challenge and purpose of life"
							usr.curmis="You must do [usr.missionspassed]/2 missions"
							usr.storycom=26
						else
							src.Talks("Test 2: You must learn Byakurai")
						return
					if(usr.shinimish2==2)
						if(usr.missionspassed>=2)
							src.Talks("Final Test: You must defeat Kenpachi")
							usr.shinimish2=3
							usr.curpart="Part 3: The challenge and purpose of life"
							usr.curmis="You must kill Kenpachi"
							usr.storycom=28
						else
							src.Talks("Test 3: You must go to Yammamato(near Soul Society Portal) and do 2 D rank missions")
							return
					if(!usr.beatkenpachi||!usr.shikai)
						switch(input("You will have to defeat Kenpachi, the most brutal beast in Soul Society in order to learn your Shikai when the time comes. Do you wish to fight him now?", text) in list ("Yes","No"))
							if("Yes")
								if(usr.z==16)return
								usr.wound=0
								usr.rei=usr.mrei
								usr.dir=EAST
								var/mob/k=new/mob/Kenpachi
								k.dir=WEST
								var/t=rand(1,3)
								if(t==1)
									usr.loc=locate(43,54,16)
									k.loc=locate(47,54,16)
								if(t==2)
									usr.loc=locate(43,38,16)
									k.loc=locate(47,38,16)
								if(t==3)
									usr.loc=locate(43,71,16)
									k.loc=locate(47,71,16)
								k.frozen=1
								usr.frozen=1
								k.Load_Overlays()
								sleep(70)
								if(usr.mreiatsu>usr.mattack)
									k.mattack=900
									k.attack=900
								k.frozen=0
								usr.frozen=0
mob/MissionNPC
	Son
		icon = 'NPCs.dmi'
		icon_state="Son"
		name = "{Mission NPC}Son"
		icon_name="BaseBlack"
		shirt=/obj/Shirt/black
		shirt_red=0
		shirt_blue=0
		shirt_green=0
		hair_type=/obj/hair/h1/black
		son=1
		enemy=1
		spawntime=100
		New()
			..()
			src.oldspot=src.loc
		verb
			Talk()
				set category = "NPC's"
				set src in oview(1)
				if(!usr.parentmission)
					usr << output("<font color = purple><B>[src.name]:</B></font>This house is HAUNTED! I was following my dad, but someone almost AFK killed me on Bleach WWA so I stayed back.By the time I was finished killing him my dad left. See if he's okay.","output")
					usr << output("<B><font color = purple>{Mission Helper}:Go outside and talk to his dad.","output")
				if(usr.parentmission==1)
					usr << output("<font color = purple><B>[src.name]:</B></font>Take me to my dad.","output")
					usr << output("<B><font color = purple>{Mission Helper}:He's going to follow you. Make sure NPCs don't kill him.","output")
					usr.escort=src
					src.Follow(usr)
				if(usr.parentmission==2)
					usr << output("<font color = purple><B>[src.name]:</B></font>I guess I won't learn from my mistakes.","output")
mob/MissionNPC
	Parent
		icon = 'NPCs.dmi'
		icon_state="Parent"
		name = "{Mission NPC}Parent"
		npc = 1
		New()
			if(!src.name == "{Mission NPC}Teacher")
				src.Load_Overlays()
				src.Affirm_Icon()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(1)
				if(usr.level<50)
					usr << output("<font color = purple><B>[src.name]:</B></font> This problem is too big for you.","output")
					usr << output("<B><font color = purple>{Mission Helper}:Come back at level 50","output")
					return
				if(!usr.parentmission)
					switch(input("This house is HAUNTED! I barely made it out alive, but my son is still in there. Get him out alive and I'll award you.?", text) in list ("Yes","No"))
						if("Yes")
							usr << output("<font color = purple><B>[src.name]:</B></font> Thank you sir, now get my son.","output")
							usr << output("<B><font color = purple>{Mission Helper}:Go through the house and find his son. Press space to escort him out of the house.","output")
							usr.parentmission=1
							return
						if("No")
							usr << output("<font color = purple><B>[src.name]:</B></font> Please, I'll give you anything!","output")
				if(usr.parentmission==1)
					for(var/mob/S in oview(2,src))
						if(S.son)
							usr << output("<font color = purple><B>[src.name]:</B></font> Thank you so much for helping my son.","output")
							spawn(15)
							usr << output("<font color = purple><B>[S.name]:</B></font> Dad I forgot my laptop. I need it to play Bleach WWA.","output")
							spawn(35)
							usr << output("<font color = purple><B>[src.name]:</B></font> That is a pretty good game. Go get it and come back.","output")
							usr.GainExp(5000)
							usr.GainMoney(1000)
							usr.contents+=new/obj/items/usable/REI/Soda
							usr.updateInventory()
							usr<<"<font color=purple>You gained 5,000 exp, $1,000, and a soda"
							usr.Level_Up()
							usr.parentmission=2
							usr.escort=0
							S.loc=S.oldspot
							return
				if(usr.parentmission==2)
					usr << output("<font color = purple><B>[src.name]:</B></font> Thank you for helping my son.","output")
mob/MissionNPC
	Teacher
		icon = 'NPCs.dmi'
		icon_state="Researcher"
		name = "{Mission NPC}Researcher"
		npc = 1
		New()
			if(!src.name == "{Mission NPC}Researcher")
				src.Load_Overlays()
				src.Affirm_Icon()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(1)
				if(usr.level<150)
					usr << output("<font color = purple><B>{Mission NPC}Researcher:</B></font> This problem is too much for you to handle.","output")
					usr << output("<B><font color = purple>{Mission Helper}:Come back at level 150","output")
					return
				if(!usr.teachermission)
					switch(input("I'm trying to conduct research on how Hollows leave money behind once they die, but there just too strong for me to kill. Could you help me with my research by killing some Menos Grande?", text) in list ("Yes","No"))
						if("Yes")
							usr << output("<font color = purple><B>{Mission NPC}Teacher:</B></font> Thank you sir.","output")
							usr << output("<B><font color = purple>{Mission Helper}:Kill 15 Menos","output")
							usr.teachermission=1
							usr.menoskills=0
							return
						if("No")
							usr << output("<font color = purple><B>{Mission NPC}Researcher:</B></font> Get outta here, who needs ya help anyway!","output")
				if(usr.teachermission==1)
					if(usr.menoskills<15)
						usr << output("<font color = purple><B>{Mission NPC}Researcher:</B></font> Well you still have [15-usr.menoskills] more Menos to kill.","output")
					else
						usr << output("<font color = purple><B>{Mission NPC}Researcher:</B></font> Thank you sir. Now I can continue with my research.","output")
						usr.GainExp(80000)
						usr.GainMoney(20000)
						usr.contents+=new/obj/items/usable/REI/Soda
						usr<<"<font color=purple>You gained 80,000 exp, $20,000, and a soda"
						usr.Level_Up()
						usr.teachermission=0
						usr.menoskills=0
						return
	HolloScientist
		icon = 'NPCs.dmi'
		icon_state="scientist"
		name = "{Mission NPC}Hollow Cloner"
		npc = 1
		New()
			if(!src.name == "{Mission NPC}Hollow Cloner")
				src.Load_Overlays()
				src.Affirm_Icon()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(1)
				if(usr.level<150)
					usr << output("<font color = purple><B>{Mission NPC}Hollow Cloner:</B></font> This problem is too much for you to handle.","output")
					usr << output("<B><font color = purple>{Mission Helper}:Come back at level 150","output")
					return
				if(!usr.clonedmission)
					switch(input("Oh dear me, I was researching on how to clone hollows by using that blue haired espadas DNA but i accidently cloned too many.Could you help by killing 30?", text) in list ("Yes","No"))
						if("Yes")
							usr << output("<font color = purple><B>{Mission NPC}Hollow Cloner:</B></font> Thank you, try not to die.","output")
							usr << output("<B><font color = purple>{Mission Helper}:Kill 30 cloned hollows","output")
							usr.clonedmission=1
							usr.clonedhollowkills=0
							return
						if("No")
							usr << output("<font color = purple><B>{Mission NPC}Hollow Cloner:</B></font> Get outta here, who needs ya help anyway!","output")
				if(usr.clonedmission==1)
					if(usr.clonedhollowkills<30)
						usr << output("<font color = purple><B>{Mission NPC}Hollow Cloner:</B></font> Well you still have [15-usr.clonedhollowkills] more cloned panteras to kill.","output")
					else
						usr << output("<font color = purple><B>{Mission NPC}Hollow Cloner:</B></font> Ahhhh thank you....looks like my research has failed.","output")
						usr.GainExp(1000000)
						usr.GainMoney(90000)
						usr.contents+=new/obj/items/usable/REI/Soda
						usr<<"<font color=purple>You gained 1,000,000 exp, $90,000, and a soda"
						usr.Level_Up()
						usr.clonedmission=0
						usr.clonedhollowkills=0
						return
mob/var
	clonedmission=0
	clonedhollowkills=0



mob/MissionNPC
	Bum
		icon = 'NPCs.dmi'
		icon_state="Bum"
		name = "{Mission NPC}Bum"
		npc = 1
		New()
			if(!src.name == "{Mission NPC}Bum")
				src.Load_Overlays()
				src.Affirm_Icon()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(1)
				if(usr.level<300)
					usr << output("<font color = purple><B>{Mission NPC}Bum:</B></font> This problem is too big for you.","output")
					usr << output("<B><font color = purple>{Mission Helper}:Come back at level 300","output")
					return
				if(!usr.Bummission)
					switch(input("I was trying to find treasure on that island to our right, but these masked men came and ran me off the island, can you help?", text) in list ("Yes","No"))
						if("Yes")
							usr << output("<font color = purple><B>{Mission NPC}Bum:</B></font> Thank you sir. Kill a few of them so I can explore again","output")
							usr << output("<B><font color = purple>{Mission Helper}:Kill 20 arrancars on Numero Island","output")
							usr.Bummission=1
							usr.numkills=0
							return
						if("No")
							usr << output("<font color = purple><B>{Mission NPC}Bum:</B></font> Well, if you don't want some of the treasure I guess . . .","output")
				if(usr.Bummission==1)
					if(usr.numkills<20)
						usr << output("<font color = purple><B>{Mission NPC}Bum:</B></font> Well you still have [20-usr.numkills] more arrancars on Numero Island to kill before they stop.","output")
					else
						usr << output("<font color = purple><B>{Mission NPC}Bum:</B></font> Thank you sir. Now I can explore again, heres a tip, I'll find more money on the island.","output")
						usr.GainExp(225927)
						usr.GainMoney(45000)
						usr<<"<font color=purple>You have gained $45,000 and 225,927 exp"
						usr.Level_Up()
						usr.Bummission=2
						usr.numkills=0
						return
				if(usr.Bummission==2)
					usr.Bummission=0
					usr << output("<font color = purple><B>{Mission NPC}Bum:</B></font> Thank you for helping me find the treasure, my brothers are gonna freak. Do you want to help me get more?!","output")
mob/MissionNPC
	Bum2
		icon = 'NPCs.dmi'
		icon_state="Bum2"
		name = "{Mission NPC}Bum2"
		npc = 1
		New()
			if(!src.name == "{Mission NPC}Bum2")
				src.Load_Overlays()
				src.Affirm_Icon()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(1)
				if(usr.level<300)
					usr << output("<font color = purple><B>{Mission NPC}Bum2:</B></font> This problem is too big for you.","output")
					usr << output("<B><font color = purple>{Mission Helper}:Come back at level 300","output")
					return
				if(!usr.Bum2mission)
					switch(input("I like to go sight-seeing around this area but these dangerous masked Shinigamis are making it almost impossible, can you help me get rid of them?", text) in list ("Yes","No"))
						if("Yes")
							usr << output("<font color = purple><B>{Mission NPC}Bum2:</B></font> Thank you sir. Kill a few of them so I can go sight-seeing again","output")
							usr << output("<B><font color = purple>{Mission Helper}:Kill 20 vaizards in the South Karakura","output")
							usr.Bum2mission=1
							usr.vaikills=0
							return
						if("No")
							usr << output("<font color = purple><B>{Mission NPC}Bum2:</B></font> Well, if you don't want some of the profits I guess . . .","output")
				if(usr.Bum2mission==1)
					if(usr.vaikills<20)
						usr << output("<font color = purple><B>{Mission NPC}Bum2:</B></font> Well you still have [20-usr.vaikills] more vaizards to kill.","output")
					else
						usr << output("<font color = purple><B>{Mission NPC}Bum2:</B></font> Thank you sir. Now I can pawn these masks, heres a tip, I'll be rich forever off these masks","output")
						usr.GainExp(350000)
						usr.GainMoney(5000)
						usr<<"<font color=purple>You have gained $5,000 and 200,000 exp"
						usr.Level_Up()
						usr.Bum2mission=2
						usr.vaikills=0
						return
				if(usr.Bum2mission==2)
					usr.Bum2mission=0
					usr << output("<font color = purple><B>{Mission NPC}Bum2:</B></font> Thank you for helping me pawn these masks, my brothers are gonna freak","output")
mob
	var
		HQuest=0
		ReaperKills=0
obj
	santaOvers
		icon='Icons/santa lol.dmi'

		Bot
			icon_state="0,0"
			layer=MOB_LAYER
		Top
			icon_state="0,1"
			layer=19
			pixel_y=32
mob/MissionNPC
	Santa
		New()
			src.overlays+=/obj/santaOvers/Bot
			src.overlays+=/obj/santaOvers/Top
		icon='Icons/santa lol.dmi'
		npc=1
		name="Santa"
		verb
			Talk()
				set category = "NPC's"
				set src in oview(1)
				if(!usr.HQuest)
					switch(input("HO-HO-HO'i'm in trouble. Will you please help me save christmas?", text) in list ("Yes","No"))
						if("Yes")
							usr << output("<font color=green><b>Santa: Well you see im running low on supplies and need some money to finish up toy production","output")
							spawn(15)usr << output("<b><font color=green>[usr.name]:You want me to give YOU, Santa Claus, money?!","output")
							spawn(15)usr << output("<b><font color=green>Santa:Please [usr.name] SAVE CHRISTMAS!","output")
							spawn(15)usr << output("<b><font color=green>[usr.name]:What will you give me if i give you funds?","output")
							spawn(15)usr << output("<b><font color=green>Santa: For every hundred thousand gold you give me ill give you your very own SANTA HAT","output")
							spawn(15)usr << output("<b><font color=green>[usr.name]: Geez thats a lot of money for a santa hat....","output")
							spawn(15)usr << output("<b><font color=green>Santa: THINK OF THE CHILDREN","output")
							spawn(90)switch(input("Do you want to trade 100k gold for a santa hat?", text) in list ("Yes","No"))
								if("Yes")
									if(usr.money>=100000)
										spawn(10)usr << output("<b><font color=green>[usr.name]: Fine ill take a santa hat","output")
										spawn(10)usr << output("<b><font color=green>Santa: XD","output")
										usr.money-=100000
										usr.contents+=new/obj/items/equipable/SantaHat
										usr.updateInventory()
									else
										spawn(10)usr << output("<b><font color=green>[usr.name]: Sorry I dont have enough on me","output")
								if("No")
									spawn(10)usr << output("<b><font color=green>[usr.name]: Sorry I dont have enough on me","output")
							return
						if("No")
							spawn(10)usr << output("<font color=green><b>[usr.name]: Sorry i'm not interested.","output")
							return
	Hreaper
		icon = 'Icons/BaseShorts.dmi'
		name = "Shinigami King"
		npc = 1
		verb
			Talk()
				set category = "NPC's"
				set src in oview(1)
				if(!usr.HQuest)
					switch(input("HELP HELP one of my students is going crazy and collecting unneeded souls!", text) in list ("Yes","No"))
						if("Yes")
							usr << output("<font color=purple><b>Shinigami King:Thank you kind soul, I can see you have a very large lifespan, anyways back on topic could you put a stop to my students actions in return for an amazing reward?","output")
							usr << output("<b><font color=purple>[usr]:Whats the reward?","output")
							usr << output("<b><font color=purple>Shinigami King:WE DON'T HAVE TIME FOR THIS WILL YOU PLEASE JUST STOP HIM!?","output")
							usr << output("<b><font color=purple>Shinigami King: Also you may want to note as well you'lle have to defeat him six times before he stops.","output")
							usr.HQuest=1
							usr.ReaperKills=0
							return
						if("No")
							usr << output("<font color=gray<b>Shinigami King:Your death is near.","output")
				if(usr.HQuest==1||usr.HQuest==2)
					if(usr.ReaperKills<6)
						usr << output("<font color=purple><b>{Shinigami King}:Well you still have to defeat my student [6-usr.ReaperKills] times...good luck...","output")
					else
						usr << output("<font color=purple><b>{Shinigami King}: Bless your soul child.","output")
						usr.GainExp(5000000)
						usr.GainMoney(450000)
						usr<<"<font color=purple>{Shinigami King}: As a prize ill give you a pair of grim reaper clothes! and some experience and money."
						usr<<"<font color=purple>You have gained $400,000 and 5.000,000 exp"
						usr.contents+=new/obj/items/equipable/Halloween/Top
						usr.contents+=new/obj/items/equipable/Halloween/Bot
						usr.Level_Up()
						usr.HQuest=3
						usr.ReaperKills=0
						return
				if(usr.HQuest==3)
					usr << output("<font color=purple><b>{Shinigami King}:BLESS THY SOUL CHILD MAY THE LAWDS GIVE YOU A LONG LIFE","output")


mob/MissionNPC
	Bum3
		icon = 'NPCs.dmi'
		icon_state="Bum3"
		name = "{Mission NPC}Bum3"
		npc = 1
		New()
			if(!src.name == "{Mission NPC}Bum3")
				src.Load_Overlays()
				src.Affirm_Icon()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(1)
				if(usr.level<300)
					usr << output("<font color = purple><B>{Mission NPC}Bum3:</B></font> This problem is too big for you.","output")
					usr << output("<B><font color = purple>{Mission Helper}:Come back at level 300","output")
					return
				if(!usr.Bum3mission)
					switch(input("I like to find cool stuff and pawn them. The other day I went into the forest and saw some guys with cool masks, I tried to take it but they knocked me out, can you help?", text) in list ("Yes","No"))
						if("Yes")
							usr << output("<font color = purple><B>{Mission NPC}Bum3:</B></font> Thank you sir. Kill a few of them so I can take their masks and pawn them","output")
							usr << output("<B><font color = purple>{Mission Helper}:Kill 20 lost vaizards in the forest","output")
							usr.Bum3mission=1
							usr.lvaikills=0
							return
						if("No")
							usr << output("<font color = purple><B>{Mission NPC}Bum3:</B></font> Well, if you don't want some of the profits I guess . . .","output")
				if(usr.Bum3mission==1)
					if(usr.lvaikills<20)
						usr << output("<font color = purple><B>{Mission NPC}Bum3:</B></font> Well you still have [20-usr.lvaikills] more vaizards to kill.","output")
					else
						usr << output("<font color = purple><B>{Mission NPC}Bum3:</B></font> Thank you sir. Now I can pawn these masks, heres a tip, I'll be rich forever off these masks","output")
						usr.GainExp(700000)
						usr.GainMoney(50000)
						usr<<"<font color=purple>You have gained $50,000 and 700,000 exp"
						usr.Level_Up()
						usr.Bum3mission=2
						usr.lvaikills=0
						return
				if(usr.Bum3mission==2)
					usr.Bum3mission=0
					usr << output("<font color = purple><B>{Mission NPC}Bum3:</B></font> Thank you for helping me pawn these masks, my brother tried pawning some lame masks","output")
mob/MissionNPC
	Bum4
		icon = 'NPCs.dmi'
		icon_state="Bum2"
		name = "{Mission NPC}Bum4"
		npc = 1
		New()
			if(!src.name == "{Mission NPC}Bum4")
				src.Load_Overlays()
				src.Affirm_Icon()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(1)
				if(usr.level<500)
					usr << output("<font color = purple><B>{Mission NPC}Bum4:</B></font> This problem is too big for you.","output")
					usr << output("<B><font color = purple>{Mission Helper}:Come back at level 500","output")
					return
				if(!usr.Bum4mission)
					switch(input("These vanders are annoying and think they rule everything, can you take them out for me??","Vander Quest", text) in list ("Yes","No"))
						if("Yes")
							usr << output("<font color = purple><B>{Mission NPC}Bum4:</B></font> Thank you, please kill them and put their annoyance to a rest","output")
							usr << output("<B><font color = purple>{Mission Helper}:Kill 10 Vanders in the Hollow Forest","output")
							usr.Bum4mission=1
							usr.VanderMurders=0
							return
						if("No")
							usr << output("<font color = purple><B>{Mission NPC}Bum4:</B></font> Well, I guess you don't want any money....","output")
				if(usr.Bum4mission==1)
					if(usr.VanderMurders<10)
						usr << output("<font color = purple><B>{Mission NPC}Bum4:</B></font> Well you still have [10-usr.VanderMurders] more Vanders to kill.","output")
					else
						usr << output("<font color = purple><B>{Mission NPC}Bum4:</B></font> Thank you, please take this as a reward","output")
						var/CatchExp
						CatchExp+=rand(800000,1700000)
						usr.GainExp(CatchExp)
						usr.GainMoney(150000)
						usr<<"<font color=purple>You have gained $75000 and [CatchExp] exp"
						usr.Level_Up()
						usr.Bum4mission=2
						usr.VanderMurders=0
						return
				if(usr.Bum4mission==2)
					usr.Bum4mission=0
					usr << output("<font color = purple><B>{Mission NPC}Bum4:</B></font> Thank you for killing those annoying Vanders","output")

mob/MissionNPC
	Farmer
		icon = 'NPCs.dmi'
		icon_state="Farmer"
		name = "{Mission NPC}Farmer"
		npc = 1
		New()
			if(!src.name == "{Mission NPC}Farmer")
				src.Load_Overlays()
				src.Affirm_Icon()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(1)
				if(usr.level<220)
					usr << output("<B>{Mission NPC}Farmer:</B> This problem is too big for you.","output")
					usr << output("<B>{Mission Helper}:Come back at level 220","output")
					return
				if(!usr.farmermission)
					switch(input("All these darn creatures are crushing my crops. They never give me a break.Can you teach em a lesson about messing with my property?", text) in list ("Yes","No"))
						if("Yes")
							usr << output("<B>{Mission NPC}Farmer:</B> Thank you partner","output")
							usr << output("<B>{Mission Helper}:Kill 20 Adjuuchas","output")
							usr.farmermission=1
							usr.adjuuchakills=0
							return
						if("No")
							usr << output("<B>{Mission NPC}Farmer:</B> Get outta here, who needs ya help anyway!","output")
				if(usr.farmermission==1)
					if(usr.adjuuchakills<20)
						usr << output("<B>{Mission NPC}Farmer:</B> Well you still have [20-usr.adjuuchakills] more Adjuchas to kill before they stop.","output")
					else
						usr << output("<B>{Mission NPC}Farmer:</B> Thank you partner, but I have one more task for you.","output")
						usr.GainExp(20000)
						usr.farmermission=2
						usr.adjuuchakills=0
						return
				if(usr.farmermission==2)
					switch(input("Can you go to the well and fetch me some water?", text) in list ("Yes","No"))
						if("Yes")
							usr << output("<B>{Mission NPC}Farmer:</B> Thank you partner","output")
							usr << output("<B>{Mission Helper}:Go the island west of the Quincy Tower to retrieve the water","output")
							usr.farmermission=3
							usr.getwater=1
							return
						if("No")
							usr << output("<B>{Mission NPC}Farmer:</B> Please help me out bud!","output")
				if(usr.farmermission==3)
					if(usr.getwater==1)
						usr << output("<B>{Mission NPC}Farmer:</B> The well is west of that big ole Quincy Tower.","output")
					else
						usr << output("<B>{Mission NPC}Farmer:</B> Thank you partner, it's time to start growing my crops.","output")
						usr.GainExp(100000)
						usr.GainMoney(10000)
						usr.contents+=new/obj/items/usable/REI/Soda
						usr<<"<font color=purple>You gained 100,000 exp, $10,000, and a soda"
						usr.Level_Up()
						usr.contents-=/obj/items/mission/bucketofwater
						usr.farmermission=4
						return
				if(usr.farmermission==4)
					usr << output("<B>{Mission NPC}Farmer:</B> Howdy, You're welcome here anytime!","output")
mob
	Yam
		icon = 'Icons/yamamoto.dmi'
		name = "{NPC}Yamamoto"
		npc = 1
		New()
			if(!src.name == "{NPC}Yamamoto")
				src.Load_Overlays()
				src.Affirm_Icon()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				switch(input("Do you want to do the mission Rescue Rukia? You have to invade Soul Society and go through all the shinigamis.", text) in list ("Yes","No"))
					if("Yes")
						usr<<"This has been taken out due to lag"
						return
						usr.loc=locate(90,8,17)
mob
 Sousuke_Aizen
		icon = 'Icons/Aizen.dmi'
		name = "{NPC}Sousuke Aizen"
		npc = 1
		New()
			if(!src.name == "{NPC}Sousuke Aizen")
				src.Load_Overlays()
				src.Affirm_Icon()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(usr.race == "Hollow")
					if(usr.beatichigo==0)
						switch(input("Hollow I have a mission for you. Will you go to Karakura Town and kill Ichigo Kurosaki?", text) in list ("Yes","No"))
							if("Yes")
								if(usr.z==16)return
								usr.loc=locate(rand(6,49),rand(150,185),16)
								usr.dir=WEST
								var/mob/k=new/mob/IchigoEarly
								k.dir=EAST
								k.loc=locate(usr.x-5,usr.y,16)
								k.frozen=1
								usr.frozen=1
								k.Load_Overlays()
								sleep(75)
								k.frozen=0
								usr.frozen=0
								usr.safe=0
								k.Aggro(usr)
					if(usr.beatichigo>=1)
						if(usr.level >= 220)
							switch(input("Hollow...Do you want me to break the chains restraining you from your destiny? Do you wish to regain your consiousness? Become one of us...the Espada!", text) in list ("Yes","No"))
								if("Yes")
									if(usr.hollowtype!="arrancar")
										usr.overlays = 0
										usr.hollowtype = "arrancar"
										usr.icon = 'Icons/BaseTannew.dmi'
										usr.rank = "Arrancar"
										usr.rundelay = 0
										usr.race = "Arrancar"
										usr.arrancarmask=rand(1,14)
										usr << "<b>Your health got boosted by 100!"
										usr.mhealth += 100
										usr << "<b>Your rei got boosted by 30!"
										usr.mrei += 30
										usr << "<b>Your attack got boosted by 30!"
										usr.mattack += 30
										usr.rawbuff+=30
										usr << "<b>Your defence got boosted by 30!"
										usr.mdefence += 30
										usr << "<b>Your reiatsu power got boosted by 30!"
										usr.reiatsu += 30
										usr.Load_Overlays()
										usr.Affirm_Icon()
										var/obj/B = new/obj/items/equipable/Weapon/Sword
										B.loc = usr
										usr.contents+=new/obj/items/equipable/Shoes/Black
										var/obj/C = new/obj/items/equipable/Cloak/Espada1
										C.loc=usr
										var/obj/S = new/obj/items/equipable/Cloak/Espada2
										usr.updateInventory()
										S.loc=usr
										usr.skill()
										if(!usr.isfrac)Espada_Ranking(usr)
				if(usr.race == "Arrancar")
					if(!usr.choseyet)
						switch(input("Which technique would you like to master in!", text) in list ("Instant Regeneration","Releasing Power"))
							if("Instant Regeneration")
								usr.contents+=new/obj/skillcard/Instant_Regen
								for(var/obj/skillcard/Arrancar_Release/d in usr.contents)
									del d
								usr.choseyet=1
							if("Releasing Power")
								usr.hasarrancarrelease=1
								usr.contents+=new/obj/skillcard/Arrancar_Release
								for(var/obj/skillcard/Instant_Regen/d in usr.contents)
									del d
								usr.choseyet=1
					if(!usr.gotress)
						switch(input("Are you ready to customize your ressurection!", text) in list ("Yes","No"))
							if("Yes")
								usr.client.eye=locate(192,141,1)
								usr.client.perspective=EYE_PERSPECTIVE
								usr<<"<b><font color = lime>NOTE: You learn Ressurection at level 250!"

mob
 Hair_Cutter
		icon = 'NPCs.dmi'
		icon_state = "Barber"
		name = "{NPC}Hair Cutter"
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
				switch(input("Do you want a haircut?", text) in list ("Yes","No"))
					if("Yes")
						usr.GoCust7()
obj
 zabtrail
		icon = 'Icons/renjibankai.dmi'
		icon_state = "Body"
		zer = 1
		density=1
		d1
			icon_state="diag1"
			pixel_x=-16
			pixel_y=16
		d2
			icon_state="diag2"
			pixel_x=16
			pixel_y=-16
		New()
			spawn(30)
			del src
obj
	LuppisTail
		icon='Icons/custom luppi.dmi'
		icon_state="Body"
		zer=1
		density=1
		d1
			icon_state="diag1"
		//	pixel_x=-16
		//	pixel_y=16
		d2
			icon_state="diag2"
		//	pixel_x=16
		//	pixel_y=-16
		New()
			spawn(30)
			del src

mob
 var
		tmp/zell = 0
mob
 luppifollow
		icon = 'Icons/renjibankai.dmi'
		icon_state="Head"
		density = 1
		race="nothing"
		zab = 1
		rundelay = 0
		layer = 50
		New()
			src.name="Zabimaru"
			if(!src.name == "Zabimaru")
				src.Load_Overlays()
				src.Affirm_Icon()
			spawn(15)
			del src
		Bump(atom/M)
			if(istype(M,/obj/LuppisTail/))
				src.loc = M.loc
		Bump(mob/D)
			..()
			var/mob/M = D
			if(istype(M,/mob/))
				if(M&&M == owner)
					del src
				var/mob/O = src.owner
				src.loc = M.loc
				if(!M.protected)
					M.allowmove=1
					step(M,src.dir)
					M.allowmove=0
				var/damage=O.attack*2
				damage=rand(damage*1.7,damage*2.3)
				if(damage<1)
					damage=1
				//view(src,8) << "<b><font color = red>[src.owner] hit [M] with his [O.swordname] for [damage] damage!"
				M.Death(src.owner,damage,pick(0,0,1))
				O.ressmastery(15)
		Del()
			for(var/obj/LuppisTail/M in view(10,src))
				if(M.owner == src)
					M.loc=null
			..()
		Move()
			if(src.dir == NORTHWEST)
				if(src.olddir == WEST||src.olddir == EAST)
					src.dir=WEST
				if(src.olddir == NORTH||src.olddir == SOUTH)
					src.dir = NORTH
			if(src.dir == NORTHEAST)
				if(src.olddir == WEST||src.olddir == EAST)
					src.dir=EAST
				if(src.olddir == NORTH||src.olddir == SOUTH)
					src.dir = NORTH
			if(src.dir == SOUTHWEST)
				if(src.olddir == WEST||src.olddir == EAST)
					src.dir=WEST
				if(src.olddir == NORTH||src.olddir == SOUTH)
					src.dir = SOUTH
			if(src.dir == SOUTHEAST)
				if(src.olddir == WEST||src.olddir == EAST)
					src.dir=EAST
				if(src.olddir == NORTH||src.olddir == SOUTH)
					src.dir = SOUTH
			..()
			var/obj/zabtrail/M = new/obj/LuppisTail
			var/obj/zabtrail/Ma = new/obj/LuppisTail
			M.owner=src.owner
			Ma.owner=src.owner
			if(src.dir == NORTH)
				M.loc = locate(src.x,src.y-1,src.z)
				M.dir = NORTH
				if(src.olddir == WEST)
					M.dir = NORTHWEST
				if(src.olddir == EAST)
					M.dir = SOUTHWEST
			if(src.dir == SOUTH)
				M.loc = locate(src.x,src.y+1,src.z)
				M.dir = SOUTH
				if(src.olddir == WEST)
					M.dir = NORTHEAST
				if(src.olddir == EAST)
					M.dir = SOUTHEAST
			if(src.dir == EAST)
				M.loc = locate(src.x-1,src.y,src.z)
				M.dir = EAST
				if(src.olddir == NORTH)
					M.dir = NORTHEAST
				if(src.olddir == SOUTH)
					M.dir = NORTHWEST
			if(src.dir == WEST)
				M.loc = locate(src.x+1,src.y,src.z)
				M.dir = WEST
				if(src.olddir == NORTH)
					M.dir = SOUTHEAST
				if(src.olddir == SOUTH)
					M.dir = SOUTHWEST
			if(src.dir == NORTHWEST)
				M.loc = locate(src.x+1,src.y-1,src.z)
				M.dir = NORTHWEST
				M.icon_state="diag1"
				M.pixel_x=8
				M.pixel_y=-8
				Ma.loc = locate(src.x+1,src.y-1,src.z)
				Ma.dir = NORTHWEST
				Ma.icon_state="diag2"
				Ma.pixel_x=-8
				Ma.pixel_y=8
			if(src.dir == NORTHEAST)
				M.loc = locate(src.x-1,src.y-1,src.z)
				M.dir = NORTHEAST
				M.icon_state="diag1"
				M.pixel_x=-8
				M.pixel_y=-8
				Ma.loc = locate(src.x-1,src.y-1,src.z)
				Ma.dir = NORTHEAST
				Ma.icon_state="diag2"
				Ma.pixel_x=8
				Ma.pixel_y=8
			if(src.dir == SOUTHWEST)
				M.loc = locate(src.x+1,src.y+1,src.z)
				M.dir = SOUTHWEST
				M.icon_state="diag1"
				M.pixel_x=8
				M.pixel_y=8
				Ma.loc = locate(src.x+1,src.y+1,src.z)
				Ma.dir = SOUTHWEST
				Ma.icon_state="diag2"
				Ma.pixel_x=-8
				Ma.pixel_y=-8
			if(src.dir == SOUTHEAST)
				M.loc = locate(src.x-1,src.y+1,src.z)
				M.dir = SOUTHEAST
				M.icon_state="diag1"
				M.pixel_x=-8
				M.pixel_y=8
				Ma.loc = locate(src.x-1,src.y+1,src.z)
				Ma.dir = SOUTHEAST
				Ma.icon_state="diag2"
				Ma.pixel_x=8
				Ma.pixel_y=-8
			M.owner = src
			Ma.owner = src
			src.olddir = src.dir
mob
 zabimaru
		icon = 'Icons/renjibankai.dmi'
		icon_state="Head"
		density = 1
		race="nothing"
		zab = 1
		rundelay = 0
		layer = 50
		New()
			src.name="Zabimaru"
			if(!src.name == "Zabimaru")
				src.Load_Overlays()
				src.Affirm_Icon()
			spawn(15)
			del src
		Bump(atom/M)
			if(istype(M,/obj/zabtrail/))
				src.loc = M.loc
		Bump(mob/D)
			..()
			var/mob/M = D
			if(istype(M,/mob/))
				if(M&&M == owner)
					del src
				var/mob/O = src.owner
				src.loc = M.loc
				if(!M.protected)
					M.allowmove=1
					step(M,src.dir)
					M.allowmove=0
				var/damage=O.attack*2
				damage=rand(damage*2,damage*2.5)
				if(damage<1)
					damage=1
				//view(src,8) << "<b><font color = red>[src.owner] hit [M] with his [O.swordname] for [damage] damage!"
				M.Death(src.owner,damage,pick(0,0,1))
				O.banmastery(15)
		Del()
			for(var/obj/zabtrail/M in view(10,src))
				if(M.owner == src)
					del M
			..()
		Move()
			if(src.dir == NORTHWEST)
				if(src.olddir == WEST||src.olddir == EAST)
					src.dir=WEST
				if(src.olddir == NORTH||src.olddir == SOUTH)
					src.dir = NORTH
			if(src.dir == NORTHEAST)
				if(src.olddir == WEST||src.olddir == EAST)
					src.dir=EAST
				if(src.olddir == NORTH||src.olddir == SOUTH)
					src.dir = NORTH
			if(src.dir == SOUTHWEST)
				if(src.olddir == WEST||src.olddir == EAST)
					src.dir=WEST
				if(src.olddir == NORTH||src.olddir == SOUTH)
					src.dir = SOUTH
			if(src.dir == SOUTHEAST)
				if(src.olddir == WEST||src.olddir == EAST)
					src.dir=EAST
				if(src.olddir == NORTH||src.olddir == SOUTH)
					src.dir = SOUTH
			..()
			var/obj/zabtrail/M = new/obj/zabtrail
			var/obj/zabtrail/Ma = new/obj/zabtrail
			M.owner=src.owner
			Ma.owner=src.owner
			if(src.dir == NORTH)
				M.loc = locate(src.x,src.y-1,src.z)
				M.dir = NORTH
				if(src.olddir == WEST)
					M.dir = NORTHWEST
				if(src.olddir == EAST)
					M.dir = SOUTHWEST
			if(src.dir == SOUTH)
				M.loc = locate(src.x,src.y+1,src.z)
				M.dir = SOUTH
				if(src.olddir == WEST)
					M.dir = NORTHEAST
				if(src.olddir == EAST)
					M.dir = SOUTHEAST
			if(src.dir == EAST)
				M.loc = locate(src.x-1,src.y,src.z)
				M.dir = EAST
				if(src.olddir == NORTH)
					M.dir = NORTHEAST
				if(src.olddir == SOUTH)
					M.dir = NORTHWEST
			if(src.dir == WEST)
				M.loc = locate(src.x+1,src.y,src.z)
				M.dir = WEST
				if(src.olddir == NORTH)
					M.dir = SOUTHEAST
				if(src.olddir == SOUTH)
					M.dir = SOUTHWEST
			if(src.dir == NORTHWEST)
				M.loc = locate(src.x+1,src.y-1,src.z)
				M.dir = NORTHWEST
				M.icon_state="diag1"
				M.pixel_x=8
				M.pixel_y=-8
				Ma.loc = locate(src.x+1,src.y-1,src.z)
				Ma.dir = NORTHWEST
				Ma.icon_state="diag2"
				Ma.pixel_x=-8
				Ma.pixel_y=8
			if(src.dir == NORTHEAST)
				M.loc = locate(src.x-1,src.y-1,src.z)
				M.dir = NORTHEAST
				M.icon_state="diag1"
				M.pixel_x=-8
				M.pixel_y=-8
				Ma.loc = locate(src.x-1,src.y-1,src.z)
				Ma.dir = NORTHEAST
				Ma.icon_state="diag2"
				Ma.pixel_x=8
				Ma.pixel_y=8
			if(src.dir == SOUTHWEST)
				M.loc = locate(src.x+1,src.y+1,src.z)
				M.dir = SOUTHWEST
				M.icon_state="diag1"
				M.pixel_x=8
				M.pixel_y=8
				Ma.loc = locate(src.x+1,src.y+1,src.z)
				Ma.dir = SOUTHWEST
				Ma.icon_state="diag2"
				Ma.pixel_x=-8
				Ma.pixel_y=-8
			if(src.dir == SOUTHEAST)
				M.loc = locate(src.x-1,src.y+1,src.z)
				M.dir = SOUTHEAST
				M.icon_state="diag1"
				M.pixel_x=-8
				M.pixel_y=8
				Ma.loc = locate(src.x-1,src.y+1,src.z)
				Ma.dir = SOUTHEAST
				Ma.icon_state="diag2"
				Ma.pixel_x=8
				Ma.pixel_y=-8
			M.owner = src
			Ma.owner = src
			src.olddir = src.dir

obj
 aura1
		icon = 'Icons/bigkenpachi.dmi'
		icon_state = "bottomleft"
		pixel_x = -32
		layer=MOB_LAYER+10
 aura2
		icon = 'Icons/bigkenpachi.dmi'
		icon_state = "middle"
		pixel_y = 32
		layer=MOB_LAYER+10
 aura3
		icon = 'Icons/bigkenpachi.dmi'
		icon_state = "bottomright"
		pixel_x = 32
		layer=MOB_LAYER+10
 aura4
		icon = 'Icons/bigkenpachi.dmi'
		icon_state = "middleleft"
		pixel_x = -32
		pixel_y = 32
		layer=MOB_LAYER+10
 aura5
		icon = 'Icons/bigkenpachi.dmi'
		icon_state = "middleright"
		pixel_x = 32
		pixel_y = 32
		layer=MOB_LAYER+10
 aura6
		icon = 'Icons/bigkenpachi.dmi'
		icon_state = "topleft"
		pixel_y = 64
		pixel_x = -32
		layer=MOB_LAYER+10
 aura7
		icon = 'Icons/bigkenpachi.dmi'
		icon_state = "topmiddle"
		pixel_y = 64
		layer=MOB_LAYER+10
 aura8
		icon = 'Icons/bigkenpachi.dmi'
		icon_state = "topright"
		pixel_y = 64
		pixel_x = 32
		layer=MOB_LAYER+10
 aura9
		icon = 'Icons/bigkenpachi.dmi'
		icon_state = "bottommiddle"
		layer=MOB_LAYER+10

mob
 var
		tmp/aura = 0

