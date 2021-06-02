obj/SantaHat
	icon='Icons/real santa hat.dmi'
	layer=MOB_LAYER+9
obj/ZerefVaiMask1
	icon='Icons/Ichigo Mask.dmi'
	layer=MOB_LAYER+9
obj/ZerefVaiMask2
	icon='Icons/Vaimaskorig.dmi'
	layer=MOB_LAYER+9
obj/MatiVaiMask
	icon='Icons/Vaizard mask1.dmi'
	layer=MOB_LAYER+9
	pixel_y=2
obj/ApolloVaiMask
	icon='Icons/Vaizard mask6.dmi'
	pixel_y=2
	layer=MOB_LAYER+9
obj/Floatingswordzan
	icon='Icons/floating sword zan.dmi'
	top2
		icon_state="5"
		pixel_y=32
	top
		icon_state="4"
		pixel_y=32
	left
		icon_state="1"
		pixel_x=32
	right
		icon_state="3"
		pixel_x=-32
obj/Shusuke
	layer=27
	b1
		icon='Icons/shusbotleft.dmi'
		pixel_y=-32
		pixel_x=-32
		layer=4
	b2
		icon='Icons/shusbotmid.dmi'
		pixel_y=-32
		layer=4
	b3
		icon='Icons/shusbotright.dmi'
		pixel_y=-32
		pixel_x=32
		layer=4
	b4
		icon='Icons/shushmidleft.dmi'
		pixel_x=-32
	b5
		icon='Icons/shushmidmid.dmi'
	b6
		icon='Icons/shushmidright.dmi'
		pixel_x=32
	b7
		icon='Icons/shushtopleft.dmi'
		pixel_y=32
		pixel_x=-32
	b8
		icon='Icons/shushtopmid.dmi'
		pixel_y=32
	b9
		icon='Icons/shushtopright.dmi'
		pixel_y=32
		pixel_x=32
	Shikai
		icon='Icons/Shusuke Shikai.dmi'
obj/swordfbfreeze
	icon='Icons/samurai bind.dmi'
	layer=65
	b1
		icon_state="0,0"
		pixel_x=-32
		layer=26
		pixel_y=1
	b2
		icon_state="1,0"
		layer=26
		pixel_y=1
	b3
		icon_state="2,0"
		pixel_x=32
		layer=26
		pixel_y=1
	b4
		icon_state="0,1"
		pixel_x=-32
		pixel_y=32
	b5
		icon_state="1,1"
		pixel_y=32
	b6
		icon_state="2,1"
		pixel_y=32
		pixel_x=32
	b7
		icon_state="0,2"
		pixel_y=64
		pixel_x=-32
	b8
		icon_state="1,2"
		pixel_y=64
	b9
		icon_state="2,2"
		pixel_y=64
		pixel_x=32
obj/Zanpakutou/swordfb
	layer=MOB_LAYER+5
	b1
		icon='Icons/sword fb bot left.dmi'
		pixel_y=-32
		pixel_x=-32
	b2
		icon='Icons/sword fb bot mid.dmi'
		pixel_y=-32
	b3
		icon='Icons/sword fb bot right.dmi'
		pixel_y=-32
		pixel_x=32
	b4
		icon='Icons/sword fb mid left.dmi'
		pixel_x=-32
	b5
		icon='Icons/sword fb mid mid.dmi'
	b6
		icon='Icons/sword fb mid right.dmi'
		pixel_x=32
	b7
		icon='Icons/sword fb top left.dmi'
		pixel_y=32
		pixel_x=-32
	b8
		icon='Icons/sword fb top mid.dmi'
		pixel_y=32
	b9
		icon='Icons/sword fb top right.dmi'
		pixel_y=32
		pixel_x=32


obj/Zanpakutou/fireswordnew
	layer=MOB_LAYER+5
	b1
		icon='Icons/firesword/sword fb bot left.dmi'
		pixel_y=-32
		pixel_x=-32
	b2
		icon='Icons/firesword/sword fb bot mid.dmi'
		pixel_y=-32
	b3
		icon='Icons/firesword/sword fb bot right.dmi'
		pixel_y=-32
		pixel_x=32
	b4
		icon='Icons/firesword/sword fb mid left.dmi'
		pixel_x=-32
	b5
		icon='Icons/firesword/sword fb mid mid.dmi'
	b6
		icon='Icons/firesword/sword fb mid right.dmi'
		pixel_x=32
	b7
		icon='Icons/firesword/sword fb top left.dmi'
		pixel_y=32
		pixel_x=-32
	b8
		icon='Icons/firesword/sword fb top mid.dmi'
		pixel_y=32
	b9
		icon='Icons/firesword/sword fb top right.dmi'
		pixel_y=32
		pixel_x=32


obj/Zanpakutou/awings
	layer=MOB_LAYER+5
	left
		icon='Icons/ApolloWingsL.dmi'
		pixel_x=-10
	right
		icon='Icons/ApolloWingsR.dmi'
		pixel_x=22
obj/Zanpakutou/swordfbaura
	icon='Icons/sword fb aura.dmi'
	layer=30
	topleft
		icon_state="0,1"
		pixel_y=32
		pixel_x=-16
	topright
		icon_state="1,1"
		pixel_y=32
		pixel_x=16
	botleft
		icon_state="0,0"
		pixel_x=-16
	botright
		icon_state="1,0"
		pixel_x=16



obj/Zanpakutou/wshgcfbaura
	icon='Icons/wshgcfb.dmi'
	layer=MOB_LAYER+1
	topleft
		icon_state="0,1"
		pixel_y=32
		pixel_x=-16
	topright
		icon_state="1,1"
		pixel_y=32
		pixel_x=16
	botleft
		icon_state="0,0"
		pixel_x=-16
	botright
		icon_state="1,0"
		pixel_x=16

obj/var
 worn=0
obj/gritz
	icon='Icons/silvergritz.dmi'
	layer=20
obj/blacktail
	icon='Icons/black tail.dmi'
	layer=12
obj/horns
	icon='Icons/horns.dmi'
	layer=12

obj/ShinjiEffect
	icon='Icons/shinji effect.dmi'
	layer=50
	density=0
	New()
		..()
		spawn(75)
			if(!isnull(src))
				src.loc=null
	Cross(atom/O)
		if(ismob(O))
			var/mob/m=O
			if(m!=src.Gowner)
				m.shinjiDissed()
		return 1
obj
 Hougyoku
		name = "Hougyoku"
		icon = 'Icons/Hougyoku.dmi'
		pixel_x=16
		pixel_y=-16
obj/QuincyVandAura
	icon='Icons/vand aura release.dmi'
//	layer=55
	layer=MOB_LAYER+12
	BL
		icon_state="0,0"
		pixel_x=-32
		pixel_y=-16
	BM
		icon_state="1,0"
		pixel_x=0
		pixel_y=-16
	BR
		icon_state="2,0"
		pixel_x=32
		pixel_y=-16
	ML
		icon_state="0,1"
		pixel_x=-32
		pixel_y=16
	M
		icon_state="1,1"
		pixel_x=0
		pixel_y=16
	MR
		icon_state="2,1"
		pixel_x=32
		pixel_y=16
	TL
		icon_state="0,2"
		pixel_y=48
		pixel_x=-32
	TM
		icon_state="1,2"
		pixel_x=0
		pixel_y=48
	TR
		icon_state="2,2"
		pixel_y=48
		pixel_x=32
obj/VaiRageAura
	icon='Icons/Uchiha Aura.dmi'
	layer=55
	BL
		icon_state="0,0"
		pixel_x=-16
	BR
		icon_state="1,0"
		pixel_x=16
	TL
		icon_state="0,1"
		pixel_y=32
		pixel_x=-16
	TR
		icon_state="1,1"
		pixel_y=32
		pixel_x=16

obj/Vandauranew
	icon='Icons/auravand.dmi'
	layer=MOB_LAYER+12
	BL
		icon_state="0,0"
		pixel_x=-16
	BR
		icon_state="1,0"
		pixel_x=16
	TL
		icon_state="0,1"
		pixel_y=32
		pixel_x=-16
	TR
		icon_state="1,1"
		pixel_y=32
		pixel_x=16

obj/Drain
	icon='Icons/Drain.dmi'
	layer=MOB_LAYER+7
	New()
		..()
		spawn(5)
		src.loc=null
obj/craters/rammed
	icon='Icons/craterseries.dmi'
	icon_state="crater"
	New()
		..()
		spawn(50)
		del src
obj/ko
	icon='Icons/ko.dmi'
	layer=MOB_LAYER+10
obj/deadlyslice
	icon='Icons/outrage.dmi'
	icon_state="deadly slice"
	layer=MOB_LAYER+10
	New()
		spawn(5)
		src.loc=null
obj/outrage
	icon='Icons/outrage.dmi'
	layer=MOB_LAYER+10
	New()
		flick("new",src)
		spawn(6)
		del src
obj/bloodyneck
	icon='Icons/bloods.dmi'
	icon_state="neck"
	layer=MOB_LAYER+10
obj
 gl
		icon = 'Icons/guildleader.dmi'
		pixel_y = 32

obj
			HalfVai
						icon = 'Icons/Vaizardon.dmi'
						icon_state = "1"
						layer = 124

obj
			HalfVaiOff
						icon = 'Icons/Vaizardon.dmi'
						icon_state = "2"
						layer = 125
obj/DarkBatB
	layer=13
	w1
		icon='Icons/ulquiorrawings.dmi'
		icon_state="1"
		pixel_x= -32
		pixel_y=2
	w2
		icon='Icons/ulquiorrawings.dmi'
		icon_state="2"
		pixel_x= 32
		pixel_y=2
	w3
		icon='Icons/ulquiorrawings.dmi'
		icon_state=""
		pixel_y=2
	DarkBatWhite
		icon='Icons/Dark Bat White.dmi'
		layer=MOB_LAYER+8
	RukiaRelease
		icon='Icons/rukiarelease.dmi'
		layer=MOB_LAYER+10

obj/DarkBatBW78999
	layer=13
	w1
		icon='Icons/wshgcwings.dmi'
		icon_state="1"
		pixel_x= -32
		pixel_y=2
	w2
		icon='Icons/wshgcwings.dmi'
		icon_state="2"
		pixel_x= 32
		pixel_y=2
	w3
		icon='Icons/wshgcwings.dmi'
		icon_state=""
		pixel_y=2


obj/DarkBatS
	Rukia
		icon='Icons/Z_Rukia.dmi'
		layer=MOB_LAYER+8


obj/Ulqwings
	layer=13
	w1
		icon='Icons/ulquiorrawings.dmi'
		icon_state="1"
		pixel_x= -32
		pixel_y=2
	w2
		icon='Icons/ulquiorrawings.dmi'
		icon_state="2"
		pixel_x= 32
		pixel_y=2
	w3
		icon='Icons/ulquiorrawings.dmi'
		icon_state=""
		pixel_y=2
obj
	byakuwings1
		icon='Icons/hakuteiken.dmi'
		icon_state="1"
		pixel_x= -32
obj
	byakuwings2
		icon='Icons/hakuteiken.dmi'
		icon_state="2"
		pixel_x= 32
obj
	hwings1
		icon='Icons/wings.dmi'
		icon_state="2,0"
		layer=MOB_LAYER+7
		pixel_x=0
		pixel_y=-14
	hwings2
		icon='Icons/wings.dmi'
		icon_state="1,0"
		layer=MOB_LAYER+7
		pixel_x=-32
		pixel_y=-14
	hwings3
		icon='Icons/wings.dmi'
		icon_state="0,0"
		layer=MOB_LAYER+7
		pixel_x=-64
		pixel_y=-14
	hwings4
		icon='Icons/wings.dmi'
		icon_state="3,0"
		layer=MOB_LAYER+7
		pixel_x=32
		pixel_y=-14
	hwings5
		icon='Icons/wings.dmi'
		icon_state="4,0"
		layer=MOB_LAYER+7
		pixel_x=64
		pixel_y=-14

	hwings6
		icon='Icons/wings.dmi'
		icon_state="2,1"
		layer=MOB_LAYER+7
		pixel_x=0
		pixel_y=18
	hwings7
		icon='Icons/wings.dmi'
		icon_state="1,1"
		layer=MOB_LAYER+7
		pixel_x=-32
		pixel_y=18
	hwings8
		icon='Icons/wings.dmi'
		icon_state="0,1"
		layer=MOB_LAYER+7
		pixel_x=-64
		pixel_y=18
	hwings9
		icon='Icons/wings.dmi'
		icon_state="3,1"
		layer=MOB_LAYER+7
		pixel_x=32
		pixel_y=18
	hwings10
		icon='Icons/wings.dmi'
		icon_state="4,1"
		layer=MOB_LAYER+7
		pixel_x=64
		pixel_y=18


