turf
	tele
		friend
			Enter(A)
				if(ismob(A))
					usr.loc=locate(src.x,src.y,src.z)
					if(usr.beatandget==1)
						usr.frozen=1
						var/mob/q=new/mob/Storyline/Friendly_Arrancar2(locate(src.x-4,src.y,src.z))
						q.wound=101
						flick("shun",q)
						sleep(4)
						q.Talks("Congratulations, you wrecked Aizen!")
						sleep(15)
						usr.Talks("But I don't remem-")
						sleep(10)
						q.Talks("Give the hougyoku to me so this will never happen again")
						sleep(50)
						usr.Talks("Are you trying to control me?")
						sleep(30)
						q.Talks("Of course not, I helped you escape that chaos")
						sleep(60)
						usr.Talks("But Aizen told me-")
						sleep(20)
						q.Talks("Are you gonna believe Aizen over me?")
						sleep(30)
						usr.Talks("I'll just return the hougyoku to Urahara")
						sleep(60)
						q.Talks("What a foolish choice. however, I know you'll come around eventually")
						sleep(15)
						flick("shun",q)
						switch(input("Will you bring it back to Urahara and see what he has in stores or will you absorb the Hougyoku gaining raw power", text) in list ("Good(Give it to Urahara)","Evil(Absorb it's power)"))
							if("Good(Give it to Urahara)")
								usr.wound=0
								usr.contents-=/obj/items/equipable/Hougyoku
								usr.loc = locate(17,162,1)
								usr.dir=NORTH
								usr.GainMoney(400000)
								usr.GainExp(6000000)
								usr<<"<font color=blue><b>You gained $400,000 and 6 million exp"
								usr.Story_Talk("You have given the hougyoku to Urahara and he locks it away and gives you some of its power")
								usr.mattack+=2500
								usr.attack+=2500
								usr.mreiatsu+=2500
								usr.reiatsu+=2500
								usr.mdefence+=2500
								usr.defence+=2500
								usr.rawbuff+=2500
								usr.rei+=3500
								usr.mrei+=3500
								usr.evilgood="Good"
							if("Evil(Absorb it's power)")
								usr.Story_Talk("The friendly Arrancar takes complete control of you and kills you in the process. You now play as the Friendly Arrancar")
								sleep(20)
								usr.Talks("I knew he would come around. Time to see his strength after all this time")
								usr.evilgood="Evil"
						usr.beatandget=2
					else
						usr.loc=locate(src.x,src.y,src.z)
				else
					if(istype(A,/obj/))return
		aizen
			Enter(A)
				if(ismob(A))
					usr.loc=locate(src.x,src.y,src.z)
					if(usr.race == "Arrancar"&&!usr.beatfgts&&usr.level>=600)
						usr.frozen=1
						var/mob/q=new/mob/Ashellnpc(locate(src.x,src.y-4,src.z))
						flick("shun",q)
						sleep(4)
						switch(input("We are one step from taking over the world. I took out the entire 13 Gotei Court Squads and the rest of the Espadas myself, but Ichigo is following us. Take care of him. Will you?", text) in list ("Yes","No"))
							if("Yes")
								usr.wound=0
								usr.loc=locate(23,74,13)
								usr.dir=EAST
								var/mob/k=new/mob/FGT
								k.dir=WEST
								k.loc=locate(27,74,13)
								k.frozen=1
								usr.frozen=1
								k.Load_Overlays()
								sleep(55)
								k.frozen=0
								usr.frozen=0
							if("No")
								usr.frozen=0
					else
						usr.loc=locate(src.x,src.y,src.z)
				else
					if(istype(A,/obj/))return
		fgt
			Enter(A)
				if(ismob(A))
					usr.loc=locate(src.x,src.y,src.z)
					if(usr.race == "Shinigami"&&!usr.beatashell&&usr.level>=700&&usr.stype!="Kido Class")
						usr.frozen=1
						var/mob/q=new/mob/FinalGetsugaTenshou(locate(src.x,src.y+4,src.z))
						flick("shun",q)
						sleep(4)
						switch(input("Aizen is going out of control and is going to take over the world. He took out the entire 13 Gotei Court Squads and the rest of the Espadas himself. You must fight with all your might and kill him. Will you?", text) in list ("Yes","No"))
							if("Yes")
								usr.wound=0
								usr.loc=locate(23,74,13)
								usr.dir=EAST
								var/mob/k=new/mob/Ashell
								k.dir=WEST
								k.loc=locate(27,74,13)
								k.frozen=1
								usr.frozen=1
								k.Load_Overlays()
								sleep(55)
								k.frozen=0
								usr.frozen=0
							if("No")
								usr.frozen=0
					else
						usr.loc=locate(src.x,src.y,src.z)
				else
					if(istype(A,/obj/))return
		torbarb
			Enter(A)
				if(ismob(A))
					usr.loc = locate(54,154,1)
					usr.safe = 0
				else
					if(istype(A,/obj/))return
		tosouthkar
			Enter(A)
				if(ismob(A))
					for(var/mob/jk in oview(4,usr))
						if(jk.follow==usr)
							spawn(2)
								jk.loc=locate(usr.x,usr.y,usr.z)
								if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
									usr.CompleteMish(3000,rand(150,250),view(20,usr))
					usr.loc = locate(123,199,17)
					usr.safe = 0
				else
					if(istype(A,/obj/))return
		fromsouthkar
			Enter(A)
				if(ismob(A))
					for(var/mob/jk in oview(4,usr))
						if(jk.follow==usr)
							spawn(2)
								jk.loc=locate(usr.x,usr.y,usr.z)
								if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
									usr.CompleteMish(3000,rand(150,250),view(20,usr))
					usr.loc = locate(49,86,2)
					usr.safe = 0
				else
					if(istype(A,/obj/))return
		fromrbarb
			Enter(A)
				if(ismob(A))
					usr.loc = locate(66,56,7)
					usr.safe = 0
				else
					if(istype(A,/obj/))return
		tomeeting
			Enter(A)
				if(ismob(A))
					usr.loc = locate(12,3,19)
					usr.safe = 1
				else
					if(istype(A,/obj/))return
		frommeeting
			Enter(A)
				if(ismob(A))
					usr.loc = locate(2,105,4)
					usr.safe = 0
				else
					if(istype(A,/obj/))return
		tovillage
			Enter(A)
				if(ismob(A))
					for(var/mob/jk in oview(4,usr))
						if(jk.follow==usr)
							spawn(2)
								jk.loc=locate(usr.x,usr.y,usr.z)
								if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
									usr.CompleteMish(3000,rand(150,250),view(20,usr))
					usr.loc = locate(usr.x,199,7)
					usr.safe = 0
				else
					if(istype(A,/obj/))return
		fromvillage
			Enter(A)
				if(ismob(A))
					for(var/mob/jk in oview(4,usr))
						if(jk.follow==usr)
							spawn(2)
								jk.loc=locate(usr.x,usr.y,usr.z)
								if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
									usr.CompleteMish(3000,rand(150,250),view(20,usr))
					usr.loc = locate(usr.x,2,4)
					usr.safe = 0
				else
					if(istype(A,/obj/))return
		circles
			Enter(A)
				if(ismob(A))
					usr.loc = locate(30,usr.y,14)
					usr.safe = 0
				else
					if(istype(A,/obj/))
						var/obj/M = A
						M.loc = locate(30,M.y,14)
		tobar
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(49,128,1)
						usr.safe = 1
				else
					if(istype(A,/obj/)) return
/*		SZ
			Enter(A)
				if(ismob(A))
					usr.safe = 1
					usr.loc=locate(src.x,src.y,src.z)
				else
					if(istype(A,/obj/)) return
		SZNON
			Enter(A)
				if(ismob(A))
					usr.safe = 0
					usr.loc=locate(src.x,src.y,src.z)
				else
					if(istype(A,/obj/)) return*/
		frombar
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(40,133,2)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		tohauntedhouse
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(31,64,19)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		fromhauntedhouse
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(99,178,2)
						if(usr.escort)
							for(var/mob/S in world)
								if(S.son)
									S.loc=usr.loc
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		toforest
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(199,176,18)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		fromforest
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(3,180,2)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return


		toquincyland
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
					/*	for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))	*/
						usr.loc = locate(198,120,29)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return


		fromquincyland
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
					/*	for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))	*/
						usr.loc = locate(2,99,2)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return



		teletodojo
			icon = 'Icons/portal3.dmi'
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						if(M.gotthecharge&&portaltime)
							M<<"You can't leave with the charge"
							return
						usr.loc = locate(117,192,1)
						usr.incr=0
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		portal3
			icon = 'Icons/portal3.dmi'
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(15,194,1)
						usr.safe = 0
						usr.incr=1
				else
					if(istype(A,/obj/)) return
		menosportal1
			icon = 'Icons/menosportal.dmi'
		menosportal
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(148,197,1)
						usr.incr=1
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		teletohueco
			icon = 'Icons/dimention.dmi'
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(164,155,3)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		telefromhueco
			icon = 'Icons/dimention.dmi'
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(43,154,2)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		teletosshospital
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(75,20,5)
						usr.safe = 1
				else
					if(istype(A,/obj/)) return
		teletoebarb
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(43,143,1)
						usr.safe = 1
				else
					if(istype(A,/obj/)) return
		teletohbarb
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(55,143,1)
						usr.safe = 1
				else
					if(istype(A,/obj/)) return
		teletosbarb
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(67,143,1)
						usr.safe = 1
				else
					if(istype(A,/obj/)) return
		telefromebarb
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(18,101,2)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		telefromsbarb
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(130,100,4)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		telefromsshospital
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(130,130,4)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		teletohospital
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(44,186,1)
						usr.safe = 1
				else
					if(istype(A,/obj/)) return
		telefromhospital
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(12,183,2)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		teletourahara
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(15,186,1)
						usr.safe = 1
						usr<<"<b>Urahara:</b>Hello, would you like to buy anything!"
				else
					if(istype(A,/obj/)) return
		telefromurahara
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(46,193,2)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		teletouraharab
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(17,139,1)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		telefromvand
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(199,184,15)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		teletovand
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(1,107,9)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		telefrommenos
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(199,159,3)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		teletomenos
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(16,87,15)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		telefromuraharab
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(6,199,1)
						usr.safe = 1
						usr<<"<b>Urahara:</b>Hello, would you like to buy anything!"
				else
					if(istype(A,/obj/)) return
		teletotower
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(89,143,1)
				else
					if(istype(A,/obj/)) return
		telefromtower
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(127,103,29)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		telefromR
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(102,10,8)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		teletoR
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(148,164,1)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		telefromvaibase
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(95,16,17)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		teletovaibase
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(154,6,19)
				else
					if(istype(A,/obj/)) return
		telefromshiniteach
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(54,161,4)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		teletoshiniteach
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(84,87,5)
						usr.safe = 1
				else
					if(istype(A,/obj/)) return
		teletoktlab
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(49,33,19)
				else
					if(istype(A,/obj/)) return
		telefromktlab
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(33,162,17)
				else
					if(istype(A,/obj/)) return
		teletolab
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(48,3,19)
				else
					if(istype(A,/obj/)) return
		telefromlab
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(58,136,7)
				else
					if(istype(A,/obj/)) return
		teletosquad1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(174,183,5)
				else
					if(istype(A,/obj/)) return
		telefromsquad1
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(126,166,4)
				else
					if(istype(A,/obj/)) return
		teletosquad2
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(192,183,5)
				else
					if(istype(A,/obj/)) return
		telefromsquad2
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(166,166,4)
				else
					if(istype(A,/obj/)) return
		teletosquad3
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(174,162,5)
				else
					if(istype(A,/obj/)) return
		telefromsquad3
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(166,133,4)
				else
					if(istype(A,/obj/)) return
		teletosquad5
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(192,162,5)
				else
					if(istype(A,/obj/)) return
		telefromsquad5
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(50,118,4)
				else
					if(istype(A,/obj/)) return
		teletosquad6
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(174,141,5)
				else
					if(istype(A,/obj/)) return
		telefromsquad6
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(50,83,4)
				else
					if(istype(A,/obj/)) return
		teletosquad7
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(192,141,5)
				else
					if(istype(A,/obj/)) return
		telefromsquad7
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(130,71,4)
				else
					if(istype(A,/obj/)) return
		teletosquad8
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(174,120,5)
				else
					if(istype(A,/obj/)) return
		telefromsquad8
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(166,98,4)
				else
					if(istype(A,/obj/)) return
		teletosquad9
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(192,120,5)
				else
					if(istype(A,/obj/)) return
		telefromsquad9
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(166,63,4)
				else
					if(istype(A,/obj/)) return
		teletosquad10
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(174,99,5)
				else
					if(istype(A,/obj/)) return
		telefromsquad10
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(50,44,4)
				else
					if(istype(A,/obj/)) return
		teletosquad11
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(192,99,5)
				else
					if(istype(A,/obj/)) return
		telefromsquad11
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(50,19,4)
				else
					if(istype(A,/obj/)) return
		teletosquad12
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(174,78,5)
				else
					if(istype(A,/obj/)) return
		telefromsquad12
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(117,38,4)
				else
					if(istype(A,/obj/)) return
		teletosquad13
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(192,78,5)
				else
					if(istype(A,/obj/)) return
		telefromsquad13
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(166,38,4)
				else
					if(istype(A,/obj/)) return
		teletotunnel
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(148,128,1)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		telefromtunnel
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						if(M.gotthecharge&&portaltime)
							M<<"You can't leave with the charge"
							return
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(17,161,1)
						usr.incr=0
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		teletocaphouse
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(33,142,5)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		telefromcaphouse
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(134,181,4)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		teletoaizen
			icon='Icons/turf.dmi'
			Enter(A)
				if(ismob(A)||usr.race=="Hollow"||usr.race=="Arrancar")
					var/mob/M = A
					if(M.client)
						usr.loc = locate(12,180,3)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		teletohollowforest
			//icon='Icons/hole.dmi'
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = pick(
						prob(25)
							locate(30,26,12),
						prob(25)
							locate(65,122,12),
						prob(25)
							locate(162,188,12),
						prob(25)
							locate(146,59,12))
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		telefromhollowforest
			//icon='Icons/turf.dmi'
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(173,7,3)
						view(src) << sound(null)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		teletolasnoches
			icon='Icons/turf.dmi'
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(49,2,11)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		telefromlasnoches
			icon='Icons/turf.dmi'
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(21,177,3)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		teletohm
			icon='Icons/turf.dmi'
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						if(M.gotthecharge&&portaltime)
							M<<"You can't leave with the charge"
							return
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(11,62,3)
						usr.incr=0
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		telefromss
			icon='Icons/turf.dmi'
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(148,2,1)
						usr.incr=1
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		teletoearthtunnel
			icon='Icons/turf.dmi'
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(2,103,1)
						usr.incr=1
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		teletomall
			icon='Icons/turf.dmi'
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(188,2,5)
						usr.safe = 1
				else
					if(istype(A,/obj/)) return
		telefrommall
			icon='Icons/turf.dmi'
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(37,111,2)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		teletohmtunnel
			icon='Icons/turf.dmi'
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(148,199,1)
						usr.safe = 0
				else
					if(istype(A,/obj/)) return
		teletoss
			icon='Icons/turf.dmi'
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						if(M.gotthecharge&&portaltime)
							usr<<"You can't leave with the charge"
							return
						for(var/mob/jk in oview(4,usr))
							if(jk.follow==usr)
								spawn(2)
									jk.loc=locate(usr.x,usr.y,usr.z)
									if(jk.z==4&&usr.mlocation=="Soul Society"||jk.z==3&&usr.mlocation=="Hueco Mundo"||jk.z==11&&usr.mlocation=="Las Noches"||jk.z==7&&usr.mlocation=="Rukongai"||jk.z==12&&usr.mlocation=="Lost Vaizard Forest"||jk.z==1&&jk.x<32&&jk.y<170&&usr.mlocation=="Urahara's Basement")
										usr.CompleteMish(3000,rand(150,250),view(20,usr))
						usr.loc = locate(96,111,4)
						usr.safe = 0
						usr.incr=0
				else
					if(istype(A,/obj/)) return

		teletohellpart3
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(98,10,21)
				else
					if(istype(A,/obj/)) return
		telefromhellpart3
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(142,121,18)
				else
					if(istype(A,/obj/)) return
		teletovalleyscreams
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						if(M.gotthecharge&&portaltime)
							usr<<"You can't leave with the charge"
							return
						usr.loc = locate(124,172,21)
				else
					if(istype(A,/obj/)) return
		telefromvalleyofscreams
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(137,105,1)
				else
					if(istype(A,/obj/)) return
		teletourahara2
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.level <65)
						usr<< output("<font color = purple><B>{NPC}Dojo Owner)I dont recommend leaving until atleast level 65","output")
					if(M.client&&M.level >64)
						usr.loc = locate(15,194,1)
				else
					if(istype(A,/obj/)) return
		teletoUnderworld
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						if(M.gotthecharge&&portaltime)
							usr<<"You can't leave with the charge"
							return
					if(M.client)
						usr.loc = locate(3,26,22)
				else
					if(istype(A,/obj/)) return
		telefromUnderworld
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(161,107,1)
				else
					if(istype(A,/obj/)) return


		teletoRogues
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(154,194,9)
				else
					if(istype(A,/obj/)) return

		telefromRogues
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(65,196,2)
				else
					if(istype(A,/obj/)) return
		teletoTheGate
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						if(M.gotthecharge&&portaltime)
							usr<<"You can't leave with the charge"
							return
		//			if(M.level <650)
		//				usr<< output("<font color = purple><B>You must be atleast level 650 to enter this area!WARNING:VERY DANGEROUS CREATURES","output")
					if(M.client)
						usr.savethereflashstep=usr.flashstep
						usr.flashstep=0
						usr.loc = locate(41,158,23)
				else
					if(istype(A,/obj/)) return
		telefromTheGate
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.flashstep=usr.savethereflashstep
						usr.loc = locate(153,109,1)
				else
					if(istype(A,/obj/)) return
		teletoPheonix
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client&&M.redwolfkills>19)
						usr.loc = locate(51,83,24)
					if(M.redwolfkills<20)
						usr<<"You must defeat 20/[usr.redwolfkills] before entering"
				else
					if(istype(A,/obj/)) return
		teleFromPheonix
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(51,79,24)
				else
					if(istype(A,/obj/)) return
		teletoLoreleiDen
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						if(M.demonbosskills<5)
							usr<<"You Must kill the demon boss [usr.demonbosskills]/5 times before entering"
							return
						if(M.gatecreatorkills<5)
							usr<<"You Must kill the gate creator [usr.gatecreatorkills]/5 times before entering"
							return
						if(M.client&&M.gatecreatorkills>9&&M.demonbosskills>9)
							usr.loc = locate(51,2,24)
				else
					if(istype(A,/obj/)) return
		telefromLoreleiDen
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(25,74,21)
				else
					if(istype(A,/obj/)) return
		teletoClonedArea
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(93,198,25)
				else
					if(istype(A,/obj/)) return

		telefromClonedArea
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(46,173,2)
				else
					if(istype(A,/obj/)) return
		teletoSakuraArea
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(29,14,25)
				else
					if(istype(A,/obj/)) return
		telefromSakuraArea
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(117,28,17)
				else
					if(istype(A,/obj/)) return
		teletoDesArea
			layer=100
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(3,100,26)
				else
					if(istype(A,/obj/)) return
		telefromDesArea
			layer=100
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(143,113,1)
				else
					if(istype(A,/obj/)) return
		teletoVandPrince
			icon='Icons/enter to vand prin.dmi'
			icon_state="Opened"
			layer=100
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
					//	if(M.level <400)
					//		usr<< output("<font color = purple><B>You must be atleast level 400.","output")
						usr.loc = locate(50,166,26)
				else
					if(istype(A,/obj/)) return

		telefromVandPrince
			icon='Icons/enter to vand prin.dmi'
			icon_state="Opened"
			layer=100
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(32,142,9)
				else
					if(istype(A,/obj/)) return


		telefromyamastarter
			icon='Icons/enter to vand prin.dmi'
			icon_state="Opened"
			layer=100
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(44,143,9)
				else
					if(istype(A,/obj/)) return


		telefromaizenroom
			icon='Icons/enter to vand prin.dmi'
			icon_state="Opened"
			layer=100
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(22,176,3)
						usr.safe=0
				else
					if(istype(A,/obj/)) return


		teletoyamastarter
			icon='Icons/enter to vand prin.dmi'
			icon_state="Opened"
			layer=100
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(147,29,26)
				else
					if(istype(A,/obj/)) return



/////////////////////////Boss Yamamoto room



		nonpkzoneon
			Entered(A)
				if(ismob(A))
					usr.safe=1

		nonpkzoneoff
			Entered(A)
				if(ismob(A))
					usr.safe=0




		nodpteletoBossYama
			icon='Icons/enter to vand prin.dmi'
			icon_state="Opened"
			layer=100
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						if(usr.level < 800 || usr.crownprincekills < 30 || usr.newkomabosskills < 10 || usr.loreleikills < 10 || usr.demonbosskills < 10 || usr.gatecreatorkills < 10)
							usr << "You need level 800, 10 kills of Samurai King, Lorelei, Gate Creator, and Brazo each, and 30 Crown Prince kills."
							return 0
						if(M.key in hascustoms)
							usr << "You can't enter this place."
							return 0
						usr.loc = locate(111,157,30)
				else
					if(istype(A,/obj/)) return


		nodptelefromBossYama
			icon='Icons/enter to vand prin.dmi'
			icon_state="Opened"
			layer=100
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(36,177,9)
						usr.inbossyama=0
						M.inbossyama=0
				else
					if(istype(A,/obj/)) return



		teletoBossYama
			icon='Icons/enter to vand prin.dmi'
			icon_state="Opened"
			layer=100
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						if(usr.level < 800 || usr.crownprincekills < 30 || usr.newkomabosskills < 10 || usr.loreleikills < 10 || usr.demonbosskills < 10 || usr.gatecreatorkills < 10)
							usr << "You need level 800, 10 kills of Samurai King, Lorelei, Gate Creator, and Brazo each, and 30 Crown Prince kills."
							return 0
						usr.loc = locate(111,4,30)
						usr.inbossyama=1
						M.inbossyama=1
				else
					if(istype(A,/obj/)) return




		telefromBossYama
			icon='Icons/enter to vand prin.dmi'
			icon_state="Opened"
			layer=100
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(32,175,9)
						usr.inbossyama=0
						M.inbossyama=0
				else
					if(istype(A,/obj/)) return





//////////////////////////////no dp/custom boss room


		nodp_teletoVandPrince
			icon='Icons/enter to vand prin.dmi'
			icon_state="Opened"
			layer=100
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
					//	if(M.level <400)
					//		usr<< output("<font color = purple><B>You must be atleast level 400.","output")
					//		return 0
						if(M.key in hascustoms)
							usr << "You can't enter this place."
							return 0
						usr.loc = locate(151,166,26)
				else
					if(istype(A,/obj/)) return