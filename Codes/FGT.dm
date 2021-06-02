mob/var
	iswandevent=0
mob/Wandenreich_Prince
	iswandevent=1
	enemy = 1
	agrange=14
	level=10000
	delay=0
	mhealth = 1400000000
	legit=1
	health = 140000000
	attack = 37500
	mattack = 55000
	mdefence = 30000
	mreiatsu = 57500
	defence = 30000
	reiatsu = 57500
	hostile=1
	killable=1
	healthwas = 1400000000
	mrei = 2000000
	rei=2000000
	instinct=5
	quickflash=5
	berserk=5
	boneharden=20
	criticalhits=5
	headpassive=5
	bodypassive=5
	armpassive=5
	legpassive=5
	race="Pure Blood Quincy"
	wound=0
	armorpassive=20
	rundelay=0
	name="{Boss}Wandenreich Prince"
	spawntime=2000
	New()
		expgain=rand(330000000,390000000)
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
mob/Final_Getsuga_Tenshou
	infinal=1
	inbankai=1
	aggrod=0
	stype="Ichigo"
	mattack=30000
	mdefence=30000
	mreiatsu=30000
	mrei=45000
	attack=45000
	defence=15000
	reiatsu=45000
	rei=30000
	mhealth=350000
	wound=-200
	health=350000
	agrange=12
	isfgt=1
	enemy=1
	killable=1
	hostile=1
	swordon=1
	flashpause=10
	headpassive=5
	bodypassive=5
	armpassive=5
	legpassive=5
	regenrate=75
	bloodlust=1
	instinct=5
	quickflash=5
	berserk=5
	senka=5
	rundelay=2
	expgain=10000000
	hair_type=/obj/hair/h4/black
	icon_name="BaseTan"
	name="{NPC}Final Getsuga Tenshou Ichigo"
	legit=1
	New()
		..()
		src.Load_Overlays()
		src.Affirm_Icon()
		view(src) << "<b>I will never forgive any of you."
mob/Aizen
	inbankai=1
	aggrod=0
	stype="Aizen"
	mattack=17000
	mdefence=17000
	mreiatsu=17000
	mrei=30000
	attack=17000
	defence=17000
	reiatsu=17000
	rei=30000
	mhealth=200000
	wound=-100
	health=200000
	agrange=10
	isrealaizen=1
	enemy=1
	killable=1
	hostile=1
	swordon=1
	flashpause=10
	headpassive=5
	bodypassive=5
	armpassive=5
	legpassive=5
	regenrate=75
	bloodlust=1
	instinct=5
	quickflash=5
	berserk=5
	senka=5
	rundelay=0
	expgain=10000000
	hair_type=/obj/hair/h1/black
	jacket=/obj/Jacket/white
	shirt=/obj/Shirt/white
	shoes=/obj/Shoes/black
	shunning=1
	icon_name="BaseTan"
	name="{NPC}Aizen"
	legit=1
	New()
		..()
		src.Load_Overlays()
		src.Affirm_Icon()
		view(src) << "<b>You just shortened your lifespan by challenging me."