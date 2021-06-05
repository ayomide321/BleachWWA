mob
	proc
		Bow()
			if(src.safe)
				src << "<b>You are in safe zone!"
				return
			if(!src.bowon)
				src.seelsword=0
				src.bowon = 1
				src.reiatsu=src.mreiatsu*3
				if(src.spiritweapon==0)
					src.icon_state = "Bow Stance"
				else
					src.icon_state=""
				src << "<b>You energize your spirit weapon!"
				src.Load_Overlays()
			else
			//	if(src.reiatsu == 0)
				src.reiatsu=src.mreiatsu
			//	else
				//	src.reiatsu-=src.mreiatsu*3
				src.bowon = 0
				src.icon_state = ""
				src << "<b>You release your spirit weapon!"
				src.Load_Overlays()
mob
	proc
		Final()
			if(src.safe)
				src << "<b>You are in safe zone!"
				return
			if(!src.bowon)
				src<<"You need to equip your bow."
				return
			if(src.goingress)
				return
			if(!src.gotfinal2)
				if(!src.finalb)
					src.StartShikCool()
					src.finalb = 1
					src.arm=0
					src.leg=0
					src.core=0
					src.reiatsu+=round(src.mreiatsu*3)
					if(src.charging)
						src.charging=0
						src.reiatsu-=round(round(src.mreiatsu/50)*src.charge)
						src.attack-=round(round(src.mattack/50)*src.charge)
						src.defence-=round(round(src.mdefence/50)*src.charge)
						src.charge=0
					if(src.beerboost)
						src.attack+=round(src.mattack/2)
						src.defence+=round(src.mdefence/2)
						src.reiatsu+=round(src.mreiatsu/2)
					src.frozen=1
					src.protected=1
					src.overlays+=/obj/finalaura/a1
					src.overlays+=/obj/finalaura/a2
					src.overlays+=/obj/finalaura/a3
					src.overlays+=/obj/finalaura/a4
					sleep(13)
					src.frozen=0
					src.protected=0
					src.Load_Overlays()
					src << "<b>You power up fully!"
					if(src.beer1)
						src.rundelay+=3
					if(src.guildpassive>=1)
						src.rundelay=src.rundelay/2
				else
					src.StartShikCool()
					src.finalb = 0
					src.arm=0
					src.leg=0
					src.core=0
					src.rundelay = 2
					src.trans=0
					src.reiatsu+=round(src.mreiatsu*3.5)
					if(src.charging)
						src.charging=0
						src.reiatsu-=round(round(src.mreiatsu/50)*src.charge)
						src.attack-=round(round(src.mattack/50)*src.charge)
						src.defence-=round(round(src.mdefence/50)*src.charge)
						src.charge=0
					if(src.beerboost)
						src.attack+=round(src.mattack/2)
						src.defence+=round(src.mdefence/2)
						src.reiatsu+=round(src.mreiatsu/2)
					if(src.guildpassive>=1)
						src.rundelay=src.rundelay/2
					src.Load_Overlays()
					src << "<b>You release your power!"
			else
				if(!src.finalb)
					src.StartShikCool()
					src.finalb = 1
					src.arm=0
					src.leg=0
					src.core=0
					if(src.key=="CommanderJohnShepard")
						src.reiatsu+=src.mreiatsu*3.95
					else
						src.reiatsu+=src.mreiatsu*3
					if(src.chosebex==2)
						src.reiatsu+=src.mreiatsu*3
					if(src.charging)
						src.charging=0
						src.reiatsu-=round(round(src.mreiatsu/50)*src.charge)
						src.attack-=round(round(src.mattack/50)*src.charge)
						src.defence-=round(round(src.mdefence/50)*src.charge)
						src.charge=0
					if(src.karakuraheroplayer==1||src.humanleader==1)
						src.rundelay-=1
						src.attack+=(src.mattack/20)*3
						src.defence+=(src.mdefence/20)*3
						src.reiatsu+=(src.mreiatsu/20)*3
					if(src.karakuraheroplayer==1||src.humanleader==1)
						src.defence+=(src.mdefence/4)
					if(src.squad==11||src.karakuraheroplayer==1||src.humanleader==1)
						src.attack+=(src.mattack/1.9)
					if(src.karakuraheroplayer==1||src.humanleader==1)
						src.reiatsu+=(src.mreiatsu/3)
					if(src.issternr==1)
						src.reiatsu+=(src.mreiatsu/3)
					if(src.issternrleader==1)
						src.reiatsu+=(src.mreiatsu/2.6)
					if(src.karakuraheroplayer==1||src.humanleader==1||src.status)
						src.defence+=(src.mdefence/3)
						src.attack+=(src.mattack/3)
						src.reiatsu+=(src.mreiatsu/3)
					if(src.newquincyking==1||src.status=="<font color= #1ac7c7>Quincy Emperor</font>")
						src.attack+=(src.attack/2.2)
						src.defence+=(src.defence/2.2)
						src.reiatsu+=(src.mreiatsu/2.2)

					if(src.key=="")
						src.defence+=src.mdefence
						src.attack+=src.mattack
						src.reiatsu+=src.mreiatsu
					if(src.status=="<font color=purple>Demi-God</font>")
						src.defence+=(src.mdefence/2)
						src.attack+=(src.mattack/2)
						src.reiatsu+=(src.mreiatsu/2)
					src.rundelay = 0
					src.frozen=1
					src.protected=1
					src.overlays+=/obj/finalaura/a1
					src.overlays+=/obj/finalaura/a2
					src.overlays+=/obj/finalaura/a3
					src.overlays+=/obj/finalaura/a4
					sleep(13)
					src.frozen=0
					src.protected=0
					src.Load_Overlays()
					src << "<b>You power up fully!"
					if(src.beer1)
						src.rundelay+=3
					if(src.beerboost)
						src.attack+=round(src.mattack/2)
						src.defence+=round(src.mdefence/2)
						src.reiatsu+=round(src.mreiatsu/2)
					if(src.guildpassive>=1)
						src.rundelay=src.rundelay/2
				else
					src.StartShikCool()
					src.finalb = 0
					src.arm=0
					src.leg=0
					src.core=0
					src.trans=0
					src.rundelay = 2
					src.reiatsu=src.mreiatsu
					src.defence=src.mdefence
					src.attack=src.mattack
					if(src.charging)
						src.charging=0
						src.attack-=round(round(src.mattack/50)*src.charge)
						src.defence-=round(round(src.mdefence/50)*src.charge)
						src.charge=0
					if(src.beerboost)
						src.attack+=round(src.mattack/2)
						src.defence+=round(src.mdefence/2)
						src.reiatsu+=round(src.mreiatsu/2)
					if(src.guildpassive>=1)
						src.rundelay=src.rundelay/2
					src.Load_Overlays()
					src << "<b>You release your power!"
mob
	MayuriKurotsuchi
		name = "{NPC}Mayuri Kurotsuchi"
		enemy = 1
		mhealth=40000
		rundelay = 0
		level=250
		mayuri=1
		killable=1
		hostile=1
		mreiatsu = 1300
		mrei = 60000
		spawntime = 500
		expgain = 16000
		mattack = 1300
		mdefence = 1000
		healthwas = 40000
		legit=1
		New()
			src.icon_name="Base"
			src.hair_type=0
			src.rei=src.mrei
			src.health=src.mhealth
			src.attack=src.mattack
			src.defence=src.mdefence
			src.swordon=1
			src.stype="Mayuri"
			src.swordcall="Pierce"
			src.swordname="Ashisogi Jizo"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/shinigami/s1
			src.cloak=/obj/cloak/captain/c1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
			spawn(2)
				var/sound/dd = sound('Sounds/Mayuri/WAVE_VO_MAYU_037_000.wav',volume=50)
				view(src) << dd
				spawn(20)
					view(src) << "<b>Your luck has run out."
					var/sound/d = sound('Sounds/Mayuri/WAVE_VO_MAYU_053_000.wav',volume=50)
					view(src) << d
					spawn(20)
						view(src) << "<b>Your not even worth researching."
						var/sound/Sa = sound('Sounds/Mayuri/WAVE_VO_MAYU_027_000.wav',volume=50)
						view(src) << Sa
						spawn(20)
							view(src) << "<b>Your going to die, that much is certain."
							var/sound/S = sound('Sounds/Mayuri/WAVE_VO_MAYU_031_000.wav',volume=50)
							view(src) << S
							src.safe=0
