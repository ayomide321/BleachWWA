obj/lightningstun
	icon='Icons/cc leut shikai.dmi'
	layer=75
	New()
		spawn(50)
			src.loc=null
obj/burst
	icon='Icons/crithit.dmi'
	New()
		flick("flick",src)
		spawn(3)
		del src
/obj/finalaura
	layer=16
	icon='Icons/quincyaura.dmi'
	a1
		icon_state="0,0"
		pixel_y=-10
		pixel_x=-10
	a2
		icon_state="1,0"
		pixel_y=-10
		pixel_x=22
	a3
		icon_state="0,1"
		pixel_y=22
		pixel_x=-10
	a4
		icon_state="1,1"
		pixel_y=22
		pixel_x=22
obj/Shoes
	layer=MOB_LAYER+1
	black
		icon='Icons/Bleachshoes.dmi'
	blue
		icon='Icons/Bleachshoesblue.dmi'
	white
		icon='Icons/Bleachshoeswhite.dmi'
obj/Jacket
	layer=MOB_LAYER+5
	pixel_y=3
	black
		icon='Icons/Jacket.dmi'
	blue
		icon='Icons/Jacketblue.dmi'
	white
		icon='Icons/Jacketwhite.dmi'
	red
		icon='Icons/Jacketred.dmi'
	green
		icon='Icons/Jacketgreen.dmi'
obj/Shirt
	layer=MOB_LAYER+1
	black
		icon='Icons/BleachShirt.dmi'
	blue
		icon='Icons/BleachShirtblue.dmi'
	gray
		icon='Icons/BleachShirtgray.dmi'
	green
		icon='Icons/BleachShirtgreen.dmi'
	lgreen
		icon='Icons/BleachShirtlgreen.dmi'
	orange
		icon='Icons/BleachShirtorange.dmi'
	pink
		icon='Icons/BleachShirtpink.dmi'
	purple
		icon='Icons/BleachShirtpurple.dmi'
	red
		icon='Icons/BleachShirtred.dmi'
	teal
		icon='Icons/BleachShirtteal.dmi'
	white
		icon='Icons/BleachShirtwhite.dmi'
	yellow
		icon='Icons/BleachShirtyellow.dmi'


obj/tdm
//	layer=MOB_LAYER+1
	whiteteam
		icon='Icons/tdms.dmi'
		icon_state="1"
		pixel_y = 64
	blackteam
		icon='Icons/tdms.dmi'
		icon_state="2"
		pixel_y = 64

obj/Pants
	layer=MOB_LAYER+1
	black
		icon='Icons/BleachPants.dmi'
	blue
		icon='Icons/BleachPantsblue.dmi'
	gray
		icon='Icons/BleachPantsgray.dmi'
	green
		icon='Icons/BleachPantsgreen.dmi'
	lgreen
		icon='Icons/BleachPantslgreen.dmi'
	orange
		icon='Icons/BleachPantsorange.dmi'
	pink
		icon='Icons/BleachPantspink.dmi'
	purple
		icon='Icons/BleachPantspurple.dmi'
	red
		icon='Icons/BleachPantsred.dmi'
	teal
		icon='Icons/BleachPantsteal.dmi'
	white
		icon='Icons/BleachPantswhite.dmi'
	yellow
		icon='Icons/BleachPantsyellow.dmi'
obj/Vaimask
	layer=MOB_LAYER+2
	v1
		black
			icon='Icons/Vaimask.dmi'
		blue
			icon='Icons/Vaimaskblue.dmi'
		green
			icon='Icons/Vaimaskgreen.dmi'
		lgreen
			icon='Icons/Vaimasklgreen.dmi'
		red
			icon='Icons/Vaimaskred.dmi'
		teal
			icon='Icons/Vaimaskteal.dmi'
		white
			icon='Icons/Vaimaskwhite.dmi'
		yellow
			icon='Icons/Vaimaskyellow.dmi'
	v2
		black
			icon='Icons/Vaimask2.dmi'
		blue
			icon='Icons/Vaimask2blue.dmi'
		green
			icon='Icons/Vaimask2green.dmi'
		lgreen
			icon='Icons/Vaimask2lgreen.dmi'
		red
			icon='Icons/Vaimask2red.dmi'
		teal
			icon='Icons/Vaimask2teal.dmi'
		gray
			icon='Icons/Vaimask2gray.dmi'
		yellow
			icon='Icons/Vaimask2yellow.dmi'
	v3
		black
			icon='Icons/Vaimask3.dmi'
		blue
			icon='Icons/Vaimask3blue.dmi'
		green
			icon='Icons/Vaimask3green.dmi'
		red
			icon='Icons/Vaimask3red.dmi'
		teal
			icon='Icons/Vaimask3teal.dmi'
		white
			icon='Icons/Vaimask3white.dmi'
		yellow
			icon='Icons/Vaimask3yellow.dmi'
	v4
		icon='Icons/Vaimask4.dmi'
		layer=MOB_LAYER+3
/obj/Twilight_Boost
	layer=10
	icon='Icons/Elec Aura3.dmi'
/obj/KiseRinnegan
	layer=10
	icon='Icons/KiseEyes.dmi'
/obj/rinnegan
	layer=10
	icon='Icons/rinnegan.dmi'
/obj/ssj1
	layer=10
	icon='Icons/sharingan.dmi'//'ssj1hair.dmi'
	pixel_y=0
/obj/sanrei
	layer=15
	icon='Icons/sanrei.dmi'
	pixel_y=2
obj/bloodybase
	layer=15
	icon='Icons/bloodybase.dmi'
obj/bloodybase2
	layer=15
	icon='Icons/bloodybase2.dmi'
turf/hairs
	plane=2
	layer=99
	icon_state="gui"
	hair1
		icon='Icons/hair1.dmi'
		Click()
			usr.hair_type=1
			usr.Load_Overlays()
	hair2
		icon='Icons/hair2.dmi'
		Click()
			usr.hair_type=2
			usr.Load_Overlays()
	hair3
		icon='Icons/hair3.dmi'
		Click()
			usr.hair_type=3
			usr.Load_Overlays()
	hair4
		icon='Icons/hair4.dmi'
		Click()
			usr.hair_type=4
			usr.Load_Overlays()
	hair5
		icon='Icons/hair5.dmi'
		Click()
			usr.hair_type=5
			usr.Load_Overlays()
	none
		icon='Icons/gui.dmi'
		icon_state="bald"
		Click()
			usr.hair_type=0
			usr.Load_Overlays()
	h1
		black
			icon='Icons/hair1.dmi'
			Click()
				usr.hair_type=/obj/hair/h1/black
				usr.Load_Overlays()
		blue
			icon='Icons/hair1blue.dmi'
			Click()
				usr.hair_type=/obj/hair/h1/blue
				usr.Load_Overlays()
		gray
			icon='Icons/hair1gray.dmi'
			Click()
				usr.hair_type=/obj/hair/h1/gray
				usr.Load_Overlays()
		green
			icon='Icons/hair1green.dmi'
			Click()
				usr.hair_type=/obj/hair/h1/green
				usr.Load_Overlays()
		lgreen
			icon='Icons/hair1lgreen.dmi'
			Click()
				usr.hair_type=/obj/hair/h1/lgreen
				usr.Load_Overlays()
		orange
			icon='Icons/hair1orange.dmi'
			Click()
				usr.hair_type=/obj/hair/h1/orange
				usr.Load_Overlays()
		pink
			icon='Icons/hair1pink.dmi'
			Click()
				usr.hair_type=/obj/hair/h1/pink
				usr.Load_Overlays()
		purple
			icon='Icons/hair1purple.dmi'
			Click()
				usr.hair_type=/obj/hair/h1/purple
				usr.Load_Overlays()
		red
			icon='Icons/hair1red.dmi'
			Click()
				usr.hair_type=/obj/hair/h1/red
				usr.Load_Overlays()
		teal
			icon='Icons/hair1teal.dmi'
			Click()
				usr.hair_type=/obj/hair/h1/teal
				usr.Load_Overlays()
		white
			icon='Icons/hair1white.dmi'
			Click()
				usr.hair_type=/obj/hair/h1/white
				usr.Load_Overlays()
		yellow
			icon='Icons/hair1yellow.dmi'
			Click()
				usr.hair_type=/obj/hair/h1/yellow
				usr.Load_Overlays()
	h2
		black
			icon='Icons/hair2.dmi'
			Click()
				usr.hair_type=/obj/hair/h2/black
				usr.Load_Overlays()
		blue
			icon='Icons/hair2blue.dmi'
			Click()
				usr.hair_type=/obj/hair/h2/blue
				usr.Load_Overlays()
		gray
			icon='Icons/hair2gray.dmi'
			Click()
				usr.hair_type=/obj/hair/h2/gray
				usr.Load_Overlays()
		green
			icon='Icons/hair2green.dmi'
			Click()
				usr.hair_type=/obj/hair/h2/green
				usr.Load_Overlays()
		lgreen
			icon='Icons/hair2lgreen.dmi'
			Click()
				usr.hair_type=/obj/hair/h2/lgreen
				usr.Load_Overlays()
		orange
			icon='Icons/hair2orange.dmi'
			Click()
				usr.hair_type=/obj/hair/h2/orange
				usr.Load_Overlays()
		pink
			icon='Icons/hair2pink.dmi'
			Click()
				usr.hair_type=/obj/hair/h2/pink
				usr.Load_Overlays()
		purple
			icon='Icons/hair2purple.dmi'
			Click()
				usr.hair_type=/obj/hair/h2/purple
				usr.Load_Overlays()
		red
			icon='Icons/hair2red.dmi'
			Click()
				usr.hair_type=/obj/hair/h2/red
				usr.Load_Overlays()
		teal
			icon='Icons/hair2teal.dmi'
			Click()
				usr.hair_type=/obj/hair/h2/teal
				usr.Load_Overlays()
		white
			icon='Icons/hair2white.dmi'
			Click()
				usr.hair_type=/obj/hair/h2/white
				usr.Load_Overlays()
		yellow
			icon='Icons/hair2yellow.dmi'
			Click()
				usr.hair_type=/obj/hair/h2/yellow
				usr.Load_Overlays()
	h3
		black
			icon='Icons/hair3.dmi'
			Click()
				usr.hair_type=/obj/hair/h3/black
				usr.Load_Overlays()
		blue
			icon='Icons/hair3blue.dmi'
			Click()
				usr.hair_type=/obj/hair/h3/blue
				usr.Load_Overlays()
		gray
			icon='Icons/hair3gray.dmi'
			Click()
				usr.hair_type=/obj/hair/h3/gray
				usr.Load_Overlays()
		green
			icon='Icons/hair3green.dmi'
			Click()
				usr.hair_type=/obj/hair/h3/green
				usr.Load_Overlays()
		lgreen
			icon='Icons/hair3lgreen.dmi'
			Click()
				usr.hair_type=/obj/hair/h3/lgreen
				usr.Load_Overlays()
		orange
			icon='Icons/hair3orange.dmi'
			Click()
				usr.hair_type=/obj/hair/h3/orange
				usr.Load_Overlays()
		pink
			icon='Icons/hair3pink.dmi'
			Click()
				usr.hair_type=/obj/hair/h3/pink
				usr.Load_Overlays()
		purple
			icon='Icons/hair3purple.dmi'
			Click()
				usr.hair_type=/obj/hair/h3/purple
				usr.Load_Overlays()
		red
			icon='Icons/hair3red.dmi'
			Click()
				usr.hair_type=/obj/hair/h3/red
				usr.Load_Overlays()
		teal
			icon='Icons/hair3teal.dmi'
			Click()
				usr.hair_type=/obj/hair/h3/teal
				usr.Load_Overlays()
		white
			icon='Icons/hair3white.dmi'
			Click()
				usr.hair_type=/obj/hair/h3/white
				usr.Load_Overlays()
		yellow
			icon='Icons/hair3yellow.dmi'
			Click()
				usr.hair_type=/obj/hair/h3/yellow
				usr.Load_Overlays()
	h4
		black
			icon='Icons/hair4.dmi'
			Click()
				usr.hair_type=/obj/hair/h4/black
				usr.Load_Overlays()
		blue
			icon='Icons/hair4blue.dmi'
			Click()
				usr.hair_type=/obj/hair/h4/blue
				usr.Load_Overlays()
		gray
			icon='Icons/hair4gray.dmi'
			Click()
				usr.hair_type=/obj/hair/h4/gray
				usr.Load_Overlays()
		green
			icon='Icons/hair4green.dmi'
			Click()
				usr.hair_type=/obj/hair/h4/green
				usr.Load_Overlays()
		lgreen
			icon='Icons/hair4lgreen.dmi'
			Click()
				usr.hair_type=/obj/hair/h4/lgreen
				usr.Load_Overlays()
		orange
			icon='Icons/hair4orange.dmi'
			Click()
				usr.hair_type=/obj/hair/h4/orange
				usr.Load_Overlays()
		pink
			icon='Icons/hair4pink.dmi'
			Click()
				usr.hair_type=/obj/hair/h4/pink
				usr.Load_Overlays()
		purple
			icon='Icons/hair4purple.dmi'
			Click()
				usr.hair_type=/obj/hair/h4/purple
				usr.Load_Overlays()
		red
			icon='Icons/hair4red.dmi'
			Click()
				usr.hair_type=/obj/hair/h4/red
				usr.Load_Overlays()
		teal
			icon='Icons/hair4teal.dmi'
			Click()
				usr.hair_type=/obj/hair/h4/teal
				usr.Load_Overlays()
		white
			icon='Icons/hair4white.dmi'
			Click()
				usr.hair_type=/obj/hair/h4/white
				usr.Load_Overlays()
		yellow
			icon='Icons/hair4yellow.dmi'
			Click()
				usr.hair_type=/obj/hair/h4/yellow
				usr.Load_Overlays()
	h5
		black
			icon='Icons/hair5.dmi'
			Click()
				usr.hair_type=/obj/hair/h5/black
				usr.Load_Overlays()
		blue
			icon='Icons/hair5blue.dmi'
			Click()
				usr.hair_type=/obj/hair/h5/blue
				usr.Load_Overlays()
		gray
			icon='Icons/hair5gray.dmi'
			Click()
				usr.hair_type=/obj/hair/h5/gray
				usr.Load_Overlays()
		green
			icon='Icons/hair5green.dmi'
			Click()
				usr.hair_type=/obj/hair/h5/green
				usr.Load_Overlays()
		lgreen
			icon='Icons/hair5lgreen.dmi'
			Click()
				usr.hair_type=/obj/hair/h5/lgreen
				usr.Load_Overlays()
		orange
			icon='Icons/hair5orange.dmi'
			Click()
				usr.hair_type=/obj/hair/h5/orange
				usr.Load_Overlays()
		pink
			icon='Icons/hair5pink.dmi'
			Click()
				usr.hair_type=/obj/hair/h5/pink
				usr.Load_Overlays()
		purple
			icon='Icons/hair5purple.dmi'
			Click()
				usr.hair_type=/obj/hair/h5/purple
				usr.Load_Overlays()
		red
			icon='Icons/hair5red.dmi'
			Click()
				usr.hair_type=/obj/hair/h5/red
				usr.Load_Overlays()
		teal
			icon='Icons/hair5teal.dmi'
			Click()
				usr.hair_type=/obj/hair/h5/teal
				usr.Load_Overlays()
		white
			icon='Icons/hair5white.dmi'
			Click()
				usr.hair_type=/obj/hair/h5/white
				usr.Load_Overlays()
		yellow
			icon='Icons/hair5yellow.dmi'
			Click()
				usr.hair_type=/obj/hair/h5/yellow
				usr.Load_Overlays()
obj
	jiroaura
		layer=MOB_LAYER+9
		icon='Icons/Jiroubouhs.dmi'
obj/hair
	layer=MOB_LAYER+1
	pixel_y=3
	//5 =py5
	h1
		black
			icon='Icons/hair1.dmi'
		blue
			icon='Icons/hair1blue.dmi'
		gray
			icon='Icons/hair1gray.dmi'
		green
			icon='Icons/hair1green.dmi'
		lgreen
			icon='Icons/hair1lgreen.dmi'
		orange
			icon='Icons/hair1orange.dmi'
		pink
			icon='Icons/hair1pink.dmi'
		purple
			icon='Icons/hair1purple.dmi'
		red
			icon='Icons/hair1red.dmi'
		teal
			icon='Icons/hair1teal.dmi'
		white
			icon='Icons/hair1white.dmi'
		yellow
			icon='Icons/hair1yellow.dmi'
	h2
		black
			icon='Icons/hair2.dmi'
		blue
			icon='Icons/hair2blue.dmi'
		gray
			icon='Icons/hair2gray.dmi'
		green
			icon='Icons/hair2green.dmi'
		lgreen
			icon='Icons/hair2lgreen.dmi'
		orange
			icon='Icons/hair2orange.dmi'
		pink
			icon='Icons/hair2pink.dmi'
		purple
			icon='Icons/hair2purple.dmi'
		red
			icon='Icons/hair2red.dmi'
		teal
			icon='Icons/hair2teal.dmi'
		white
			icon='Icons/hair2white.dmi'
		yellow
			icon='Icons/hair2yellow.dmi'
	h3
		black
			icon='Icons/hair3.dmi'
		blue
			icon='Icons/hair3blue.dmi'
		gray
			icon='Icons/hair3gray.dmi'
		green
			icon='Icons/hair3green.dmi'
		lgreen
			icon='Icons/hair3lgreen.dmi'
		orange
			icon='Icons/hair3orange.dmi'
		pink
			icon='Icons/hair3pink.dmi'
		purple
			icon='Icons/hair3purple.dmi'
		red
			icon='Icons/hair3red.dmi'
		teal
			icon='Icons/hair3teal.dmi'
		white
			icon='Icons/hair3white.dmi'
		yellow
			icon='Icons/hair3yellow.dmi'
	h4
		black
			icon='Icons/hair4.dmi'
		blue
			icon='Icons/hair4blue.dmi'
		gray
			icon='Icons/hair4gray.dmi'
		green
			icon='Icons/hair4green.dmi'
		lgreen
			icon='Icons/hair4lgreen.dmi'
		orange
			icon='Icons/hair4orange.dmi'
		pink
			icon='Icons/hair4pink.dmi'
		purple
			icon='Icons/hair4purple.dmi'
		red
			icon='Icons/hair4red.dmi'
		teal
			icon='Icons/hair4teal.dmi'
		white
			icon='Icons/hair4white.dmi'
		yellow
			icon='Icons/hair4yellow.dmi'
	h5
		pixel_y=5
		black
			icon='Icons/hair5.dmi'
		blue
			icon='Icons/hair5blue.dmi'
		gray
			icon='Icons/hair5gray.dmi'
		green
			icon='Icons/hair5green.dmi'
		lgreen
			icon='Icons/hair5lgreen.dmi'
		orange
			icon='Icons/hair5orange.dmi'
		pink
			icon='Icons/hair5pink.dmi'
		purple
			icon='Icons/hair5purple.dmi'
		red
			icon='Icons/hair5red.dmi'
		teal
			icon='Icons/hair5teal.dmi'
		white
			icon='Icons/hair5white.dmi'
		yellow
			icon='Icons/hair5yellow.dmi'
obj/Wing
	icon='Icons/quincyfinalwing.dmi'
	layer=MOB_LAYER+8
	w1
		icon_state="FFWingS"
		pixel_y=5
		pixel_x=-20
	w2
		icon_state="FFWingN"
		pixel_y=5
		pixel_x=20
obj/guildaura
	icon='Icons/guildaura.dmi'
	layer=MOB_LAYER+20

obj/HWing2
	icon='Icons/red hakuteik.dmi'
	layer=MOB_LAYER+8
	w1
		icon_state="FFWingS"
		pixel_y=5
		pixel_x=-20
	w2
		icon_state="FFWingN"
		pixel_y=5
		pixel_x=20
	w3
		icon_state="FFWingM"
obj/HWing
	icon='Icons/hakuteiken.dmi'
	layer=MOB_LAYER+8
	w1
		icon_state="FFWingS"
		pixel_y=5
		pixel_x=-20
	w2
		icon_state="FFWingN"
		pixel_y=5
		pixel_x=20
	w3
		icon_state="FFWingM"
obj
	SadoCharge
		icon='Icons/sadocharge.dmi'
		layer=MOB_LAYER+8
	Ulqmask
		icon='Icons/ulquiorraress.dmi'
		pixel_y=3
		layer=MOB_LAYER+8
	Szayel
		icon='Icons/szayel.dmi'
		layer=MOB_LAYER+8
obj/Final
	icon='Icons/finalgetsugablack.dmi'
	layer=MOB_LAYER+12
	Base
		icon_state="base"
		pixel_y=-4
	rBase
		icon_state="lbase"
		pixel_y=-4
		pixel_x=-32
	lBase
		icon_state="rbase"
		pixel_y=-4
		pixel_x=32
	Top
		icon_state="top"
		pixel_y=28
	rTop
		icon_state="ltop"
		pixel_y=28
		pixel_x=-32
	lTop
		icon_state="rtop"
		pixel_y=28
		pixel_x=32
obj/Zanpakutou
	pixel_y=1
	Thanscust
		icon='Icons/thanscust.dmi'
		layer=MOB_LAYER+8
		pixel_y=0
	wshgccust
		icon='Icons/thanscust.dmi'
		layer=MOB_LAYER+8
		pixel_y=0
	Nnoitra
		icon='Icons/nnoitrasword.dmi'
		n1
			icon_state="0,0"
			layer=MOB_LAYER+8
			pixel_x=-18
		n2
			icon_state="1,0"
			layer=MOB_LAYER+8
			pixel_x=14
		n3
			icon_state="2,0"
			layer=MOB_LAYER+8
			pixel_x=46
		n4
			icon_state="0,1"
			layer=MOB_LAYER+8
			pixel_x=-18
			pixel_y=32
		n5
			icon_state="1,1"
			layer=MOB_LAYER+8
			pixel_x=14
			pixel_y=32
		a1
			icon_state="two 0,0"
			layer=MOB_LAYER+8
			pixel_x=-18
		a2
			icon_state="two 1,0"
			layer=MOB_LAYER+8
			pixel_x=14
		a3
			icon_state="two 2,0"
			layer=MOB_LAYER+8
			pixel_x=46
		a4
			icon_state="two 0,1"
			layer=MOB_LAYER+8
			pixel_x=-18
			pixel_y=32
		a5
			icon_state="two 1,1"
			layer=MOB_LAYER+8
			pixel_x=14
			pixel_y=32
	//matsuricopy
	MatsShikai1
		icon='Icons/mats botleft.dmi'
		layer=MOB_LAYER+8
		pixel_x=-32
		pixel_y=-31
	MatsShikai2
		icon='Icons/mats botmid.dmi'
		layer=MOB_LAYER+8
		pixel_y=-31
	MatsShikai3
		icon='Icons/mats botright.dmi'
		layer=MOB_LAYER+8
		pixel_x=32
		pixel_y=-31
	MatsShikai4
		icon='Icons/mats midleft.dmi'
		layer=MOB_LAYER+8
		pixel_x=-32
	MatsShikai5
		icon='Icons/mats midmid.dmi'
		layer=MOB_LAYER+8
	MatsShikai6
		icon='Icons/mats midright.dmi'
		layer=MOB_LAYER+8
		pixel_x=32
	MatsShikai7
		icon='Icons/mats topleft.dmi'
		layer=MOB_LAYER+8
		pixel_x=-32
		pixel_y=33
	MatsShikai8
		icon='Icons/mats topmid.dmi'
		layer=MOB_LAYER+8
		pixel_y=33
	MatsShikai9
		icon='Icons/mats topright.dmi'
		layer=MOB_LAYER+8
		pixel_x=32
		pixel_y=33
	MatsBankai1
		icon='Icons/matb botleft.dmi'
		layer=MOB_LAYER+8
		pixel_x=-32
		pixel_y=-31
	MatsBankai2
		icon='Icons/matb botmid.dmi'
		layer=MOB_LAYER+8
		pixel_y=-31
	MatsBankai3
		icon='Icons/matb botright.dmi'
		layer=MOB_LAYER+8
		pixel_x=32
		pixel_y=-31
	MatsBankai4
		icon='Icons/matb midleft.dmi'
		layer=MOB_LAYER+8
		pixel_x=-32
	MatsBankai5
		icon='Icons/matb midmid.dmi'
		layer=MOB_LAYER+8
	MatsBankai6
		icon='Icons/matb midright.dmi'
		layer=MOB_LAYER+8
		pixel_x=32
	MatsBankai7
		icon='Icons/matb topleft.dmi'
		layer=MOB_LAYER+8
		pixel_x=-32
		pixel_y=33
	MatsBankai8
		icon='Icons/matb topmid.dmi'
		layer=MOB_LAYER+8
		pixel_y=33
	MatsBankai9
		icon='Icons/matb topright.dmi'
		layer=MOB_LAYER+8
		pixel_x=32
		pixel_y=33
	//end matsuricopy
	Kenseib
		icon='Icons/Kensei-Bankai.dmi'
		layer=MOB_LAYER+8
		pixel_y=0
	Kensei
		icon='Icons/Z_Kensei.dmi'
		layer=MOB_LAYER+8
	Hisagi
		icon='Icons/Z_Hisagi.dmi'
		layer=MOB_LAYER+8
		pixel_x=-4
	Hisagi2
		icon='Icons/Z_Hisagi2.dmi'
		layer=MOB_LAYER+8
		pixel_x=4
	Hisagib
		icon='Icons/Z_Hisagib.dmi'
		layer=MOB_LAYER+8
		pixel_x=-4
	Hisagi2b
		icon='Icons/Z_Hisagi2b.dmi'
		layer=MOB_LAYER+8
		pixel_x=4
	Torpedo
		icon='Icons/Z_Torpedo.dmi'
		layer=MOB_LAYER+8
		pixel_y=0
	Torpedo2
		icon='Icons/Z_Torpedo2.dmi'
		layer=MOB_LAYER+8
		pixel_y=32
	Stinger
		icon='Icons/Z_Stinger.dmi'
		layer=MOB_LAYER+8
		pixel_y=2
	Gun
		icon='Icons/Guns.dmi'
		layer=MOB_LAYER+8
	StarkMask
		icon='Icons/starrks ress m.dmi'
		pixel_y=0
		layer=MOB_LAYER+8
	Shinsou
		icon='Icons/Z_Shinsou.dmi'
		layer=MOB_LAYER+8
	Jiroubou
		icon='Icons/Z_Jiroubou.dmi'
		layer=MOB_LAYER+8
	HS
		icon='Icons/Z_Jiroubou.dmi'
		icon_state="aura"
		layer=MOB_LAYER+9
	Dark_Aura
		top
			icon ='Icons/dark fire aura.dmi'
			icon_state="top"
			layer=MOB_LAYER+9
			pixel_y=32
		mid
			icon ='Icons/dark fire aura.dmi'
			icon_state="mid"
			layer=MOB_LAYER+9
		bot
			icon ='Icons/dark fire aura.dmi'
			icon_state="bot"
			layer=MOB_LAYER+9
			pixel_y=-32
	Ulq
		icon='Icons/Z_Ulq.dmi'
		layer=MOB_LAYER+10
	Zangetsu
		icon='Icons/Z_Zangetsu2.dmi'
		layer=MOB_LAYER+8
		a1
			icon='Icons/Z_Zangetsu2pt2.dmi'
			pixel_y=-16
			pixel_x=-16
		a2
			icon='Icons/Z_Zangetsu2pt3.dmi'
			pixel_y=-16
			pixel_x=16
		a3
			icon='Icons/Z_Zangetsu2pt4.dmi'
			pixel_y=16
			pixel_x=-16
		a4
			icon='Icons/Z_Zangetsu2pt5.dmi'
			pixel_y=16
			pixel_x=16
	Tensa
		pixel_y=0
		icon='Icons/tensa2.dmi'
		layer=MOB_LAYER+8
	Final
		icon='Icons/finalgetsugasword.dmi'
		layer=MOB_LAYER+9
	Tensat
		icon='Icons/tensat.dmi'
		layer=MOB_LAYER+9
	RyuujinJakka
		icon='Icons/RyuujinJakkanew.dmi'
		layer=MOB_LAYER+8
		pixel_y=0
	CCLeut2
		icon='Icons/cc leut shik.dmi'
		layer=MOB_LAYER+8
	CCLeut
		icon='Icons/cc leut shikai.dmi'
		layer=MOB_LAYER+8
	CCLeut3
		icon='Icons/cc leut bankai.dmi'
		layer=MOB_LAYER+8
	Rukia
		icon='Icons/Z_Rukia.dmi'
		layer=MOB_LAYER+8
	/*Kenpachi
		icon='Icons/Z_Kenpachi.dmi'
		layer=MOB_LAYER+8*/
	Zabimaru
		icon='Icons/Z_Zabimaru.dmi'
		layer=MOB_LAYER+8
	Zabimaru_Bankai
		//icon='Icons/HihiouZabimaru.dmi'
		layer=MOB_LAYER+8
	Kira
		icon='Icons/Z_Wabasuke.dmi'
		layer=MOB_LAYER+8
	Byakuya
		icon='Icons/Z_Senbonzakura.dmi'
		layer=MOB_LAYER+8
	Unohana
		icon='Icons/Z_Unohana.dmi'
		layer=MOB_LAYER+8
		pixel_y=0
	Yumichika
		icon='Icons/Z_Yumichikanew1.dmi'
		layer=MOB_LAYER+8
	YumichikaGlow
		icon='Icons/Z_Yumichikab2b.dmi'
		layer=MOB_LAYER+9
	Hinamori
		icon='Icons/Z_Tobiume.dmi'
		layer=MOB_LAYER+8
	Ikkaku
		icon='Icons/hoozookimaru.dmi'
		layer=MOB_LAYER+8
	Ukitake
		icon='Icons/UkitakeShikaiFinal.dmi'
		layer=MOB_LAYER+8
	Dual
		icon='Icons/dualswords.dmi'
		layer=MOB_LAYER+8
	Tousen
		icon='Icons/tousen.dmi'
		layer=MOB_LAYER+8
	Urahara
		icon='Icons/uraharasword.dmi'
		layer=MOB_LAYER+8
	Muramasa
		icon='Icons/Z_Muramasa.dmi'
		layer=MOB_LAYER+8
	Love
		icon='Icons/topleftlove.dmi'
		pixel_y=32
		pixel_x=-32
		layer=MOB_LAYER+8
	Love2
		icon='Icons/toprightlove.dmi'
		pixel_y=32
		pixel_x=16
		layer=MOB_LAYER+8
	Love3
		icon='Icons/leftlove.dmi'
		layer=MOB_LAYER+8
		pixel_x=-16
	Fujibankaiover
		icon='Icons/FujimaruBankaproperi.dmi'
		layer=MOB_LAYER+8
	Fujishikaiover
		icon='Icons/FujimaruShikaiproper.dmi'
		layer=MOB_LAYER+8
	Susano1
		icon='Icons/for lols.dmi'
		icon_state="0,0"
		pixel_x=-32
		pixel_y=-16
	Susano2
		icon='Icons/for lols.dmi'
		icon_state="1,0"
		pixel_x=32
		pixel_y=-16
	Susano3
		icon='Icons/for lols.dmi'
		icon_state="0,1"
		layer=55
		pixel_x=-32
		pixel_y=16
	Susano4
		icon='Icons/for lols.dmi'
		icon_state="1,1"
		layer=55
		pixel_x=32
		pixel_y=16
	Susano5
		icon='Icons/for lols.dmi'
		icon_state="0,2"
		layer=55
		pixel_x=-32
		pixel_y=48
	Susano6
		icon='Icons/for lols.dmi'
		icon_state="1,2"
		layer=55
		pixel_x=32
		pixel_y=48
	ShinjiShikai
		icon='Icons/shinji.dmi'
		pixel_y=3
		layer=MOB_LAYER+8
	ShinjiShikai2
		icon='Icons/shinji.dmi'
		pixel_y=3
		layer=MOB_LAYER+8
	Love4
		icon='Icons/rightlove.dmi'
		pixel_x=16
		layer=MOB_LAYER+8
	ZaShikai1
		icon='Icons/zsbotleft.dmi'
		pixel_x=-32
		pixel_y=-31
		layer=25
	ZaShikai2
		icon='Icons/zsbotmid.dmi'
		pixel_y=-31
		layer=25
	ZaShikai3
		icon='Icons/zsbotright.dmi'
		pixel_y=-31
		pixel_x=32
		layer=25
	ZaShikai4
		icon='Icons/zsmidleft.dmi'
		pixel_x=-32
		layer=25
	ZaShikai5
		icon='Icons/zsmidmid.dmi'
		layer=25
	ZaShikai6
		icon='Icons/zsmidright.dmi'
		layer=25
		pixel_x=32
	ZaShikai7
		icon='Icons/zstopleft.dmi'
		pixel_y=32
		pixel_x=-32
		layer=25
	ZaShikai8
		icon='Icons/zstopmid.dmi'
		pixel_y=32
		layer=25
	ZaShikai9
		icon='Icons/zstopright.dmi'
		pixel_y=32
		pixel_x=32
		layer=25
	Shonshui
		icon='Icons/shunsuiswords.dmi'
		layer=MOB_LAYER+8
	Shonshui2
		icon='Icons/shunsuiswordseast.dmi'
		layer=MOB_LAYER+8
		pixel_y=-16
		pixel_x=-16
	Shonshui3
		icon='Icons/shunsuiswordswest.dmi'
		layer=MOB_LAYER+8
		pixel_y=-16
		pixel_x=16
	Shonshui4
		icon='Icons/shunsuiswordsnorth.dmi'
		layer=MOB_LAYER+8
		pixel_y=16
		pixel_x=-16
	Shonshui5
		icon='Icons/shunsuiswordssouth.dmi'
		layer=MOB_LAYER+8
		pixel_y=16
		pixel_x=16
	Kaien
		icon='Icons/kaiennew.dmi'
		layer=MOB_LAYER+8
	Mayuri
		icon='Icons/mayurishikai.dmi'
		layer=MOB_LAYER+8
		M1
			icon='Icons/MayuriBankais.dmi'
			icon_state="0,0"
			pixel_x=-32
			pixel_y=-32
		M2
			icon='Icons/MayuriBankais.dmi'
			icon_state="1,0"
			pixel_x=0
			pixel_y=-32
		M3
			icon='Icons/MayuriBankais.dmi'
			icon_state="2,0"
			pixel_x=32
			pixel_y=-32
		M4
			icon='Icons/MayuriBankais.dmi'
			icon_state="0,1"
			pixel_x=-32
			pixel_y=0
		M5
			icon='Icons/MayuriBankais.dmi'
			icon_state="1,1"
			pixel_x=0
			pixel_y=0
		M6
			icon='Icons/MayuriBankais.dmi'
			icon_state="2,1"
			pixel_x=32
			pixel_y=0
		M7
			icon='Icons/MayuriBankais.dmi'
			icon_state="0,2"
			pixel_x=-32
			pixel_y=32
		M8
			icon='Icons/MayuriBankais.dmi'
			icon_state="1,2"
			pixel_x=0
			pixel_y=32
		M9
			icon='Icons/MayuriBankais.dmi'
			icon_state="2,2"
			pixel_x=32
			pixel_y=32
	FireBount
		icon='Icons/Fire Fortress.dmi'
		layer=40
		F1
			icon_state="corner"
			pixel_y=40
		F2
			icon_state="south"
			pixel_x=-48
		F3
			icon_state="north"
			pixel_x=-48
			pixel_y=32
		F4
			icon_state="south"
			pixel_x=48
		F5
			icon_state="north"
			pixel_x=48
			pixel_y=32
	FireDoll
		icon='Icons/bountofire.dmi'
		layer=40
		F1
			icon_state="over"
			layer=3
		F2
			icon_state="bottom right"
			pixel_x=32
		F3
			icon_state="bottom left"
			pixel_x=-32
		F4
			icon_state="middle"
			pixel_y=32
		F5
			icon_state="middle right"
			pixel_x=32
			pixel_y=32
		F6
			icon_state="middle left"
			pixel_x=-32
			pixel_y=32
		F7
			icon_state="top"
			pixel_y=64
		F8
			icon_state="top left"
			pixel_y=64
			pixel_x=-32
		F9
			icon_state="top right"
			pixel_y=64
			pixel_x=32
	WaterDoll
		icon='Icons/bountowater.dmi'
		layer=40
		F1
			icon_state="over"
			layer=3
		F2
			icon_state="bottom right"
			pixel_x=32
		F3
			icon_state="bottom left"
			pixel_x=-32
		F4
			icon_state="middle"
			pixel_y=32
		F5
			icon_state="middle right"
			pixel_x=32
			pixel_y=32
		F6
			icon_state="middle left"
			pixel_x=-32
			pixel_y=32
		F7
			icon_state="top"
			pixel_y=64
		F8
			icon_state="top left"
			pixel_y=64
			pixel_x=-32
		F9
			icon_state="top right"
			pixel_y=64
			pixel_x=32
	Toushi
		icon='Icons/toushi1.dmi'
		layer=MOB_LAYER+8
	Ginjo
		icon='Icons/F_Ginjonew.dmi'
		layer=MOB_LAYER+8
	Jackie
		icon='Icons/F_Jackie.dmi'
		layer=MOB_LAYER+8
	Ginjo2
		icon='Icons/F_Ginjo2.dmi'
		layer=MOB_LAYER+8
	Tsukishima
		icon='Icons/F_Tsukishima.dmi'
		layer=MOB_LAYER+8
	Ichigo_F
		icon='Icons/F_Ichigo.dmi'
		layer=MOB_LAYER+8
	Ichigo_F2
		icon='Icons/F_Ichigo2.dmi'
		layer=MOB_LAYER+8
		pixel_y=3
	Ichigo_F3
		icon='Icons/F_Ichigo3.dmi'
		layer=MOB_LAYER+8
		pixel_y=2
obj/Hell
	Hell_Armor
		icon='Icons/hell armor.dmi'
		layer=MOB_LAYER+8
obj/Arm
	Arm1
		icon='Icons/Sado arm.dmi'
		layer=MOB_LAYER+8
	Arm2
		icon='Icons/Sado arm upgrade.dmi'
		layer=MOB_LAYER+8
	Arm3
		icon='Icons/Shield arm.dmi'
		layer=MOB_LAYER+8
	Arm4
		icon='Icons/Brazo izquierda del diablo.dmi'
		layer=MOB_LAYER+8
obj/rage
	icon='Icons/rageaura.dmi'
	layer=MOB_LAYER+10
obj/rage1
	icon='Icons/rageaura.dmi'
	layer=MOB_LAYER+10
	pixel_y=32
	icon_state="top"
obj
	RukiaRelease
		icon='Icons/rukiarelease.dmi'
		layer=MOB_LAYER+10
turf
	bases
		plane=2
		layer=800
		base1
			icon='Icons/Basenewp.dmi'
			Click()
				if(!usr.initialized)
					usr.icon_name="Base"
					usr.Affirm_Icon()

				else
					usr<<"You can only modify this at initial character creation."
		base2
			icon='Icons/BaseShorts.dmi'
			Click()
				if(!usr.initialized)
					usr.icon_name="BaseTan"
					usr.Affirm_Icon()

				else
					usr<<"You can only modify this at initial character creation."
		base3
			icon='Icons/Basenewb.dmi'
			Click()
				if(!usr.initialized)
					usr.icon_name="BaseBlack"
					usr.Affirm_Icon()

				else
					usr<<"You can only modify this at initial character creation."

	haircolor
		plane=2
		layer=999
		haircolor_rgb
			icon='Icons/charcreate.dmi'
			icon_state="rgb"
			Click()
				usr<<"<b>You must click the hair cards below to pick your hair color"
obj
	maskcolor
		plane=2
		layer=999
		maskcolor_rgb
			screen_loc = "8,11"
			icon='Icons/charcreate.dmi'
			icon_state="mask"
			Click()
				switch(input("What color do you want to change your base mask into?", text) in list ("Black","Blue","White","Green","Light Green","Red","Teal","Yellow"))
					if("Black")
						usr.vmask=/obj/Vaimask/v2/black
					if("Blue")
						usr.vmask=/obj/Vaimask/v2/blue
					if("White")
						usr.vmask=/obj/Vaimask/v2/gray
					if("Green")
						usr.vmask=/obj/Vaimask/v2/green
					if("Light Green")
						usr.vmask=/obj/Vaimask/v2/lgreen
					if("Red")
						usr.vmask=/obj/Vaimask/v2/red
					if("Teal")
						usr.vmask=/obj/Vaimask/v2/teal
					if("Yellow")
						usr.vmask=/obj/Vaimask/v2/yellow
		stripecolor_rgb
			screen_loc = "9,11"
			icon='Icons/charcreate.dmi'
			icon_state="stripe"
			Click()
				switch(input("What color do you want to change your mask stripes into?", text) in list ("Black","Blue","White","Green","Light Green","Red","Teal","Yellow"))
					if("Black")
						usr.vstripe=/obj/Vaimask/v1/black
					if("Blue")
						usr.vstripe=/obj/Vaimask/v1/blue
					if("White")
						usr.vstripe=/obj/Vaimask/v1/white
					if("Green")
						usr.vstripe=/obj/Vaimask/v1/green
					if("Light Green")
						usr.vstripe=/obj/Vaimask/v1/lgreen
					if("Red")
						usr.vstripe=/obj/Vaimask/v1/red
					if("Teal")
						usr.vstripe=/obj/Vaimask/v1/teal
					if("Yellow")
						usr.vstripe=/obj/Vaimask/v1/yellow
		eyecolor_rgb
			screen_loc = "10,11"
			icon='Icons/charcreate.dmi'
			icon_state="eye"
			Click()
				switch(input("What color do you want to change your mask eyes into?", text) in list ("Black","Blue","White","Green","Red","Teal","Yellow"))
					if("Black")
						usr.veye=/obj/Vaimask/v3/black
					if("Blue")
						usr.veye=/obj/Vaimask/v3/blue
					if("White")
						usr.veye=/obj/Vaimask/v3/white
					if("Green")
						usr.veye=/obj/Vaimask/v3/green
					if("Red")
						usr.veye=/obj/Vaimask/v3/red
					if("Teal")
						usr.veye=/obj/Vaimask/v3/teal
					if("Yellow")
						usr.veye=/obj/Vaimask/v3/yellow

obj/Shadow
	New()
		spawn(50)
		del src

obj
	dirarrows
		plane=2
		layer=99
		icon='Icons/charcreate.dmi'
		right
			icon_state="right"
			Click()
				usr.dir=EAST

		left
			icon_state="left"
			Click()
				usr.dir=WEST

		up
			icon_state="up"
			Click()
				usr.dir=NORTH

		down
			icon_state="down"
			Click()
				usr.dir=SOUTH

mob
	var
		cerocolor=""
		stunned=0
		busy=0
		undershirt
		overshirt
		shirt
		jacket
		armor
		pants
		legarmor
		armarmor
		facearmor
		glasses
		cloak
		back
		shoes
		special
		hair_type=0
		hair_red=0
		hair_green=0
		hair_blue=0
		jacket_red=0
		jacket_green=0
		jacket_blue=0
		shirt_red=0
		shirt_green=0
		shirt_blue=0
		shoes_red=0
		shoes_green=0
		shoes_blue=0
		vstripe=/obj/Vaimask/v1/red
		vmask=/obj/Vaimask/v2/gray
		veye=/obj/Vaimask/v3/yellow
		hair_color="Black"
		mask=2
		blindfold


//overlay handling
/*mob/proc
	Load_Overlays()
		var/L[0]
		var/h3
		src.overlays=0
		src.underlays=0
		if(src.skurn==1)
			src.icon='Icons/blank.dmi'
			src.overlays+=/obj/PSummon/BotLeft
			src.overlays+=/obj/PSummon/BotRight
			src.overlays+=/obj/PSummon/TopLeft
			src.overlays+=/obj/PSummon/TopRight
		if(src.susanos==2)
			src.overlays+=/obj/stage2/s1
			src.overlays+=/obj/stage2/s2
			src.overlays+=/obj/stage2/s3
			src.overlays+=/obj/stage2/s4
			src.overlays+=/obj/stage2/s5
			src.overlays+=/obj/stage2/s6
			src.overlays+=/obj/stage2/s7
			src.overlays+=/obj/stage2/s8
			src.overlays+=/obj/stage2/s9
			src.overlays+=/obj/stage2/s10
			src.overlays+=/obj/stage2/s11
			src.overlays+=/obj/stage2/s12
			src.overlays+=/obj/stage2/s13
			src.overlays+=/obj/stage2/s14
			src.overlays+=/obj/stage2/s15
			src.overlays+=/obj/stage2/s16
			src.overlays+=/obj/stage2/s17
		if(src.amated==1)
			src.overlays+=/obj/amatover
		if(src.skurn==1)
			src.icon='Icons/blank.dmi'
			src.overlays+=/obj/PSummon/BotLeft
			src.overlays+=/obj/PSummon/BotRight
			src.overlays+=/obj/PSummon/TopLeft
			src.overlays+=/obj/PSummon/TopRight
		if(src.Yokai1==1)
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/Yokai/Yokai11
			src.overlays += /obj/Yokai/Yokai12
		if(src.Yokai2==1)
			src.icon='Icons/BlankBase.dmi'
			src.overlays += /obj/Yokai2/Yokai21
			src.overlays += /obj/Yokai2/Yokai22
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
		if(src.lorelei==1)
			src.icon='Icons/blank.dmi'
			src.overlays += /obj/Pheonix/botleft11
			src.overlays += /obj/Pheonix/botleft12
			src.overlays += /obj/Pheonix/botleft13
			src.overlays += /obj/Pheonix/botleft21
			src.overlays += /obj/Pheonix/botleft22
			src.overlays += /obj/Pheonix/botleft23
			src.overlays += /obj/Pheonix/botleft31
			src.overlays += /obj/Pheonix/botleft32
			src.overlays += /obj/Pheonix/botleft33
		if(src.lorelei==2)
			src.icon='Icons/blank.dmi'
			src.overlays += /obj/redwolf/bl
			src.overlays += /obj/redwolf/br
			src.overlays += /obj/redwolf/tl
			src.overlays += /obj/redwolf/tr
		if(src.race=="Hollow")
			if(!src.colorr&&src.ctf==2)
				src.overlays += /obj/blue
			if(src.colorr&&src.ctf==2)
				src.overlays += /obj/red
			if(src.flags=="blue")
				src.overlays += /obj/blueflag
			if(src.flags=="red")
				src.overlays += /obj/redflag
			if(src.in_team)
				src.overlays += /obj/gl
			if(src.hollowtype == "tutorial")
				src.icon='Icons/BlankBase.dmi'
				src.overlays += /obj/TutHollow/BotLeft
				src.overlays += /obj/TutHollow/BotRight
				src.overlays += /obj/TutHollow/TopRight
				src.overlays += /obj/TutHollow/TopLeft
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
			if(src.hollowtype == "wolf")
				src.icon='Icons/blank.dmi'
				src.overlays += /obj/wolf1
				src.overlays += /obj/wolf2
				src.overlays += /obj/wolf3
				src.overlays += /obj/wolf4
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
			if(src.hollowtype == "bat")
				src.icon="blank.dmi"
				src.overlays += /obj/bat
			if(src.hollowtype == "devil")
				src.icon='Icons/blank.dmi'
				src.overlays += /obj/demonboss1
				src.overlays += /obj/demonboss2
				src.overlays += /obj/demonboss3
				src.overlays += /obj/demonboss4
				src.overlays += /obj/demonboss5
				src.overlays += /obj/demonboss6
				src.overlays += /obj/demonboss7
				src.overlays += /obj/demonboss8
				src.overlays += /obj/demonboss9
			if(src.hollowtype == "Reaper")
				src.icon='Icons/blank.dmi'
				src.overlays += /obj/reaper1
				src.overlays += /obj/reaper2
			if(src.hollowtype == "demon")
				src.icon='Icons/blank.dmi'
				src.overlays += /obj/demon1
				src.overlays += /obj/demon2
				src.overlays += /obj/demon3
				src.overlays += /obj/demon4
			if(src.hollowtype == "strong")
				src.overlays += /obj/nstrong1
				src.overlays += /obj/nstrong2
				src.overlays += /obj/nstrong3
				src.overlays += /obj/nstrong4
			if(src.hollowtype == "meno")
				src.icon='Icons/blank.dmi'
				src.overlays += /obj/Menos/m1
				src.overlays += /obj/Menos/m2
				src.overlays += /obj/Menos/m3
				src.overlays += /obj/Menos/m4
				src.overlays += /obj/Menos/m5
				src.overlays += /obj/Menos/m6
				src.overlays += /obj/Menos/m7
				src.overlays += /obj/Menos/m8
			if(src.hollowtype == "adjucha")
				src.icon = 'blank.dmi'
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
				if(src.adjhollowtype==2)//tall green
					src.overlays+=/obj/TallAdju/BottomLeft
					src.overlays+=/obj/TallAdju/BottomRight
					src.overlays+=/obj/TallAdju/Bottom2Left
					src.overlays+=/obj/TallAdju/Bottom2Right
					src.overlays+=/obj/TallAdju/Bottom3Left
					src.overlays+=/obj/TallAdju/Bottom3Right
					src.overlays+=/obj/TallAdju/Bottom4Left
					src.overlays+=/obj/TallAdju/Bottom4Right
				if(src.adjhollowtype==3)//panther
					src.overlays+=/obj/PantherHollow/BL
					src.overlays+=/obj/PantherHollow/BR
					src.overlays+=/obj/PantherHollow/TL
					src.overlays+=/obj/PantherHollow/TR
				return
		if(src.pants)L+=pants
		if(src.shirt)L+=src.shirt
		if(src.shoes)L+=src.shoes
		if(src.jacket)L+=src.jacket
		switch(src.arrancarmask)
			if(1)
				h3='arrancar1.dmi'
			if(2)
				h3='arrancar2.dmi'
			if(3)
				h3='arrancar3.dmi'
		if(src.amated==1)
			src.overlays+=/obj/amatover
		if(hair_type)
			L+= hair_type
			if(src.ressurection&&src.ressurectiontype=="Skeleton"||src.ressurection&&src.ressurectiontype=="Del Toro")
				L-=hair_type
			if(src.trans||src.trans3)
				L+=/obj/ssj1
				if(src.susanos==2)
					src.overlays+=/obj/stage2/s1
					src.overlays+=/obj/stage2/s2
					src.overlays+=/obj/stage2/s3
					src.overlays+=/obj/stage2/s4
					src.overlays+=/obj/stage2/s5
					src.overlays+=/obj/stage2/s6
					src.overlays+=/obj/stage2/s7
					src.overlays+=/obj/stage2/s8
					src.overlays+=/obj/stage2/s9
					src.overlays+=/obj/stage2/s10
					src.overlays+=/obj/stage2/s11
					src.overlays+=/obj/stage2/s12
					src.overlays+=/obj/stage2/s13
					src.overlays+=/obj/stage2/s14
					src.overlays+=/obj/stage2/s15
					src.overlays+=/obj/stage2/s16
					src.overlays+=/obj/stage2/s17
			if(src.rinneg)
				L+=/obj/rinnegan
		if(h3)
			if(!src.ressurection)
				var/obj/j3=new/obj
				j3.pixel_y=1
				j3.icon=h3
				j3.layer=MOB_LAYER+3
				L+= j3
				if(src.arrancarmask==1)
					var/obj/j3s=new/obj
					j3s.pixel_y=8
					j3s.icon='Icons/arrancar1.1.dmi'
					j3s.layer=MOB_LAYER+3
					L+= j3s
					spawn(2)
					del j3s
				spawn(2)
				del j3
		if(src.maskon&&src.maskuses>30&&src.vasto==0)
			switch(mask)
				if(1)
					L+=/obj/VisoredMasks/Mask1
				if(2)
					L+=/obj/VisoredMasks/Mask2
				if(3)
					L+=/obj/VisoredMasks/Mask3
				if(4)
					L+=/obj/VisoredMasks/Mask4
				if(5)
					L+=/obj/VisoredMasks/Mask5
				if(7)
					L+=/obj/VisoredMasks/Mask7
		if(src.maskon&&src.vasto==1)
			L+=/obj/VisoredMasks/Mask6
	/*		L+=src.veye
			L+=src.vmask
			L+=src.vstripe
			L+=/obj/Vaimask/v4*/
		if(special)L+=special
		if(undershirt) L+=undershirt
		if(src.soccer)
			L+=/obj/soccerball
		if(overshirt)
			L+=overshirt
		if(legarmor) L+=legarmor
		if(armor)L+=armor
		if(armarmor)L+=armarmor
		if(blindfold)
			L+=/obj/facearmor/s6
		if(glasses)L+=glasses/*
			var/obj/j2=new/obj
			j2.pixel_y=3
			j2.icon=glasses
			j2.layer=MOB_LAYER+5
			L+=j2
			spawn(2)
			del j2*/
		if(facearmor)L+=facearmor/*
			var/obj/j2=new/obj
			j2.pixel_y=3
			j2.icon=facearmor
			j2.layer=MOB_LAYER+5
			L+=j2
			spawn(2)
			del j2*/
		if(cloak)L+=cloak
		if(back)L+=back
		if(weapon)L+=weapon
		if(src.segunda)
			L+=/obj/blacktail
			L+=/obj/horns
		if(src.limitrelease)
			if(src.race=="Shinigami")
				L+=/obj/lrelease/a1
				L+=/obj/lrelease/a2
				L+=/obj/lrelease/a3
				L+=/obj/lrelease/a4
			else
				L+=/obj/auramess2/a1
				L+=/obj/auramess2/a2
				L+=/obj/auramess2/a3
				L+=/obj/auramess2/a4
		if(src.ressurectiontype=="Scientist"&&src.ressurection==1)
			L-=weapon
			L+=/obj/releases/Szayel1
			L+=/obj/releases/Szayel2
			L+=/obj/releases/Szayel3
		if(src.ressurectiontype=="Wonderweiss"&&src.ressurection==1)
			L-=weapon
			L+=/obj/releases/Wonder1
			L+=/obj/releases/Wonder2
			L+=/obj/releases/Wonder3
		if(src.ressurectiontype=="Halibel"&&src.ressurection==1)
			L-=weapon
			L+=/obj/releases/Halibel
		if(src.ressurectiontype=="Nnoitra"&&src.ressurection==1)
			L-=weapon
			if(src.wound>=75)
				L+=/obj/Zanpakutou/Nnoitra/a1
				L+=/obj/Zanpakutou/Nnoitra/a2
				L+=/obj/Zanpakutou/Nnoitra/a3
				L+=/obj/Zanpakutou/Nnoitra/a4
				L+=/obj/Zanpakutou/Nnoitra/a5
			if(src.wound<75)
				L+=/obj/Zanpakutou/Nnoitra/n1
				L+=/obj/Zanpakutou/Nnoitra/n2
				L+=/obj/Zanpakutou/Nnoitra/n3
				L+=/obj/Zanpakutou/Nnoitra/n4
				L+=/obj/Zanpakutou/Nnoitra/n5
		if(src.ulqgotsword)
			L+=/obj/Zanpakutou/Ulq
		if(src.ressurectiontype=="Shooter"&&src.ressurection==1)
			L-=weapon
			if(!src.dualon)
				L+=/obj/Zanpakutou/Gun
			if(src.dualon)
				L+=/obj/Zanpakutou/Dual
			L+=/obj/Zanpakutou/StarkMask
		if(src.ressurectiontype=="Ulq"&&src.ressurection==1)
			L-=weapon
			L+=/obj/Ulqmask
			L+=/obj/Ulqwings/w1
			L+=/obj/Ulqwings/w2
			L+=/obj/Ulqwings/w3
		if(src.ressurectiontype=="Luppi"&&src.ressurection==1)
			L-=weapon
			L+=/obj/releases/Luppi
		if(src.ressurectiontype=="Tijereta"&&src.ressurection==1)
			L-=weapon
			L+=/obj/releases/Tijereta
		if(src.ressurectiontype=="Aguila"&&src.ressurection==1)
			L-=weapon
			L+=/obj/releases/Agui1
			L+=/obj/releases/Agui2
			L+=/obj/releases/Agui3
		if(src.ressurectiontype=="Skeleton"&&src.ressurection==1)
			L-=weapon
			L-=overshirt
			L-=cloak
			src.overlays+=/obj/releases/Skeleton
			src.overlays+=/obj/releases/Skeleton1
			src.overlays+=/obj/releases/Skeleton2
			if(src.segunda)
				src.overlays+=/obj/blacktail
				src.overlays+=/obj/horns
			if(!src.colorr&&src.ctf==2)
				src.overlays += /obj/blue
			if(src.colorr&&src.ctf==2)
				src.overlays += /obj/red
			if(src.flags=="blue")
				src.overlays += /obj/blueflag
			if(src.flags=="red")
				src.overlays += /obj/redflag
			return
		if(src.ressurectiontype=="Zommari"&&src.ressurection==1)
			L-=weapon
			L+=/obj/releases/Zommari
		if(src.ressurectiontype=="Nell"&&src.ressurection==1)
			L-=weapon
			L-=overshirt
			L-=cloak
			L+=/obj/releases/Nell5
			L+=/obj/releases/Nell1
			L+=/obj/releases/Nell2
			L+=/obj/releases/Nell3
			L+=/obj/releases/Nell4
			L+=/obj/releases/Nell6
		if(src.ressurectiontype=="Volcanica"&&src.ressurection==1)
			L-=weapon
			L+=/obj/releases/Volcanica
		if(src.ressurectiontype=="Dordoni"&&src.ressurection==1)
			L-=weapon
			L+=/obj/releases/Dordoni1
			L+=/obj/releases/Dordoni2
			L+=/obj/releases/Dordoni3
			L+=/obj/releases/Dordoni4
		if(src.ressurectiontype=="Pantera"&&src.ressurection==1)
			L-=weapon
			L-=overshirt
			L-=cloak
			L+=/obj/releases/Pantera
		if(src.ressurectiontype=="Del Toro"&&src.ressurection==1)
			L-=weapon
			//L-=overshirt
			//L-=cloak
//			L+=/obj/releases/Del1
//			L+=/obj/releases/Del2
//			L+=/obj/releases/Del3
//			L+=/obj/releases/DelToro
			L+=/obj/releases/newdel/delb1
			L+=/obj/releases/newdel/delb2
			L+=/obj/releases/newdel/delb3
			L+=/obj/releases/newdel/delb4
			L+=/obj/releases/newdel/del2b1
			L+=/obj/releases/newdel/del2b2
			L+=/obj/releases/newdel/del2b3
			L+=/obj/releases/newdel/del2b4
			L+=/obj/releases/newdel/del3b1
			L+=/obj/releases/newdel/del3b2
			L+=/obj/releases/newdel/del3b3
			L+=/obj/releases/newdel/del3b4
			L+=/obj/releases/newdel/del4b1
			L+=/obj/releases/newdel/del4b2
			L+=/obj/releases/newdel/del4b3
			L+=/obj/releases/newdel/del4b4
	/*	if(src.ressurectiontype=="Nell"&&src.ressurection==1)
			L-=weapon
			//L-=overshirt
			//L-=cloak
			L+=/obj/releases/Nel1
			L+=/obj/releases/Nel2
			L+=/obj/releases/Nel3
			L+=/obj/releases/NelToro*/
		if(src.stype == "Zaraki")
			if(src.inshikai)
				L-=weapon
				L+=/obj/Zanpakutou/ZaShikai1
				L+=/obj/Zanpakutou/ZaShikai2
				L+=/obj/Zanpakutou/ZaShikai3
				L+=/obj/Zanpakutou/ZaShikai4
				L+=/obj/Zanpakutou/ZaShikai5
				L+=/obj/Zanpakutou/ZaShikai6
				L+=/obj/Zanpakutou/ZaShikai7
				L+=/obj/Zanpakutou/ZaShikai8
				L+=/obj/Zanpakutou/ZaShikai9
				L += /obj/rage
				L += /obj/rage1
			if(src.inbankai&&!src.inberserk)
				L-=weapon
				L += /obj/aura/a1
				L += /obj/aura/a2
				L += /obj/aura/a3
				L += /obj/aura/a4
				L += /obj/aura/b1
				L += /obj/aura/b2
				L += /obj/aura/b3
				L += /obj/aura/b4
				L += /obj/aura/c1
				L += /obj/aura/c2
				L += /obj/aura/c3
				L += /obj/aura/c4
				L += /obj/aura/d1
				L += /obj/aura/d2
				L += /obj/aura/d3
				L += /obj/aura/d4
				L+=/obj/Zanpakutou/ZaShikai1
				L+=/obj/Zanpakutou/ZaShikai2
				L+=/obj/Zanpakutou/ZaShikai3
				L+=/obj/Zanpakutou/ZaShikai4
				L+=/obj/Zanpakutou/ZaShikai5
				L+=/obj/Zanpakutou/ZaShikai6
				L+=/obj/Zanpakutou/ZaShikai7
				L+=/obj/Zanpakutou/ZaShikai8
				L+=/obj/Zanpakutou/ZaShikai9
			if(src.inbankai&&src.inberserk)
				L += /obj/kenaura/a1
				L += /obj/kenaura/a2
				L += /obj/kenaura/a3
				L += /obj/kenaura/a4
				L += /obj/kenaura/a11
				L += /obj/kenaura/a21
				L += /obj/kenaura/a31
				L += /obj/kenaura/a41
				L += /obj/kenaura/a111
				L += /obj/kenaura/a211
				L += /obj/kenaura/a311
				L += /obj/kenaura/a411
				L += /obj/kenaura/a1111
				L += /obj/kenaura/a2111
		if(src.stype == "Rukia")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Rukia
				L -= weapon
		if(src.stype=="Pheonix")
			if(src.inshikai||src.inbankai)
				L+=/obj/Zanpakutou/Customzan/MidLeft
				L+=/obj/Zanpakutou/Customzan/MidMid
				L+=/obj/Zanpakutou/Customzan/MidRight
				L+=/obj/Zanpakutou/Customzan/TopLeft
				L+=/obj/Zanpakutou/Customzan/TopMid
				L+=/obj/Zanpakutou/Customzan/TopRight
				L+=/obj/Zanpakutou/Customzan/Aurabot
				L+=/obj/Zanpakutou/Customzan/Auramid
				L+=/obj/Zanpakutou/Customzan/Auratop
				L-=weapon
		if(src.stype=="Lightning")
			if(src.inshikai)
				L+=/obj/Zanpakutou/CCLeut
				L+=/obj/Zanpakutou/CCLeut2
				L-=weapon
			if(src.inbankai)
		//		L+=/obj/Zanpakutou/CCLeut
				L+=/obj/Zanpakutou/CCLeut2
				L+=/obj/Zanpakutou/CCLeut3
				L-=weapon
		if(src.stype == "Ichimaru")
			if(src.inshikai||src.inbankai)
				L -= weapon
				if(!src.extending)
					L += /obj/Zanpakutou/Shinsou
		if(src.stype == "Hisagi")
			if(src.inshikai)
				L += /obj/Zanpakutou/Hisagi
				L += /obj/Zanpakutou/Hisagi2
				L -= weapon
			if(src.inbankai)
				L += /obj/Zanpakutou/Hisagib
				L += /obj/Zanpakutou/Hisagi2b
				L -= weapon
		if(src.stype == "Renji")
			if(src.inshikai)
				L -= weapon
				if(!src.extending)
					L += /obj/Zanpakutou/Zabimaru
			if(src.inbankai)
				L+=/obj/Zanpakutou/Zabimaru_Bankai
				L+=/obj/renjiclothes
				L-=cloak
				L -= weapon
				L-=/obj/Zanpakutou/Zabimaru
				L+=/obj/zabimaru/body/b1
				L+=/obj/zabimaru/body/b2
				L+=/obj/zabimaru/body/b3
				L+=/obj/zabimaru/body/b4
				L+=/obj/zabimaru/body/b5
				L+=/obj/zabimaru/body/top/b1
				L+=/obj/zabimaru/body/top/b2
				L+=/obj/zabimaru/body/top/b3
				L+=/obj/zabimaru/body/top/b4
				L+=/obj/zabimaru/body/top/b5
				if(!src.extending)
					L+=/obj/zabimaru/body/up/b1
					L+=/obj/zabimaru/body/up/b2
					L+=/obj/zabimaru/body/up/b3
					L+=/obj/zabimaru/body/up/b4
					L+=/obj/zabimaru/body/up/b5
					L+=/obj/zabimaru/body/up/b6
					L+=/obj/zabimaru/body/up/b7
		if(src.stype == "Kira")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Kira
				L -= weapon
		if(src.stype == "Byakuya"||src.stype == "Rangiku")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Byakuya
				L -= weapon
		if(src.stype=="Byakuya")
			if(src.inshikai||src.inbankai)
				if(!src.senkei&&!src.safezone)
					L +=/obj/petalpieces/up
					L +=/obj/petalpieces/down
					L +=/obj/petalpieces/left
					L +=/obj/petalpieces/right
					L +=/obj/petalpieces/middle
		if(src.smoking)
			L +=/obj/smokepieces/up
			L +=/obj/smokepieces/down
			L +=/obj/smokepieces/left
			L +=/obj/smokepieces/right
			L +=/obj/smokepieces/mid
		if(src.senkei)
			L += /obj/Byakusword
		if(src.stype == "Hinamori")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Hinamori
				L -= weapon
		if(src.stype == "Ikkaku")
			if(src.inshikai)
				L += /obj/Zanpakutou/Ikkaku
				L -= weapon
			if(src.inbankai)
				L += /obj/nikkaku1
				L += /obj/nikkaku2
				L += /obj/nikkaku3
				L += /obj/nikkaku4
				L += /obj/nikkaku5
				L += /obj/nikkaku6
				if(src.rage>=12.5&&src.rage<15)
					L += /obj/nikkaku3d1
					L += /obj/nikkaku4d1
					L += /obj/nikkaku5d1
					L += /obj/nikkaku6d1
				if(src.rage>=15&&src.rage<17.5)
					L += /obj/nikkaku3d2
					L += /obj/nikkaku4d2
					L += /obj/nikkaku5d2
					L += /obj/nikkaku6d2
				if(src.rage>=17.5&&src.rage<20)
					L += /obj/nikkaku3d3
					L += /obj/nikkaku4d3
					L += /obj/nikkaku5d3
					L += /obj/nikkaku6d3
				if(src.rage>=20)
					L += /obj/nikkaku3d4
					L += /obj/nikkaku4d4
					L += /obj/nikkaku5d4
					L += /obj/nikkaku6d4
				L-=weapon
		if(src.stype == "Tousen")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Tousen
				L -= weapon
		if(src.stype == "Kensei")
			if(src.inshikai)
				L += /obj/Zanpakutou/Kensei
				L -= weapon
			if(src.inbankai)
				L += /obj/Zanpakutou/Kenseib
				L -= weapon
		if(src.stype == "Urahara")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Urahara
				L -= weapon
		if(src.trans10)
			L+=/obj/QuincyVandAura/BL
			L+=/obj/QuincyVandAura/BM
			L+=/obj/QuincyVandAura/BR
			L+=/obj/QuincyVandAura/ML
			L+=/obj/QuincyVandAura/M
			L+=/obj/QuincyVandAura/MR
			L+=/obj/QuincyVandAura/TL
			L+=/obj/QuincyVandAura/TM
			L+=/obj/QuincyVandAura/TR
		if(!src.trans10)
			L-=/obj/QuincyVandAura/BL
			L-=/obj/QuincyVandAura/BM
			L-=/obj/QuincyVandAura/BR
			L-=/obj/QuincyVandAura/ML
			L-=/obj/QuincyVandAura/M
			L-=/obj/QuincyVandAura/MR
			L-=/obj/QuincyVandAura/TL
			L-=/obj/QuincyVandAura/TM
			L-=/obj/QuincyVandAura/TR
		if(src.trans6)
			L+=/obj/VaiRageAura/BR
			L+=/obj/VaiRageAura/BL
			L+=/obj/VaiRageAura/TR
			L+=/obj/VaiRageAura/TL
		if(!src.trans6)
			L-=/obj/VaiRageAura/BR
			L-=/obj/VaiRageAura/BL
			L-=/obj/VaiRageAura/TR
			L-=/obj/VaiRageAura/TL
		if(src.stype == "Muramasa")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Muramasa
				L -= weapon
		if(src.stype == "Stinger")
			if(src.inshikai)
				L += /obj/Zanpakutou/Stinger
				L -= weapon
			if(src.inbankai)
				L += /obj/Zanpakutou/Torpedo
				L += /obj/Zanpakutou/Torpedo2
				L -= weapon
		if(src.stype == "Unohana")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Unohana
				L -= weapon
			if(src.inbankai)
				L += /obj/unohana/a1
				L += /obj/unohana/a2
				L += /obj/unohana/a3
				L += /obj/unohana/a4
				L += /obj/unohana/a5
				L += /obj/unohana/a6
				L += /obj/unohana/b1
				L += /obj/unohana/b2
				L += /obj/unohana/b3
				L += /obj/unohana/b4
				L += /obj/unohana/b5
				L += /obj/unohana/b6
				L += /obj/unohana/c1
				L += /obj/unohana/c2
				L += /obj/unohana/c3
				L += /obj/unohana/c4
				L += /obj/unohana/c5
				L += /obj/unohana/c6
				L += /obj/unohana/d1
				L += /obj/unohana/d2
				L += /obj/unohana/d3
				L += /obj/unohana/d4
				L += /obj/unohana/d5
				L += /obj/unohana/d6
				L += /obj/unohana/e1
				L += /obj/unohana/e2
				L += /obj/unohana/e3
				L += /obj/unohana/e4
				L += /obj/unohana/e5
				L += /obj/unohana/e6
				L += /obj/unohana/f1
				L += /obj/unohana/f2
				L += /obj/unohana/f3
				L += /obj/unohana/f4
				L += /obj/unohana/f5
				L += /obj/unohana/f6
		if(src.stype == "Ukitake")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Ukitake
				L -= weapon
		if(src.stype == "Ichigo")
			if(src.inshikai)
				L += /obj/Zanpakutou/Zangetsu/a1
				L += /obj/Zanpakutou/Zangetsu/a2
				L += /obj/Zanpakutou/Zangetsu/a3
				L += /obj/Zanpakutou/Zangetsu/a4
				L -= /obj/ichigoclothes
				L -= weapon
			if(src.inbankai)
				if(!src.isfgt)
					if(!src.inbankai2)
						L+=/obj/ichigoclothes
					if(src.inbankai2)
						L+=/obj/ichigoclothes2
					L-=cloak
					L-=/obj/Zanpakutou/Zangetsu
					L+=/obj/Zanpakutou/Tensa
					L -= weapon
					if(src.race=="Bankai")
						L-=/obj/ichigoclothes
		if(src.stype == "Yumichika")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Yumichika
				//if(src.inbankai)
				//	L += /obj/Zanpakutou/YumichikaGlow
				L -= weapon
		if(src.stype=="Fujimaru")
			if(src.inshikai)
				L+=/obj/Zanpakutou/Fujishikaiover
				L-=weapon
			if(src.inbankai)
				L+=/obj/Zanpakutou/Fujibankaiover
/*				L+=/obj/Zanpakutou/Susano1
				L+=/obj/Zanpakutou/Susano2
				L+=/obj/Zanpakutou/Susano3
				L+=/obj/Zanpakutou/Susano4
				L+=/obj/Zanpakutou/Susano5
				L+=/obj/Zanpakutou/Susano6*/
				L-=weapon
		if(src.stype=="Love")
			if(src.inshikai||src.inbankai)
				L+=/obj/Zanpakutou/Love
				L+=/obj/Zanpakutou/Love2
				L+=/obj/Zanpakutou/Love3
				L+=/obj/Zanpakutou/Love4
				L-=weapon
		if(src.stype == "Shonshui")
			if(src.inshikai||src.inbankai)
				//L += /obj/Zanpakutou/Shonshui
				L +=/obj/Zanpakutou/Shonshui2
				L +=/obj/Zanpakutou/Shonshui3
				L +=/obj/Zanpakutou/Shonshui4
				L +=/obj/Zanpakutou/Shonshui5
				L -= weapon
		if(src.stype == "Kaiens")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Kaien
				L -= weapon
		if(src.stype == "Mayuri")
			if(src.inshikai)
				L += /obj/Zanpakutou/Mayuri
				L -= weapon
			if(src.inbankai)
				L += /obj/Zanpakutou/Mayuri
				L -= weapon
				L += /obj/Zanpakutou/Mayuri/M1
				L += /obj/Zanpakutou/Mayuri/M2
				L += /obj/Zanpakutou/Mayuri/M3
				L += /obj/Zanpakutou/Mayuri/M4
				L += /obj/Zanpakutou/Mayuri/M5
				L += /obj/Zanpakutou/Mayuri/M6
				L += /obj/Zanpakutou/Mayuri/M7
				L += /obj/Zanpakutou/Mayuri/M8
				L += /obj/Zanpakutou/Mayuri/M9
		if(src.stype == "Yammamoto")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/RyuujinJakka
				L -= weapon
			if(src.inshikai)
				L += /obj/FireAura/a1
				L += /obj/FireAura/a2
				L += /obj/FireAura/a3
				L += /obj/FireAura/a4
			if(src.inbankai)
				L -= /obj/FireAura/a1
				L -= /obj/FireAura/a2
				L -= /obj/FireAura/a3
				L -= /obj/FireAura/a4
		if(src.stype == "Kommamaru")
			if(src.inbankai)
				/*L += /obj/Kbankai/k01
				L += /obj/Kbankai/k011
				L += /obj/Kbankai/k0111
				L += /obj/Kbankai/k01111
				L += /obj/Kbankai/k1
				L += /obj/Kbankai/k11
				L += /obj/Kbankai/k111
				L += /obj/Kbankai/k1111
				L += /obj/Kbankai/k21
				L += /obj/Kbankai/k211
				L += /obj/Kbankai/k2111
				L += /obj/Kbankai/k21111
				L += /obj/Kbankai/k31
				L += /obj/Kbankai/k311
				L += /obj/Kbankai/k3111
				L += /obj/Kbankai/k31111
				L += /obj/Kbankai/k41
				L += /obj/Kbankai/k411
				L += /obj/Kbankai/k4111
				L += /obj/Kbankai/k41111*/
				L +=/obj/Kban/a1
				L +=/obj/Kban/a2
				L +=/obj/Kban/a3
				L +=/obj/Kban/a4
				L +=/obj/Kban/b0
				L +=/obj/Kban/b1
				L +=/obj/Kban/b2
				L +=/obj/Kban/b3
				L +=/obj/Kban/b4
				L +=/obj/Kban/b5
				L +=/obj/Kban/c0
				L +=/obj/Kban/c1
				L +=/obj/Kban/c2
				L +=/obj/Kban/c3
				L +=/obj/Kban/c4
				L +=/obj/Kban/c5
				L +=/obj/Kban/d0
				L +=/obj/Kban/d1
				L +=/obj/Kban/d2
				L +=/obj/Kban/d3
				L +=/obj/Kban/d4
				L +=/obj/Kban/d5
				L +=/obj/Kban/e0
				L +=/obj/Kban/e1
				L +=/obj/Kban/e2
				L +=/obj/Kban/e3
				L +=/obj/Kban/e4
				L +=/obj/Kban/e5
				L +=/obj/Kban/f0
				L +=/obj/Kban/f1
				L +=/obj/Kban/f2
				L +=/obj/Kban/f3
				L +=/obj/Kban/f4
				L +=/obj/Kban/g2
				L +=/obj/Kban/g3
		if(src.stype == "Jiroubou")
			if(src.inshikai||src.inbankai)
				L += /obj/Zanpakutou/Jiroubou
				L -= weapon
				if(src.hs)
					L+= /obj/jiroaura
		if(src.stype == "Hitsugaya")
			if(src.inshikai)
				L += /obj/Zanpakutou/Toushi
			if(src.inbankai)
				L += /obj/Zanpakutou/Toushi
				L += /obj/hwings1
				L += /obj/hwings2
				L += /obj/hwings3
				L += /obj/hwings4
				L += /obj/hwings5
				L += /obj/hwings6
				L += /obj/hwings7
				L += /obj/hwings8
				L += /obj/hwings9
				L += /obj/hwings10
		if(src.hellon == 1)
			L -= weapon
			L += /obj/Hell/Hell_Armor
		if(src.armon == 1)
			L -= weapon
			L += /obj/Arm/Arm1
		if(src.armon == 2)
			L -= weapon
			L += /obj/Arm/Arm2
		if(src.armon == 3)
			L -= weapon
			L += /obj/Arm/Arm3
		if(src.armon == 4)
			L -= weapon
			L += /obj/Arm/Arm4
			L += /obj/Arm/Arm3
		if(src.lamuerte)
			L += /obj/SadoCharge
		if(src.directo||src.besar)
			L += 'eldirectocharge.dmi'
		if(src.sanrei)
			L += /obj/sanrei
		if(src.bowon&&!src.sanrei&&!src.spiritweapon)
			if(!src.seelsword)
				L += image('QuincyBow1V.dmi',,,MOB_LAYER+4)
		if(src.sanrei&&src.bowon&&!src.gotfinal2&&!src.spiritweapon)
			if(!src.seelsword)
				L += image('QuincyBow2V.dmi',,,MOB_LAYER+4)
		if(src.sanrei&&src.bowon&&src.gotfinal2&&!src.finalb&&!src.spiritweapon)
			L -= image('QuincyBow2V.dmi',,,MOB_LAYER+4)
			if(!src.seelsword)
				L += image('QuincyBow4V.dmi',,,MOB_LAYER+4)
		if(src.finalb && src.gotfinal2)
			L -= image('QuincyBow4V.dmi',,,MOB_LAYER+4)
			if(!src.seelsword&&!src.spiritweapon)
				L += image('QuincyBowFFV.dmi',,,MOB_LAYER+4)
			L += /obj/Wing/w1
			L += /obj/Wing/w2
		if(src.finalb && !src.gotfinal2)
			L += /obj/Wing/w1
			L += /obj/Wing/w2
		if(src.bowon&&src.spiritweapon==1)
			L += image('Guns2.dmi',,,MOB_LAYER+4)
		if(src.bowon&&src.spiritweapon==2)
			L += /obj/Seelesword
		if(src.seelsword)
			L += /obj/Seelesword
		if(src.inran)
			L += /obj/ran
		if(src.shunko)
			L += /obj/shunko
		if(!src.colorr&&src.ctf==2)
			L += /obj/blue
		if(src.colorr&&src.ctf==2)
			L += /obj/red
		if(src.flags=="blue")
			L += /obj/blueflag
		if(src.flags=="red")
			L += /obj/redflag
		if(src.in_team)
			L += /obj/gl
		if(src.tensat)
			L += /obj/Zanpakutou/Tensat
		if(src.infinal&&src.race!="Fullbringer")
			L -= weapon
			L += /obj/Zanpakutou/Final
			L += /obj/finalclothes
		if(src.smoking)
			src.overlays+=/obj/smokepieces/mid
			src.overlays+=/obj/smokepieces/up
			src.overlays+=/obj/smokepieces/down
			src.overlays+=/obj/smokepieces/right
			src.overlays+=/obj/smokepieces/left
		if(src.infull)
			L -= weapon
			if(src.ftype=="Fire Doll")
				L += /obj/Zanpakutou/FireBount/F1
				L += /obj/Zanpakutou/FireBount/F2
				L += /obj/Zanpakutou/FireBount/F3
				L += /obj/Zanpakutou/FireBount/F4
				L += /obj/Zanpakutou/FireBount/F5
			if(src.ftype=="Shishigawara")
				L+=weapon
			if(src.ftype=="Tsukishima")
				L += /obj/Zanpakutou/Tsukishima
			if(src.ftype=="Ginjo")
				L += /obj/Zanpakutou/Ginjo
			if(src.ftype=="Jackie"||src.ftype=="Yukio"||src.ftype=="Shishigawara")
				L+=weapon
			if(src.ftype=="Ichigo")
				L += /obj/Zanpakutou/Ichigo_F
				L += /obj/Zanpakutou/Ichigo_F2
				if(src.getsugaring>=150)
					L += /obj/fichigoclothes
					L -= /obj/Zanpakutou/Ichigo_F
					L -= /obj/Zanpakutou/Ichigo_F2
					L += /obj/Zanpakutou/Ichigo_F3
					L-= cloak
			if(src.ftype=="Water Doll")
				L += /obj/Zanpakutou/WaterDoll/F1
				L += /obj/Zanpakutou/WaterDoll/F2
				L += /obj/Zanpakutou/WaterDoll/F3
				L += /obj/Zanpakutou/WaterDoll/F4
				L += /obj/Zanpakutou/WaterDoll/F5
				L += /obj/Zanpakutou/WaterDoll/F6
				L += /obj/Zanpakutou/WaterDoll/F7
				L += /obj/Zanpakutou/WaterDoll/F8
				L += /obj/Zanpakutou/WaterDoll/F9
		if(src.inafull)
			L -= weapon
			if(src.ftype=="Shishigawara")
				L += weapon
			if(src.ftype=="Ichigo")
				L += /obj/weapon/sword
				L += /obj/fichigoclothes2
				L -= cloak
			if(src.ftype=="Ginjo")
				L += /obj/Zanpakutou/Ginjo2
				L += /obj/fichigoclothes2
			if(src.ftype=="Tsukishima")
				L += /obj/Zanpakutou/Tsukishima
			if(src.ftype=="Jackie")
				L += /obj/Zanpakutou/Jackie
			if(src.ftype=="Fire Doll")
				L += /obj/Zanpakutou/FireDoll/F1
				L += /obj/Zanpakutou/FireDoll/F2
				L += /obj/Zanpakutou/FireDoll/F3
				L += /obj/Zanpakutou/FireDoll/F4
				L += /obj/Zanpakutou/FireDoll/F5
				L += /obj/Zanpakutou/FireDoll/F6
				L += /obj/Zanpakutou/FireDoll/F7
				L += /obj/Zanpakutou/FireDoll/F8
				L += /obj/Zanpakutou/FireDoll/F9
			if(src.ftype=="Water Doll")
				L += /obj/Zanpakutou/WaterDoll/F1
				L += /obj/Zanpakutou/WaterDoll/F2
				L += /obj/Zanpakutou/WaterDoll/F3
				L += /obj/Zanpakutou/WaterDoll/F4
				L += /obj/Zanpakutou/WaterDoll/F5
				L += /obj/Zanpakutou/WaterDoll/F6
				L += /obj/Zanpakutou/WaterDoll/F7
				L += /obj/Zanpakutou/WaterDoll/F8
				L += /obj/Zanpakutou/WaterDoll/F9
			if(src.ftype=="Yukio")
				L+=weapon
				L += image('armband.dmi',,,MOB_LAYER+4)
		if(src.wound>=75)
			L += /obj/bloodybase
			L += /obj/bloodybase2
		if(src.wound>=100)
			L += /obj/bloodyneck
		if(src.goingress&&src.race=="Arrancar")
			L += /obj/auramess/a1
			L += /obj/auramess/a2
			L += /obj/auramess/a3
			L += /obj/auramess/a4
		if(src.tekkaion)
			src.overlays+=/obj/tekkaisado
		if(src.angeled)
			var/obj/il=new/obj
			il.icon=src.icon
			il.overlays=src.overlays
			il.pixel_x=10
			//il.icon-=rgb(0,0,0,100)
			src.overlays+=il
		/*if(src.arelease)
			src.Affirm_Icon()
			src.icon+=rgb(src.releasered,src.releasegreen,src.releaseblue,255)*/
			/*if(src.releasecolor=="Red")
				src.icon+=rgb(250,0,0,255)
			if(src.releasecolor=="Green")
				src.icon+=rgb(0,250,0,255)
			if(src.releasecolor=="Blue")
				src.icon+=rgb(0,0,250,255)
			if(src.releasecolor=="Yellow")
				src.icon+=rgb(250,250,0,255)
			if(src.releasecolor=="Purple")
				src.icon+=rgb(250,0,250,255)*/*/
obj
	shunko
		layer=16
		icon='Icons/quincyfinalmove.dmi'
		icon_state="shunko"
	ran
		layer=14
		icon='Icons/quincyfinalmove.dmi'
	Seelesword
		icon='Icons/Z_Seele.dmi'
		pixel_y=2
		layer=5
	Byakusword
		icon='Icons/byakuyabankaisword.dmi'
		layer=5
	redflag
		icon='Icons/red.dmi'
		icon_state="flag"
		layer=20
	blueflag
		icon='Icons/blue.dmi'
		icon_state="flag"
		layer=20
	red
		icon='Icons/red.dmi'
		layer=20
	blue
		icon='Icons/blue.dmi'
		layer=20