mob/Gotei_13
	enemy = 1
	agrange=12
	level=4500
	mhealth = 450000
	attack = 15000
	mattack = 15000
	mdefence = 15000
	mreiatsu = 15000
	defence = 15000
	reiatsu = 15000
	hostile=1
	killable=1
	delay=3
	healthwas = 450000
	mrei = 20000
	rei=20000
	instinct=5
	quickflash=5
	berserk=5
	regenrate=90
	criticalhits=5
	headpassive=2
	bodypassive=2
	armpassive=2
	legpassive=2
	race="Shinigami"
	spawntime = 800
	expgain=700000
	swordon=1
	hasabankai=1
	hasashikai=1
	legit=1
	New()
		src.icon_name=pick("Base","BaseTan","BaseBlack")
		src.HairGen()
		src.oldspot = src.loc
		src.cloak=/obj/cloak/captain/c1
		src.weapon=/obj/weapon/sword
		src.overshirt=/obj/overshirt/shinigami/s1
		..()
	C1
		name="{NPC}Yammamoto"
		stype="Yammamoto"
		icon_name="Base"
		npccaptain=1
		reiatsu = 30000
		mreiatsu = 30000
		New()
			hair_type=0
			..()
	C2
		name="{NPC}Soi Fon"
		stype="Stinger"
		icon_name="BaseTan"
		npccaptain=2
		New()
			hair_type=/obj/hair/h3/black
			..()
			src.cloak=0
	C3
		name="{NPC}Gin"
		stype="Ichimaru"
		icon_name="BaseTan"
		npccaptain=3
		New()
			hair_type=/obj/hair/h1/black
			..()
	C4
		name="{NPC}Unohana"
		stype="Unohana"
		icon_name="Base"
		npccaptain=4
		New()
			hair_type=/obj/hair/h4/black
			..()
	C5
		name="{NPC}Aizen"
		stype="Aizen"
		icon_name="Base"
		npccaptain=5
		New()
			hair_type=/obj/hair/h2/black
			..()
	C6
		name="{NPC}Byakuya"
		stype="Byakuya"
		icon_name="Base"
		npccaptain=6
		New()
			hair_type=/obj/hair/h4/black
			special=/obj/special/scarf
			..()
	C7
		name="{NPC}Kommamaru"
		stype="Kommamaru"
		icon_name="BaseTan"
		npccaptain=7
		attack = 10000
		mattack = 10000
		New()
			hair_type=0
			src.facearmor=/obj/facearmor/s3
			..()
	C8
		name="{NPC}Shonsui"
		stype="Shonshui"
		icon_name="BaseTan"
		npccaptain=8
		New()
			hair_type=/obj/hair/h1/black
			..()
	C9
		name="{NPC}Tousen"
		stype="Tousen"
		icon_name="BaseBlack"
		npccaptain=9
		blindfold=1
		New()
			hair_type=/obj/hair/h5/black
			..()
	C10
		name="{NPC}Hitsugaya"
		stype="Hitsugaya"
		icon_name="Base"
		npccaptain=10
		New()
			hair_type=/obj/hair/h2/white
			..()
	C11
		name="{NPC}Kenpachi"
		stype="Zaraki"
		icon_name="BaseTan"
		npccaptain=11
		New()
			hair_type=/obj/hair/h5/black
			..()
			src.overshirt=0
	C12
		name="{NPC}Mayuri"
		stype="Mayuri"
		icon_name="Base"
		npccaptain=12
		New()
			hair_type=0
			..()
	C13
		name="{NPC}Ukitake"
		stype="Ukitake"
		icon_name="Base"
		npccaptain=13
		New()
			hair_type=/obj/hair/h4/white
			..()
mob/Test_Gotei_13
	enemy = 1
	agrange=20
	level=8500
	mhealth = 990000
	attack = 190000
	health=990000
	mattack = 190000
	mdefence = 450000
	mreiatsu = 60000
	defence = 450000
	reiatsu = 60000
	hostile=1
	killable=1
	delay=0
	test_gotei=1
	healthwas = 990000
	mrei = 590000
	rei=590000
	instinct=5
	quickflash=5
	berserk=5
	regenrate=90
	invincibility=10
	criticalhits=5
	headpassive=5
	bodypassive=5
	armpassive=5
	legpassive=5
	armorpassive=5
	race="Nothing"
	spawntime = 800
	expgain=700000
	woundregen=10
	swordon=1
	hasabankai=1
	hasashikai=1
	legit=1
	legit2=1
	New()
		src.icon_name=pick("Base","BaseTan","BaseBlack")
		src.HairGen()
		src.oldspot = null
		src.cloak=/obj/cloak/captain/c1
		src.weapon=/obj/weapon/sword
		src.overshirt=/obj/overshirt/shinigami/s1
		spawn(1)
			src.activated=1
			src.AI()
		..()
	C1
		name="{NPC}Yammamoto"
		stype="Yammamoto"
		icon_name="Base"
		Tnpccaptain=1
		reiatsu = 60000
		mreiatsu = 60000
		flashpause = 0
		New()
			hair_type=0
			..()
	C2
		name="{NPC}Soi Fon"
		stype="Stinger"
		icon_name="BaseTan"
		Tnpccaptain=2
		New()
			hair_type=/obj/hair/h3/black
			..()
			src.cloak=0
	C3
		name="{NPC}Gin"
		stype="Ichimaru"
		icon_name="BaseTan"
		Tnpccaptain=3
		New()
			hair_type=/obj/hair/h1/black
			..()
	C4
		name="{NPC}Unohana"
		stype="Unohana"
		icon_name="Base"
		Tnpccaptain=4
		New()
			hair_type=/obj/hair/h4/black
			..()
	C5
		name="{NPC}Aizen"
		stype="Aizen"
		icon_name="Base"
		Tnpccaptain=5
		New()
			hair_type=/obj/hair/h2/black
			..()
	C6
		name="{NPC}Byakuya"
		stype="Byakuya"
		icon_name="Base"
		Tnpccaptain=6
		New()
			hair_type=/obj/hair/h4/black
			special=/obj/special/scarf
			..()
	C7
		name="{NPC}Kommamaru"
		stype="Kommamaru"
		icon_name="BaseTan"
		Tnpccaptain=7
		attack = 80000
		mattack = 80000
		New()
			hair_type=0
			src.facearmor=/obj/facearmor/s3
			..()
	C8
		name="{NPC}Shonsui"
		stype="Shonshui"
		icon_name="BaseTan"
		Tnpccaptain=8
		New()
			hair_type=/obj/hair/h1/black
			..()
	C9
		name="{NPC}Tousen"
		stype="Tousen"
		icon_name="BaseBlack"
		Tnpccaptain=9
		blindfold=1
		New()
			hair_type=/obj/hair/h5/black
			..()
	C10
		name="{NPC}Hitsugaya"
		stype="Hitsugaya"
		icon_name="Base"
		Tnpccaptain=10
		New()
			hair_type=/obj/hair/h2/white
			..()
	C11
		name="{NPC}Kenpachi"
		stype="Zaraki"
		icon_name="BaseTan"
		Tnpccaptain=11
		New()
			hair_type=/obj/hair/h5/black
			..()
			src.overshirt=0
	C12
		name="{NPC}Mayuri"
		stype="Mayuri"
		icon_name="Base"
		Tnpccaptain=12
		New()
			hair_type=0
			..()
	C13
		name="{NPC}Ukitake"
		stype="Ukitake"
		icon_name="Base"
		Tnpccaptain=13
		New()
			hair_type=/obj/hair/h4/white
			..()
mob/var
	Tnpccaptain=0