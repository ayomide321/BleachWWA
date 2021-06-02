mob/Espadas
	enemy = 1
	agrange=12
	level=1000
	mhealth = 550000
	attack = 32000
	mattack = 32000
	mdefence = 22000
	mreiatsu = 32000
	defence = 22000
	reiatsu = 32000
	hostile=1
	killable=1
	delay=3
	healthwas = 550000
	mrei = 30000
	rei=30000
	instinct=5
	quickflash=5
	berserk=5
	regenrate=90
	criticalhits=5
	headpassive=2
	bodypassive=2
	armpassive=2
	legpassive=2
	hierro=5
	beatfgts=1
	race="Arrancar"
	spawntime = 800
	expgain=700000
	swordon=1
	legit=1
	New()
		src.icon_name=pick("Base","BaseTan","BaseBlack")
		src.HairGen()
		src.oldspot = src.loc
		src.cloak=/obj/cloak/espada/e1
		src.weapon=/obj/weapon/sword
		..()
	C1
		name="{NPC}Stark"
		ressurectiontype="Shooter"
		icon_name="BaseTan"
		npcespada=1
		reiatsu = 50000
		mreiatsu = 50000
		New()
			hair_type=/obj/hair/h1/black
			cerocolor="Blue"
			arrancarmask=3
			..()
	C2
		name="{NPC}Barragan"
		ressurectiontype="Skeleton"
		icon_name="BaseBlack"
		npcespada=2
		New()
			hair_type=/obj/hair/h3/white
			cerocolor="Black"
			..()
	C3
		name="{NPC}Harribel"
		ressurectiontype="Halibel"
		icon_name="BaseBlack"
		npcespada=3
		New()
			hair_type=/obj/hair/h4/yellow
			cerocolor="Yellow"
			..()
	C4
		name="{NPC}Ulquiorra"
		ressurectiontype="Ulq"
		icon_name="BasePale"
		npcespada=4
		New()
			hair_type=/obj/hair/h1/black
			cerocolor="Green"
			arrancarmask=2
			..()
	C5
		name="{NPC}Nnoitra"
		ressurectiontype="Nnoitra"
		icon_name="Base"
		npcespada=5
		New()
			hair_type=/obj/hair/h4/black
			cerocolor="Yellow"
			..()
	C6
		name="{NPC}Grimmjow"
		ressurectiontype="Pantera"
		icon_name="BaseTan"
		npcespada=6
		New()
			src.cloak=/obj/cloak/espada/e2
			hair_type=/obj/hair/h2/blue
			cerocolor="Blue"
			arrancarmask=3
			..()
	C7
		name="{NPC}Zommari"
		ressurectiontype="Zommari"
		icon_name="BaseBlack"
		npcespada=7
		New()
			cerocolor="Red"
			..()
	C8
		name="{NPC}Szayel"
		ressurectiontype="Scientist"
		icon_name="Base"
		npcespada=8
		New()
			hair_type=/obj/hair/h3/pink
			cerocolor="Red"
			..()