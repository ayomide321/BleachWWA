mob/var
	leaderbonus=0
	shinipassive=0
	headpassive=0
	bodypassive=0
	armpassive=0
	legpassive=0
	powerhit=0
	regenrate=100
	regenpassive=0
	bloodlust=0
	hierro=0
	instinct=0
	quickflash=0
	berserk=0
	senka=0
	combat1=0
	combat2=0
	combat3
	alcoholic=10
	list/Skills=new
	senkacounter
	woundregen=0
	rudecomment=0
	racist=0
	toughguy=0
	ruthless=0
	ichimoment=0
	whoareyou=0
	olympics=0
	cannibalism=0
	angel=0
	spyp=0
	respect=0
	face=0
	treason=0
	loyalty=0
	glare=0
	boneharden=0
	survival=0
	openstrike=0
	hibernation=0
	hypebeast=0
	backup=0
	armorpassive=0
	piercepassive=0
	matador=0
	criticalhits=0
	invincibility=0
	secondchance=0
	reidrainage=0
	stunpassive=0
	guildpassive=0
	marksman=0
	truereiatsu=0
turf/Combos
	layer=99
	plane=2
	icon='Icons/cards.dmi'
	Treason
		icon_state="treason"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"You do 20% more damage to enemies that are your race.Do you want Treason?(This can't be undone)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.treason)
						usr<<"You already have Treason."
						return
					if(!usr.combos)usr<<"You don't have any combo points"
					if(usr.combos)
						usr.treason=1
						usr.combos-=1
	Loyalty
		icon_state="loyalty"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"You do 20% more damage to enemies that aren't your race, but you do 20% less damage to enemies that are your race.Do you want Loyalty?(This can't be undone)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.loyalty)
						usr<<"You already have Loyalty."
						return
					if(!usr.combos)usr<<"You don't have any combo points"
					if(usr.combos)
						usr.loyalty=1
						usr.combos-=1
	Say_It_To_My_Face
		icon_state="Say It To My Face"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"If you are attacked from more than 5 tiles away you will only take half damage.Do you want Say It To My Face?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.face)
						usr<<"You already have Say It To My Face."
						return
					if(!usr.combos)usr<<"You don't have any combo points"
					if(usr.combos)
						usr.face=1
						usr.combos-=1
	Cannibalism
		icon_state="Cannibalism"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"If you attack someone with over 100 wounds while their koed theres a 50% you eat them and they die but 50% chance of you passing out.Do you want Cannibalism?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.cannibalism)
						usr<<"You already have Cannibalism."
						return
					if(!usr.combos)usr<<"You don't have any combo points"
					if(usr.combos)
						usr.cannibalism=1
						usr.combos-=1
	Respect
		icon_state="respect"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"When hostile npcs see you there is a 50% chance they'll rethink about attacking you.Do you want Respect?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.respect)
						usr<<"You already have Respect."
						return
					if(!usr.combos)usr<<"You don't have any combo points"
					if(usr.combos)
						usr.respect=1
						usr.combos-=1
	Who_Are_You
		icon_state="whoareyou"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"If you have a status you take 5% less damage and do 5% more damage to people without statuses.Do you want Who Are You?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.whoareyou)
						usr<<"You already have Who Are You."
						return
					if(!usr.combos)usr<<"You don't have any combo points"
					if(usr.combos)
						usr.whoareyou=1
						usr.combos-=1
	Ichigo_Moment
		icon_state="ichimoment"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"If you are koed with over 100 wounds there's a 10% chance to survive and only have 119 wounds.Do you want Ichigo Moment?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.ichimoment)
						usr<<"You already have Ichigo Moment."
						return
					if(!usr.combos)usr<<"You don't have any combo points"
					if(usr.combos)
						usr.ichimoment=1
						usr.combos-=1
	Ruthless
		icon_state="ruthless"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"When attacking someone with a lower level you do 10% more damage.Do you want to be Ruthless?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.ruthless)
						usr<<"You are already Ruthless."
						return
					if(!usr.combos)usr<<"You don't have any combo points"
					if(usr.combos)
						usr.ruthless=1
						usr.combos-=1
	Tough_Guy
		icon_state="tough guy"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"When attacking someone with a higher level you do 10% more damage.Do you want to be a Tough Guy?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.toughguy)
						usr<<"You are already a Tough Guy."
						return
					if(!usr.combos)usr<<"You don't have any combo points"
					if(usr.combos)
						usr.toughguy=1
						usr.combos-=1
	Racist
		icon_state="racist"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"You do 5% more damage to someone with a different skin colour (eg: Pale skin vs Tan skin, Tan skin vs Vasto skin, Menos skin vs Vasto skin).Do you want to be Racist?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.racist)
						usr<<"You are already Racist."
						return
					if(!usr.combos)usr<<"You don't have any combo points"
					if(usr.combos)
						usr.racist=1
						usr.combos-=1
	Grab
		icon_state="grab"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"If you press F right after being attacked by a melee attack you will grab them, disabling them from moving, giving you a clean hit. Do you want grab?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.combat3)
						usr<<"You already have the [usr.combat3] Grab."
						return
					if(!usr.combos)usr<<"You don't have any combo points"
					if(usr.combos)
						usr.combat3=1
						usr.combos-=1
	Clash
		icon_state="rocks"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"Right when you and an enemy use a melee skill you two will clash. The winner of the clash will be determined on rock, paper, scissors 50% of the time. Do you want clash(Type you get is random)?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.combat2)
						usr<<"You already have the [usr.combat2] Clash."
						return
					if(!usr.combos)usr<<"You don't have any combo points"
					if(usr.combos)
						var/d=pick(1,2,3)
						if(d==1)
							usr<<"You bought the Paper Clash"
							usr.combat2="Paper"
						if(d==2)
							usr<<"You bought the Rock Clash"
							usr.combat2="Rock"
						if(d==3)
							usr<<"You bought the Scissors Clash"
							usr.combat2="Scissors"
						usr.combos-=1
	Berserk
		icon_state="critical"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"Hold F before releasing to charge up your attack, however you will be immobile while charging (works with skills if holding F before firing skill). Do you want Charge?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.combat1)
						usr.combat1=0
						usr<<"You already have this already."
						return
					if(!usr.combos)
						usr<<"This is broken"
						return
	Senka_Counter
		icon_state="senka counter"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"Press F right after being hit by senka to counter it. Do you want Senka Counter?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.senkacounter)
						usr<<"You already have Senka Counter."
						return
					if(!usr.senkacounter)usr<<"You don't have any combo points"
					if(usr.combos)
						usr<<"You bought the Senka Counter"
						usr.senkacounter=1
						usr.combos-=1
turf/Passives
	plane=2
	layer=99
	icon='Icons/cards.dmi'
	Rei_Drainage
		icon_state="rei drain"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"2% chance that when you attack someone you drain 15% of their reiatsu energy. Do you want to buy the Reiatsu Drainage Passive for 2 passive point?([usr.reidrainage]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.reidrainage>=5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<2)
						usr<<"You don't have enough passive points.([usr.skillspassive]/2)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Rei Drainage Passive"
						usr.reidrainage+=1
						usr.skillspassive-=2
	Guild_Passive
		icon_state="guild"
		Click()
			switch(input(usr, "Halfs run delay always, as long as you are in a guild. Do you want to buy the Guild_Passive for 5 passive points? *This skill requires you to have 50 guild points but does not take 50 guild points away ([usr.guildpassive]/1) ([usr.guildpoints]/50)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.guildpassive>=1)
						usr<<"You already have this passive."
						return
					if(usr.guildname<1)
						usr<<"You must be in a guild to buy this passive."
						return
					if(usr.skillspassive<15&&usr.guildpoints<50)
						usr<<"You don't have enough passive and guild points for this.([usr.skillspassive]/15)([usr.guildpoints]/50)"
						return
					if(usr.skillspassive)
						usr<<"You bought the guild passive"
						usr.guildpassive+=1
						usr.skillspassive-=15

	Second_Chance
		icon_state="2nd chance"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"5% chance that when you take damage equal to more than 50% of your health you will still live. Do you want to buy the 2nd Chance Passive for 3 passive point?([usr.secondchance]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.secondchance>=5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<3)
						usr<<"You don't have enough passive points.([usr.skillspassive]/3)"
						return
					if(usr.skillspassive)
						usr<<"You bought the 2nd Chance Passive"
						usr.secondchance+=1
						usr.skillspassive-=3
	Critical_Hit
		icon_state="crithit"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"2% chance that you'll land a critical hit which does 50% more damage. Do you want to buy the Critical Hit Passive for 2 passive point?([usr.criticalhits]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.criticalhits>=5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<2)
						usr<<"You don't have enough passive points.([usr.skillspassive]/2)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Critical Hit Passive"
						usr.criticalhits+=1
						usr.skillspassive-=2
	Marks_Man
		icon_state="marksman"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"This passive uses your level to your advantage by muliplying your level by 11, then adding it onto all damage dealt. (THIS INCLUDES ANY FORM OF DAMAGE).. Do you want to buy the Marks Man passive for 20 passive poitns?([usr.marksman]/1)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.marksman>=1)
						usr<<"You already have this passive."
						return
					if(usr.skillspassive<20)
						usr<<"You don't have enough passive points. ([usr.skillspassive]/20)"
						return
					if(usr.skillspassive<=0)
						usr<<"You have no passives points sorry. You gain one passive every 10 levels (two passives every 10 if your rebirthed)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Marks Man passive"
						usr.marksman+=1
						usr.skillspassive-=20

	Invincibility
		icon_state="invinc"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"2% chance that you'll completely ignore damage. Do you want to buy the Invincibility Passive for 3 passive point?([usr.invincibility]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.invincibility>=5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<3)
						usr<<"You don't have enough passive points.([usr.skillspassive]/3)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Invincibility Passive"
						usr.invincibility+=1
						usr.skillspassive-=3
	Matador
		icon_state="matador"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"2% chance that you'll jump out of the way while getting rammed. Do you want to buy the Matador Passive for 1 passive point?([usr.matador]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.matador>=5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<1)
						usr<<"You don't have enough passive points.([usr.skillspassive]/1)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Matador Passive"
						usr.matador+=1
						usr.skillspassive-=1
	Pierce
		icon_state="pierce"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"5% chance that you deal double wounds. Do you want to buy the Pierce Passive for 3 passive point2?([usr.piercepassive]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.piercepassive>=5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<3)
						usr<<"You don't have enough passive points.([usr.skillspassive]/3)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Pierce Passive"
						usr.piercepassive+=1
						usr.skillspassive-=3
	Armor
		icon_state="armor"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"5% chance that when you take over 5 wounds of damage, the amount taken will be halved. Do you want to buy the Armor Passive for 2 passive point?([usr.armorpassive]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.armorpassive>=5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<2)
						usr<<"You don't have enough passive points.([usr.skillspassive]/2)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Armor Passive"
						usr.armorpassive+=1
						usr.skillspassive-=2
	Hypebeast
		icon_state="hypebeast"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"There's a 2% chance that when you press F you will leap 2 tiles towards the target. Do you want to buy the Hypebeast Passive for 1 passive point?([usr.hypebeast]/10)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.hypebeast>=10)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<1)
						usr<<"You don't have enough passive points.([usr.skillspassive]/1)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Hypebeast Passive"
						usr.hypebeast+=1
						usr.skillspassive-=1
	Back_Up
		icon_state="back up"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"There's a 5% chance that when a hypebeast leaps toward you, you will back up 2 tiles. Do you want to buy the Back Up Passive for 1 passive point?([usr.backup]/10)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.backup>=10)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<1)
						usr<<"You don't have enough passive points.([usr.skillspassive]/1)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Back Up Passive"
						usr.backup+=1
						usr.skillspassive-=1
	Hibernation
		icon_state="hibernation"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"While frozen/stunned you regen 5% more health/rei. Do you want to buy the Hibernation Passive for 2 passive points?([usr.hibernation]/10)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.hibernation>=10)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<2)
						usr<<"You don't have enough passive points.([usr.skillspassive]/2)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Hibernation Passive"
						usr.hibernation+=1
						usr.skillspassive-=2
	Open_Strike
		icon_state="open strike"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"If you attack someone while they're on their attack delay you do 5% more damage. Do you want to buy the Open Strike Passive for 1 passive point?([usr.openstrike]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.openstrike>=5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<1)
						usr<<"You don't have enough passive points.([usr.skillspassive]/1)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Open Strike Passive"
						usr.openstrike+=1
						usr.skillspassive-=1
	Survival_of_the_Fittest
		icon_state="Survivalofthefittest"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"When your wounds pass 120 you will deal double damage, when your wounds pass 180 wounds you will deal triple damage(doesn't stack with 120 wounds). Do you want to buy the Survival of the Fittest Passive for 5 passive point?([usr.survival]/1)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.survival)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<5)
						usr<<"You don't have enough passive points.([usr.skillspassive]/5)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Survival of the Fittest Passive"
						usr.survival=1
						usr.skillspassive-=5
	Bone_Harden
		icon_state="bone harden"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"Theres a 7.5% chance that when you're hit in any of your limbs you won't feel the effects. Do you want to buy the Bone Harden Passive for 2 passive point?([usr.boneharden]/10)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.boneharden==10)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<2)
						usr<<"You don't have enough passive points.([usr.skillspassive]/2)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Bone Harden Passive"
						usr.boneharden+=1
						usr.skillspassive-=2
	Threatening_Glare
		icon_state="glare"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"Anyone that targets you will do 5% less damage. Do you want to buy the Threatening Glare Passive for 3 passive point?([usr.glare]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.glare==5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<3)
						usr<<"You don't have enough passive points.([usr.skillspassive]/3)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Threatening Glare Passive"
						usr.glare+=1
						usr.skillspassive-=3
	RankBoost
		icon_state="capboost"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"If you are Captain or Leiutenant of the Gotei 13 you get a small boost when you turn bankai on(Capt:5%Lt:3%). Do you want to buy the Rank Passive for 1 passive point?([usr.shinipassive]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.shinipassive==5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<1)
						usr<<"You don't have enough passive points.([usr.skillspassive]/1)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Rank Passive"
						usr.shinipassive+=1
						usr.skillspassive-=1
	Gaurdian_Angel
		icon_state="angel"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"When you use a skill there is a 1% chance your gaurdian angel will stand by you and protect you from damage for 2 secs.Do you want Gaurdian Angel Passive [usr.angel]/5?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.angel==5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<1)
						usr<<"You don't have enough passive points.([usr.skillspassive]/1)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Gaurdian Angel Passive"
						usr.angel+=1
						usr.skillspassive-=1
	Spy
		icon_state="Spy"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"You will recieve 10% more exp and money from completing missions.Do you want Spy Passive [usr.spyp]/5?", text) in list ("Yes","No"))
				if("Yes")
					if(usr.spyp==5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<1)
						usr<<"You don't have enough passive points.([usr.skillspassive]/1)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Spy Passive"
						usr.spyp+=1
						usr.skillspassive-=1
	Olympics
		icon_state="olympics"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"Upon starting an event you get a 5% boost in all stats. Do you want to buy the Olympics Passive for 1 passive point?([usr.olympics]/10)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.olympics==10)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<1)
						usr<<"You don't have enough passive points.([usr.skillspassive]/1)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Olympics Passive"
						usr.olympics+=1
						usr.skillspassive-=1
	Berserk
		icon_state="berserk"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"Anytime you get KOed there is a 5% chance to instantly recover (wound penalty will still occur). Do you want to buy the Berserk Passive for 2 passive points?([usr.berserk]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.berserk==5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<2)
						usr<<"You don't have enough passive points.([usr.skillspassive]/2)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Berserk Passive"
						usr.berserk+=1
						usr.skillspassive-=2
	Alcoholic
		icon_state="beer"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"For each level of this passive the side effects of beer are reduced by 10%? Do you want to buy the Alcoholic Passive([10-usr.alcoholic]/10)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.alcoholic==0)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<1)
						usr<<"You don't have enough passive points.([usr.skillspassive]/1)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Alcoholic Passive"
						usr.alcoholic-=1
						usr.skillspassive-=1
	Senka
		icon_state="senka"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"Anytime you flash step past someone there is a 10% chance to cut them. Do you want to buy the Senka Passive for 2 passive points?([usr.senka]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.senka==5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<2)
						usr<<"You don't have enough passive points.([usr.skillspassive]/2)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Senka Passive"
						usr.senka+=1
						usr.skillspassive-=2
	Wound_Regeneration
		icon_state="wound regen"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"Everytime you regenerate health and rei, there is a 4% chance you will regenerate 1 wound. Do you want to buy the Wound Regeneration Passive for 2 passive points?([usr.woundregen]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.woundregen==5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<2)
						usr<<"You don't have enough passive points.([usr.skillspassive]/2)"
						return
					if(usr.skillspassive)
						usr<<"You bought the Wound Regeneration Passive"
						usr.woundregen+=1
						usr.skillspassive-=2
	Head
		icon_state="head"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"For every level of this passive, the chance of hitting someone in their head, causing confusion, is increased by 3%. Do you want to buy the Head Shot Passive?([usr.headpassive]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.headpassive==5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive)
						usr<<"You bought the Head Shot Passive"
						usr.headpassive+=1
						usr.skillspassive-=1
	Instinct
		icon_state="instinct"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"For every level of this passive, You have a 5% chance to instinctly move out of the way of a projectile. Do you want to buy the Instinct Passive?([usr.instinct]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.instinct>=5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive)
						usr<<"You bought the Instinct Passive"
						usr.instinct+=1
						usr.skillspassive-=1
	Quick_Flash
		icon_state="quick flash"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"For every level of this passive, You have a 5% chance to dodge a melee attack. Do you want to buy the Quick Flash Passive?([usr.quickflash]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.quickflash>=5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive)
						usr<<"You bought the Quick Flash Passive"
						usr.quickflash+=1
						usr.skillspassive-=1
	Hierro
		icon_state="hierro"
		Click()
			//if(usr.type==/mob/player)
			switch(input(usr,"For every level of this passive, Arrancars get a 6% defense increase upon going ressurection. Do you want to buy the Hierro Passive?([usr.hierro]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.race!="Hollow" && usr.race!="Arrancar")
						usr<<"You must be a hollow or arrancar to buy this."
						return
					if(usr.hierro==5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive)
						usr<<"You bought the Hierro Passive"
						usr.hierro+=1
						usr.skillspassive-=1

	Body
		icon_state="body"
		Click()
			switch(input(usr,"For every level of this passive, the chance of hitting someone in their core, disabling their skills(doesn't affect npcs), is increased by 3%. Do you want to buy the Body Shot Passive?([usr.bodypassive]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.bodypassive==5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive)
						usr<<"You bought the Body Shot Passive"
						usr.bodypassive+=1
						usr.skillspassive-=1

	Arm
		icon_state="arm"
		Click()
			switch(input(usr,"For every level of this passive, the chance of hitting someone in their arm, disabling their attack, is increased by 3%. Do you want to buy the Arm Attacker Passive?([usr.armpassive]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.armpassive==5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive)
						usr<<"You bought the Arm Attacker Passive"
						usr.armpassive+=1
						usr.skillspassive-=1
	Leg
		icon_state="leg"
		Click()
			switch(input(usr,"For every level of this passive, the chance of hitting someone in their leg, lowering speed, is increased by 3%. Do you want to buy the Leg Breaker Passive?([usr.legpassive]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.legpassive==5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive)
						usr<<"You bought the Leg Breaker Passive"
						usr.legpassive+=1
						usr.skillspassive-=1
	Bloodlust
		icon_state="Bloodlust"
		Click()
			switch(input(usr,"This passive allows you to regenerate even if you're overwounded (100+ wounds). Do you want to buy the Bloodlust Passive for 10 passive points?([usr.bloodlust])", text) in list ("Yes","No"))
				if("Yes")
					if(usr.bloodlust)
						usr<<"You bought this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive>=10)
						usr<<"You bought the Bloodlust Passive"
						usr.bloodlust+=1
						usr.skillspassive-=10
	Regen
		icon_state="regen"
		Click()
			switch(input(usr,"For every level of this passive, your regeneration rate is increased by 6%. Do you want to buy the Regen Passive?([usr.regenpassive]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.regenpassive==5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive)
						usr<<"You bought the Regen Passive"
						usr.regenrate-=6
						usr.regenpassive+=1
						usr.skillspassive-=1
	Stun
		icon_state="critstun"
		Click()
			switch(input(usr,"For every level of this passive, the chance of stunning someone with melee is increased by 3%. Do you want to buy the Stun Passive for 2 passive points(NOTE:Doesn't stack with Rukia/Hitsugaya zan)?([usr.stunpassive]/5)", text) in list ("Yes","No"))
				if("Yes")
					if(usr.stunpassive==5)
						usr<<"You maxed out this passive already."
						return
					if(usr.skillspassive<=0)
						usr<<"You don't have any passive points"
						return
					if(usr.skillspassive<2)
						usr<<"You don't have enough passive points"
						return
					if(usr.skillspassive)
						usr<<"You bought the Stun Passive"
						usr.stunpassive+=1
						usr.skillspassive-=2