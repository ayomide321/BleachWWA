mob/Espada
	IchigoVasto
		icon = 'Aizen.dmi'
		name = "{NPC}VastoIchigo"
		npc = 1
		hair_type=/obj/hair/h4/orange
		vasto=1
		maskon=1
		maskuses=100
		mask=11
		stype="Ichigo"
		inbankai=1
		New()
			..()
			spawn(2)
				src.overlays=0
				src.icon='Icons/NPCs.dmi'
				src.icon_state="Vasto"
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				switch(input("Raarggh!!! Do you want to fight Vasto Ichigo?", text) in list ("Yes","No"))
					if("Yes")
						if(usr.level<500)
							usr<<"You need to be level 500"
							return
						if(usr.z==14)return
						usr.wound=0
						usr.loc=locate(76,100,14)
						usr.dir=EAST
						var/mob/k=new/mob/VastoIchigo
						k.dir=WEST
						k.loc=locate(80,100,14)
						k.frozen=1
						usr.frozen=1
						k.Aggro(usr)
						sleep(15)
						k.frozen=0
						usr.frozen=0
						usr.safe=0
mob
	VastoIchigo
		name = "{NPC}Vasto Ichigo"
		enemy = 1
		level=800
		killable=1
		hostile=1
		rundelay = 0
		mhealth = 100000
		health = 100000
		mattack = 13000
		mdefence = 13000
		mreiatsu = 13000
		mrei=20000
		healthwas = 100000
		stype="Ichigo"
		vastoichigo=1
		inbankai=1
		vasto=0
		maskon=1
		mask=7
		maskuses=100
		shikaidrain=0
		bankaidrain=0
		hair_blue=0
		hair_green=153
		hair_red=255
		hair_type=13
		instinct=10
		senka=5
		hair_type=8
		cerored=150
		cerogreen=0
		ceroblue=0
		weapon=/obj/weapon/sword
		legit=1
		New()
			src.expgain=rand(1000000,2000000)
			src.swordon=1
			src.oldspot = src.loc
			..()
			view(8,src)<<"<b>[src.name]: Raauurrghh!"
mob
	Ulquiorra
		name = "{NPC}Ulquiorra"
		enemy = 1
		level=800
		killable=1
		hostile=1
		rundelay = 0
		mhealth = 120000
		health = 120000
		mattack = 12000
		mdefence = 12000
		mreiatsu = 12000
		mrei=10000
		healthwas = 80000
		ressurectiontype="Ulq"
		ulquiorra=1
		hair_blue=0
		hair_green=0
		hair_red=0
		hair_type=/obj/hair/h1/black
		hair_type=8
		cerored=0
		cerogreen=150
		ceroblue=0
		arrancarmask=14
		cloak=/obj/cloak/espada/e1
		weapon=/obj/weapon/sword
		legit=1
		New()
			src.expgain=rand(600000,650000)
			src.swordon=1
			src.oldspot = src.loc
			..()
			view(8,src)<<"<b>[src.name]: No sense in fighting a losing battle!"
mob
	Szayel
		name = "{NPC}Szayel"
		enemy = 1
		level=400
		killable=1
		hostile=1
		rundelay = 0
		mhealth = 80000
		health = 80000
		mattack = 6000
		mdefence = 6000
		mreiatsu = 6000
		mrei=10000
		healthwas = 80000
		ressurectiontype="Scientist"
		szayel=1
		hair_type=/obj/hair/h3/pink
		hair_type=8
		cerored=150
		cerogreen=0
		ceroblue=150
		arrancarmask=9
		cloak=/obj/cloak/espada/e1
		weapon=/obj/weapon/sword
		legit=1
		New()
			src.expgain=rand(250000,300000)
			src.swordon=1
			src.oldspot = src.loc
			..()
			view(8,src)<<"<b>[src.name]: Looks like a found a new specimen"
			for(var/mob/M in view(8,usr))
				var/sound/S = sound('Sounds/009D_0000.wav',volume=50)
				M << S
mob
	Grimmjow
		name = "{NPC}Grimmjow"
		enemy = 1
		level=600
		killable=1
		hostile=1
		rundelay = 0
		mhealth = 80000
		health = 80000
		mattack = 9000
		mdefence = 9000
		mreiatsu = 9000
		mrei=10000
		healthwas = 80000
		ressurectiontype="Pantera"
		grimmjow=1
		hair_blue=255
		hair_green=102
		hair_red=0
		hair_type=/obj/hair/h2/teal
		cerored=0
		cerogreen=100
		ceroblue=100
		arrancarmask=13
		cloak=/obj/cloak/espada/e2
		weapon=/obj/weapon/sword
		legit=1
		New()
			src.swordon=1
			src.oldspot = src.loc
			src.expgain=rand(450000,50000)
			..()
			view(8,src)<<"<b>[src.name]: Looks like a found a new training dummy to hit on"
			for(var/mob/M in view(8,usr))
				var/sound/S = sound('Sounds/009D_0000.wav',volume=50)
				M << S
	Stark
		name = "{NPC}Stark"
		enemy = 1
		level=1100
		killable=1
		hostile=1
		rundelay = 0
		mhealth = 150000
		health = 150000
		mattack = 15500
		mdefence = 25500
		mreiatsu = 35500
		mrei=50000
		rei=50000
		healthwas = 80000
		ressurectiontype="Shooter"
		stark=1
		hair_blue=0
		hair_green=0
		hair_red=0
		hair_type=/obj/hair/h1/black
		cerored=20
		cerogreen=50
		ceroblue=150
		arrancarmask=10
		cloak=/obj/cloak/espada/e1
		weapon=/obj/weapon/sword
		legit=1
		New()
			src.swordon=1
			src.oldspot = src.loc
			src.expgain=rand(1000000,2000000)
			..()
			view(8,src)<<"<b>[src.name]: I don't even feel like fighting right now."
	Barragan
		name = "{NPC}Barragan"
		enemy = 1
		level=1000
		killable=1
		hostile=1
		rundelay = 0
		mhealth = 150000
		health = 150000
		mattack = 15000
		mdefence = 15000
		mreiatsu = 25000
		mrei=90000
		rei=90000
		healthwas = 80000
		ressurectiontype="Skeleton"
		barragan=1
		hair_blue=190
		hair_green=190
		hair_red=190
		hair_type=/obj/hair/h1/white
		cerored=20
		cerogreen=20
		ceroblue=20
		arrancarmask=4
		cloak=/obj/cloak/espada/e1
		weapon=/obj/weapon/sword
		legit=1
		New()
			src.swordon=1
			src.oldspot = src.loc
			src.expgain=rand(800000,900000)
			..()
			view(8,src)<<"<b>[src.name]: Age at the mercy of my hand."
	Harribel
		name = "{NPC}Harribel"
		enemy = 1
		level=900
		killable=1
		hostile=1
		rundelay = 0
		mhealth = 120000
		health = 120000
		mattack = 19000
		mdefence = 24000
		mreiatsu = 24000
		mrei=90000
		rei=90000
		healthwas = 80000
		ressurectiontype="Halibel"
		swordname="La Gota"
		hal=1
		hair_type=/obj/hair/h1/yellow
		cerored=150
		cerogreen=150
		ceroblue=0
		arrancarmask=10
		cloak=/obj/cloak/espada/e1
		weapon=/obj/weapon/sword
		legit=1
		New()
			src.swordon=1
			src.oldspot = src.loc
			src.expgain=rand(700000,800000)
			..()
			view(8,src)<<"<b>[src.name]: Feel the wrath of my sacrifices."
	Zommari
		name = "{NPC}Zommari"
		enemy = 1
		level=500
		killable=1
		hostile=1
		rundelay = 0
		mhealth = 80000
		health = 80000
		mattack = 8000
		mdefence = 8000
		mreiatsu = 8000
		mrei=50000
		rei=50000
		healthwas = 80000
		ressurectiontype="Zommari"
		zommari=1
		hair_blue=190
		hair_green=190
		hair_red=190
		hair_type=0
		cerored=150
		cerogreen=100
		ceroblue=100
		arrancarmask=3
		cloak=/obj/cloak/espada/e1
		weapon=/obj/weapon/sword
		legit=1
		New()
			src.swordon=1
			src.oldspot = src.loc
			src.expgain=rand(350000,400000)
			..()
			view(8,src)<<"<b>[src.name]: You are now under my control."
	Nnoitra
		name = "{NPC}Nnoitra"
		enemy = 1
		level=700
		killable=1
		hostile=1
		rundelay = 0
		mhealth = 80000
		health = 80000
		mattack = 12000
		mdefence = 10000
		mreiatsu = 15000
		mrei=50000
		rei=50000
		healthwas = 80000
		ressurectiontype="Nnoitra"
		nnoitra=1
		hair_blue=0
		hair_green=0
		hair_red=0
		hair_type=/obj/hair/h1/black
		cerored=150
		cerogreen=150
		ceroblue=0
		arrancarmask=12
		cloak=/obj/cloak/espada/e1
		weapon=/obj/weapon/sword
		legit=1
		New()
			src.swordon=1
			src.oldspot = src.loc
			src.expgain=rand(500000,550000)
			..()
			view(8,src)<<"<b>[src.name]: Die."
mob/Espada
	Grimmjow
		icon = 'Aizen.dmi'
		name = "{NPC}Grimmjow"
		npc = 1
		hair_blue=255
		hair_green=102
		hair_red=0
		hair_type=/obj/hair/h2/teal
		cerored=50
		ceroblue=50
		cerogreen=150
		arrancarmask=13
		cloak=/obj/cloak/espada/e1
		weapon=/obj/weapon/sword
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				switch(input("Hey, wanna fight me?", text) in list ("Yes","No"))
					if("Yes")
						if(usr.level<300)
							usr<<"You need to be level 300"
							return
						if(usr.z==14)return
						usr.wound=0
						usr.loc=locate(79,59,14)
						usr.dir=EAST
						var/mob/k=new/mob/Grimmjow
						k.dir=WEST
						k.loc=locate(84,59,14)
						k.frozen=1
						usr.frozen=1
						usr.safe=0
						k.Aggro(usr)
						sleep(15)
						k.frozen=0
						usr.frozen=0
						usr.safe=0
	Nnoitra
		icon = 'Aizen.dmi'
		name = "{NPC}Nnoitra"
		npc = 1
		hair_blue=0
		hair_green=0
		hair_red=0
		hair_type=/obj/hair/h1/black
		arrancarmask=12
		cloak=/obj/cloak/espada/e1
		weapon=/obj/weapon/sword
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				switch(input("Hey, wanna fight me?", text) in list ("Yes","No"))
					if("Yes")
						if(usr.level<300)
							usr<<"You need to be level 300"
							return
						if(usr.z==14)return
						usr.wound=0
						usr.loc=locate(79,59,14)
						usr.dir=EAST
						var/mob/k=new/mob/Nnoitra
						k.dir=WEST
						k.loc=locate(84,59,14)
						k.frozen=1
						usr.frozen=1
						usr.safe=0
						k.Aggro(usr)
						sleep(15)
						k.frozen=0
						usr.frozen=0
						usr.safe=0
	Szayel
		icon = 'Aizen.dmi'
		name = "{NPC}Szayel"
		npc = 1
		hair_blue=255
		hair_green=51
		hair_red=255
		hair_type=/obj/hair/h3/pink
		arrancarmask=9
		cloak=/obj/cloak/espada/e1
		weapon=/obj/weapon/sword
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				switch(input("Hey, think you can beat me?", text) in list ("Yes","No"))
					if("Yes")
						if(usr.level<300)
							usr<<"You need to be level 300"
							return
						if(usr.z==14)return
						usr.wound=0
						usr.loc=locate(2,180,14)
						usr.dir=NORTH
						var/mob/k=new/mob/Szayel
						k.dir=SOUTH
						k.loc=locate(2,184,14)
						k.frozen=1
						usr.frozen=1
						usr.safe=0
						k.Aggro(usr)
						sleep(15)
						k.frozen=0
						usr.frozen=0
						usr.safe=0
	Ulquiorra
		icon = 'Aizen.dmi'
		name = "{NPC}Ulquiorra"
		npc = 1
		hair_blue=0
		hair_green=0
		hair_red=0
		hair_type=/obj/hair/h2/black
		arrancarmask=14
		cloak=/obj/cloak/espada/e1
		weapon=/obj/weapon/sword
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				switch(input("Hey, think you can beat me?", text) in list ("Yes","No"))
					if("Yes")
						if(usr.level<350)
							usr<<"You need to be level 350"
							return
						if(usr.z==14)return
						usr.wound=0
						usr.loc=locate(76,100,14)
						usr.dir=EAST
						var/mob/k=new/mob/Ulquiorra
						k.dir=WEST
						k.loc=locate(80,100,14)
						k.frozen=1
						usr.frozen=1
						usr.safe=0
						k.Aggro(usr)
						sleep(15)
						k.frozen=0
						usr.frozen=0
						usr.safe=0
	Stark
		icon = 'Aizen.dmi'
		name = "{NPC}Stark"
		npc = 1
		hair_blue=0
		hair_green=0
		hair_red=0
		hair_type=/obj/hair/h1/black
		arrancarmask=10
		cloak=/obj/cloak/espada/e1
		weapon=/obj/weapon/sword
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				switch(input("Hey, think you can beat me?", text) in list ("Yes","No"))
					if("Yes")
						if(usr.storycom<90)
							usr<<"You aren't ready for him yet"
							return
						if(usr.z==14)return
						usr.wound=0
						usr.loc=locate(170,17,14)
						usr.dir=EAST
						var/mob/k=new/mob/Stark
						k.dir=WEST
						k.loc=locate(174,17,14)
						k.frozen=1
						usr.frozen=1
						usr.safe=0
						k.Aggro(usr)
						sleep(15)
						k.frozen=0
						usr.frozen=0
						usr.safe=0
	Barragan
		icon = 'Aizen.dmi'
		name = "{NPC}Barragan"
		npc = 1
		hair_blue=190
		hair_green=190
		hair_red=190
		hair_type=1
		arrancarmask=4
		cloak=/obj/cloak/espada/e1
		icon_name="BaseBlack"
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				switch(input("I used to be king of hueco mundo, think you can beat me?", text) in list ("Yes","No"))
					if("Yes")
						if(usr.level<350)
							usr<<"You need to be level 350"
							return
						if(usr.z==14)return
						usr.wound=0
						usr.loc=locate(170,17,14)
						usr.dir=EAST
						var/mob/k=new/mob/Barragan
						k.dir=WEST
						k.loc=locate(174,17,14)
						k.frozen=1
						usr.frozen=1
						usr.safe=0
						k.Aggro(usr)
						sleep(15)
						k.frozen=0
						usr.frozen=0
						usr.safe=0
	Harribel
		icon = 'Aizen.dmi'
		name = "{NPC}Harribel"
		npc = 1
		hair_blue=0
		hair_green=190
		hair_red=190
		hair_type=9
		arrancarmask=10
		cloak=/obj/cloak/espada/e1
		icon_name="BaseBlack"
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				switch(input("The sacrifices I made were very dear, do you wish to fight?", text) in list ("Yes","No"))
					if("Yes")
						if(usr.level<350)
							usr<<"You need to be level 350"
							return
						if(usr.z==14)return
						usr.wound=0
						usr.loc=locate(170,17,14)
						usr.dir=EAST
						var/mob/k=new/mob/Harribel
						k.dir=WEST
						k.loc=locate(174,17,14)
						k.frozen=1
						usr.frozen=1
						usr.safe=0
						k.Aggro(usr)
						sleep(15)
						k.frozen=0
						usr.frozen=0
						usr.safe=0
	Zommari
		icon = 'Aizen.dmi'
		name = "{NPC}Zommari"
		npc = 1
		hair_blue=190
		hair_green=190
		hair_red=190
		hair_type=0
		arrancarmask=3
		cloak=/obj/cloak/espada/e1
		icon_name="BaseBlack"
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				switch(input("I used to be king of hueco mundo, think you can beat me?", text) in list ("Yes","No"))
					if("Yes")
						if(usr.level<300)
							usr<<"You need to be level 300"
							return
						if(usr.z==14)return
						usr.wound=0
						usr.loc=locate(2,180,14)
						usr.dir=NORTH
						var/mob/k=new/mob/Zommari
						k.dir=SOUTH
						k.loc=locate(2,184,14)
						k.frozen=1
						usr.frozen=1
						usr.safe=0
						k.Aggro(usr)
						sleep(15)
						k.frozen=0
						usr.frozen=0
						usr.safe=0