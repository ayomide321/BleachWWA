

mob/var/tmp/inbossyama=0

mob/nodpnewbossYama
	canRegenRei=1
	enemy = 1
	agrange=20
	level=10000
	delay=0
	mhealth = 1400000000
	bossss=1
	health = 1400000000
	attack = 200000
	mattack = 200000
	mdefence = 500000
	mreiatsu = 300000
	defence = 500000
	reiatsu = 300000
	hostile=1
	killable=1
	bossyama2=1
	yamadropfiresword=1
	healthwas = 1400000000
	mrei = 2000000
	rei=2000000
	instinct=5
	quickflash=5
	berserk=5000
	boneharden=300
	criticalhits=500
	headpassive=10
	bodypassive=10
	armpassive=50
	regenpassive=40
	hypebeast=10
	backup=10
	hibernation=10
	woundregen=25
	survival=1
	invincibility=10
	piercepassive=100
	legpassive=100
	race="Nothing"
	wound=0
	armorpassive=100
	glare=5
	angel=10
	name="{Boss}Yammamoto"
	swordon=1
	hasabankai=1
	hasashikai=1
	rundelay = 1
	legit=1
	legit2=1
	hair_type=0
	stype="Yammamoto"
	icon_name="Base"
	spawntime=10 MINUTES
	Tnpccaptain=1
	New()
		expgain=rand(1000000000,3000000000)
		hair_type=/obj/hair/h1/black
		src.cloak=/obj/cloak/captain/c1
		src.weapon=/obj/weapon/sword
		src.overshirt=/obj/overshirt/shinigami/s1
		spawn()src.Affirm_Icon()
		spawn()src.Load_Overlays()
		src.oldspot = src.loc
		..()






mob/nodp_Crown_Prince
	enemy = 1
	agrange=14
	level=8500
	delay=0
	mhealth = 50000000
	bossss=1
	health = 50000000
	attack = 50000
	mattack = 50000
	mdefence = 40000
	mreiatsu = 50000
	defence = 30000
	reiatsu = 90000
	hostile=1
	killable=1
	crownprince=1
	healthwas = 50000000
	mrei = 2000000
	rei=2000000
	instinct=5
	quickflash=5
	berserk=5
	boneharden=300
	criticalhits=5
	headpassive=5
	bodypassive=5
	armpassive=5
	legpassive=5
	race="Pure Blood Quincy"
	wound=0
	armorpassive=20
	rundelay=0
	name="{Boss}Crown Prince Vandenreich"
	spawntime=1700
	New()
		expgain=rand(450000000,500000000)
		spawn()src.Affirm_Icon()
		spawn()src.Load_Overlays()
		src.overlays += /obj/vandprince/botleft
		src.overlays += /obj/vandprince/botmid
		src.overlays += /obj/vandprince/botright
		src.overlays += /obj/vandprince/midleft
		src.overlays += /obj/vandprince/midmid
		src.overlays += /obj/vandprince/midright
		src.overlays += /obj/vandprince/topleft
		src.overlays += /obj/vandprince/topmid
		src.overlays += /obj/vandprince/topright
		src.oldspot = src.loc
		..()



mob/nodp_NewKomma
	canRegenRei=1
	enemy = 1
	agrange=12
	level=7000
	mhealth = 19000000
	health = 19000000
	attack = 35000
	mattack = 35000
	mdefence = 25000
	mreiatsu = 25000
	defence = 25000
	reiatsu = 20000
	hostile=1
	killable=1
	swordon=1
	newkomaboss=1
	healthwas = 19000000
	mrei = 20000
	rei=20000
	instinct=5
	quickflash=5
	berserk=5
	boneharden=300
	criticalhits=5
	headpassive=5
	bodypassive=5
	armpassive=5
	legpassive=5
	race="Hollow"
	spawntime = 1400
	swordon=1
	hasabankai=1
	hasashikai=1
	flashpause=0
	delay=0
	armorpassive=20
	rundelay=2
	name="{Boss} Samurai King"
	stype="Kommamaru"
	bossss=1
	swordcall="Fall.."
	swordname="Sakura"
	Tnpccaptain=1

	New()
		expgain=rand(230000000,390000000)
		spawn()src.Affirm_Icon()
		spawn()src.Load_Overlays()
		src.newkomaboss=1
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
		src.oldspot = src.loc
		src.CeroGen()
		..()




mob/nodp_Lorelei
	canRegenRei=1
	enemy = 1
	agrange=12
	level=7500
	mhealth = 23000000
	bossss=1
	health = 23000000
	attack = 40000
	mattack = 40000
	mdefence = 40000
	mreiatsu = 25000
	defence = 40000
	reiatsu = 25000
	hostile=1
	killable=1
	swordon=1
	lorelei=1
	aacandropdualzan=1
	healthwas = 23000000
	mrei = 300000
	rei=300000
	instinct=5
	quickflash=5
	berserk=5
	boneharden=300
	criticalhits=5
	headpassive=5
	bodypassive=5
	armpassive=5
	legpassive=5
	race="Hollow"
	spawntime = 800
	swordon=1
	hasabankai=1
	hasashikai=1
	armorpassive=20
	rundelay=1
	name="{NPC}Lorelei"
	stype="Yammamoto"
	swordcall="Burn all creation"
	swordname="Hyosuke"
	Tnpccaptain=1
	spawntime=1500
	New()
		expgain=rand(400000000,420000000)
		spawn()src.Affirm_Icon()
		spawn()src.Load_Overlays()
		src.overlays += /obj/Pheonix/botleft11
		src.overlays += /obj/Pheonix/botleft12
		src.overlays += /obj/Pheonix/botleft13
		src.overlays += /obj/Pheonix/botleft21
		src.overlays += /obj/Pheonix/botleft22
		src.overlays += /obj/Pheonix/botleft23
		src.overlays += /obj/Pheonix/botleft31
		src.overlays += /obj/Pheonix/botleft32
		src.overlays += /obj/Pheonix/botleft33
		src.oldspot = src.loc
		src.CeroGen()
		..()



mob
	nodp_Yokai3
		name = "{NPC}Gate Creator"
		canRegenRei=1
		level=6000
		enemy = 1
		Yokai3=1
		mhealth = 14000000
		health = 14000000
		race="Hollow"
		mattack = 25000
		woundregen=5
		mdefence = 35000
		mreiatsu = 15000
		attack = 25000
		defence = 35900
		reiatsu = 15000
		healthwas = 14000000
		rundelay = 1
		legit=1
		legit2=1
		bossss=1
		mrei=65000
		rei=65000
		boneharden=20
		quickflash=5
		piercepassive=5
		instinct=5
		hostile=1
		demons=1
		agrange=20
		hostile=1
		piercepassive=1
		stunpassive=7
		headpassive=2
		bodypassive=2
		armpassive=2
		legpassive=2
		criticalhits=3
		ressurectiontype="Nell"
		killable=1
		spawntime = 1300
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Yokai3/YokaiBottomMiddle
			src.overlays += /obj/Yokai3/YokaiBottomLeft
			src.overlays += /obj/Yokai3/YokaiBottomRight
			src.overlays += /obj/Yokai3/YokaiTop1Mid
			src.overlays += /obj/Yokai3/YokaiTop1Left
			src.overlays += /obj/Yokai3/YokaiTop1Right
			src.overlays += /obj/Yokai3/YokaiTop2Mid
			src.overlays += /obj/Yokai3/YokaiTop2Left
			src.overlays += /obj/Yokai3/YokaiTop2Right
			src.oldspot = src.loc
			expgain=rand(255000000295000000)
			src.CeroGen()
			..()