mob/Vaizardpick
	layer=6
	maskon=1
	plane=2
	maskuses=100
	plane=2
	picking=1
	Mask1
		New()
			..()
			src.HairGen()
	//		src.mask=1
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.weapon=/obj/weapon/sword
		//	src.Load_Overlays()
			src.overlays+=/obj/VisoredMasks/Mask1
		Click()
			if(istype(usr,/mob/player))
				switch(input(usr,"Do you want this mask!", text) in list ("Yes","No"))
					if("Yes")
						usr.mask=1
	Mask2
		New()
			..()
			src.HairGen()
		//	src.mask=2
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.weapon=/obj/weapon/sword
	//		src.Load_Overlays()
			src.overlays+=/obj/VisoredMasks/Mask2
		Click()
			if(istype(usr,/mob/player))
				switch(input(usr,"Do you want this mask!", text) in list ("Yes","No"))
					if("Yes")
						usr.mask=2
	Mask3
		New()
			..()
			src.HairGen()
	//		src.mask=3
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.weapon=/obj/weapon/sword
	//		src.Load_Overlays()
			src.overlays+=/obj/VisoredMasks/Mask3
		Click()
			if(istype(usr,/mob/player))
				switch(input(usr,"Do you want this mask!", text) in list ("Yes","No"))
					if("Yes")
						usr.mask=3
	Mask4
		New()
			..()
			src.HairGen()
		//	src.mask=4
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.weapon=/obj/weapon/sword
	//		src.Load_Overlays()
			src.overlays+=/obj/VisoredMasks/Mask4
		Click()
			if(istype(usr,/mob/player))
				switch(input(usr,"Do you want this mask!", text) in list ("Yes","No"))
					if("Yes")
						usr.mask=4
	Mask5
		New()
			..()
			src.HairGen()
	//		src.mask=5
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.weapon=/obj/weapon/sword
	//		src.Load_Overlays()
			src.overlays+=/obj/VisoredMasks/Mask5
		Click()
			if(istype(usr,/mob/player))
				switch(input(usr,"Do you want this mask!", text) in list ("Yes","No"))
					if("Yes")
						usr.mask=5
	Mask6
		New()
			..()
			src.HairGen()
	//		src.mask=6
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.weapon=/obj/weapon/sword
	//		src.Load_Overlays()
			src.overlays+=/obj/VisoredMasks/Mask6
		Click()
			if(istype(usr,/mob/player))
				switch(input(usr,"Do you want this mask!", text) in list ("Yes","No"))
					if("Yes")
						usr.mask=6
	Mask7
		New()
			..()
			src.HairGen()
	//		src.mask=8
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.weapon=/obj/weapon/sword
	//		src.Load_Overlays()
			src.overlays+=/obj/VisoredMasks/Mask7
		Click()
			if(istype(usr,/mob/player))
				switch(input(usr,"Do you want this mask!", text) in list ("Yes","No"))
					if("Yes")
						usr.mask=7
/*	Mask9
		New()
			..()
			src.HairGen()
			src.mask=9
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.weapon=/obj/weapon/sword
			src.Load_Overlays()
		Click()
			if(istype(usr,/mob/player))
				switch(input(usr,"Do you want this mask!", text) in list ("Yes","No"))
					if("Yes")
						usr.mask=9
	Mask12
		New()
			..()
			src.HairGen()
			src.mask=12
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.weapon=/obj/weapon/sword
			src.Load_Overlays()
		Click()
			if(istype(usr,/mob/player))
				switch(input(usr,"Do you want this mask!", text) in list ("Yes","No"))
					if("Yes")
						usr.mask=12
	Mask13
		New()
			..()
			src.HairGen()
			src.mask=13
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.weapon=/obj/weapon/sword
			src.Load_Overlays()
		Click()
			if(istype(usr,/mob/player))
				switch(input(usr,"Do you want this mask!", text) in list ("Yes","No"))
					if("Yes")
						usr.mask=13
	Mask14
		New()
			..()
			src.HairGen()
			src.mask=14
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.weapon=/obj/weapon/sword
			src.Load_Overlays()
		Click()
			if(istype(usr,/mob/player))
				switch(input(usr,"Do you want this mask!", text) in list ("Yes","No"))
					if("Yes")
						usr.mask=14
*/