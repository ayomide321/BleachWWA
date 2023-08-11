//D Ranks
mob/var/req=0
mob
	Mission_NPC
		npc=1
		wander=0
		killable=0
		delay=5
		Arrancar
			name = "{NPC}Sousuke Aizen"
			icon = 'Aizen.dmi'
			race="Arrancar"
			req=1
			pixel_x=-16
			New()
				if(!src.name == "{NPC}Sousuke Aizen")
					src.Load_Overlays()
					src.Affirm_Icon()
		Shinigami
			icon = 'Icons/yamamoto.dmi'
			name = "{NPC}Yamamoto"
			race="Shinigami"
			req=10
			New()
				if(!src.name == "{NPC}Yamamoto")
					src.Load_Overlays()
					src.Affirm_Icon()
		Vaizard
			name = "{NPC}Shinji"
			race="Vaizard"
			req=2
			New()
				src.icon_name="BaseTan"
				src.hair_type=/obj/hair/h1/yellow
				src.hair_red=230
				src.hair_green=230
				src.hair_blue=10
				src.shoes=/obj/Shoes/black
				src.shirt=/obj/Shirt/orange
				..()
		Quincy
			name = "{NPC}Quincy Veterian"
			race="Quincy"
			req=3
			New()
				src.icon_name=pick("Base","BaseTan","BaseBlack")
				src.HairGen()
				src.oldspot = src.loc
				src.overshirt=/obj/overshirt/quincy/s1
				spawn()src.Affirm_Icon()
				spawn()src.Load_Overlays()
				..()
		Fullbringer
			name = "Ginjo{Normal}"
			req=4
			race="Fullbringer"
			New()
				..()
				spawn(2)
					src.icon='Icons/NPCs.dmi'
					src.icon_state="Ginjo"
		Hollow
			ressurectiontype="Skeleton"
			ressurection=1
			New()
				..()
				spawn(2)
				src.race="Hollow"
		verb/Talk()
			set src in oview(2)
			if(src.req==10)
				if(usr.talkin==1)
					usr.talkin=2
					//usr.Story_Talk("After giving Yammamato the message, he tells you about the truth of the Espada arrancars planning to raid and destroy all of humanity, and other races, and of ichigo Kurosaki's blinded rage.")
					src.Talks("Urahara's right . . . how could we be so blind")
					sleep(30)
					src.Talks("This was all an illusion set up by none other than Aizen")
					sleep(30)
					src.Talks("He controls the Espada, the strongest of all Arrancars, and plans to destroy all of humanity")
					sleep(60)
					src.Talks("Don't allow Ichigo into Hueco Mundo because he will go wild and his Inner Hollow will come out")
					sleep(20)
					usr.Story_Talk("Kill the Vasto Ichigo so he can turn back to normal")
					usr.curpart="Part 8: The Victory!!!"
					usr.curmis="Kill Vasto Ichigo"
					usr.storycom=76
					return
				if(usr.dlc==1)
					usr.dlc=2
					var/mob/ken=new/mob/Storyline/Kenpachi(locate(src.x+1,src.y,src.z))
					sleep(5)
					ken.Talks("It was no use")
					ken.dir=WEST
					sleep(15)
					src.Talks("I see . . .")
					sleep(15)
					src.Talks("[usr.name], we need your help")
					sleep(20)
					src.Talks("There has been a dimensional rift in our universe")
					sleep(30)
					ken.dir=SOUTH
					ken.Talks("That guy was a real piece of work. He drew a circle on the floor and anytime I would give a sure death strike I felt it all")
					sleep(90)
					usr.Talks("That may be Hidan")
					sleep(20)
					ken.Talks("!")
					src.Talks("!")
					sleep(10)
					src.Talks("Yes, him and Uchiha -")
					sleep(20)
					ken.Talks("Enough talk, c'mon [usr.name] let's kill em")
					ken.dir=NORTH
					sleep(30)
					del ken
			if(src.req==4)
				if(usr.race == "Fullbringer")
					switch(input("Are you ready to choose the item you best sync with!", text) in list ("Yes","No"))
						if("Yes")
							if(!usr.gotshik)
								usr.client.eye=locate(175,158,1)
								usr.client.perspective=EYE_PERSPECTIVE
								return
					if(!usr.beatkenpachi&&usr.level>=150)
						switch(input("You will have to defeat me in order to get fullbring. Do you wish to fight me now?", text) in list ("Yes","No"))
							if("Yes")
								if(usr.z==16)return
								usr.curpart="Part 3: The challenge and purpose of life"
								usr.curmis="Kill Ginjo"
								usr.storycom=25
								usr.safe=0
								usr.wound=0
								usr.loc=locate(rand(110,160),rand(5,60),16)
								usr.dir=EAST
								var/mob/k=new/mob/realGinjo
								k.dir=WEST
								k.loc=locate(usr.x+5,usr.y,16)
								k.frozen=1
								usr.frozen=1
								k.Load_Overlays()
								sleep(10)
								k.frozen=0
								usr.frozen=0
								usr.safe=0
								return
					if(usr.gotfinalfb==1)
						switch(input("You can learn your Finalbring which allows for an immense power change. Once you get it you can't change the item your synced with! Do you want it?", text) in list ("Yes","No"))
							if("Yes")
								usr.gotfinalfb=2
								usr.contents+=new/obj/skillcard/Finalbring
								if(usr.ftype=="Ginjo")
									usr<<"You can now absorb projectiles and gain reiatsu"
									usr.contents+=new/obj/skillcard/Return_Blast
								if(usr.ftype=="Ichigo")
									usr.contents+=new/obj/skillcard/Ring_Parade
									usr<<"You can now fire Getsuga Rings at a rapid pace"
								if(usr.ftype=="Jackie")
									usr.contents+=new/obj/skillcard/Critical_Burst
									usr.contents+=new/obj/skillcard/Critical_Stun
									usr<<"You can now utilize your boots for different effects"
								if(usr.ftype=="Tsukishima")
									usr.contents+=new/obj/skillcard/Harmful_Recoil
									usr<<"You can now force enemies to hit themselves"
								if(usr.ftype=="Yukio")
									usr.contents+=new/obj/skillcard/Power_Monsters
									usr<<"You can now power your monsters"
			if(src.req==3)
				if(usr.race == "Quincy")
					if(usr.level>=600)
						if(!usr.chosebex)
							switch(input("I have found out you are part of a secret quincy race that has the ability to extract someone's bankai and use it as your own. Do you want to join?(Note:Your Final Form boost will be lowered by a very small amount(the amount its lowered is hardly noticable)*HIGHLY RECOMMENDED TO GO VAND*, and you cannot use seele as melee weapon anymore)", text) in list ("Yes","Undecided"))
								if("Yes")
									usr.chosebex=2
									usr.seelsword=0
									usr.Load_Overlays()
									usr.contents+=new/obj/skillcard/Bankai_Extraction
									usr.contents+=new/obj/skillcard/bankai
									usr.contents+=new/obj/skillcard/Bankai_Skill
									for(var/obj/hud/d in usr.client.screen)
										d.names=null
									usr<<"<b>You're skills have been reseted, place them back on the skillbar"
									return
						if(usr.chosebex==2&&!usr.chosespirit)
							switch(input("As a Vandereich you can choose a spirit weapon, once you choose you cannot change", text) in list ("Undecided","Bow","Guns","Sword"))
								if("Bow")
									usr.spiritweapon=0
									usr.chosespirit=1
								if("Guns")
									usr.spiritweapon=1
									usr.chosespirit=1
								if("Sword")
									usr.spiritweapon=2
									usr.chosespirit=1
					if(usr.canbuyseele)
						switch(input("Did you want to buy 5 Seele Schneiders for $500?", text) in list ("Yes","No"))
							if("Yes")
								if(usr.money>=500)
									usr.money-=500
									usr.hasaseele=1
									usr.contents += new/obj/items/Seele_Schneider
									usr.contents += new/obj/items/Seele_Schneider
									usr.contents += new/obj/items/Seele_Schneider
									usr.contents += new/obj/items/Seele_Schneider
									usr.contents += new/obj/items/Seele_Schneider
									return
					if(usr.level>=100)
						switch(input("Do you want a different variance of arrows?", text) in list ("Yes","No"))
							if("Yes")
								switch(input("Which do you want?", text) in list ("ZigZag Arrows","Blinding Arrows","Slowdown Arrows","Speedy Arrows","Normal Arrows"))
									if("ZigZag Arrows")
										switch(input("This arrow moves in a zigzag shape when shot. Do you want this?", text) in list ("Yes","No"))
											if("Yes")
												usr.zigzag=1
												usr.slow=0
												usr.blinding=0
												usr.speedy=0
												return
									if("Blinding Arrows")
										switch(input("This arrow blinds anyone it hits for 2 seconds, but cost 2x rei. Do you want this?", text) in list ("Yes","No"))
											if("Yes")
												usr.zigzag=0
												usr.slow=0
												usr.blinding=1
												usr.speedy=0
												return
									if("Slowdown Arrows")
										switch(input("This arrow slows down anyone it hits for 2 seconds. Do you want this?", text) in list ("Yes","No"))
											if("Yes")
												usr.zigzag=0
												usr.slow=1
												usr.blinding=0
												usr.speedy=0
												return
									if("Speedy Arrows")
										switch(input("This arrow moves twice as fast. Do you want this?", text) in list ("Yes","No"))
											if("Yes")
												usr.zigzag=0
												usr.slow=0
												usr.blinding=0
												usr.speedy=1
												return
									if("Normal Arrows")
										switch(input("This arrow has no special effect and does regular damage. Do you want this?", text) in list ("Yes","No"))
											if("Yes")
												usr.zigzag=0
												usr.slow=0
												usr.blinding=0
												usr.speedy=0
												return
					if(usr.level < 100)
						usr << "<b>You are too weak to learn my moves, please train some more and I'll teach you a thing or two."
						return
					if(usr.level < 220)
						usr << "<b>You are too weak to learn Final Form, please train some more."
						return
					if(!usr.gotfinal)
						usr.Story_Talk("Your Quincy veteran teacher tells you about a Captain of the Soul Society who hunted your family generation to extinction as a mass experiment, even though few Quincys now exist he still has yet to be satistfied and will raid this Quincy Facility in a few minutes, it is your job to stop this Inhumane Foe and avenge your fallen Quincy.")
						usr.curpart="Part 3: The challenge and purpose of life"
						usr.curmis="Kill Mayuri Kurotsuchi"
						usr.storycom=25
						switch(input("Young warrior. Do you want to learn Final Form and be able to destroy your opponents?", text) in list ("Yes","No"))
							if("Yes")
								if(usr.z==6)return
								usr.finaltraining=1
								usr << "<b>You have been poisoned and have to defeat the Mayuri Kurotsuchi to learn Final Form."
								usr.loc=locate(rand(1,145),rand(10,140),6)
								usr.dir=NORTH
								var/mob/k=new/mob/MayuriKurotsuchi
								k.loc=locate(usr.x,usr.y-5,6)
								k.frozen=1
								usr.frozen=1
								usr.safe=0
								k.Load_Overlays()
								sleep(82)
								k.frozen=0
								usr.frozen=0
								return
					if(usr.gotfinal&&usr.canbuyseele==0&&usr.level>300)
						switch(input("Young warrior. Do you think you can handle the Seele Schneider?", text) in list ("Yes","No"))
							if("Yes")
								usr.canbuyseele=1
								usr.hasaseele=1
								usr.contents += new/obj/skillcard/Sprenger
								usr.contents += new/obj/items/Seele_Schneider
								usr.contents += new/obj/items/Seele_Schneider
								usr.contents += new/obj/items/Seele_Schneider
								usr.contents += new/obj/items/Seele_Schneider
								usr.contents += new/obj/items/Seele_Schneider
								usr.curpart="Part 5: The Cursed Race"
								usr.curmis="Train to level 400"
								usr.storycom=40
								return
			if(src.req==2)
				if(usr.talktoshinji==1)
					usr.talktoshinji=2
					if(usr.race=="Shinigami")
						usr.Story_Talk("You've spoken with Shinji and he tells you that your able to obtain and control an Inner-Hollow due to your Relationship with a Shinigami's race, upon reaching level 500 you can choose to return to Shinji as an Ally, or possibly as an enemy it's your choice to choose.")
					if(usr.race=="Quincy")
						usr.Story_Talk("After finding Shinji he tells you, you need not to worry about his Vaizards, but if you wish to strike down those Imbeciles he'll grant you this task and reward you healthily.")
					if(usr.race=="Sado")
						usr.Story_Talk("You've talked now with Shinji and have been given a Extermination quest... You think to yourself if this guy is so incredible powerful why am i doing his Chores.")
					usr.Story_Talk("After speaking with Shinji you learn of the Acursed race of Vaizards, Shinji tells you that he was tricked by a Friendly Arrancar!!! Suddenly something snaps on inside of your head * the Friendly Arrancar from before, maybe his trick didn't work because i was too weak at first.")
					usr.curpart="Part 5: The Cursed Race"
					usr.curmis="Train to level 450"
					usr.storycom=50
				if(usr.gotvasto)
					switch(input("Would you like to learn how to draw out the full power of your hollow!NOTE:If you win your mask time will reset.", text) in list ("Yes","No"))
						if("Yes")
							//if(usr.bankai == 1)
							if(usr.z==8)return
							usr<<"You have to kill a stronger inner hollow, before it kills you."
							var/mob/k=new/mob/InnerSelf
							var/nner=rand(0,5)
							if(nner==5)
								usr.loc=locate(15,125,8)
								usr.dir=EAST
								k.loc=locate(19,125,8)
								k.dir=WEST
							if(nner==4)
								usr.loc=locate(15,175,8)
								usr.dir=EAST
								k.loc=locate(19,175,8)
								k.dir=WEST
							if(nner==3)
								usr.loc=locate(65,125,8)
								usr.dir=EAST
								k.loc=locate(69,125,8)
								k.dir=WEST
							if(nner==2)
								usr.loc=locate(64,174,8)
								usr.dir=EAST
								k.loc=locate(69,174,8)
								k.dir=WEST
							if(nner==1)
								usr.loc=locate(119,176,8)
								usr.dir=EAST
								k.loc=locate(123,176,8)
								k.dir=WEST
							if(nner==0)
								usr.loc=locate(115,122,8)
								usr.dir=EAST
								k.loc=locate(119,122,8)
								k.dir=WEST
							k.stype=usr.stype
							k.vasto=1
							k.maskuses=200
							k.maskon=1
							k.hair_type=usr.hair_type
							k.hair_red=170
							k.hair_blue=170
							k.hair_green=170
							k.weapon=/obj/weapon/sword
							k.wound=0
							k.mhealth=usr.mhealth*2
							k.health=usr.mhealth*2
							k.mattack=usr.mattack*2
							k.mreiatsu=usr.mreiatsu*2
							k.mrei=usr.mrei*2
							k.rei=usr.rei*2
							k.mdefence=usr.mdefence*2
							k.swordon=1
							k.level=usr.level*2
							k.swordcall=usr.swordcall
							k.swordname=usr.swordname
							k.attack=k.mattack
							k.defence=k.mdefence
							k.reiatsu=k.mreiatsu
							k.race="Inner"
							k.Load_Overlays()
							usr.frozen=1
							k.Shikai()
							k.frozen=1
							spawn(100)
								k.frozen=0
								usr.frozen=0
								k.Aggro(usr)
							return
				if(usr.race=="Vaizard")
					if(!usr.choseboost)
						switch(input("What would you like for your mask to boost?", text) in list ("Attack","Defence","Reiatsu","Balanced"))
							if("Attack")
								usr.choseboost="Attack"
								return
							if("Defence")
								usr.choseboost="Defence"
								return
							if("Reiatsu")
								usr.choseboost="Reiatsu"
								return
							if("Balanced")
								usr.choseboost="Balanced"
								return
					switch(input("Would you like to change your mask?", text) in list ("Yes","No"))
						if("Yes")	//zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
							usr.ViewVaiMasks()
				/*			if(!usr.shopping)
								usr.client.screen += new/obj/maskcolor/maskcolor_rgb
								usr.client.screen += new/obj/maskcolor/stripecolor_rgb
								usr.client.screen += new/obj/maskcolor/eyecolor_rgb
								usr.shopping=1
								usr.frozen=1
								return
							if(usr.shopping)
								for(var/obj/maskcolor/b in usr.client.screen)
									del b
								usr.shopping=0
								usr.frozen=0
								return*/
							return
				if(usr.race =="Shinigami")
					switch(input("Would you like to learn how to control your inner hollow!NOTE:If this works you will become a Vaizard and be unable to use kidou, shunko, and mugetsu, and be apart of a Court Gaurd Squad.", text) in list ("Yes","No"))
						if("Yes")
							if(usr.level<700)
								usr<<"Your too weak, you'd die in no time."
								return
							if(usr.triedvai)
								usr<<"You have failed to unleash your inner hollow"
								return
							//if(usr.bankai == 1)
							if(usr.z==15)return
							usr<<"You have to kill your inner hollow, before it kills you."
							var/mob/k=new/mob/InnerSelf
							var/nner=rand(0,5)
							if(nner==5)
								usr.loc=locate(15,125,8)
								usr.dir=EAST
								k.loc=locate(19,125,8)
								k.dir=WEST
							if(nner==4)
								usr.loc=locate(15,175,8)
								usr.dir=EAST
								k.loc=locate(19,175,8)
								k.dir=WEST
							if(nner==3)
								usr.loc=locate(65,125,8)
								usr.dir=EAST
								k.loc=locate(69,125,8)
								k.dir=WEST
							if(nner==2)
								usr.loc=locate(64,174,8)
								usr.dir=EAST
								k.loc=locate(69,174,8)
								k.dir=WEST
							if(nner==1)
								usr.loc=locate(119,176,8)
								usr.dir=EAST
								k.loc=locate(123,176,8)
								k.dir=WEST
							if(nner==0)
								usr.loc=locate(115,122,8)
								usr.dir=EAST
								k.loc=locate(119,122,8)
								k.dir=WEST
							k.stype=usr.stype
							k.hair_type=usr.hair_type
							k.hair_red=170
							k.hair_blue=170
							k.hair_green=170
							k.weapon=/obj/weapon/sword
							k.wound=0
							k.mhealth=usr.mhealth+500
							k.health=usr.mhealth+500
							k.mattack=usr.mattack+200
							k.mreiatsu=usr.mreiatsu+200
							k.mrei=usr.mrei+100
							k.rei=usr.rei+100
							k.mdefence=usr.mdefence+200
							k.swordon=1
							k.level=usr.level+5
							k.swordcall=usr.swordcall
							k.swordname=usr.swordname
							k.attack=k.mattack
							k.defence=k.mdefence
							k.reiatsu=k.mreiatsu
							k.race="Inner"
							k.Load_Overlays()
							usr.frozen=1
							k.frozen=1
							spawn(100)
								k.frozen=0
								usr.frozen=0
								k.Aggro(usr)
							return
			if(src.req==1)
				if(usr.race == "Hollow")
					if(!usr.shinimish1)
						usr.shinimish1=1
						src.Talks("Test 1: Go to Soul Society and defeat 10 Shinigamis of any rank")
						usr.curpart="Part 3: The challenge and purpose of life"
						usr.curmis="Kill [usr.shinimishkills]/10 Shinigamis"
						usr.storycom=22
						return
					if(usr.shinimish1==1)
						if(usr.shinimishkills>=10)
							usr.shinimish1=2
							src.Talks("Test 2: You must learn Cero")
							usr.shinimish2=1
							usr.curpart="Part 3: The challenge and purpose of life"
							usr.curmis="You must learn Cero"
							usr.storycom=24
						else
							src.Talks("You have killed [usr.shinimishkills]/10 Shinigamis")
						return
					if(usr.shinimish2==1)
						if(usr.HasSkill("Cero"))
							usr.shinimish2=2
							src.Talks("Test 3: You must go to Barragan and do 2 D rank missions")
							usr.curpart="Part 3: The challenge and purpose of life"
							usr.curmis="You must do [usr.missionspassed]/2 missions"
							usr.storycom=26
						else
							src.Talks("Test 2: You must learn Cero")
						return
					if(usr.shinimish2==2)
						if(usr.missionspassed>=2)
							src.Talks("Final Test: You must defeat Ichigo")
							usr.shinimish2=3
							usr.curpart="Part 3: The challenge and purpose of life"
							usr.curmis="Kill Ichigo"
							usr.storycom=28
							usr.safe=0
						else
							src.Talks("Test 3: You must go to Barragan and do 2 D rank missions")
					if(usr.beatichigo==0&&usr.shinimish2==3)
						switch(input("Hollow I have a mission for you. Will you go to Karakura Town and kill Ichigo Kurosaki?", text) in list ("Yes","No"))
							if("Yes")
								if(usr.z==16)return
								usr.loc=locate(rand(6,49),rand(150,185),16)
								usr.dir=WEST
								var/mob/k=new/mob/IchigoEarly
								k.dir=WEST
								k.loc=locate(usr.x-5,usr.y,16)
								k.frozen=1
								usr.frozen=1
								k.Load_Overlays()
								sleep(75)
								k.frozen=0
								usr.frozen=0
								k.Aggro(usr)
								usr.safe=0
								return
					if(usr.beatichigo>=1&&usr.shinimish2==3)
						if(usr.level >= 220)
							switch(input("Hollow...Do you want me to break the chains restraining you from your destiny? Do you wish to regain your consiousness? Become one of us...the Espada!", text) in list ("Yes","No"))
								if("Yes")
									if(usr.hollowtype!="arrancar"&&usr.IsPureH==0)
										usr.overlays = 0
										usr.hollowtype = "arrancar"
										usr.icon = 'Icons/BaseTannew.dmi'
										usr.rank = "Arrancar"
										usr.rundelay = 0
										usr.race = "Arrancar"
										usr.rx=151
										usr.ry=82
										usr.rz=11
										usr.arrancarmask=rand(1,14)
										usr << "<b>Your health got boosted by 100!"
										usr.mhealth += 100
										usr << "<b>Your rei got boosted by 30!"
										usr.mrei += 30
										usr << "<b>Your attack got boosted by 30!"
										usr.mattack += 30
										usr.rawbuff+=30
										usr << "<b>Your defence got boosted by 30!"
										usr.mdefence += 30
										usr << "<b>Your reiatsu power got boosted by 30!"
										usr.reiatsu += 30
										usr.Load_Overlays()
										usr.Affirm_Icon()
										var/obj/B = new/obj/items/equipable/Weapon/Sword
										B.loc = usr
										usr.contents+=new/obj/items/equipable/Shoes/Black
										var/obj/C = new/obj/items/equipable/Cloak/Espada1
										C.loc=usr
										var/obj/S = new/obj/items/equipable/Cloak/Espada2
										S.loc=usr
										usr.skill()
										if(usr.level<250)
											usr.Story_Talk("You have completed all your tasks and become 1 with the Arrancars race. Now you feel the true power rushing through your vanes you must now reach a higher power ( level 250) and unlock your Resurrection form, and with this power you shall defeat all those who oppose the arrancar race.")
										if(!usr.isfrac)Espada_Ranking(usr)
										usr.Level_Up()
									else
										if(usr.IsPureH==1)
											src.Talks(" It seems you've chosen a different path, the Hougyoku doesn't seem to have any Effect on you.")
				if(usr.race == "Arrancar")
					if(!usr.choseyet)
						switch(input("Which technique would you like to master in!", text) in list ("Instant Regeneration","Releasing Power"))
							if("Instant Regeneration")
								usr.contents+=new/obj/skillcard/Instant_Regen
								for(var/obj/skillcard/Arrancar_Release/d in usr.contents)
									del d
								usr.choseyet=1
							if("Releasing Power")
								usr.hasarrancarrelease=1
								usr.contents+=new/obj/skillcard/Arrancar_Release
								for(var/obj/skillcard/Instant_Regen/d in usr.contents)
									del d
								usr.choseyet=1
					if(!usr.gotress)
						switch(input("Are you ready to customize your ressurection!", text) in list ("Yes","No"))
							if("Yes")
								usr.client.eye=locate(192,141,1)
								usr.client.perspective=EYE_PERSPECTIVE
								usr<<"<b><font color = lime>NOTE: You learn Ressurection at level 350!"
								return
				if(usr.level>=600)
					switch(input("Do you wish to challenge me?", text) in list ("Yes","No"))
						if("Yes")
							if(usr.level<600)
								usr<<"You need to be level 600"
								return
							if(usr.killedgrimmjow&&usr.killedhal&&usr.killedszayel&&usr.killedstark&&usr.killedbarragan&&usr.killednnoitra&&usr.killedzommari&&usr.killedulquiorra)
								if(usr.z==13)return
								usr.wound=0
								usr.loc=locate(23,74,13)
								usr.dir=EAST
								var/mob/k=new/mob/Aizen
								k.dir=WEST
								k.loc=locate(27,74,13)
								k.frozen=1
								usr.frozen=1
								usr.safe=0
								k.Load_Overlays()
								sleep(55)
								k.frozen=0
								usr.frozen=0
								usr.safe=0
							else
								usr<<"You need to kill all the espadas first"
								return
			if(!usr.in_team)
				usr<<"You can get extra exp and money when in a team"
			if(usr.race!=src.race&&usr.race!="Sado")return
			if(usr.missioncool)
				usr<<"<font color=blue><b>You must wait [round(usr.missioncool/60,1)] minutes before doing another mission!"
				return
			switch(input("What mission would you like to do?(NOTE: I recommend being in a team)", text) in list ("S","A","B","C","D","Cancel"))
				if("S")
					if(usr.missioncool)
						usr<<"<font color=blue><b>You must wait [round(usr.missioncool/60,1)] minutes before doing another mission!"
						return
					if(usr.level>=600)
						var/d=pick(1,2,3)
						var/list/Menu = list()
						for(var/mob/player/M in world)
							if(M.race!=usr.race&&M.client)
								if(M!=usr)
									if(M.level>=500)
										Menu.Add(M)
						var/mob/x=pick(Menu)
						if(!x&&d==1)
							usr<<"There are no missions at the moment"
							return
						usr.ClearMish()
						usr.missionclass="S"
						if(d==1)
							usr.mission=8
							usr.missiontarget=x
							usr.mscroll="You must kill [x]"
						if(d==2)
							usr.mission=9
							usr.mlocation="All of WWA"
							usr.mscroll="You must kill at least 5 players within 10 minutes"
							usr.killedsofar=0
							usr.timed=6000
						if(d==3)
							usr.mission=10
							usr.mscroll="Their is supposed to be a hidden hougyoku inside of a player.Kill them to destroy the hougyoku"
						usr<<"I have given you a mission scroll"
						usr.contents+=new/obj/items/readable/Mission_Scroll
					else
						usr<<"You must be at least level 600"
					return
				if("A")
					if(usr.missioncool)
						usr<<"<font color=blue><b>You must wait [round(usr.missioncool/60,1)] minutes before doing another mission!"
						return
					if(usr.level>=500)
						var/d=pick(2,3)
						var/list/Menu = list()
						for(var/mob/player/M in world)
							if(M.race!=usr.race&&M.client&&M.level>150)
								if(M!=usr)
									Menu.Add(M)
						var/mob/x=pick(Menu)
						if(!x)
							usr<<"There are no missions at the moment"
							return
						usr.ClearMish()
						usr.missionclass="A"
						if(d==2)
							usr.mission=6
							usr.missiontarget=x
							usr.mscroll="You must kill [x]"
						if(d==3)
							usr.mission=7
							usr.missiontarget=x
							usr.mscroll="You must spy on [x] and follow him around without getting caught"
						usr<<"I have given you a mission scroll"
						usr.contents+=new/obj/items/readable/Mission_Scroll
					else
						usr<<"You must be at least level 500"
					return
				if("B")
					if(usr.missioncool)
						usr<<"<font color=blue><b>You must wait [round(usr.missioncool/60,1)] minutes before doing another mission!"
						return
					if(usr.level>=400)
						var/d=pick(2,3,4,5)
						var/list/Menu = list()
						for(var/mob/M in world)
							if(!M.legit&&M.killable&&!M.npc&&M.race!=usr.race&&!M.myclone&&!M.owner&&M.level>=500&&!M.reigai&&!M.gamehollow&&!M.iszan)
								if(M!=usr)
									Menu.Add(M)
						var/mob/x=pick(Menu)
						if(!x)
							usr<<"There are no missions at the moment"
							return
						usr.ClearMish()
						usr.missionclass="B"
						if(d==2)
							usr.mission=11
							usr.missiontarget=x
							usr.mscroll="We need you to give [x] $1,000"
						if(d==3)
							usr.mission=12
							usr.missiontarget=x
							usr.mscroll="We need you to retrieve the forbidden item and to hold onto it without it being dropped"
						if(d==4)
							usr.mission=4
							usr.missiontarget=x
							var/list/Menus=list()
							Menus.Add("Soul Society","Urahara's Basement","Hueco Mundo","Las Noches","Rukongai","Lost Vaizard Forest")
							for(var/y in Menus)
								if(x.race=="Shinigami")
									Menus.Remove("Soul Society")
								if(x.vasto||x.fgetsugas)
									Menus.Remove("Lost Vaizard Forest")
								if(x.race=="Arrancar")
									Menus.Remove("Las Noches")
								if(x.race=="Hollow")
									Menus.Remove("Hueco Mundo")
								if(x.race=="Sub-Shinigami")
									Menus.Remove("Rukongai")
								if(x.race=="Quincy"||x.race=="Sado"||x.race=="Fullbringer"||x.race=="Vaizard")
									Menus.Remove("Urahara's Basement")
							usr.mlocation=pick(Menus)
							usr.mscroll="You must escort [x] to [usr.mlocation], and try to cooperate with them"
						if(d==5)
							usr.mission=5
							usr.missiontarget=x
							usr.mscroll="You must kill [x] since he's acting up"
						usr<<"I have given you a mission scroll"
						usr.contents+=new/obj/items/readable/Mission_Scroll
					else
						usr<<"You must be at least level 400"
					return
				if("C")
					if(usr.missioncool)
						usr<<"<font color=blue><b>You must wait [round(usr.missioncool/60,1)] minutes before doing another mission!"
						return
					if(usr.level>=200)
						var/d=pick(2,3)
						var/list/Menu = list()
						for(var/mob/M in world)
							if(!M.legit&&M.killable&&!M.npc&&M.race!=usr.race&&!M.myclone&&!M.owner&&!M.reigai&&!M.gamehollow&&!M.iszan&&M.level<500)
								if(M!=usr)
									Menu.Add(M)
						var/mob/x=pick(Menu)
						usr.ClearMish()
						usr.missionclass="C"
						if(d==2)
							usr.mission=4
							usr.missiontarget=x
							var/list/Menus=list()
							Menus.Add("Soul Society","Urahara's Basement","Hueco Mundo","Las Noches","Rukongai","Lost Vaizard Forest")
							for(var/y in Menus)
								if(x.race=="Shinigami")
									Menus.Remove("Soul Society")
								if(x.vasto||x.fgetsugas)
									Menus.Remove("Lost Vaizard Forest")
								if(x.race=="Arrancar")
									Menus.Remove("Las Noches")
								if(x.race=="Hollow")
									Menus.Remove("Hueco Mundo")
								if(x.race=="Sub-Shinigami")
									Menus.Remove("Rukongai")
								if(x.race=="Quincy"||x.race=="Sado"||x.race=="Fullbringer"||x.race=="Vaizard")
									Menus.Remove("Urahara's Basement")
							usr.mlocation=pick(Menus)
							usr.mscroll="You must escort [x] to [usr.mlocation], and try to cooperate with them"
						if(d==3)
							usr.mission=5
							usr.missiontarget=x
							usr.mscroll="You must kill [x] since he's acting up"
						usr<<"I have given you a mission scroll"
						usr.contents+=new/obj/items/readable/Mission_Scroll
					else
						usr<<"You must be at least level 200"
					return
				if("D")
					if(usr.missioncool)
						usr<<"<font color=blue><b>You must wait [round(usr.missioncool/60,1)] minutes before doing another mission!"
						return
					if(usr.level>=100)
						var/d=pick(1,2,3)
						var/list/Menu = list()
						for(var/mob/M in world)
							if(M.killable&&!M.npc&&M.race==usr.race&&!M.myclone&&!M.owner&&!M.reigai&&!M.gamehollow&&!M.iszan)
								if(M!=usr)
									Menu.Add(M)
						var/mob/x=pick(Menu)
						usr.ClearMish()
						usr.missionclass="D"
						if(d==1)
							usr.mission=x
							usr.missiontarget=x
							usr.mscroll="You must find [x] and talk to him to tag him"
						if(d==2)
							usr.mission=2
							if(usr.race=="Hollow")
								usr.mlocation="Hueco Mundo"
							if(usr.race=="Shinigami")
								usr.mlocation="Soul Society"
							if(usr.race=="Quincy"||usr.race=="Sado"||usr.race=="Fullbringer"||usr.race=="Vaizard")
								usr.mlocation="Earth"
							if(usr.race=="Arrancar")
								usr.mlocation="Las Noches"
							usr.mscroll="You must scan [usr.mlocation] for threats, scan the perimeters"
						if(d==3)
							usr.dmission=x
							usr.missiontarget=x
							usr.mscroll="You must deliver a message to [x]"
						usr<<"I have given you a mission scroll"
						usr.contents+=new/obj/items/readable/Mission_Scroll
					else
						usr<<"You must be at least level 100"
					return
mob
	proc
		ClearMish()
			src.mlocation=""
			src.mission=""
			src.missiontarget=""
			src.dmission=""
			src.scan=0
			src.mscroll=""
			src.missionclass=""
			src.spy=0
			src.spy2=0
			if(!src.missioncool)
				src.missioncool=30
			for(var/obj/items/readable/Mission_Scroll/s in src.contents)
				src.contents-=s
			for(var/mob/m in world)
				if(m.follow==usr)
					m.follow=null
		CompleteMish(expgain,moneygain,dist)
			/*if(src.mission==4||src.mission==5)
				if(src.missionclass=="B")
					expgain=expgain*1.5
					expgain=moneygain*1.5*/
			if(src.missionclass=="D")
				expgain=rand(10000,15000)
				moneygain=rand(5000,10000)
			if(src.missionclass=="C")
				expgain=rand(40000,60000)
				moneygain=rand(20000,22500)
			if(src.missionclass=="B")
				expgain=rand(70000,95000)
				moneygain=rand(25000,30000)
			if(src.missionclass=="A")
				expgain=rand(150000,200000)
				moneygain=rand(40000,45000)
			if(src.missionclass=="S")
				expgain=rand(600000,2000000)
				moneygain=rand(50000,60000)
			expgain+=src.spyp*(expgain/10)
			moneygain+=src.spyp*(moneygain/10)
			if(src.squad==10)
				expgain+=expgain/2
				moneygain+=moneygain/2
				if(src.status=="<font color = #FF5600>Captain</font>")
					expgain+=expgain/3
					moneygain+=moneygain/3
			if(src.in_team)
				for(var/mob/player/Ma in dist)
					if(Ma.teamid==src.teamid&&Ma.in_team&&src.in_team)
						Ma.GainExp(expgain)
						Ma<<"<font color=blue><b>[src] has completed his mission and have gained [expgain] exp"
						Ma.GainMoney(moneygain)
						Ma<<"<font color=blue><b>[src] has completed his mission and have gained $[moneygain]"
						Ma.Level_Up()
			if(!src.in_team)
				src.GainExp(expgain)
				src<<"<font color=blue><b>You have completed the mission and have gained [expgain] exp"
				src.GainMoney(moneygain)
				src<<"<font color=blue><b>You have completed the mission and have gained $[moneygain]"
				src.Level_Up()
			src.missioncool=30
			src.missionspassed+=1
			src.missioncount+=1
			src.ClearMish()
		FailMish(dist)
			if(src.in_team)
				for(var/mob/player/Ma in dist)
					if(Ma.teamid==src.teamid&&Ma.in_team)
						Ma<<"<font color=blue><b>[src] has failed his mission!"
			if(!src.in_team)
				src<<"<font color=blue><b>You have failed the mission!"
			src.missionsfailed+=1
			src.missioncount+=1
			src.ClearMish()