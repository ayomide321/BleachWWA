

mob
	var
		got3xrel=0
		gothalex=0
		hasinfzan=0
		hasinfress=0
		got2xrel=0


mob
	verb
		EnterEPDP()
			winshow(usr, "buyepdp", 1);winset(usr,"buyepdp", "is-visible=true")



		buy2x()
			set hidden = 1
			switch(alert(usr,"Are you sure you want to buy 2x leveling for 300 EP? When leveling, instead of gaining 1 level when leveling up\
			 you'll gain 2.","2x","Yes","No"))
				if("Yes")
					if(usr.got2xrel)
						alert(usr,"You already have this item.")
						return 0

					if(usr.eventpoints < 300)
						alert(usr,"You don't have 300 event points to buy this item.")
						return 0

					if(!usr.got2xrel && usr.eventpoints >= 300)
						usr.eventpoints -= 300
						usr.got2xrel=1
						usr.donor2levels=1
						alert(usr,"You bought 2x leveling for 300 event points.")

				else
					alert(usr,"Cancelled.")
					return


		buy4x()
			set hidden = 1
			switch(alert(usr,"Are you sure you want to buy 4x leveling for 650 EP? When leveling, instead of gaining 1 level when leveling up\
			 you'll gain 4.","4x","Yes","No"))
				if("Yes")
					if(usr.got3xrel)
						alert(usr,"You already have this item.")
						return 0

					if(usr.eventpoints < 650)
						alert(usr,"You don't have 650 event points to buy this item.")
						return 0

					if(!usr.got3xrel && usr.eventpoints >= 650)
						usr.eventpoints -= 650
						usr.got3xrel=1
						usr.donor4levels=1
						alert(usr,"You bought 4x leveling for 650 event points.")

				else
					alert(usr,"Cancelled.")
					return


		moneyep()
			set hidden = 1
			switch(alert(usr,"Do you want to purchase $400,000 for 25 event points?","Money","Yes","No"))
				if("Yes")
					if(usr.eventpoints<25)
						alert(usr, "You don't have enough event points.")
						return

					if(usr.eventpoints >= 25)
						usr.eventpoints -= 25
						usr.money += 400000
						AutoSave()
						alert(usr,"You purchaed $400,000 for the cost of 25 event points.")

				else
					alert(usr,"Cancelled.")
					return


		ezleveln()
			set hidden = 1
			switch(alert(usr,"Do you want to buy easier leveling for 300 event points? This halves your required EXP to level","EXP","Yes","No"))
				if("Yes")
					if(usr.gothalex)
						alert(usr,"You already have this item.")
						return 0

					if(usr.donorhalfexp)
						alert(usr,"You already have this item.")
						return 0

					if(usr.eventpoints<300)
						alert(usr, "You don't have enough event points.")
						return

					if(usr.eventpoints >= 300)
						usr.eventpoints -= 300
						usr.gothalex=1
						usr.donorhalfexp=1
						alert(usr,"You have unlocked easier leveling (half the required exp to level up.")

				else
					alert(usr,"Cancelled.")
					return


	/*	squach()
			set hidden = 1
			switch(alert(usr,"Do you want to buy a squad change for 150 event points?","Squad","Yes","No"))
				if("Yes")

					if(usr.eventpoints<150)
						alert(usr, "You don't have enough event points.")
						return

					if(usr.race != "Shinigami")
						alert(usr,"You need to be a Shinigami.")
						return


					if(usr.eventpoints >= 150)
						usr.eventpoints -= 150
						usr.squad=input(usr,"Choose your squad.")in list(1,2,3,4,5,6,7,8,9,10,11,12,13,"Kido Corps")
						alert(usr,"Your squad has been set to squad : [squad].")
						if(squad == "Kido Corps"||squad==4)
							usr.contents+=new/obj/skillcard/Kido_Corp_Heal
							usr.RefreshSkillList()
						else
							var obj/skillcard/Kido_Corp_Heal/z = locate() in usr.contents
							if(!isnull(z))
								usr.contents-=z
						//	usr.contents-=new/obj/skillcard/Kido_Corp_Heal
							usr.RefreshSkillList()
						alert(usr,"You bought a squad change for 150 event points.")

				else
					alert(usr,"Cancelled.")
					return


		ezleveln()
			set hidden = 1
			switch(alert(usr,"Do you want to buy easier leveling for 300 event points? This halves your required EXP to level","EXP","Yes","No"))
				if("Yes")
					if(usr.gothalex)
						alert(usr,"You already have this item.")
						return 0

					if(usr.donorhalfexp)
						alert(usr,"You already have this item.")
						return 0

					if(usr.eventpoints<300)
						alert(usr, "You don't have enough event points.")
						return

					if(usr.eventpoints >= 300)
						usr.eventpoints -= 300
						usr.gothalex=1
						usr.donorhalfexp=1
						alert(usr,"You have unlocked easier leveling (half the required exp to level up.")

				else
					alert(usr,"Cancelled.")
					return


		selectzan()
			set hidden = 1
			switch(alert(usr,"Do you want to purchase a zan or ress change of your choice for 200 event points?","Change","Yes","No"))
				if("Yes")

				//	if(usr.race != "Shinigami"||usr.race != "Arrancar")
				//		alert(usr,"You must be a shinigami or an Arrancar.")
				//		return

					if(usr.eventpoints<200)
						alert(usr, "You don't have enough event points.")
						return

					if(usr.race == "Shinigami"||usr.race == "Vaizard")
						if(usr.eventpoints >= 200 && usr.race == "Shinigami"||usr.race == "Vaizard")
							usr.eventpoints -= 200
							usr.stype = input("Choose a zan",usr.stype) in list("Ichigo","Zaraki","Ichimaru","Hisagi","Ikkaku","Kira",\
							"Kommamaru","Renji","Shonshui","Stinger","Tousen","Ichimaru","Hisagi","Ikkaku",\
							"Renji","Shonshui","Stinger","Tousen","Unohana","Aizen","Shinji","Lightning","Fujimaru","Yammamoto",\
							"Byakuya","Hinamori","Kaiens","Mayuri","Rukia","Hitsugaya","Urahara",\
							"Yumichika","Ukitake","Kensei","Muramasa")
							alert(usr,"Your Zan has been set to: [stype].")
							usr.Respec()
							var obj/skillcard/Sharingan/y = locate() in usr.contents
							var obj/skillcard/Hell_Armor/z = locate() in usr.contents
							var obj/skillcard/Pure_Atk/a = locate() in usr.contents
							var obj/skillcard/Pure_Rei/b = locate() in usr.contents
							var obj/skillcard/Pure_Def/c = locate() in usr.contents
							var obj/skillcard/Hyosuke_Stun/d = locate() in usr.contents
							var obj/skillcard/Create_Mini_Kushanada/t = locate() in usr.contents
							if(!isnull(t))usr.gotmini=1
							if(!isnull(y))usr.gotshar=1
							if(!isnull(z))usr.gotha=1
							if(!isnull(a))usr.gotatk=1
							if(!isnull(b))usr.gotrei=1
							if(!isnull(c))usr.gotdef=1
							if(!isnull(d))usr.gothyostun=1
							for(var/obj/skillcard/x in usr.contents)
								usr.contents -= x
							usr.Reset_Skillcards()
							usr.contents+=new/obj/skillcard/Sense
							usr.contents+=new/obj/skillcard/Hide_Presence
							usr.contents+=new/obj/skillcard/Flash_Step
							usr.contents+=new/obj/skillcard/Flashing_Attack
							usr.contents+=new/obj/skillcard/Spiritual_Pressure
							if(usr.level>=150)
								usr.contents+=new/obj/skillcard/shikai
							if(usr.level>=400)
								usr.contents+=new/obj/skillcard/bankai
							usr.gotlightccskills2=0
							usr.gotgetsugajab=0
							usr.gotnewik=0
							usr.gotfujimaruskills=0
							usr.learnedtogglehina=0
							usr.gotlightccskills=0
							usr.gotnewkennyskill=0
							if(usr.beatashell)
								usr.contents+=new/obj/skillcard/Final_Bankai
								usr.contents+=new/obj/skillcard/Mugetsu
							if(usr.vasto)
								usr.contents+=new/obj/skillcard/Vasto_Form
							if(usr.canvasto)
								usr.contents+=new/obj/skillcard/Inner_Mode
								usr.contents+=new/obj/skillcard/Vaizard_Rage
								usr.contents+=new/obj/skillcard/Cero
								usr.contents+=new/obj/skillcard/Release_Color
								usr.contents+=new/obj/skillcard/Gran_Rey_Cero
							if(usr.stype =="Ichimaru")
								usr.contents+=new/obj/skillcard/Shishkabob
								usr.contents+=new/obj/skillcard/Stretch
							if(usr.stype =="Kensei")
								usr.contents+=new/obj/skillcard/Air_Strike
								usr.contents+=new/obj/skillcard/Air_Bullet
							if(usr.stype == "Hisagi")
								usr.contents+=new/obj/skillcard/Reap
							if(usr.stype =="Ikkaku")
								usr.contents+=new/obj/skillcard/Rage_Spin
								usr.contents+=new/obj/skillcard/Extend
							if(usr.stype == "Unohana")
								usr.contents+=new/obj/skillcard/Reversal_Healing
								usr.contents+=new/obj/skillcard/Regeneration_Mode
							if(usr.stype == "Ukitake")
								usr.contents+=new/obj/skillcard/Return_Blast
								usr.contents+=new/obj/skillcard/Raikouhou
							if(usr.stype == "Rangiku")
								usr.contents+=new/obj/skillcard/Explode
							if(usr.stype == "Mayuri")
								usr.contents+=new/obj/skillcard/Lethal_Poison
							if(usr.stype == "Renji")
								usr.contents+=new/obj/skillcard/Baboon_Blast
							if(usr.stype == "Kira")
								usr.contents+=new/obj/skillcard/Heavy_Hit
							if(usr.stype == "Urahara")
								usr.contents+=new/obj/skillcard/Blood_Sheild
								usr.contents+=new/obj/skillcard/Shibari
								usr.contents+=new/obj/skillcard/Nake
							if(usr.stype == "Shonshui")
								usr.contents+=new/obj/skillcard/Bushogoma
								usr.contents+=new/obj/skillcard/Shadow
							if(usr.stype == "Jiroubou")
								usr.contents+=new/obj/skillcard/Shuriken_Toss
							if(usr.stype == "Ichigo")
								usr.contents+=new/obj/skillcard/Getsuga_Enhanced_Blade
								usr.contents+=new/obj/skillcard/Acceleration
								usr.contents+=new/obj/skillcard/Getsuga_Tenshou
							if(usr.stype == "Yammamoto")
								usr.contents+=new/obj/skillcard/Fortress_Blaze
								usr.contents+=new/obj/skillcard/Shoen
								usr.contents+=new/obj/skillcard/Creamation
							if(usr.stype == "Hitsugaya")
								usr.contents+=new/obj/skillcard/Sennen_Hyoro
								usr.contents+=new/obj/skillcard/Shoot_Dragon
								usr.contents+=new/obj/skillcard/Frozen_Heavens
							if(usr.stype == "Aizen")
								usr.contents+=new/obj/skillcard/Invisibility
								usr.contents+=new/obj/skillcard/Copy
								usr.contents+=new/obj/skillcard/Restep
							if(usr.stype == "Muramasa")
								usr.contents+=new/obj/skillcard/Release_Seal
								usr.contents+=new/obj/skillcard/Boost_Negation
							if(usr.stype == "Yumichika")
								usr.contents+=new/obj/skillcard/Ruri_iro_Kujaku
								usr.contents+=new/obj/skillcard/Cyclone_Slash
							if(usr.stype == "Hinamori")
								usr.contents+=new/obj/skillcard/Scatter_Shot
							if(usr.stype == "Stinger")
								usr.contents+=new/obj/skillcard/Rocket
							if(usr.stype == "Hisagi")
								usr.contents+=new/obj/skillcard/Criss_Cross
							if(usr.stype == "Byakuya")
								usr.contents+=new/obj/skillcard/Hakuteiken
							if(usr.stype == "Tousen")
								usr.contents+=new/obj/skillcard/Benihikou
							if(usr.stype == "Zaraki")
								usr.contents+=new/obj/skillcard/Berserk
							if(usr.stype == "Rukia")
								usr.contents+=new/obj/skillcard/Hakuren
							if(usr.stype == "Kaiens")
								usr.contents+=new/obj/skillcard/Wave
							if(usr.stype=="Kido Class"&&usr.level>=800||usr.level>=800&&usr.status=="<font color = #FF5600>Captain</font>"||usr.level>=850&&usr.status=="Lieutenant"||usr.level>=900||usr.race != "Vaizard")
								usr.contents+=new/obj/skillcard/Limit_Release
					if(usr.race == "Arrancar")
						if(usr.eventpoints >= 200 && usr.race == "Arrancar")
							usr.eventpoints -= 200
							usr.ressurectiontype = input("Choose a ress",usr.ressurectiontype) in list("Del Toro","Dordoni","Nell",\
							"Nnoitra","Tijereta","Zommari","Luppi","Shooter","Skeleton","Ulq","Volcanica","Pantera","Scientist","Halibel")
							alert(usr,"Your Ress has been set to: [ressurectiontype].")
							usr.Respec()
							var obj/skillcard/Sharingan/y = locate() in usr.contents
							var obj/skillcard/Hell_Armor/z = locate() in usr.contents
							var obj/skillcard/Pure_Atk/a = locate() in usr.contents
							var obj/skillcard/Pure_Rei/b = locate() in usr.contents
							var obj/skillcard/Pure_Def/c = locate() in usr.contents
							var obj/skillcard/Hyosuke_Stun/d = locate() in usr.contents
							var obj/skillcard/Instant_Regen/e = locate() in usr.contents
							var obj/skillcard/Arrancar_Release/f = locate() in usr.contents
							var obj/skillcard/Create_Mini_Kushanada/t = locate() in usr.contents
							if(!isnull(t))usr.gotmini=1
							if(!isnull(y))usr.gotshar=1
							if(!isnull(z))usr.gotha=1
							if(!isnull(a))usr.gotatk=1
							if(!isnull(b))usr.gotrei=1
							if(!isnull(c))usr.gotdef=1
							if(!isnull(d))usr.gothyostun=1
							if(!isnull(e))usr.gotinre=1
							if(!isnull(f))usr.gotarrea=1
							for(var/obj/skillcard/x in usr.contents)
								usr.contents -= x
							usr.Reset_Skillcards()
							usr.gotspear=0
							usr.gotsovereign=0
							usr.gotlacerate=0
							usr.gotoutrage=0
							usr.gotheat=0
							usr.gotdragon=0
							usr.gotdesgarron=0
							usr.gotcascada=0
							usr.gottentacle=0
							usr.gottentacle2=0
							usr.gotage=0
							usr.gotthrow=0
							usr.gotwolf=0
							usr.gotdualswords=0
							usr.gotyoyo=0
							usr.contents+=new/obj/skillcard/Sense
							usr.contents+=new/obj/skillcard/Hide_Presence
							usr.contents+=new/obj/skillcard/Flash_Step
							usr.contents+=new/obj/skillcard/Flashing_Attack
							usr.contents+=new/obj/skillcard/Spiritual_Pressure
							usr.contents+=new/obj/skillcard/Segunda_Ress
							usr.contents+=new/obj/skillcard/Ressurection
							usr.contents+=new/obj/skillcard/HollowRage
							usr.contents+=new/obj/skillcard/Roar
							if(usr.gotneg)
								usr.contents+=new/obj/skillcard/Negacion


				else
					alert(usr,"Cancelled.")
					return

		moneyep()
			set hidden = 1
			switch(alert(usr,"Do you want to purchase $400,000 for 25 event points?","Money","Yes","No"))
				if("Yes")
					if(usr.eventpoints<25)
						alert(usr, "You don't have enough event points.")
						return

					if(usr.eventpoints >= 25)
						usr.eventpoints -= 25
						usr.money += 400000
						AutoSave()
						alert(usr,"You purchaed $400,000 for the cost of 25 event points.")

				else
					alert(usr,"Cancelled.")
					return


		infzanressch()
			set hidden = 1
			switch(alert(usr,"Do you want to purchase unlimited zan or ress changes of your choice for 600 event points?","Change","Yes","No"))
				if("Yes")

					if(usr.eventpoints<600)
						alert(usr, "You don't have enough event points.")
						return

				//	if(usr.race == "Shinigami")
					//	if(usr.eventpoints >= 600 && usr.race == "Shinigami")
					if(usr.eventpoints >= 600)
						usr.eventpoints -= 600
						//usr.verbs += typesof(/mob/epzanchanges/verb)
						alert(usr,"If you're a Shinigami, you will receive the verb to change under the 'EP' tab and will\
						  always have it upon logging in if you're a shinigami(char based). For the ressurection changes you will receieve\
						   the verb upon becoming an Arrancar.")
						usr.hasinfzan=1
						usr.hasinfress=1
						if(usr.race == "Shinigami")
							usr.verbs += typesof(/mob/epzanchanges/verb)
						if(usr.race == "Vaizard")
							usr.verbs += typesof(/mob/epzanchanges/verb)
						if(usr.race == "Arrancar")
							usr.verbs += typesof(/mob/epzanchanges2/verb)


					/*if(usr.race == "Arrancar")
						if(usr.eventpoints >= 600 && usr.race == "Arrancar")
							usr.eventpoints -= 600
							usr.verbs += typesof(/mob/epzanchanges2/verb)
							usr.hasinfress=1
							alert(usr,"Bought")	*/


mob/var
	gotha=0; gotshar= 0; gotatk=0; gotrei=0; gotdef=0; gothyostun=0; gotinre=0; gotarrea=0; gotmini=0

mob/epzanchanges
	verb
		zanchange()
			set category = "EP"
			set name = "Zan Change"


			usr.stype = input("Choose a zan",usr.stype) in list("Ichigo","Zaraki","Ichimaru","Hisagi","Ikkaku","Kira",\
			"Kommamaru","Renji","Shonshui","Stinger","Tousen","Ichimaru","Hisagi","Ikkaku",\
			"Renji","Shonshui","Stinger","Tousen","Unohana","Aizen","Shinji","Lightning","Fujimaru","Yammamoto",\
			"Byakuya","Hinamori","Kaiens","Mayuri","Rukia","Hitsugaya","Urahara",\
			"Yumichika","Ukitake","Kensei","Muramasa")
			alert(usr,"Your Zan has been set to: [stype].")
			usr.Respec()
			usr.justzanchanged=1
			var obj/skillcard/Sharingan/y = locate() in usr.contents
			var obj/skillcard/Hell_Armor/z = locate() in usr.contents
			var obj/skillcard/Pure_Atk/a = locate() in usr.contents
			var obj/skillcard/Pure_Rei/b = locate() in usr.contents
			var obj/skillcard/Pure_Def/c = locate() in usr.contents
			var obj/skillcard/Hyosuke_Stun/d = locate() in usr.contents
			var obj/skillcard/Create_Mini_Kushanada/t = locate() in usr.contents
			if(!isnull(t))usr.gotmini=1
			if(!isnull(y))usr.gotshar=1
			if(!isnull(z))usr.gotha=1
			if(!isnull(a))usr.gotatk=1
			if(!isnull(b))usr.gotrei=1
			if(!isnull(c))usr.gotdef=1
			if(!isnull(d))usr.gothyostun=1
			for(var/obj/skillcard/x in usr.contents)
				usr.contents -= x
			usr.Reset_Skillcards()
			spawn(10 SECONDS)
				del(usr)
			usr.contents+=new/obj/skillcard/Sense
			usr.contents+=new/obj/skillcard/Hide_Presence
			usr.contents+=new/obj/skillcard/Flash_Step
			usr.contents+=new/obj/skillcard/Flashing_Attack
			usr.contents+=new/obj/skillcard/Spiritual_Pressure
			if(usr.level>=150)
				usr.contents+=new/obj/skillcard/shikai
			if(usr.level>=400)
				usr.contents+=new/obj/skillcard/bankai
			usr.gotlightccskills2=0
			usr.gotgetsugajab=0
			usr.gotnewik=0
			usr.gotfujimaruskills=0
			usr.learnedtogglehina=0
			usr.gotlightccskills=0
			usr.gotnewkennyskill=0
			if(usr.beatashell)
				usr.contents+=new/obj/skillcard/Final_Bankai
				usr.contents+=new/obj/skillcard/Mugetsu
			if(usr.vasto)
				usr.contents+=new/obj/skillcard/Vasto_Form
			if(usr.canvasto)
				usr.contents+=new/obj/skillcard/Inner_Mode
				usr.contents+=new/obj/skillcard/Vaizard_Rage
				usr.contents+=new/obj/skillcard/Cero
				usr.contents+=new/obj/skillcard/Release_Color
				usr.contents+=new/obj/skillcard/Gran_Rey_Cero
			if(usr.stype =="Ichimaru")
				usr.contents+=new/obj/skillcard/Shishkabob
				usr.contents+=new/obj/skillcard/Stretch
			if(usr.stype =="Kensei")
				usr.contents+=new/obj/skillcard/Air_Strike
				usr.contents+=new/obj/skillcard/Air_Bullet
			if(usr.stype == "Hisagi")
				usr.contents+=new/obj/skillcard/Reap
			if(usr.stype =="Ikkaku")
				usr.contents+=new/obj/skillcard/Rage_Spin
				usr.contents+=new/obj/skillcard/Extend
			if(usr.stype == "Unohana")
				usr.contents+=new/obj/skillcard/Reversal_Healing
				usr.contents+=new/obj/skillcard/Regeneration_Mode
			if(usr.stype == "Ukitake")
				usr.contents+=new/obj/skillcard/Return_Blast
				usr.contents+=new/obj/skillcard/Raikouhou
			if(usr.stype == "Rangiku")
				usr.contents+=new/obj/skillcard/Explode
			if(usr.stype == "Mayuri")
				usr.contents+=new/obj/skillcard/Lethal_Poison
			if(usr.stype == "Renji")
				usr.contents+=new/obj/skillcard/Baboon_Blast
			if(usr.stype == "Kira")
				usr.contents+=new/obj/skillcard/Heavy_Hit
			if(usr.stype == "Urahara")
				usr.contents+=new/obj/skillcard/Blood_Sheild
				usr.contents+=new/obj/skillcard/Shibari
				usr.contents+=new/obj/skillcard/Nake
			if(usr.stype == "Shonshui")
				usr.contents+=new/obj/skillcard/Bushogoma
				usr.contents+=new/obj/skillcard/Shadow
			if(usr.stype == "Jiroubou")
				usr.contents+=new/obj/skillcard/Shuriken_Toss
			if(usr.stype == "Ichigo")
				usr.contents+=new/obj/skillcard/Getsuga_Enhanced_Blade
				usr.contents+=new/obj/skillcard/Acceleration
				usr.contents+=new/obj/skillcard/Getsuga_Tenshou
			if(usr.stype == "Yammamoto")
				usr.contents+=new/obj/skillcard/Fortress_Blaze
				usr.contents+=new/obj/skillcard/Shoen
				usr.contents+=new/obj/skillcard/Creamation
			if(usr.stype == "Hitsugaya")
				usr.contents+=new/obj/skillcard/Sennen_Hyoro
				usr.contents+=new/obj/skillcard/Shoot_Dragon
				usr.contents+=new/obj/skillcard/Frozen_Heavens
			if(usr.stype == "Aizen")
				usr.contents+=new/obj/skillcard/Invisibility
				usr.contents+=new/obj/skillcard/Copy
				usr.contents+=new/obj/skillcard/Restep
			if(usr.stype == "Muramasa")
				usr.contents+=new/obj/skillcard/Release_Seal
				usr.contents+=new/obj/skillcard/Boost_Negation
			if(usr.stype == "Yumichika")
				usr.contents+=new/obj/skillcard/Ruri_iro_Kujaku
				usr.contents+=new/obj/skillcard/Cyclone_Slash
			if(usr.stype == "Hinamori")
				usr.contents+=new/obj/skillcard/Scatter_Shot
			if(usr.stype == "Stinger")
				usr.contents+=new/obj/skillcard/Rocket
			if(usr.stype == "Hisagi")
				usr.contents+=new/obj/skillcard/Criss_Cross
			if(usr.stype == "Byakuya")
				usr.contents+=new/obj/skillcard/Hakuteiken
			if(usr.stype == "Tousen")
				usr.contents+=new/obj/skillcard/Benihikou
			if(usr.stype == "Zaraki")
				usr.contents+=new/obj/skillcard/Berserk
			if(usr.stype == "Rukia")
				usr.contents+=new/obj/skillcard/Hakuren
			if(usr.stype == "Kaiens")
				usr.contents+=new/obj/skillcard/Wave



			if(usr.stype=="Kido Class"&&usr.level>=800||usr.level>=800&&usr.status=="<font color = #FF5600>Captain</font>"||usr.level>=850&&usr.status=="Lieutenant"||usr.level>=900||usr.race != "Vaizard")
				usr.contents+=new/obj/skillcard/Limit_Release




mob/epzanchanges2
	verb


		resschange()
			set category = "EP"
			set name = "Ress Change"

			usr.ressurectiontype = input("Choose a ress",usr.ressurectiontype) in list("Del Toro","Dordoni","Nell",\
			"Nnoitra","Tijereta","Zommari","Luppi","Shooter","Skeleton","Ulq","Volcanica","Pantera","Scientist","Halibel")
			alert(usr,"Your Ress has been set to: [ressurectiontype].")
			usr.Respec()
			var obj/skillcard/Sharingan/y = locate() in usr.contents
			var obj/skillcard/Hell_Armor/z = locate() in usr.contents
			var obj/skillcard/Pure_Atk/a = locate() in usr.contents
			var obj/skillcard/Pure_Rei/b = locate() in usr.contents
			var obj/skillcard/Pure_Def/c = locate() in usr.contents
			var obj/skillcard/Hyosuke_Stun/d = locate() in usr.contents
			var obj/skillcard/Instant_Regen/e = locate() in usr.contents
			var obj/skillcard/Arrancar_Release/f = locate() in usr.contents
			var obj/skillcard/Create_Mini_Kushanada/t = locate() in usr.contents
			if(!isnull(t))usr.gotmini=1
			if(!isnull(y))usr.gotshar=1
			if(!isnull(z))usr.gotha=1
			if(!isnull(a))usr.gotatk=1
			if(!isnull(b))usr.gotrei=1
			if(!isnull(c))usr.gotdef=1
			if(!isnull(d))usr.gothyostun=1
			if(!isnull(e))usr.gotinre=1
			if(!isnull(f))usr.gotarrea=1
			for(var/obj/skillcard/x in usr.contents)
				usr.contents -= x
			usr.Reset_Skillcards()
			usr.gotspear=0
			usr.gotsovereign=0
			usr.gotlacerate=0
			usr.gotoutrage=0
			usr.gotheat=0
			usr.gotdragon=0
			usr.gotdesgarron=0
			usr.gotcascada=0
			usr.gottentacle=0
			usr.gottentacle2=0
			usr.gotage=0
			usr.gotthrow=0
			usr.gotwolf=0
			usr.gotdualswords=0
			usr.gotyoyo=0
			usr.contents+=new/obj/skillcard/Sense
			usr.contents+=new/obj/skillcard/Hide_Presence
			usr.contents+=new/obj/skillcard/Flash_Step
			usr.contents+=new/obj/skillcard/Flashing_Attack
			usr.contents+=new/obj/skillcard/Spiritual_Pressure
			usr.contents+=new/obj/skillcard/Segunda_Ress
			usr.contents+=new/obj/skillcard/Ressurection
			usr.contents+=new/obj/skillcard/HollowRage
			usr.contents+=new/obj/skillcard/Roar
			if(usr.gotneg)
				usr.contents+=new/obj/skillcard/Negacion	*/