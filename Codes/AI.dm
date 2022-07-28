
mob
	New()
		..()
		spawn()src.Affirm_Icon()



		spawn()src.Load_Overlays()
		//if(src.enemy||src.son)
		//	if(!src.npc)
		//		spawn()src.AI()
mob
	Masterdan //THE FUCKING GOAT
		hostile=0
		level=3
		wander=1
		killable=1
		delay=5
	Earth_Guide
		hostile=0
		level=500
		wander=0
		killable=0
		delay=5
		verb/Talk()
			set src in oview(1)
			usr<<"Earth Guide: <font color=green>Hi [usr.name].</font>"
			sleep(10)
			usr<<"Earth Guide: <font color=green>I am your guide.</font>"
			sleep(20)
			usr<<"Earth Guide: <font color=green>I will teach you everything to know about combat.</font>"
			sleep(20)
			if(usr.race=="Sado"||usr.race=="Chad")
				usr<<"Earth Guide: <font color=green>You press F to punch an enemy.</font>"
				sleep(20)
				usr<<"Earth Guide: <font color=green>You press D to block an attack in order to take less damage.</font>"
				sleep(20)
				usr<<"Earth Guide: <font color=green>You have a small change to land critical punches, but there are also many other things involved.</font>"
				sleep(30)
				usr<<"Earth Guide: <font color=green>If you punch someone in the arm their strength will temporarily decrease.</font>"
				sleep(30)
				usr<<"Earth Guide: <font color=green>If you punch someone in the leg they will temporarily be dazed and move slower.</font>"
				sleep(30)
				usr<<"Earth Guide: <font color=green>If you punch someone in the core their defense will temporarily decrease.</font>"
				sleep(30)
				usr<<"Earth Guide: <font color=green>If you punch someone in the head they will be temporarily dizzy and won't be able to attack or move correctly.</font>"
				sleep(30)
				usr<<"Earth Guide: <font color=green>Go out and kill 10 hollows then go on to the next instructor.</font>"
			if(usr.race=="Quincy")
				usr<<"Earth Guide: <font color=green>You press S to charge power and distance for your arrow.</font>"
				sleep(20)
				usr<<"Earth Guide: <font color=green>You press F to shoot your arrow.</font>"
				sleep(20)
				usr<<"Earth Guide: <font color=green>You press D to block an attack in order to take less damage.</font>"
				sleep(20)
				usr<<"Earth Guide: <font color=green>You have a small change to land critical hits, but there are also many other things involved.</font>"
				sleep(30)
				usr<<"Earth Guide: <font color=green>If you hit someone in the arm their strength will temporarily decrease.</font>"
				sleep(30)
				usr<<"Earth Guide: <font color=green>If you hit someone in the leg they will temporarily be dazed and move slower.</font>"
				sleep(30)
				usr<<"Earth Guide: <font color=green>If you hit someone in the core their defense will temporarily decrease.</font>"
				sleep(30)
				usr<<"Earth Guide: <font color=green>If you hit someone in the head they will be temporarily dizzy and won't be able to attack or move correctly.</font>"
				sleep(30)
				usr<<"Earth Guide: <font color=green>Go out and kill 10 hollows then go on to the next instructor.</font>"


mob
	var

		delay=5
		activated=0

		agrange=6
		tired=0
		list/aggrohist=new
		aggrod=0

		newaggro=0
		aggro=0
		killable=0
		wander=1
		hostile=0

	proc
		npcHostile()
			if(!src.aggrod)
				for(var/mob/x in oview(src.agrange,src))
					if(src.pet)
						sleep(30)
						return
					if(x.client)
						if(src.race==x.race&&!src.npccaptain&&!src.gamehollow&&!src.npcespada)
							sleep(30)
							return
						if(src.newkomaboss==1)
							sleep(5)
							src.Aggro(x)
					/*	if(x.respect)
							var/td=pick(1,2)
							if(td==1)
								src.Talks("[x] I got respect for you")
								return	*/
						if(x.squad==7&&x.status=="Captain")
							var/td=pick(1,2,3)
							if(td!=1)
								src.Talks("Hello Captain [x]")
								return
					/*	var/t=rand(1,20)
						if(t==1)
							src.Talks("[x], DIE!")
						if(t==2)
							src.Talks("You should've stayed home.")
						if(t==3)
							if(src.stark||src.barragan||src.hal||src.nnoitra||src.ulquiorra||src.grimmjow||src.zommari||src.szayel)
								src.Talks("Espadas are strongest.")
								src.Aggro(x)
								return
							src.Talks("[src.race]s are strongest.")
						if(t==4)
							src.Talks("I've been itching for a fight")	*/
						src.Aggro(x)
			sleep(30)
			return

		npcDie()
			src.aggro=0
			src.aggrod=0
			src.invisibility=100
			src.loc=null
			spawn(30)
				del(src)





	proc
		Speech(t)
		/*	if(t==1)
				if(src.race=="Arrancar")
					src.Talks("I hope Aizen gives me a promotion:D")
				if(src.race=="Hollow")
					src.Talks("I can't find any souls to devour")
				if(src.race=="Fullbringer"||src.race=="Quincy"||src.race=="Sado")
					src.Talks("It's a pretty good day today!")
				if(src.race=="Shinigami")
					src.Talks("I forgot where my squad is at!")
			if(t==2)
				if(src.race=="Arrancar")
					src.Talks("Nobody can beat my ressurection")
				if(src.race=="Hollow")
					src.Talks("Can't wait till I transform")
				if(src.race=="Fullbringer")
					src.Talks("I'm glad my fullbring is strong!")
				if(src.race=="Quincy")
					src.Talks("I'm glad my bow is strong!")
				if(src.race=="Sado")
					src.Talks("I'm glad my arms are strong!")
				if(src.race=="Shinigami")
					src.Talks("My zanpaktou is unbelievable!")
			if(t==3)
				if(src.race=="Arrancar")
					src.Talks("What ever happened to Grimmjow?")
				if(src.race=="Hollow")
					src.Talks("What ever happened to Grand Fisher?")
				if(src.race=="Fullbringer"||src.race=="Quincy"||src.race=="Sado")
					src.Talks("What ever happened to Tsukishima?")
				if(src.race=="Shinigami")
					src.Talks("What ever happened to Tousen?")
			if(t==4)
				if(src.race=="Arrancar")
					src.Talks("I feel like killing a Shinigami")
				if(src.race=="Hollow")
					src.Talks("I feel like killing a Human")
				if(src.race=="Fullbringer"||src.race=="Quincy"||src.race=="Sado")
					src.Talks("I feel like killing a Hollow")
				if(src.race=="Shinigami")
					src.Talks("I feel like killing a Hollow")
			if(t==5)
				if(src.race=="Arrancar")
					src.Talks("Why aren't we attacking Soul Society?")
				if(src.race=="Hollow")
					src.Talks("Why aren't we invading Earth?")
				if(src.race=="Fullbringer"||src.race=="Quincy"||src.race=="Sado")
					src.Talks("Why aren't we attacking Hueco Mundo?")
				if(src.race=="Shinigami")
					src.Talks("Why aren't we invading Las Noches?")
			if(t==6)
				if(src.race=="Arrancar")
					src.Talks("I wish I got to fight Ichigo")
				if(src.race=="Hollow")
					src.Talks("I wish I got to fight Ichigo")
				if(src.race=="Fullbringer"||src.race=="Quincy"||src.race=="Sado")
					src.Talks("I wish I got to fight Ginjo")
				if(src.race=="Shinigami")
					src.Talks("I wish I got to fight Aizen")
			if(t==7)
				if(src.race=="Arrancar")
					src.Talks("I wonder who built Las Noches?")
				if(src.race=="Hollow")
					src.Talks("I wonder why Hueco Mundo is all sand?")
				if(src.race=="Fullbringer"||src.race=="Quincy"||src.race=="Sado")
					src.Talks("I wonder who built the Quincy Tower and Bar?")
				if(src.race=="Shinigami")
					src.Talks("I wonder who built Soul Society?")
			if(t==8)
				if(src.race=="Arrancar")
					src.Talks("I should visit my nephew in Hueco Mundo. I hope nobody killed him yet")
				if(src.race=="Hollow")
					src.Talks("I should visit my rich brother. He's in Las Noches now")
				if(src.race=="Fullbringer"||src.race=="Quincy"||src.race=="Sado")
					src.Talks("I should visit my parents in the city.")
				if(src.race=="Shinigami")
					src.Talks("I should visit my uncle in Rukongai.")
			if(t==9)
				if(src.race=="Arrancar")
					src.Talks("Time for a killing spree. WOAH")
				if(src.race=="Hollow")
					src.Talks("Time to eat some souls. WOAH")
				if(src.race=="Fullbringer"||src.race=="Quincy"||src.race=="Sado")
					src.Talks("Time to get drunk at the bar. WOAH")
				if(src.race=="Shinigami")
					src.Talks("Time to drink sake with my squad. WOAH")
			if(t==10)
				if(src.race=="Arrancar")
					src.Talks("This suit is awesome XD")
				if(src.race=="Hollow")
					src.Talks("I can't wait till I'm an Arrancar")
				if(src.race=="Fullbringer"||src.race=="Quincy"||src.race=="Sado")
					src.Talks("I need some new clothes")
				if(src.race=="Shinigami")
					src.Talks("I think Earth sells the best clothes")
			if(t==11)
				if(src.race=="Arrancar")
					src.Talks("Time to play matador with Del Toro")
				if(src.race=="Hollow")
					src.Talks("Time to play tag with souls")
				if(src.race=="Fullbringer"||src.race=="Quincy"||src.race=="Sado")
					src.Talks("Time to go target practicing with Ishida")
				if(src.race=="Shinigami")
					src.Talks("Time to smoke with Rangiku")
			if(t==12)
				if(src.race=="Arrancar")
					src.Talks("Time to see Szayel's research")
				if(src.race=="Hollow")
					src.Talks("Time to haunt an apartment")
				if(src.race=="Fullbringer"||src.race=="Quincy"||src.race=="Sado")
					src.Talks("Time to play games with Yukio")
				if(src.race=="Shinigami")
					src.Talks("Time to see Mayuri's research")
			if(t==13)
				if(src.race=="Arrancar")
					src.Talks("Ulq owned me in sparring match-_-")
				if(src.race=="Hollow")
					src.Talks("I almost killed Halibel before she went Arrancar")
				if(src.race=="Fullbringer"||src.race=="Quincy"||src.race=="Sado")
					src.Talks("Chad owned me in boxing -_-")
				if(src.race=="Shinigami")
					src.Talks("Kenpachi owned me in sparring match-_-")
			if(t==14)
				if(src.race=="Arrancar")
					src.Talks("Let's get all our friends and cero people")
				if(src.race=="Hollow")
					src.Talks("Let's get all our friends and start roaring")
				if(src.race=="Fullbringer"||src.race=="Quincy"||src.race=="Sado")
					src.Talks("Let's get all our friends and one-hit kill some people")
				if(src.race=="Shinigami")
					src.Talks("Let's get all our friends and cover the map with Kido 90s")
			if(t==15)
				if(src.race=="Arrancar")
					src.Talks("I need to get that Odd Future mixtape")
				if(src.race=="Hollow")
					src.Talks("Let's turn Will Smith into a hollow")
				if(src.race=="Fullbringer"||src.race=="Quincy"||src.race=="Sado")
					src.Talks("I need to buy that Kendrick album")
				if(src.race=="Shinigami")
					src.Talks("I want to get I am Not a Human Being 2")
			if(t==16)
				src.Talks("HEY, stop listening to me talk")
			if(t==17)
				if(src.race=="Arrancar")
					src.Talks("Mitt Romney lost. Time to take over Earth")
				if(src.race=="Hollow")
					src.Talks("Mitt Romney lost. Dang I owe those Shinigamis $400,000")
				if(src.race=="Fullbringer"||src.race=="Quincy"||src.race=="Sado")
					src.Talks("Obama won. Time to level up")
				if(src.race=="Shinigami")
					src.Talks("Obama won. Those Hollows owe me $400,000")
			if(t==18)
				if(src.race=="Arrancar")
					src.Talks("Lost Vaizard Forest my chillout spot")
				if(src.race=="Hollow")
					src.Talks("I need a chillout spot")
				if(src.race=="Fullbringer"||src.race=="Quincy"||src.race=="Sado")
					src.Talks("Quincy Tower and Bar my chillout spot.")
				if(src.race=="Shinigami")
					src.Talks("Rukongai my chillout spot.")
			if(t==19)
				if(src.race=="Arrancar")
					src.Talks("The store's a rip off. $2,000 for clothes is ridiculous")
				if(src.race=="Hollow")
					src.Talks("I might rob Urahara's shop")
				if(src.race=="Fullbringer"||src.race=="Quincy"||src.race=="Sado")
					src.Talks("Urahara's a rip off. $2,000 for clothes is ridiculous")
				if(src.race=="Shinigami")
					src.Talks("The store's a rip off. $2,000 for clothes is ridiculous")
			if(t==20)
				if(src.race=="Arrancar")
					src.Talks("I wish I had a shinigami suit")
				if(src.race=="Hollow")
					src.Talks("Nobody wants to sell me clothes because they scared I'll devour them.")
				if(src.race=="Fullbringer"||src.race=="Quincy"||src.race=="Sado")
					src.Talks("I wish I had an espada suit")
				if(src.race=="Shinigami")
					src.Talks("I wish I had a quincy suit")
			if(t==21)
				if(src.race=="Arrancar")
					src.Talks("Halibel's pretty nice in person")
				if(src.race=="Hollow")
					src.Talks("Arrancars are mean. We the same species, but they still attack me")
				if(src.race=="Fullbringer"||src.race=="Quincy"||src.race=="Sado")
					src.Talks("Yukio's pretty cool in person")
				if(src.race=="Shinigami")
					src.Talks("Hitsugay's pretty cool in person")
			if(t==22||t==23||t==24||t==25||t==26||t==43)
				var/list/Menu = list()
				for(var/mob/player/M in All_Clients())
					if(M.level>10)
						Menu.Add(M)
				var/mob/x=pick(Menu)
				var/mob/s=pick(Menu)
				if(t==22)
					src.Talks("[x] is pretty cool, he killed my friend but left ME alive")
				if(t==23)
					src.Talks("[x] keeps bug abusing")
				if(t==24)
					src.Talks("I bet I could beat [x] with my eyes closed")
				if(t==25)
					src.Talks("I hate [x] so much >:I")
				if(t==26)
					src.Talks("I heard [x] can beat [s]")
				if(t==43)
					src.Talks("I need to read Karakura Weekly. I heard [x] and [s] are dating, ewww")
			var/list/Menu = list()
			for(var/mob/player/M in All_Clients())
				if(M.level>10)
					Menu.Add(M)
			var/mob/x=pick(Menu)
			if(t==27)
				src.Talks("[x] almost killed me, but Orihime healed me then went somewhere in Lost Vaizard Forest")
			if(t==28)
				src.Talks("[x] is so weak. He needs to train on Squid Hollows lol")
			if(t==29)
				src.Talks("I HATE THIS GAME I QUIT. EVERY PLAYER SPAM KILLS ME")
			if(t==30)
				src.Talks("Did you know that [x] is level [x.level]?")
			if(t==31)
				src.Talks("Nobody can beat [x]")
			if(t==32)
				src.Talks("[x] has only killed [x.kills] players, what a wimp")
			if(t==33)
				src.Talks("[x] got like $[x.money], if I had that kind of money I'd live in a big house at Karakura Town")
			if(t==34)
				src.Talks("[x]! Dats dat dude I dont like *Bang Bang*")
			if(t==35)
				src.Talks("[x] + Stark + Ichigo + Tsukishima = Unstoppable")
			if(t==36||t==37||t==38||t==39)
				src.Talks("The only person dumber than Britney Spears is [x]")
			if(t==40)
				src.Talks("IT'S FRIDAY, FRIDAY, . . .oh wait no it's not")
			if(t==41||t==42)
				src.Talks("Sometimes it feels like my life's a game")
			if(t==44)
				src.Talks("My wife cheated on me with [x]")
			if(t==45)
				src.Talks("I stole [x]'s prom date XD")
			if(t==46)
				src.Talks("2+2=5 -_-")
			if(t==47)
				src.Talks("I gotta take a dump real bad >_<")
			if(t==48)
				src.Talks("Yay, [x] liked my picture on instagram")
			if(t==49)
				src.Talks("I need to hit up Rangiku, Orihime, and Yoruichi on facebook")
			if(t==50)
				src.Talks("It's impossible to beat Aizen in chess, when you think your winning he tells you its an illusion >:|")
			if(t==51)
				src.Talks("I heard Taylor Swift got a new boyfriend")
			if(t==52)
				src.Talks("I can't belive [x] is already pregnant...")
			if(t==53)
				src.Talks("I wish i was like Zagros, hes a legend")
			if(t==54)
				src.Talks("OMG I just won two tickets to see Zagros' new concert!")
			if(t==55)
				src.Talks("OBAMA OBAMA OBAMA OBAMA OBAMA")
			if(t==56)
				src.Talks("Canadians are so much more cool than Americans")
			if(t==57)
				src.Talks("You catch that hockey game, eh?")
			if(t==58)
				src.Talks("ALL HEIL ZAGROS")
			if(t==59)
				src.Talks("SIEG HEIL")
			if(t==60)
				src.Talks("My dad is Tom")
			if(t==61)
				src.Talks("I have a very large genital, so they call me very large genital.")
			if(t==62)
				src.Talks("Zagros made me")
			if(t==63)
				src.Talks("[x] is really Zagros")
			if(t==64)
				src.Talks("[x] hates football")
			if(t==65)
				src.Talks("[x] is a professional soccer player")
			if(t==66)
				src.Talks("I love [x] don't tell Zagros")	*/
		AI()
			set background=1
			var/allset=0
			//for(var/mob/P in oview(10))
			//	if(P)
			if(!src.activated)return
			for(var/mob/D in oview(12,src))
				if(D.client)
					allset=1
					if(D.missiontarget==src&&D.mission==src)
						walk_away(src,D,8,D.rundelay+1)
					if(D.missiontarget==src&&D.mission==4)
						if(src.follow==D)
							src.Approach(D)
					if(D in oview(8,src))
						allset=2
			if(allset)
				if(!src.combat2)
					src.combat2=pick("Rock","Paper","Scissors")
				var/didsomething=0
				if(allset==2)
					if(!src.aggrod)
						var/d=rand(1,100)
						if(d==1)
							var/t=rand(1,50)
							src.Speech(t)
				if(src.hostile&&allset==2)
					src.npcHostile()
					didsomething=1
				if(src.wander)
					didsomething=1
					step_rand(src)
					sleep(20)
				if(!didsomething)return
					//sleep(rand(40,60))
				if(!src.dead)
					spawn()src.AI()
			else
				src.activated=0
				walk(src,0)
				return
				//sleep(150)
				//src.AI()


	proc
		Wander()
			set background = 1
			if(!src.frozen)
				//var/list/pickdirs=list(NORTH,SOUTH,EAST,WEST,NORTHEAST,NORTHWEST,SOUTHEAST,SOUTHWEST)


				step_rand(src)
				sleep(30)
				return
			else
				sleep(50)
				return

	proc
		Aggro(var/mob/M)
			src.pk=1
			src.newaggro=1
			if(src.aggro)
				sleep(10)
				src.aggro=0
				src.aggrod=0



			if(!M)
				return
			if(src.aggrod)
				return
			if(M.z!=src.z)return
			if(src.killable)
				if(src.enemy&&M.enemy&&!src.myclone&&!M.myclone&&!M.pet&&!src.pet&&!src.ismura&&!M.ismura&&!src.iszan&&!M.iszan)
					return
				if(src.myclone==M)
					return
				src.target=M
				src.aggro=M
				src.aggrod=1
				src.newaggro=0
				if(M.partner==src)
					for(var/mob/m in oview(8,src))
						if(m.partner!=src)
							src.target=m
							src.aggro=m
						else
							src.Aggro(m)
				spawn()
					while(src.aggro && src.dead==0 && src.newaggro==0)


						if(!src.frozen)
							if(!M)
								src.aggro=0
								src.aggrod=0
								return
							if(M.safe)
								src.aggro=0
								src.aggrod=0
								return


							var/list/x = oview(1,src)
							if(x.Find(M))
								var/doz=pick(0,1)
								if(doz)
									spawn()src.Dodge(M)
							else

								src.Approach(M)
							if(src.tired==0)
								var/list/Ex = oview(5,src)
								if(Ex.Find(M))
									src.Action_Against(M)
							if(M)
								if(abs(M.x-src.x) > 10 || abs(M.y-src.y)>10 || M.z!=src.z||M.invisibility)
									src.aggrod=0

									spawn(300)
										if(M)
											if(abs(M.x-src.x) > 10 || abs(M.y-src.y)>10|| M.z!=src.z||M.invisibility)
												if(src.earlyichigo||src.ichigo||src.ichigofinal||src.sadofinal||src.uraharafinal||src.ishidafinal||src.tsukishima||src.kenpachi||src.ginjo||src.zommari||src.mayuri||src.race=="Bankai"||src.race=="Inner"||src.willowk||src.frank||src.stark||src.vastoichigo||src.barragan||src.hal||src.nnoitra||src.ulquiorra||src.grimmjow||src.FGT||src.szayel||src.isrealaizen)
													M<<"<b>[src] has left"
													del src
													return
												walk(src,0)
												src.aggro=0
												src.aggrod=0
												src.health=src.mhealth
												src.rei=src.mrei
												if(!src.npccaptain&&!src.npcespada)
													src.wound=0
												if(src.npccaptain&&!src.pet)
													if(src.wound>10)
														src.wound-=10
													if(eventon&&lastevent==3)
														if(src.frozen||src.ko)return
														var/list/Menu=list()
														for(var/mob/player/D in All_Clients())
															if(D.lost&&D.z==19)
																Menu+=D
														if(Menu==list())
															src.aggro=0
															src.aggrod=0
															return
														var/mob/player/L=pick(Menu)
														src.loc=locate(L.x,L.y-1,L.z)
														src.Aggro(L)
												if(src.npcespada&&!src.pet)
													if(src.wound>10)
														src.wound-=10
													if(eventon&&lastevent==7)
														if(src.frozen||src.ko)return
														var/list/Menu=new()
														for(var/mob/player/D in world)
															if(D.lost&&D.z==19)
																Menu+=D
														if(Menu==list())
															src.aggro=0
															src.aggrod=0
															return
														var/mob/player/L=pick(Menu)
														src.loc=locate(L.x,L.y-1,L.z)
														src.Aggro(L)
												if(!src.npcespada&&!src.npccaptain&&!src.ko)
													if(src.inbankai)src.Bankai()
													if(src.inshikai)src.Shikai()
													if(src.armon==4||src.armon==3)src.Arm3()
													if(src.armon==2)src.Arm2()
													if(src.armon==1)src.Arm1()
													if(src.finalb)src.Final()
													if(src.inafull)src.AFullbring()
													if(src.infull)src.Fullbring()
													if(src.maskon)src.Inner_Mode()
													if(src.ressurection)src.Ressurection()


									return
							else
								src.aggro=0
								src.aggrod=0
								src.activated=0
								walk(src,0)

							while(src.frozen)
								sleep(5)
						sleep(src.delay+1)

	proc
		SnatchBall()
			for(var/mob/k in oview(20,src))
				if(k.soccer && k.client)
					step_to(src,k,0)
					if(k in oview(4,src))
						src.dir=get_dir(src,k)
						src.Action_Against(k)
		GoToGoal()
			if(src.soccer)
				for(var/obj/soccer/goal/k in view(5,src))
					src.Facedir(k)
					src.Attack()
				if(src.x>=65)
					for(var/obj/soccer/goal6/k in world)
						step_to(src,k,0)
				if(src.x>=55 && src.x<=64)
					for(var/obj/soccer/goal5/k in world)
						step_to(src,k,0)
				if(src.x>=45 && src.x<=54)
					for(var/obj/soccer/goal4/k in world)
						step_to(src,k,0)
				if(src.x>=35 && src.x<=44)
					for(var/obj/soccer/goal3/k in world)
						step_to(src,k,0)
				if(src.x>=25 && src.x<=34)
					for(var/obj/soccer/goal2/k in world)
						step_to(src,k,0)
				if(src.x>=15 && src.x<=24)
					for(var/obj/soccer/goal1/k in world)
						step_to(src,k,0)
				for(var/obj/soccer/goal/k in view(21,src))
					step_to(src,k,0)
				sleep(2)

		FlashStepNPC(mob/M)
		//	var/d=rand(1,100)
		//	if(d==1)
		//		src.Talks("Can you keep up?")
			var/list/Menu = list()
			var/turf/Td = locate(M.x,M.y,M.z)
			var/turf/T = locate(M.x+4,M.y,M.z)
			var/turf/T1 = locate(M.x-4,M.y,M.z)
			var/turf/T2 = locate(M.x,M.y+4,M.z)
			var/turf/T3 = locate(M.x,M.y-4,M.z)
			var/turf/T4 = locate(M.x+3,M.y+3,M.z)
			var/turf/T5 = locate(M.x-3,M.y+3,M.z)
			var/turf/T6 = locate(M.x-3,M.y+3,M.z)
			var/turf/T7 = locate(M.x-3,M.y-3,M.z)
			if(T&&!T.density)
				if(T in view(M))
					Menu.Add(T)
			if(T1&&!T1.density)
				if(T1 in view(M))
					Menu.Add(T1)
			if(T2&&!T2.density)
				if(T2 in view(M))
					Menu.Add(T2)
			if(T3&&!T3.density)
				if(T3 in view(M))
					Menu.Add(T3)
			if(T4&&!T4.density)
				if(T4 in view(M))
					Menu.Add(T4)
			if(T5&&!T5.density)
				if(T5 in view(M))
					Menu.Add(T5)
			if(T6&&!T6.density)
				if(T6 in view(M))
					Menu.Add(T6)
			if(T7&&!T7.density)
				if(T7 in view(M))
					Menu.Add(T7)
			if(Menu&&Menu.len)
				src.shunning=1
				var/turf/x1 = pick(Menu)
				var/obj/afterImage/afterImage2 = new /obj/afterImage()
				afterImage2.layer = MOB_LAYER
				afterImage2.icon=src.icon
				afterImage2.icon_state=src.icon_state
				afterImage2.overlays=src.overlays
				afterImage2.underlays = src.underlays
				afterImage2.dir=src.dir
				afterImage2.loc = src.loc
				afterImage2.zer = 1
				flick("shun",afterImage2)
				flick("shun",src)
				src.Move(x1)
			else
				src.Move(Td)
				return
			if(src.loc==null)src.Move(Td)
			src.shunning=0
			sleep(20)

		Approach(var/mob/M)
			if(M.z==src.z)
				var/d=get_dist(src,M)
				if(d>12)
					src.activated=0
					walk(src,0)
					return
				//src.icon_state="Run"

				//step_to(src,M)
				if(src.myclone==M)
					walk_to(src,M,1,1)
				if(M in oview(1,src))
					if(src.fstyle==1)
						src.FlashStepNPC(M)
					if(src.fstyle==3)
						src.Circling(M)
					if(src.fstyle==2)
						src.moving=0
						step_away(src,M)
						src.moving=1
						src.Facedir(M)
						spawn(src.rundelay)
							src.moving=0
							step_away(src,M)
							src.Facedir(M)
					if(src.fstyle==4)
						src.RunFrom(M)
						return
					src.Facedir(M)
					return
				if(M in oview(3,src))
					if(src.fstyle==1)
						src.FlashStepNPC(M)
					if(src.fstyle==2)
						src.moving=0
						step_away(src,M)
						src.Facedir(M)
						return
					if(src.fstyle==3)
						src.Circling(M)
						return
					if(src.fstyle==4)
						src.RunFrom(M)
						return
					step_to(src,M)
					return
				if(M in oview(10,src))
					if(src.isrealaizen||src.mayuri||src.stark||src.vastoichigo||src.ulquiorra||src.grimmjow||src.isfgt||src.szayel||src.vasto||src.bossyama||src.bossyama2)
						walk_to(src,M,1,rundelay-1)
						return
					walk_to(src,M,1,src.rundelay)
					return
				if(M in oview(8,src))
					if(src.bossyama2||src.bossyama||src.isrealaizen||src.fgetsugas||src.mayuri||src.race=="Vaizard"||src.race=="Arrancar"||src.race=="Sub-Shinigami"||src.race=="Shinigami"||src.race=="Quincy"||src.race=="Espada"||src.race=="Numero"||src.race=="Bankai"||src.race=="Inner"||src.willowk||src.frank||src.vastoichigo)
						if(src.race=="Bankai")
							var/sound/S = sound('Sounds/Aizen/WAVE_VO_AIZE_041_000.wav',volume=50)
							view(src) << S
						if(src.mayuri)
							var/sound/S = sound('Sounds/Mayuri/WAVE_VO_MAYU_045_000.wav',volume=50)
							view(src) << S
						//walk(src,0)
						var/turf/T= get_step(M,src.dir)
						src.flashstep=1
						src.shunning=1
						var/obj/afterImage/afterImage2 = new /obj/afterImage()
						afterImage2.layer = MOB_LAYER
						afterImage2.icon=src.icon
						afterImage2.icon_state=src.icon_state
						afterImage2.overlays=src.overlays
						afterImage2.underlays = src.underlays
						afterImage2.dir=src.dir
						afterImage2.loc = src.loc
						afterImage2.zer = 1
						flick("shun",afterImage2)
						flick("shun",src)
						for(var/mob/s in oview(2))
							step_away(s,src,5)
						var/delay = 60
						src.Move(T)
						src.shunning=0
						if(src.fstyle==2)
							src.moving=0
							step_away(src,M)
							src.Facedir(M)
							spawn(src.rundelay)
								step_away(src,M)
								src.Facedir(M)
								spawn(src.rundelay)
									step_away(src,M)
									src.Facedir(M)
						delay -= 10
					if(src.race=="Fullbringer")
						new/obj/afterimage3(src.loc)
						var/turf/T= get_step(M,src.dir)
						src.flashstep=1
						flick("shun",src)
						src.shunning=1
						src.Move(T)
						src.shunning=0
					else
						if(src.kenpachi&&!src.ko)
							var/ks=pick(1,2,3,4,5,6,7,8)
							if(ks==1)
								var/sound/S = sound(pick('Sounds/Kenpachi/WAVE_VO_KENP_034_000.wav','Sounds/Kenpachi/WAVE_VO_KENP_035_000.wav'),volume=50)
								view(src) << S
							var/k=pick(1,2,3,1,2,2,4,4)
							if(k==1)
								walk_to(src,M,0,2)
							if(k==2||k==3)
								walk_to(src,M,0,1)
							if(k==4)
								walk_to(src,M,1,3)
						if(src.shonshui&&!src.ko)
							var/ks=pick(1,2,3,4,5,6,7,8)
							if(ks==1)
								var/sound/S = sound(pick('Sounds/Shunsui/WAVE_VO_SYUN_024_000.wav','Sounds/Shunsui/WAVE_VO_SYUN_030_000.wav'),volume=50)
								view(src) << S
							var/k=pick(1,2,3,1,2,2,4,4)
							if(k==1)
								walk_to(src,M,0,2)
							if(k==2||k==3)
								walk_to(src,M,0,1)
							if(k==4)
								walk_to(src,M,1,3)
						else
							walk_to(src,M,1,3)
				if(M in oview(12,src))
					if(src.race=="Sub-Shinigami"||src.npcespada||src.npccaptain||src.fgetsugas||src.zommari||src.mayuri||src.race=="Bankai"||src.race=="Inner"||src.willowk||src.frank||src.stark||src.vastoichigo||src.barragan||src.hal||src.nnoitra||src.ulquiorra||src.grimmjow||src.isfgt||src.szayel||src.vasto||src.isrealaizen||src.hollowtype=="Kushanada"||src.Yokai1==1||src.Yokai2==1||src.Yokai3==1||src.Yokai4==1)
						if(src.race=="Bankai")
							var/sound/S = sound('Sounds/Aizen/WAVE_VO_AIZE_041_000.wav',volume=50)
							view(src) << S
						if(src.mayuri)
							var/sound/S = sound('Sounds/Mayuri/WAVE_VO_MAYU_045_000.wav',volume=50)
							view(src) << S
						//walk(src,0)
						var/turf/T= get_step(M,src.dir)
						src.shunning=1
						var/obj/afterImage/afterImage2 = new /obj/afterImage()
						afterImage2.layer = MOB_LAYER
						afterImage2.icon=src.icon
						afterImage2.icon_state=src.icon_state
						afterImage2.overlays=src.overlays
						afterImage2.underlays = src.underlays
						afterImage2.dir=src.dir
						afterImage2.loc = src.loc
						afterImage2.zer = 1
						flick("shun",afterImage2)
						flick("shun",src)
						for(var/mob/s in oview(2))
							step_away(s,src,5)
						src.Move(T)
						src.shunning=0
				else
					walk(src,0)
					//if(!usr.inshikai)
					//	usr.Shikai()

				//spawn(2)src.icon_state=""


	proc
		Dodge(var/mob/M)
			if(src.fstyle==3)
				src.Circling(M)
				return
			if(src.fstyle==2)
				for(var/obj/k in oview(2))
					if(k.Gowner==M)
						step(src,src.DeflectionDirection(k))
						return
			var/list/options=new()
			for(var/turf/x in oview(1,src))
				for(var/turf/X in oview(1,M))
					if(x==X)
						var/turf/ex = locate(X.x,X.y,X.z)
						var/mob/ey=locate(X.x,X.y,X.z)
						var/obj/ez=locate(X.x,X.y,X.z)
						if(!ex.density && !ey.density && !ez.density)
							options+=x
			if(options.len>1)
				step_towards(src,pick(options))
	proc
		Circling(var/mob/M)
			src.moving=0
			src.Facedir(M)
			src.dir = turn(src.dir, 45)
			step(src,src.dir)
			src.moving=1
			sleep(src.rundelay+2)
	proc
		RunFrom(var/mob/M)
		//	var/d=rand(1,100)
		/*	if(d==1)
				if(src.rundelay<=2)
					src.Talks("Can't catch me lol")
				if(src.rundelay>2)
					src.Talks("Can't get away")	*/
			var/g=src.rundelay
			if(g<0)g=0
			walk_away(src,M,g)
			sleep(g*3)
			walk(src,0)
	proc
		Canstep(dx,dy,dz)
			var/turf/x1=locate(dx,dy,dz)
			var/obj/x2=locate(dx,dy,dz)
			var/mob/x3=locate(dx,dy,dz)
			if(!x1.density && !x2.density && !x3.density)
				return 1
			else
				return 0
	proc
		Step_Back(var/atom/M)
			if(src.fstyle==2||src.fstyle==3)return
			if(M)
				if(src.x==M.x)step(src,pick(NORTH,NORTHWEST,NORTHEAST,SOUTH,SOUTHEAST,SOUTHWEST))
			if(M)
				if(src.y==M.y)step(src,pick(NORTHWEST,NORTHEAST,EAST,SOUTHEAST,SOUTHWEST,WEST))
			sleep(src.rundelay)
	proc
		Action_Against(var/mob/M)
			if(!src.stunned)
				usr=src
				//src.tired=1
				var/list/x = oview(5,src)
				src.Facedir(M)
				if(x.Find(M))
					src.etarget=M
				/*	if(usr.ko)
						var/gjh=rand(1,100)
						if(gjh==1)
							src.Talks("I'LL KILL YOU!!!")
						return	*/
					if(usr.toochep)
						usr.inoueshield = 1
						usr.inouecool=1
						usr.protected = 1
					if(usr.fstyle==1)
						var/kli=pick(1,2,3,4,5)
						if(kli==1)
							src.FlashStepNPC(M)
					if(usr.fstyle==2)
						var/kli=pick(1,2)
						if(kli==1)
							if(M in oview(1,src))
								src.moving=0
								step_away(src,M)
								src.moving=1
								src.Facedir(M)
								spawn(src.rundelay)
									src.moving=0
									step_away(src,M)
									src.moving=1
									src.Facedir(M)
									spawn(src.rundelay)
										src.moving=0
										step_away(src,M)
										src.Facedir(M)
					if(usr.fstyle==3)
						var/kli=pick(1,2)
						if(kli==1)
							src.Circling(M)
					if(usr.fstyle==4)
						var/kli=pick(1,2)
						if(kli==1)
							src.RunFrom(M)
					if(M==usr.myclone)
						usr.aggro=null
					if(usr.soccer)
						sleep(1)
						usr.GoToGoal()
						return
					if(M.soccer && M in oview(1,usr))
						usr.dir=get_dir(usr,M)
						usr.Attack()
					if(usr.race=="Sado" && !usr.ultimatesado &&!usr.sadostrong&&!usr.ko)
						if(!usr.armon)
							usr.Arm1()
						var/t=pick(1,5)
						if(t==1)
							usr.Step_Back(M)
						if(t==5)
							usr.Power_Blast()
					if(usr.psp&&!usr.ko)
						var/t=pick(1)
						if(t==1)
							usr.Step_Back(M)
						//if(t==2)
						//	usr.Create_Monsters()

					if(usr.sadostrong&&!usr.ko)
						if(!usr.armon)
							usr.Arm2()
						var/t=pick(1,2,5)
						if(t==1)
							usr.Step_Back(M)
						if(t==2)
							usr.El_Directo()
						if(t==5)
							usr.Power_Blast()
					if(usr.bossyama)
						var/t=pick(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17)
						if(usr.wound>1)
							if(!usr.inshikai&&!usr.inbankai)
								if(usr.inbankai)return
								if(usr.inshikai)return
								usr.Shikai()
								usr.Bankai()

						if(t==1)usr.Step_Back(M)
						if(t==2)usr.El_Directo()
						if(t==5)usr.Power_Blast()
						if(t==6)usr.Lamuerte()
						if(t==3)usr.Cero()
						if(t==4)usr.Cero2()
						if(prob(20))usr.Instant_Regen()
						if(t==8||t==10)usr.SwordFBStun()
						if(t==9||t==11)usr.Air_Strike()
						if(prob(30))usr.Amaterasu()
						if(t==12)usr.Shadow()
						if(t==13)usr.Rage_Spin()
						if(prob(10))usr.Drainage()
						if(t==14)usr.Blood_Thirsty()
						if(t==15)usr.FireDollSlash()
						if(t==16)usr.FirePillar()
						if(t==17)usr.FirePillarBlue()
						if(t==18)usr.Regeneration_Mode()


					if(usr.bossyama2)
						var/t=pick(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17)
						if(usr.wound>1)
							if(!usr.inshikai&&!usr.inbankai)
								if(usr.inbankai)return
								if(usr.inshikai)return
								usr.Shikai()
								usr.Bankai()

						if(t==1)usr.Step_Back(M)
						if(t==2)usr.El_Directo()
						if(t==5)usr.Power_Blast()
						if(t==6)usr.Lamuerte()
						if(t==3)usr.Cero()
						if(t==4)usr.Cero2()
						if(prob(20))usr.Instant_Regen()
						if(t==8||t==10)usr.SwordFBStun()
						if(t==9||t==11)usr.Air_Strike()
						if(prob(30))usr.Amaterasu()
						if(t==12)usr.Shadow()
						if(t==13)usr.Rage_Spin()
						if(prob(10))usr.Drainage()
						if(t==14)usr.Blood_Thirsty()
						if(t==15)usr.FireDollSlash()
						if(t==16)usr.FirePillar()
						if(t==17)usr.FirePillarBlue()
						if(t==18)usr.Regeneration_Mode()



					if(usr.sadofinal&&!usr.ko)
						if(!usr.armon)
							usr.Arm3()
						var/t=pick(1,2,3,4,5,6,6,6,7,8,9)
						if(t==8)usr.flashmelee=1
						if(t==9)usr.flashmelee=0
						if(t==1)usr.Step_Back(M)
						if(t==2)usr.El_Directo()
						if(t==3)usr.El_Directo()
						if(t==4)usr.Diablo_Besar()
						if(t==5)usr.Power_Blast()
						if(t==6)usr.Lamuerte()
						if(t==7)
							var/obj/afterImage/afterImage2 = new /obj/afterImage()
							afterImage2.layer = MOB_LAYER
							afterImage2.icon=usr.icon
							afterImage2.icon_state=usr.icon_state
							afterImage2.overlays=usr.overlays
							afterImage2.underlays = usr.underlays
							afterImage2.dir=usr.dir
							afterImage2.loc = usr.loc
							afterImage2.zer = 1
							flick("shun",afterImage2)
							usr.shun = 1
							usr.shunning=1
							src.Move(M.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.shunning=0
							if(usr.flashpause-20<=10)
								usr.flashpause=10
							sleep(usr.flashpause-20)
							if(usr)
								usr.shun = 0
					if(usr.ultimatesado&&!usr.ko||usr.Demon_Boss&&!usr.ko||usr.race=="Kushanada"&&!usr.ko)
						if(!usr.armon)
							usr.Arm3()
						if(!usr.ko)
							var/t=pick(1,2,4,4,2,3,4,5,2,4,6,6,7,8,9,9,9,10,11,12)
							if(t==1)
								usr.Step_Back(M)
							if(t==11)
								usr.flashmelee=1
							if(t==12)
								usr.flashmelee=0
							if(t==2)
								usr.El_Directo()
							if(t==4)
								usr.Diablo_Besar()
							if(t==5)
								usr.Power_Blast()
							if(t==9)
								usr.Cero()
							if(t==10)
								usr.Cero2()
							if(t==6)
								usr.Lamuerte()
							if(t==7)
								usr.Instant_Regen()
							if(t==8)
								var/obj/afterImage/afterImage2 = new /obj/afterImage()
								afterImage2.layer = MOB_LAYER
								afterImage2.icon=usr.icon
								afterImage2.icon_state=usr.icon_state
								afterImage2.overlays=usr.overlays
								afterImage2.underlays = usr.underlays
								afterImage2.dir=usr.dir
								afterImage2.loc = usr.loc
								afterImage2.zer = 1
								flick("shun",afterImage2)
								usr.shun = 1
								usr.shunning=1
								src.Move(M.loc)
								usr.moving = 0
								new/obj/afterimage(usr.loc)
								usr.moving = 0
								new/obj/afterimage(usr.loc)
								usr.moving = 0
								new/obj/afterimage(usr.loc)
								usr.shunning=0
								if(usr.flashpause-20<=10)
									usr.flashpause=10
								sleep(usr.flashpause-20)
								if(usr)
									usr.shun = 0
					if(usr.race=="Fire Demon"&&!usr.ko||usr.race=="Dark Pheonix&&!usr.ko"||usr.race=="Fire Demon2"&&!usr.ko||usr.race=="Dark Pheonix2"&&!usr.ko||usr.race=="Fire Demon3"&&!usr.ko||usr.race=="Dark Pheonix3"&&!usr.ko)
						var/t=pick(1,1,2,2,3,4,5,6,7,7)
						if(t==1)
							usr.Shoen()
						if(t==2)
							usr.etarget=M
							usr.Creamation()
							usr.etarget=null
						if(t==3)
							usr.Encircle()
						if(t==4)
							sleep(15)
							var/L=src.overlays
							flick("Sword Slash1",src)
							flick("Sword Slash1",L)
						if(t==5)
							usr.Spiritual_Pressure()
						if(t==6)
							var/obj/afterImage/afterImage2 = new /obj/afterImage()
							afterImage2.layer = MOB_LAYER
							afterImage2.icon=usr.icon
							afterImage2.icon_state=usr.icon_state
							afterImage2.overlays=usr.overlays
							afterImage2.underlays = usr.underlays
							afterImage2.dir=usr.dir
							afterImage2.loc = usr.loc
							afterImage2.zer = 1
							flick("shun",afterImage2)
							usr.shun = 1
							usr.shunning=1
							src.Move(M.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.shunning=0
							if(usr.flashpause-20<=10)
								usr.flashpause=10
							sleep(usr.flashpause-20)
							if(usr)
								usr.shun = 0
						if(t==7)
							usr.Step_Back(M)
					if(usr.race=="Yammy Boss"&&!usr.ko||usr.race=="Yammy Boss2"&&!usr.ko||usr.race=="Yammy Boss3"&&!usr.ko)
						var/t=pick(1,2,4,4,5,5,6)
						if(t==1)
							usr.Pantera_Roar()
						if(t==2)
							usr.Cero()
						if(t==4)
							usr.Bala()
						if(t==5)
							sleep(15)
							var/L=src.overlays
							flick("punch",src)
							flick("punch",L)
						if(t==6)
							usr.Cero2()
					if(usr.race=="Rawr NPC"&&!usr.ko||usr.race=="Rawr NPC2"&&!usr.ko||usr.race=="Rawr NPC3"&&!usr.ko)
						var/t=pick(1,1,1,1,2,3,3)
						if(t==1)
							sleep(15)
							var/L=src.overlays
							flick("Sword Slash1",src)
							flick("Sword Slash1",L)
						if(t==2)
							usr.Step_Back(M)
						if(t==3)
							usr.Flash_Smash()
					if(usr.race=="Hollow NPC"&&!usr.ko||usr.race=="Hollow NPC2"&&!usr.ko||usr.race=="Hollow NPC3"&&!usr.ko)
						var/t=pick(1,1,1,1,2,3,3,4,4)
						if(t==1)
							sleep(15)
							var/L=src.overlays
							flick("Sword Slash1",src)
							flick("Sword Slash1",L)
						if(t==2)
							usr.Step_Back(M)
						if(t==3)
							usr.Cero()
						if(t==4)
							usr.Roar()
					if(usr.race=="Demon NPC"&&!usr.ko||usr.race=="Demon NPC2"&&!usr.ko||usr.race=="Demon NPC3"&&!usr.ko)
						var/t=pick(1,1,1,1,2,3)
						if(t==1)
							sleep(15)
							var/L=src.overlays
							flick("Sword Slash1",src)
							flick("Sword Slash1",L)
						if(t==2)
							usr.Step_Back(M)
						if(t==3)
							usr.Volcore()
					if(usr.race=="Pure Blood Quincy"&&!usr.ko)
						var/t=pick(1,2,3,5,6,2,2,1,3,2,2,2,3,6,6,1,1,5,5,5,9,1,9,9,9,1,9,10,11,12,13)
						if(t==10)usr.SwordFBStun()
						if(prob(5))usr.Amaterasu()
						if(prob(3))usr.Drainage()
						if(t==11)usr.FireDollSlash()
						if(t==12)usr.FirePillar()
						if(t==13)usr.FirePillarBlue()
						if(t==9)
							sleep(30)
							usr.Step_Back(M)
							var/L=src.overlays
							flick("Sword Slash1",src)
							flick("Sword Slash1",L)
							var/obj/XX = new/obj/crownprinceshot(src.loc)
							XX:Gowner = src
							walk(XX,src.dir)
						if(t==1)
							sleep(15)
							var/L=src.overlays
							usr.wound-=50
							flick("Sword Slash1",src)
							flick("Sword Slash1",L)
						if(t==2)
							sleep(60)
							usr.Step_Back(M)
							usr.RapidShot()
							var/L=src.overlays
							flick("Sword Slash1",src)
							flick("Sword Slash1",L)
						if(t==3)
							sleep(30)
							usr.Step_Back(M)
							usr.Haizen()
							var/L=src.overlays
							flick("Sword Slash1",src)
							flick("Sword Slash1",L)
						if(t==5)
							sleep(60)
							usr.Sprenger_Pentagon()
							usr.spren=5
							var/L=src.overlays
							flick("Sword Slash1",src)
							flick("Sword Slash1",L)
						if(t==6)
							var/L=src.overlays
							flick("Sword Slash1",src)
							flick("Sword Slash1",L)
							sleep(30)
							usr.HyosukeStun()
							flick("Sword Slash1",src)
							flick("Sword Slash1",L)
					if(usr.race=="Quincy" && !usr.ultimatequincy &&!usr.quincystrong &&!usr.frank&&!usr.vand&&!usr.ko)
						var/t=pick(1,3)
						if(t==1)
							usr.Step_Back(M)
					if(usr.ishidafinal&&!usr.ko)
						var/t=pick(1,2,3,4,5,6,7,8,9,10,11,12)
						if(usr.wound>=30)
							if(!usr.finalb)
								usr.Final()
						if(t==11)
							usr.flashmelee=1
						if(t==12)
							usr.flashmelee=0
						if(t==1)
							usr.Step_Back(M)
						if(t==2)
							usr.Sprenger_Pentagon()
							usr.spren=5
						if(t==3)
							usr.Splitting_Arrow()
						if(t==4)
							usr.Haizen()
						if(t==5)
							usr.Gritz()
						if(t==6)
							usr.Volcore()
						if(t==7)
							usr.Ransoutengai()
						if(t==8)
							usr.Sprenger()
						if(t==9)
							usr.RapidShot()
						if(t==10)
							var/obj/afterImage/afterImage2 = new /obj/afterImage()
							afterImage2.layer = MOB_LAYER
							afterImage2.icon=usr.icon
							afterImage2.icon_state=usr.icon_state
							afterImage2.overlays=usr.overlays
							afterImage2.underlays = usr.underlays
							afterImage2.dir=usr.dir
							afterImage2.loc = usr.loc
							afterImage2.zer = 1
							flick("shun",afterImage2)
							usr.shun = 1
							usr.shunning=1
							src.Move(M.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.shunning=0
							if(usr.flashpause-20<=10)
								usr.flashpause=10
							sleep(usr.flashpause-20)
							if(usr)
								usr.shun = 0

					if(usr.ultimatequincy&&!usr.ko)
						var/t=pick(1,2,3,4,5,6,7,8,9,10)
						if(t==1)
							usr.Step_Back(M)
						if(t==4)
							usr.Haizen()
						if(t==5)
							usr.Gritz()
						if(t==6)
							usr.Volcore()
						if(t==7)
							usr.Ransoutengai()
						if(t==8)
							usr.Sprenger()
					if(usr.vand&&!usr.ko)
						if(!usr.finalb)
							usr.Final()
						var/t=pick(1,2,3,4,5,6,7,8,9,10,11,12,13)
						if(t==1)
							usr.Step_Back(M)
						if(t==2)
							usr.Splitting_Arrow()
						if(t==3||t==9||t==10)
							usr.Bow()
							if(!usr.bowon)
								usr.seelsword=1
						if(t==4)
							usr.Haizen()
						if(t==5)
							usr.Gritz()
						if(t==6)
							usr.Volcore()
						if(t==7)
							usr.RapidShot()
						if(t==8)
							usr.Sprenger()
						if(t==11)
							usr.slow=0
							usr.blinding=0
							usr.speedy=1
						if(t==12)
							usr.slow=0
							usr.blinding=1
							usr.speedy=0
						if(t==13)
							usr.slow=1
							usr.blinding=0
							usr.speedy=0

					if(usr.quincystrong&&!usr.ko)
						var/t=pick(1,2,3,4,5,6,7,8)
						if(t==1)
							usr.Step_Back(M)
						if(t==4)
							usr.Haizen()
						if(t==5)
							usr.Gritz()
						if(t==6)
							usr.Volcore()

					if(usr.senbon&&!usr.ko)
						for(var/mob/G in oview(5,usr))
							if(!G.ispedal)
								for(var/obj/pedals/K in world)
									if(K.owner == usr)
										walk_towards(K,G,3)
								usr.Aggro(G)
							return
					if(usr.earlyichigo&&!usr.ko)
						var/t=pick(2,3)
						usr.Facedir(M)
						var/o=pick(1,1,1,1,1,2)
						if(o==2)
							var/sound/S = sound(pick('Sounds/Ichigo/WAVE_VO_ICHI_000A_000.wav','Sounds/Ichigo/WAVE_VO_ICHI_001A_000.wav','Sounds/Ichigo/WAVE_VO_ICHI_003A_000.wav','Sounds/Ichigo/WAVE_VO_ICHI_004A_000.wav','Sounds/Ichigo/WAVE_VO_ICHI_005A_000.wav'),volume=50)
							view(usr) << S
						if(t==3)
							usr.Step_Back(M)
					if(usr.mayuri)
						var/t=pick(1,2,3)
						for(var/obj/o in oview(1,usr))
							if(istype(o,/obj/arrow))
								if(o.dir==NORTH||o.dir==SOUTH)
									step(usr,pick(WEST,EAST),1)
								if(o.dir==EAST||o.dir==WEST)
									step(usr,pick(NORTH,SOUTH),1)
								var/sound/S = sound('Sounds/Mayuri/WAVE_VO_MAYU_069_000.wav',volume=50)
								view(usr) << S
						if(M.health<=M.mhealth/10 && usr.worthiness==0)
							var/io=pick(1,2,3,4,5,8,9,10,11,12,13,14,15,16,17,20,6,7)
							if(io==1)
								var/sound/S = sound('Sounds/Mayuri/WAVE_VO_MAYU_029_000.wav',volume=50)
								view(usr) << S
						if(usr.health<=usr.mhealth/10)
							var/y=pick(1,2,3,4,5,8,9,10,11,12,13,14,15,16,17,20,6,7)
							if(y==1)
								var/sound/S = sound('Sounds/Mayuri/WAVE_VO_MAYU_072_000.wav',volume=50)
								view(usr) << S
						if(usr.health<=usr.mhealth/2)
							if(!usr.worthiness)
								usr.worthiness=1
								var/sound/S = sound(pick('Sounds/Mayuri/WAVE_VO_MAYU_026_000.wav','Sounds/Mayuri/WAVE_VO_MAYU_025_P2_000.wav'),volume=50)
								view(usr) << S
						if(t==1)
							var/d=pick(1,2,3,4,5)
							if(d==2)
								var/sound/S = sound(pick('Sounds/Mayuri/WAVE_VO_MAYU_032_000.wav','Sounds/Mayuri/WAVE_VO_MAYU_036_000.wav'),volume=50)
								view(usr) << S
						if(t==2)
							if(usr.wound>10 && usr.wound<50)
								if(usr.inshikai)return
								var/sound/S = sound('Sounds/Mayuri/WAVE_VO_MAYU_024_000.wav',volume=50)
								view(usr) << S
								usr.Shikai()
								usr.shikaidrain=0
							if(usr.wound>=50)
								if(usr.inbankai)return
								if(!usr.inshikai)usr.Shikai()
								var/sound/S = sound('Sounds/Mayuri/WAVE_VO_MAYU_048A_000.wav',0,volume=50)
								view(usr) << S
								usr.Bankai()
								usr.bankaidrain=0
								spawn(30)
									var/sound/aft = sound('Sounds/Mayuri/WAVE_VO_MAYU_073_000.wav',volume=50)
									view(usr) << aft
						if(t==3)
							usr.Step_Back(M)
							var/p=pick(1,2,3,4)
							if(p==4)
								var/sound/S = sound(pick('Sounds/Mayuri/WAVE_VO_MAYU_044_000.wav','Sounds/Mayuri/WAVE_VO_MAYU_043_000.wav'),volume=50)
								view(usr) << S
						if(usr.canattack)
							var/k=pick(1,2,3,5,6)
							if(k==1)
								var/sound/S = sound(pick('Sounds/Mayuri/WAVE_VO_MAYU_001A_000.wav','Sounds/Mayuri/WAVE_VO_MAYU_006A_000.wav','Sounds/Mayuri/WAVE_VO_MAYU_003A_000.wav'),volume=50)//,'005B_0000.wav','005C_0000.wav','005D_0000.wav'),0)
								view(usr) << S

					if(usr.shonshui)
						var/t=pick(1,2,3)
						if(t==1)
							var/d=pick(1,2,3,4,5)
							if(d==2)
								var/sound/S = sound(pick('Sounds/Shunsui/WAVE_VO_SYUN_029_000.wav','Sounds/Shunsui/WAVE_VO_SYUN_023_000.wav'),volume=50)
								view(usr) << S
						if(t==2)
							if(usr.wound>10 && usr.wound<50)
								if(usr.inshikai)return
								var/sound/S = sound('Sounds/Shunsui/WAVE_VO_SYUN_032_P3_000.wav',volume=50)
								view(usr) << S
								usr.Shikai()
								usr.shikaidrain=0
							if(usr.wound>=50)
								if(usr.inbankai)return
								if(!usr.inshikai)usr.Shikai()
								var/sound/S = sound('Sounds/Shunsui/WAVE_VO_SYUN_032_P1_000.wav',0,volume=50)
								view(usr) << S
								usr.Bankai()
								usr.bankaidrain=0
								spawn(20)
									var/sound/aftd = sound('Sounds/Shunsui/WAVE_VO_SYUN_032_P2_000.wav',volume=50)
									view(usr) << aftd
									spawn(20)
										var/sound/aft = sound('Sounds/Shunsui/WAVE_VO_SYUN_032_P3_000.wav',volume=50)
										view(usr) << aft
						if(t==3)
							usr.Step_Back(M)
						if(usr.canattack)
							var/k=pick(1,2,3,5,6)
							if(k==1)
								var/sound/S = sound(pick('Sounds/Shunsui/WAVE_VO_SYUN_004A_000.wav','Sounds/Shunsui/WAVE_VO_SYUN_005A_000.wav','Sounds/Shunsui/WAVE_VO_SYUN_006A_000.wav'),volume=50)//,'005B_0000.wav','005C_0000.wav','005D_0000.wav'),0)
								view(usr) << S

					if(usr.race=="Bankai")
						var/t=pick(1,2,3)
						if(t==1)
							var/d=pick(1,2,3,4)
							if(d==2)
								var/sound/S = sound(pick('Sounds/Aizen/WAVE_VO_AIZE_038_000.wav','Sounds/Aizen/WAVE_VO_AIZE_038_000.wav','Sounds/Aizen/WAVE_VO_AIZE_038_000.wav'),volume=50)
								view(usr) << S
								view(usr) << "You're finished"
							if(usr.stype=="Kido Class"&&!usr.ko)
								var/df=pick(1,2,3,4,5,6,7)
								if(df==1)
									usr.Sai()
								if(df==2)
									usr.Shitotsu_Sansen()
								if(df==3)
									usr.Raihou()
								if(df==4)
									usr.Danku()
								if(df==6)
									usr.Shakkahou()
								if(df==5)
									usr.Soukatsui()
								if(df==7)
									usr.Hado_1()
							if(usr.stype=="Ichigo"&&!usr.ko)
								usr.Getsuga_Tenshou()
							if(usr.stype=="Hisagi"&&!usr.ko)
								usr.Reap()
							if(usr.stype=="Aizen"&&!usr.ko)
								usr.Cheatmode()
							if(usr.stype=="Rukia"&&!usr.ko)
								usr.Hakuren()
							if(usr.stype=="Renji"&&!usr.ko)
								usr.Baboon_Blast()
							if(src.stype == "Jiroubou"&&!usr.ko)
								usr.Shuriken_Toss()
							if(src.stype == "Hitsugaya"&&!usr.ko)
								usr.Shoot_Dragon()
							if(src.stype == "Kaiens"&&!usr.ko)
								usr.Wave()
							if(src.stype == "Kira"&&!usr.ko)
								usr.Heavy_Hit()
							if(src.stype == "Tousen"&&!usr.ko)
								usr.Benihikou()
							if(src.stype == "Yammamoto"&&!usr.ko)
								usr.Shoen()
							if(src.stype == "Shonshui"&&!usr.ko)
								usr.Tenran()
							if(src.stype == "Urahara"&&!usr.ko)
								usr.Nake()
							if(src.stype == "Muramasa"&&!usr.ko)
								usr.Boost_Negation()
							if(src.stype == "Byakuya" && src.health < src.mhealth/10&&!usr.ko)
								usr.Hakuteiken()
						if(t==2)
							if(src.stype == "Muramasa"&&!usr.ko)
								usr.Release_Seal()
							if(usr.stype=="Aizen"&&!usr.ko)
								usr.Restep()
							if(src.stype == "Yammamoto"&&!usr.ko)
								usr.etarget=M
								usr.Creamation()
							if(usr.stype=="Hisagi"&&!usr.ko)
								usr.Criss_Cross()
							if(usr.stype=="Rukia"&&!usr.ko)
								usr.Shirafune()
							if(usr.stype=="Stinger"&&!usr.ko)
								usr.Rocket()
							if(src.stype == "Urahara"&&!usr.ko)
								usr.Blood_Mist()
							if(src.stype == "Shonshui"&&!usr.ko)
								usr.Bushogoma()
							if(src.stype=="Tousen"&&!usr.ko)
								usr.Benihikou()
							if(src.stype=="Ichigo"&&!usr.ko)
								usr.Ichigo_Slash()
							if(src.stype=="Shonshui"&&!usr.ko)
								usr.Blades()
							if(src.stype=="Yumichika"&&!usr.ko)
								usr.Cyclone_Slash()
							if(src.stype=="Byakuya"&&!usr.ko)
								usr.etarget=M
								usr.Pivotal_Scene()
							if(src.stype == "Hitsugaya"&&!usr.ko)
								usr.etarget=M
								usr.Sennen_Hyoro()
						if(t==3)
							usr.Step_Back(M)
							var/p=pick(1,2,3,4)
							if(p==4)
								var/sound/S = sound(pick('Sounds/Aizen/WAVE_VO_AIZE_092_000.wav','Sounds/Aizen/WAVE_VO_AIZE_042_000.wav'),volume=50)
								view(usr) << S
						if(usr.canattack)
							var/k=pick(1,2,3,5)
							if(k==1)
								var/sound/S = sound(pick('Sounds/Aizen/WAVE_VO_AIZE_000A_000.wav','Sounds/Aizen/WAVE_VO_AIZE_001A_000.wav','Sounds/Aizen/WAVE_VO_AIZE_002A_000.wav','Sounds/Aizen/WAVE_VO_AIZE_003A_000.wav'),volume=50)//,'005B_0000.wav','005C_0000.wav','005D_0000.wav'),0)
								view(usr) << S

					if(usr.ichigo&&!usr.ko)
						var/t=pick(1,2,3,4)
						if(M in oview(1,usr))

							var/k=pick(1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2)
							if(k==1)
								var/sound/S = sound(pick('Sounds/Ichigo/WAVE_VO_ICHI_026_000.wav','Sounds/Ichigo/WAVE_VO_ICHI_024_000.wav'),volume=50)//,'005B_0000.wav','005C_0000.wav','005D_0000.wav'),0)
								view(usr) << S
						if(t==1)
							usr.Step_Back(M)
						if(t==2)
							if(usr.wound>10)
								if(usr.inbankai)return
								usr.bankaidrain=0
								usr.Bankai()
						if(t==3)
							if(usr.health<usr.mhealth/2)
								usr.rei+=2000
								usr.Inner_Mode()
						if(t==4)
							usr.Getsuga_Tenshou()
							var/k=pick(1,2,3,5)
							if(k==1)
								var/sound/S = sound('Sounds/Ichigo/WAVE_VO_ICHI_044A_22_000.wav',volume=50)
								view(usr) << S
					if(usr.name=="{NPC}Zanpakutou"&&!usr.ko)
						var/t=pick(2,5)
						if(t==2)
							if(usr.wound>10)
								if(usr.inshikai)return
								usr.shikaidrain=0
								usr.Shikai()
						if(t==5)
							if(usr.wound>50)
								if(usr.inbankai)return
								usr.bankaidrain=0
								usr.Bankai()
					if(usr.key=="Awesome93" || usr.key=="Audain1")
						if(src.stype=="Rangiku")
							src.smoked+=M
							M.smoking=1
						var/t=pick(1,2,3,4)
						if(t==1)
							var/d=pick(1,2,3,4)
							if(M.health<=M.mhealth/30)
								if(d==2)
									var/sound/S = sound('Sounds/00A5_0000.wav',0,volume=50)
									view(usr) << S
									view(usr) << "You're finished"
					if(usr.innerself && usr.race=="Inner"&&!usr.ko)
						if(src.stype=="Rangiku"&&!usr.ko)
							src.smoked+=M
							M.smoking=1
						var/t=pick(1,2,3,4)
						if(t==1)
							var/d=pick(1,2,3,4)
							if(M.health<=M.mhealth/30)
								if(d==2)
									var/sound/S = sound('Sounds/00A5_0000.wav',0,volume=50)
									view(usr) << S
									view(usr) << "You're finished"
							if(usr.stype=="Ichigo")
								usr.Getsuga_Tenshou()
							if(usr.stype=="Hisagi")
								usr.Reap()
							if(usr.stype=="Hinamori")
								usr.Rapid_Burst()
							if(usr.stype=="Aizen")
								usr.Cheatmode()
							if(usr.stype=="Rukia")
								usr.Hakuren()
							if(usr.stype=="Renji")
								usr.Baboon_Blast()
							if(src.stype == "Jiroubou")
								usr.Shuriken_Toss()
							if(src.stype == "Hitsugaya")
								usr.Shoot_Dragon()
							if(src.stype == "Kaiens")
								usr.Wave()
							if(src.stype == "Kira")
								usr.Heavy_Hit()
							if(src.stype == "Tousen")
								usr.Benihikou()
							if(src.stype == "Yammamoto")
								usr.Shoen()
							if(src.stype == "Shonshui")
								usr.Tenran()
							if(src.stype == "Urahara")
								usr.Nake()
							if(src.stype == "Muramasa")
								usr.Boost_Negation()
							if(src.stype == "Byakuya" && src.health < src.mhealth/10)
								usr.Hakuteiken()
						if(t==2)
							if(src.stype == "Muramasa")
								usr.Release_Seal()
							if(usr.stype=="Aizen")
								usr.Restep()
							if(src.stype == "Yammamoto")
								usr.etarget=M
								usr.Creamation()
							if(usr.stype=="Hisagi")
								usr.Criss_Cross()
							if(usr.stype=="Rukia")
								usr.Shirafune()
							if(usr.stype=="Stinger")
								usr.etarget=M
								usr.Rocket()
							if(src.stype == "Urahara")
								usr.Blood_Mist()
							if(src.stype == "Shonshui")
								usr.Bushogoma()
							if(src.stype=="Tousen")
								usr.Benihikou()
							if(src.stype=="Ichigo")
								usr.Ichigo_Slash()
							if(src.stype=="Shonshui")
								usr.Blades()
							if(src.stype=="Yumichika")
								usr.Cyclone_Slash()
							if(src.stype=="Byakuya")
								usr.etarget=M
								usr.Pivotal_Scene()
							if(src.stype == "Hitsugaya")
								usr.etarget=M
								usr.Sennen_Hyoro()
						if(t==3)
							usr.Step_Back(M)
							var/p=pick(1,2,3,4)
							if(p==4)
								var/sound/S = sound('Sounds/00A4_0000.wav',0,volume=50)
								view(usr) << S
								view(usr) << "Too slow"
						if(t==4)
							if(!usr.vasto)
								if(usr.wound>0 && usr.wound<10)
									if(usr.inshikai)return
									var/sound/S = sound('Sounds/00A7_0000.wav',0,volume=50)
									view(usr) << S
									view(usr) << "Get Ready"
									usr.Shikai()
									usr.shikaidrain=0
								if(usr.wound>=10)
									if(usr.inbankai)return
									if(!usr.inshikai)usr.Shikai()
									var/sound/S = sound('Sounds/00A7_0000.wav',0,volume=50)
									view(usr) << S
									view(usr) << "Get Ready"
									usr.Bankai()
									usr.bankaidrain=0
							if(usr.vasto)
								usr.maskon=1
								if(!usr.inshikai)
									usr.Shikai()
								if(!usr.inbankai)
									usr.Bankai()
								if(usr.inbankai)
									var/d=pick(1,2,3)
									if(d==1)
										usr.Ruthlessness()
									if(d==2)
										usr.Hollow_Screech()
						if(usr.canattack)
							var/k=pick(1,2,3,5)
							if(k==1)
								var/sound/S = sound(pick('Sounds/005A_0000.wav','Sounds/005B_0000.wav','Sounds/005C_0000.wav','Sounds/005D_0000.wav'),0,volume=50)
								view(usr) << S
								view(usr) << "Aaargh"
					if(usr.race=="Rogue"&&!usr.ko)
						var/t=pick(1,2,3,4,5,6)
						if(t==1)
							usr.Shakkahou()
						if(t==2)
							usr.Byakurai()
						if(t==3)
							usr.Rikujoukourou()
						if(t==5)
							usr.Soukatsui()
						if(t==4)
							if(usr.health<usr.mhealth/1.5 && hasashikai)
								if(!usr.inshikai)
									usr.Shikai()
									usr.shikaidrain=0
							if(usr.health<usr.mhealth/2 && hasabankai)
								if(!usr.inbankai)
									if(!usr.inshikai)usr.Shikai()
									usr.Bankai()
									usr.bankaidrain=0
						if(t==6)
							if(usr.stype=="Kido Class"&&!usr.ko)
								var/df=pick(1,2,3,4,6)
								if(df==1)
									usr.Sai()
								if(df==2)
									usr.Shitotsu_Sansen()
								if(df==3)
									usr.Raihou()
								if(df==4)
									usr.Danku()
								if(df==6)
									if(usr.health<usr.mhealth/2)
										usr.Itto_Kasu()
							if(usr.inshikai&&!usr.ko||usr.inbankai&&!usr.ko)
								if(usr.stype=="Urahara")
									usr.Nake()
								if(usr.stype=="Tousen")
									usr.Benihikou()
								if(usr.stype=="Rukia")
									usr.Hakuren()
								if(usr.stype=="Ukitake")
									usr.Raikouhou()
								if(usr.stype=="Shonshui")
									usr.Tenran()
								if(usr.stype=="Ichigo")
									usr.Getsuga_Tenshou()
								if(usr.stype=="Zaraki")
									usr.Kendo()
								if(usr.stype=="Hitsugaya")
									usr.Shoot_Dragon()
								if(usr.stype=="Yammamoto")
									usr.Shoen()
								if(usr.stype=="Kaiens")
									usr.Wave()
								if(usr.stype=="Hisagi")
									usr.Reap()
								if(usr.stype=="Aizen")
									usr.Restep()
								if(usr.stype=="Yumichika")
									usr.Yumi()
								if(usr.stype=="Stinger")
									if(usr.inbankai)
										usr.Rocket()
								if(usr.stype=="Byakuya")
									usr.Petal_Sword()
								if(usr.stype=="Hinamori")
									usr.Burst()
								if(usr.stype=="Kira")
									usr.Heavy_Hit()
								if(usr.stype=="Mayuri")
									usr.Fog()
								if(usr.stype=="Muramasa")
									usr.Release_Seal()
								if(usr.stype=="Renji")
									if(usr.inbankai)
										usr.Baboon_Blast()
					if(usr.race=="Ultra Quincy"&&!usr.ko)
						if(hasabankai)
							if(!usr.inbankai)
								usr.Bankai()
								usr.bankaidrain=0
						var/t=pick(1,2,3,4,5,6)
						if(t==1)
							usr.Shakkahou()
						if(t==2)
							usr.Byakurai()
						if(t==3)
							usr.Rikujoukourou()
						if(t==5)
							usr.Soukatsui()
						if(t==4)
							if(hasabankai)
								if(!usr.inbankai)
									usr.Bankai()
									usr.bankaidrain=0
						if(t==6)
							if(usr.inshikai&&!usr.ko||usr.inbankai&&!usr.ko)
								if(usr.stype=="Sword Multiplier")
									usr.Shuriken_Graveyard()
								if(usr.stype=="Dark Bat")
									usr.Hakuren()
									usr.DirectionBlast()
								if(usr.stype=="Rangiku")
									usr.Hakuren()
								if(usr.stype=="Shusuke")
									usr.FirePillar()
								if(usr.stype=="Hyosuke")
									usr.Tenran()
								if(usr.stype=="Pheonix")
									usr.Shoen()
								if(usr.stype=="Matsuri")
									usr.Pink_Mugetsu()
								if(usr.stype=="Jiroubou")
									usr.Shuriken_Toss()
					if(usr.race=="Shinigami" && !usr.npccaptain&&!usr.ko)
						var/t=pick(1,2,3,4,5,6)
						if(t==1)
							usr.Shakkahou()
						if(t==2)
							usr.Byakurai()
						if(t==3)
							usr.Rikujoukourou()
						if(t==5)
							usr.Soukatsui()
						if(t==4)
							if(usr.health<usr.mhealth/1.1 && hasashikai)
								if(!usr.inshikai)
									usr.Shikai()
									usr.shikaidrain=0
							if(usr.health<usr.mhealth/1.4 && hasabankai)
								if(!usr.inbankai)
									if(!usr.inshikai)usr.Shikai()
									usr.Bankai()
									usr.bankaidrain=0
						if(t==6)
							if(usr.stype=="Kido Class")
								var/df=pick(1,2,3,4,6)
								if(df==1)
									usr.Sai()
								if(df==2)
									usr.Shitotsu_Sansen()
								if(df==3)
									usr.Raihou()
								if(df==4)
									usr.Danku()
								if(df==6)
									if(usr.health<usr.mhealth/2)
										usr.Itto_Kasu()
							if(usr.inshikai||usr.inbankai)
								if(usr.stype=="Urahara")
									usr.Nake()
								if(usr.stype=="Tousen")
									usr.Benihikou()
								if(usr.stype=="Rukia")
									usr.Hakuren()
								if(usr.stype=="Ukitake")
									usr.Raikouhou()
								if(usr.stype=="Shonshui")
									usr.Tenran()
								if(usr.stype=="Ichigo")
									usr.Getsuga_Tenshou()
								if(usr.stype=="Zaraki")
									usr.Kendo()
								if(usr.stype=="Hitsugaya")
									usr.Shoot_Dragon()
								if(usr.stype=="Yammamoto")
									usr.Shoen()
								if(usr.stype=="Kaiens")
									usr.Wave()
								if(usr.stype=="Hisagi")
									usr.Reap()
								if(usr.stype=="Aizen")
									usr.Restep()
								if(usr.stype=="Yumichika")
									usr.Yumi()
								if(usr.stype=="Stinger")
									if(usr.inbankai)
										usr.Rocket()
								if(usr.stype=="Byakuya")
									usr.Petal_Sword()
								if(usr.stype=="Hinamori")
									usr.Burst()
								if(usr.stype=="Kira")
									usr.Heavy_Hit()
								if(usr.stype=="Mayuri")
									usr.Fog()
								if(usr.stype=="Muramasa")
									usr.Release_Seal()
								if(usr.stype=="Renji")
									if(usr.inbankai)
										usr.Baboon_Blast()
					if(src.npccaptain&&src.lorelei==0&&!usr.ko||src.Tnpccaptain&&!usr.ko)
						var/s=pick(1,2,3,4,5,6)
						if(s==5)
							usr.Attack()
						if(s==1)
							usr.flashmelee=1
						if(s==2)
							usr.flashmelee=0
						if(s==3)
							usr.Spiritual_Pressure()
						if(s==4)
							if(usr.infinal)
								usr.Mugetsu()
							if(usr.wound>5)
								if(!usr.inshikai&&!usr.inbankai)
									usr.Shikai()
							if(usr.wound>20&&usr.npccaptain!=2)
								if(usr.inshikai&&!usr.inbankai)
									usr.Bankai()
							if(usr.wound>90&&usr.npccaptain==2)
								if(usr.inshikai&&!usr.inbankai)
									usr.Bankai()
							if(usr.wound>110)
								usr.fgttime=100
								usr.FinalBankai()
					if(src.lorelei>0&&!usr.ko||usr.newkomaboss==1&&!usr.ko)
						var/s=pick(1,2,3,4,5,6,7,8)
						if(s==8)
							usr.loc=usr.oldspot
						if(s==1)
							usr.flashmelee=1
						if(s==2)
							usr.flashmelee=0
						if(s==4)
							usr.Flash_Smash()
						if(s==7)
							if(usr.wound>1)
								if(!usr.inshikai&&!usr.inbankai)
									usr.Shikai()
							if(usr.wound>2)
								if(usr.inshikai&&!usr.inbankai)
									usr.Bankai()
						if(s==3)
							usr.Coffin()
						/*	var/list/Menu = new()
							for(var/turf/d in view(2,M))
								Menu.Add(d)
							var/turf/xs=pick(Menu)	*/
							if(usr.coffin)
								usr.Make_Coffin(M)
						if(s==5)
							var/obj/afterImage/afterImage2 = new /obj/afterImage()
							afterImage2.layer = MOB_LAYER
							afterImage2.icon=usr.icon
							afterImage2.icon_state=usr.icon_state
							afterImage2.overlays=usr.overlays
							afterImage2.underlays = usr.underlays
							afterImage2.dir=usr.dir
							afterImage2.loc = usr.loc
							afterImage2.zer = 1
							flick("shun",afterImage2)
							usr.shun = 1
							usr.shunning=1
							src.Move(M.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.shunning=0
							if(usr.flashpause-20<=10)
								usr.flashpause=10
							sleep(usr.flashpause-20)
							if(usr)
								usr.shun = 0
						if(s==6)
							usr.Step_Back(M)
					if(usr.npccaptain==1&&!usr.ko||usr.lorelei>0&&!usr.ko||usr.newkomaboss==1&&!usr.ko)
						var/s=pick(1,2,3,4)
						if(s==1)
							usr.Shoen()
						if(s==2)
							usr.etarget=M
							usr.Creamation()
							usr.etarget=null
						if(s==3)
							usr.Encircle()
						if(s==4)
							usr.Coffin()
						/*	var/list/Menu = new()
							for(var/turf/d in view(2,M))
								Menu.Add(d)
							var/turf/xs=pick(Menu)	*/
							if(usr.coffin)
								usr.Make_Coffin(M)
						if(s==5)
							usr.Spiritual_Pressure()
					if(usr.npccaptain==2&&!usr.ko)
						var/s=pick(1,2,3,4)
						if(s==1)
							usr.Acceleration()
						if(s==2)
							usr.Flash_Smash()
						if(s==3)
							usr.Rocket()
						if(s==4)
							usr.Shunko()
					if(usr.npccaptain==3&&!usr.ko)
						var/s=pick(1,2,3,4)
						if(s==1)
							usr.Stretch()
						if(s==2)
							usr.Poison()
						if(s==3)
							usr.Shishkabob()
						if(s==4)
							usr.Flash_Smash()
					if(usr.npccaptain==4&&!usr.ko)
						var/s=pick(1,2,3,4)
						if(s==1)
							usr.Healing()
						if(s==2)
							usr.Regeneration_Mode()
						if(s==3)
							usr.Reversal_Healing()
						if(s==4)
							usr.Hado_1()
					if(usr.npccaptain==5&&!usr.ko)
						var/t=pick(1,2,3,4,5,6,7,7,7,7,8,9,10,11)
						if(t==1)
							usr.Invisibility()
						if(t==2)
							usr.Illusionary_Death()
						if(t==3)
							usr.Cheatmode()
						if(t==4)
							usr.Coffin()
						/*	var/list/Menu = new()
							for(var/turf/d in view(2,M))
								Menu.Add(d)
							var/turf/xs=pick(Menu)	*/
							if(usr.coffin)
								usr.Make_Coffin(M)
						if(t==6)
							usr.Restep()
						if(t==5)
							usr.invisibility=100
						if(t==7)
							usr.invisibility=0
						if(t==8)
							usr.Flash_Smash()
						if(t==9)
							usr.Soukatsui()
						if(t==10)
							usr.Soukatsui()
						if(t==11)
							if(!src.pet)
								usr.Cloak()
					if(usr.npccaptain==6&&!usr.ko)
						var/s=pick(1,2,3,4,5,6,7,8,9)
						if(s==1)
							usr.Hado_1()
						if(s==2)
							usr.Byakurai()
						if(s==3)
							usr.Soukatsui()
						if(s==4)
							usr.Pivotal_Scene()
						if(s==5)
							usr.Petal_Sword()
						if(s==6)
							if(M in oview(3,usr))
								usr.Scene_of_Massacre()
						if(s==7)
							usr.Flash_Smash()
						if(s==8)
							if(usr.health<usr.mhealth/5)
								usr.Hakuteiken()
						if(s==9)
							usr.Rikujoukourou()
					if(usr.npccaptain==7&&!usr.ko)
						var/s=pick(1,2,3)
						if(s==1)
							usr.Hado_1()
						if(s==2)
							usr.Flash_Smash()
						if(s==3)
							usr.Hado_1()
					if(usr.npccaptain==8&&!usr.ko)
						var/s=pick(1,2,3,4,5)
						if(s==1)
							usr.Hado_1()
						if(s==2)
							usr.Shadow()
						if(s==3)
							usr.Tenran()
						if(s==4)
							usr.Bushogoma()
						if(s==5)
							usr.Flash_Smash()
					if(usr.npccaptain==9&&!usr.ko)
						var/s=pick(1,2,3,4,5,6,7)
						if(s==1)
							usr.Hado_1()
						if(s==2)
							usr.Soukatsui()
						if(s==3)
							usr.Tenran()
						if(s==4)
							usr.Benihikou()
						if(s==5)
							usr.Flash_Smash()
						if(s==6)
							if(M in oview(3,usr))
								usr.Dark_Pit()
						if(s==7)
							if(!src.pet)
								usr.Blindin()
					if(usr.npccaptain==10&&!usr.ko)
						var/s=pick(1,2,3,4,5,6)
						if(s==1)
							usr.Hado_1()
						if(s==2)
							usr.Soukatsui()
						if(s==3)
							usr.Sennen_Hyoro()
						if(s==4)
							usr.Shoot_Dragon()
						if(s==5)
							usr.Flash_Smash()
						if(s==6)
							if(M in oview(3,src))
								usr.Frozen_Heavens()
					if(usr.npccaptain==11&&!usr.ko)
						var/s=pick(1,2,3,4,5)
						if(s==1)
							usr.Blood_Thirsty()
						if(s==2)
							usr.Berserk()
						if(s==3)
							usr.Kendo()
						if(s==4)
							usr.Spiritual_Pressure()
						if(s==5)
							usr.Flash_Smash()
					if(usr.npccaptain==12&&!usr.ko)
						var/s=pick(1,2,3,4,5)
						if(s==1)
							usr.Blood_Thirsty()
						if(s==2)
							usr.Power_Burst()
						if(s==3)
							usr.Lethal_Poison()
						if(s==4)
							usr.Fog()
						if(s==5)
							usr.Flash_Smash()
					if(usr.npccaptain==13&&!usr.ko)
						var/s=pick(1,2,3,4,5)
						if(s==1)
							usr.Blood_Thirsty()
						if(s==2)
							usr.Raikouhou()
						if(s==3)
							usr.Return_Blast()
						if(s==4)
							usr.Random_Blast()
						if(s==5)
							usr.Flash_Smash()
					if(usr.race=="Hollow"&&usr.hollowtype!="labtype1"&&!usr.ko)
						for(var/obj/Ms in oview(2))
							if(Ms.zer == 0)
								step_away(src,Ms)
						for(var/mob/zabimaru/Md in oview(1))
							step_away(src,Md)
						src.random = rand(1,10)
						if(src.random == 2)
							if(usr.level>=120)
								usr.Roar()
						if(src.random == 1)
							if(!src.ceroc)
								src.ceroc = 1
								view(src,8) << "<b><font color = red>[src]: Cero!"
								var/WE = new/obj/ccharge(src.loc)
								WE:dir = src.dir
								sleep(8)
								usr.Facedir(M)
								usr.Cero()
								spawn(45)
								src.ceroc = 0
					if(usr.hollowtype=="labtype1"&&!usr.ko)
						var/j=pick(1,3,4,6,7,8)
						if(j==1)
							usr.flashmelee=1
						if(j==3)
							usr.Reiatsu_Blast()
						if(j==4)
							usr.Attack()
						if(j==6)
							usr.Flash_Smash()
						if(j==7)
							usr.Reap()
						if(j==8)
							usr.Outrage()
					if(usr.race=="Blank"&&!usr.ko)
						var/j=pick(1,3,4,6)
						if(j==1)
							usr.flashmelee=1
						if(j==3)
							usr.Reiatsu_Blast()
						if(j==4)
							usr.Attack()
						if(j==6)
							usr.Flash_Smash()
				/*	if(usr.race=="Kushanada")
						var/q=pick(1,2,4,6)
						if(q==1)
							usr.flashmelee=1
						if(q==2)
							usr.Reiatsu_Blast()
						if(q==4)
							usr.Attack()
						if(q==6)
							usr.Flash_Smash()*/
					if(usr.race=="Arrancar"&&!usr.npcespada&&!usr.ko||usr.Demon_wolf&&!usr.ko||usr.Yokai3==1&&!usr.ko||usr.bossyama&&!usr.ko||usr.bossyama2&&!usr.ko)
						var/t=pick(1,2,3,4,4,5,6,7,5,5)
						if(t==1||t==7)
							usr.Bala()
						if(t==2)
							usr.Cero()
						if(t==3)
							usr.Cero2()
						if(t==4)
							if(usr.ressurection)return
							usr.Ressurection()
						if(t==5)
							if(usr.ressurection)
								if(usr.ressurectiontype=="Pantera")
									usr.Desgarron()
								if(usr.ressurectiontype=="Shooter")
									usr.CeroWolf()
								if(usr.ressurectiontype=="Dragon")
									usr.Dragon()
								if(usr.ressurectiontype=="Ulq")
									usr.Throw()
								if(usr.ressurectiontype=="Scientist")
									usr.Clone_Spit()
								if(usr.ressurectiontype=="Cirucci")
									usr.YoYo()
								if(usr.ressurectiontype=="Halibel")
									usr.Ola_Azul()
								if(usr.ressurectiontype=="Tijereta")
									usr.Laceration()
								if(usr.ressurectiontype=="Nell")
									usr.Spear()
								if(usr.ressurectiontype=="Zommari")
									usr.Sovereign_Wave()
						if(t==6)
							if(usr.ressurection)
								if(usr.ressurectiontype=="Shooter")
									usr.Cero3()
								if(usr.ressurectiontype=="Scientist")
									if(M in oview(1,usr))
										usr.Pills()
								if(usr.ressurectiontype=="Halibel")
									usr.Cascada()
								if(usr.ressurectiontype=="Skeleton")
									usr.Universal_Aging()
								if(usr.ressurectiontype=="Pantera")
									usr.Darts()
								if(usr.ressurectiontype=="Nnoitra")
									usr.Outrage()
					if(src.npcespada&&!usr.ko||src.Demon_Bat&&!usr.ko)
						var/s=pick(1,2,3,4,5,6,7,8,9)
						if(s==1)
							usr.flashmelee=1
						if(s==2)
							usr.flashmelee=0
						if(s==3)
							usr.aggrod=0
						if(s==4)
							if(usr.health<usr.mhealth/2)
								usr.Instant_Regen()
							if(usr.wound>5)
								if(!usr.arelease)
									usr.Arrancar_Release()
							if(usr.wound>15)
								if(!usr.ressurection)
									usr.Ressurection()
							if(usr.wound>30)
								if(usr.segunda)
									usr.Segunda_Ress()
						if(s==5)
							var/obj/afterImage/afterImage2 = new /obj/afterImage()
							afterImage2.layer = MOB_LAYER
							afterImage2.icon=usr.icon
							afterImage2.icon_state=usr.icon_state
							afterImage2.overlays=usr.overlays
							afterImage2.underlays = usr.underlays
							afterImage2.dir=usr.dir
							afterImage2.loc = usr.loc
							afterImage2.zer = 1
							flick("shun",afterImage2)
							usr.shun = 1
							usr.shunning=1
							src.Move(M.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.shunning=0
							if(usr.flashpause-20<=10)
								usr.flashpause=10
							sleep(usr.flashpause-20)
							if(usr)
								usr.shun = 0
						if(s==6)
							usr.Step_Back(M)
						if(s==7)
							usr.Bala()
						if(s==8)
							usr.Cero()
						if(s==9)
							usr.Cero2()
					if(src.npcespada==1&&!usr.ko||src.Demon_Bat==2&&!usr.ko)
						var/s=pick(1,2,3,4)
						if(s==1)
							src.Dual_Swords()
						if(s==2)
							src.Cero3()
						if(s==3)
							src.CeroWolf()
						if(s==4)
							src.Cero_Pack()
					if(src.npcespada==2&&!usr.ko)
						var/s=pick(1,2,3,4)
						if(s==1)
							src.Universal_Aging()
						if(s==2)
							src.Drainage()
						if(s==3)
							src.Aging_Barrier()
						if(s==4)
							src.Spiritual_Pressure()
					if(src.npcespada==3&&!usr.ko)
						var/s=pick(1,2,3,4)
						if(s==1)
							src.La_Gota()
						if(s==2)
							src.Cascada()
						if(s==3)
							src.Ola_Azul()
						if(s==4)
							if(src.health<src.mhealth/3)
								src.Life_Contract()
					if(src.npcespada==4&&!usr.ko)
						var/s=pick(1,2,3,4,5)
						if(s==1)
							src.Throw()
						if(s==2)
							src.Flash_Smash()
						if(s==3)
							src.Cero_Oscura()
						if(s==4)
							src.Negacion()
						if(s==5)
							src.Blood_Thirsty()
					if(src.npcespada==5&&!usr.ko)
						var/s=pick(1,2,3,4,5)
						if(s==1)
							src.Reap()
						if(s==2)
							src.Flash_Smash()
						if(s==3)
							src.Outrage()
						if(s==5)
							src.Laceration()
						if(s==4)
							src.Pure_Def()
					if(src.npcespada==6&&!usr.ko)
						var/s=pick(1,2,3,4,5)
						if(s==1)
							src.Desgarron()
						if(s==2)
							src.Flash_Smash()
						if(s==3)
							src.Darts()
						if(s==5)
							src.Pantera_Roar()
						if(s==4)
							src.Negacion()
					if(src.npcespada==7&&!usr.ko)
						var/s=pick(1,2,3,4)
						if(s==1)
							src.Sovereigns()
						if(s==2)
							src.Flash_Smash()
						if(s==3)
							src.Sovereign_Wave()
						if(s==4)
							src.Roar()
					if(src.npcespada==8&&!usr.ko)
						var/s=pick(1,2,3,4)
						if(s==1)
							src.Clone_Spit()
						if(s==2)
							src.Flash_Smash()
						if(s==3)
							src.Pills()
						if(s==4)
							src.Roar()
					if(usr.race=="Fullbringer"&&usr.psp&&!usr.ko)
						var/t=pick(3,4,5,6,7)
						if(t==3)
							usr.flashmelee=0
						if(t==4)
							if(usr.health<usr.mhealth/1.3)
								if(!usr.infull)
									usr.Fullbring()
							if(usr.health<usr.mhealth/2)
								if(!usr.inafull)
									usr.AFullbring()
						if(t==5)
							if(usr.infull||usr.inafull)
								if(usr.ftype=="Ichigo")
									usr.Getsuga_Ring()
								if(usr.ftype=="Jackie")
									usr.Critical_Hit()
								if(usr.ftype=="Yukio")
									usr.etarget=M
									usr.Delete_Profile()
								if(usr.ftype=="Ginjo")
									usr.Bringer_Blast()
								if(usr.ftype=="Tsukishima")
									usr.Memory_Strikes()
						if(t==6)
							usr.flashmelee=1
					if(usr.aizen&&!usr.ko)
						var/t=pick(1,2,3,4,5,6,7)
						if(t==1)
							usr.Invisibility()
						if(t==2)
							usr.Power_Burst()
						if(t==3)
							usr.Cero2()
						if(t==4)
							usr.Coffin()
						/*	var/list/Menu = new()
							for(var/turf/d in view(2,M))
								Menu.Add(d)
							var/turf/xs=pick(Menu)	*/
							if(usr.coffin)
								usr.Make_Coffin(M)
						if(t==6)
							usr.Restep()
						if(t==5)
							usr.invisibility=100
						if(t==7)
							usr.invisibility=0
					if(usr.isrealaizen&&!usr.ko)
						var/t=pick(1,2,3,4,5,6,7,7,7,7,8,9,10)
						if(t==1)
							usr.Invisibility()
						if(t==2)
							usr.Illusionary_Death()
						if(t==3)
							usr.Cheatmode()
						if(t==4)
							usr.Coffin()
						/*	var/list/Menu = new()
							for(var/turf/d in view(2,M))
								Menu.Add(d)
							var/turf/xs=pick(Menu)	*/
							if(usr.coffin)
								usr.Make_Coffin(M)
						if(t==6)
							usr.Restep()
						if(t==5)
							usr.invisibility=100
						if(t==7)
							usr.invisibility=0
						if(t==8)
							usr.Flash_Smash()
						if(t==9)
							usr.Soukatsui()
						if(t==10)
							usr.Soukatsui()
					if(usr.ginjo&&!usr.ko)
						var/t=pick(1,2,7)
						if(t==1||t==7)
							usr.Bringer_Blast()
					if(usr.tsukishima&&!usr.ko)
						var/t=pick(1,2,3,4,5,6,7)
						if(t==1)
							usr.First_Hit()
							usr.Second_Hit()
							usr.Third_Hit()
							usr.Forth_Hit()
						if(t==2)
							usr.flashmelee=1
						if(t==3)
							usr.flashmelee=0
						if(t==4)
							usr.Memory_Strikes()
					if(usr.stark&&!usr.ko||usr.Yokai1==1&&!usr.ko)
						var/s=pick(1,2,3,4,5,6,7,8,9,10)
						if(s==1||s==3||s==5||s==7||s==9)
							usr.firing=0
							usr.canattack=0
						if(s==1||s==7)
							usr.Cero_Pack()
							view(8,usr) <<"<b>[src.name]:Try to dodge this!"
						if(s==2)
							step_to(usr,M,0)
						if(s==3)
							if(usr.wound>=60)
								if(usr.beatichigo==1)
									usr.beatichigo=2
									usr.Arrancar_Release()
									view(8,usr) << "<b>[src.name]:Are you still convinced that you'll win?"
						if(s==8)
							usr.Cero3()
						if(s==9)
							usr.Bala()
						if(s==10)
							usr.Cero2()
							view(8,usr) << "<b>[src.name]:Try me!"
						if(s==4)
							usr.Instant_Regen()
							view(8,usr) << "<b>[src.name]:Can you keep up?"
						if(s==6)
							if(!usr.beatichigo)
								if(usr.wound>=10)
									usr.beatichigo=1
									usr.Ressurection()
									view(8,usr) << "<b>[src.name]:Lilynette time to shoot him up!"
						if(s==5)
							var/obj/afterImage/afterImage2 = new /obj/afterImage()
							afterImage2.layer = MOB_LAYER
							afterImage2.icon=usr.icon
							afterImage2.icon_state=usr.icon_state
							afterImage2.overlays=usr.overlays
							afterImage2.underlays = usr.underlays
							afterImage2.dir=usr.dir
							afterImage2.loc = usr.loc
							afterImage2.zer = 1
							flick("shun",afterImage2)
							usr.shun = 1
							usr.shunning=1
							src.Move(M.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.flashuse += 1
							usr.shunning=0
							if(usr.flashpause-20<=10)
								usr.flashpause=10
							sleep(usr.flashpause-20)
							if(usr)
								usr.shun = 0
					if(usr.szayel&&!usr.ko)
						var/s=pick(1,2,3,4,5,6,7,8,9,10)
						if(s==1||s==7)
							usr.Pills()
							M <<"<b>[src.name]:I thought you were strong!"
						if(s==2)
							step_to(usr,M,0)
						if(s==3)
							usr.Clone_Spit()
							M << "<b>[src.name]:How you like me now?"
						if(s==8)
							usr.Cero()
						if(s==9)
							usr.Bala()
						if(s==10)
							usr.Cero2()
							M << "<b>[src.name]:Try me!"
						if(s==4)
							usr.Instant_Regen()
							M << "<b>[src.name]:Can you keep up?"
						if(s==6)
							if(!usr.beatichigo)
								if(usr.wound>=20)
									usr.beatichigo=1
									usr.Ressurection()
									M << "<b>[src.name]:You ruined my clothes!"
						if(s==5)
							var/obj/afterImage/afterImage2 = new /obj/afterImage()
							afterImage2.layer = MOB_LAYER
							afterImage2.icon=usr.icon
							afterImage2.icon_state=usr.icon_state
							afterImage2.overlays=usr.overlays
							afterImage2.underlays = usr.underlays
							afterImage2.dir=usr.dir
							afterImage2.loc = usr.loc
							afterImage2.zer = 1
							flick("shun",afterImage2)
							usr.shun = 1
							usr.shunning=1
							src.Move(M.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.flashuse += 1
							usr.shunning=0
							if(usr.flashpause-20<=10)
								usr.flashpause=10
							sleep(usr.flashpause-20)
							if(usr)
								usr.shun = 0
					if(usr.ulquiorra&&!usr.ko||usr.Yokai4==1&&!usr.ko)
						var/s=pick(1,2,3,4,5,6,7,8,9,10)
						if(s==1||s==7)
							usr.Throw()
							view(8,usr) <<"<b>[src.name]:Try to dodge this!"
						if(s==2)
							step_to(usr,M,0)
						if(s==8)
							usr.flashmelee=1
							spawn(5)
							usr.flashmelee=0
							usr.Cero()
						if(s==9)
							usr.flashmelee=1
							spawn(5)
							usr.flashmelee=0
							usr.Bala()
						if(s==10)
							usr.flashmelee=1
							spawn(5)
							usr.flashmelee=0
							usr.Cero2()
							view(8,usr) << "<b>[src.name]:Try me!"
						if(s==4)
							usr.Instant_Regen()
							view(8,usr) << "<b>[src.name]:Can you keep up?"
						if(s==6)
							if(!usr.beatichigo)
								if(usr.wound>=20)
									usr.beatichigo=1
									usr.cerored=0
									usr.ceroblue=0
									usr.cerogreen=30
									usr.Arrancar_Release()
									usr.Ressurection()
									view(8,usr) << "<b>[src.name]:I'll show you the difference in our power!"
								if(usr.wound>=40)
									if(!usr.segunda)usr.Segunda_Ress()
						if(s==5)
							var/obj/afterImage/afterImage2 = new /obj/afterImage()
							afterImage2.layer = MOB_LAYER
							afterImage2.icon=usr.icon
							afterImage2.icon_state=usr.icon_state
							afterImage2.overlays=usr.overlays
							afterImage2.underlays = usr.underlays
							afterImage2.dir=usr.dir
							afterImage2.loc = usr.loc
							afterImage2.zer = 1
							flick("shun",afterImage2)
							usr.shun = 1
							usr.shunning=1
							src.Move(M.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.flashuse += 1
							usr.shunning=0
							if(usr.flashpause-20<=10)
								usr.flashpause=10
							sleep(usr.flashpause-20)
							if(usr)
								usr.shun = 0
					if(usr.vastoichigo&&!usr.ko)
						var/s=pick(1,2,3,4,5,6,7,8,9,10)
						if(s==1||s==7)
							usr.Getsuga_Tenshou()
							view(8,usr) <<"<b>[src.name]:.."
						if(s==2)
							step_to(usr,M,0)
						if(s==3)
							if(usr.wound>=50)
								if(usr.beatichigo==1)
									usr.beatichigo=2
									usr.vasto=1
									view(8,usr) << "<b>[src.name]:RAAAAARRRGGGHHH, Must protect..."
						if(s==8)
							usr.flashmelee=1
							spawn(5)
							usr.flashmelee=0
							usr.Cero()
						if(s==9)
							usr.Acceleration()
						if(s==10)
							usr.flashmelee=1
							spawn(5)
							usr.flashmelee=0
							usr.Cero2()
							view(8,usr) << "<b>[src.name]:Try me!"
						if(s==4)
							usr.Instant_Regen()
							view(8,usr) << "<b>[src.name]:Can you keep up?"
						if(s==6)
							if(!usr.beatichigo)
								if(usr.wound>=20)
									usr.Ichigo_Slash()
						if(s==5)
							var/obj/afterImage/afterImage2 = new /obj/afterImage()
							afterImage2.layer = MOB_LAYER
							afterImage2.icon=usr.icon
							afterImage2.icon_state=usr.icon_state
							afterImage2.overlays=usr.overlays
							afterImage2.underlays = usr.underlays
							afterImage2.dir=usr.dir
							afterImage2.loc = usr.loc
							afterImage2.zer = 1
							flick("shun",afterImage2)
							usr.shun = 1
							usr.shunning=1
							src.Move(M.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.flashuse += 1
							usr.shunning=0
							if(usr.flashpause-20<=10)
								usr.flashpause=10
							sleep(usr.flashpause-20)
							if(usr)
								usr.shun = 0
					if(usr.barragan&&!usr.ko||usr.Reaper&&!usr.ko||usr.Demon_Hollow&&!usr.ko||usr.Yokai2==1&&!usr.ko)
						var/s=pick(1,2,3,4,5,6,7,8,9,10)
						if(s==1||s==7)
							usr.Universal_Aging()
							view(8,usr) <<"<b>[src.name]:I'm the king!"
						if(s==2)
							step_to(usr,M,0)
						if(s==3)
							usr.Universal_Aging()
						if(s==8)
							usr.Drainage()
						if(s==9)
							usr.Drainage()
						if(s==10)
							usr.Cero2()
							view(8,usr) << "<b>[src.name]:Try me!"
						if(s==4)
							usr.firing=0
							usr.Instant_Regen()
							view(8,usr) << "<b>[src.name]:Can you keep up?"
						if(s==6)
							if(!usr.beatichigo)
								if(usr.wound>=20)
									usr.beatichigo=1
									usr.Ressurection()
									view(8,usr) << "<b>[src.name]:Enough fooling around!"
						if(s==5)
							var/obj/afterImage/afterImage2 = new /obj/afterImage()
							afterImage2.layer = MOB_LAYER
							afterImage2.icon=usr.icon
							afterImage2.icon_state=usr.icon_state
							afterImage2.overlays=usr.overlays
							afterImage2.underlays = usr.underlays
							afterImage2.dir=usr.dir
							afterImage2.loc = usr.loc
							afterImage2.zer = 1
							flick("shun",afterImage2)
							usr.shun = 1
							usr.shunning=1
							src.Move(M.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.flashuse += 1
							usr.shunning=0
							if(usr.flashpause-20<=10)
								usr.flashpause=10
							sleep(usr.flashpause-20)
							if(usr)
								usr.shun = 0

					if(usr.hal&&!usr.ko)
						var/s=pick(1,2,3,4,5,6,7,8,9,10)
						if(s==1)
							usr.Cascada()
							view(8,usr) <<"<b>[src.name]:Dodge This!"
						if(s==7)
							usr.Ola_Azul()
						if(s==2)
							step_to(usr,M,0)
						if(s==3)
							usr.rei+=500
						if(s==8)
							usr.La_Gota()
						if(s==9)
							usr.Bala()
						if(s==10)
							usr.Cero2()
							view(8,usr) << "<b>[src.name]:Try me!"
						if(s==4)
							usr.firing=0
							usr.Instant_Regen()
							view(8,usr) << "<b>[src.name]:Can you keep up?"
						if(s==6)
							if(!usr.beatichigo)
								if(usr.wound>=20)
									usr.beatichigo=1
									usr.Ressurection()
									view(8,usr) << "<b>[src.name]:You don't understand my sacrifices!"
						if(s==5)
							var/obj/afterImage/afterImage2 = new /obj/afterImage()
							afterImage2.layer = MOB_LAYER
							afterImage2.icon=usr.icon
							afterImage2.icon_state=usr.icon_state
							afterImage2.overlays=usr.overlays
							afterImage2.underlays = usr.underlays
							afterImage2.dir=usr.dir
							afterImage2.loc = usr.loc
							afterImage2.zer = 1
							flick("shun",afterImage2)
							usr.shun = 1
							usr.shunning=1
							src.Move(M.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.flashuse += 1
							usr.shunning=0
							if(usr.flashpause-20<=10)
								usr.flashpause=10
							sleep(usr.flashpause-20)
							if(usr)
								usr.shun = 0

					if(usr.nnoitra&&!usr.ko)
						var/s=pick(1,2,3,4,5,6,7,8,9,10)
						if(s==1||s==7)
							if(M.ko)
								usr.Facedir(M)
								usr.Outrage()
						if(s==2)
							step_to(usr,M,0)
						if(s==3)
							usr.Laceration()
						if(s==8)
							usr.Cero()
						if(s==9)
							usr.Bala()
						if(s==10)
							usr.Cero2()
							view(8,usr) << "<b>[src.name]:Try me!"
						if(s==4)
							usr.firing=0
							usr.Instant_Regen()
							view(8,usr) << "<b>[src.name]:Can you keep up?"
						if(s==6)
							if(!usr.beatichigo)
								if(usr.wound>=20)
									usr.beatichigo=1
									usr.Ressurection()
									view(8,usr) << "<b>[src.name]:Enough fooling around!"
						if(s==5)
							var/obj/afterImage/afterImage2 = new /obj/afterImage()
							afterImage2.layer = MOB_LAYER
							afterImage2.icon=usr.icon
							afterImage2.icon_state=usr.icon_state
							afterImage2.overlays=usr.overlays
							afterImage2.underlays = usr.underlays
							afterImage2.dir=usr.dir
							afterImage2.loc = usr.loc
							afterImage2.zer = 1
							flick("shun",afterImage2)
							usr.shun = 1
							usr.shunning=1
							src.Move(M.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.flashuse += 1
							usr.shunning=0
							if(usr.flashpause-20<=10)
								usr.flashpause=10
							sleep(usr.flashpause-20)
							if(usr)
								usr.shun = 0

					if(usr.zommari&&!usr.ko)
						var/s=pick(1,2,3,4,5,6,7,8,9,10)
						if(s==1||s==7)
							usr.Sovereign_Wave()
							view(8,usr) <<"<b>[src.name]:You're mine now!"
						if(s==2)
							step_to(usr,M,0)
						if(s==3)
							usr.etarget=M
							usr.Sovereigns()
						if(s==8)
							usr.Cero()
						if(s==9)
							usr.Bala()
						if(s==10)
							usr.Cero2()
							view(8,usr) << "<b>[src.name]:Try me!"
						if(s==4)
							usr.firing=0
							usr.Instant_Regen()
							view(8,usr) << "<b>[src.name]:Can you keep up?"
						if(s==6)
							if(!usr.beatichigo)
								if(usr.wound>=20)
									usr.beatichigo=1
									usr.Ressurection()
									view(8,usr) << "<b>[src.name]:Enough fooling around!"
						if(s==5)
							var/obj/afterImage/afterImage2 = new /obj/afterImage()
							afterImage2.layer = MOB_LAYER
							afterImage2.icon=usr.icon
							afterImage2.icon_state=usr.icon_state
							afterImage2.overlays=usr.overlays
							afterImage2.underlays = usr.underlays
							afterImage2.dir=usr.dir
							afterImage2.loc = usr.loc
							afterImage2.zer = 1
							flick("shun",afterImage2)
							usr.shun = 1
							usr.shunning=1
							src.Move(M.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.flashuse += 1
							usr.shunning=0
							if(usr.flashpause-20<=10)
								usr.flashpause=10
							sleep(usr.flashpause-20)
							if(usr)
								usr.shun = 0
					if(usr.grimmjow&&!usr.ko)
						var/s=pick(1,2,3,4,5,6,7,8,9,10)
						if(s==1||s==7)
							usr.Desgarron()
							view(8,usr) <<"<b>[src.name]:I'm a king!"
						if(s==2)
							step_to(usr,M,0)
						if(s==3)
							usr.Darts()
							view(8,usr) << "<b>[src.name]:Eat this!"
						if(s==8)
							usr.Cero()
						if(s==9)
							usr.Bala()
						if(s==10)
							usr.Cero2()
							view(8,usr) << "<b>[src.name]:Try me!"
						if(s==4)
							usr.firing=0
							usr.Instant_Regen()
							view(8,usr) << "<b>[src.name]:Can you keep up?"
						if(s==6)
							if(!usr.beatichigo)
								if(usr.wound>=20)
									usr.beatichigo=1
									usr.Ressurection()
									view(8,usr) << "<b>[src.name]:Wanna play rough, I'LL PLAY ROUGH!"
						if(s==5)
							var/obj/afterImage/afterImage2 = new /obj/afterImage()
							afterImage2.layer = MOB_LAYER
							afterImage2.icon=usr.icon
							afterImage2.icon_state=usr.icon_state
							afterImage2.overlays=usr.overlays
							afterImage2.underlays = usr.underlays
							afterImage2.dir=usr.dir
							afterImage2.loc = usr.loc
							afterImage2.zer = 1
							flick("shun",afterImage2)
							usr.shun = 1
							usr.shunning=1
							src.Move(M.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.flashuse += 1
							usr.shunning=0
							if(usr.flashpause-20<=10)
								usr.flashpause=10
							sleep(usr.flashpause-20)
							if(usr)
								usr.shun = 0

					if(usr.frank&&!usr.ko)
						var/s=pick(1,2,3,4,5,6,7,8,9,10,11)
						if(!src.seele)
							usr.bowon=1
						if(s==1||s==7)
							usr.Haizen()
							M <<"<b>[src.name]:Take that!"
						if(s==2)
							step_to(usr,M,0)
						if(s==3)
							usr.RapidShot()
							M << "<b>[src.name]:Eat this!"
						if(s==8)
							usr.Splitting_Arrow()
						if(s==9)
							usr.Volcore()
						if(s==10)
							usr.Gritz()
							M << "<b>[src.name]:Try moving now!"
						if(s==11)
							usr.bowon=0
							usr.Sprenger()
							M << "<b>[src.name]:Time to face a true quincy!"
						if(s==4)
							usr.Acceleration()
							M << "<b>[src.name]:Can you keep up?"
						if(s==6)
							if(!usr.beatichigo)
								if(usr.wound>=20)
									usr.beatichigo=1
									usr.Final()
									M << "<b>[src.name]:I'll never lose to the person who really wishes they could be me!"
						if(s==5)
							var/obj/afterImage/afterImage2 = new /obj/afterImage()
							afterImage2.layer = MOB_LAYER
							afterImage2.icon=usr.icon
							afterImage2.icon_state=usr.icon_state
							afterImage2.overlays=usr.overlays
							afterImage2.underlays = usr.underlays
							afterImage2.dir=usr.dir
							afterImage2.loc = usr.loc
							afterImage2.zer = 1
							flick("shun",afterImage2)
							usr.shun = 1
							usr.shunning=1
							src.Move(M.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.flashuse += 1
							usr.shunning=0
							if(usr.flashpause-20<=10)
								usr.flashpause=10
							sleep(usr.flashpause-20)
							if(usr)
								usr.shun = 0
					if(usr.willowk&&!usr.ko)
						var/s=pick(1,2,3,4,5,6,7)
						if(s==1||s==7)
							usr.Getsuga_Tenshou()
							M <<"<b>[src.name]:Take that!"
						if(s==2)
							step_to(usr,M,0)
						if(s==3)
							usr.Benihikou()
						if(s==4)
							usr.Acceleration()
							M << "<b>[src.name]:Can you keep up?"
						if(s==6)
							if(!usr.beatichigo)
								if(usr.wound>=90)
									usr.beatichigo=1
									usr.FinalBankai()
									spawn(80)
										usr.loc=locate(M.x,M.y,M.z)
										usr.moving=0
										step_away(usr,M,1)
										usr.Facedir(M)
										usr.Mugetsu()
										M << "<b>[src.name]:I'll never lose to the person who really wishes they could be me!"
						if(s==5)
							var/obj/afterImage/afterImage2 = new /obj/afterImage()
							afterImage2.layer = MOB_LAYER
							afterImage2.icon=usr.icon
							afterImage2.icon_state=usr.icon_state
							afterImage2.overlays=usr.overlays
							afterImage2.underlays = usr.underlays
							afterImage2.dir=usr.dir
							afterImage2.loc = usr.loc
							afterImage2.zer = 1
							flick("shun",afterImage2)
							usr.shun = 1
							usr.shunning=1
							src.Move(M.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.flashuse += 1
							usr.shunning=0
							if(usr.flashpause-20<=10)
								usr.flashpause=10
							sleep(usr.flashpause-20)
							if(usr)
								usr.shun = 0
					if(usr.isfgt&&!usr.ko)
						var/s=pick(1,2,3,4,5,6,7,8,9,10)
						if(s==1||s==7)
							usr.flashmelee=1
						if(s==2)
							usr.flashmelee=0
						if(s==8)
							usr.Ichigo_Slash()
						if(s==9)
							usr.aggrod=0
						if(s==3)
							usr.Ichigo_Slash()
							var/k=pick(1,2,2,2,2,2,2)
							if(k==1)
								M << "<b>[src.name]:Don't be scared."
						if(s==10)
							usr.Getsuga_Tenshou()
							var/k=pick(1,2,2,2,2,2,2)
							if(k==1)
								M << "<b>[src.name]:Take that!"
						if(s==4)
							usr.Acceleration()
							var/k=pick(1,2,2,2,2,2,2)
							if(k==1)
								M << "<b>[src.name]:Can you keep up?"
						if(s==6)
							usr.Mugetsu()
							var/k=pick(1,2)
							if(k==1)
								M << "<b>[src.name]:Sorry, but I have to end this!"
						if(s==5)
							var/obj/afterImage/afterImage2 = new /obj/afterImage()
							afterImage2.layer = MOB_LAYER
							afterImage2.icon=usr.icon
							afterImage2.icon_state=usr.icon_state
							afterImage2.overlays=usr.overlays
							afterImage2.underlays = usr.underlays
							afterImage2.dir=usr.dir
							afterImage2.loc = usr.loc
							afterImage2.zer = 1
							flick("shun",afterImage2)
							usr.shun = 1
							usr.shunning=1
							src.Move(M.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.shunning=0
							if(usr.flashpause-20<=10)
								usr.flashpause=10
							sleep(usr.flashpause-20)
							if(usr)
								usr.shun = 0
					if(usr.FGT&&!usr.ko)
						var/s=pick(1,2,3,4,5,6,7,8,10)
						if(s==1||s==7)
							usr.flashmelee=1
						if(s==2)
							usr.flashmelee=0
						if(s==8)
							usr.Ichigo_Slash()
						if(s==3)
							usr.Ichigo_Slash()
							var/k=pick(1,2,2,2,2,2,2)
							if(k==1)
								M << "<b>[src.name]:Don't be scared."
						if(s==10)
							usr.Getsuga_Tenshou()
							var/k=pick(1,2,2,2,2,2,2)
							if(k==1)
								M << "<b>[src.name]:Take that!"
						if(s==4)
							usr.Acceleration()
							var/k=pick(1,2,2,2,2,2,2)
							if(k==1)
								M << "<b>[src.name]:Can you keep up?"
						if(s==6)
							usr.Mugetsu()
							var/k=pick(1,2)
							if(k==1)
								M << "<b>[src.name]:Sorry, but I have to end this!"
						if(s==5)
							var/obj/afterImage/afterImage2 = new /obj/afterImage()
							afterImage2.layer = MOB_LAYER
							afterImage2.icon=usr.icon
							afterImage2.icon_state=usr.icon_state
							afterImage2.overlays=usr.overlays
							afterImage2.underlays = usr.underlays
							afterImage2.dir=usr.dir
							afterImage2.loc = usr.loc
							afterImage2.zer = 1
							flick("shun",afterImage2)
							usr.shun = 1
							usr.shunning=1
							src.Move(M.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.shunning=0
							if(usr.flashpause-20<=10)
								usr.flashpause=10
							sleep(usr.flashpause-20)
							if(usr)
								usr.shun = 0
					if(usr.ichigofinal&&!usr.ko)
						var/s=pick(1,2,3,4,5,6,7,8,10)
						if(s==1)
							if(usr.wound>=10)
								if(!usr.inbankai)
									usr.Bankai()
							if(usr.wound>=90)
								usr.FinalBankai()
						if(s==7)
							usr.flashmelee=1
						if(s==2)
							usr.flashmelee=0
						if(s==8)
							usr.Ichigo_Slash()
						if(s==3)
							usr.Ichigo_Slash()
							var/k=pick(1,2,2,2,2,2,2)
							if(k==1)
								M << "<b>[src.name]:Don't be scared."
						if(s==10)
							usr.Getsuga_Tenshou()
							var/k=pick(1,2,2,2,2,2,2)
							if(k==1)
								M << "<b>[src.name]:Take that!"
						if(s==4)
							usr.Acceleration()
							var/k=pick(1,2,2,2,2,2,2)
							if(k==1)
								M << "<b>[src.name]:Can you keep up?"
						if(s==6)
							usr.firing=0
							usr.Mugetsu()
							var/k=pick(1,2)
							if(k==1)
								M << "<b>[src.name]:Sorry, but I have to end this!"
						if(s==5)
							var/obj/afterImage/afterImage2 = new /obj/afterImage()
							afterImage2.layer = MOB_LAYER
							afterImage2.icon=usr.icon
							afterImage2.icon_state=usr.icon_state
							afterImage2.overlays=usr.overlays
							afterImage2.underlays = usr.underlays
							afterImage2.dir=usr.dir
							afterImage2.loc = usr.loc
							afterImage2.zer = 1
							flick("shun",afterImage2)
							usr.shun = 1
							usr.shunning=1
							src.Move(M.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.shunning=0
							if(usr.flashpause-20<=10)
								usr.flashpause=10
							sleep(usr.flashpause-20)
							if(usr)
								usr.shun = 0
					if(usr.uraharafinal&&!usr.ko)
						if(usr.wound>=20)
							if(!usr.inbankai)
								usr.Bankai()
						var/s=pick(1,2,4,5,7,10)
						if(s==1||s==7)
							usr.flashmelee=1
						if(s==2)
							usr.flashmelee=0
						if(s==10)
							usr.Nake()
							var/k=pick(1,2,2,2,2,2,2)
							if(k==1)
								M << "<b>[src.name]:Take that!"
						if(s==4)
							usr.Blood_Mist()
							var/k=pick(1,2,2,2,2,2,2)
							if(k==1)
								M << "<b>[src.name]:Can you keep up?"
						if(s==5)
							var/obj/afterImage/afterImage2 = new /obj/afterImage()
							afterImage2.layer = MOB_LAYER
							afterImage2.icon=usr.icon
							afterImage2.icon_state=usr.icon_state
							afterImage2.overlays=usr.overlays
							afterImage2.underlays = usr.underlays
							afterImage2.dir=usr.dir
							afterImage2.loc = usr.loc
							afterImage2.zer = 1
							flick("shun",afterImage2)
							usr.shun = 1
							usr.shunning=1
							src.Move(M.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.moving = 0
							new/obj/afterimage(usr.loc)
							usr.shunning=0
							if(usr.flashpause-20<=10)
								usr.flashpause=10
							sleep(usr.flashpause-20)
							if(usr)
								usr.shun = 0
					if(usr.fgetsugas&&!usr.ko)
						var/t=pick(1,2,3,4,5,6,7)
						if(t==1)
							usr.Step_Back(M)
						if(t==4||t==7)
							usr.infinal=1
							usr.Getsuga_Tenshou()
						if(t==5)
							usr.Step_Back(M)
						if(t==6)
							usr.Coffin()
						/*	var/list/Menu = new()
							for(var/turf/d in view(2,M))
								Menu.Add(d)
							var/turf/xs=pick(Menu)	*/
							if(usr.coffin)
								usr.Make_Coffin(M)
					if(usr.race=="Sub-Shinigami"&&!usr.ko)
						var/t=pick(1,2,3,5,6,8)
						usr.etarget=M
						usr.Facedir(M)
						if(!usr.inshikai&&!usr.inbankai)
							usr.Shikai()
						if(!usr.inbankai)
							usr.Bankai()
						if(!usr.infull&&!usr.inafull)
							usr.Fullbring()
						if(!usr.inafull)
							usr.AFullbring()
						if(t==1)
							usr.Step_Back()
						if(t==2)
							usr.Flashing_Melee()
						if(t==3)
							usr.Coffin()
						/*	var/list/Menu = new()
							for(var/turf/d in view(2,M))
								Menu.Add(d)
							var/turf/xs=pick(Menu)	*/
							if(usr.coffin)
								usr.Make_Coffin(M)
						if(t==8)
							if(usr.infull||usr.inafull)
								if(usr.ftype=="Ichigo")
									usr.Getsuga_Ring()
								if(usr.ftype=="Jackie")
									usr.Critical_Hit()
								if(usr.ftype=="Yukio")
									usr.etarget=M
									usr.Delete_Profile()
								if(usr.ftype=="Ginjo")
									usr.Bringer_Blast()
								if(usr.ftype=="Tsukishima")
									usr.Memory_Strikes()
						if(t==5)
							if(usr.inshikai||usr.inbankai)
								if(usr.stype=="Urahara")
									usr.Nake()
								if(usr.stype=="Tousen")
									usr.Benihikou()
								if(usr.stype=="Rukia")
									usr.Hakuren()
								if(usr.stype=="Ukitake")
									usr.Raikouhou()
								if(usr.stype=="Shonshui")
									usr.Tenran()
								if(usr.stype=="Ichigo")
									usr.Getsuga_Tenshou()
								if(usr.stype=="Zaraki")
									usr.Berserk()
								if(usr.stype=="Hitsugaya")
									usr.Shoot_Dragon()
								if(usr.stype=="Yammamoto")
									usr.Shoen()
								if(usr.stype=="Kaiens")
									usr.Wave()
								if(usr.stype=="Jiroubou")
									usr.Shuriken_Toss()
								if(usr.stype=="Aizen")
									usr.Invisibility()
								if(usr.stype=="Yumichika")
									usr.Yumi()
						if(t==6)
							if(usr.inshikai||usr.inbankai)
								if(usr.stype=="Urahara")
									usr.Blood_Mist()
								if(usr.stype=="Tousen")
									usr.Benihikou()
								if(usr.stype=="Rukia")
									usr.Hakuren()
								if(usr.stype=="Ukitake")
									usr.Raikouhou()
								if(usr.stype=="Shonshui")
									usr.Bushogoma()
								if(usr.stype=="Ichigo")
									usr.Ichigo_Slash()
								if(usr.stype=="Hitsugaya")
									usr.Sennen_Hyoro()
								if(usr.stype=="Yammamoto")
									usr.etarget=M
									usr.Creamation()
								if(usr.stype=="Kaiens")
									usr.Wave()
								if(usr.stype=="Jiroubou")
									usr.Homing_Shurikens()
								if(usr.stype=="Aizen")
									if(!usr.cheating)
										usr.Cheatmode()
								if(usr.stype=="Yumichika")
									usr.Yumi()
								if(usr.stype=="Stinger")
									if(usr.inbankai)
										usr.etarget=M
										usr.Rocket()
					if(usr.race=="Vaizard"&&!usr.ko)
						usr.etarget=M
						usr.Facedir(M)
						var/t=pick(1,2,3,4,5,6)
						if(usr.isavasto)
							t=4
						if(t==1)
							usr.Step_Back()
						if(t==2)
							usr.Cero()
						if(t==3)
							usr.Cero2()
						if(t==5)
							if(usr.stype=="Kido Class")
								var/df=pick(1,2,3,4,6)
								if(df==1)
									usr.Sai()
								if(df==2)
									usr.Shitotsu_Sansen()
								if(df==3)
									usr.Raihou()
								if(df==4)
									usr.Danku()

							if(usr.inshikai||usr.inbankai)
								if(usr.stype=="Urahara")
									usr.Nake()
								if(usr.stype=="Tousen")
									usr.Benihikou()
								if(usr.stype=="Rukia")
									usr.Hakuren()
								if(usr.stype=="Ukitake")
									usr.Raikouhou()
								if(usr.stype=="Shonshui")
									usr.Tenran()
								if(usr.stype=="Ichigo")
									usr.Getsuga_Tenshou()
								if(usr.stype=="Zaraki")
									usr.Berserk()
								if(usr.stype=="Hitsugaya")
									usr.Shoot_Dragon()
								if(usr.stype=="Yammamoto")
									usr.Shoen()
								if(usr.stype=="Kaiens")
									usr.Wave()
								if(usr.stype=="Jiroubou")
									usr.Shuriken_Toss()
								if(usr.stype=="Aizen")
									usr.Invisibility()
								if(usr.stype=="Yumichika")
									usr.Yumi()
								if(usr.stype=="Stinger")
									if(usr.inbankai)
										usr.Rocket()
						if(t==6)
							if(usr.stype=="Kido Class")
								if(usr.health<usr.mhealth/3)
									usr.Itto_Kasu()

							if(usr.inshikai||usr.inbankai)
								if(usr.stype=="Urahara")
									usr.Blood_Mist()
								if(usr.stype=="Tousen")
									usr.Benihikou()
								if(usr.stype=="Rukia")
									usr.Hakuren()
								if(usr.stype=="Ukitake")
									usr.Raikouhou()
								if(usr.stype=="Shonshui")
									usr.Bushogoma()
								if(usr.stype=="Ichigo")
									usr.Ichigo_Slash()
								if(usr.stype=="Hitsugaya")
									usr.Sennen_Hyoro()
								if(usr.stype=="Yammamoto")
									usr.etarget=M
									usr.Creamation()
								if(usr.stype=="Kaiens")
									usr.Wave()
								if(usr.stype=="Jiroubou")
									usr.Homing_Shurikens()
								if(usr.stype=="Aizen")
									if(!usr.cheating)
										usr.Cheatmode()
								if(usr.stype=="Yumichika")
									usr.Yumi()
								if(usr.stype=="Stinger")
									if(usr.inbankai)
										usr.Rocket()
						if(t==4)
							if(!usr.vasto)
								if(usr.health<usr.mhealth/1.2)
									if(!usr.maskon)
										usr.Inner_Mode()
								if(usr.health<usr.mhealth/1.5)
									if(!usr.inshikai)
										usr.Shikai()
										usr.shikaidrain=0
								if(usr.health<usr.mhealth/2)
									if(!usr.inbankai)
										if(!usr.inshikai)usr.Shikai()
										usr.Bankai()
										usr.bankaidrain=0
							if(usr.vasto)
								usr.maskon=1
								if(!usr.inshikai)
									usr.Shikai()
								if(!usr.inbankai)
									usr.Bankai()
					usr.Attack()
					//spawn(1)
					//sleep(3)
					//src.icon_state=""
				else
					if(!src.npcespada&&!src.npccaptain)
						if(usr.finalb)usr.Final()
						if(usr.inafull)usr.AFullbring()
						if(usr.infull)usr.Fullbring()
						if(usr.inbankai)usr.Bankai()
						if(usr.inshikai)usr.Shikai()
						if(usr.maskon)usr.Inner_Mode()
						if(usr.ressurection)usr.Ressurection()







mob
	proc
		npcregeneration()
			set background = 1
			while(src.health>0)
				sleep(1)
			src.loc=null
			src.invisibility=100
			sleep(100)
			del(src)
