mob
	proc
		CustomStypeGen()
			if(src.race!="Arrancar")
				src.stype=pick("Sword Multiplier", "Dark Bat", "Rangiku", "Shusuke", "Hyosuke", "Pheonix", "Matsuri", "Jiroubou")
			src.swordcall=pick("Finish Him","YMCMB","Skeet Skeet","Show no Mercy","Oh Let's Do It","Stab to Death","Stay Shocked","Blast Em to Bits","Let's Get Lucky","Slice and Dice","Swag and Tag","Let's get Heated")
			src.swordname=pick("Fatality","Wakka Flacka","Tunechi","Bob","Cat Daddy","Scorpion","Sub-Zero","Zankillmaru","Kazumi","Soulja","Inferno","Reaper","Based God","ASAP","Kobra","Rack City")

	customVand
		name = "{NPC}Empowered Vandereich Quincy"
		enemy = 1
		agrange=12
		enemy = 1
		level=10000
		mhealth = 50000000
		attack = 2200000
		mattack = 2200000
		hostile=1
		killable=1
		delay=3
		defence = 1100000
		reiatsu = 1000000
		mdefence = 1100000
		mreiatsu = 1000000
		healthwas = 50000000
		mrei = 400000
		rei=400000
		instinct=5
		quickflash=5
		loyalty=1
		race="Ultra Quincy"
		vand=1
		seelsword=1
		spawntime = 900
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			expgain=rand(2,4)*10**8
			src.oldspot = src.loc
			src.ClothesGen()
			src.CustomStypeGen()
			src.swordon=1
			src.hasabankai=1
			src.hasashikai=1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()