mob
	var
		tmp
			madeaShinji=0
mob
	IchigoEarly
		name = "{NPC}Ichigo (Early)"
		enemy = 1
		rundelay = 2
		level=100
		earlyichigo=1
		killable=1
		hostile=1
		mreiatsu=400
		mrei = 2000
		spawntime = 500
		expgain = 16000
		mattack = 1450
		mhealth = 10300
		mdefence = 450
		healthwas = 20300
		legit=1
		New()
			src.icon_name="BaseTan"
			src.hair_type=8
			src.hair_red=255
			src.hair_green=106
			src.hair_blue=0
			src.rei=src.mrei
			src.health=src.mhealth
			src.attack=src.mattack
			src.defence=src.mdefence
			src.swordon=1
			src.stype="Ichigo"
			src.swordcall="Tensa"
			src.swordname="Zangetsu!"
			src.inshikai=1
			src.overshirt=/obj/overshirt/shinigami/s1
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
			spawn(2)
				var/sound/dd = sound('Sounds/Ichigo/WAVE_VO_ICHI_032_P1_000.wav',volume=50)
				view(src) << dd
				view(src) << "<b>Ichigo Kurosaki."
				spawn(15)
					view(src) << "<b>The one that's gonna beat your ass."
					var/sound/d = sound('Sounds/Ichigo/WAVE_VO_ICHI_032_P2_000.wav',volume=50)
					view(src) << d
					spawn(20)
						view(src) << "<b>How's it going."
						var/sound/Sa = sound('Sounds/Ichigo/WAVE_VO_ICHI_032_P3_000.wav',volume=50)
						view(src) << Sa
						spawn(30)
							view(src) << "<b>Don't do something you'll regret."
							var/sound/S = sound('Sounds/Ichigo/WAVE_VO_ICHI_031_000.wav',volume=50)
							view(src) << S
	Ichigo
		name = "{NPC}Ichigo"
		enemy = 1
		rundelay = 2
		level=350
		ichigo=1
		killable=1
		hostile=1
		wound=0
		maskuses=8
		mreiatsu=3550
		mrei = 5000
		spawntime = 500
		expgain = 10000
		mattack = 3500
		mhealth = 35000
		mdefence = 13000
		healthwas = 44000
		legit=1
		New()
			src.icon_name="BaseTan"
			src.hair_type=8
			src.hair_red=255
			src.hair_green=106
			src.hair_blue=0
			src.rei=src.mrei
			src.health=src.mhealth
			src.attack=src.mattack
			src.defence=src.mdefence
			src.swordon=1
			src.stype="Ichigo"
			src.swordcall="Tensa"
			src.swordname="Zangetsu!"
			src.inshikai=1
			src.overshirt=/obj/overshirt/shinigami/s1
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
			spawn(2)
				var/sound/dd = sound('Sounds/Ichigo/WAVE_VO_ICHI_040_000.wav',volume=50)
				view(src) << dd
				view(src) << "<b>Get ready..."
				spawn(15)
					view(src) << "<b>I'm gonna kill you!"
					var/sound/d = sound('Sounds/Ichigo/WAVE_VO_ICHI_040_22_000.wav',volume=50)
					view(src) << d
	IchigoFinal
		name = "{NPC}Ichigo(Final)"
		enemy = 1
		rundelay = 1
		level=4000
		ichigofinal=1
		mask=2
		killable=1
		hostile=1
		wound=0
		mreiatsu=40500
		mrei = 6000
		spawntime = 500
		expgain = 1000000
		mattack = 60500
		mhealth = 405000
		mdefence = 25500
		healthwas = 605000
		legit=1
		New()
			src.icon_name="BaseTan"
			src.hair_type=8
			src.hair_red=255
			src.hair_green=106
			src.hair_blue=0
			src.rei=src.mrei
			src.health=src.mhealth
			src.attack=src.mattack
			src.defence=src.mdefence
			src.reiatsu=src.mreiatsu
			src.swordon=1
			src.stype="Ichigo"
			src.swordcall="Tensa"
			src.swordname="Zangetsu!"
			src.inshikai=1
			src.overshirt=/obj/overshirt/shinigami/s1
			src.oldspot = src.loc
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
			spawn(2)
				var/sound/dd = sound('Sounds/Ichigo/WAVE_VO_ICHI_040_000.wav',volume=50)
				view(src) << dd
				view(src) << "<b>Get ready..."
				spawn(15)
					view(src) << "<b>I'm gonna kill you!"
					var/sound/d = sound('Sounds/Ichigo/WAVE_VO_ICHI_040_22_000.wav',volume=50)
					view(src) << d
	UraharaFinal
		name = "{NPC}Urahara(Final)"
		enemy = 1
		rundelay = 1
		level=1000
		uraharafinal=1
		killable=1
		hostile=1
		wound=0
		mreiatsu=50500
		mrei = 5000
		spawntime = 500
		expgain = 1000000
		mattack = 50500
		mhealth = 405000
		mdefence = 30500
		healthwas = 105000
		legit=1
		New()
			src.icon_name="Base"
			src.hair_type=/obj/hair/h2/yellow
			src.rei=src.mrei
			src.health=src.mhealth
			src.attack=src.mattack
			src.defence=src.mdefence
			src.reiatsu=src.mreiatsu
			src.swordon=1
			src.stype="Urahara"
			src.swordcall="Can you penetrate"
			src.swordname="DEFENSE!"
			src.inshikai=1
			src.jacket=/obj/Jacket/green
			src.shirt=/obj/Shirt/black
			src.shoes=/obj/Shoes/black
			src.pants=/obj/Pants/white
			src.oldspot = src.loc
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
	SadoFinal
		name = "{NPC}Sado(Final)"
		enemy = 1
		rundelay = 1
		level=1000
		sadofinal=1
		killable=1
		hostile=1
		wound=0
		mreiatsu=50500
		mrei = 50000
		spawntime = 500
		expgain = 1000000
		mattack = 60500
		mhealth = 455000
		mdefence = 35500
		healthwas = 105000
		legit=1
		New()
			src.icon_name="BaseTan"
			src.hair_type=14
			src.hair_red=0
			src.hair_green=0
			src.hair_blue=0
			src.rei=src.mrei
			src.health=src.mhealth
			src.attack=src.mattack
			src.defence=src.mdefence
			src.reiatsu=src.mreiatsu
			src.shirt=/obj/Shirt/white
			src.shoes=/obj/Shoes/black
			src.pants=/obj/Pants/black
			src.oldspot = src.loc
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
	IshidaFinal
		name = "{NPC}Ishida(Final)"
		enemy = 1
		rundelay = 1
		level=1000
		ishidafinal=1
		race="Quincy"
		killable=1
		hostile=1
		wound=0
		gotfinal2=1
		mreiatsu=55500
		mrei = 6000
		spawntime = 500
		expgain = 1000000
		mattack = 50500
		mhealth = 305000
		mdefence = 12500
		healthwas = 205000
		legit=1
		New()
			src.icon_name="BaseTan"
			src.hair_type=9
			src.hair_red=0
			src.hair_green=0
			src.hair_blue=0
			src.rei=src.mrei
			src.health=src.mhealth
			src.attack=src.mattack
			src.defence=src.mdefence
			src.reiatsu=src.mreiatsu
			src.shoes=/obj/Shirt/black
			src.pants=/obj/Pants/black
			src.overshirt=/obj/overshirt/quincy/s1
			src.bowon=1
			src.oldspot = src.loc
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
mob/KarakuHeroes
	Ishida
		name="{NPC}Ishida"
		icon_name="BaseTan"
		npc=1
		hair_type=9
		overshirt=/obj/overshirt/quincy/s1
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				switch(input("Do you think you stand a chance against a quincy master?", text) in list ("Yes","No"))
					if("Yes")
						if(usr.level<500)
							usr<<"You need to be level 500"
							return
						if(usr.z==14)return
						usr.wound=0
						usr.loc=locate(170,17,14)
						usr.dir=EAST
						var/mob/k=new/mob/IshidaFinal
						k.dir=WEST
						k.loc=locate(174,17,14)
						k.frozen=1
						usr.frozen=1
						k.Load_Overlays()
						k.Aggro(usr)
						sleep(15)
						k.frozen=0
						usr.frozen=0
						return
	Sado
		name="{NPC}Sado"
		icon_name="BaseTan"
		npc=1
		hair_type=14
		hair_red=0
		hair_green=0
		hair_blue=0
		shirt=/obj/Shirt/white
		shoes=/obj/Shoes/black
		pants=/obj/Pants/black
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				switch(input("Do you think you stand a chance against a sado master?", text) in list ("Yes","No"))
					if("Yes")
						if(usr.level<500)
							usr<<"You need to be level 500"
							return
						if(usr.z==14)return
						usr.wound=0
						usr.loc=locate(170,17,14)
						usr.dir=EAST
						var/mob/k=new/mob/SadoFinal
						k.dir=WEST
						k.loc=locate(174,17,14)
						k.frozen=1
						usr.frozen=1
						k.Load_Overlays()
						k.Aggro(usr)
						sleep(15)
						k.frozen=0
						usr.frozen=0
						return
	Urahara
		npc=1
		New()
			..()
			spawn(2)
			src.icon='Icons/urahara.dmi'
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				if(usr.storycom==70||usr.talkin==1&&usr.storycom<70)
					usr.Story_Talk("The Vaizards aren't the real problems. We've truly been distracted this whole time as if under an illusion. Notify Yammamoto immediately")
					usr.talkin=1
					usr.curpart="Part 8: The Victory!!!"
					usr.curmis="Talk to Yammamoto"
					usr.storycom=73
					return
				if(usr.talktoshinji==0&&usr.level==400)
					usr.talktoshinji=1
					if(usr.race!="Quincy")
						usr.curpart="Part 5: The Cursed Race"
						usr.curmis="Talk to Shinji near Quincy Tower"
						usr.storycom=46
					if(usr.race=="Shinigami")
						usr.Story_Talk("You have visited Urahara Kisuke and hes tolden you of a Cursed race of Shinigami... the vaizards. They have been Hollowfied devoured by the soul of a inner hollow but they've learned to control this power and utilize it to increase their limits incredible as well as their combat styles. Urahara Kisuke has given you a locator scroll, use this to find the this Shinji person he speaks of as the leader of the vaizards.")
					if(usr.race=="Hollow"||usr.race=="Arrancar")
						usr.Story_Talk("This Urahara Fellow tells you there are Shinigamis who can use the abilities of the Hollow, this saying makes you feel weak and disgusted. You see to it as your goal to find and destroy these pathetic excuses for hollows, a Vaizard race is not more superior than the true race of destruction and terror! The Hollows race.")
					if(usr.race=="Fullbringer")
						usr.Story_Talk("This Urahara Kisuke fellow tells you of a race that's even stronger than the shinigami, he also tells you this race is as Few as the Full-Bringers, you take it up to question yourself, 'Maybe these are the allies i need stronger than the shinigami and only a few yet so strong.' You Accept Uraharas information and you must find this Shinji... the leader of the Vaizards.")
					if(usr.race=="Quincy")
						if(!usr.madeaShinji)
							usr.madeaShinji=1
							usr.talktoshinji=0
							usr.Story_Talk("You challenge Urahara right here and now")
							usr.wound=0
							usr.rei=usr.mrei
							usr.health=usr.mhealth
							usr.dir=SOUTH
							var/mob/k=new/mob/UraharaFinal
							k.toochep=1
							k.dir=NORTH
							k.loc=locate(usr.x,usr.y-5,usr.z)
							k.Load_Overlays()
							k.Aggro(usr)
							return
					if(usr.race=="Sado")
						usr.Story_Talk("Urahara Teaches you about the final abilities of the sado and as-well as a 4th arm!!!, the desire to achieve such power excites you but he said you must do him a favor before your teachings can advance. Your given a map and told to find the leader of a cursed race of Shinigamis called the Vaizards, Half human/Half hollow, the idea sends a image of mass death and destruction to your head but this does not scare you now that you possess the penetrable defense.")
					return
				switch(input("Do you think you stand a chance against a rogue shinigami?", text) in list ("Yes","No"))
					if("Yes")
						if(usr.level<500)
							usr<<"You need to be level 500"
							return
						if(usr.z==14)return
						usr.wound=0
						usr.rei=usr.mrei
						usr.health=usr.mhealth
						usr.loc=locate(170,17,14)
						usr.dir=EAST
						var/mob/k=new/mob/UraharaFinal
						k.dir=WEST
						k.loc=locate(174,17,14)
						k.frozen=1
						usr.frozen=1
						k.Load_Overlays()
						k.Aggro(usr)
						sleep(15)
						k.frozen=0
						usr.frozen=0
						return
	Ichigo
		name="{NPC}Ichigo"
		icon_name="BaseTan"
		npc=1
		hair_type=8
		overshirt=/obj/overshirt/shinigami/s1
		icon_name="BaseTan"
		hair_type=8
		hair_red=255
		hair_green=106
		inbankai=1
		stype="Ichigo"
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				switch(input("Do you think you stand a chance against a substitute shinigami?", text) in list ("Yes","No"))
					if("Yes")
						if(usr.level<500)
							usr<<"You need to be level 500"
							return
						if(usr.z==14)return
						usr.wound=0
						usr.loc=locate(170,17,14)
						usr.dir=EAST
						var/mob/k=new/mob/IchigoFinal
						k.dir=WEST
						k.loc=locate(174,17,14)
						k.frozen=1
						usr.frozen=1
						k.Load_Overlays()
						k.Aggro(usr)
						sleep(15)
						k.frozen=0
						usr.frozen=0
						return