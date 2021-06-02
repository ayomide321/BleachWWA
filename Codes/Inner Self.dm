mob
	Demon_Boss
		name = "Brazo Izquierda Del Diablo"
		level=5000
		enemy = 1
		Demon_Boss=1
		bossss=1
		mhealth = 9532156
		health = 9532156
		race="Hollow"
		hollowtype="devil"
		legit=1
		legit2=1
		rundelay=1
		mattack = 25000
		mdefence = 25900
		mreiatsu = 30000
		attack = 25000
		defence = 25900
		reiatsu = 30000
		healthwas = 500000
		mrei=99999
		rei=99999
		boneharden=20
		quickflash=5
		piercepassive=5
		instinct=5
		hostile=1
		demons=1
		agrange=12
		killable=1
		expgain=265000000
		spawntime = 3000
		New()
			src.overlays += /obj/demonboss1
			src.overlays += /obj/demonboss2
			src.overlays += /obj/demonboss3
			src.overlays += /obj/demonboss4
			src.overlays += /obj/demonboss5
			src.overlays += /obj/demonboss6
			src.overlays += /obj/demonboss7
			src.overlays += /obj/demonboss8
			src.overlays += /obj/demonboss9
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.oldspot = src.loc
			src.CeroGen()
			..()
mob
	Frankenstein
		name = "{NPC}Frankenstein"
		race="Quincy"
		pet=1
		legit=1
		legit2=1
		frank=1
		level=476
		health=78224
		mhealth=78224
		mrei=8406
		rei=8406
		enemy=1
		rundelay=0
		killable=1
		hostile=1
		mreiatsu=3048
		mattack=1048
		mdefence=1748
		hair_type=8
		bowon=1
		delay=1
		flashpause=10
		facearmor=/obj/facearmor/s1
		overshirt=/obj/overshirt/quincy/s1
		shoes=0
		icon_name="BaseBlack"
		expgain=200000
		spawntime=200
		New()
			src.hasaseele=1
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider

			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider

			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider

			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider

			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider

			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider

			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider

			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			src.contents += new/obj/items/Seele_Schneider
			spawn()src.Affirm_Icon()
			..()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(!usr.myclone)
					usr<<"I'll be your pet"
					usr.myclone=src
					return
				if(usr.myclone)
					usr<<"I won't be your pet"
					usr.myclone=null
					return
mob
	Willowk
		name = "{NPC}Willowk"
		//race="Shinigami"
		pet=1
		willowk=1
		level=476
		health=78224
		mhealth=78224
		mrei=8406
		rei=8406
		enemy=1
		rundelay=0
		killable=1
		hostile=1
		mreiatsu=1664
		mattack=9184
		mdefence=7390
		hair_type=8
		hair_blue=150
		swordon=1
		shikaidrain=0
		bankaidrain=0
		delay=1
		ressurection=1
		ressurectiontype="Nnoitra"
		inbankai=1
		maskon=1
		mask=8
		flashpause=10
		stype="Ichigo"
		icon_name="BaseBlack"
		expgain=200000
		spawntime=200
		legit=1
		swordcall="<FONT COLOR=#ff0000>T</FONT><FONT COLOR=#ab0000>e</FONT><FONT COLOR=#550000>n</FONT><FONT COLOR=#000000>s</FONT><FONT COLOR=#3f3b36>h</FONT><FONT COLOR=#7e766c>o</FONT><FONT COLOR=#bcb1a2>u</FONT><FONT COLOR=#faebd7> </FONT><FONT COLOR=#bcb1a2>K</FONT><FONT COLOR=#7e766c>e</FONT><FONT COLOR=#3f3b36>s</FONT><FONT COLOR=#000000>t</FONT><FONT COLOR=#550000>u</FONT><FONT COLOR=#ab0000>g</FONT><FONT COLOR=#ff0000>a</FONT>"
		swordname="<FONT COLOR=#ff0000>K</FONT><FONT COLOR=#000000>e</FONT><FONT COLOR=#7e766c>s</FONT><FONT COLOR=#faebd7>t</FONT><FONT COLOR=#7e766c>u</FONT><FONT COLOR=#000000>g</FONT><FONT COLOR=#ff0000>a</FONT>"
		New()
			src.weapon=/obj/weapon/sword
			spawn()src.Affirm_Icon()
			..()
mob
	InnerSelf
		name = "{NPC}Inner Self"
		enemy = 1
		rundelay = 0
		level=1
		innerself=1
		killable=1
		hostile=1
		reiatsu = 3
		mrei = 2000
		spawntime = 500
		expgain = 16000
		legit=1
		New()
			src.swordon=1
			src.weapon=/obj/weapon/sword
			//src.cloak=/obj/cloak/captain/c1
			spawn()src.Affirm_Icon()
			..()
			spawn(2)
				src.icon='Icons/HollowSelf.dmi'
				spawn()src.Load_Overlays()
				view(src) << "<b>Okay, you ready."
				var/sound/d = sound('Sounds/006A_0000.wav',volume=50)
				view(src) << d
				spawn(20)
					view(src) << "<b>I'll give you a lesson on how to fight."
					var/sound/dc = sound('Sounds/008C_0000.wav',volume=50)
					view(src) << dc
					spawn(15)
						var/sound/df = sound('Sounds/008D_0000.wav',volume=50)
						view(src) << df
						spawn(25)
							view(src) << "<b>What's the matter..."
							var/sound/dd = sound('Sounds/006F_0000.wav',volume=50)
							view(src) << dd
							spawn(20)
								view(src) << "<b>If your just gonna stand there you'll DIE!"
								var/sound/da = sound('Sounds/006C_0000.wav',volume=50)
								view(src) << da
var
	inner=0
mob/vaizard/verb
	Fight_Inner()
		if(usr.health<usr.mhealth/1.2)
			usr<<"You are too injured to fight your inner self"
			return
		usr.wound=0
		usr<<"You can train on your inner self, but your inner self is much stronger now."
		var/mob/k=new/mob/InnerSelf
		usr.loc=locate(50,45,8)
		k.stype=usr.stype
		k.hair_type=usr.hair_type
		k.hair_red=210
		k.hair_blue=210
		k.hair_green=210
		k.weapon=/obj/weapon/sword
		k.wound=0
		k.mhealth=usr.mhealth*1.5
		k.health=usr.mhealth*1.5
		k.mattack=usr.mattack*1.5
		k.mreiatsu=usr.mreiatsu*1.5
		k.mrei=usr.mrei*1.5
		k.rei=usr.rei*1.5
		k.mdefence=usr.mdefence*1.5
		k.swordon=1
		k.level=usr.level*1.5
		if(usr.gotvai2)
			k.vasto=1
			k.maskuses=200
			k.mhealth=usr.mhealth*2
			k.health=usr.mhealth*2
			k.mattack=usr.mattack*2
			k.mreiatsu=usr.mreiatsu*2
			k.mrei=usr.mrei*2
			k.rei=usr.rei*2
			k.mdefence=usr.mdefence*2
			k.swordon=1
			k.level=usr.level*2
		k.swordcall=usr.swordcall
		k.swordname=usr.swordname
		k.attack=k.mattack
		k.defence=k.mdefence
		k.reiatsu=k.mreiatsu
		k.race="Inner"
		k.Load_Overlays()
		usr.frozen=1
		k.frozen=1
		spawn(100)
			k.frozen=0
			usr.frozen=0
			k.Aggro(usr)
		if(inner==6)
			usr<<"<b>You have reached your limit"
		if(inner==5)
			inner=6
			usr.loc=locate(15,125,8)
			usr.dir=EAST
			k.loc=locate(19,125,8)
			k.dir=WEST
		if(inner==4)
			inner=5
			usr.loc=locate(15,175,8)
			usr.dir=EAST
			k.loc=locate(19,175,8)
			k.dir=WEST
		if(inner==3)
			inner=4
			usr.loc=locate(65,125,8)
			usr.dir=EAST
			k.loc=locate(69,125,8)
			k.dir=WEST
		if(inner==2)
			inner=3
			usr.loc=locate(64,174,8)
			usr.dir=EAST
			k.loc=locate(69,174,8)
			k.dir=WEST
		if(inner==1)
			inner=2
			usr.loc=locate(119,176,8)
			usr.dir=EAST
			k.loc=locate(123,176,8)
			k.dir=WEST
		if(inner==0)
			inner=1
			usr.loc=locate(115,122,8)
			usr.dir=EAST
			k.loc=locate(119,122,8)
			k.dir=WEST