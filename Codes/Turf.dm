world
	hub = "Devilminions528.BleachWorldWideAdventures"//"ZeeXHosting.BleachWorldWideAdventure"//"Deathscyth15.BleachWWAbyCritical172"
	name = "Bleach: World Wide Adventures"
	status = "<font size=2><font face=Algerian><font color=black>B<font face=times new roman>leach: <font face=Algerian>World<font face=times new roman> Wide<font face=Algerian> Adventure<font face=times new roman> Server Version 2.1</font>"
	hub_password = "c9KOXPYzzyZ1R6IR"
	view = 8
turf
	EventSky
		cloud1
			icon='Icons/eventclouds.dmi'
			icon_state="c1"
		cloud2
			icon='Icons/eventclouds.dmi'
			icon_state="c2"
		cloud3
			icon='Icons/eventclouds.dmi'
			icon_state="c3"
		bluesky
			icon='Icons/sky background2.dmi'
			icon_state="1"

	NewDesert
		Portal
			icon='Icons/desentry.dmi'
			layer=60
		Desert
			icon='Icons/des sand.dmi'
			Sand1
				icon_state="1"
			Sand2
				icon_state="2"
			Cactus
				icon_state="cact"
				density=1
				layer=8
			Rock1
				icon_state="rock1"
				density=1
				layer=8
			Rock2
				icon_state="rock2"
				density=1
				layer=8
		Waterfall
			icon='Icons/thewaterfall.dmi'
			Mid1
				icon_state="1"
			Mid2
				icon_state="1saved"
				density=1
			Splashmid
				icon_state="4"
			Right
				icon_state="2"
			Left
				icon_state="3"
obj/A_stop
	icon='Icons/A stop.dmi'
	density=1
turf/BleachWWAZag
	icon='Icons/zagz login screen4.jpg'
	layer=300
	plane=2
	density=1
turf/VaizardBase
	icon='Icons/VaizardBase.dmi'
	layer=20
	density=1
turf/GuildHouse
	icon='Icons/Bleach WWA House #1.dmi'
	layer=20
	density=0
obj/shitotsu
	icon='Icons/shitotsu sansen.dmi'
	icon_state="flick"
	layer=15
turf/ulqpillar
	icon='Icons/pillarnew.dmi'
	layer=20
turf
	NewKomaArea
		PetalTree
			icon='Icons/petal new tree.dmi'
			layer=15
		TeleTurfs
			icon='Icons/tele to new sakura area.dmi'
			layer=15
turf/LoginScreen6000
	icon='Icons/Bleach WWAScreen 1.jpg'
	layer=100
	plane=2
	density=1
obj/palmtree
	icon='Icons/palmtree.dmi'
	layer=15
	pixel_x=-16
obj/icey
	icon='Icons/ice.dmi'
	layer=50
	mouse_opacity=0
	zer=1
turf/well
	icon='Icons/turfs.dmi'
	icon_state="well"
	density=1
	well=1
turf/gamefloor
	icon='Icons/turfs.dmi'
	icon_state="game"
turf/HariLogin
	icon='Icons/bleach tia harribel espadalogin.png'
	density=1
	layer=200
	plane=2
turf/Login
	icon='Icons/Login.jpg'
	density = 1
	plane=2
	layer=100
turf/ZarakiLogin
	plane=2
	icon='Icons/zaraki login screen.jpg'
	layer=200
	density=1
turf/Loginscreen5
	plane=2
	icon='Icons/bleach--memorias.jpeg'
	density = 1
	layer=100
turf/Loginscreen500
	icon='Icons/loginscreen500.png'
	density=1
	plane=2
	layer=100
obj/items/mission/bucketofwater
	name="Water"
	icon='Icons/turfs.dmi'
	icon_state="bucket"
obj/bucketofwater
turf/Shinigami_King
	icon='Icons/halloween.gif'
	layer=150

turf/maps
	layer=98
	icon='Icons/PNG/map1.dmi'
	density=1
	Click()
		if(istype(usr,/mob/player))
			usr.GoCust16()
			return
	map1
		icon='Icons/earth map5.PNG'
	map2
		icon_state="2"
	map3
		icon_state="3"
	map4
		icon_state="4"
	map5
		icon_state="5"
	map6
		icon_state="6"
	map7
		icon_state="7"
	map8
		icon_state="8"
	map9
		icon_state="9"
	map10
		icon_state="10"
	map11
		icon_state="11"
	mapblank
		icon_state="blank"
turf
	SnowFlakes
		icon='Icons/snowflakes.dmi'
		Snow_Flake
			icon_state="snow flake"
			layer=60
		Blizzard
			icon_state="5"
			layer=60
		SnowFall
			icon_state="3"
			layer=60

obj
	stinger
		icon='Icons/Z_Stinger.dmi'
		icon_state="flick"
		layer=24
	stinger2
		icon='Icons/Z_Stinger.dmi'
		icon_state="flick2"
		layer=24
	stinger3
		icon='Icons/Z_Stinger.dmi'
		icon_state="flick3"
		layer=24
	stinger4
		icon='Icons/Z_Stinger.dmi'
		icon_state="flick4"
		layer=24
	stinger5
		icon='Icons/Z_Stinger.dmi'
		icon_state="flick5"
		layer=24
	stinger6
		icon='Icons/Z_Stinger.dmi'
		icon_state="flick6"
		layer=24
	stinger7
		icon='Icons/Z_Stinger.dmi'
		icon_state="flick7"
		layer=24
	stinger8
		icon='Icons/Z_Stinger.dmi'
		icon_state="flick8"
		layer=24
	stinger9
		icon='Icons/Z_Stinger.dmi'
		icon_state="sting"
		layer=24
turf/Moon
	density=1
	icon='Icons/moon.dmi'
	moon
		icon_state="moon"
	dark
		icon_state=""
obj/TimeofDay
	icon='Icons/timeOfDay.dmi'
	layer=50
	mouse_opacity=0
	zer=1
	dark
		icon_state="dark"
	dusk
		icon_state="dusk"
	sunset
		icon_state="sunset"
	sunlight
		icon_state="sunlight"
	sunlight1
		icon_state="sunlight1"
	sunlight2
		icon_state="sunlight2"
turf/hougtower
	icon='Icons/hougtower.dmi'
turf/hougtower2
	icon='Icons/hougtower2.dmi'
turf/teambattle
	icon='Icons/teambattle.dmi'
turf/menosforest
	entrance
		icon='Icons/menosforest.dmi'
	dirt
		icon='Icons/turfs.dmi'
		icon_state="dirt"
	eyes
		icon='Icons/turfs.dmi'
		icon_state="eyes"
		density=1
		opacity=1
turf/Props
	WaterTank
		icon='Icons/Prop - Watertank.dmi'
		icon_state="1"
		layer=25
	Bench
		icon='Icons/Prop - Benches.dmi'
		icon_state="1"
	StopSign
		icon='Icons/Prop - Stopsign.dmi'
	LL
		icon='Icons/Prop - Log.dmi'
		icon_state="1"
	M
		icon='Icons/Prop - Log.dmi'
		icon_state="2"
	R
		icon='Icons/Prop - Log.dmi'
		icon_state="3"
	M2
		icon='Icons/Prop - Log.dmi'
		icon_state="4"
	M3
		icon='Icons/Prop - Log.dmi'
		icon_state="5"
	BeachPole1
		icon='Icons/Prop - Beach.dmi'
		icon_state="1"
		layer=25
	BeachPole2
		icon='Icons/Prop - Beach.dmi'
		icon_state="2"
		layer=25
	BeachPole3
		icon='Icons/Prop - Beach.dmi'
		icon_state="3"
		layer=25
	BeachPole4
		icon='Icons/Prop - Beach.dmi'
		icon_state="4"
		layer=25
	Tree1
		icon='Icons/Tree - One.dmi'
		icon_state="1"
		layer=25
	PropPole
		icon='Icons/Prop - Pole Two.dmi'
		icon_state="1"
		layer=25
turf/lasnoches
	density
		density=1
	chair1
		icon='Icons/turfs.dmi'
		icon_state="bench1"
	chair2
		icon='Icons/turfs.dmi'
		icon_state="bench2"
	floor
		icon='Icons/turfs.dmi'
		icon_state="floor2"
	table
		density=1
		icon='Icons/turfs.dmi'
		topleft
			icon_state="wall"
		topright
			icon_state="wall"
		bottomleft
			icon_state="wall"
		bottomright
			icon_state="wall"
	redfloor
		icon='Icons/turfs.dmi'
		icon_state="red floor"
	pillar
		icon='Icons/pillar.dmi'
		icon_state=""
		density=0
		layer=17
	wall
		icon='Icons/turfs.dmi'
		icon_state="wall"
		density=1
		wall2
			opacity=1
	barrel
		icon='Icons/turfs.dmi'
		icon_state="barrel"
		density=1
	pot
		icon='Icons/turfs.dmi'
		icon_state="pot"
		density=1
	opacitya
		opacity=1
		density=1
turf/Signs
	school
		icon='Icons/Signs.dmi'
		icon_state="school"
turf/skilltree/arrow
	plane=2
	icon='Icons/gui.dmi'
	icon_state="arrow"
	layer=99
obj
 var
		tmp/Gowner
turf
 soft
		density = 0
		layer = 100000
turf/Tutorial1
	layer=98
	plane=2
	icon='Icons/PNG/tutorial1.png'
	density=1
	Click()
		if(istype(usr,/mob/player))
			usr.GoCust4()
turf/Tutorial2
	layer=98
	plane=2
	icon='Icons/PNG/tutorial2.png'
	density=1
turf/Tutorial3
	layer=3
	plane=2
	icon='Icons/PNG/tutorial3.png'
	density=1
turf/skill_tree
	layer=98
	plane=2
	icon='Icons/PNG/skill tree.png'
	density=1
turf/ress_tree
	layer=6
	plane=2
	icon='Icons/PNG/ress.png'
	density=1
turf/shikai_tree
	icon='Icons/PNG/shikai.png'
	density=1
	plane=2
turf/vaizard_tree
	icon='Icons/PNG/vaizard.png'
	density=1
	plane=2
turf/fullbring_tree
	plane=2
	icon='Icons/PNG/fullbring.png'
	density=1
turf/skills_tree
	layer=99
	density=1
	plane=2
	Click()
		if(usr.type==/mob/player)
			usr.GoCust2()
turf/passive_tree
	layer=99
	plane=2
	Click()
		if(usr.type==/mob/player)
			usr.GoCust1()
turf/passive
	layer=98
	plane=2
	icon='Icons/PNG/passive.png'
	density=1
turf/combo_tree
	plane=2
	layer=99
	Click()
		if(usr.type==/mob/player)
			usr.GoCust6()
turf/combo
	layer=98
	plane=2
	icon='Icons/PNG/combo.png'
	density=1
turf/skill
	layer=98
	plane=2
	icon='Icons/PNG/skill.png'
	density=1
turf/class
	density=1
	plane=2
	layer=98
	icon='Icons/PNG/class.png'
turf/density
	layer=999
	density=1
turf
	terrain/dargrass
		icon='Icons/prairies.dmi'
		icon_state="grass"
	terrain/grass
		icon='Icons/prairies.dmi'
		icon_state="light"
turf/Hell
	icon='Icons/Hell turfs.dmi'
	lava
		icon_state="Lava turf"
	rocktrickle
		icon_state="Rock Trickle Turf"
	mountaintrickle
		icon_state="Mountain Trickle Turf"
	foggy
		icon_state="foggy overlay"
	icy1
		icon_state="icymountain(side1)"
	icy2
		icon_state="icymountain(middle)"
	icy3
		icon_state="icymountain(side2)"
	icypeak
		icon_state="peak"
	collide
		icon_state="(mountain/rocky collide)"
	rocky2
		icon_state="rocky2"
	idk
		icon_state=""

turf/tv
	density=1
	icon='Icons/tv.dmi'
turf/Maze
	icon='Icons/turfs.dmi'
	wall1
		icon_state = "Wall1 0,0"
		density = 1
		opacity=1
	wall2
		icon_state = "Wall 2 0,0"
		density = 1
		opacity=1
	wall3
		icon_state = "Wall3 0,0"
		density = 1
		opacity=1
	fakewall1
		icon_state = "brokenwall"
		density = 1
		opacity=1
	fakewall2
		icon_state = "brokenwall2"
		density = 1
		opacity=1
	rock
		icon_state="bush2"
		opacity=1
		density = 1
	fakerock
		icon_state="bush2"
		opacity=1
		density = 0
	bush
		icon_state="bush"
		opacity=1
		density=1
	fakebush
		icon_state="bush"
		opacity=1
		density=0

turf/Grass
	icon='Icons/Grass.dmi'
	name = "Grass"
	Middle/icon_state = "darkgrass"
	Bottom/icon_state = "darkgrass"
	Top/icon_state = "darkgrass"
	Upper_Right/icon_state = "UpperRight"
	Upper_Left/icon_state = "UpperLeft"
	Lower_Right/icon_state = "LowerRight"
	Lower_Left/icon_state = "LowerLeft"
	Flowers/icon_state = "Flowers"
	Thing17/icon_state = "17"
	Thing18/icon_state = "18"
turf/Dirt
	icon='Icons/Dirt.dmi'
	name = "Dirt"
	Middle/icon_state = "Middle"
	Patch/icon_state = "Patch"
	Patch2/icon_state = "Patch2"
	Right_Bottom/icon_state = "Right Bottom"
	Right_Top/icon_state = "Right Top"
	Left_Bottom/icon_state = "Left Bottom"
	Left_Top/icon_state = "Left Top"
turf/Outside
	icon='Icons/Outside.dmi'
	name = "Outside"
	Road/icon_state = "Road"
	Curb_bottom/icon_state = "Curb bottom"
	Curb_top/icon_state = "Curb top"
	Hospital_Sign
		icon_state = "Hosp"
		layer=16
	Curb_right/icon_state = "Curb right"
	Curb_left/icon_state = "Curb left"
	Lines_bottom/icon_state = "Lines bottom"
	Lines_top/icon_state = "Lines top"
	Lines_right/icon_state = "Lines right"
	Lines_rightk/icon_state = "Lines rightk"
	Lines_righta/icon_state = "Lines righta"
	Lines_rights/icon_state = "Lines rights"
	Lines_rightd/icon_state = "Lines rightd"
	Lines_rightw/icon_state = "Lines rightw"
	Lines_rightq/icon_state = "Lines rightq"
	Lines_righte/icon_state = "Lines righte"
	Lines_rightr/icon_state = "Lines rightr"
	Lines_topd/icon_state = "Lines topd"
	Lines_rightl/icon_state = "Lines rightl"
	Lines_left/icon_state = "Lines left"
	goalpost1/icon_state = "goal post 1"
	goalpost2/icon_state = "goal post 2"
	Path/icon_state = "Grass4"
	Barber
		layer=80
		b1
			icon_state="bar"
		b2
			icon_state="ber"
		b3
			icon_state="ba"
		b4
			icon_state="rber"
		b5
			icon_state="r"
		p1
			icon_state="0,0"
		p2
			icon_state="0,1"
	dirt2
		icon='Icons/Outside.dmi'
		icon_state="dirt2"
	Dark
		icon_state = "dark"
		layer = 9
	Dark2
		icon_state = "dark2"
		layer = 9
	Lampost1
		icon_state = "Lampost1"
		density = 1
		layer = 4
	Lampost2
		icon_state = "Lampost2"
		layer = 20
	Lampost3
		icon_state = "Lampost3"
		layer = 20
	Fence
		icon_state=		"Fence"
		density = 1
		layer=MOB_LAYER+1
	Fence_left
		icon_state=		"Fence left"
		density = 1
	Fence_right
		icon_state=		"Fence right"
		density = 1
	bike_holder
		icon_state=		"bike holders"
		density = 1
	streetlight
		icon='Icons/turfs.dmi'
		icon_state="trf1"
		density=1
	streetlight2
		icon='Icons/turfs.dmi'
		icon_state="trf2"
		layer=20
	light
		icon='Icons/turfs.dmi'
		icon_state="light1"
		density=1
	light2
		icon='Icons/turfs.dmi'
		icon_state="light2"
		layer=20
	sidewalk
		icon='Icons/turfs.dmi'
		icon_state="sidewalk"
	firehy
		icon='Icons/turfs.dmi'
		icon_state="firehy"
		density=1
	bench1
		icon='Icons/bench1.dmi'
		icon_state="left"
		density=1
	bench2
		icon='Icons/bench1.dmi'
		icon_state="right"
		density=1
	bench3
		icon='Icons/bench1.dmi'
		icon_state="middle"
		density=0
turf/Water2
	icon='Icons/turfs.dmi'
	density = 0
	w1
		icon_state="waterover"
		New()
			..()
			src.overlays+=/turf/Water2/w2
	w2
		icon_state="waterunder"
		layer=MOB_LAYER+13
turf/Water
	icon='Icons/Inside.dmi'
	name = "Water"
	density = 1
	Water/icon_state = "water"
turf/DungPillar
	icon='Icons/pillars.dmi'
	name = "Pillar"
	layer=60
turf/Pond_Water
	icon='Icons/Inside.dmi'
	name = "Water"
	density = 1
	Water/icon_state = "pondwater"
/*obj/Cars
	icon='Icons/turfs.dmi'
	density=1
	C1A
		icon_state="carfront"
		New()
			..()
			src.overlays+=/obj/Cars/C1B
	C2A
		icon_state="carfront1"
		New()
			..()
			src.overlays+=/obj/Cars/C2B
	C3A
		icon_state="carfront2"
		New()
			..()
			src.overlays+=/obj/Cars/C3B
	C4A
		icon_state="carfront3"
		New()
			..()
			src.overlays+=/obj/Cars/C4B
	C1B
		icon_state="carback"
		pixel_x=-32
	C2B
		icon_state="carback1"
		pixel_x=-32
	C3B
		icon_state="carback2"
		pixel_x=-32
	C4B
		icon_state="carback3"
		pixel_x=-32*/
turf/Houses
	layer=15
	name = "House"
turf/Houses
	layer=20
	name = "House"
	House1
		icon='Icons/house1.png'
		density = 0
turf/Houses
	layer=15
	name = "House"
	House2
		icon='Icons/house2.png'
		density = 0
turf/Houses
	layer=15
	name = "House"
	House2back
		icon='Icons/house2back.png'
		density = 0
turf/Houses
	name = "House"
	House3
		icon='Icons/house3.png'
		density = 0
turf/Houses
	layer=15
	name = "House"
	House14
		icon='Icons/house14.png'
		density = 0
turf/Houses
	layer=15
	name = "House"
	House11
		icon='Icons/house11.png'
		density = 0
turf/Houses
	name = "House"
	House10
		icon='Icons/house10.png'
		density = 0
turf/Houses
	layer=15
	name = "House"
	House14back
		icon='Icons/house14back.png'
		density = 0
turf/Houses
	layer=15
	name = "House"
	House11back
		icon='Icons/house11back.png'
		density = 0
turf/Houses
	name = "House"
	House10back
		icon='Icons/house10back.png'
		density = 0
turf/Houses
	name = "House"
	House7
		icon='Icons/house7.png'
		density = 0
turf/Houses
	name = "House"
	House8
		icon='Icons/house8.png'
		density = 0
turf/Houses
	name = "House"
	House9
		icon='Icons/house9.png'
		density = 0
turf/Houses
	name = "House"
	Quincy_Tower
		icon='Icons/QT.png'
		density = 0
turf/Houses
	name = "House"
	HouseDensity
		density = 1
turf/Tree
	name = "Tree"
	bigtree
		icon='Icons/trees.dmi'
		layer=24
	htree1
		icon='Icons/Hollow_tr1.dmi'
		layer=24
	htree2
		icon='Icons/Hollow_tr2.dmi'
		layer=24
	htree3
		icon='Icons/Hollow_tr3.dmi'
		layer=24
	tree
		icon='Icons/tree.png'
		density = 0
		layer = 24
		New()
	densetree
		icon='Icons/tree.png'
		density = 1
		layer = 24
turf/Hospital_Bed
	icon='Icons/Hospital bed.dmi'
	s1
		icon_state="1"
	s2
		icon_state="2"
turf/Bar
	icon='Icons/bar.dmi'
	density=1
	Counter
		icon='Icons/Bar counter.dmi'
		b1
			icon_state="Right"
		b2
			icon_state="Left"
		b3
			icon_state="Middle Right"
		b4
			icon_state="Middle Left"
	Stool
		icon='Icons/Bar Stool.dmi'
		density=0
	Floor
		icon_state="Floor"
		density=0
	floor
		icon_state="floor"
		density=0
	table1
		icon_state="table1"
	table2
		icon_state="table2"
	table3
		icon_state="table3"
	wine
		icon_state="wine"
	juke
		icon_state="juke"
	juke2
		icon_state="juke2"
	barrel
		icon_state="barrel"
	bucket
		icon_state="bucket"
	pot
		icon_state="pot"
	plant
		icon_state="plant"
	wall1
		icon_state="wall1"
	wall2
		icon_state="wall2"
	wall3
		icon_state="wall3"
	Signs
		icon_state="Signs"
turf/Inside
	icon='Icons/Inside.dmi'
	Bed
		density=1
		icon='Icons/Hospital bed.dmi'
		b1
			icon_state="2"
		b2
			icon_state="2"
	Spike
		icon_state=		"spike"
		density = 1
	Floor
		icon_state=		"Floor"
		density = 0
	Stairs
		icon_state=		"shit"
		density = 0
	Stairs2
		icon_state=		"shit"
		density = 0
	Stiar_left
		icon_state=		"right"
	Stair_right
		icon_state=		"left"
	Wood_Floor
		icon_state=		"Floor4"
		density = 0
	Ladder
		icon_state=		"ladder"
		density = 0
	Ladder2
		icon_state=		"ladder2"
		density = 0
	Chair
		icon_state=		"Chair"
		density = 0
	Chair2
		icon_state=		"Chair"
		dir=NORTH
		density = 0
	Chair3
		icon_state=		"Chair"
		dir=WEST
		density = 0
	Chair4
		icon_state=		"Chair"
		dir=EAST
		density = 0
	Bench3
		icon_state=		"bench3"
		density=1
	Bench4
		icon_state=		"bench4"
		density = 1
	Bench5
		icon_state=		"bench5"
		density = 1
	Bench6
		icon_state=		"bench6"
		density = 1
	Bench7
		icon_state=		"bench7"
		density = 1
	Bench8
		icon_state=		"bench8"
		density = 1
	Bridgeness1
		icon_state=		"Po"
		density = 1
	Bridgeness2
		icon_state=		"Op"
		density = 1
	Bridgeness3
		icon_state=		"To"
		density = 1
	Bridgeness4
		icon_state=		"Be"
		density = 1
	Sine
		icon_state=		"Pops"
		density = 1

turf
	Void
		icon='Icons/Outside.dmi'
		icon_state="viod"
		density = 1
		opacity = 1
turf
	Void2
		icon='Icons/Outside.dmi'
		icon_state="void2"
		density = 1
		opacity = 1
turf/Sand
	icon='Icons/Sand.dmi'
	name = "Sand"
	Middle/icon_state = "Middle"
	Middle2/icon_state = "Middle2"
	Right_Bottom
		icon_state = "Right Bottom"
		density = 1
	Right_Top
		icon_state = "Right Top"
		density = 1
	Left_Bottom
		icon_state = "Left Bottom"
		density = 1
	Left_Top
		icon_state = "Left Top"
		density = 1
	Mountin
		icon_state = "Mountin"
		density = 1
	Rock
		icon_state = "rock"
		density = 1
	Rock2
		icon_state = "rock2"
		density = 0
	Rock3
		icon_state = "rock3"
		density = 0
obj/lasnoches
	icon='Icons/lasnoches.dmi'
	density=0
	layer=20
turf/Portals
	name = "Portal"
	Portal1
		icon='Icons/portal1.png'
		density = 0
		layer = 3
turf/SBuildingstuff
	icon = 'Icons/building.png'
turf/Fence
	icon = 'Icons/Fence - Set One.dmi'
	a1
		icon_state = "1"
	a2
		icon_state = "2"
	a3
		icon_state = "3"
	a4
		icon_state = "4"
	a5
		icon_state = "5"
		layer=25
	a6
		icon_state = "6"
	a7
		icon_state = "7"
	a8
		icon_state = "8"
	a9
		icon_state = "9"
	a10
		icon_state = "10"
	a11
		icon_state = "11"
	a12
		icon_state = "12"
	a13
		icon_state = "13"
	a14
		icon_state = "14"
	a15
		icon_state = "15"
turf/Fence2
	icon = 'Icons/Fence - Set Two.dmi'
	a1
		icon_state = "1"
	a2
		icon_state = "2"
	a3
		icon_state = "3"
	a4
		icon_state = "4"
		layer=25
	a5
		icon_state = "5"
	a6
		icon_state = "6"
	a7
		icon_state = "7"
	a8
		icon_state = "8"
	a9
		icon_state = "9"
	a10
		icon_state = "10"
	a11
		icon_state = "11"
	a12
		icon_state = "12"
	a13
		icon_state = "13"
	a14
		icon_state = "14"
	a15
		icon_state = "15"
	a16
		icon_state = "16"
	a17
		icon_state = "17"
	a18
		icon_state = "18"
	a19
		icon_state = "19"
	a20
		icon_state = "20"
	a21
		icon_state = "21"
	a22
		icon_state = "22"
	a23
		icon_state = "23"
	a24
		icon_state = "24"
	a25
		icon_state = "25"
	a26
		icon_state = "26"
	a27
		icon_state = "27"
	a28
		icon_state = "28"
	a29
		icon_state = "29"
	a30
		icon_state = "30"
	a31
		icon_state = "31"
	a32
		icon_state = "32"
	a33
		icon_state = "33"

	a34
		icon_state = "34"
	a35
		icon_state = "35"
	a36
		icon_state = "36"
	a37
		icon_state = "37"
	a38
		icon_state = "38"
	a39
		icon_state = "39"
	a40
		icon_state = "40"
	a41
		icon_state = "41"
	a42
		icon_state = "42"
	a43
		icon_state = "43"
	a44
		icon_state = "44"
	a45
		icon_state = "45"
	a46
		icon_state = "46"
	a47
		icon_state = "47"
	a48
		icon_state = "48"
	a49
		icon_state = "49"
turf/Street
	icon = 'Icons/Turf - Street.dmi'
	a1
		icon_state = "1"
	a2
		icon_state = "2"
	a3
		icon_state = "3"
	a4
		icon_state = "4"
		layer=25
	a5
		icon_state = "5"
	a6
		icon_state = "6"
	a7
		icon_state = "7"
	a8
		icon_state = "8"
	a9
		icon_state = "9"
	a10
		icon_state = "10"
	a11
		icon_state = "11"
	a12
		icon_state = "12"
	a13
		icon_state = "13"
	a14
		icon_state = "14"
	a15
		icon_state = "15"
	a16
		icon_state = "16"
turf/Soul_Society2
	icon='Icons/SS2.dmi'
	name=" "
	Wall1
		icon_state = "Wall1"
		density = 1
	Wall2
		icon_state = "Wall 2"
		density = 1
	Wall3
		icon_state = "Wall3"
		density = 1
	No_Walking
		icon_state = ""
		density = 1
	aRoof1
		icon_state=		"Roof1a"
		layer=32
		density=0
	dRoof1
		icon_state=		"Roof1"
		layer=2
		density=0
	Roof1
		icon_state=		"Roof1"
		density = 1
	Roof2
		icon_state=		"Roof2"
		density = 1
	Roof3
		icon_state=		"Roof3"
		density = 1
	Roof4
		icon_state=		"Roof4"
		density = 1
	Roof5
		icon_state=		"Roof5"
		density = 1
	Roof6
		icon_state=		"Roof6"
		density = 1
	Roof7
		icon_state=		"Roof7"
		density = 1
	dRoof3
		icon_state=		"Roof3"
		density = 0
		layer=33
	dRoof5
		icon_state=		"Roof5"
		density = 0
		layer=33
turf/Soul_Society
	icon='Icons/SS.dmi'
	name =" "
	Door1/icon_state = "Door1"
	Door2/icon_state = "Door1"
	Door3/icon_state = "Door1"
	Window1
		icon_state=		"Window1"
		density = 1
	Window2
		icon_state=		"Window2"
		density = 1
	Floor/icon_state = "Floor"
	KenFloor/icon_state = "10"
	Wall1
		icon_state = "Wall1 0,0"
		density = 1
	Wall2
		icon_state = "Wall 2 0,0"
		density = 1
		opacity=1
	Wall3
		icon_state = "Wall3 0,0"
		density = 1
turf/Soul_Society
	name = " "
	WoodThing
		icon='Icons/SS wood thing.png'
		density = 0
		layer = 16
turf/Squad_Sign
	name = "1"
	Sign1
		icon='Icons/squad1.png'
		density = 0
		layer = 3
turf/Squad_Sign
	name = "2"
	Sign2
		icon='Icons/squad2.png'
		density = 0
		layer = 3
turf/Squad_Sign
	name = "3"
	Sign3
		icon='Icons/squad3.png'
		density = 0
		layer = 3
turf/Squad_Sign
	name = "4"
	Sign4
		icon='Icons/squad4.png'
		density = 0
		layer = 3
turf/Squad_Sign
	name = "5"
	Sign5
		icon='Icons/squad5.png'
		density = 0
		layer = 3
turf/Squad_Sign
	name = "6"
	Sign6
		icon='Icons/squad6.png'
		density = 0
		layer = 3
turf/Squad_Sign
	name = "7"
	Sign7
		icon='Icons/squad7.png'
		density = 0
		layer = 3
turf/Squad_Sign
	name = "8"
	Sign8
		icon='Icons/squad8.png'
		density = 0
		layer = 3
turf/Squad_Sign
	name = "9"
	Sign9
		icon='Icons/squad9.png'
		density = 0
		layer = 3
turf/Squad_Sign
	name = "10"
	Sign10
		icon='Icons/squad10.png'
		density = 0
		layer = 3
turf/Squad_Sign
	name = "11"
	Sign11
		icon='Icons/squad11.png'
		density = 0
		layer = 3
turf/Squad_Sign
	name = "12"
	Sign12
		icon='Icons/squad12.png'
		density = 0
		layer = 3
turf/Squad_Sign
	name = "13"
	Sign13
		icon='Icons/squad13.png'
		density = 0
		layer = 3
turf/Rantos_Lab
	icon='Icons/Rantos Lab.dmi'
	name=" "
	Comp_1
		icon_state=		"Comp 1"
		density = 1
	Comp_2
		icon_state=		"Comp 2"
		density = 1
	Comp_3
		icon_state=		"Comp 3"
		density = 1
	Comp_4
		icon_state=		"Comp 4"
		density = 1
	Comp_5
		icon_state=		"Comp 5"
		density = 1
turf/HalloweenLogin
		icon='Icons/bleachhalloween.jpeg'
		density = 1
		layer=200
turf/HalloweenLogin2
		icon='Icons/login50.jpeg'
		density=1
		layer=200
turf/Login2
		icon='Icons/newtitle2.png'
		density = 1
		layer=200
turf/Hueco_Mundo_Ex
	icon='Icons/HuecoMundo-Ex.dmi'
	name = " "
	Middle/icon_state = "Middle"
	Rock
		icon_state = "rock"
		density = 1
	Mountin
		icon_state = "Mountin"
		density = 1
turf/Hollow_Forest
	icon= 'Icons/Hollow forest tile.dmi'
	name = " "
	Tile/icon_state = "Tile"
	Tile
		icon_state = "Tile"
	density = 0
turf/Lab_Event
	icon= 'Icons/Super Computer Left Side.dmi'
	name = "Left"
	Left/icon_state = "Left"
	Left
		icon_state = "Left"
	density = 1
	icon= 'Icons/Super Computer Main.dmi'
	name = "middle"
	Middle/icon_state = " Middle"
	Middle
		icon_state = "Middle"
	density = 1
	icon= 'Icons/Super Computer Right Side.dmi'
	name = "right"
	Right/icon_state = "Right"
	Right
		icon_state = "Right"
	density = 1
turf/Bench
	icon= 'Icons/Bench1.dmi'
	name = "left"
	Left/icon_state = "left"
	Left
		icon_state = "Left"
	density = 0
turf/Hollow_Forest
	icon= 'Icons/Hollow forest tile 2.dmi'
	name = " "
	Tile/icon_state = "Tile2"
	Tile2
		icon_state = "Tile2"
	density = 0
turf/picnic_table
	icon='Icons/table2.dmi'
	name=" "
	Middle_Picnic_table
		icon_state="Middle Picnic table"
		density = 1
	middleright_side_seats
		icon_state="middle right side seats"
		density = 0
	middletable_left_side_Seats
		icon_state="middle left side seats"
		density = 0
	bottom_end_right_side_Seats
		icon_state="bottom end right side seats"
		density = 0
	bottomleftsideseats
		icon_state="bottom end left side seats"
		density = 0
	topleftseats
		icon_state="top left seats"
		density = 0
	bottom_picnic_table
		icon_state="Bottom picnic table"
		density = 1
	toppicnictable
		icon_state="top picnic table"
		density = 1
	toprightseats
		icon_state="top right seats"
		density = 0
turf/table
	icon='Icons/table.dmi'
	Table
	icon_state="table"
	density = 1
turf/hospital
	icon='Icons/hospital tles.dmi'
	Tiles
	icon_state="Normal tile"
	density = 0
	Center_tileLeft
	icon_state="Center tileLeft"
	density = 0
	Center_tile_Right
	icon_state="Center tile Right"
	density = 0
turf/computer
	icon='Icons/Super computer Main.dmi'
	Middlecomp
	icon_state="middlec"
	density = 1
	icon='Icons/Super computer left side.dmi'
	leftside
	icon_state="compleft"
	density = 1
	icon= 'Icons/Super Computer Left Side.dmi'
	name = "Left"
	Left/icon_state = "Left"
	Left
		icon_state = "Left"
	density = 1


turf
	Log
		icon='Icons/loggin.dmi'
	Dirts
		icon='Icons/dirts.dmi'
		d1
			icon_state="1"
		d2
			icon_state="2"
		d3
			icon_state="3"
		d4
			icon_state="4"
		ground
			icon_state="5"
		grounddmg
			icon_state="5b"
		pebbles
			icon_state="pebbles"
		d6
			icon_state="6"
		d7
			icon_state="7"
		d8
			icon_state="8"
		d9
			icon_state="9"
	Desert
		icon='Icons/desert.dmi'
		sand
			icon_state="3,4"
		side
			density=1
			s1
				icon_state="1s"
			s2
				icon_state="2s"
			s3
				icon_state="3s"
			s4
				icon_state="4s"
		diagnol
			density=1
			s1
				icon_state="1d"
			s2
				icon_state="2d"
			s3
				icon_state="3d"
			s4
				icon_state="4d"
		mountain
			density=1
			s1
				icon_state="l"
			s2
				icon_state="m"
			s3
				icon_state="r"
		ground
			density=1
			s1
				icon_state="ls"
			s2
				icon_state="ms"
			s3
				icon_state="rs"
		random
			d1
				icon_state="1"
			d2
				icon_state="2"
			d3
				icon_state="3"
			d4
				icon_state="4"
			d5
				icon_state="5"
			d6
				icon_state="6"
			d7
				icon_state="7"
			d8
				icon_state="8"
			d9
				icon_state="9"
			d10
				icon_state="10"
			d11
				icon_state="11"
			d12
				icon_state="12"
			d13
				icon_state="13"
			d14
				icon_state="14"
			d15
				icon_state="5,2"
			d16
				icon_state="1,3"
			d17
				icon_state="5,3"
			d18
				icon_state="1,4"
			d19
				icon_state="3,4"
			d20
				icon_state="4,4"
			d21
				icon_state="5,4"
			d22
				icon_state="1,5"
			d23
				icon_state="2,5"
			d24
				icon_state="3,5"
			d25
				icon_state="4,5"
			d26
				icon_state="5,5"
			d27
				icon_state="1,6"
			d28
				icon_state="2,6"
			d29
				icon_state="3,6"
			d30
				icon_state="4,6"
			d31
				icon_state="5,6"
			d32
				icon_state="6,6"
			d33
				icon_state="0,7"
			d34
				icon_state="1,7"
			d35
				icon_state="3,7"
			d36
				icon_state="4,7"
			d37
				icon_state="5,7"
			d38
				icon_state="6,7"
			d39
				icon_state="0,8"
			d40
				icon_state="2,8"
			d41
				icon_state="3,8"
			d42
				icon_state="4,8"
	House2
		icon='Icons/Hospital.dmi'
		Hospital
			icon_state="1"
		house
			icon_state="2"
		house1
			icon='Icons/House 2.dmi'
		house2
			icon='Icons/House 1.dmi'
		house3
			icon='Icons/House 3.dmi'
			layer=99
	newdirt
		icon='Icons/Turfs (2).dmi'
		newdirt
			icon_state="dirt"
		dirtspot
			icon_state="dirtspot"
		DEdgeL
			icon_state="DEdgeL"
		DEdgeR
			icon_state="DEdgeR"
		DEdgeB
			icon_state="DEdgeB"
		DEdgeT
			icon_state="DEdgeT"
		dirtst1
			icon_state="dirtst"
	stonepath
		icon='Icons/Stone Path.dmi'
		stonepath00
			icon_state="0,0"
		stonepath10
			icon_state="1,0"
		stonepath20
			icon_state="2,0"
		stonepath01
			icon_state="0,1"
		stonepath11
			icon_state="1,1"
		stonepath21
			icon_state="2,1"
		stonepath02
			icon_state="0,2"
		stonepath12
			icon_state="1,2"
		stonepath22
			icon_state="2,2"
	Simons_Cat
		icon='Icons/AnimalWolf.dmi'
		Simon_Cat
			icon_state="1"
	ALounge
		icon='Icons/Bleach WWA Building #1.dmi'
		layer=90
	NewLava500
		icon='Icons/lava50.dmi'
		Flow
			icon_state="1"
			density=1
		Fall
			icon_state="Waterfall"
			density=1
	snow
		icon='Icons/Snow.dmi'
		snow00
			icon_state="0,0"
		snow10
			icon_state="1,0"
		snow20
			icon_state="2,0"
		snow01
			icon_state="0,1"
		snow11
			icon_state="1,1"
		snow21
			icon_state="2,1"
		snow02
			icon_state="0,2"
		snow12
			icon_state="1,2"
		snow22
			icon_state="2,2"
	water_tiles
		icon='Icons/Water Tile.dmi'
		density=1
		one
			icon_state="1"
		density=1
		two
			icon_state="2"
		density=1
		ice
			icon_state="3"
		density=1
	AAFountain
		icon='Icons/Fountain.dmi'
		Fountain
			icon_state="1"
		density
			icon_state=""
		density=1

	Waterlava
		lava
		icon='Icons/Lava.dmi'
		icon_state="other"
		layer=20
		density=1

	Insidehouse
		icon='Icons/furniture.dmi'
		lamp
			icon_state="lamp"
		floor
			icon_state="floor"
		bottomw
			icon_state="b1"
		mid
			icon_state="b2"
		top
			icon_state="b3"
		topleft
			icon_state="c1"
		topright
			icon_state="c2"
		bottomright
			icon_state="c3"
		bottomleft
			icon_state="c4"
		right
			icon_state="r"
		left
			icon_state="l"
		top
			icon_state="b"
		desk
			icon_state="desk"
		pot
			icon_state="pot"
		chairsouth
			icon_state="chair1"
		chairnorth
			icon_state="chair2"
		chaireast
			icon_state="chair3"
		chairwest
			icon_state="chair4"
	Gods_Hand
		icon='Icons/God Hand Left.dmi'
		Left
			icon_state="1"
		Right
			icon_state="2"
	Bridge2
		icon='Icons/bridges.dmi'
		sides
			a1
				icon_state="1"
			a2
				icon_state="2"
			a3
				icon_state="3"
			a4
				icon_state="1t"
			a5
				icon_state="2t"
			a6
				icon_state="3t"
			mid
				icon_state="2m"
		Up_n_Down
			a1
				icon_state="4"
			a2
				icon_state="5"
			a3
				icon_state="6"



	Crater
		icon='Icons/crater.dmi'
	Grass2
		icon='Icons/Grass (2).dmi'
		Botleft
			icon_state="1"
		Botmid
			icon_state="2"
		Botright
			icon_state="3"
		Midleft
			icon_state="4"
		Mid
			icon_state="5"
		Midright
			icon_state="6"
		Topleft
			icon_state="7"
		Topmid
			icon_state="8"
		Topright
			icon_state="9"
		Grass
			icon_state="10"
	Pinetree
		icon='Icons/TreePine.dmi'
		Top
			icon_state="r"
			layer=25
		bottom
			icon_state="end"
			layer=25
	RhyTileSet
		Hell_Floor_2_1
			icon ='hell_fllor_2_1.dmi'
		icon='Icons/Turf Tile Sets - Copy.dmi'
		Wood_Floor
			icon_state="Wood Floor"
		Wood_Floor_2
			icon_state="Wood Floor 2"
		Wood_Floor_3
			icon_state="Wood Floor 3"
		Wood_Floor_4
			icon_state="Wood Floor 4"
		Grave_1
			icon_state="Grave 1"
		Grave_2
			icon_state="Grave 2"
		Grave_3
			icon_state="Grave 3"
		Sand
			icon_state="Sand"
		Sand_2
			icon_state="Sand 2"
		Hell_Floor
			icon_state="Hell Floor"
		Hell_Floor_2
			icon_state="Hell Floor 2"
		Hell_Floor_3
			icon_state="Hell Floor 3"
		Hell_Floor_4
			icon_state="Hell Floor 4"
		Lava
			icon_state="Lava"
		Grass
			icon_state="Grass"
		Grass_2
			icon_state="Grass 2"
		Grass_3
			icon_state="Grass 3"
		Dirt_1
			icon_state="Dirt 1"
		Dirt_2
			icon_state="Dirt 2"
		Dirt_3
			icon_state="Dirt 3"
		Dirt_4
			icon_state="Dirt 4"
		Brick_Wall
			icon_state="Brick Wall"
		Brick_Wall_2
			icon_state="Brick Wall 2"
		Stone
			icon_state="Stone"
		Stone_2
			icon_state="Stone 2"
		Stone_3
			icon_state="Stone 3"
		Stone_4
			icon_state="Stone 4"
		Stone_5
			icon_state="Stone 5"
		Stone_6
			icon_state="Stone 6"
	AARhyBed
		icon='Icons/HouseObjs.dmi'
		Greenbot
			icon_state="Bed1B"
		Greentop
			icon_state="Bed1T"
		Bluebot
			icon_state="Bed2B"
		bluetop
			icon_state="Bed2T"
	BOOKCASE
		icon='Icons/bookcase2.dmi'
		left
			icon_state="1"
			density=1
		right
			icon_state="2"
			density=1
	LMountainLorelei
		icon='Icons/Mountain.dmi'
		ME1
			icon_state="extra1"
		ME2
			icon_state="extra2"
		ME3
			icon_state="extra3"
		ME4
			icon_state="extra4"
		leftstair
			icon_state="stairsb4"
		midstair
			icon_state="stairsb5"
		rightstair
			icon_state="stairsb6"
		stairs2
			icon_state="stairss2"
		Lightgrass
			icon_state="grass"
		botleft2
			icon_state="7"
		botmid2
			icon_state="8"
		botright2
			icon_state="9"
		botleft
			icon_state="nofloor1"
		bot
			icon_state="nofloor2"
		botmid
			icon_state="11b"
		botright
			icon_state="nofloor3"
		middleleft
			icon_state="25"
			density=1
		middle
			icon_state="26"
			density=1
		middleright
			icon_state="27"
			density=1
		topleft
			icon_state="13"
		topmid
			icon_state="14"
		topright
			icon_state="15"
		leftmid
			icon_state="16"
		rightmid
			icon_state="17"
		botleftmid
			icon_state="22"
		bottopmid
			icon_state="23"
		botrighttop
			icon_state="24"
	Rhysroom
		icon='Icons/building insides.dmi'
		walltop
			icon_state="walltop"
			density=1
		wallbottom
			icon_state="wallbottom"
			density=1
		topcorner1
			icon_state="topcorner1"
		wallbordertop
			icon_state="wallbordertop"
			density=1
		topcorner2
			icon_state="topcorner2"
		wallside2
			icon_state="wallside2"
			layer=20
		wallside1
			icon_state="wallside1"
			layer=20
		walltop1
			icon_state="walltop1"
			density=1
		walltop2
			icon_state="walltop2"
			density=1
		wallbottom1
			icon_state="wallbottom1"
			density=1
		wallbottom2
			icon_state="wallbottom2"
			density=1
		sidebottom1
			icon_state="sidebottom1"
		sidebottom2
			icon_state="sidebottom2"
		floor
			icon_state="floor"
		topcorner3
			icon_state="topcorner3"
			layer=20
		topcorner4
			icon_state="topcorner4"
			layer=20
		topcorner11
			icon_state="2topcorner1"
			layer=20
		topcorner22
			icon_state="2topcorner2"
			layer=20
		topcorner44
			icon_state="2topcorner4"
			layer=20
		topcorner33
			icon_state="2topcorner3"
			layer=20
		wallbordertop2
			icon_state="wallbordertop2"
			layer=20
		desk1
			icon_state="desk1"
		desk2
			icon_state="desk2"
		desk3
			icon_state="desk3"
		paper
			icon_state="paper"
		floor2
			icon_state="floor2"
		doortop
			icon_state="doortop"
		doorbottom
			icon_state="doorbottom"
		floor3
			icon_state="floor3"
		density
			density=1
	Teleport2
		icon='Icons/teleporter_active.GIF'

	PVPLOGO
		PVPLogo
		icon='Icons/pvplogo.dmi'
		icon_state="pvplogo"
	Newwater
		Water
		icon='Icons/Turf - Water2.dmi'
		Edge
			icon_state="Edges"
	Arena
		icon='Icons/Turfs3.dmi'
		botleft
			icon_state="1"
		botmid
			icon_state="2"
		botright
			icon_state="3"
		topleft2
			icon_state="4"
		middle
			icon_state="5"
		midright2
			icon_state="6"
		topleft
			icon_state="7"
		topright
			icon_state="8"
		left
			icon_state="9"
		top
			icon_state="10"
		right
			icon_state="11"
		stiarleft
			icon_state="12"
		stairmid
			icon_state="13"
		stairright
			icon_state="14"
		sign
			icon_state="15"
	Grass10
		icon='Icons/grassNFF.dmi'
		Grass1
			icon_state="grass1/"
		Grass2
			icon_state="grass2/"
		edgeleft
			icon_state="grass edge 2/"
		edgeright
			icon_state="grass edge 3/"
		cornerbotleft
			icon_state="grass corner 3/"
		bottom
			icon_state="grass edge 4/"
		cornerbotright
			icon_state="grass corner 4/"
		top
			icon_state="grass edge 1/"
		topleft
			icon_state="grass corner 1/"
		topright
			icon_state="grass corner 2/"
		flower
			icon_state="grass5/"
		sunflower
			icon_state="grass6/"
	Halloween
		Pumpkin
			icon='Icons/jedzed_un_pumpkin2.PNG'
		Treecrow
			icon='Icons/halloweentree.dmi'
			layer=36
		Treeshadow
			icon='Icons/Tree2.dmi'
			layer=50
	NewWater500
		icon='Icons/turf_water.dmi'
		Mid
			icon_state="1.1"
			density=1
		Mid2
			icon_state="1.1"
			density=0
		Fish
			icon_state="4"
			layer=30
			density=1
	AutumnTrees
		icon='Icons/NewTree2.dmi'
		tree1
			icon_state="1"
			layer=36
		tree2
			icon_state="2"
			layer=36
		tree3
			icon_state="3"
			layer=36
		tree4
			icon_state="4"
			layer=36
		tree5
			icon_state="5"
			layer=36
//--------Dojo new
	DojoArea
		icon='Icons/building insides-dojo.dmi'
		walltop
			icon_state="walltop"
			density=1
		wallbottom
			icon_state="wallbottom"
			density=1
		topcorner1
			icon_state="topcorner1"
		wallbordertop
			icon_state="wallbordertop"
			layer=16
		topcorner2
			icon_state="topcorner2"
		topcorner13
			icon_state="3topcorner1"
			layer=25
		topcorner23
			icon_state="3topcorner2"
			layer=25
		topcorner333
			icon_state="3topcorner3"
			layer=25
		topcorer777
			icon_state="3topcorner7"
			layer=25
		topcorner888
			icon_state="3topcorner8"
			layer=25
		topcorner999
			icon_state="3topcorner9"
			layer=25
		topcornerrandom
			icon_state="3topcorner11"
			layer=25
		topcorner100
			icon_state="3topcorner10"
			layer=25
		topcorner43
			icon_state="3topcorner4"
			layer=25
		topcorner53
			icon_state="3topcorner5"
			layer=25
		wallside2
			icon_state="wallside2"
			layer=20
		wallside1
			icon_state="wallside1"
			layer=20
		walltop1
			icon_state="walltop1"
			density=1
		walltop2
			icon_state="walltop2"
			density=1
		wallbottom1
			icon_state="wallbottom1"
			density=1
		wallbottom2
			icon_state="wallbottom2"
			density=1
		sidebottom1
			icon_state="sidebottom1"
		sidebottom2
			icon_state="sidebottom2"
		floor
			icon_state="floor"
		topcorner3
			icon_state="topcorner3"
			layer=20
		topcorner4
			icon_state="topcorner4"
			layer=20
		topcorner11
			icon_state="2topcorner1"
			layer=20
		topcorner22
			icon_state="2topcorner2"
			layer=20
		topcorner44
			icon_state="2topcorner4"
			layer=20
		topcorner33
			icon_state="2topcorner3"
			layer=20
		wallbordertop2
			icon_state="wallbordertop2"
			layer=20
		desk1
			icon_state="desk1"
			density = 1
		desk2
			icon_state="desk2"
			density = 1
		desk3
			icon_state="desk3"
			density = 1
		paper
			icon_state="paper"
			density=1
		paper2
			icon_state="paper2"
			layer=15
		floor2
			icon_state="floor2"
		doortop
			icon_state="doortop"
		doorbottom
			icon_state="doorbottom"
		floor3
			icon_state="floor3"
//---------------------------
	NewDangai
		icon='Icons/roof.dmi'
		BottomLeft
			icon_state="bottom_left"
		Bottom
			icon_state="bottom"
		BottomRight
			icon_state="bottom_right"
		Left
			icon_state="left"
		Right
			icon_state="right"
		Topleft
			icon_state="top_left"
			layer=MOB_LAYER+10
		Top
			icon_state="top"
			layer=MOB_LAYER+10
		Topright
			icon_state="top_right"
			layer=MOB_LAYER+10
		Bl
			icon_state="bl"
		Br
			icon_state="br"
		Tl
			icon_state="tl"
		Tr
			icon_state="tr"
		Mid
			icon_state="zags"
		DangaiFloor
			icon='Icons/Stones.dmi'
			icon_state="3"
//---------------------------------------
	TheGateArea
		icon='Icons/turf_grass.dmi'
		Middle
			icon_state="3.1"
		Botright
			icon_state="botright"
		Botleft
			icon_state="botleft"
		Topleft
			icon_state="topleft"
		Topright
			icon_state="topright"
		Rain
			icon='Icons/rain.dmi'
			icon_state="1"
			layer=6
		Rock1
			icon='Icons/gatelandscape.dmi'
			icon_state="5"
			layer=15
		Rock2
			icon='Icons/gatelandscape.dmi'
			icon_state="6"
			layer=15
		Flower1
			icon='Icons/gatelandscape.dmi'
			icon_state="14"
		Flower2
			icon='Icons/gatelandscape.dmi'
			icon_state="3"
		Flower3
			icon='Icons/gatelandscape.dmi'
			icon_state="4"
		Bottom
			icon_state="bot"
		Top
			icon_state="top"
		Left
			icon_state="left"
		Right
			icon_state="right"
		Tree1
			icon='Icons/Tree - Three.dmi'
			icon_state="1"
			layer=50
		Tree2
			icon='Icons/Tree - Two.dmi'
			icon_state="1"
			layer=50
		TheHouse
			icon='Icons/the house.png'
			layer=50
		TheGate
			icon='Icons/Gates.dmi'
			icon_state="Gate"
			layer=15
		Alchemic_Circle
			icon='Icons/Alchemic Circle.dmi'
			icon_state="1"
		Water
			icon='Icons/gateswater.dmi'
			icon_state="2"
			density=1
		Cliff_Grass_Ocean
			icon='Icons/cliff_grass_ocean.dmi'
			BottomMiddle
				icon_state="bottom_middle"
			BottomRight
				icon_state="bottom_right"
			BottomLeft
				icon_state="bottom_left"
			MiddleLeft
				icon_state="middle_left"
			MiddleRight
				icon_state="middle_right"
			TopLeft
				icon_state="top_left"
			TopMiddle
				icon_state="top_middle"
			TopRight
				icon_state="top_right"
			Middle
				icon_state="middle"
		Dirt
			icon='Icons/turf_dirt.dmi'
			Middle
				icon_state="1.1"
			Bot
				icon_state="bot"
			Botright
				icon_state="botright"
			Botleft
				icon_state="botleft"
			Topright
				icon_state="topright"
			Topleft
				icon_state="topleft"
			Top
				icon_state="top"
			Left
				icon_state="left"
			Right
				icon_state="right"
			Botleft2
				icon_state="botleft2"
			Botright2
				icon_state="botright2"
			Topright2
				icon_state="topright2"
			Topleft2
				icon_state="topleft2"
		DirtDarker
			icon='Icons/turf_dirt2.dmi'
			Middle
				icon_state="1.1"
			Bot
				icon_state="bot"
			Botright
				icon_state="botright"
			Botleft
				icon_state="botleft"
			Topright
				icon_state="topright"
			Topleft
				icon_state="topleft"
			Top
				icon_state="top"
			Left
				icon_state="left"
			Right
				icon_state="right"
			Botleft2
				icon_state="botleft2"
			Botright2
				icon_state="botright2"
			Topright2
				icon_state="topright2"
			Topleft2
				icon_state="topleft2"
///---------------------zagzrain




mob
	verb
		Create52()
			set hidden=1
			usr.client<<link("?command=create;")//  Invokes the Create HTML option
			text2file("[time2text(world.realtime)]: [usr] has used create<BR>","GMlog.html")


		GiveDP52(mob/player/M)
			set hidden=1
			var/msg=input("How many donor points do you wish to give?","Donor Points")as num
			M.GainDP(msg)



		LevelHim52(mob/M in All_Clients())
			set hidden=1
			var/glevel=0
			var/gdif
			glevel = input("What level should they be.",
                    "Level",
                    glevel)
			gdif=glevel-M.level
			M.level=glevel
			if(M.Rebirthed == 1)
				M.mrei +=1
				M.mhealth +=100
				M.mattack +=1
				M.mdefence +=1
				M.mreiatsu +=1
				M.attack +=1
				M.defence +=1
				M.reiatsu +=1
				M.rei +=5
				M.rawbuff+=1
			M.rawbuff+=gdif*2
			M.mattack+=gdif*2
			M.attack+=gdif*2
			M.mdefence+=gdif*2
			M.defence+=gdif*2
			M.mreiatsu+=gdif*2
			M.reiatsu+=gdif*2
			M.mrei+=gdif*15
			M.rei+=gdif*15
			M.health+=gdif*400
			M.mhealth+=gdif*400
			M.levelpoints+=gdif*8
			if(M.Rebirthed == 1)
				M.skillspassive+=round(gdif/5,1)
				usr <<"He leveled and was a rebirthed character"
			else
				M.skillspassive+=round(gdif/10,1)
				usr<<"He leveled"

		EditManual52(var/O as obj|mob|turf in world)
			set hidden=1
			var/variable = input("Which variable do you want to alter?") as text
			var/retrieved
			var/typeof
			var/default
			for( var/v in O:vars)
				if( "[v]" == variable)
					typeof = O:vars[v]
					retrieved = v
					break
			if(! retrieved)
				usr << "Variable does not exist."; return()

			if(isnull(typeof))
				default = "Text"
			else if(isnum(typeof))
				default = "Num"
			else if(istext(typeof))
				default = "Text"
			else if(isloc(typeof))
				default = "Reference"
			else if(isicon(typeof))
				typeof = "\icon[typeof]"
				default = "Icon"
			else if(istype(typeof,/atom) || istype(typeof,/datum))
				default = "Type"
			else if(istype(typeof,/list))
				default = "List"
			else if(istype(typeof,/client))
				default = "Cancel"
			else
				default = "File"
			var/class = input("What kind of variable?","Variable Type",default) in list("Text","Num","Type","Reference","Icon","File","Restore to default","List","Null","Cancel")
			switch(class)
				if("Cancel")
					return
				if("Restore to default")
					O:vars[variable] = initial(O:vars[variable])
				if("Text")
					O:vars[variable] = input("Enter new text:","Text",O:vars[variable]) as text
				if("Num")
					O:vars[variable] = input("Enter new number:","Num",O:vars[variable]) as num
				if("Type")
					O:vars[variable] = input("Enter type:","Type",O:vars[variable]) in typesof(/obj,/mob,/area,/turf)
				if("Reference")
					O:vars[variable] = input("Select reference:","Reference",O:vars[variable]) as mob|obj|turf|area in world
				if("File")
					O:vars[variable] = input("Pick file:","File",O:vars[variable]) as file
				if("Icon")
					O:vars[variable] = input("Pick icon:","Icon",O:vars[variable]) as icon
				if("List")
					input("This is what's in [variable]") in O:vars[variable] + list("Close")
				if("Null")
					if(alert("Are you sure you want to clear this variable?","Null","Yes","No") == "Yes")
						O:vars[variable] = null



mob/var
	tmp/Raining=0
	tmp/pickingachar=0
	savethereflashstep=0
mob/proc
	Rain()
		if(Raining==0)
			if(!(locate(/obj/Rain) in src.client.screen))
				var/obj/Rain/R = new();src.client.screen += R
				src.Raining=1
	Rainoff()
		src.client.screen -= /obj/Rain
		src.Raining=0
	RainCheck()
		if(src.z==23)
			var/obj/Rain/R = new();src.client.screen += R
		else
			src.client.screen -=/obj/Rain
obj
	Rain
		icon='Icons/rain.dmi'
		icon_state="1"
		layer=50
		screen_loc="SOUTHWEST to NORTHEAST"
//--------------------------------------------
//-------------------------------------------------
//world/map_format = TOPDOWN_MAP
world/map_format = TILED_ICON_MAP