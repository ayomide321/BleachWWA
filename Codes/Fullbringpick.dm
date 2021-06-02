turf/Fullbringpick
	mouse_opacity=2
	layer=800
	Atk
		Click()
			if(istype(usr,/mob/player))
				switch(input(usr,"Do you want a random attack-based fullbring? (NOTE: You will exit this screen if you say Yes)", text) in list ("Yes","No"))
					if("Yes")
						usr.Pick_AtkFB()
						usr.gotshik=1
						usr.client.eye=usr.client.mob
	Rei
		Click()
			if(istype(usr,/mob/player))
				switch(input(usr,"Do you want a random reiatsu-based fullbring? (NOTE: You will exit this screen if you say Yes)", text) in list ("Yes","No"))
					if("Yes")
						usr.Pick_ReiFB()
						usr.gotshik=1
						usr.client.eye=usr.client.mob
	ReiDoll
		Click()
			if(istype(usr,/mob/player))
				switch(input(usr,"Do you want a random reiatsu-based Bount Doll? (NOTE: You will exit this screen if you say Yes)", text) in list ("Yes","No"))
					if("Yes")
						usr.Pick_ReiDoll()
						usr.gotshik=1
						usr.client.eye=usr.client.mob
	Inoues
		Click()
			if(istype(usr,/mob/player))
				switch(input(usr,"Do you want Inoue fullbring? (NOTE: You will exit this screen if you say Yes)", text) in list ("Yes","No"))
					if("Yes")
						usr.ftype="Inoue"
						usr.gotshik=1
						usr.client.eye=usr.client.mob
mob/Fullbringpick
	picking=1
	name="Fullbring Pick"
	uInoue
		New()
			..()
			src.infull=1
			src.HairGen()
			src.ClothesGen()
			src.ftype="Inoue"
			src.dir=SOUTH
			src.Load_Overlays()
			spawn(20)
			src.overlays+=/obj/inoueshield
		Click()
			if(istype(usr,/mob/player))
				usr.ftype="Inoue"
				switch(input(usr," Inoue. They can repel nearly every attack as well as heal and use fairies.(Defence based)", text) in list ("Yes","No"))
					if("Yes")
						usr.gotshik=1
	Inoue
		New()
			..()
			src.infull=1
			src.HairGen()
			src.ClothesGen()
			src.ftype="Inoue"
			src.Load_Overlays()
		Click()
			if(istype(usr,/mob/player))
				usr.ftype="Inoue"
				switch(input(usr," Inoue. They can repel nearly every attack as well as heal and use fairies.(Defence based)", text) in list ("Yes","No"))
					if("Yes")
						usr.gotshik=1
	uIchigo
		New()
			..()
			src.infull=1
			src.getsugaring=150
			src.HairGen()
			src.ClothesGen()
			src.ftype="Ichigo"
			src.dir=SOUTH
			src.Load_Overlays()
		Click()
			if(istype(usr,/mob/player))
				usr.ftype="Ichigo"
				switch(input(usr," Ichigo. He gets a cool looking sword and can shoot getsuga rings.(Reiatsu based)", text) in list ("Yes","No"))
					if("Yes")
						usr.gotshik=1
	Ichigo
		New()
			..()
			src.infull=1
			src.HairGen()
			src.ClothesGen()
			src.ftype="Ichigo"
			src.Load_Overlays()
		Click()
			if(istype(usr,/mob/player))
				usr.ftype="Ichigo"
				switch(input(usr," Ichigo. He gets a cool looking sword and can shoot getsuga rings.(Reiatsu based)", text) in list ("Yes","No"))
					if("Yes")
						usr.gotshik=1
	uTsukishima
		dir=NORTH
		New()
			..()
			src.weapon=/obj/weapon/fullbring/bookmark
			src.HairGen()
			src.ClothesGen()
			src.ftype="Tsukishima"
			src.Load_Overlays()
		Click()
			if(istype(usr,/mob/player))
				usr.ftype="Tsukishima"
				switch(input(usr," Tsukishima. He has the ability to place himself in someone's memory causing the enemy to feel empathy and not attack him.(Attack based)", text) in list ("Yes","No"))
					if("Yes")
						usr.gotshik=1
	Tsukishima
		New()
			..()
			src.infull=1
			src.HairGen()
			src.ClothesGen()
			src.ftype="Tsukishima"
			src.Load_Overlays()
		Click()
			if(istype(usr,/mob/player))
				usr.ftype="Tsukishima"
				switch(input(usr," Tsukishima. He has the ability to place himself in someone's memory causing the enemy to feel empathy and not attack him.(Attack based)", text) in list ("Yes","No"))
					if("Yes")
						usr.gotshik=1
	uGinjo
		New()
			..()
			src.weapon=/obj/weapon/fullbring/necklace
			src.HairGen()
			src.ClothesGen()
			src.ftype="Ginjo"
			src.Load_Overlays()
		Click()
			if(istype(usr,/mob/player))
				usr.ftype="Ginjo"
				switch(input(usr," Ginjo. He gets a great attack boost and can shoot a bright green blast.(Attack based)", text) in list ("Yes","No"))
					if("Yes")
						usr.gotshik=1
	Ginjo
		New()
			..()
			src.infull=1
			src.HairGen()
			src.ClothesGen()
			src.ftype="Ginjo"
			src.Load_Overlays()
		Click()
			if(istype(usr,/mob/player))
				usr.ftype="Ginjo"
				switch(input(usr," Ginjo. He gets a great attack boost and can shoot a bright green blast.(Attack based)", text) in list ("Yes","No"))
					if("Yes")
						usr.gotshik=1


	Samurai
		New()
			..()
			src.infull=1
			src.HairGen()
			src.ClothesGen()
			src.ftype="Samurai"
			src.Load_Overlays()
		Click()
			if(istype(usr,/mob/player))
				usr.ftype="Samurai"
				switch(input(usr," Samurai. He gets a great attack boost and defense boost and has amazing sword character..(Attack based)", text) in list ("Yes","No"))
					if("Yes")
						usr.gotshik=1

	Jackie
		New()
			..()
			src.infull=1
			src.weapon=/obj/weapon/fullbring/boots
			src.HairGen()
			src.ClothesGen()
			src.ftype="Jackie"
			src.Load_Overlays()
		Click()
			if(istype(usr,/mob/player))
				usr.ftype="Jackie"
				switch(input(usr," Jackie. The dirtier your boots get(more wounds you have) the higher your attack gets.(Attack based)", text) in list ("Yes","No"))
					if("Yes")
						usr.gotshik=1
	Yukio
		New()
			..()
			src.infull=1
			src.HairGen()
			src.ClothesGen()
			src.ftype="Yukio"
			src.Load_Overlays()
		Click()
			if(istype(usr,/mob/player))
				usr.ftype="Yukio"
				switch(input(usr," Yukio. He can make reality like a video game and he is the creator and can do anything in this game like create monsters delete profiles, etc.(Reiatsu based)", text) in list ("Yes","No"))
					if("Yes")
						usr.gotshik=1
turf/Fullbringpick
	layer=97
	Ichigo
		icon='Icons/F_Ichigo.dmi'
		icon_state="gui"
		Click()
			if(istype(usr,/mob/player))
				usr.ftype="Ichigo"
				switch(input(usr," Ichigo. He gets a cool looking sword and can shoot getsuga rings.(Reiatsu based)", text) in list ("Yes","No"))
					if("Yes")
						usr.gotshik=1
	Tsukishima
		icon='Icons/F_Bookmark.dmi'
		icon_state="gui"
		Click()
			if(istype(usr,/mob/player))
				usr.ftype="Tsukishima"
				switch(input(usr," Tsukishima. way. He has the ability to place himself in someone's memory causing the enemy to feel empathy and not attack him.(Attack based)", text) in list ("Yes","No"))
					if("Yes")
						usr.gotshik=1
	Ginjo
		icon='Icons/F_Necklace.dmi'
		icon_state="gui"
		Click()
			if(istype(usr,/mob/player))
				usr.ftype="Ginjo"
				switch(input(usr," Ginjo. He gets a great attack boost and can shoot a bright green blast.(Attack based)", text) in list ("Yes","No"))
					if("Yes")
						usr.gotshik=1
	Jackie
		icon='Icons/F_Boots.dmi'
		icon_state="gui"
		Click()
			if(istype(usr,/mob/player))
				usr.ftype="Jackie"
				switch(input(usr," Jackie. The dirtier your boots get(more wounds you have) the higher your attack gets.(Attack based)", text) in list ("Yes","No"))
					if("Yes")
						usr.gotshik=1
	Inoue
		icon='Icons/F_Hairpins.dmi'
		icon_state="gui"
		Click()
			if(istype(usr,/mob/player))
				usr.ftype="Inoue"
				switch(input(usr," Inoue. They can repel nearly every attack as well as heal and use fairies.(Defence based)", text) in list ("Yes","No"))
					if("Yes")
						usr.gotshik=1
	Yukio
		icon='Icons/F_Psp.dmi'
		Click()
			if(istype(usr,/mob/player))
				usr.ftype="Yukio"
				switch(input(usr,"Yukio. He can make reality like a video game and he is the creator and can do anything in this game like create monsters delete profile, etc.(Reiatsu based)", text) in list ("Yes","No"))
					if("Yes")
						usr.gotshik=1
		icon_state="gui"