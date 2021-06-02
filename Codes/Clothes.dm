obj/custom/orgsuit13
	icon='Icons/Organization XIII Cloak.dmi'
	layer=MOB_LAYER+1
obj/items/Seele_Schneider
	icon='Icons/gui.dmi'
	icon_state="seele"
	Use(var/mob/u)
		set hidden=1
		set category=null
		usr=u
		if(!usr.seelsword)
			if(usr.chosebex!=2)
				usr.seelsword=1
				usr.Load_Overlays()
				return

		if(usr.seelsword)
			usr.seelsword=0
			usr.Load_Overlays()
			return


	Click()
		Use(usr)
		..()
obj/items/Guilds/G1
	icon='Icons/gui.dmi'
	icon_state="guild"
	Use(var/mob/u)
		set hidden=1
		set category=null
		usr=u
		usr.Create_Guild(1)
	Click()
		Use(usr)
		..()
obj/items/Guilds/G2
	icon='Icons/gui.dmi'
	icon_state="guild"
	Use(var/mob/u)
		set hidden=1
		set category=null
		usr=u
		usr.Create_Guild(2)
	Click()
		Use(usr)
		..()
obj/items/Guilds/G3
	icon='Icons/gui.dmi'
	icon_state="guild"
	Use(var/mob/u)
		set hidden=1
		set category=null
		usr=u
		usr.Create_Guild(3)
	Click()
		Use(usr)
		..()
obj/items/Guilds/G4
	icon='Icons/gui.dmi'
	icon_state="guild"
	Use(var/mob/u)
		set hidden=1
		set category=null
		usr=u
		usr.Create_Guild(4)
	Click()
		Use(usr)
		..()
obj/items/Guilds/G5
	icon='Icons/gui.dmi'
	icon_state="guild"
	Use(var/mob/u)
		set hidden=1
		set category=null
		usr=u
		usr.Create_Guild(5)
	Click()
		Use(usr)
		..()
mob/var
	tmp/hougcd=0
obj/items/equipable/Hougyoku
	icon='Icons/gui.dmi'
	icon_state="houg"
	Use(var/mob/u)
		set hidden=1
		set category=null
		usr=u
		if(usr.evilgood=="Evil"&&usr.hougcd==0)
			if(!usr.gotonhoug)
				usr.gotonhoug=1
				usr.attack+=usr.mattack/2
				usr.defence+=usr.mdefence/2
				usr.reiatsu+=usr.mreiatsu/2
				usr.icon='Icons/Ashell.dmi'
				world<<"<b><font color=purple>The hougyoku accepts [usr.name]</b></font>"
				usr.hougcd=1
				spawn(300)
					usr.hougcd=0
				return

			if(usr.gotonhoug)
				usr<<"<b><font color=purple>Your hougyoku has been turned off!</b></font>"
				usr.gotonhoug=0
				usr.attack=usr.mattack
				usr.defence=usr.mdefence
				usr.reiatsu=usr.mreiatsu
				return


	Click()
		Use(usr)
		..()
mob/var/tmp
	dualwield=0
	firesworduse=0
	dualcd=0
	wearingsanta=0
	wearingmati=0
	wearingapollo=0
	wearingzeref1=0
	wearingzeref2=0

obj/items/equipable/DualZangetsu
	icon='Icons/gui.dmi'
	icon_state="dualzangetsu"
	Use(var/mob/u)
		set hidden=1
		set category=null
		usr=u
		if(usr.firesworduse)
			alert(usr,"You can't stack this with the Fire Sword.")
			return
		if(!usr.dualwield)
			usr.dualwield=1
			usr.attack+=55000//usr.mattack
			usr.defence+=55000//usr.mdefence
			usr.reiatsu+=55000//usr.mreiatsu
			usr.rundelay=0
			usr.overlays+='Icons/EndedZangetsus.dmi'
			usr <<"<b><font color=red>[usr.name] begins to wield two ominous blade</b></font>"
			usr.dualcd=1
			sleep(300)
			usr.dualcd=0
			return

		if(usr.dualwield)
			usr.dualwield=0
			usr.attack=usr.mattack
			usr.defence=usr.mdefence
			usr.reiatsu=usr.mreiatsu
			usr.overlays-='Icons/EndedZangetsus.dmi'
			return


	Click()
		Use(usr)
		..()



obj/items/equipable/FireSword
	icon='Icons/gui.dmi'
	icon_state="fiswordnew"
	Use(var/mob/u)
		set hidden=1
		set category=null
		usr=u
		if(usr.dualwield)
			alert(usr,"You can't stack this with Dual Zangetsu.")
			return
		if(!usr.firesworduse)
			usr.firesworduse=1
			usr.attack+=usr.mattack
			usr.defence+=usr.mdefence
			usr.reiatsu+=usr.mreiatsu
			usr.rundelay=0
			usr.Load_Overlays()
		//	usr.overlays+=/obj/Zanpakutou/RyuujinJakka
			usr <<"<b><font color=red>[usr.name] begins to wield the Fire Sword!</b></font>"
			usr.dualcd=1
			sleep(300)
			usr.dualcd=0
			return

		if(usr.firesworduse)
			usr.firesworduse=0
			usr.attack=usr.mattack
			usr.defence=usr.mdefence
			usr.reiatsu=usr.mreiatsu
			usr.Load_Overlays()
		//	usr.overlays-=/obj/Zanpakutou/RyuujinJakka
			return


	Click()
		Use(usr)
		..()



obj/Buy
	icon='Icons/gui.dmi'
	White
		icon_state="white guy"
		screen_loc = "7,14"
		Click()
			switch(input("Would you like to go through surgery to have this skin? Price:$400,000", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=400000)
						usr.money-=400000
						usr.icon_name="Base"
						usr.Affirm_Icon()
						usr<<"You got plastic surgery"
	Tan
		icon_state="tan guy"
		screen_loc = "8,14"
		Click()
			switch(input("Would you like to go through surgery to have this skin? Price:$400,000", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=400000)
						usr.money-=400000
						usr.icon_name="BaseTan"
						usr.Affirm_Icon()
						usr<<"You got plastic surgery"
	Black
		icon_state="black guy"
		screen_loc = "9,14"
		Click()
			switch(input("Would you like to go through surgery to have this skin? Price:$400,000", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=400000)
						usr.money-=400000
						usr.icon_name="BaseBlack"
						usr.Affirm_Icon()
						usr<<"You got plastic surgery"
	Pale
		icon_state="pale guy"
		screen_loc = "10,14"
		Click()
			switch(input("Would you like to go through surgery to have this skin? Price:$1,000,000", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=1000000)
						usr.money-=1000000
						usr.icon_name="Lost"
						usr.Affirm_Icon()
						usr<<"You got plastic surgery"
	Pure_Atk
		icon_state="pure atk"
		screen_loc = "7,14"
		Click()
			switch(input("Pure Atk, drains your reiatsu and defence and put it into attack for 20 seconds. Will you buy this for 90 event points?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.eventpoints>=90)
						usr.eventpoints-=90
						usr.contents+=new/obj/skillcard/Pure_Atk
						usr.RefreshSkillList()
						usr<<"You bought [src.name]"
	Pure_Def
		icon_state="pure def"
		screen_loc = "8,14"
		Click()
			switch(input("Pure Def, drains your attack and reiatsu and put it into defence for 20 seconds. Will you buy this for 90 event points?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.eventpoints>=90)
						usr.eventpoints-=90
						usr.contents+=new/obj/skillcard/Pure_Def
						usr.RefreshSkillList()
						usr<<"You bought [src.name]"
	Pure_Rei
		icon_state="pure rei"
		screen_loc = "9,14"
		Click()
			switch(input("Pure Rei, drains your attack and defence and put it into reiatsu for 20 seconds. Will you buy this for 90 event points?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.eventpoints>=90)
						usr.eventpoints-=90
						usr.contents+=new/obj/skillcard/Pure_Rei
						usr.RefreshSkillList()
						usr<<"You bought [src.name]"
	Sharingan
		icon_state="ssj"
		screen_loc = "10,14"
		Click()
			switch(input("Sharingan, gives 1.25x boost in all stats and boosts instincts and quick flash apssive by 5 . Will you buy this for 100 event points?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.eventpoints>=100)
						usr.eventpoints-=100
						usr.contents+=new/obj/skillcard/Sharingan
						usr.RefreshSkillList()
						usr<<"You bought [src.name]"
						usr.gotsharingan = 1
	Life_Contract
		icon_state="Life Contract"
		screen_loc = "11,14"
		Click()
			switch(input("Life Contract, If you are koed within 10 seconds your attacker will also get koed. Will you buy this for 45 event points?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.eventpoints>=45)
						usr.eventpoints-=45
						usr.contents+=new/obj/skillcard/Life_Contract
						usr.RefreshSkillList()
						usr<<"You bought [src.name]"
	Chip
		icon_state="clone spit"
		screen_loc = "4,14"
		Click()
			switch(input("Chip, allows you to store a character in a chip to challenge other chips.Will you buy this for 15 event points?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.eventpoints>=15)
						usr.eventpoints-=15
						usr.chip1=1
						usr<<"You bought [src.name], now go to the Chip Manager"
	Speed_Pill
		icon_state="speed pill"
		screen_loc = "5,14"
		Click()
			switch(input("Speed Pill, you will gain immense speed, temporarily.Will you buy this for 15 event points?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.eventpoints>=15)
						usr.eventpoints-=15
						usr.contents+=new/obj/items/usable/Events/Speed_Pill
						usr.updateInventory()
						usr<<"You bought [src.name]"
/*	Level_Points
		icon_state="+100"
		screen_loc = "6,14"
		Click()
			switch(input("This gives you 100 level points. Will you buy this for 20 event points(Goes away if you respec)?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.eventpoints>=20)
						usr.eventpoints-=20
						usr.contents+=new/obj/items/usable/Events/Level_Points
						usr<<"You bought [src.name]"	*/


	Level_Points
		icon_state="+100"
		screen_loc = "6,14"
		Click()
			var/msg=input("How many level points do you want to buy? 20 EP per 100","Level Points")as num
			if(msg<100)
				alert(usr,"100 Points minimum.")
				return
			if(msg>usr.eventpoints*5)
				alert(usr,"You don't have enough event points for the amount you entered.")
				return
			usr.levelpoints+=msg
			usr.eventpoints-=msg/5
			alert(usr,"You gained [msg] level points.")




	Awareness_Pill
		icon_state="awareness pill"
		screen_loc = "7,14"
		Click()
			switch(input("Awareness Pill, increases your quickflash and instinct passives by 25% for 20 seconds. Will you buy this for 8 event points?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.eventpoints>=3)
						usr.eventpoints-=3
						usr.contents+=new/obj/items/usable/Events/Awareness_Pill
						usr.updateInventory()
						usr<<"You bought [src.name]"
	Squad_4_Bandaid
		icon_state="bandaid"
		screen_loc = "8,14"
		Click()
			switch(input("Squad 4 Bandaid, heals 50 wounds. Will you buy this for 4 event points?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.eventpoints>=4)
						usr.eventpoints-=4
						usr.contents+=new/obj/items/usable/Events/Squad_4_Bandaid
						usr.updateInventory()
						usr<<"You bought [src.name]"
	Purple_Sprite
		icon_state="purple sprite"
		screen_loc = "9,14"
		Click()
			switch(input("Purple Sprite, gets you dizzy, but you can't feel anything, including damage. Will you buy this for 3 event points?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.eventpoints>=3)
						usr.eventpoints-=3
						usr.contents+=new/obj/items/usable/Events/Purple_Sprite
						usr.updateInventory()
						usr<<"You bought [src.name]"
	Rick_Ross_Meat
		icon_state="rick ross"
		screen_loc = "10,14"
		Click()
			switch(input("Rick Ross Meat, similar to Max Potion, but you get slower after using it. Will you buy this for 2 event points?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.eventpoints>=2)
						usr.eventpoints-=2
						usr.contents+=new/obj/items/usable/Events/Rick_Ross_Meat
						usr.updateInventory()
						usr<<"You bought [src.name]"
	Invisibility_Pill
		icon_state="invisibility pill"
		screen_loc = "11,14"
		Click()
			switch(input("Invisibility Pill, makes you invisible for 60 seconds. Will you buy this for 20 event points?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.eventpoints>=20)
						usr.eventpoints-=20
						usr.contents+=new/obj/items/usable/Events/Invisibility_Pill
						usr.updateInventory()
						usr<<"You bought [src.name]"
	Respec_Ticket
		icon_state="respec"
		screen_loc = "12,14"
		Click()
			switch(input("Respec Ticket, allows you one more respec. Will you buy this for 20 event points?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.eventpoints>=20)
						usr.eventpoints-=20
						usr.respectimes-=1
						usr<<"You can now get one more respec"
/*	DLC
		icon_state="dlc"
		screen_loc = "13,14"
		Click()
			switch(input("DLC, allows you to do bonus story missions which give you great rewards(You must be 98% or more through story). Will you buy this for 10 event points?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.eventpoints>=10)
						if(usr.storycom>=98)
							usr.eventpoints-=10
							usr.dlc=1
							usr<<"You must now talk to Yammamoto"*/
	Vai_Retake
		icon_state="VaiRetake"
		screen_loc = "14,14"
		Click()
			switch(input("This item will allow you to retake vaizard test. Will you buy this for $300,000, and 15 Event Points?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money < 300000 || usr.eventpoints < 15)
						alert(usr,"You don't have enough money or event points.")
						return 0
					if(usr.eventpoints>=15 && usr.money >=300000)
						usr.eventpoints-=15
						usr.money -=300000
						usr.contents+=new/obj/items/usable/Events/VaiRetake
						usr.updateInventory()
	Jacket
		icon_state="jacket"
		screen_loc = "3,14"
		Click()
			switch(input("Will you buy this for $2,000?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=2000)
						usr.money-=2000
						usr.contents+=new/obj/items/equipable/Armor/Jacket
						usr.updateInventory()
						usr<<"You bought [src.name]"
	Thin_Glasses
		icon_state="thin glasses"
		screen_loc = "4,14"
		Click()
			switch(input("Will you buy this for $2,000?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=2000)
						usr.money-=2000
						usr.contents+=new/obj/items/equipable/Glasses/Thin_Glasses
						usr<<"You bought [src.name]"
	Urahara_Hat
		icon_state="urahara hat"
		screen_loc = "5,14"
		Click()
			switch(input("Will you buy this for $2,000?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=2000)
						usr.money-=2000
						usr.contents+=new/obj/items/equipable/Armor/Urahara_Hat
						usr<<"You bought [src.name]"
	Byakuya_Scarf
		icon_state="scarf"
		screen_loc = "6,14"
		Click()
			switch(input("Will you buy this for $2,000?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=2000)
						usr.money-=2000
						usr.contents+=new/obj/items/equipable/Special/Scarf
						usr<<"You bought [src.name]"
	Blindfold
		icon_state="headband"
		screen_loc = "7,14"
		Click()
			switch(input("Will you buy this for $2,000?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=2000)
						usr.money-=2000
						usr.contents+=new/obj/items/equipable/Armor/Blindfold
						usr<<"You bought [src.name]"
	Kommamaru
		icon_state="kommamaruhelmet"
		screen_loc = "8,14"
		Click()
			switch(input("Will you buy this for $2,000?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=2000)
						usr.money-=2000
						usr.contents+=new/obj/items/equipable/Armor/Kommamaru
						usr<<"You bought [src.name]"
	Pants
		icon_state="pants"
		screen_loc = "13,14"
		Click()
			switch(input("Will you buy this for $2,000?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=2000)
						usr.money-=2000
						usr.contents+=new/obj/items/equipable/Legarmor/Shinigami1
						usr<<"You bought [src.name]"
	Shades
		icon='Icons/Shades.dmi'
		icon_state="gui"
		screen_loc = "14,14"
		Click()
			switch(input("Will you buy this for $2,000?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=2000)
						usr.money-=2000
						usr.contents+=new/obj/items/equipable/Glasses/Shades
						usr<<"You bought [src.name]"
	Glasses
		icon='Icons/Shades2.dmi'
		icon_state="gui"
		screen_loc = "15,14"
		Click()
			switch(input("Will you buy this for $2,000?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=2000)
						usr.money-=2000
						usr.contents+=new/obj/items/equipable/Glasses/Shades2
						usr<<"You bought [src.name]"
	Shirt
		icon_state="shirt"
		screen_loc = "12,14"
		Click()
			switch(input("Will you buy this for $30,000?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=30000)
						usr.money-=30000
						usr.contents+=new/obj/items/equipable/Shirt/Black
						usr<<"You bought [src.name]"
	Pants
		icon_state="pants"
		screen_loc = "14,14"
		Click()
			switch(input("Will you buy this for $20,000?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=20000)
						usr.money-=20000
						usr.contents+=new/obj/items/equipable/Pants/Black
						usr<<"You bought [src.name]"
	Chicken
		icon_state="chicken"
		screen_loc = "5,12"
		Click()
			switch(input("This will restore your health by 5,000. Will you buy this for $2,000?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=2000)
						usr.money-=2000
						usr.contents+=new/obj/items/usable/HP/Chicken
						usr<<"You bought [src.name]"
	Hamburger
		icon_state="hamburger"
		screen_loc = "6,12"
		Click()
			switch(input("This will restore your health by 20,000. Will you buy this for $6,000?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=6000)
						usr.money-=6000
						usr.contents+=new/obj/items/usable/HP/Hamburger
						usr<<"You bought [src.name]"
	Steak
		icon_state="steak"
		screen_loc = "8,12"
		Click()
			switch(input("This will completely restore your health. Will you buy this for $20,000?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=20000)
						usr.money-=20000
						usr.contents+=new/obj/items/usable/HP/Steak
						usr<<"You bought [src.name]"
	Turkey
		icon_state="turkey"
		screen_loc = "7,12"
		Click()
			switch(input("This will restore your health by 50,000. Will you buy this for $16,000?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=16000)
						usr.money-=16000
						usr.contents+=new/obj/items/usable/HP/Turkey
						usr<<"You bought [src.name]"
	Max_Potion
		icon_state="max potion"
		screen_loc = "9,12"
		Click()
			switch(input("This will completely restore your rei and health while recovering 20 wounds. Will you buy this for $40,000?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=30000)
						usr.money-=40000
						usr.contents+=new/obj/items/usable/Max_Potion
						usr<<"You bought [src.name]"
	Elixir
		icon_state="elixir"
		screen_loc = "11,12"
		Click()
			switch(input("This will restore your rei by 4,000. Will you buy this for $3,000?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=3000)
						usr.money-=3000
						usr.contents+=new/obj/items/usable/REI/Elixir
						usr<<"You bought [src.name]"
	Potion
		icon_state="potion"
		screen_loc = "12,12"
		Click()
			switch(input("This will completely restore your rei. Will you buy this for $5,000?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=5000)
						usr.money-=5000
						usr.contents+=new/obj/items/usable/REI/Potion
						usr<<"You bought [src.name]"
	Soda
		icon_state="soda"
		screen_loc = "10,12"
		Click()
			switch(input("This will restore your rei by 1,000. Will you buy this for $1,000?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=1000)
						usr.money-=1000
						usr.contents+=new/obj/items/usable/REI/Soda
						usr<<"You bought [src.name]"
	Bandage
		icon_state="bandage"
		screen_loc = "13,12"
		Click()
			switch(input("This will recover 20 wounds. Will you buy this for $30,000?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.money>=30000)
						usr.money-=30000
						usr.contents+=new/obj/items/usable/Bandage
						usr<<"You bought [src.name]"
	Beer
		icon_state="beer"
		screen_loc = "8,12"
		Click()
			switch(input("This gives you a 1.5X boost in all stats and it heals 50% of your health and rei while also healing 5 wounds. Side Effects: Slower speed, Can't remember what happened, can't control movements, blurred vision, can't use techniques, pass out, may heal 100% health and lose all rei, get drunken rage.. Will you buy this for $10,000?(Fullbringers get this 50% off)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.race=="Fullbringer")
						if(usr.money>=15000)
							usr.money-=15000
							usr.contents+=new/obj/items/usable/Beer
							usr<<"You bought [src.name]"
							return
					if(usr.money>=30000)
						usr.money-=30000
						usr.contents+=new/obj/items/usable/Beer
						usr<<"You bought [src.name]"

mob/proc
	Uses()
		..()
obj
	ichigoclothes
		layer=MOB_LAYER+4
		icon='Icons/ichigobankai.dmi'
	ichigoclothes2
		layer=MOB_LAYER+4
		icon='Icons/NEW ichigo 2.dmi'
	fichigoclothes
		layer=MOB_LAYER+4
		icon='Icons/F_IchigoSuit.dmi'
	fichigoclothes2
		layer=MOB_LAYER+4
		icon='Icons/F_IchigoSuit2new.dmi'
	wshgccustaura
		layer=MOB_LAYER+4
		icon='Icons/wshgcaura.dmi'
		icon_state=""
	maycustte
	//	layer=MOB_LAYER+4
		layer=MOB_LAYER+4
		icon='Icons/testmay.dmi'
	QuincyVandAura
		layer=MOB_LAYER+4
		icon='Icons/vand aura release.dmi'
		icon_state=""
obj
	finalclothes
		layer=MOB_LAYER+4
		icon='Icons/finalgetsuga.dmi'
obj/special
	scarf
		layer=MOB_LAYER+4
		icon='Icons/Byakuya Scarf.dmi'
obj
	renjiclothes
		layer=MOB_LAYER+4
		//icon='Icons/renjicloth.dmi'
obj
	releases
		layer=MOB_LAYER+3
		Zommari
			icon='Icons/Zommari Ress.dmi'
		Halibel
			icon='Icons/Z_Halibels.dmi'
		Nell1
			icon='Icons/Nell10.dmi'
			icon_state="Horse ass bottom W"
			pixel_x=32
			pixel_y=-32
		Nell2
			icon='Icons/Nell10.dmi'
			icon_state="Horse ass bottom E"
			pixel_x=-32
			pixel_y=-32
		Nell3
			icon='Icons/Nell10.dmi'
			icon_state="Horse ass W"
			pixel_x=32
		Nell4
			icon='Icons/Nell10.dmi'
			icon_state="Horse ass E"
			pixel_x=-32
		Nell5
			icon='Icons/Nell10.dmi'
			icon_state="legs"
			pixel_y=-32
		Nell6
			icon='Icons/Nell10.dmi'
			icon_state=""
		Dordoni1
			icon='Icons/wind.dmi'
			icon_state="1"
			pixel_x=26
		Dordoni2
			icon='Icons/wind.dmi'
			icon_state="1"
			pixel_x=-26
		Dordoni3
			icon='Icons/wind.dmi'
			icon_state="2"
			pixel_x=26
			pixel_y=32
		Dordoni4
			icon='Icons/wind.dmi'
			icon_state="2"
			pixel_x=-26
			pixel_y=32
		Szayel1
			icon='Icons/szayel2.dmi'
			pixel_x=-32
		Szayel2
			icon='Icons/szayel.dmi'
		Szayel3
			icon='Icons/szayel3.dmi'
			pixel_x=32
		Wonder1
			icon='Icons/SlimsWonderweiiss.dmi'
			icon_state="0,0"
		Wonder2
			icon='Icons/SlimsWonderweiiss.dmi'
			icon_state="0,1"
			pixel_y=32
		Wonder3
			icon='Icons/SlimsWonderweiiss.dmi'
			icon_state="0,2"
			pixel_y=64
		Skeleton
			icon='Icons/barragan4.dmi'
		Skeleton1
			icon='Icons/barragan3.dmi'
			pixel_x=-32
		Skeleton2
			icon='Icons/barragan2.dmi'
			pixel_x=32
		YammyRessIcon
			yam00
				icon='Icons/yam00.dmi'
				pixel_x=-80
				pixel_y=-32
				layer=10
			yam01
				icon='Icons/yam10.dmi'
				pixel_x=-48
				pixel_y=-32
				layer=10
			yam02
				icon='Icons/yam20.dmi'
				pixel_x=-16
				pixel_y=-32
				layer=10
			yam03
				icon='Icons/yam30.dmi'
				pixel_x=16
				pixel_y=-32
				layer=10
			yam04
				icon='Icons/yam40.dmi'
				pixel_x=48
				pixel_y=-32
				layer=10
			yam05
				icon='Icons/yam50.dmi'
				pixel_x=80
				pixel_y=-32
				layer=10
			yam10
				icon='Icons/yam01.dmi'
				pixel_x=-80
				layer=10
			yam11
				icon='Icons/yam11.dmi'
				pixel_x=-48
				layer=10
			yam12
				icon='Icons/yam21.dmi'
				pixel_x=-16
				layer=10
			yam13
				icon='Icons/yam31.dmi'
				pixel_x=16
				layer=10
			yam14
				icon='Icons/yam41.dmi'
				pixel_x=48
				layer=10
			yam15
				icon='Icons/yam51.dmi'
				pixel_x=80
				layer=10
			yam20
				icon='Icons/yam02.dmi'
				pixel_x=-80
				pixel_y=32
				layer=10
			yam21
				icon='Icons/yam12.dmi'
				pixel_x=-48
				pixel_y=32
				layer=10
			yam22
				icon='Icons/yam22.dmi'
				pixel_x=-16
				pixel_y=32
				layer=10
			yam23
				icon='Icons/yam32.dmi'
				pixel_x=16
				pixel_y=32
				layer=10
			yam24
				icon='Icons/yam42.dmi'
				pixel_x=48
				pixel_y=32
				layer=10
			yam25
				icon='Icons/yam52.dmi'
				pixel_x=80
				pixel_y=32
				layer=10
			yam30
				icon='Icons/yam03.dmi'
				pixel_x=-80
				pixel_y=64
				layer=10
			yam31
				icon='Icons/yam13.dmi'
				pixel_x=-48
				pixel_y=64
				layer=10
			yam32
				icon='Icons/yam23.dmi'
				pixel_x=-16
				pixel_y=64
				layer=10
			yam33
				icon='Icons/yam33.dmi'
				pixel_x=16
				pixel_y=64
				layer=10
			yam34
				icon='Icons/yam43.dmi'
				pixel_x=48
				pixel_y=64
				layer=10
			yam35
				icon='Icons/yam53.dmi'
				pixel_x=80
				pixel_y=64
				layer=10
			yam40
				icon='Icons/yam04.dmi'
				pixel_x=-80
				pixel_y=96
				layer=10
			yam41
				icon='Icons/yam14.dmi'
				pixel_x=-48
				pixel_y=96
				layer=10
			yam42
				icon='Icons/yam24.dmi'
				pixel_x=-16
				pixel_y=96
				layer=10
			yam43
				icon='Icons/yam34.dmi'
				pixel_x=16
				pixel_y=96
				layer=10
			yam44
				icon='Icons/yam44.dmi'
				pixel_x=48
				pixel_y=96
				layer=10
			yam45
				icon='Icons/yam54.dmi'
				pixel_x=80
				pixel_y=96
				layer=10
			yam50
				icon='Icons/yam05.dmi'
				pixel_x=-80
				pixel_y=128
				layer=10
			yam51
				icon='Icons/yam15.dmi'
				pixel_x=-48
				pixel_y=128
				layer=10
			yam52
				icon='Icons/yam25.dmi'
				pixel_x=-16
				pixel_y=128
				layer=10
			yam53
				icon='Icons/yam35.dmi'
				pixel_x=16
				pixel_y=128
				layer=10
			yam54
				icon='Icons/yam45.dmi'
				pixel_x=48
				pixel_y=128
				layer=10
			yam55
				icon='Icons/yam55.dmi'
				pixel_x=80
				pixel_y=128
				layer=10
		Agui1
			icon='Icons/aguleft.dmi'
			pixel_x=-32
			layer=10
		Agui2
			icon='Icons/agumid.dmi'
		Agui3
			icon='Icons/aguright.dmi'
			layer=10
		newdel
			delb1
				icon='Icons/delb1.dmi'
				pixel_x=-48
				pixel_y=-16
			delb2
				icon='Icons/delb2.dmi'
				pixel_x=-16
				pixel_y=-16
			delb3
				icon='Icons/delb3.dmi'
				pixel_x=16
				pixel_y=-16
			delb4
				icon='Icons/delb4.dmi'
				pixel_x=48
				pixel_y=-16
			del2b1
				icon='Icons/del2b1.dmi'
				pixel_x=-48
				pixel_y=16
				layer=70
			del2b2
				icon='Icons/del2b2.dmi'
				pixel_x=-16
				pixel_y=16
				layer=70
			del2b3
				icon='Icons/del2b3.dmi'
				pixel_x=16
				pixel_y=16
				layer=70
			del2b4
				icon='Icons/del2b4.dmi'
				pixel_x=48
				pixel_y=16
				layer=70
			del3b1
				icon='Icons/del3b1.dmi'
				pixel_x=-48
				pixel_y=48
				layer=70
			del3b2
				icon='Icons/del3b2.dmi'
				pixel_x=-16
				pixel_y=48
				layer=70
			del3b3
				icon='Icons/del3b3.dmi'
				pixel_x=16
				pixel_y=48
				v
			del3b4
				icon='Icons/del3b4.dmi'
				pixel_x=48
				pixel_y=48
				layer=70
			del4b1
				icon='Icons/del4b1.dmi'
				pixel_x=-48
				pixel_y=80
				layer=70
			del4b2
				icon='Icons/del4b2.dmi'
				pixel_x=-16
				pixel_y=80
				layer=70
			del4b3
				icon='Icons/del4b3.dmi'
				pixel_x=16
				pixel_y=80
				layer=70
			del4b4
				icon='Icons/del4b4.dmi'
				pixel_x=48
				pixel_y=80
				layer=70
		Del1
			icon='Icons/del toro4.dmi'
			pixel_x=16
			pixel_y=16
		Del2
			icon='Icons/del toro3.dmi'
			pixel_x=-16
			pixel_y=16
		Del3
			icon='Icons/del toro2.dmi'
			pixel_x=16
			pixel_y=-16
		DelToro
			icon='Icons/del toro1.dmi'
			pixel_x=-16
			pixel_y=-16
			New()
				new/obj/releases/Del1(locate(src.x,src.y,src.z))
				new/obj/releases/Del2(locate(src.x,src.y,src.z))
				new/obj/releases/Del3(locate(src.x,src.y,src.z))
				..()
	/*	Nel1
			icon='Icons/Nell4.dmi'
			pixel_x=16
			pixel_y=16
		Nel2
			icon='Icons/Nell3.dmi'
			pixel_x=-16
			pixel_y=16
		Nel3
			icon='Icons/Nell2.dmi'
			pixel_x=16
			pixel_y=-16
		NelToro
			icon='Icons/Nell1.dmi'
			pixel_x=-16
			pixel_y=-16*/
		Volcanica
			icon='Icons/Volcanica.dmi.dmi'
		Tijereta
			icon='Icons/tijeretanewold.dmi'
		Luppi
			icon='Icons/luppi.dmi'
		Agui1
			icon='Icons/aguleft.dmi'
			pixel_x=-32
			layer=10
		Agui2
			icon='Icons/agumid.dmi'
		Agui3
			icon='Icons/aguright.dmi'
			layer=35
			pixel_x=32
			layer=10
		Dragon
			icon='Icons/dragon.dmi'
		DragonL
			icon='Icons/dragon.dmi'
			icon_state="Tail W"
			pixel_x=32
		DragonR
			icon='Icons/dragon.dmi'
			icon_state="Tail E"
			pixel_x=-32
		Pantera
			pixel_y=0
			icon='Icons/Grimm.dmi'

obj/weapon/sword
	layer=MOB_LAYER+6
	icon='Icons/Zanpaktou2.dmi'
obj/weapon/fullbring
	bookmark
		layer=MOB_LAYER+6
		icon='Icons/F_Bookmark.dmi'
	boots
		layer=MOB_LAYER+6
		icon='Icons/F_Boots.dmi'
	necklace
		layer=MOB_LAYER+6
		icon='Icons/F_Necklace.dmi'
	psp
		layer=MOB_LAYER+6
		icon='Icons/F_Psp.dmi'
		pixel_y=2
	combatpass
		layer=MOB_LAYER+6
		icon='Icons/F_CombatPass.dmi'
		pixel_y=2
	hairpins
		layer=MOB_LAYER+6
		icon='Icons/F_Hairpins.dmi'
	knuckles
		layer=MOB_LAYER+6
		icon='Icons/F_Lucky.dmi'
		pixel_y=2
obj/cloak/espada
	layer=MOB_LAYER+3
	e1
		icon='Icons/espadasuit.dmi'
	e2
		icon='Icons/espadasuit2.dmi'
obj/cloak/captain
	layer=MOB_LAYER+3
	pixel_y=2
	c1
		icon='Icons/captainsuit.dmi'
	c2
		icon='Icons/captainsuit2.dmi'
	c3
		icon='Icons/Squad0.dmi'
obj/facearmor
	layer=MOB_LAYER+5
	s1
		icon='Icons/blindfold.dmi'
	s3
		icon='Icons/kommamaruhelmet.dmi'
	s6
		icon='Icons/blindfold.dmi'
	s7
		icon='Icons/Urahara hat.dmi'
	s8
		icon='Icons/hat drop shunsui.dmi'
obj/glasses
	layer=MOB_LAYER+4
	g1
		icon='Icons/Shades.dmi'
	g2
		icon='Icons/Shades2.dmi'
	g3
		icon='Icons/thin glasses.dmi'
obj/armor
	layer=MOB_LAYER+4
	j1
		icon='Icons/Jacket.dmi'
obj/legarmor
	layer=MOB_LAYER+2
	l1
		icon='Icons/shinigamisuit.dmi'
obj/Halloween
	layer=MOB_LAYER+6
	Top
		icon='Icons/reaper2.dmi'
		pixel_y=32
	Bot
		icon='Icons/reaper1.dmi'

obj/overshirt/shinigami
	layer=MOB_LAYER+2
	s1
		icon='Icons/shinigamisuit.dmi'
	s2
		icon='Icons/shinigamisuit2.dmi'
	s3
		icon='Icons/Organization XIII Cloak.dmi'
obj/overshirt/quincy
	layer=MOB_LAYER+2
	s1
		icon='Icons/quincysuit2.dmi'
obj/pants
	layer=MOB_LAYER+1
	black
		icon='Icons/BleachPants.dmi'
obj/items
	layer=MOB_LAYER+100
	proc
		Use()
			..()
obj/items/readable//scrolls,map,guide,etc
	Mission_Scroll
		icon='Icons/gui.dmi'
		icon_state="mission scroll"
		Click()
			if(istype(usr,/mob/player))
				var/mob/M
				for(var/mob/XE in world)
					if(XE==usr.missiontarget)//||XE==usr.dmission)
						M=XE

				if(M)
					var/Xicon_state=""

					var/filename="player__"
					var/icon/I=icon('BlankBase.dmi') //blank.dmi contains one state: a blank icon_state. maybe a background icon
					filename+="_[M.icon]_[Xicon_state]___"
					if(M.icon)
						I.Blend(icon(M.icon,Xicon_state),ICON_OVERLAY)
					for(var/X in M.overlays)
						if(X && X:icon)
							I.Blend(icon(X:icon,Xicon_state),ICON_OVERLAY)
							filename+="[X:icon]_[Xicon_state]__"
					filename+=".png"
					filename=Replace(filename,"/","_")


					var/T={"<font size = 1><font face=Courier><Center><STYLE>BODY {background: black; color: white}</STYLE>
					<table border=1 cellspacing=10><html><body text=white link=white vlink=white alink=white>""}
					T+="<tr><td>Target</td><td>Rank</td><td>Description</td><td>Location</td><br></tr>"
					usr<<browse_rsc(I, filename)
					T+={"<tr><td><img src="[filename]">:[usr.missiontarget]</td><td>[usr.missionclass]</td><td>[usr.mscroll]</td><td>[M.Where()]</td></tr>"}
					winshow(usr, "browser-popup", 1)
					usr << browse(T)
				else
					var/T={"<font size = 1><font face=Courier><Center><STYLE>BODY {background: black; color: white}</STYLE>
					<table border=1 cellspacing=10><html><body text=white link=white vlink=white alink=white>""}
					T+="<tr><td>Rank</td><td>Description</td><td>Location</td><br></tr>"
					T+={"<tr><td>[usr.missionclass]</td><td>[usr.mscroll]</td><td>[usr.mlocation]</td></tr>"}
					winshow(usr, "browser-popup", 1)
					usr << browse(T)
obj/items/usable
	layer=MOB_LAYER+100
	Chests
		icon='Icons/chest.dmi'
		Generic_Chest
			icon_state="generic"
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				if(usr in view(1,src))
					usr.Generic()

					src.stacked--
					if(src.stacked<=0)
						del(src)


			Click()
				Use(usr)
				..()
		Medium_Chest
			icon_state="medium"
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				if(usr in view(1,src))
					usr.Medium()

					src.stacked--
					if(src.stacked<=0)
						del(src)


			Click()
				Use(usr)
				..()
		Dungeon1R1Chest
			icon = 'Icons/chest colors boss.dmi'
			icon_state="red"
			pixel_x=-16
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				usr.DungeonR1()

				src.stacked--
				if(src.stacked<=0)
					del(src)
				for(var/mob/player/X in world)
					if(X.dteamid==usr.dteamid)
						X.DungeonR1()
			Click()
				Use(usr)
				..()

		Dungeon1R2Chest
			icon = 'Icons/chest colors boss.dmi'
			icon_state="purple"
			pixel_x=-16
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				usr.DungeonR2()

				src.stacked--
				if(src.stacked<=0)
					del(src)
				for(var/mob/player/X in world)
					if(X.dteamid==usr.dteamid)
						X.DungeonR2()
			Click()
				Use(usr)
				..()

		Dungeon1R3Chest
			icon = 'Icons/chest colors boss.dmi'
			icon_state="orange"
			pixel_x=-16
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				usr.DungeonR3()

				src.stacked--
				if(src.stacked<=0)
					del(src)
				for(var/mob/player/X in world)
					if(X.dteamid==usr.dteamid)
						X.DungeonR3()
			Click()
				Use(usr)
				..()
		Dungeon2R1Chest
			icon = 'Icons/chest colors boss.dmi'
			icon_state="red"
			pixel_x=-16
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				usr.DungeonR1()

				src.stacked--
				if(src.stacked<=0)
					del(src)
				for(var/mob/player/X in world)
					if(X.dteamid==usr.dteamid)
						usr.DungeonR1()
			Click()
				Use(usr)
				..()

		Dungeon2R2Chest
			icon = 'Icons/chest colors boss.dmi'
			icon_state="purple"
			pixel_x=-16
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				usr.DungeonR2()

				src.stacked--
				if(src.stacked<=0)
					del(src)
				for(var/mob/player/X in world)
					if(X.dteamid==usr.dteamid)
						usr.DungeonR2()
			Click()
				Use(usr)
				..()
		Dungeon2R3Chest
			icon = 'Icons/chest colors boss.dmi'
			icon_state="orange"
			pixel_x=-16
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				usr.DungeonR3()

				src.stacked--
				if(src.stacked<=0)
					del(src)
				for(var/mob/player/X in world)
					if(X.dteamid==usr.dteamid)
						usr.DungeonR3()
			Click()
				Use(usr)
				..()
		Dungeon3R1Chest
			icon = 'Icons/chest colors boss.dmi'
			icon_state="red"
			pixel_x=-16
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				usr.DungeonR1()

				src.stacked--
				if(src.stacked<=0)
					del(src)
				for(var/mob/player/X in world)
					if(X.dteamid==usr.dteamid)
						usr.DungeonR1()
			Click()
				Use(usr)
				..()

		Dungeon3R2Chest
			icon = 'Icons/chest colors boss.dmi'
			icon_state="purple"
			pixel_x=-16
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				usr.DungeonR2()

				src.stacked--
				if(src.stacked<=0)
					del(src)
				for(var/mob/player/X in world)
					if(X.dteamid==usr.dteamid)
						usr.DungeonR2()
			Click()
				Use(usr)
				..()
		Dungeon3R3Chest
			icon = 'Icons/chest colors boss.dmi'
			icon_state="orange"
			pixel_x=-16
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				usr.DungeonR3()

				src.stacked--
				if(src.stacked<=0)
					del(src)
				for(var/mob/player/X in world)
					if(X.dteamid==usr.dteamid)
						usr.DungeonR3()
			Click()
				Use(usr)
				..()
		Rare_Chest
			icon_state="rare"
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				if(usr in view(1,src))
					usr.Rare()

					src.stacked--
					if(src.stacked<=0)
						del(src)
			Click()
				Use(usr)
				..()
		Crown_Chest
			icon='Icons/chest colors boss.dmi'
			New()
				icon_state=pick(prob(12);"blue",prob(12);"red",prob(12);"brown",prob(12);"white",prob(12);"green",prob(12);"black",prob(12);"yellow"
				,prob(12);"purple",prob(12);"orange")
				..()
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				if(usr in view(1,src))
					usr.Crownrare()

					src.stacked--
					if(src.stacked<=0)
						del(src)
			Click()
				Use(usr)
				..()
		Relapse_Chest
			icon='Icons/chest colors boss.dmi'
			New()
				icon_state=pick(prob(12);"blue",prob(12);"red",prob(12);"brown",prob(12);"white",prob(12);"green",prob(12);"black",prob(12);"yellow"
				,prob(12);"purple",prob(12);"orange")
				..()
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				if(usr in view(1,src))
					usr.RelapseChest()

					src.stacked--
					if(src.stacked<=0)
						del(src)
			Click()
				Use(usr)
				..()
	Events
		Speed_Pill
			icon='Icons/gui.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="speed pill"
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				if(usr.ko==0)
					var/t="<FONT SIZE=+1><FONT COLOR=#87ceeb>You gain immense speed"
					usr<<"<b>[t] "
					usr.Speedy()
					usr.rundelay=1

					src.stacked--
					if(src.stacked<=0)
						del(src)


			Click()
				Use(usr)
				..()
		Level_Points
			icon='Icons/gui.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="+100"
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				var/t="<FONT SIZE=+1><FONT COLOR=#87ceeb>You gained 100 level points"
				usr<<"<b>[t] "
				usr.levelpoints+=100
				usr.eventlvpused+=1

				src.stacked--
				if(src.stacked<=0)
					del(src)

			Click()
				Use(usr)
				..()
		VaiRetake
			icon='Icons/gui.dmi'
			icon_state="VaiRetake"
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				var/t="<FONT SIZE=+1><FONT COLOR=#87ceeb>You may retake vaizard test now"
				usr<<"<b>[t] "
				usr.triedvai=0
				usr.gotvai=0

				src.stacked--
				if(src.stacked<=0)
					del(src)
			Click()
				Use(usr)
				..()
		Awareness_Pill
			icon='Icons/gui.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="awareness pill"
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				var/t="<FONT SIZE=+1><FONT COLOR=#87ceeb>You are now more aware of attacks and your quickflash and instinct passive has increased"
				usr<<"<b>[t] "
				usr.aware()

				src.stacked--
				if(src.stacked<=0)
					del(src)


			Click()
				Use(usr)
				..()
		Squad_4_Bandaid
			icon='Icons/gui.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="bandaid"
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				if(usr.ko==0)
					if(src.justused)
						usr<<"<b>You must wait a little before using again"
						return
					src.justused=1
					spawn(300)
					src.justused=0
					var/t="<FONT SIZE=+1><FONT COLOR=#87ceeb>You healed 50 wounds"
					usr<<"<b>[t] "
					usr.wound-=50
					if(usr.wound<0)usr.wound=0
					src.stacked--

					if(src.stacked<=0)
						del(src)

			Click()
				Use(usr)
				..()
		Purple_Sprite
			icon='Icons/gui.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="purple sprite"
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				var/t="<FONT SIZE=+1><FONT COLOR=#87ceeb>You can't take damage, but you are now slower and feel dizzy"
				usr<<"<b>[t] "
				usr.beer1()
				usr.Purple_Drank(usr)

				src.stacked--
				if(src.stacked<=0)
					del(src)


			Click()
				Use(usr)
				..()
		Rick_Ross_Meat
			icon='Icons/gui.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="rick ross"
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				if(usr.ko==0)
					var/t="<FONT SIZE=+1><FONT COLOR=#87ceeb>You have fully restored your health and rei, while healing 20 wounds, but you will move slower for a little bit"
					usr<<"<b>[t] "
					usr.wound-=20
					if(usr.wound<0)
						usr.wound=0
					usr.health=usr.mhealth
					usr.rei=usr.mrei
					usr.beer1()

					src.stacked--
					if(src.stacked<=0)
						del(src)


			Click()
				Use(usr)
				..()
		Invisibility_Pill
			icon='Icons/gui.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="invisibility pill"
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				if(usr.ko==0)
					var/t="<FONT SIZE=+1><FONT COLOR=#87ceeb>You will be invisible for 15 seconds"
					usr<<"<b>[t] "
					usr.invisiblepill()

					src.stacked--
					if(src.stacked<=0)
						del(src)


			Click()
				Use(usr)
				..()
	Max_Potion
		icon='Icons/gui.dmi'//this icon does NOT fit the base, its just to show object layering
		icon_state="max potion"
		Use(var/mob/u)
			set hidden=1
			set category=null
			usr=u
			if(usr.ko==0)
				if(usr.ctf==1||usr.lost==1)
					src<<"<b> Items not permitted at your location"
					return
				if(src.justused)
					usr<<"<b>You must wait a little before using again"
					return
				src.justused=1
				spawn(400)
				src.justused=0
				var/t="<FONT SIZE=+1><FONT COLOR=#7fffd4>Y</FONT><FONT COLOR=#7cf5d5>o</FONT><FONT COLOR=#77ead6>u</FONT><FONT COLOR=#73e0d7> </FONT><FONT COLOR=#6ed5d8>h</FONT><FONT COLOR=#6acad9>a</FONT><FONT COLOR=#65bfda>v</FONT><FONT COLOR=#61b5db>e</FONT><FONT COLOR=#5caadc> </FONT><FONT COLOR=#589fdd>b</FONT><FONT COLOR=#5394de>e</FONT><FONT COLOR=#4f89df>e</FONT><FONT COLOR=#4a7fe0>n</FONT><FONT COLOR=#4674e1> </FONT><FONT COLOR=#4169e1>f</FONT><FONT COLOR=#3d74e3>u</FONT><FONT COLOR=#397fe5>l</FONT><FONT COLOR=#3489e8>l</FONT><FONT COLOR=#2f94ea>y</FONT><FONT COLOR=#2a9fec> </FONT><FONT COLOR=#26aaee>r</FONT><FONT COLOR=#21b5f1>e</FONT><FONT COLOR=#1cbff3>s</FONT><FONT COLOR=#18caf5>t</FONT><FONT COLOR=#13d5f7>o</FONT><FONT COLOR=#0ee0f9>r</FONT><FONT COLOR=#09eafc>e</FONT><FONT COLOR=#05f5fe>d</FONT><FONT COLOR=#00ffff>!</FONT></FONT>"
				usr<<"<b>[t] "
				usr.wound-=20
				if(usr.wound<0)
					usr.wound=0
				usr.health=usr.mhealth
				usr.rei=usr.mrei

				src.stacked--
				if(src.stacked<=0)
					del(src)


		Click()
			Use(usr)
			..()
	Beer
		icon='Icons/gui.dmi'//this icon does NOT fit the base, its just to show object layering
		icon_state="beer"
		Use(var/mob/u)
			set hidden=1
			set category=null
			usr=u
			if(usr.ko==0)
				if(usr.ko==0)
					if(usr.ctf==1||usr.lost==1)
						src<<"<b> Items not permitted at your location"
						return
				if(src.justused)
					usr<<"<b>You must wait a little before using again"
					return
				src.justused=1
				spawn(300)
				src.justused=0
				usr.wound-=5
				if(usr.wound<0)
					usr.wound=0
				usr.health+=usr.mhealth/12
				if(usr.health>usr.mhealth*2)usr.health=usr.mhealth
				if(usr.rei>usr.mrei*2)usr.rei=usr.mrei
				usr.rei+=usr.mrei/6
				usr.BeerBoost()
				var/t="You have drunken beer"
				if(prob(usr.alcoholic*10))
					t+="\nYou feel slower."
					usr.beer1()
				if(prob(usr.alcoholic*10))
					t+="\nYou don't know what's happening."
					usr.Blinding()
				if(prob(usr.alcoholic*10))
					t+="\nYou can't control yourself."
					usr.beer3()
				if(prob(usr.alcoholic*10))
					t+="\nYou can't use your techniques."
					usr.firetech()
				if(prob(usr.alcoholic*10))
					t+="\nYou passed out."
					usr.protected=1
					usr.wound+=20
					usr.ko=1
					usr.canattack=0
					usr.overlays+=/obj/ko
					if(usr.z==13&&usr.x>80)
						if(usr.flags=="red")
							usr.flags=null
							var/obj/k=new/obj/Flags/Red(usr.loc)
							k.opened=1
						if(usr.flags=="blue")
							usr.flags=null
							var/obj/k=new/obj/Flags/Blue(usr.loc)
							k.opened=1
						usr.Load_Overlays()
					if(usr.z==16)
						if(usr.cpursuit && usr.cpursuit<3)
							var/h=locate(/obj/items/RedHougyoku) in usr
							var/e=locate(/obj/items/PurpleHougyoku) in usr
							if(!e&&h)
								for(var/obj/items/RedHougyoku/X in usr:contents)
									X.loc = usr.loc
							if(e&&!h)
								for(var/obj/items/PurpleHougyoku/X in usr:contents)
									X.loc = usr.loc
							if(e&&h)
								var/d=pick(1,2)
								if(d==1)
									for(var/obj/items/RedHougyoku/X in usr:contents)
										X.loc = usr.loc
								if(d==2)
									for(var/obj/items/PurpleHougyoku/X in usr:contents)
										X.loc = usr.loc
					sleep(100)
					usr.overlays-=/obj/ko
					usr.health=0
					usr.canattack=1
					usr.health+=round(usr.mhealth*0.7,1)
					if(usr.rei<=round(usr.mrei*0.3,1))
						usr.rei=round(usr.mrei*0.3,1)
					usr.protected=0
					usr.ko=0
				if(prob(usr.alcoholic*10))
					t+="\nYou have fully restored your health, but you lost all rei."
					usr.health=usr.mhealth
					usr.rei=0
				if(prob(usr.alcoholic*10))
					t+="\nYou have drunken rage."
					usr.drunkrage()
				usr<<"<b>[t]"


				src.stacked--
				if(src.stacked<=0)
					del(src)


		Click()
			Use(usr)
			..()
	Bandage
		icon='Icons/gui.dmi'//this icon does NOT fit the base, its just to show object layering
		icon_state="bandage"
		Use(var/mob/u)
			set hidden=1
			set category=null
			usr=u
			if(usr.lost&&eventon==3||usr.lost&&eventon==0||usr.tourny||usr.ctf==1||usr.lost==1)
				usr<<"<b>Not during this event"
				return
			if(src.justused)
				usr<<"<b>You must wait a little before using again"
				return
			src.justused=1
			spawn(600)
			src.justused=0
			var/t="<FONT SIZE=+1><FONT COLOR=#7fffd4>Y</FONT><FONT COLOR=#7bf3d5>o</FONT><FONT COLOR=#76e7d6>u</FONT><FONT COLOR=#70dad8> </FONT><FONT COLOR=#6bced9>h</FONT><FONT COLOR=#66c1da>a</FONT><FONT COLOR=#61b5db>v</FONT><FONT COLOR=#5ba8dc>e</FONT><FONT COLOR=#569bdd> </FONT><FONT COLOR=#518fdf>h</FONT><FONT COLOR=#4c82e0>e</FONT><FONT COLOR=#4676e1>a</FONT><FONT COLOR=#4169e1>l</FONT><FONT COLOR=#3d75e3>e</FONT><FONT COLOR=#3880e6>d</FONT><FONT COLOR=#338ce8> </FONT><FONT COLOR=#2e97eb>2</FONT><FONT COLOR=#29a3ed>0</FONT><FONT COLOR=#24afef> </FONT><FONT COLOR=#1ebaf2>w</FONT><FONT COLOR=#19c6f4>o</FONT><FONT COLOR=#14d2f6>u</FONT><FONT COLOR=#0fddf9>n</FONT><FONT COLOR=#0ae9fb>d</FONT><FONT COLOR=#05f4fe>s</FONT><FONT COLOR=#00ffff>!</FONT></FONT> "
			usr<<"<b>[t] "
			usr.wound-=20
			if(usr.wound<0)
				usr.wound=0

			src.stacked--
			if(src.stacked<=0)
				del(src)


		Click()
			Use(usr)
			..()
	REI
		Soda
			icon='Icons/gui.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="soda"
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				if(usr.ko==0)
					if(usr.ctf==1||usr.lost==1)
						src<<"<b> Items not permitted at your location"
						return
					if(src.justused)
						usr<<"<b>You must wait a little before using again"
						return
					src.justused=1
					spawn(200)
					src.justused=0
					var/t="<FONT SIZE=+1><FONT COLOR=#7fffd4>Y</FONT><FONT COLOR=#7bf3d5>o</FONT><FONT COLOR=#76e7d6>u</FONT><FONT COLOR=#70dad8> </FONT><FONT COLOR=#6bced9>h</FONT><FONT COLOR=#66c1da>a</FONT><FONT COLOR=#61b5db>v</FONT><FONT COLOR=#5ba8dc>e</FONT><FONT COLOR=#569bdd> </FONT><FONT COLOR=#518fdf>g</FONT><FONT COLOR=#4c82e0>a</FONT><FONT COLOR=#4676e1>i</FONT><FONT COLOR=#4169e1>n</FONT><FONT COLOR=#3d75e3>e</FONT><FONT COLOR=#3880e6>d</FONT><FONT COLOR=#338ce8> </FONT><FONT COLOR=#2e97eb>1</FONT><FONT COLOR=#29a3ed>,</FONT><FONT COLOR=#24afef>0</FONT><FONT COLOR=#1ebaf2>0</FONT><FONT COLOR=#19c6f4>0</FONT><FONT COLOR=#14d2f6> </FONT><FONT COLOR=#0fddf9>r</FONT><FONT COLOR=#0ae9fb>e</FONT><FONT COLOR=#05f4fe>i</FONT><FONT COLOR=#00ffff>!</FONT></FONT> "
					usr<<"<b>[t] "
					usr.rei+=1000
					if(usr.rei>usr.mrei)
						usr.rei=usr.mrei

					src.stacked--
					if(src.stacked<=0)
						del(src)


			Click()
				Use(usr)
				..()
		Elixir
			icon='Icons/gui.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="elixir"
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				if(usr.ko==0)
					if(usr.ctf==1||usr.lost==1)
						src<<"<b> Items not permitted at your location"
						return
					if(src.justused)
						usr<<"<b>You must wait a little before using again"
						return
					src.justused=1
					spawn(300)
					src.justused=0
					var/t="<FONT SIZE=+1><FONT COLOR=#7fffd4>Y</FONT><FONT COLOR=#7bf3d5>o</FONT><FONT COLOR=#76e7d6>u</FONT><FONT COLOR=#70dad8> </FONT><FONT COLOR=#6bced9>h</FONT><FONT COLOR=#66c1da>a</FONT><FONT COLOR=#61b5db>v</FONT><FONT COLOR=#5ba8dc>e</FONT><FONT COLOR=#569bdd> </FONT><FONT COLOR=#518fdf>g</FONT><FONT COLOR=#4c82e0>a</FONT><FONT COLOR=#4676e1>i</FONT><FONT COLOR=#4169e1>n</FONT><FONT COLOR=#3d75e3>e</FONT><FONT COLOR=#3880e6>d</FONT><FONT COLOR=#338ce8> </FONT><FONT COLOR=#2e97eb>4</FONT><FONT COLOR=#29a3ed>,</FONT><FONT COLOR=#24afef>0</FONT><FONT COLOR=#1ebaf2>0</FONT><FONT COLOR=#19c6f4>0</FONT><FONT COLOR=#14d2f6> </FONT><FONT COLOR=#0fddf9>r</FONT><FONT COLOR=#0ae9fb>e</FONT><FONT COLOR=#05f4fe>i</FONT><FONT COLOR=#00ffff>!</FONT></FONT> "
					usr<<"<b>[t] "
					usr.rei+=4000
					if(usr.rei>usr.mrei)
						usr.rei=usr.mrei

					src.stacked--
					if(src.stacked<=0)
						del(src)


			Click()
				Use(usr)
				..()
		Potion
			icon='Icons/gui.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="potion"
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				if(usr.ko==0)
					if(usr.ctf==1||usr.lost==1)
						src<<"<b> Items not permitted at your location"
						return
					if(src.justused)
						usr<<"<b>You must wait a little before using again"
						return
					src.justused=1
					spawn(400)
					src.justused=0
					var/t="<FONT SIZE=+1><FONT COLOR=#7fffd4>Y</FONT><FONT COLOR=#7cf6d5>o</FONT><FONT COLOR=#78ecd6>u</FONT><FONT COLOR=#73e2d7> </FONT><FONT COLOR=#6fd8d8>h</FONT><FONT COLOR=#6bced9>a</FONT><FONT COLOR=#67c4da>v</FONT><FONT COLOR=#63badb>e</FONT><FONT COLOR=#5eafdb> </FONT><FONT COLOR=#5aa5dc>r</FONT><FONT COLOR=#569bdd>e</FONT><FONT COLOR=#5291de>s</FONT><FONT COLOR=#4e87df>t</FONT><FONT COLOR=#497de0>o</FONT><FONT COLOR=#4573e1>r</FONT><FONT COLOR=#4169e1>e</FONT><FONT COLOR=#3e73e3>d</FONT><FONT COLOR=#397de5> </FONT><FONT COLOR=#3587e7>a</FONT><FONT COLOR=#3091e9>l</FONT><FONT COLOR=#2c9beb>l</FONT><FONT COLOR=#28a5ed> </FONT><FONT COLOR=#23afef>y</FONT><FONT COLOR=#1fbaf2>o</FONT><FONT COLOR=#1ac4f4>u</FONT><FONT COLOR=#16cef6>r</FONT><FONT COLOR=#12d8f8> </FONT><FONT COLOR=#0de2fa>r</FONT><FONT COLOR=#09ecfc>e</FONT><FONT COLOR=#04f6fe>i</FONT><FONT COLOR=#00ffff>!</FONT></FONT> "
					usr<<"<b>[t] "
					usr.rei=usr.mrei

					src.stacked--
					if(src.stacked<=0)
						del(src)


			Click()
				Use(usr)
				..()
	HP
		Chicken
			icon='Icons/gui.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="chicken"
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				if(usr.ko==0)
					if(usr.ctf==1||usr.lost==1)
						src<<"<b> Items not permitted at your location"
						return
					if(src.justused)
						usr<<"<b>You must wait a little before using again"
						return
					src.justused=1
					spawn(200)
					src.justused=0
					var/t="<FONT COLOR=#40e0d0>Y</FONT><FONT COLOR=#45e0d2>o</FONT><FONT COLOR=#4aded4>u</FONT><FONT COLOR=#4fddd6> </FONT><FONT COLOR=#55dcd8>h</FONT><FONT COLOR=#5adada>a</FONT><FONT COLOR=#5fd9dc>v</FONT><FONT COLOR=#64d8de>e</FONT><FONT COLOR=#69d6e0> </FONT><FONT COLOR=#6ed5e2>h</FONT><FONT COLOR=#73d3e4>e</FONT><FONT COLOR=#79d2e6>a</FONT><FONT COLOR=#7ed1e8>l</FONT><FONT COLOR=#83cfea>e</FONT><FONT COLOR=#87ceeb>d</FONT><FONT COLOR=#7ed2ed> </FONT><FONT COLOR=#75d5ee>5</FONT><FONT COLOR=#6bd9f0>,</FONT><FONT COLOR=#61dcf1>0</FONT><FONT COLOR=#57e0f3>0</FONT><FONT COLOR=#4ee3f4>0</FONT><FONT COLOR=#44e7f6> </FONT><FONT COLOR=#3aebf7>h</FONT><FONT COLOR=#31eef9>e</FONT><FONT COLOR=#27f2fa>a</FONT><FONT COLOR=#1df5fc>l</FONT><FONT COLOR=#13f9fd>t</FONT><FONT COLOR=#0afcff>h</FONT><FONT COLOR=#00ffff>!</FONT>"
					usr<<"<b>[t] "
					usr.health+=5000
					if(usr.health>usr.mhealth)
						usr.health=usr.mhealth

					src.stacked--
					if(src.stacked<=0)
						del(src)


			Click()
				Use(usr)
				..()
		Hamburger
			icon='Icons/gui.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="hamburger"
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				if(usr.ko==0)
					if(usr.ctf==1||usr.lost==1)
						src<<"<b> Items not permitted at your location"
						return
					if(src.justused)
						usr<<"<b>You must wait a little before using again"
						return
					src.justused=1
					spawn(300)
					src.justused=0
					var/t="<FONT COLOR=#40e0d0>Y</FONT><FONT COLOR=#45e0d2>o</FONT><FONT COLOR=#4aded4>u</FONT><FONT COLOR=#4fddd6> </FONT><FONT COLOR=#55dcd8>h</FONT><FONT COLOR=#5adada>a</FONT><FONT COLOR=#5fd9dc>v</FONT><FONT COLOR=#64d8de>e</FONT><FONT COLOR=#69d6e0> </FONT><FONT COLOR=#6ed5e2>h</FONT><FONT COLOR=#73d3e4>e</FONT><FONT COLOR=#79d2e6>a</FONT><FONT COLOR=#7ed1e8>l</FONT><FONT COLOR=#83cfea>e</FONT><FONT COLOR=#87ceeb>d</FONT><FONT COLOR=#7fd1ec> </FONT><FONT COLOR=#76d5ee>2</FONT><FONT COLOR=#6dd8ef>0</FONT><FONT COLOR=#64dbf1>,</FONT><FONT COLOR=#5bdff2>0</FONT><FONT COLOR=#52e2f3>0</FONT><FONT COLOR=#49e5f5>0</FONT><FONT COLOR=#3fe9f6> </FONT><FONT COLOR=#36ecf8>h</FONT><FONT COLOR=#2deff9>e</FONT><FONT COLOR=#24f3fa>a</FONT><FONT COLOR=#1bf6fc>l</FONT><FONT COLOR=#12f9fd>t</FONT><FONT COLOR=#09fdff>h</FONT><FONT COLOR=#00ffff>!</FONT> "
					usr<<"<b>[t] "
					usr.health+=20000
					if(usr.health>usr.mhealth)
						usr.health=usr.mhealth

					src.stacked--
					if(src.stacked<=0)
						del(src)


			Click()
				Use(usr)
				..()
		Turkey
			icon='Icons/gui.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="turkey"
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				if(usr.ko==0)
					if(usr.ctf==1||usr.lost==1)
						src<<"<b> Items not permitted at your location"
						return
					if(src.justused)
						usr<<"<b>You must wait a little before using again"
						return
					src.justused=1
					spawn(300)
					src.justused=0
					var/t="<FONT COLOR=#40e0d0>Y</FONT><FONT COLOR=#45e0d2>o</FONT><FONT COLOR=#4aded4>u</FONT><FONT COLOR=#4fddd6> </FONT><FONT COLOR=#55dcd8>h</FONT><FONT COLOR=#5adada>a</FONT><FONT COLOR=#5fd9dc>v</FONT><FONT COLOR=#64d8de>e</FONT><FONT COLOR=#69d6e0> </FONT><FONT COLOR=#6ed5e2>h</FONT><FONT COLOR=#73d3e4>e</FONT><FONT COLOR=#79d2e6>a</FONT><FONT COLOR=#7ed1e8>l</FONT><FONT COLOR=#83cfea>e</FONT><FONT COLOR=#87ceeb>d</FONT><FONT COLOR=#7fd1ec> </FONT><FONT COLOR=#76d5ee>5</FONT><FONT COLOR=#6dd8ef>0</FONT><FONT COLOR=#64dbf1>,</FONT><FONT COLOR=#5bdff2>0</FONT><FONT COLOR=#52e2f3>0</FONT><FONT COLOR=#49e5f5>0</FONT><FONT COLOR=#3fe9f6> </FONT><FONT COLOR=#36ecf8>h</FONT><FONT COLOR=#2deff9>e</FONT><FONT COLOR=#24f3fa>a</FONT><FONT COLOR=#1bf6fc>l</FONT><FONT COLOR=#12f9fd>t</FONT><FONT COLOR=#09fdff>h</FONT><FONT COLOR=#00ffff>!</FONT> "
					usr<<"<b>[t] "
					usr.health+=50000
					if(usr.health>usr.mhealth)
						usr.health=usr.mhealth

					src.stacked--
					if(src.stacked<=0)
						del(src)


			Click()
				Use(usr)
				..()
		Steak
			icon='Icons/gui.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="steak"
			Use(var/mob/u)
				set hidden=1
				set category=null
				usr=u
				if(usr.ko==0)
					if(usr.ctf==1||usr.lost==1)
						src<<"<b> Items not permitted at your location"
						return
					if(src.justused)
						usr<<"<b>You must wait a little before using again"
						return
					src.justused=1
					spawn(400)
					src.justused=0
					var/t="<FONT COLOR=#40e0d0>Y</FONT><FONT COLOR=#44e0d2>o</FONT><FONT COLOR=#48dfd3>u</FONT><FONT COLOR=#4dded5> </FONT><FONT COLOR=#51ddd7>h</FONT><FONT COLOR=#55dbd8>a</FONT><FONT COLOR=#59dada>v</FONT><FONT COLOR=#5ed9dc>e</FONT><FONT COLOR=#62d8dd> </FONT><FONT COLOR=#66d7df>h</FONT><FONT COLOR=#6ad6e0>e</FONT><FONT COLOR=#6fd5e2>a</FONT><FONT COLOR=#73d4e4>l</FONT><FONT COLOR=#77d2e5>e</FONT><FONT COLOR=#7bd1e7>d</FONT><FONT COLOR=#80d0e9> </FONT><FONT COLOR=#84cfea>A</FONT><FONT COLOR=#87ceeb>L</FONT><FONT COLOR=#80d1ec>L</FONT><FONT COLOR=#78d4ed> </FONT><FONT COLOR=#70d7ef>o</FONT><FONT COLOR=#68daf0>f</FONT><FONT COLOR=#60ddf1> </FONT><FONT COLOR=#58e0f2>y</FONT><FONT COLOR=#50e3f4>o</FONT><FONT COLOR=#48e6f5>u</FONT><FONT COLOR=#40e8f6>r</FONT><FONT COLOR=#38ebf7> </FONT><FONT COLOR=#30eef9>h</FONT><FONT COLOR=#28f1fa>e</FONT><FONT COLOR=#20f4fb>a</FONT><FONT COLOR=#18f7fc>l</FONT><FONT COLOR=#10fafe>t</FONT><FONT COLOR=#08fdff>h</FONT><FONT COLOR=#00ffff>!</FONT> "
					usr<<"<b>[t] "
					usr.health=usr.mhealth

					src.stacked--
					if(src.stacked<=0)
						del(src)


			Click()
				Use(usr)
				..()
obj/items/equipable
	Halloween
		Top
			icon='Icons/gui.dmi'
			icon_state="reaper1"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="Halloween")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.overshirt=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.overshirt=/obj/Halloween/Top
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Bot
			icon='Icons/gui.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="reaper2"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="Halloween")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.special=0
					usr.swordon=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.special=/obj/Halloween/Bot
					usr.swordon=1
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
	Pants
		armor="pants"
		Black
			icon='Icons/BleachPants.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="pants")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.pants=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					switch(input("What color do you want to change your pants into?", text) in list ("Black","Blue","Gray","Green","Light Green","Orange","Pink","Purple","Red","Teal","White","Yellow"))
						if("Black")
							usr.pants=/obj/Pants/black
						if("Blue")
							usr.pants=/obj/Pants/blue
						if("Gray")
							usr.pants=/obj/Pants/gray
						if("Green")
							usr.pants=/obj/Pants/green
						if("Light Green")
							usr.pants=/obj/Pants/lgreen
						if("Orange")
							usr.pants=/obj/Pants/orange
						if("Pink")
							usr.pants=/obj/Pants/pink
						if("Purple")
							usr.pants=/obj/Pants/purple
						if("Red")
							usr.pants=/obj/Pants/red
						if("Teal")
							usr.pants=/obj/Pants/teal
						if("White")
							usr.pants=/obj/Pants/white
						if("Yellow")
							usr.pants=/obj/Pants/yellow
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
	ApolloVaiMask
		icon = 'gui.dmi'
		icon_state = "Vaizard mask1.dmi"
		armor="Vaizard3"
		Use(var/mob/u)
			set hidden=1
			set category=null
			var/equ=src.equipped
			usr=u
			for(var/obj/items/O in usr.contents)
				if(O.armor=="Vaizard3")
					O.overlays=0
					O.equipped=0
			if(equ)
				usr.overshirt=0
				src.equipped=0
				src.overlays-='Equipped.dmi'
			else
				usr.overshirt=/obj/ApolloVaiMask
				src.equipped=1
				src.overlays+='Equipped.dmi'

			usr.Load_Overlays()
		Click()
			Use(usr)

	MatiVaiMask
		icon = 'gui.dmi'
		icon_state = "Vaizard mask6.dmi"
		armor="Vaizard3"
		Use(var/mob/u)
			set hidden=1
			set category=null
			var/equ=src.equipped
			usr=u
			for(var/obj/items/O in usr.contents)
				if(O.armor=="Vaizard3")
					O.overlays=0
					O.equipped=0
			if(equ)
				usr.overshirt=0
				src.equipped=0
				src.overlays-='Equipped.dmi'
			else
				usr.overshirt=/obj/MatiVaiMask
				src.equipped=1
				src.overlays+='Equipped.dmi'

			usr.Load_Overlays()
		Click()
			Use(usr)

	ZerefVaiMask2
		icon = 'gui.dmi'
		icon_state = "Vaimaskorig.dmi"
		armor="Vaizard2"
		Use(var/mob/u)
			set hidden=1
			set category=null
			var/equ=src.equipped
			usr=u
			for(var/obj/items/O in usr.contents)
				if(O.armor=="Vaizard2")
					O.overlays=0
					O.equipped=0
			if(equ)
				usr.overshirt=0
				src.equipped=0
				src.overlays-='Equipped.dmi'
			else
				usr.overshirt=/obj/ZerefVaiMask2
				src.equipped=1
				src.overlays+='Equipped.dmi'

			usr.Load_Overlays()
		Click()
			Use(usr)

	ZerefVaiMask1
		icon = 'gui.dmi'
		icon_state = "Ichigo Mask.dmi"
		armor="Vaizard1"
		Use(var/mob/u)
			set hidden=1
			set category=null
			var/equ=src.equipped
			usr=u
			for(var/obj/items/O in usr.contents)
				if(O.armor=="Vaizard1")
					O.overlays=0
					O.equipped=0
			if(equ)
				usr.overshirt=0
				src.equipped=0
				src.overlays-='Equipped.dmi'
			else
				usr.overshirt=/obj/ZerefVaiMask1
				src.equipped=1
				src.overlays+='Equipped.dmi'

			usr.Load_Overlays()
		Click()
			Use(usr)

	SantaHat
		icon='Icons/gui.dmi'
		icon_state="santahat"
		armor="Santa"
		Use(var/mob/u)
			set hidden=1
			set category=null
			var/equ=src.equipped
			usr=u
			for(var/obj/items/O in usr.contents)
				if(O.armor=="Santa")
					O.overlays=0
					O.equipped=0
			if(equ)
				usr.overshirt=0
				src.equipped=0
				src.overlays-='Equipped.dmi'
			else
				usr.overshirt=/obj/SantaHat
				src.equipped=1
				src.overlays+='Equipped.dmi'

			usr.Load_Overlays()
		Click()
			Use(usr)






	Shirt
		armor="shirt"
		Black
			icon='Icons/BleachShirt.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="shirt")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.shirt=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					switch(input("What color do you want to change your shirt into?", text) in list ("Black","Blue","Gray","Green","Light Green","Orange","Pink","Purple","Red","Teal","White","Yellow"))
						if("Black")
							usr.shirt=/obj/Shirt/black
						if("Blue")
							usr.shirt=/obj/Shirt/blue
						if("Gray")
							usr.shirt=/obj/Shirt/gray
						if("Green")
							usr.shirt=/obj/Shirt/green
						if("Light Green")
							usr.shirt=/obj/Shirt/lgreen
						if("Orange")
							usr.shirt=/obj/Shirt/orange
						if("Pink")
							usr.shirt=/obj/Shirt/pink
						if("Purple")
							usr.shirt=/obj/Shirt/purple
						if("Red")
							usr.shirt=/obj/Shirt/red
						if("Teal")
							usr.shirt=/obj/Shirt/teal
						if("White")
							usr.shirt=/obj/Shirt/white
						if("Yellow")
							usr.shirt=/obj/Shirt/yellow
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
	Shoes
		armor="shoes"
		Black
			icon='Icons/Bleachshoes.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="shoes")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.shoes=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					switch(input("What color do you want to change your shoes into?", text) in list ("Black","Blue","White"))
						if("Black")
							usr.shoes=/obj/Shoes/black
						if("Blue")
							usr.shoes=/obj/Shoes/blue
						if("White")
							usr.shoes=/obj/Shoes/white
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
	Legarmor
		armor="legarmor"
		Shinigami1
			icon='Icons/shinigamisuit.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="legarmor")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.legarmor=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.legarmor=/obj/legarmor/l1
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
	Cloak
		armor="cloak"
		Espada1
			icon='Icons/espadasuit.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="cloak")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.cloak=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.cloak=/obj/cloak/espada/e1
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Espada2
			icon='Icons/espadasuit2.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="cloak")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.cloak=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.cloak=/obj/cloak/espada/e2
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Captain1
			icon='Icons/captainsuit.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="cloak")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.cloak=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.cloak=/obj/cloak/captain/c1
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Squad0
			icon='Icons/Squad0.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="cloak")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.cloak=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.cloak=/obj/cloak/captain/c3
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Captain2
			icon='Icons/captainsuit2.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="cloak")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.cloak=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.cloak=/obj/cloak/captain/c2
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
	Overshirt
		armor="overshirt"
		Quincy1
			icon='Icons/quincysuit2.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="overshirt")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.overshirt=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.overshirt=/obj/overshirt/quincy/s1
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Shinigami1
			icon='Icons/shinigamisuit.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="overshirt")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.overshirt=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.overshirt=/obj/overshirt/shinigami/s1
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Shinigami2
			icon='Icons/shinigamisuit2.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="overshirt")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.overshirt=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.overshirt=/obj/overshirt/shinigami/s2
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Organization_XIII
			icon='Icons/Organization XIII Cloak.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="overshirt")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.overshirt=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.overshirt=/obj/overshirt/shinigami/s3
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
	Special
		Scarf
			icon='Icons/Byakuya Scarf.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="special")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.special=0
					usr.swordon=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.special=/obj/special/scarf
					usr.swordon=1
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
	Weapon
		Sword
			icon='Icons/Zanpaktou2.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="weapon")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.weapon=0
					usr.swordon=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.weapon=/obj/weapon/sword
					usr.swordon=1
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Sanrei
			icon='Icons/sanrei.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="weapon")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.sanrei=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.sanrei=1
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Bookmark
			icon='Icons/F_Bookmark.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="weapon")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.weapon=0
					usr.swordon=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.weapon=/obj/weapon/fullbring/bookmark
					usr.swordon=1
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Boots
			icon='Icons/F_Boots.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="weapon")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.weapon=0
					usr.swordon=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.weapon=/obj/weapon/fullbring/boots
					usr.swordon=1
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Necklace
			icon='Icons/F_Necklace.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="weapon")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.weapon=0
					usr.swordon=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.weapon=/obj/weapon/fullbring/necklace
					usr.swordon=1
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Psp
			icon='Icons/F_Psp.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="weapon")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.weapon=0
					usr.swordon=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.weapon=/obj/weapon/fullbring/psp
					usr.swordon=1
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Combat_Pass
			icon='Icons/F_CombatPass.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="weapon")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.weapon=0
					usr.swordon=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.weapon=/obj/weapon/fullbring/combatpass
					usr.swordon=1
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Hairpins
			icon='Icons/F_Hairpins.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="weapon")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.weapon=0
					usr.swordon=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.weapon=/obj/weapon/fullbring/hairpins
					usr.swordon=1
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Knuckles
			icon='Icons/F_Lucky.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="weapon")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.weapon=0
					usr.swordon=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.weapon=/obj/weapon/fullbring/knuckles
					usr.swordon=1
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
	Armor
		armor="armor"
		Jacket
			icon='Icons/Jacket.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="jacket")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.jacket=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					switch(input("What color do you want to change your jacket into?", text) in list ("Black","Blue","Red","Green","White"))
						if("Black")
							usr.jacket=/obj/Jacket/black
						if("Blue")
							usr.jacket=/obj/Jacket/blue
						if("White")
							usr.jacket=/obj/Jacket/white
						if("Red")
							usr.jacket=/obj/Jacket/red
						if("Green")
							usr.jacket=/obj/Jacket/green
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Shunsui_Hat
			icon='Icons/hat drop shunsui.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="facearmor")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.facearmor=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.facearmor=/obj/facearmor/s8
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Urahara_Hat
			icon='Icons/Urahara hat.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="facearmor")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.facearmor=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.facearmor=/obj/facearmor/s7
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Headband
			icon='Icons/blindfold.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="facearmor")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.facearmor=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.facearmor=/obj/facearmor/s1
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Blindfold
			icon='Icons/blindfold.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="blindfold")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.blindfold=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.blindfold=1
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Kommamaru
			icon='Icons/kommamaruhelmet.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="facearmor")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.facearmor=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.facearmor=/obj/facearmor/s3
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
	Glasses
		armor="glasses"
		Thin_Glasses
			icon='Icons/thin glasses.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="glasses")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.glasses=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.glasses=/obj/glasses/g3
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Shades
			icon='Icons/Shades.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="glasses")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.glasses=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.facearmor=/obj/glasses/g1
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)
		Shades2
			icon='Icons/Shades2.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="gui"
			Use(var/mob/u)
				set hidden=1
				set category=null
				var/equ=src.equipped
				usr=u
				for(var/obj/items/O in usr.contents)
					if(O.armor=="glasses")
						O.overlays=0
						O.equipped=0
				if(equ)
					usr.glasses=0
					src.equipped=0
					src.overlays-='Equipped.dmi'
				else
					usr.glasses=/obj/glasses/g2
					src.equipped=1
					src.overlays+='Equipped.dmi'

				usr.Load_Overlays()
			Click()
				Use(usr)