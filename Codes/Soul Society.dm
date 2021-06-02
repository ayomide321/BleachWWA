mob/var
	missionchar=0
mob/Missions
	New()
		src.expgain=rand(50000,70000)
		..()
		src.regeneration()
	Rukia
		name = "{Rukia}"
		rundelay = 0
		missionchar=1
		npc=1
		race="Shinigami"
		New()
			..()
			spawn(3)
			usr.icon='Icons/NPCs.dmi'
			usr.icon_state="Rukia"
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(usr.beatshinis>=10&&usr.beatbyakuya)
					usr<<"<b>Rukia:</b> Thank you [usr.name], I don't know how to repay you"
					usr<<"<font color = purple>You have gotten 10,000 exp and $20,000."
					usr.GainExp(10000)
					//usr.Level_Up()
					usr.GainMoney(20000)
					usr.loc=locate(106,186,4)
					usr << sound(null)
				else
					usr<<"<b>You must kill at least 10 leitenants or captains then defeat Byakuya!"
	Renji
		name = "{NPC}Renji"
		enemy = 1
		killable=1
		rundelay = -99
		mhealth = 40000
		health = 40000
		level=400
		race="Shinigami"
		mattack = 4000
		mdefence = 4000
		attack = 4000
		defence = 4000
		reiatsu = 4000
		mreiatsu = 4000
		mrei = 6000
		rei = 6000
		hostile=1
		spawntime = 600
		healthwas = 40000
		hasashikai=1
		hasabankai=1
		shini=1
		New()
			src.icon_name="BaseTan"
			src.hair_type=12
			src.hair_red=150
			src.hair_green=0
			src.hair_blue=0
			src.swordon=1
			src.stype="Renji"
			src.swordcall="Howl"
			src.swordname="Zabimaru"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/shinigami/s1
			src.facearmor=/obj/facearmor/s1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
	Hisagi
		name = "{NPC}Hisagi"
		enemy = 1
		killable=1
		rundelay = -99
		mhealth = 40000
		health = 40000
		level=400
		race="Shinigami"
		mattack = 4000
		mdefence = 4000
		attack = 4000
		defence = 4000
		reiatsu = 4000
		mreiatsu = 4000
		mrei = 6000
		rei = 6000
		hostile=1
		spawntime = 600
		healthwas = 40000
		hasashikai=1
		hasabankai=1
		shini=1
		New()
			src.icon_name="BaseTan"
			src.hair_type=12
			src.hair_red=150
			src.hair_green=0
			src.hair_blue=0
			src.swordon=1
			src.stype="Hisagi"
			src.swordcall="Reap"
			src.swordname="Kazeshini"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/shinigami/s1
			src.facearmor=/obj/facearmor/s1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()

	Kira
		name = "{NPC}Kira"
		enemy = 1
		killable=1
		rundelay = -99
		mhealth = 40000
		health = 40000
		level=400
		race="Shinigami"
		mattack = 4000
		mdefence = 4000
		attack = 4000
		defence = 4000
		reiatsu = 4000
		mreiatsu = 4000
		mrei = 6000
		rei = 6000
		hostile=1
		spawntime = 600
		healthwas = 40000
		hasashikai=1
		hasabankai=1
		shini=1
		New()
			src.icon_name="Base"
			src.hair_type=10
			src.hair_red=150
			src.hair_green=150
			src.hair_blue=0
			src.swordon=1
			src.stype="Kira"
			src.swordcall="Raise Your Head"
			src.swordname="Wabisuke"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/shinigami/s1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
	Hinamori
		name = "{NPC}Hinamori"
		enemy = 1
		killable=1
		rundelay = -99
		mhealth = 40000
		health = 40000
		level=400
		race="Shinigami"
		mattack = 4000
		mdefence = 4000
		attack = 4000
		defence = 4000
		reiatsu = 4000
		mreiatsu = 4000
		mrei = 6000
		rei = 6000
		hostile=1
		spawntime = 600
		healthwas = 40000
		hasashikai=1
		hasabankai=1
		shini=1
		New()
			src.icon_name="Base"
			src.hair_type=6
			src.hair_red=0
			src.hair_green=0
			src.hair_blue=0
			src.swordon=1
			src.stype="Hinamori"
			src.swordcall="Snap"
			src.swordname="Tobiume"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/shinigami/s1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
	Yumichika
		name = "{NPC}Yumichika"
		enemy = 1
		killable=1
		rundelay = -99
		mhealth = 40000
		health = 40000
		level=400
		race="Shinigami"
		mattack = 4000
		mdefence = 4000
		attack = 4000
		defence = 4000
		reiatsu = 4000
		mreiatsu = 4000
		mrei = 6000
		rei = 6000
		hostile=1
		spawntime = 600
		healthwas = 40000
		hasashikai=1
		hasabankai=1
		shini=1
		New()
			src.icon_name="Base"
			src.hair_type=9
			src.hair_red=0
			src.hair_green=0
			src.hair_blue=20
			src.swordon=1
			src.stype="Yumichika"
			src.swordcall="Grow"
			src.swordname="Sword"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/shinigami/s1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
	Ikkaku
		name = "{NPC}Ikkaku"
		enemy = 1
		killable=1
		rundelay = -99
		mhealth = 40000
		health = 40000
		level=400
		race="Shinigami"
		mattack = 4000
		mdefence = 4000
		attack = 4000
		defence = 4000
		reiatsu = 4000
		mreiatsu = 4000
		mrei = 6000
		rei = 6000
		hostile=1
		spawntime = 600
		healthwas = 40000
		hasashikai=1
		hasabankai=1
		shini=1
		New()
			src.icon_name="Base"
			src.hair_type=0
			src.hair_red=150
			src.hair_green=0
			src.hair_blue=0
			src.swordon=1
			src.stype="Ikkaku"
			src.swordcall="Grow"
			src.swordname="Hoozoukimaru"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/shinigami/s1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()







mob/Missions
	Yammamoto
		name = "{NPC}Yammamoto"
		enemy = 1
		killable=1
		rundelay = -99
		mhealth = 60000
		health = 60000
		level=500
		race="Shinigami"
		mattack = 5000
		mdefence = 5000
		attack = 5000
		defence = 5000
		reiatsu = 5000
		mreiatsu = 5000
		mrei = 7000
		rei = 7000
		hostile=1
		spawntime = 800
		healthwas = 60000
		hasashikai=1
		hasabankai=1
		shini=1
		New()
			src.icon_name="Base"
			src.hair_type=0
			src.rei=src.mrei
			src.health=src.mhealth
			src.attack=src.mattack
			src.defence=src.mdefence
			src.swordon=1
			src.stype="Yammamoto"
			src.swordcall="Blaze"
			src.swordname="Ryuujin Jakka"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/shinigami/s1
			src.overshirt=/obj/cloak/captain/c1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
	Byakuya
		name = "{NPC}Byakuya"
		enemy = 1
		killable=1
		rundelay = -99
		mhealth = 60000
		health = 60000
		level=500
		race="Shinigami"
		mattack = 5000
		mdefence = 5000
		attack = 5000
		defence = 5000
		reiatsu = 5000
		mreiatsu = 5000
		mrei = 7000
		rei = 7000
		hostile=1
		spawntime = 800
		healthwas = 60000
		hasashikai=1
		hasabankai=1
		shini=1
		byakuyas=1
		New()
			src.icon_name="Base"
			src.hair_type=13
			src.hair_red=0
			src.hair_green=0
			src.hair_blue=0
			src.swordon=1
			src.stype="Byakuya"
			src.swordcall="Scatter"
			src.swordname="Senbonzakura"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/shinigami/s1
			src.cloak=/obj/cloak/captain/c1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
			src.killable=1
	Tousen
		name = "{NPC}Tousen"
		enemy = 1
		killable=1
		rundelay = -99
		mhealth = 60000
		health = 60000
		level=500
		race="Shinigami"
		mattack = 5000
		mdefence = 5000
		attack = 5000
		defence = 5000
		reiatsu = 5000
		mreiatsu = 5000
		mrei = 7000
		rei = 7000
		hostile=1
		spawntime = 800
		healthwas = 60000
		hasashikai=1
		hasabankai=1
		shini=1
		New()
			src.icon_name="BaseBlack"
			src.hair_type=15
			src.rei=src.mrei
			src.attack=src.mattack
			src.defence=src.mdefence
			src.swordon=1
			src.stype="Tousen"
			src.swordcall="Cry"
			src.swordname="Benihime"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/shinigami/s1
			src.cloak=/obj/cloak/captain/c1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
	Mayuri
		name = "{NPC}Mayuri"
		enemy = 1
		killable=1
		rundelay = -99
		mhealth = 60000
		health = 60000
		level=500
		race="Shinigami"
		mattack = 5000
		mdefence = 5000
		attack = 5000
		defence = 5000
		reiatsu = 5000
		mreiatsu = 5000
		mrei = 7000
		rei = 7000
		hostile=1
		spawntime = 800
		healthwas = 60000
		hasashikai=1
		hasabankai=1
		shini=1
		New()
			src.icon_name="Base"
			src.hair_type=0
			src.rei=src.mrei
			src.health=src.mhealth
			src.attack=src.mattack
			src.defence=src.mdefence
			src.swordon=1
			src.stype="Mayuri"
			src.swordcall="Pierce"
			src.swordname="Ashisogi Jizo"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/shinigami/s1
			src.cloak=/obj/cloak/captain/c1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
	Gin
		name = "{NPC}Gin"
		enemy = 1
		killable=1
		rundelay = -99
		mhealth = 60000
		health = 60000
		level=500
		race="Shinigami"
		mattack = 5000
		mdefence = 5000
		attack = 5000
		defence = 5000
		reiatsu = 5000
		mreiatsu = 5000
		mrei = 7000
		rei = 7000
		hostile=1
		spawntime = 800
		healthwas = 60000
		hasashikai=1
		hasabankai=1
		shini=1
		New()
			src.icon_name="Base"
			src.hair_type=0
			src.rei=src.mrei
			src.health=src.mhealth
			src.attack=src.mattack
			src.defence=src.mdefence
			src.swordon=1
			src.stype="Ichimaru"
			src.swordcall="Shoot to Kill"
			src.swordname="Shinsou"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/shinigami/s1
			src.cloak=/obj/cloak/captain/c1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
	Soi_Fon
		name = "{NPC}Soi Fon"
		enemy = 1
		killable=1
		rundelay = -99
		mhealth = 60000
		health = 60000
		level=500
		race="Shinigami"
		mattack = 5000
		mdefence = 5000
		attack = 5000
		defence = 5000
		reiatsu = 5000
		mreiatsu = 5000
		mrei = 7000
		rei = 7000
		hostile=1
		spawntime = 800
		healthwas = 60000
		hasashikai=1
		hasabankai=1
		shini=1
		New()
			src.icon_name="BaseTan"
			src.hair_type=17
			src.rei=src.mrei
			src.attack=src.mattack
			src.defence=src.mdefence
			src.swordon=1
			src.stype="Stinger"
			src.swordcall="Sting All Enemies to Death"
			src.swordname="Suzumebachi"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/shinigami/s1
			src.cloak=/obj/cloak/captain/c1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
	Kommamaru
		name = "{NPC}Kommamaru"
		enemy = 1
		killable=1
		rundelay = -99
		mhealth = 60000
		health = 60000
		level=500
		race="Shinigami"
		mattack = 5000
		mdefence = 5000
		attack = 5000
		defence = 5000
		reiatsu = 5000
		mreiatsu = 5000
		mrei = 7000
		rei = 7000
		hostile=1
		spawntime = 800
		healthwas = 60000
		hasashikai=1
		hasabankai=1
		shini=1
		New()
			src.icon_name="BaseBlack"
			src.rei=src.mrei
			src.attack=src.mattack
			src.defence=src.mdefence
			src.swordon=1
			src.stype="Kommamaru"
			src.swordcall="Annihilate"
			src.swordname="Tenken"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/shinigami/s1
			src.facearmor=/obj/facearmor/s3
			src.cloak=/obj/cloak/captain/c1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
	Ukitake
		name = "{NPC}Ukitake"
		enemy = 1
		killable=1
		rundelay = -99
		mhealth = 60000
		health = 60000
		level=500
		race="Shinigami"
		mattack = 5000
		mdefence = 5000
		attack = 5000
		defence = 5000
		reiatsu = 5000
		mreiatsu = 5000
		mrei = 7000
		rei = 7000
		hostile=1
		spawntime = 800
		healthwas = 60000
		hasashikai=1
		hasabankai=1
		shini=1
		New()
			src.icon_name="Base"
			src.hair_type=13
			src.rei=src.mrei
			src.attack=src.mattack
			src.defence=src.mdefence
			src.swordon=1
			src.stype="Ukitake"
			src.swordcall="Absorb"
			src.swordname="Twins"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/shinigami/s1
			src.cloak=/obj/cloak/captain/c1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
	Shunsui
		name = "{NPC}Shunsui"
		enemy = 1
		killable=1
		rundelay = -99
		mhealth = 60000
		health = 60000
		level=500
		race="Shinigami"
		mattack = 5000
		mdefence = 5000
		attack = 5000
		defence = 5000
		reiatsu = 5000
		mreiatsu = 5000
		mrei = 7000
		rei = 7000
		hostile=1
		spawntime = 800
		healthwas = 60000
		hasashikai=1
		hasabankai=1
		shini=1
		New()
			src.icon_name="BaseTan"
			src.hair_type=5
			src.rei=src.mrei
			src.attack=src.mattack
			src.defence=src.mdefence
			src.swordon=1
			src.stype="Shonshui"
			src.swordcall="Come Out and Play"
			src.swordname="Twins"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/shinigami/s1
			src.cloak=/obj/cloak/captain/c1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
	Kenpachi
		name = "{NPC}Kenpachi"
		enemy = 1
		killable=1
		rundelay = -99
		mhealth = 60000
		health = 60000
		level=500
		race="Shinigami"
		mattack = 4000
		mdefence = 4000
		attack = 4000
		defence = 4000
		reiatsu = 4000
		mreiatsu = 4000
		mrei = 7000
		rei = 7000
		hostile=1
		spawntime = 800
		healthwas = 60000
		hasashikai=1
		hasabankai=1
		shini=1
		New()
			src.icon_name="BaseTan"
			src.hair_type=5
			src.rei=src.mrei
			src.attack=src.mattack
			src.defence=src.mdefence
			src.swordon=1
			src.stype="Zaraki"
			src.swordcall="HAHAHAHA"
			src.swordname="DON'T BE WEAK"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
	Hitsugaya
		name = "{NPC}Hitsugaya"
		enemy = 1
		killable=1
		rundelay = -99
		mhealth = 60000
		health = 60000
		level=500
		race="Shinigami"
		mattack = 5000
		mdefence = 5000
		attack = 5000
		defence = 5000
		reiatsu = 5000
		mreiatsu = 5000
		mrei = 7000
		rei = 7000
		hostile=1
		spawntime = 800
		healthwas = 60000
		hasashikai=1
		hasabankai=1
		shini=1
		New()
			src.icon_name="Base"
			src.hair_type=7
			src.hair_red=150
			src.hair_green=150
			src.hair_blue=150
			src.rei=src.mrei
			src.attack=src.mattack
			src.defence=src.mdefence
			src.swordon=1
			src.stype="Hitsugaya"
			src.swordcall="Sit Upon the Frozen Heavens"
			src.swordname="Hyourinmaru"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.cloak=/obj/cloak/captain/c1
			src.overshirt=/obj/overshirt/shinigami/s1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
obj/bridge
	icon='Icons/outside.dmi'
	icon_state="ladder"
	layer=32
	pixel_y=0
	under
		pixel_y=3
		layer=3
	Floor
		pixel_y=3
		layer=2
		icon='Icons/SS.dmi'
		icon_state = "Floor"
turf/bridge
	icon='Icons/outside.dmi'
	icon_state="ladder"
	layer=32
	shadow
		icon_state="ladder2"
		layer=32
turf/shadows
	icon='Icons/outside.dmi'
	s1
		icon_state="s1"
		layer=32
	s2
		icon_state="s2"
		layer=32
	s3
		icon_state="s3"
		layer=32
	s4
		icon_state="s4"
		layer=32
	s5
		icon_state="s5"
		layer=32
mob
 SSHouggaurd
		name = "{NPC}Seireitei Hougyoku Guard"
		npc = 1
		level=2000
		mhealth = 600000
		attack = 65000
		mattack = 65000
		killable=1
		defence = 65000
		reiatsu = 65000
		mdefence = 65000
		mreiatsu = 65000
		healthwas = 600000
		mrei = 50000
		rei=50000
		psp=1
		hostile=1
		instinct=10
		berserk=5
		healthgain = 0
		reigain = 0
		strgain = 0
		race="Shinigami"
		defgain = 0
		reipgain = 0
		spawntime = 300
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			expgain=rand(10000,15000)
			src.swordon=1
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=pick(/obj/overshirt/shinigami/s1,/obj/overshirt/shinigami/s2)
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.StypeGen()
			..()
mob
 EarthHouggaurd
		name = "{NPC}Earth Hougyoku Guard"
		npc = 1
		level=2000
		mhealth = 600000
		attack = 65000
		mattack = 65000
		killable=1
		hostile=1
		defence = 65000
		reiatsu = 65000
		mdefence = 65000
		mreiatsu = 65000
		healthwas = 600000
		mrei = 50000
		rei=50000
		psp=1
		instinct=10
		berserk=5
		healthgain = 0
		reigain = 0
		strgain = 0
		race="Shinigami"
		defgain = 0
		reipgain = 0
		spawntime = 300
		spawntime = 200
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.oldspot = src.loc
			src.ClothesGen()
			src.weapon=/obj/weapon/sword
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
mob
 HMHouggaurd
		name = "{NPC}Las Noches Hougyoku Guard"
		npc = 1
		level=2000
		mhealth = 600000
		attack = 65000
		mattack = 65000
		killable=1
		defence = 65000
		reiatsu = 65000
		mdefence = 65000
		mreiatsu = 65000
		healthwas = 600000
		mrei = 50000
		rei=50000
		psp=1
		hostile=1
		instinct=10
		berserk=5
		healthgain = 0
		reigain = 0
		strgain = 0
		race="Shinigami"
		defgain = 0
		reipgain = 0
		spawntime = 300
		spawntime = 200
		New()
			src.icon_name="BaseBlack"
			src.HairGen()
			src.oldspot = src.loc
			src.ClothesGen()
			src.overshirt=pick(/obj/cloak/espada/e1,/obj/cloak/espada/e2)
			src.weapon=/obj/weapon/sword
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
mob
 rukongaigaurd
		name = "{NPC}Rukongai Gaurd"
		npc = 1
		level=500
		mhealth = 60000
		attack = 2500
		mattack = 2500
		killable=1
		defence = 2500
		reiatsu = 2500
		mdefence = 2500
		mreiatsu = 2500
		healthwas = 60000
		mrei = 5000
		rei=5000
		psp=1
		instinct=10
		berserk=5
		healthgain = 0
		reigain = 0
		strgain = 0
		race="Shinigami"
		defgain = 0
		reipgain = 0
		spawntime = 300
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			expgain=rand(10000,15000)
			src.swordon=1
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=pick(/obj/overshirt/shinigami/s1,/obj/overshirt/shinigami/s2)
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.StypeGen()
			..()
	rukongaicivilian
		name = "{NPC}Rukongai Civilian"
		npc = 1
		level=100
		health = 10000
		attack = 400
		defence = 400
		reiatsu = 400
		mattack = 400
		mdefence = 400
		mreiatsu = 400
		killable=1
		mrei = 1000
		rei=1000
		mhealth = 23000
		healthwas = 23000
		race="Civilian"
		spawntime = 200
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.oldspot = src.loc
			src.ClothesGen()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
	Human_Citizen
		name = "{NPC}Human Citizen"
		npc = 1
		level=100
		health = 10000
		attack = 400
		defence = 400
		reiatsu = 400
		mattack = 400
		mdefence = 400
		mreiatsu = 400
		killable=1
		mrei = 1000
		rei=1000
		mhealth = 23000
		healthwas = 23000
		race="Civilian"
		spawntime = 200
		New()
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.oldspot = src.loc
			src.ClothesGen()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()