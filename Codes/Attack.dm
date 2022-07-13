//CHECK
/*Yeah
I know this is a pain in the ass.
I changed renji, kira and someother guy i dunno.*/
mob
	proc
		Charge()
			set background = 1
			sleep(1)
			if(!src.charging)
				return
			while(src.charging)

				if(src.charge<50)
					src.charge+=1
					src.reiatsu+=round(src.mreiatsu/50)
					src.attack+=round(src.mattack/50)
				//src.defence+=round(src.mdefence/50)
				sleep(1)
			return
mob
	verb
		StopCharge()
			set hidden =1
			src.charging=0
			spawn(1)
				src.reiatsu-=round(round(src.mreiatsu/50)*src.charge)
				src.attack-=round(round(src.mattack/50)*src.charge)
				//src.defence-=round(round(src.mdefence/50)*src.charge)
				src.charge=0
mob
	verb
		Attack()
			set hidden = 1
			src.passedafkcheck=1
			src.clashhits+=1
			if(src.canattacks)
				return
			if(src.jomoned)
				src<<"You can only attack with skills in here"
				return
			if(src.cheapstuff)
				src.cheapstuff=0

				return
			if(src.senkad&&!src.senkacool&&src.senkacounter)
				if(src.ko)return
				if(!src.client && src.ko)return
				src.senkacool=1
				src.canattack=1
				spawn(5)
				src.senkacool=0
				var/mob/d=src.senkad
				src.loc=d.loc
				src.shunning=1
				src.moving=0
				step(src,src.OppositeDirection())
				src.Facedir(d)
				if(src.shinjiDissed)
					src.dir=(turn(src.dir, 180))
				src.shunning=0
				src << "<b>You have countered [d]'s senka."
				src.senkad=0
			for(var/obj/Labs/lab in get_step(src,src.dir))
				src.CheckLab(lab)
			if(src.safe)
				src << "<b>You are in safe zone!"
				return
			if(!src.canattack)
				return
			if(src.resting == 1)
				src << "<b>You can't do this while resting."
				return
			if(src.frozen==1&&src.exception==0)
				return
			if(src.ko)
				return
			if(!src.client && src.ko) return
			if(src.ko && src.bossss)return
			if(nomelee)
				src<<"Melee is disabled"
				return
			var/damage=src.attack+src.reiatsu
			if(src.reiatsu>=src.attack)
				damage = round(src.reiatsu/1.4)
			if(src.attack>=src.reiatsu)
				damage = round(src.attack/1.4)
			if(src.defence>=(src.attack&&src.reiatsu))
				damage = round(src.defence/1.4)
			if(usr.stype=="Byakuya"||usr.stype=="Rangiku")
				if(usr.inshikai||usr.inbankai)
					if(!usr.senkei&&!usr.safezone&&!usr.bowon)
						if(usr.petalsfired)return
						src.Fire_Petals()
						if(src.etarget)
							var/d=get_dist(src,src.etarget)
							src.Use_Petals(d,src.etarget)
						else
							src.Use_Petals(0,null)
						return
			if(usr.key=="Dragonpearl123"&&usr.inPeaceBoost)
				src.Fire_Petals()
				if(src.etarget)
					var/d=get_dist(src,src.etarget)
					src.Use_Petals(d,src.etarget)
				else
					src.Use_Petals(0,null)
				return




			if(src.firesworduse)
				if(src.client)
					flick("Sword Slash1",src)
					if(src.dir == NORTH)
						var/obj/yaiba/A = new /obj/yaiba/
						var/obj/yaiba2/B = new /obj/yaiba2/
						var/obj/yaiba1/C = new /obj/yaiba1/
						A.icon = 'example.dmi'
						B.icon = 'example.dmi'
						C.icon = 'example.dmi'
						A.loc = locate(src.x, src.y, src.z)
						C.loc = locate(src.x+1, src.y, src.z)
						B.loc = locate(src.x-1, src.y, src.z)
						A.dir = NORTH
						B.dir = NORTH
						C.dir = NORTH
						A.Gowner = src
						B.Gowner = src
						C.Gowner = src
						walk(A,NORTH)
						walk(C,NORTH)
						walk(B,NORTH)
					if(src.dir == SOUTH)
						var/obj/yaiba/A = new /obj/yaiba/
						var/obj/yaiba1/B = new /obj/yaiba1/
						var/obj/yaiba2/C = new /obj/yaiba2/
						A.icon = 'example.dmi'
						B.icon = 'example.dmi'
						C.icon = 'example.dmi'
						A.loc = locate(src.x, src.y, src.z)
						C.loc = locate(src.x+1, src.y, src.z)
						B.loc = locate(src.x-1, src.y, src.z)
						A.dir = SOUTH
						B.dir = SOUTH
						C.dir = SOUTH
						A.Gowner = src
						B.Gowner = src
						C.Gowner = src
						walk(A,SOUTH)
						walk(C,SOUTH)
						walk(B,SOUTH)
					if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
						var/obj/yaiba1/A = new /obj/yaiba1/
						var/obj/yaiba2/B = new /obj/yaiba2/
						var/obj/yaiba/C = new /obj/yaiba/
						A.icon = 'example.dmi'
						B.icon = 'example.dmi'
						C.icon = 'example.dmi'
						A.loc = locate(src.x, src.y+1, src.z)
						C.loc = locate(src.x, src.y, src.z)
						B.loc = locate(src.x, src.y-1, src.z)
						A.dir = src.dir
						B.dir = src.dir
						C.dir = src.dir
						A.Gowner = src
						B.Gowner = src
						C.Gowner = src
						walk(A,src.dir)
						walk(C,src.dir)
						walk(B,src.dir)
					if(src.dir==EAST)
						var/obj/yaiba1/A = new /obj/yaiba1/
						var/obj/yaiba2/B = new /obj/yaiba2/
						var/obj/yaiba/C = new /obj/yaiba/
						A.icon = 'example.dmi'
						B.icon = 'example.dmi'
						C.icon = 'example.dmi'
						A.loc = locate(src.x, src.y-1, src.z)
						C.loc = locate(src.x, src.y, src.z)
						B.loc = locate(src.x, src.y+1, src.z)
						A.dir = src.dir
						B.dir = src.dir
						C.dir = src.dir
						A.Gowner = src
						B.Gowner = src
						C.Gowner = src
						walk(A,src.dir)
						walk(C,src.dir)
						walk(B,src.dir)
					var/obj/K = new/obj/Slash2/s1
					K:Gowner = usr
					K:dir = usr.dir
					var/obj/Ks = new/obj/Slash2/s2
					Ks:Gowner = usr
					Ks:dir = usr.dir
					var/obj/Ka = new/obj/Slash2/s3
					Ka:Gowner = usr
					Ka:dir = usr.dir
					if(src.dir==NORTH)
						Ka.loc=locate(src.x+1,src.y+1,src.z)
						Ks.loc=locate(src.x,src.y+1,src.z)
						K.loc=locate(src.x-1,src.y+1,src.z)
					if(src.dir==SOUTH)
						Ka.loc=locate(src.x+1,src.y-1,src.z)
						Ks.loc=locate(src.x,src.y-1,src.z)
						K.loc=locate(src.x-1,src.y-1,src.z)
					if(src.dir==EAST)
						Ka.loc=locate(src.x+1,src.y+1,src.z)
						Ks.loc=locate(src.x+1,src.y,src.z)
						K.loc=locate(src.x+1,src.y-1,src.z)
					if(src.dir==WEST)
						Ka.loc=locate(src.x-1,src.y+1,src.z)
						Ks.loc=locate(src.x-1,src.y,src.z)
						K.loc=locate(src.x-1,src.y-1,src.z)
					if(src.dir==NORTHEAST)
						Ka.loc=locate(src.x+1,src.y+2,src.z)
						Ks.loc=locate(src.x+1,src.y+1,src.z)
						K.loc=locate(src.x+1,src.y,src.z)
					if(src.dir==NORTHWEST)
						Ka.loc=locate(src.x-1,src.y+2,src.z)
						Ks.loc=locate(src.x-1,src.y+1,src.z)
						K.loc=locate(src.x-1,src.y,src.z)
					if(src.dir==SOUTHEAST)
						Ka.loc=locate(src.x+1,src.y,src.z)
						Ks.loc=locate(src.x+1,src.y-1,src.z)
						K.loc=locate(src.x+1,src.y-2,src.z)
					if(src.dir==SOUTHWEST)
						Ka.loc=locate(src.x-1,src.y,src.z)
						Ks.loc=locate(src.x-1,src.y-1,src.z)
						K.loc=locate(src.x-1,src.y-2,src.z)



			if(src.etarget)
				Facedir(etarget)
				if(src.shinjiDissed)
					src.dir=(turn(src.dir, 180))
			if(src.canattack)
				src.canattack =0
				if(src.coiled)
					if(src.swordon || src.firesworduse||src.dualwield)
						flick("Sword Slash1",src)
					else if(!src.swordon&&!src.firesworduse&&!src.dualwield)
						flick("punch",src)
					Blood(src.x,src.y,src.z)
					src<<"You cut yourself"
					src.Death(src.coiled,round(src.mhealth/20),rand(1,5))
					sleep(10)
					src.canattack=1
					return
				//if(src.combat1)
				//	src.charging=1
				//	src.Charge()
				if(src.soccer)
					src.soccer=0
					src.Load_Overlays()
					var/obj/soccerball/s=new/obj/soccerball(src.loc)
					s.icon_state="fire"
					walk(s,src.dir,0)
					sleep(5)
					if(s)
						s.icon_state=""
						walk(s,0)
						if(s.dir==NORTH)s.dir=SOUTH
					src.canattack=1
					return
				/*if(src.infinal)//||src.vasto==1&&src.enemy||src.shunko||src.vasto&&src.maskon)
					//if(src.stype!="Kommamaru"&&src.stype!="Rangiku"&&src.stype!="Renji"&&src.stype!="Ichimaru"&&src.stype!="Jiroubou"&&src.stype!="Kaiens")
					spawn(5)
						src.canattack=1
						return*/
				if(src.shunko || src.tshunko)
					var/mob/e=src.etarget
					if(e)
						if(e in oview(4,src))
							var/list/Menu = list()
							for(var/turf/T in oview(1,e))
								if(!T.density)
									Menu.Add(T)
							if(Menu&&Menu.len)
								var/turf/D=pick(Menu)
								src.loc=locate(D.x,D.y,D.z)
								src.Facedir(e)
								if(src.shinjiDissed)
									src.dir=(turn(src.dir, 180))
				if(src.etarget)
					var/mob/M=src.etarget
					if(prob(src.hypebeast*2))
						src.Facedir(M)
						if(prob(M.backup*5))
							M.allowmove=1
							step(M,src.dir)
							step(M,src.dir)
							M.allowmove=0
							M.Facedir(src)
						if(M.shinjiDissed)
							M.dir=(turn(M.dir, 180))
						src.allowmove=1
						step(src,src.dir)
						step(src,src.dir)
						src.allowmove=0
				src.attacking=1
				spawn(1)
				src.attacking=0
				for(var/obj/kink in get_step(src,src.dir))
					if(kink.Gowner && kink.single==1)
						walk(kink,src.OppositeDirection(),1)
					if(kink.Gowner && kink.strong==1)
						walk(kink,src.ReverseDeflectionDirection(),1)
				for(var/mob/M in get_step(src,src.dir))
					if(M.inindeath)
						damage = 0
						damage = damage
					if(M.kenpachi && M.gothit==0)
						M.protected=1
						M.frozen=1
						M.gothit=1
						src.frozen=1
						var/sound/d = sound('Sounds/Kenpachi/WAVE_VO_KENP_042_000.wav',volume=50)
						view(src) << d
						view(src) << "<b>Is that it..."
						spawn(10)
						src << "<b> You feel scared"
						spawn(20)
							var/sound/dd = sound('Sounds/Kenpachi/WAVE_VO_KENP_041_000.wav',volume=50)
							view(src) << dd
							view(src) << "<b>If you want to die so badly fine."
							spawn(40)
								src.frozen=0
								src << "<b>RUNNNNN!!!!!!!!!!!!!!"
								spawn(5)
									M.protected=0
									M.frozen=0
									//M.sight &= ~SEE_TURFS
									M.sight |= SEE_MOBS
					if(M.soccer)
						src.soccer=1
						M.soccer=0
						src.Load_Overlays()
						M.Load_Overlays()
					if(M.attacking==1&&M.race!="Quincy"&&!M.smooth)
						var/t=pick(1,2)
						if(t==1)
							var/fd=pick(1,2)
							if(fd==1)
								src.clash=1
								M.clash=1
								src.Clash(M)
							if(fd==2)
								var/d=M.dir
								M.moving=0
								step_away(M,src)
								M.dir=d
								var/da=src.dir
								src.moving=0
								step_away(src,M)
								src.dir=da
						if(t==2)
							if(src.combat2=="Paper"&&M.combat2=="Scissors"||src.combat2=="Rock"&&M.combat2=="Paper"||src.combat2=="Scissors"&&M.combat2=="Rock"||!src.combat2&&M.combat2)
								var/d=src.dir
								src.moving=0
								step_away(src,M)
								src.moving=0
								step_away(src,M)
								src.dir=d
							if(M.combat2=="Paper"&&src.combat2=="Scissors"||M.combat2=="Rock"&&src.combat2=="Paper"||M.combat2=="Scissors"&&src.combat2=="Rock"||!M.combat2&&src.combat2)
								var/d=M.dir
								M.moving=0
								step_away(M,src)
								M.moving=0
								step_away(M,src)
								M.dir=d
							if(M.combat2==src.combat2)
								var/fd=pick(1,2)
								if(fd==1)
									src.clash=1
									M.clash=1
									src.Clash(M)
								if(fd==2)
									var/d=M.dir
									M.moving=0
									step_away(M,src)
									M.dir=d
									var/da=src.dir
									src.moving=0
									step_away(src,M)
									src.dir=da
				if(src.seele > 0&&src.seele <= 5)
					if(src.race == "Quincy")
						flick("Bow Stance",src)
						var/M = new/obj/seele(src.loc)
						M:Gowner = src
						M:dir = src.dir
						walk(M,src.dir)
						src.seele -= 1
						if(src.seele == 4)
							src.overlays -= /obj/seele5
							src.overlays -= /obj/seele5
						if(src.seele == 3)
							src.overlays -= /obj/seele5
							src.overlays -= /obj/seele5
							src.overlays -= /obj/seele4
							src.overlays -= /obj/seele4
						if(src.seele == 2)
							src.overlays -= /obj/seele5
							src.overlays -= /obj/seele5
							src.overlays -= /obj/seele4
							src.overlays -= /obj/seele4
							src.overlays -= /obj/seele3
							src.overlays -= /obj/seele3
						if(src.seele == 1)
							src.overlays -= /obj/seele5
							src.overlays -= /obj/seele5
							src.overlays -= /obj/seele4
							src.overlays -= /obj/seele4
							src.overlays -= /obj/seele3
							src.overlays -= /obj/seele3
							src.overlays -= /obj/seele2
							src.overlays -= /obj/seele2
						if(src.seele == 0)
							spawn(150)
								src.seeleuse = 0
							src.overlays -= /obj/seele5
							src.overlays -= /obj/seele5
							src.overlays -= /obj/seele4
							src.overlays -= /obj/seele4
							src.overlays -= /obj/seele3
							src.overlays -= /obj/seele3
							src.overlays -= /obj/seele2
							src.overlays -= /obj/seele2
							src.overlays -= /obj/seele1
							src.overlays -= /obj/seele1
						sleep(20)
						src.canattack = 1
						return
				if(src.seelsword||src.spiritweapon==2&&src.bowon)
					if(src.race=="Quincy")
						flick("Sword Slash1",src)
						for(var/mob/J in get_step(src,src.dir))
							if(J.volcano)
								J.Volcano(src)
							damage =src.reiatsu*3
							damage+=rand(damage/3,damage/2)
							damage -= J.defence / 2
							if(src.marksman>=1)
								damage+=src.level*10
							if(damage <= 1)
								damage =rand(25,1000)
							var/drain=round(src.rei/10,1)
							if(!J.protected)J.rei-=drain
							if(J.rei<0)J.rei=0
							src.rei+=drain/2
							if(src.rei>src.mrei*1.5)src.rei=src.mrei*1.5
							if(prob(src.bodypassive*3))
								view(src,8) << "<font color = red>[src] hit [J] in the core!"
								J.BrokenCore()
							if(prob(src.armpassive*3))
								view(src,8) << "<font color = red>[src] hit [J] in the arm!"
								J.BrokenArm()
							if(prob(src.legpassive*3))
								view(src,8) << "<font color = red>[src] hit [J] in the leg!"
								J.BrokenLeg()
							if(prob(src.headpassive*3))
								view(src,8) << "<font color = red>[src] hit [J] in the head!"
								J.BrokenHead()
							if(prob(src.stunpassive*3))
								view(src,8) << "<font color = red>[src] stunned [J]!"
								J.Freeze(12)
							//if(!J.protected)view(src,8) << "<b><font color = red>[src] attacked [J] for [damage] damage!"

							spawn()J.Death(src,damage,rand(1,2))
						sleep(12)
						src.canattack = 1
						return
				if(src.bowon&&!src.inbankai)
					if(src.spren>=5)
						for(var/obj/center/i in world)
							if(i.Gowner==src)
								for(var/mob/M in view(2,i))
									M.Slowed(30,30)
									src<<"RUNN before you get caught in the explosion!"
									spawn(20)
										for(var/mob/D in view(2,i))
											var/explosion=src.reiatsu*10
											explosion-=D.defence
											explosion=rand(explosion*0.8,explosion*1.2)
											explosion=round(explosion,1)
											//if(!D.protected)view(i)<<"<b><font color = red>[src] blew up [D] for [explosion]!"
											spawn()D.Death(src,explosion)
								spawn(20)
								i.MakeBombs()
								spawn(30)
									src.spren=0
									src.canattack=1
									for(var/obj/s in view(12,src))
										if(s.Gowner==src && s.sp)
											del s
									del i
					var/anymore=0
					if(src.blinding)anymore=50
					if(src.rei <= src.rei/30+anymore&&src.level>=50)
						src << "<b>Your rei is too low!"
						sleep(5)
						src.canattack = 1
						return
					if(src.race == "Quincy")
						//if(!src.inran)
						if(src.level>=50)
							src.rei -= src.rei/200+anymore
						if(src.spiritweapon==0)
							flick("Bow Stance",src)
						var/minusdmg=0
						var/minusspd=0
						if(src.spiritweapon==1)
							minusdmg=src.reiatsu/5
							minusspd=4
						var/M = new/obj/arrow(src.loc)
						M:Gowner = src
						M:attack = src.reiatsu-minusdmg
						if(src.marksman>=1)
							minusdmg+=src.level*10
						walk(M,src.dir)
						if(src.finalb)
							M:attack = src.reiatsu * 3.3-minusdmg
							if(src.spiritweapon==1)
								M:icon='Icons/QuincyVandBullet1.dmi'
								icon_state="1"
							else
								M:icon = 'Icons/QuincyVandBullet1.dmi'
							if(src.gotfinal2)
								M:attack = src.reiatsu * 2.3-minusdmg
							sleep(10-minusspd)
							if(src.gotfinal2)
								src.canattack=1
							else
								sleep(10-minusspd)
								src.canattack=1
							return
						sleep(14-minusspd)
						if(src.sanrei)
							src.canattack = 1
						else
							sleep(14-minusspd)
							src.canattack = 1
						return
				if(src.ftype=="Fire Doll"&&src.infull||src.ftype=="Fire Doll"&&src.inafull)
					if(src.rei<150)
						src<<"<b>You don't have enough rei [src.rei]/150"
						sleep(7)
						src.canattack=1
						return
					else
						src.rei -= 150
						var/M = new/obj/FireDollBall(src.loc)
						M:Gowner = src
						walk(M,src.dir)
						sleep(10)
						if(src.inafull)
							src.canattack = 1
						else
							sleep(4)
							src.canattack = 1
						return
				if(src.ftype=="Water Doll"&&src.infull||src.ftype=="Water Doll"&&src.inafull)
					if(src.rei<150)
						src<<"<b>You don't have enough rei [src.rei]/150"
						sleep(7)
						src.canattack=1
						return
					else
						src.rei -= 150
						var/M = new/obj/WaterDollBall(src.loc)
						M:Gowner = src
						walk(M,src.dir)
						sleep(10)
						if(src.inafull)
							src.canattack = 1
						else
							sleep(4)
							src.canattack = 1
						return
				for(var/mob/M in get_step(src,src.dir))
					if(M.shunko||M.tshunko)
						if(prob(M.quickflash*15))
							flick("shun",M)
							if(src.swordon || src.firesworduse||src.dualwield)flick("Sword Slash1",src)
							if(!src.swordon&&!src.firesworduse&&!src.dualwield)flick("punch",src)
							sleep(4)
							src.canattack=1
							return
					else
						if(prob(M.quickflash*5))
							flick("shun",M)
							if(src.swordon || src.firesworduse||src.dualwield)flick("Sword Slash1",src)
							if(!src.swordon)flick("punch",src)
							sleep(4)
							src.canattack=1
							return
				if(src.ftype == "Inoue"&&src.infull||src.ftype == "Inoue"&&src.inafull)
					if(src.rei<150)
						src<<"<b>You don't have enough rei [src.rei]/150"
						sleep(7)
						src.canattack=1
						return
					else
						src.rei -= 150
						var/M = new/obj/inouezip(src.loc)
						M:Gowner = src
						walk(M,src.dir)
						sleep(10)
						if(src.inafull)
							src.canattack = 1
						else
							sleep(4)
							src.canattack = 1
						return
				for(var/mob/M in get_step(src,src.dir))
					if(M.shunko||M.tshunko)
						if(prob(M.quickflash*15))
							flick("shun",M)
							if(src.swordon || src.firesworduse||src.dualwield)flick("Sword Slash1",src)
							if(!src.swordon)flick("punch",src)
							sleep(4)
							src.canattack=1
							return
					else
						if(prob(M.quickflash*5))
							flick("shun",M)
							if(src.swordon || src.firesworduse||src.dualwield)flick("Sword Slash1",src)
							if(!src.swordon)flick("punch",src)
							sleep(4)
							src.canattack=1
							return
				if(src.firsthit==1)
					flick("Sword Slash1",src)
					src.firsthit=0
					src.firsthitcool=1
					src.secondhitcool=0
					src.thits+=1
					if(src.thits==200)
						src<<"<b><font color=lime>Fullbringer Info: You have fully awakened your fullbring and can now deliver all 4 memory strikes at once with Memory Strikes!"
						src.contents+=new/obj/skillcard/Memory_Strikes
						src.RefreshSkillList()
					for(var/mob/M in get_step(src,src.dir))
						if(!M.protected)
							M.Canthit()
							view(src,8)<<"<b><font color = white>[M] thinks [src] is his friend and won't fight back!"
				if(src.secondhit==1)
					flick("Sword Slash1",src)
					src.secondhit=0
					src.secondhitcool=1
					src.thirdhitcool=0
					src.thits+=1
					if(src.thits==200)
						src<<"<b><font color=lime>Fullbringer Info: You have fully awakened your fullbring and can now deliver all 4 memory strikes at once with Memory Strikes!"
						src.contents+=new/obj/skillcard/Memory_Strikes
						src.RefreshSkillList()
					for(var/mob/M in get_step(src,src.dir))
						if(!M.protected)
							M.Cantmove()
							view(src,8)<<"<b><font color = white>[M] thinks [src] is friendly and won't move!"
				if(src.thirdhit==1)
					flick("Sword Slash1",src)
					src.thirdhit=0
					src.thirdhitcool=1
					src.forthhitcool=0
					src.thits+=1
					if(src.thits==200)
						src<<"<b><font color=lime>Fullbringer Info: You have fully awakened your fullbring and can now deliver all 4 memory strikes at once with Memory Strikes!"
						src.contents+=new/obj/skillcard/Memory_Strikes
						src.RefreshSkillList()
					for(var/mob/M in get_step(src,src.dir))
						if(!M.protected)
							M.wound+=5
							if(M.level>src.level*2.5)
								M.health-=src.mhealth/10
							if(M.level>src.level*2)
								M.health-=src.mhealth/6
							else
								M.health-=src.mhealth/4
							if(!M.protected)view(src,8)<<"<b><font color = white>[M] is confused and has a nervous breakdown!"

							spawn()M.Death(src)
				if(src.forthhit==1)
					flick("Sword Slash1",src)
					src.forthhit=0
					src.forthhitcool=1
					src.firsthitcool=0
					src.thits+=1
					if(src.thits==200)
						src<<"<b><font color=lime>Fullbringer Info: You have fully awakened your fullbring and can now deliver all 4 memory strikes at once with Memory Strikes!"
						src.contents+=new/obj/skillcard/Memory_Strikes
						src.RefreshSkillList()
					for(var/mob/M in get_step(src,src.dir))
						if(!M.protected)
							view(src,8)<<"<b><font color = white>[src] forces [M] to close his eyes!"
							M.Cantsee()
				if(src.hrecoil)
					flick("Sword Slash1",src)
					src.hrecoil=0
					spawn()src.HRecoil()
					for(var/mob/M in get_step(src,src.dir))
						if(!M.protected)
							M.Coiled(src)
				if(src.memstrike)
					flick("Sword Slash1",src)
					src.memstrike=0
					src.Memstrikes()
					for(var/mob/M in get_step(src,src.dir))
						if(!M.protected&&!M.vand)
							M.wound-=10
							M.health-=usr.mhealth

							spawn()M.Death(src)
							view(src,8)<<"<b><font color = white>[M] can't do anything anymore!"
							M.Cantsee()
							M.Cantmove()
							M.Canthit()
				if(src.critstun)
					if(prob(src.wound/2))
						for(var/mob/M in get_step(src,src.dir))
							M.Stunnage()
				if(src.critburst)
					flick("punch",src)
					src.wound+=rand(2,6)
					for(var/mob/M in get_step(src,src.dir))
						new/obj/burst(M.x,M.y,M.z)
						var/crits=src.attack*3
						crits-=M.defence/2
						crits=rand(crits*0.8,crits*1.2)
						crits=round(crits,1)
						if(crits<1)crits=1
						view(src,8)<<"<b><font color = red>[src] hit the mess out of [M]!"
						step(M,src.dir)
						M.moving=0
						step(M,src.dir)
						M.moving=0
						step(M,src.dir)
						M.moving=0
						step(M,src.dir)

						spawn()M.Death(src,crits,0)
					sleep(8)
					src.canattack=1
					return
				if(src.rapidattacking)
					var/mob/u=src.etarget
					src.loc=locate(u.x,u.y+1,u.z)
					flick("Sword Slash1",src)
					src.loc=locate(u.x,u.y-1,u.z)
					flick("Sword Slash1",src)
					src.loc=locate(u.x+1,u.y+1,u.z)
					flick("Sword Slash1",src)
				//	sleep(0.1 SECONDS)
				//	src.canattack=

				if(src.crit==1)
					flick("punch",src)
					src.crit=0
					if(src.race=="Fullbringer")
						src.kicks+=1
						if(src.kicks==150)
							src<<"<b><font color = lime>Ability Info: You have awakened your dirty boots and will gain a bigger boost from getting it dirty!"
					for(var/mob/M in get_step(src,src.dir))
						var/crits=src.attack*4.5
						crits-=M.defence/1.5
						crits=rand(crits*1.8,crits*2.2)
						crits=round(crits,1)
						if(crits<1)crits=1
						view(src,8)<<"<b><font color = red>[src] hit the mess out of [M]!"
						M.allowmove=1
						step(M,src.dir)
						step(M,src.dir)
						step(M,src.dir)
						step(M,src.dir)
						M.allowmove=0

						spawn()M.Death(src,crits,0)
					sleep(8)
					src.canattack=1
					return
				if(src.bull)
					flick("punch",src)
					src.bull-=1
					for(var/mob/M in get_step(src,src.dir))
						new/obj/burst(M.x,M.y,M.z)
						var/crits=src.attack*7.2
						crits-=M.defence/2
						crits=rand(crits*0.8,crits*1.2)
						crits=round(crits,1)
						if(crits<1)crits=1
						view(src,8)<<"<b><font color = red>[src] hit the mess out of [M]!"
						step(M,src.dir)
						M.moving=0
						step(M,src.dir)
						M.moving=0
						step(M,src.dir)
						M.moving=0
						step(M,src.dir)
						M.moving=0
						step(M,src.dir)
						M.moving=0
						step(M,src.dir)

						spawn()M.Death(src,crits,0)
					sleep(8)
					src.canattack=1
					return
				if(src.directo)
					flick("punch",src)
					src.canattack=1
					src.El_Directo()
					return
				if(src.besar)
					flick("punch",src)
					src.canattack=1
					src.Diablo_Besar()
					return
				if(src.lamuerte)
					flick("punch",src)
					var/ki=0
					for(var/mob/G in get_step(src,src.dir))
						ki=1
						new/obj/Lamuertenew/a2(G.loc)
						if(!G.protected)Blood(G.x,G.y,G.z)
						if(!G.protected)
							if(!G.wound>=90)
								G.health=0
								G.wound=101
						view(src,8)<<"<b><font color = red>[src] used La Muerte and hit [G]!"
						G.lamuertesurvivor+=1
						G.Freeze(20)
						if(G.lamuertesurvivor==100)
							world<<"<b><font color=lime>Medal Info: [G] has been awarded the 'Sado Immunity' for surviving La Muerte 100 times"
							AwardMedal("Sado Immunity", G)
						spawn()G.Death(src,src.attack*5.5,10)
					if(ki==0)
						for(var/mob/G in oview(1,src))
							if(ki==0)
								ki=1
								new/obj/Lamuertenew/a2(G.loc)
								if(!G.protected)Blood(G.x,G.y,G.z)
								if(!G.protected)
									if(!G.wound>=90)
										G.health=0
										G.wound=101
								view(src,8)<<"<b><font color = red>[src] used La Muerte and hit [G]!"
								G.lamuertesurvivor+=1
								G.Freeze(20)
								if(G.lamuertesurvivor==100)
									world<<"<b><font color=lime>Medal Info: [G] has been awarded the 'Sado Immunity' for surviving La Muerte 100 times"
									AwardMedal("Sado Immunity", G)
								spawn()G.Death(src,src.attack*4,10)
					sleep(7)
					src.canattack=1
					src.firing=0
					src.lamuerte=0
					src.overlays -= /obj/SadoCharge
					return

				if(src.stype == "Hyosuke")
					if(src.decwayon)
						src.shurikened+=1
						flick("Sword Slash1",src)
						var/K = new/mob/DeathWave(usr.loc)
						K:owner = usr
						walk(K,usr.dir)
						if(src.etarget)
							walk_towards(K,src.etarget)
						if(src.shurikened>=5)
							sleep(20)
							src.shurikened=0
						sleep(2)
						src.canattack=1
						return
				if(src.ressurectiontype=="Healer" && src.client)
					if(src.HealerAttack==1)
						if(!src.homefireballon)
							src.rei -= 150
							flick("Sword Slash1",src)
							var/obj/M = new/obj/PheBall(src.loc)
							M:Gowner = src
							walk(M,src.dir)
							sleep(15)
							src.canattack=1
							return
						if(src.homefireballon)
							src.shurikened+=1
							flick("Sword Slash1",src)
							var/K = new/mob/Homingfireballs(usr.loc)
							K:owner = usr
							walk(K,usr.dir)
							if(src.etarget)
								walk_towards(K,src.etarget)
							if(src.shurikened>=5)
								sleep(20)
								src.shurikened=0
							sleep(2)
							src.canattack=1
							return
					if(HealerAttack==0)
						flick("Sword Slash1",src)
						for(var/mob/M in get_step(src,src.dir))
							if(M.volcano)
								M.Volcano(src)
							if(M.protected)
								sleep(8)
								src.canattack=1
								return
							damage +=(src.reiatsu+src.attack)*2
							if(damage <= 1)
								damage =rand(25,1000)
							if(prob(src.bodypassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the core!"
								M.BrokenCore()
							if(prob(src.armpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the arm!"
								M.BrokenArm()
							if(prob(src.legpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the leg!"
								M.BrokenLeg()
							if(prob(src.headpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the head!"
								M.BrokenHead()
							if(prob(src.stunpassive*3))
								view(src,8) << "<font color = red>[src] stunned [M]!"
								M.Freeze(12)
							spawn()M.Death(src,damage,rand(0,2))
						sleep(4)
						src.canattack = 1
						return
				if(src.ressurectiontype == "Aguila" && src.client)
					if(!src.devoraron)
						if(usr.rei >=200)
							flick("Sword Slash1",src)
							usr.rei -= 0
							var/K = new/obj/aguicyclone(usr.loc)
							K:Gowner = usr
							K:dir = usr.dir
							walk(K,usr.dir)
							sleep(15)
							src.canattack=1
							return
					if(src.devoraron)
						src.shurikened+=1
						flick("Sword Slash1",src)
						var/K = new/mob/Devorar(usr.loc)
						K:owner = usr
						walk(K,usr.dir)
					//	if(src.etarget)
					//		walk_towards(K,src.etarget)
						if(src.shurikened>=5)
							sleep(20)
							src.shurikened=0
						sleep(2)
						src.canattack=1
						return
				if(src.ressurection==1)
					if(src.ressurectiontype=="Cirucci" && src.client)
						src<<"This atk was taken out"
						sleep(15)
						src.canattack=1
						return
					if(src.ressurectiontype=="Nnoitra")
						src.overlays-=/obj/Zanpakutou/Nnoitra/a1
						src.overlays-=/obj/Zanpakutou/Nnoitra/a2
						src.overlays-=/obj/Zanpakutou/Nnoitra/a3
						src.overlays-=/obj/Zanpakutou/Nnoitra/a4
						src.overlays-=/obj/Zanpakutou/Nnoitra/a5
						src.overlays-=/obj/Zanpakutou/Nnoitra/n1
						src.overlays-=/obj/Zanpakutou/Nnoitra/n2
						src.overlays-=/obj/Zanpakutou/Nnoitra/n3
						src.overlays-=/obj/Zanpakutou/Nnoitra/n4
						src.overlays-=/obj/Zanpakutou/Nnoitra/n5
						var/obj/K = new/obj/Slash/s1
						K:Gowner = usr
						K:dir = usr.dir
						var/obj/Ks = new/obj/Slash/s2
						Ks:Gowner = usr
						Ks:dir = usr.dir
						var/obj/Ka = new/obj/Slash/s3
						Ka:Gowner = usr
						Ka:dir = usr.dir
						src.frozen=1
						if(src.wound>=75)
							if(src.dir==NORTH)
								Ka.loc=locate(src.x+1,src.y+1,src.z)
								K.loc=locate(src.x,src.y+1,src.z)
							if(src.dir==SOUTH)
								Ka.loc=locate(src.x,src.y-1,src.z)
								K.loc=locate(src.x-1,src.y-1,src.z)
							if(src.dir==EAST)
								Ka.loc=locate(src.x+1,src.y,src.z)
								K.loc=locate(src.x+1,src.y-1,src.z)
							if(src.dir==WEST)
								Ka.loc=locate(src.x-1,src.y+1,src.z)
								K.loc=locate(src.x-1,src.y,src.z)
							if(src.dir==NORTHEAST)
								Ka.loc=locate(src.x+1,src.y+1,src.z)
								K.loc=locate(src.x+1,src.y,src.z)
							if(src.dir==NORTHWEST)
								Ka.loc=locate(src.x-1,src.y+2,src.z)
								K.loc=locate(src.x-1,src.y+1,src.z)
							if(src.dir==SOUTHEAST)
								Ka.loc=locate(src.x+1,src.y-1,src.z)
								K.loc=locate(src.x+1,src.y-2,src.z)
							if(src.dir==SOUTHWEST)
								Ka.loc=locate(src.x-1,src.y,src.z)
								K.loc=locate(src.x-1,src.y-1,src.z)
						if(src.wound<75)
							if(src.dir==NORTH)
								Ka.loc=locate(src.x+1,src.y+1,src.z)
								Ks.loc=locate(src.x,src.y+1,src.z)
								K.loc=locate(src.x-1,src.y+1,src.z)
							if(src.dir==SOUTH)
								Ka.loc=locate(src.x+1,src.y-1,src.z)
								Ks.loc=locate(src.x,src.y-1,src.z)
								K.loc=locate(src.x-1,src.y-1,src.z)
							if(src.dir==EAST)
								Ka.loc=locate(src.x+1,src.y+1,src.z)
								Ks.loc=locate(src.x+1,src.y,src.z)
								K.loc=locate(src.x+1,src.y-1,src.z)
							if(src.dir==WEST)
								Ka.loc=locate(src.x-1,src.y+1,src.z)
								Ks.loc=locate(src.x-1,src.y,src.z)
								K.loc=locate(src.x-1,src.y-1,src.z)
							if(src.dir==NORTHEAST)
								Ka.loc=locate(src.x+1,src.y+2,src.z)
								Ks.loc=locate(src.x+1,src.y+1,src.z)
								K.loc=locate(src.x+1,src.y,src.z)
							if(src.dir==NORTHWEST)
								Ka.loc=locate(src.x-1,src.y+2,src.z)
								Ks.loc=locate(src.x-1,src.y+1,src.z)
								K.loc=locate(src.x-1,src.y,src.z)
							if(src.dir==SOUTHEAST)
								Ka.loc=locate(src.x+1,src.y,src.z)
								Ks.loc=locate(src.x+1,src.y-1,src.z)
								K.loc=locate(src.x+1,src.y-2,src.z)
							if(src.dir==SOUTHWEST)
								Ka.loc=locate(src.x-1,src.y,src.z)
								Ks.loc=locate(src.x-1,src.y-1,src.z)
								K.loc=locate(src.x-1,src.y-2,src.z)
						sleep(2)
						src.frozen=0
						sleep(1)
						src.overlays+=/obj/Zanpakutou/Nnoitra/a1
						src.overlays+=/obj/Zanpakutou/Nnoitra/a2
						src.overlays+=/obj/Zanpakutou/Nnoitra/a3
						src.overlays+=/obj/Zanpakutou/Nnoitra/a4
						src.overlays+=/obj/Zanpakutou/Nnoitra/a5
						src.overlays+=/obj/Zanpakutou/Nnoitra/n1
						src.overlays+=/obj/Zanpakutou/Nnoitra/n2
						src.overlays+=/obj/Zanpakutou/Nnoitra/n3
						src.overlays+=/obj/Zanpakutou/Nnoitra/n4
						src.overlays+=/obj/Zanpakutou/Nnoitra/n5
						sleep(8)
						src.canattack=1
						return
					if(src.ressurectiontype=="Dordoni")
						if(usr.rei >=200)
							usr.rei -= 200
							var/K = new/obj/cyclone(usr.loc)
							K:Gowner = usr
							K:dir = usr.dir
							walk(K,usr.dir)
							sleep(15)
							src.canattack=1
							return

					if(src.ressurectiontype=="Shooter"&&src.dualon==0)
						if(usr.rei >=350)
							usr.rei -= 350
							if(src.key=="CommanderJohnShepard")
								for(var/i=0;i<2;i++)
									var/obj/K = new/obj/weakcero(usr.loc)
									K:Gowner = usr
									if(src.cerocolor=="Red")K.icon='Icons/new red cero.dmi'
									if(src.cerocolor=="Blue")K.icon='Icons/bluenew cero.dmi'
									if(src.cerocolor=="Green")K.icon='Icons/greennew cero.dmi'
									if(src.cerocolor=="Yellow")K.icon='Icons/yellownew cero.dmi'
									K:dir = usr.dir
									walk(K,usr.dir)
									sleep(2)
							else
								var/obj/K = new/obj/weakcero(usr.loc)
								K:Gowner = usr
								if(src.cerocolor=="Red")K.icon='Icons/new red cero.dmi'
								if(src.cerocolor=="Blue")K.icon='Icons/bluenew cero.dmi'
								if(src.cerocolor=="Green")K.icon='Icons/greennew cero.dmi'
								if(src.cerocolor=="Yellow")K.icon='Icons/yellownew cero.dmi'
								K:dir = usr.dir
								walk(K,usr.dir)
							usr << "Reloading. . ."
							sleep(5)
							usr <<"Done"
							src.canattack=1
							return
					if(src.ressurectiontype=="Zommari")
						flick("punch",src)
						var/mob/M=locate() in get_step(src,src.dir)
						if(M)
							if(M.volcano)
								M.Volcano(src)
							var/randm = pick(1,2,3,4)
							if(randm ==1)
								spawn()M.Slowed(5,12)
							damage=src.attack*(rand(1.7,2.3))
							damage -= M.defence / 2
							if(damage <= 1)
								damage =rand(25,1000)
							if(prob(src.bodypassive*6))
								view(src,8) << "<font color = red>[src] hit [M] in the core!"
								M.BrokenCore()
							if(prob(src.armpassive*6))
								view(src,8) << "<font color = red>[src] hit [M] in the arm!"
								M.BrokenArm()
							if(prob(src.legpassive*6))
								view(src,8) << "<font color = red>[src] hit [M] in the leg!"
								M.BrokenLeg()
							if(prob(src.headpassive*6))
								view(src,8) << "<font color = red>[src] hit [M] in the head!"
								M.BrokenHead()
							if(prob(src.stunpassive*3))
								view(src,8) << "<font color = red>[src] stunned [M]!"
								M.Freeze(12)
							spawn()M.Death(src,damage,rand(0,1))
						sleep(8)
						src.canattack = 1
						return
					if(src.ressurectiontype=="Luppi")
						if(src.key!="Dragonpearl123")
							src.icon_state="stretch"
							var/obj/K = new/obj/tentacle(src.loc)
							spawn(5)
								var/obj/K2 = new/obj/tentacle(src.loc)
								K2:Gowner = src
								K2.dir=src.dir
								walk(K2,src.dir)

							K:Gowner = src
							K.dir=src.dir
							walk(K,src.dir)
							sleep(10)
							src.icon_state=""
							src.canattack=1
							return
						else
					/*		var/mob/k=new/obj/tentacle(src.loc)
							k.owner=src
							walk(k,src.dir)
							sleep(8)
							walk_towards(k,src,1)
							sleep(7)
							src.canattack = 1*/
							var/obj/K = new/obj/tentaclecustom2(src.loc)
							var/d=src.dir
							step(src,src.OppositeDirection())
							src.dir=d
							flick("punch",src)
							K:Gowner = src
							K:dir=src.dir

					if(src.ressurectiontype=="Nnoitra"&&src.ressurection)
						damage=src.attack*1.2
						damage+=damage*2.5

					if(src.ressurectiontype=="Yammy"&&src.ressurection==1||src.race=="Yammy Boss")
						damage=src.attack*1.1
						damage+=damage*3
						for(var/mob/M in oview(4,src))
							new/obj/crater(M.loc)
							flick("punch",src)
							var/d=M.dir
							M.allowmove=1
							var/L=src.overlays
							L += /obj/roar/r1
							L += /obj/roar/r2
							L += /obj/roar/r3
							L += /obj/roar/r4
							L += /obj/roar/r9
							L += /obj/roar/r6
							L += /obj/roar/r7
							L += /obj/roar/r8
							L += /obj/roar/r11
							L += /obj/roar/r22
							L += /obj/roar/r33
							L += /obj/roar/r44
							L += /obj/roar/r99
							L += /obj/roar/r66
							L += /obj/roar/r77
							L += /obj/roar/r88
							M.allowmove=1
							M.Slowed(1,3)
							spawn(2)
								step_away(M,d)
								M.Slowed(2,3)
							spawn(4)
								M.Slowed(3,3)
								step_away(M,d)
							spawn(5)
								L -= /obj/roar/r1
								L -= /obj/roar/r2
								L -= /obj/roar/r3
								L -= /obj/roar/r4
								L -= /obj/roar/r9
								L -= /obj/roar/r6
								L -= /obj/roar/r7
								L -= /obj/roar/r8
								L -= /obj/roar/r11
								L -= /obj/roar/r22
								L -= /obj/roar/r33
								L -= /obj/roar/r44
								L -= /obj/roar/r99
								L -= /obj/roar/r66
								L -= /obj/roar/r77
								L -= /obj/roar/r88
							M.allowmove=0
							if(damage <= 1)
								damage =rand(25,1000)
							if(prob(src.bodypassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the core!"
								M.BrokenCore()
							if(prob(src.armpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the arm!"
								M.BrokenArm()
							if(prob(src.legpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the leg!"
								M.BrokenLeg()
							if(prob(src.headpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the head!"
								M.BrokenHead()
							if(prob(src.stunpassive*3))
								view(src,8) << "<font color = red>[src] stunned [M]!"
								M.Freeze(12)
							if(!M.protected)Blood(M.x,M.y,M.z)

							spawn()M.Death(src,damage,rand(2,3))
							step_away(M,src)
							M.Facedir(src)
							M.moving=1
							spawn(1)
								M.moving=0
								step_away(M,src)
								M.Facedir(src)
								M.moving=1
								spawn(1)
									M.moving=0
									step_away(M,src)
									M.Facedir(src)
						sleep(20)
						src.canattack = 1
						return


					if(src.stype=="Maycustez" && src.inshikai)
					//	flick("punch23434",src)
						for(var/mob/M in get_step(src,src.dir))
							damage=src.reiatsu*2
							damage -= M.defence / 2
							damage=rand(damage*1.1,damage*1.3)
							if(damage <= 1)
								damage =rand(25,1000)

					if(src.ressurectiontype=="Volcanica")
						flick("punch",src)
						for(var/mob/M in get_step(src,src.dir))
							if(M.volcano)
								M.Volcano(src)
							damage=src.reiatsu*2
							damage -= M.defence / 2
							damage=rand(damage*1.1,damage*1.3)
							if(damage <= 1)
								damage =rand(25,1000)
							if(prob(src.bodypassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the core!"
								M.BrokenCore()
							if(prob(src.armpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the arm!"
								M.BrokenArm()
							if(prob(src.legpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the leg!"
								M.BrokenLeg()
							if(prob(src.headpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the head!"
								M.BrokenHead()
							if(prob(src.stunpassive*3))
								view(src,8) << "<font color = red>[src] stunned [M]!"
								M.Freeze(12)
							spawn()M.Death(src,damage,rand(0,2))
							if(!M.protected)Blood(M.x,M.y,M.z)
							sleep(7)
							src.canattack = 1
							return
						if(src.devoraron)
							src.shurikened+=1
							flick("Sword Slash1",src)
							var/K = new/mob/Devorar(usr.loc)
							K:owner = usr
							walk(K,usr.dir)
							if(src.etarget)
								walk_towards(K,src.etarget)
							if(src.shurikened>=5)
								sleep(20)
								src.shurikened=0
							sleep(2)
							src.canattack=1
							return
					if(src.ressurectiontype=="Skeleton")
						for(var/mob/M in oview(2))
				//		for(var/mob/M in get_step(src,src.dir))
							if(M.deathtouch)
								M.Deathtouch(src)
							damage=src.reiatsu*3.5
							if(damage <= 1)
								damage =rand(25,1000)
							if(prob(src.bodypassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the core!"
								M.BrokenCore()
							if(prob(src.armpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the arm!"
								M.BrokenArm()
							if(prob(src.legpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the leg!"
								M.BrokenLeg()
							if(prob(src.headpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the head!"
								M.BrokenHead()
							if(prob(src.stunpassive*3))
								view(src,8) << "<font color = red>[src] stunned [M]!"
								M.Freeze(12)
							spawn()M.Death(src,damage,rand(0,2))
							if(!M.protected)Blood(M.x,M.y,M.z)
							sleep(7)
							src.canattack = 1
							return
					if(src.ressurectiontype=="Ulq")
						if(!src.ulqgotsword)
							src.frozen=1
							sleep(4)
							flick("Sword Slash1",src)
							sleep(4)
							src.ulqgotsword=1
							src.canattack=1
							src.frozen=0
							src.overlays+=/obj/Zanpakutou/Ulq
							return
						if(src.ulqgotsword)
							flick("Sword Slash1",src)
							for(var/mob/M in get_step(src,src.dir))
								if(M.volcano)
									M.Volcano(src)
								damage=src.reiatsu*4
								damage -= M.defence / 2
								damage=rand(damage*0.8,damage*1.35)
								if(damage <= 1)
									damage =rand(25,1000)
								if(prob(src.bodypassive*3))
									view(src,8) << "<font color = red>[src] hit [M] in the core!"
									M.BrokenCore()
								if(prob(src.armpassive*3))
									view(src,8) << "<font color = red>[src] hit [M] in the arm!"
									M.BrokenArm()
								if(prob(src.legpassive*3))
									view(src,8) << "<font color = red>[src] hit [M] in the leg!"
									M.BrokenLeg()
								if(prob(src.headpassive*3))
									view(src,8) << "<font color = red>[src] hit [M] in the head!"
									M.BrokenHead()
								if(prob(src.stunpassive*3))
									view(src,8) << "<font color = red>[src] stunned [M]!"
									M.Freeze(12)

								spawn()M.Death(src,damage,rand(0,2))
								if(!M.protected)Blood(M.x,M.y,M.z)
								sleep(7)
								src.canattack = 1
								return
				if(src.stype == "Zaraki"||src.stype == "Ikkaku"||src.stype=="Ichigo"&&src.inshikai||src.stype=="Aizen" && src.inshikai||src.stype=="Aizen" && src.inbankai)
					if(src.client)
						if(src.swordon || src.firesworduse||src.dualwield)flick("Sword Slash1",src)
						if(!src.swordon&&!src.firesworduse&&!src.dualwield)flick("punch",src)
						for(var/mob/M in get_step(src,src.dir))
							if(src.inberserk)
								new/obj/crater(M.loc)
								M.moving=0
								step_away(M,src)
							if(M.volcano)
								M.Volcano(src)
							damage=src.attack*3.5
							if(src.type=="Ikkaku")
								damage*=2.5
							if(src.inberserk)
								damage+=damage
							if(src.stype=="Ikkaku"&&src.inbankai)
								damage=src.attack*4
							if(src.stype=="Zaraki")
								damage=src.attack*2.8
								var/obj/K = new/obj/ZarakiSlash/s1
								K:Gowner = usr
								K:dir = usr.dir
								var/obj/Ks = new/obj/ZarakiSlash/s2
								Ks:Gowner = usr
								Ks:dir = usr.dir
								var/obj/Ka = new/obj/ZarakiSlash/s3
								Ka:Gowner = usr
								Ka:dir = usr.dir
							damage -= M.defence / 2
							damage=rand(damage*2,damage*3)
							if(damage <= 1)
								damage =rand(25,1000)
							if(prob(src.bodypassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the core!"
								M.BrokenCore()
							if(prob(src.armpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the arm!"
								M.BrokenArm()
							if(prob(src.legpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the leg!"
								M.BrokenLeg()
							if(prob(src.headpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the head!"
								M.BrokenHead()
							if(prob(src.stunpassive*3))
								view(src,8) << "<font color = red>[src] stunned [M]!"
								M.Freeze(12)
							if(src.stype == "Aizen" && src.inbankai)
								var/randblindness=pick(0,1,2,3,4,5,6)
								if(randblindness==1)
									src.invisibility=10
									src.see_invisible=10
									spawn(15)
										src.invisibility=0
										src.see_invisible=2
							if(src.stype == "Aizen" && src.inshikai||src.stype == "Aizen" && src.inbankai)
								var/k=pick(1,2,3,4,5,6,7)
								if(k==1)
									M.aizenaffected=1
									M.sight &= ~SEE_MOBS
									spawn(20)
										M.aizenaffected=0
										M.sight =0
							if(M)
							//	if(src.stype=="Aizen")
							//		damage=damage*2.5
								spawn()M.Death(src,damage,rand(0,2))
								if(!M.protected)Blood(M.x,M.y,M.z)
							if(src.inshikai&&src.shikaidrain > 0)
								if(M.killable)src.shimastery(3)
							if(src.inbankai&&src.bankaidrain > 0)
								if(M.killable)src.banmastery(3)
						sleep(12)
						src.canattack = 1
						return
				if(src.stype=="Rangiku" && src.inshikai && src.client||src.stype=="Rangiku" && src.inbankai && src.client)
					flick("Sword Slash1",src)
					for(var/mob/M in world)
						if(M in src.smoked)
							if(M.smoking)
								if(M == src)
									src.smoked-=M
									M.smoking=0
									sleep(4)
									src.canattack=1
									return
								if(!M.protected)
									Blood(M.x,M.y,M.z)
									damage = round(src.attack * 3.9 - M.defence / 1.5)
									damage=rand(damage*2.1,damage*2.9)
								if(damage <= 0)
									damage = round(src.attack * 1.9 - M.defence / 3)
									damage =rand(damage*2.1,damage*2.9)
								//if(!M.protected)view(src,8) << "<b><font color = red>[src] cut [M] for [damage] damage!"
								spawn()M.Death(src,damage,rand(2,3))
								if(src.inshikai&&src.shikaidrain > 0)
									if(M.killable)src.shimastery(3)
								if(src.inbankai&&src.bankaidrain > 0)
									if(M.killable)src.banmastery(3)
					sleep(4)
					src.canattack=1
					return
				if(src.inshikai)

					if(src.stype == "Jiroubou" && src.inshikai && src.client)
						src.shurikened+=1
						flick("punch",src)
						var/K = new/mob/shuriken(usr.loc)
						K:owner = usr
						walk(K,usr.dir)
						if(src.hs)
							if(src.etarget)
								walk_towards(K,src.etarget)
						if(src.shurikened>=5)
							sleep(20)
							src.shurikened=0
						sleep(2)
						src.canattack=1
						return

					if(src.stype == "Ichimaru" && src.client)
						flick("Sword Slash1",src)
						for(var/mob/J in get_step(src,src.dir))
							if(J.volcano)
								J.Volcano(src)
							damage = round(src.attack*2)
							damage+=damage*1.5
							damage -= J.defence / 2.5
							if(damage <= 1)
								damage =rand(25,1000)
							if(J.enemy)
								src.hollowprotection = 1

							spawn()J.Death(src,damage,rand(1,2))
						sleep(12)
						src.canattack = 1
						return

					if(src.stype == "Unohana" && src.client)
						flick("Sword Slash1",src)
						for(var/mob/J in get_step(src,src.dir))
							if(J.volcano)
								J.Volcano(src)
							damage = round(src.attack*2)
							damage+=damage*2
							damage -= J.defence / 2
							if(damage <= 1)
								damage =rand(25,1000)
							if(prob(src.bodypassive*3))
								view(src,8) << "<font color = red>[src] hit [J] in the core!"
								J.BrokenCore()
							if(prob(src.armpassive*3))
								view(src,8) << "<font color = red>[src] hit [J] in the arm!"
								J.BrokenArm()
							if(prob(src.legpassive*3))
								view(src,8) << "<font color = red>[src] hit [J] in the leg!"
								J.BrokenLeg()
							if(prob(src.headpassive*3))
								view(src,8) << "<font color = red>[src] hit [J] in the head!"
								J.BrokenHead()
							if(prob(src.stunpassive*3))
								view(src,8) << "<font color = red>[src] stunned [J]!"
								J.Freeze(12)
							if(J.enemy)
								src.hollowprotection = 1

							spawn()J.Death(src,damage,rand(1,2))
						sleep(12)
						src.canattack = 1
						return



					if(src.stype == "Kira" && src.client)
						flick("Sword Slash1",src)
						for(var/mob/J in oview(1))
							if(J.volcano)
								J.Volcano(src)
							if(!J.protected)Blood(J.x,J.y,J.z)
							damage = round(src.attack*3.5)
							damage+=rand(damage/1.5,damage/1.8)
							damage -= J.defence / 2
							if(damage <= 1)
								damage =rand(25,1000)
							if(prob(src.bodypassive*3))
								view(src,8) << "<font color = red>[src] hit [J] in the core!"
								J.BrokenCore()
							if(prob(src.armpassive*3))
								view(src,8) << "<font color = red>[src] hit [J] in the arm!"
								J.BrokenArm()
							if(prob(src.legpassive*3))
								view(src,8) << "<font color = red>[src] hit [J] in the leg!"
								J.BrokenLeg()
							if(prob(src.headpassive*3))
								view(src,8) << "<font color = red>[src] hit [J] in the head!"
								J.BrokenHead()
							if(prob(src.stunpassive*3))
								view(src,8) << "<font color = red>[src] stunned [J]!"
								J.Freeze(12)
							if(!J.protected)
								if(src.kirashi == 1)
									src.random = rand(1,2)
									if(src.random == 1)
										J.Slowed(1,70)
										src.shimastery(3)
								if(src.kirashi == 2)
									src.random = rand(1,3)
									if(src.random == 1)
										J.Slowed(2,130)
									if(src.random == 2)
										J.Slowed(1,130)
							//if(!J.protected)view(src,8) << "<b><font color = red>[src] attacked [J] for [damage] damage!"

							spawn()J.Death(src,damage,rand(1,3))
						sleep(15)
						src.canattack = 1
						return
					if(src.stype == "Hinamori" && src.client)
						if(src.rei <= 50)
						//	src << "<b>Your rei is too low!"
							sleep(2)
							src.canattack=1
							return
					//	src.rei -= 150

						if(!src.usinghinafi)
							flick("Sword Slash1",src)
							for(var/mob/M in get_step(src,src.dir))
								damage=damage*1.7
								if(damage <= 1)
									damage =rand(25,1000)
								spawn()M.Death(src,damage,rand(0,1))
								damage=src.reiatsu*1.2

						else

							flick("Sword Slash1",src)
							if(!src.burst)
								var/obj/M = new/obj/hina(src.loc)
								M:Gowner = src
								walk(M,src.dir)
								if(src.hs)
									if(src.etarget)
										walk_towards(M,src.etarget)
							if(src.burst)
								src.Burst()
						src.shimastery(2)


				if(src.stype == "Ichimaru" && src.inbankai && src.client)
					flick("Sword Slash1",src)
					for(var/mob/J in get_step(src,src.dir))
						if(J.volcano)
							J.Volcano(src)
						damage = round(src.attack*2.5)
						damage+=damage*1.7
						damage -= J.defence / 2.5
						if(damage <= 1)
							damage =rand(25,1000)
						if(J.enemy)
							src.hollowprotection = 1

						spawn()J.Death(src,damage,rand(1,2))
					sleep(12)
					src.canattack = 1
					return

				if(src.stype == "Unohana" && src.inbankai && src.client)
					flick("Sword Slash1",src)
					for(var/mob/J in get_step(src,src.dir))
						if(J.volcano)
							J.Volcano(src)
						damage = round(src.attack*2.5)
						damage+=damage*2.5
						damage -= J.defence / 2
						if(damage <= 1)
							damage =rand(25,1000)
						if(prob(src.bodypassive*3))
							view(src,8) << "<font color = red>[src] hit [J] in the core!"
							J.BrokenCore()
						if(prob(src.armpassive*3))
							view(src,8) << "<font color = red>[src] hit [J] in the arm!"
							J.BrokenArm()
						if(prob(src.legpassive*3))
							view(src,8) << "<font color = red>[src] hit [J] in the leg!"
							J.BrokenLeg()
						if(prob(src.headpassive*3))
							view(src,8) << "<font color = red>[src] hit [J] in the head!"
							J.BrokenHead()
						if(prob(src.stunpassive*3))
							view(src,8) << "<font color = red>[src] stunned [J]!"
							J.Freeze(12)
						if(J.enemy)
							src.hollowprotection = 1

						spawn()J.Death(src,damage,rand(1,2))
					sleep(12)
					src.canattack = 1
					return

				if(src.stype == "Pheonix" && src.client)
					if(src.rei <= 150)
						src << "<b>Your rei is too low!"
						sleep(7)
						src.canattack=1
						return
					src.rei -= 150
					flick("Sword Slash1",src)
					var/obj/M = new/obj/PheBall(src.loc)
					M:Gowner = src
					walk(M,src.dir)
				if(src.stype=="Shusuke" && src.client)
					flick("Sword Slash1",src)
					var/K = new/obj/AoePheonix2(src.loc)
					K:Gowner = src
					K:dir = src.dir
					step(K,src.dir)
					step(K,src.dir)
					step(K,src.dir)
					step(K,src.dir)
					step(K,src.dir)
				if(src.stype == "Kira" && src.inbankai && src.client)
					flick("Sword Slash1",src)
					for(var/mob/J in oview(2))
						if(J.volcano)
							J.Volcano(src)
						if(!J.protected)Blood(J.x,J.y,J.z)
						damage = round(src.attack*3.5)
						damage+=rand(damage/1.8,damage/1.8)
						damage -= J.defence / 2
						if(damage <= 1)
							damage =rand(25,1000)
						if(prob(src.bodypassive*3))
							view(src,8) << "<font color = red>[src] hit [J] in the core!"
							J.BrokenCore()
						if(prob(src.armpassive*3))
							view(src,8) << "<font color = red>[src] hit [J] in the arm!"
							J.BrokenArm()
						if(prob(src.legpassive*3))
							view(src,8) << "<font color = red>[src] hit [J] in the leg!"
							J.BrokenLeg()
						if(prob(src.headpassive*3))
							view(src,8) << "<font color = red>[src] hit [J] in the head!"
							J.BrokenHead()
						if(prob(src.stunpassive*3))
							view(src,8) << "<font color = red>[src] stunned [J]!"
							J.Freeze(12)
						if(!J.protected)
							if(src.kirashi == 2)
								src.random = rand(1,3)
								src.banmastery(3)
								if(src.random == 1)
									J.Slowed(2,130)
								if(src.random == 2)
									J.Slowed(3,130)
								if(src.random == 3)
									J.Slowed(2,130)
						//if(!J.protected)view(src,8) << "<b><font color = red>[src] attacked [J] for [damage] damage!"

						spawn()J.Death(src,damage,rand(0,4))
					sleep(12)
					src.canattack = 1
					return


				if(src.stype == "Byakuya" && src.inbankai&&src.safezone&&src.client||src.key=="Dragonpearl123"&&src.inPeaceBoost)
					flick("punch",src)
					if(src.dir==EAST)
						var/obj/Petalsword/A = new /obj/Petalsword(locate(src.x+1,src.y,src.z))
						A.Gowner=usr
						A.dir=src.dir
						var/obj/Petalsword/Aa = new /obj/Petalsword(locate(src.x+2,src.y,src.z))
						Aa.Gowner=usr
						Aa.dir=src.dir
						var/obj/Petalsword/Aaa = new /obj/Petalsword(locate(src.x+3,src.y,src.z))
						Aaa.Gowner=usr
						Aaa.dir=src.dir
					if(src.dir==WEST)
						var/obj/Petalsword/A = new /obj/Petalsword(locate(src.x-1,src.y,src.z))
						A.Gowner=usr
						A.dir=src.dir
						var/obj/Petalsword/Aa = new /obj/Petalsword(locate(src.x-2,src.y,src.z))
						Aa.Gowner=usr
						Aa.dir=src.dir
						var/obj/Petalsword/Aaa = new /obj/Petalsword(locate(src.x-3,src.y,src.z))
						Aaa.Gowner=usr
						Aaa.dir=src.dir
					if(src.dir==SOUTHEAST)
						var/obj/Petalsword/A = new /obj/Petalsword(locate(src.x+1,src.y-1,src.z))
						A.Gowner=usr
						A.dir=src.dir
						var/obj/Petalsword/Aa = new /obj/Petalsword(locate(src.x+2,src.y-2,src.z))
						Aa.Gowner=usr
						Aa.dir=src.dir
						var/obj/Petalsword/Aaa = new /obj/Petalsword(locate(src.x+3,src.y-3,src.z))
						Aaa.Gowner=usr
						Aaa.dir=src.dir
					if(src.dir==SOUTHWEST)
						var/obj/Petalsword/A = new /obj/Petalsword(locate(src.x-1,src.y-1,src.z))
						A.Gowner=usr
						A.dir=src.dir
						var/obj/Petalsword/Aa = new /obj/Petalsword(locate(src.x-2,src.y-2,src.z))
						Aa.Gowner=usr
						Aa.dir=src.dir
						var/obj/Petalsword/Aaa = new /obj/Petalsword(locate(src.x-3,src.y-3,src.z))
						Aaa.Gowner=usr
						Aaa.dir=src.dir
					if(src.dir==NORTHEAST)
						var/obj/Petalsword/A = new /obj/Petalsword(locate(src.x+1,src.y+1,src.z))
						A.Gowner=usr
						A.dir=src.dir
						var/obj/Petalsword/Aa = new /obj/Petalsword(locate(src.x+2,src.y+2,src.z))
						Aa.Gowner=usr
						Aa.dir=src.dir
						var/obj/Petalsword/Aaa = new /obj/Petalsword(locate(src.x+3,src.y+3,src.z))
						Aaa.Gowner=usr
						Aaa.dir=src.dir
					if(src.dir==NORTHWEST)
						var/obj/Petalsword/A = new /obj/Petalsword(locate(src.x-1,src.y+1,src.z))
						A.Gowner=usr
						A.dir=src.dir
						var/obj/Petalsword/Aa = new /obj/Petalsword(locate(src.x-2,src.y+2,src.z))
						Aa.Gowner=usr
						Aa.dir=src.dir
						var/obj/Petalsword/Aaa = new /obj/Petalsword(locate(src.x-3,src.y+3,src.z))
						Aaa.Gowner=usr
						Aaa.dir=src.dir
					if(src.dir==SOUTH)
						var/obj/Petalsword/A = new /obj/Petalsword(locate(src.x,src.y-1,src.z))
						A.Gowner=usr
						A.dir=src.dir
						var/obj/Petalsword/Aa = new /obj/Petalsword(locate(src.x,src.y-2,src.z))
						Aa.Gowner=usr
						Aa.dir=src.dir
						var/obj/Petalsword/Aaa = new /obj/Petalsword(locate(src.x,src.y-3,src.z))
						Aaa.Gowner=usr
						Aaa.dir=src.dir
					if(src.dir==NORTH)
						var/obj/Petalsword/A = new /obj/Petalsword(locate(src.x,src.y+1,src.z))
						A.Gowner=usr
						A.dir=src.dir
						var/obj/Petalsword/Aa = new /obj/Petalsword(locate(src.x,src.y+2,src.z))
						Aa.Gowner=usr
						Aa.dir=src.dir
						var/obj/Petalsword/Aaa = new /obj/Petalsword(locate(src.x,src.y+3,src.z))
						Aaa.Gowner=usr
						Aaa.dir=src.dir
					src.health-=round(src.reiatsu)
					src.wound+=2
					if(src.health<0||src.wound>200)
						src.Freeze(30)
					sleep(20)
					src.canattack=1
					return
				if(src.stype == "Hisagi" && src.inbankai && src.client||src.stype == "Hisagi" && src.inshikai && src.client)
					for(var/obj/hisagi/D in view(8,src))
						damage = src.attack*3.5
						damage+=damage*2.5
						if(D.Gowner==src)
							src.canattack=1
							return
					src.overlays-=/obj/Zanpakutou/Hisagi2
					if(src.stype == "Hisagi" && src.inbankai)
						src.overlays-=/obj/Zanpakutou/Hisagi
					var/obj/hisagi/A = new /obj/hisagi(usr.loc)
					A.Gowner=usr
					walk(A,usr.dir,0)
					sleep(12)
					src.overlays+=/obj/Zanpakutou/Hisagi2
					if(src.stype == "Hisagi" && src.inbankai)
						src.overlays+=/obj/Zanpakutou/Hisagi
					src.canattack=1
					return
				if(src.stype == "Kaiens" && src.inbankai && src.client||src.stype == "Kaiens" && src.inshikai && src.client)
					if(src.dir == NORTH||src.dir==SOUTH)
						var/obj/weakwave/Aa = new /obj/weakwave/
						var/obj/weakwave/Ba = new /obj/weakwave/
						var/obj/weakwave/Ca = new /obj/weakwave/
						Aa.loc = locate(src.x, src.y, src.z)
						Ca.loc = locate(src.x-1, src.y, src.z)
						Ba.loc = locate(src.x+1, src.y, src.z)
						Aa.dir = src.dir
						Ba.dir = src.dir
						Ca.dir = src.dir
						Aa.Gowner = src
						Ba.Gowner = src
						Ca.Gowner = src
						walk(Aa,src.dir)
						walk(Ca,src.dir)
						walk(Ba,src.dir)
					if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST||src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
						var/obj/weakwave/A = new /obj/weakwave/
						var/obj/weakwave/B = new /obj/weakwave/
						var/obj/weakwave/C = new /obj/weakwave/
						A.loc = locate(src.x, src.y+1, src.z)
						C.loc = locate(src.x, src.y, src.z)
						B.loc = locate(src.x, src.y-1, src.z)
						A.Gowner = src
						B.Gowner = src
						C.Gowner = src
						A.dir = src.dir
						B.dir = src.dir
						C.dir = src.dir
						walk(A,src.dir)
						walk(C,src.dir)
						walk(B,src.dir)
					sleep(15)
					src.canattack=1
					return
				if(src.stype == "Hinamori" && src.inbankai && src.client)
					if(src.rei <= 50)
					//	src << "<b>Your rei is too low!"
						sleep(7)
						src.canattack=1
						return
				//	src.rei -= 150
					src.banmastery(4)


					if(!src.usinghinafi)
						flick("Sword Slash1",src)
						for(var/mob/M in get_step(src,src.dir))
							damage=damage*1.7
							if(damage <= 1)
								damage =rand(25,1000)
							spawn()M.Death(src,damage,rand(0,1))
							damage=src.reiatsu*1.2

					else if(src.usinghinafi)
						if(!src.burst)
							var/obj/M = new/obj/hina2(src.loc)
							M:Gowner = src
							walk(M,src.dir)
							if(src.hs)
								if(src.etarget)
									walk_towards(M,src.etarget)
						if(src.burst)
							src.Burst()
				if(src.stype=="Sword Multiplier" && src.client)
					src.shurikened+=1
					flick("punch",src)
					var/K = new/mob/Floatswordhome(usr.loc)
					K:owner = usr
					walk(K,usr.dir)
					if(src.etarget)
						walk_towards(K,src.etarget)
					if(src.shurikened>=6)
						sleep(12)
						src.shurikened=0
					sleep(2)
					src.canattack=1
					return
				if(src.stype == "Jiroubou" && src.inbankai && src.client)
					src.shurikened+=1
					flick("punch",src)
					var/K = new/mob/shuriken(usr.loc)
					K:owner = usr
					walk(K,usr.dir)
					if(src.hs)
						if(src.etarget)
							walk_towards(K,src.etarget)
					if(src.shurikened>=6)
						sleep(12)
						src.shurikened=0
					sleep(2)
					src.canattack=1
					return
				damage+=rand(damage/2,damage/1.5)
				if(src.stype=="Shusuke" && src.client)
					damage+=damage*2.9
				if(src.ressurectiontype=="Ulq")
					damage=damage*2.5
				damage+=src.swordD
				if(damage <= 1)
					damage =rand(25,1000)
				if(src.stype == "Mayuri"&&src.inbankai && src.client)
					if(src.rei <= 75)
						src << "<b>Your rei is too low!"
						sleep(6)
						src.canattack=1
						return
					src.rei -= 75
					damage = round(src.reiatsu/1.2)
					damage+=rand(damage/2,damage/1.2)
					damage+=src.swordD
					if(damage <= 1)
						damage =rand(25,1000)
					spawn(1)
						var/K = new/obj/mayuripoison(src.loc)
						step(K,src.dir)
						for(var/mob/M in K:loc)
							if(prob(src.bodypassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the core!"
								M.BrokenCore()
							if(prob(src.armpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the arm!"
								M.BrokenArm()
							if(prob(src.stunpassive*3))
								view(src,8) << "<font color = red>[src] stunned [M]!"
								M.Freeze(2 SECONDS)
						//	damage -= M.defence / 2 + 2500
							damage = src.reiatsu * 10
							if(damage <= 1)
								damage =rand(900,1000)
							//if(!M.protected)view(src,8) << "<b><font color = red>[src] attacked [M] for [damage] damage!"
							if(src.lethal)
								M.MPoisoned(src)

							spawn()M.Death(src,damage,rand(1,3))
							src.random = rand(1,100)
							if(src.random <= 60&&src.random > 40)
								M.Freeze(25)
								if(M.killable)src.banmastery(4)
							if(src.random > 65)
								M.Slowed(9,35)
								if(M.killable)src.banmastery(4)
						spawn(1)
							del K
							var/B = new/obj/mayuripoison(src.loc)
							step(B,src.dir)
							var/A = new/obj/mayuripoison(src.loc)
							step(A,src.dir)
							step(A,src.dir)
							for(var/mob/M in A:loc)
								//damage -= M.defence / 2 + 2500
								damage = src.reiatsu* 3
								if(damage < 1)
									damage =rand(900,1000)
								//if(!M.protected)view(src,8) << "<b><font color = red>[src] attacked [M] for [damage] damage!"
								if(src.lethal)
									M.MPoisoned(src)

								if(!M.protected)spawn()M.Death(src,damage,rand(1,3))
								src.random = rand(1,100)
								if(src.random <= 60&&src.random > 40)
									M.Freeze(35)
									if(M.killable)src.banmastery(35)
								if(src.random > 65)
									M.Slowed(5,35)
									if(M.killable)src.banmastery(35)
						/*
							spawn(1)
								del A
								var/As = new/obj/mayuripoison(src.loc)
								step(As,src.dir)
								step(As,src.dir)
								var/W = new/obj/mayuripoison(src.loc)
								step(W,src.dir)
								step(W,src.dir)
								step(W,src.dir)
								for(var/mob/M in W:loc)
									damage -= M.defence / 2
									if(damage < 1)
										damage =rand(25,1000)
									//if(!M.protected)view(src,8) << "<b><font color = red>[src] attacked [M] for [damage] damage!"
									if(src.lethal)
										M.MPoisoned(src)

									if(!M.protected)spawn()M.Death(src,damage,rand(1,3))
									src.random = rand(1,100)
									if(src.random <= 60&&src.random > 40)
										M.Freeze(35)
										if(M.killable)src.banmastery(35)
									if(src.random > 65)
										M.Slowed(5,35)
										if(M.killable)src.banmastery(35)
								spawn(1)
									del A
									del As
									del W
									del B*/
					sleep(15)
					src.canattack = 1
					return
				if(src.stype=="Stinger"&&src.inshikai && src.client)
					flick("punch",src)
					for(var/mob/M in get_step(src,src.dir))
						if(M.volcano)
							M.Volcano(src)
						damage = round(src.attack*2)
						damage+=damage*2
						if(M.inoueshield)
							M.inoueshield=0
							view(8) << "<b>[M]: Blood Mist Shield!"
							var/obj/Maf = new/obj/bloodshield(M.loc)
							Maf:owner = M
							M.ShieldCool()
							flick("new",Maf)
							Maf.dir=get_dir(Maf,src)
							spawn(10)
							del Maf
						if(M.protected)
							sleep(5)
							src.canattack=1
							return
						damage -= M.defence / 2
						var/woundy=rand(0,1)
						if(damage <= 1)
							damage =rand(25,1000)
						if(M.stung!=src)
							spawn(1)
							if(!M.protected)M.stung=src
						if(M.stung==src)
						//	damage=damage*1.2
							M.overlays-=/obj/stinger9
							M.stung=0
							woundy=rand(1,3)
							if(src.inshikai&&src.shikaidrain > 0)
								if(M.killable)src.shimastery(5)
						if(prob(src.bodypassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the core!"
							M.BrokenCore()
						if(prob(src.armpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the arm!"
							M.BrokenArm()
						if(prob(src.legpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the leg!"
							M.BrokenLeg()
						if(prob(src.headpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the head!"
							M.BrokenHead()
						if(prob(src.stunpassive*3))
							view(src,8) << "<font color = red>[src] stunned [M]!"
							M.Freeze(12)
						if(M.enemy)
							src.hollowprotection = 1
						M.overlays+=/obj/stinger
						spawn(1)
							M.overlays-=/obj/stinger
							M.overlays+=/obj/stinger2
							spawn(1)
								M.overlays-=/obj/stinger2
								M.overlays+=/obj/stinger3
								spawn(1)
									M.overlays-=/obj/stinger3
									M.overlays+=/obj/stinger4
									spawn(1)
										M.overlays-=/obj/stinger4
										M.overlays+=/obj/stinger5
										spawn(1)
											M.overlays-=/obj/stinger5
											M.overlays+=/obj/stinger6
											spawn(1)
												M.overlays-=/obj/stinger6
												M.overlays+=/obj/stinger7
												spawn(1)
													M.overlays-=/obj/stinger7
													M.overlays+=/obj/stinger8
													spawn(1)
														M.overlays-=/obj/stinger8
														M.overlays+=/obj/stinger9
														if(!M.stung)M.overlays-=/obj/stinger9
						if(!M.protected)Blood(M.x,M.y,M.z)
						spawn()M.Death(src,damage,woundy)
					sleep(8)
					src.canattack = 1
					sleep(1)
					return
				if((src.infull||src.inafull)&&src.ftype=="Wings")
					goto wing1

			/*	if(src.stype == "Yumichika" &&src.inbankai)
					for(var/mob/M in get_step(src,src.dir))
						damage +=(src.reiatsu+src.attack)*2
						if(damage <= 1)
							damage =rand(25,1000)
						if(prob(src.bodypassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the core!"
							M.BrokenCore()
						if(prob(src.armpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the arm!"
							M.BrokenArm()
						if(prob(src.legpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the leg!"
							M.BrokenLeg()
						if(prob(src.headpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the head!"
							M.BrokenHead()
						spawn()M.Death(src,damage,rand(0,2))
						if(src.inshikai&&src.shikaidrain > 0)
							if(M.killable)src.shimastery(2)
						if(src.inbankai&&src.bankaidrain > 0)
							if(M.killable)src.banmastery(2)
						sleep(5)
					sleep(2 SECONDS)
					src.canattack=1 */

				if(src.stype=="Kensei"&&src.inbankai && src.client)
					flick("punch",src)
					for(var/mob/M in get_step(src,src.dir))
						if(M.volcano)
							M.Volcano(src)
						if(M.protected)
							sleep(8)
							src.canattack=1
							return
						damage +=(src.reiatsu+src.attack)*4
						if(damage <= 1)
							damage =rand(25,1000)
						if(prob(src.bodypassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the core!"
							M.BrokenCore()
						if(prob(src.armpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the arm!"
							M.BrokenArm()
						if(prob(src.legpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the leg!"
							M.BrokenLeg()
						if(prob(src.headpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the head!"
							M.BrokenHead()
						if(prob(src.stunpassive*3))
							view(src,8) << "<font color = red>[src] stunned [M]!"
							M.Freeze(12)
						spawn()M.Death(src,damage,rand(0,2))
						if(src.inshikai&&src.shikaidrain > 0)
							if(M.killable)src.shimastery(2)
						if(src.inbankai&&src.bankaidrain > 0)
							if(M.killable)src.banmastery(2)
					if(src.key=="Natsu375")
						sleep(1)
					else
						sleep(4)
					src.canattack = 1
					return
				wing1
				if(src.stype=="Lightning" && src.client)
					flick("punch",src)
					for(var/mob/M in get_step(src,src.dir))
						if(M.volcano)
							M.Volcano(src)
						if(M.protected)
							sleep(8)
							src.canattack=1
							return
						damage +=src.reiatsu*2
						if(damage <= 1)
							damage =rand(25,1000)
						if(prob(src.bodypassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the core!"
							M.BrokenCore()
						if(prob(src.armpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the arm!"
							M.BrokenArm()
						if(prob(src.legpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the leg!"
							M.BrokenLeg()
						if(prob(src.headpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the head!"
							M.BrokenHead()
						if(prob(src.stunpassive*3))
							view(src,8) << "<font color = red>[src] stunned [M]!"
							M.Freeze(12)
						spawn()M.Death(src,damage,rand(0,2))
						if(src.inshikai&&src.shikaidrain > 0)
							if(M.killable)src.shimastery(2)
						if(src.inbankai&&src.bankaidrain > 0)
							if(M.killable)src.banmastery(2)
					sleep(4)
					src.canattack = 1
					return
					if(src.stype=="Kido Class" && src.client)
						flick("punch",src)
						for(var/mob/M in get_step(src,src.dir))
							damage = src.reiatsu*1.8
							if(prob(src.bodypassive*6))
								view(src,8) << "<font color = red>[src] hit [M] in the core!"
								M.BrokenCore()
							if(prob(src.armpassive*6))
								view(src,8) << "<font color = red>[src] hit [M] in the arm!"
								M.BrokenArm()
							if(prob(src.legpassive*6))
								view(src,8) << "<font color = red>[src] hit [M] in the leg!"
								M.BrokenLeg()
							if(prob(src.headpassive*6))
								view(src,8) << "<font color = red>[src] hit [M] in the head!"
								M.BrokenHead()
							if(prob(src.stunpassive*6))
								view(src,8) << "<font color = red>[src] stunned [M]!"
							sleep(4)
							src.canattack=1
							return
				if((src.infull||src.inafull)&&src.ftype=="Wings")
					goto wing2
				if(src.stype=="Kensei"&&(src.inshikai||!src.inbankai))
					flick("punch",src)
					for(var/mob/M in get_step(src,src.dir))
						if(M.volcano)
							M.Volcano(src)
						if(M.protected)
							sleep(8)
							src.canattack=1
							return
						damage +=src.reiatsu+src.attack*2.5
						if(damage <= 1)
							damage =rand(25,1000)
						if(prob(src.bodypassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the core!"
							M.BrokenCore()
						if(prob(src.armpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the arm!"
							M.BrokenArm()
						if(prob(src.legpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the leg!"
							M.BrokenLeg()
						if(prob(src.headpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the head!"
							M.BrokenHead()
						if(prob(src.stunpassive*3))
							view(src,8) << "<font color = red>[src] stunned [M]!"
							M.Freeze(12)
						spawn()M.Death(src,damage,rand(0,2))
						if(src.inshikai&&src.shikaidrain > 0)
							if(M.killable)src.shimastery(2)
						if(src.inbankai&&src.bankaidrain > 0)
							if(M.killable)src.banmastery(2)
					if(src.key=="Natsu375")
						sleep(2)
					else
						sleep(8)
					src.canattack = 1
					return
				wing2
				if(src.stype=="Stinger"&&src.inbankai && src.client)
					flick("punch",src)
					for(var/mob/M in get_step(src,src.dir))
						if(M.volcano)
							M.Volcano(src)
						damage = round(src.attack*2.5)
						damage+=damage*2.5
						if(M.inoueshield)
							M.inoueshield=0
							view(8) << "<b>[M]: Blood Mist Shield!"
							var/obj/Maf = new/obj/bloodshield(M.loc)
							Maf:owner = M
							M.ShieldCool()
							flick("new",Maf)
							Maf.dir=get_dir(Maf,src)
							spawn(10)
							del Maf
						if(M.protected)
							sleep(5)
							src.canattack=1
							return
						damage -= M.defence / 2
						var/woundy=rand(1,2)
						if(damage <= 1)
							damage =rand(25,1000)
						if(M.stung!=src)
							spawn(1)
							if(!M.protected)M.stung=src
						if(M.stung==src)
						//	damage=damage*1.2
							M.overlays-=/obj/stinger9
							M.stung=0
							woundy=rand(2,4)
							if(src.inshikai&&src.shikaidrain > 0)
								if(M.killable)src.shimastery(5)
						if(prob(src.bodypassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the core!"
							M.BrokenCore()
						if(prob(src.armpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the arm!"
							M.BrokenArm()
						if(prob(src.legpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the leg!"
							M.BrokenLeg()
						if(prob(src.headpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the head!"
							M.BrokenHead()
						if(prob(src.stunpassive*3))
							view(src,8) << "<font color = red>[src] stunned [M]!"
							M.Freeze(12)
						if(M.enemy)
							src.hollowprotection = 1
						M.overlays+=/obj/stinger
						spawn(1)
							M.overlays-=/obj/stinger
							M.overlays+=/obj/stinger2
							spawn(1)
								M.overlays-=/obj/stinger2
								M.overlays+=/obj/stinger3
								spawn(1)
									M.overlays-=/obj/stinger3
									M.overlays+=/obj/stinger4
									spawn(1)
										M.overlays-=/obj/stinger4
										M.overlays+=/obj/stinger5
										spawn(1)
											M.overlays-=/obj/stinger5
											M.overlays+=/obj/stinger6
											spawn(1)
												M.overlays-=/obj/stinger6
												M.overlays+=/obj/stinger7
												spawn(1)
													M.overlays-=/obj/stinger7
													M.overlays+=/obj/stinger8
													spawn(1)
														M.overlays-=/obj/stinger8
														M.overlays+=/obj/stinger9
														if(!M.stung)M.overlays-=/obj/stinger9
						if(!M.protected)Blood(M.x,M.y,M.z)
						spawn()M.Death(src,damage,woundy)
					sleep(8)
					src.canattack = 1
					sleep(1)
					return
				if(src.stype=="Renji"&&src.inbankai && src.client)
					src.extending=1
					src.overlays-=/obj/zabimaru/body/up/b1
					src.overlays-=/obj/zabimaru/body/up/b2
					src.overlays-=/obj/zabimaru/body/up/b3
					src.overlays-=/obj/zabimaru/body/up/b4
					src.overlays-=/obj/zabimaru/body/up/b5
					src.overlays-=/obj/zabimaru/body/up/b6
					src.overlays-=/obj/zabimaru/body/up/b7
					var/mob/k=new/mob/zabimaru(src.loc)
					k.owner=src
					walk(k,src.dir)
					sleep(8)
					walk_towards(k,src,1)
					sleep(7)
					src.canattack = 1
					src.extending=0
					damage+=damage*3.5
					if(src.inbankai)
						src.overlays+=/obj/zabimaru/body/up/b1
						src.overlays+=/obj/zabimaru/body/up/b2
						src.overlays+=/obj/zabimaru/body/up/b3
						src.overlays+=/obj/zabimaru/body/up/b4
						src.overlays+=/obj/zabimaru/body/up/b5
						src.overlays+=/obj/zabimaru/body/up/b6
						src.overlays+=/obj/zabimaru/body/up/b7
					return
				if(src.newkomaboss==1)
					var/obj/k=new/obj/craters/smoke(src.loc)
					k.Gowner=src
					walk(k,src.dir)
					sleep(7)
					src.canattack=1
					return
				if(src.inshikai&&src.stype == "Kommamaru"&&src.newkomaboss==0 && src.client)
					damage=src.attack*1.1
					damage+=damage*2
					flick("Sword Slash1",src)
					var/obj/k=new/obj/craters/smoke(src.loc)
					k.Gowner=src
					walk(k,src.dir)
					if(src.stype == "Kommamaru")
						if(src.inshikai&&src.shikaidrain > 0)
							src.shimastery(5)
					if(src.vasto)
						sleep(7)
						src.canattack=1
						return
					sleep(20)
					src.canattack = 1
					return

				if(src.inbankai&&src.stype == "Kommamaru"&&src.newkomaboss==0 && src.client)
					damage=src.attack*1.3
					damage+=damage*4
					for(var/mob/M in oview(2,src))
						flick("Sword Slash1",src)
						var/d=M.dir
						M.allowmove=1
						step_away(M,d)
						step_away(M,d)
						M.allowmove=0
						if(damage <= 1)
							damage =rand(25,1000)
						if(prob(src.bodypassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the core!"
							M.BrokenCore()
						if(prob(src.armpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the arm!"
							M.BrokenArm()
						if(prob(src.legpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the leg!"
							M.BrokenLeg()
						if(prob(src.headpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the head!"
							M.BrokenHead()
						if(prob(src.stunpassive*3))
							view(src,8) << "<font color = red>[src] stunned [M]!"
							M.Freeze(12)
						if(!M.protected)Blood(M.x,M.y,M.z)

						spawn()M.Death(src,damage,rand(2,3))
						if(src.stype == "Kommamaru")
							if(src.inbankai&&src.bankaidrain > 0)
								if(M.killable)src.banmastery(15)
					if(src.vasto)
						sleep(15)
						src.canattack=1
						return
					sleep(20)
					src.canattack = 1
					return
				if(src.ikkakushikai)
					for(var/mob/M in get_step(src,src.dir))
						flick("Sword Slash1",src)
						if(M.volcano)
							M.Volcano(src)
						damage -= M.defence / 2
						if(damage <= 1)
							damage =rand(25,1000)
						//if(!M.protected)view(src,8) << "<b><font color = red>[src] attacked [M] for [damage] damage!"
						if(prob(src.bodypassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the core!"
							M.BrokenCore()
						if(prob(src.armpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the arm!"
							M.BrokenArm()
						if(prob(src.legpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the leg!"
							M.BrokenLeg()
						if(prob(src.headpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the head!"
							M.BrokenHead()
						if(prob(src.stunpassive*3))
							view(src,8) << "<font color = red>[src] stunned [M]!"
							M.Freeze(12)
						if(M.enemy)
							src.hollowprotection = 1

						spawn()M.Death(src,damage,rand(0,1))
						if(!M.protected)Blood(M.x,M.y,M.z)
						if(src.stype == "Ikkaku")
							if(src.inshikai&&src.shikaidrain > 0)
								if(M.killable)src.shimastery(4)
						sleep(12)
						src.canattack = 1
						return
					flick("punch",src)
					src.frozen = 1
					spawn(1)
						var/K = new/obj/ikkakus1(src.loc)
						step(K,src.dir)
						for(var/mob/M in K:loc)
							if(M.volcano)
								M.Volcano(src)
							damage -= M.defence / 2
							if(damage <= 1)
								damage =rand(25,1000)
							var/far = M.dir
							step(M,K:dir)
							M.dir = far

							spawn()M.Death(src,damage,rand(0,1))
							if(!M.protected)Blood(M.x,M.y,M.z)
							if(src.stype == "Ikkaku")
								if(src.inshikai&&src.shikaidrain > 0)
									if(M.killable)src.shimastery(4)
						spawn(1)
							del K
							var/B = new/obj/ikkakus2(src.loc)
							step(B,src.dir)
							var/A = new/obj/ikkakus1(src.loc)
							step(A,src.dir)
							step(A,src.dir)
							for(var/mob/M in A:loc)
								if(M.volcano)
									M.Volcano(src)
								damage -= M.defence / 2
								if(damage < 1)
									damage =rand(25,1000)
								//if(!M.protected)view(src,8) << "<b><font color = red>[src] attacked [M] for [damage] damage!"

								spawn()M.Death(src,damage,rand(0,1))
								if(!M.protected)Blood(M.x,M.y,M.z)
								if(M.stype == "Ikkaku")
									if(src.inshikai&&M.shikaidrain > 0)
										if(M.killable)src.shimastery(4)
							spawn(1)
								spawn(2)
									src.frozen = 0
									del A
									del B
					sleep(12)
					src.canattack = 1
					return
				if(src.stype == "Shonshui"&&src.inshikai && src.client||src.stype == "Ukitake"&&src.inshikai && src.client||src.client && src.stype == "Ichinose"&&src.inshikai&&src.shikaidrain < 10)
					flick("Sword Slash1",src)
					for(var/mob/M in get_step(src,src.dir))
						if(M.volcano)
							M.Volcano(src)
						damage=damage*4.5
						if(src.stype=="Ukitake" && src.client)
							damage = round(src.reiatsu)
							damage+=rand(damage/1.,damage/1.5)
							damage+=src.swordD
						if(damage <= 1)
							damage =rand(25,1000)
						spawn()M.Death(src,damage,rand(0,1))
						//if(!M.protected)view(src,8) << "<b><font color = red>[src] attacked [M] for [damage] damage!"
						damage=src.attack*4.5
						if(prob(src.bodypassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the core!"
							M.BrokenCore()
						if(prob(src.armpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the arm!"
							M.BrokenArm()
						if(prob(src.legpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the leg!"
							M.BrokenLeg()
						if(prob(src.headpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the head!"
							M.BrokenHead()
						if(prob(src.stunpassive*3))
							view(src,8) << "<font color = red>[src] stunned [M]!"
							M.Freeze(12)
						if(M.killable)src.shimastery(3)
				if(src.stype=="Shinji"&&src.inshikai && src.client||src.stype=="Shinji"&&src.inbankai && src.client)
					flick("Sword Slash1",src)
					if(src.inshikai)
						src.shimastery(3)
					if(src.inbankai)
						src.banmastery(3)
					for(var/mob/M in get_step(src,src.dir))
						if(M!=src)
							M.shinjiDissed()
						damage = round(src.reiatsu)*4.33
						damage+=rand(damage/1.5,damage/1.5)
						damage-=M.defence/2
						spawn()M.Death(src,damage,rand(0,1))
						sleep(9)
						src.canattack=1
						return
				if(src.stype == "Yammamoto" && src.inshikai && src.client||src.stype == "Yammamoto" && src.inbankai && src.client)
					flick("Sword Slash1",src)
					for(var/mob/M in get_step(src,src.dir))
						if(M.volcano)
							M.Volcano(src)
						damage = round(src.reiatsu)*2.33
						damage+=rand(damage/2,damage/1.5)
						damage-=M.defence/2
						if(damage <= 1)
							damage =rand(25,1000)
						//if(!M.protected)view(src,8) << "<b><font color = red>[src] attacked [M] for [damage] damage!"
						if(prob(src.bodypassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the core!"
							M.BrokenCore()
						if(prob(src.armpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the arm!"
							M.BrokenArm()
						if(prob(src.legpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the leg!"
							M.BrokenLeg()
						if(prob(src.headpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the head!"
							M.BrokenHead()
						if(prob(src.stunpassive*3))
							view(src,8) << "<font color = red>[src] stunned [M]!"
							M.Freeze(12)
						if(src.inshikai)
							if(M.killable)src.shimastery(3)
						if(src.inbankai)
							if(M.killable)src.banmastery(3)
						spawn()M.Death(src,damage,rand(0,1))
						sleep(9)
						src.canattack=1
						return
				if(src.stype == "Shonshui"&&src.inbankai && src.client||src.stype == "Ukitake"&&src.inbankai && src.client)
					flick("Sword Slash1",src)
				//	damage=damage*4.5
					for(var/mob/M in get_step(src,src.dir))
						if(M.volcano)
							M.Volcano(src)
						damage=damage*5.5
						if(src.stype=="Ukitake" && src.client)
							damage = round(src.reiatsu*2.5)
							damage+=rand(damage/1.2,damage/1.3)
							damage+=src.swordD
						if(damage <= 1)
							damage =rand(25,1000)
						spawn()M.Death(src,damage,rand(0,1))
						//if(!M.protected)view(src,8) << "<b><font color = red>[src] attacked [M] for [damage] damage!"
						damage=src.attack*5
						if(prob(src.bodypassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the core!"
							M.BrokenCore()
						if(prob(src.armpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the arm!"
							M.BrokenArm()
						if(prob(src.legpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the leg!"
							M.BrokenLeg()
						if(prob(src.headpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the head!"
							M.BrokenHead()
						if(prob(src.stunpassive*3))
							view(src,8) << "<font color = red>[src] stunned [M]!"
							M.Freeze(12)
						if(M.killable)src.banmastery(4)
					//	sleep(7)
					//	src.canattack = 1
					//	return
				if(!src.renjishikai&&!src.ikkakushikai)
					if(src.swordon || src.firesworduse||src.dualwield)flick("Sword Slash1",src)
					if(!src.swordon&&!src.firesworduse&&!src.dualwield)flick("punch",src)
					if(src.stype=="Ichigo"&&src.inbankai && src.client)
						src.overlays-=/obj/Zanpakutou/Tensa
						flick("",src)
						//for(var/turf/t in get_step(src,src.dir))
						var/obj/sl=new/obj/Ichigomove/m1(locate(src.x,src.y,src.z))
						step(sl,src.OppositeDirection())
						step(sl,src.dir)
						step(sl,src.dir)
						damage=damage*5.7
						spawn(2)
						src.overlays+=/obj/Zanpakutou/Tensa
					for(var/mob/M in get_step(src,src.dir))



						if(src.stype == "Yumichika" && src.inshikai && src.client)
							damage =(src.reiatsu+src.attack)*1.8
							if(damage <= 1)
								damage =rand(25,1000)
								src.health += damage /3
								if(M.killable)src.shimastery(3)
								if(src.health >= src.mhealth*1.2)
									src.health = src.mhealth*1.2


						if(src.stype == "Yumichika" && src.inbankai && src.client)
							damage =(src.reiatsu+src.attack)*3
							if(damage <= 1)
								damage =rand(25,1000)
							if(prob(src.bodypassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the core!"
								M.BrokenCore()
							if(prob(src.armpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the arm!"
								M.BrokenArm()
							if(prob(src.legpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the leg!"
								M.BrokenLeg()
							if(prob(src.headpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the head!"
								M.BrokenHead()
								src.health += damage /4
								if(M.killable)src.banmastery(3)
								if(src.health >= src.mhealth*1.3)
									src.health = src.mhealth*1.3


						if(prob(src.bodypassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the core!"
							M.BrokenCore()
						if(prob(src.armpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the arm!"
							M.BrokenArm()
						if(prob(src.legpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the leg!"
							M.BrokenLeg()
						if(prob(src.headpassive*3))
							view(src,8) << "<font color = red>[src] hit [M] in the head!"
							M.BrokenHead()
						if(src.stype!="Hitsugaya")
							if(prob(src.stunpassive*3))
								view(src,8) << "<font color = red>[src] stunned [M]!"
								M.Freeze(12)
						if(M.volcano)
							M.Volcano(src)
						if(src.race=="Hollow")
							damage=src.attack
							damage += damage*5
						if(src.stype=="Muramasa" && src.client)
							damage=src.attack*1.3
							damage += damage
						if(src.stype=="Muramasa" && src.client)
							damage += damage
						if(src.race=="Fullbringer" && src.client)
							damage=src.attack*2.3+src.mreiatsu*2.3
						//	damage=damage*2
						if(src.race=="Sado" && src.client||src.race=="Chad" && src.client)
							damage=src.attack*4.5
							damage = damage*4.5
						if(src.race=="Sado" && src.client&&src.newsadoking||src.race=="Chad" && src.client&&src.newsadoking)
							damage=src.attack*6
							damage = damage*6
						if(src.inbankai&&src.stype == "Byakuya"&&src.senkei && src.client||src.ressurectiontype=="Halibel"||src.stype == "Rukia" && src.client||src.stype=="Dark Bat" && src.client||src.ftype=="Dark Bat"||src.ressurectiontype=="Dark Bat" && src.client)
							damage += src.reiatsu*5.5
						if(src.ftype=="Wings"||src.ressurection&&src.ressurectiontype=="Shooter"||src.ressurection&&src.ressurectiontype=="Pantera"||src.stype == "Hitsugaya" && src.client||src.stype == "Urahara" && src.client)//||src.ftype=="Ichigo")||src.stype == "Yumichika"&&src.inbankai||src.stype == "Yumichika"&&src.inshikai)
							damage+=round(src.reiatsu*3)
							if(src.stype=="Urahara" && src.client||src.stype == "Rukia" && src.inshikai&& src.client)
								damage*=2
							if(src.dualon==1)
								damage+=round(src.reiatsu*1.7)
						if(src.ressurection&&src.ressurectiontype=="Pantera")
							damage+=round(src.attack*2)
						if(src.ressurectiontype=="Del Toro")
							damage+=(src.attack+src.defence)/1.5
						if(src.stype=="Stinger"&&src.inbankai && src.client||src.ressurectiontype=="Tijereta"&&src.ressurection)
							damage+=damage*2.5
						if(src.stype=="Muramasa"&&src.inbankai && src.client)
							damage=src.attack*1.3
							damage += damage
							src.banmastery(3)
						if(src.ressurectiontype=="Nell"&&src.ressurection)
							damage+=damage*2.6
						if(src.ressurectiontype=="Scientist"&&src.ressurection)
							damage+=damage*2
						if(src.stype=="Fujimaru"&&src.inshikai && src.client)
							damage+=src.reiatsu*2
							if(M.killable)src.shimastery(6)
					//	if(src.ftype=="Tsukishima")
						//	damage+=(src.attack*1.9)
						if(src.ftype == "Shishigawara"&&src.inafull||src.ftype=="Shishigawara"&&src.infull)
							flick("punch",src)
							damage+=src.attack*2.8
							//damage = round((src.attack)*1.4)
							for(var/mob/MM in get_step(src,src.dir))
								if(prob(5))
									damage=damage*6.5
									view(8,src)<<"<b><font color=yellow>SUPER JACK POT!</b></font>"
								if(prob(25))
									damage=damage*5
									view(8,src)<<"<b><font color=redJackPot!</b>"
								if(prob(src.bodypassive*6))
									view(src,8) << "<font color = red>[src] hit [MM] in the core!"
									MM.BrokenCore()
								if(prob(src.armpassive*6))
									view(src,8) << "<font color = red>[src] hit [MM] in the arm!"
									MM.BrokenArm()
								if(prob(src.legpassive*6))
									view(src,8) << "<font color = red>[src] hit [MM] in the leg!"
									MM.BrokenLeg()
								if(prob(src.headpassive*6))
									view(src,8) << "<font color = red>[src] hit [MM] in the head!"
									MM.BrokenHead()
								if(prob(src.stunpassive*6))
									view(src,8) << "<font color = red>[src] stunned [MM]!"

						if(src.ftype=="Yukio"||src.ftype=="Ichigo")
							if(src.infull||src.inafull)
								damage+=(src.reiatsu+src.attack)*3.5

						if(src.ftype=="Inoue")
							if(src.infull||src.inafull)
								damage=(src.attack+src.reiatsu)*6
								damage=damage*2

						if(src.ftype=="Samurai"||src.ftype=="Ginjo"||src.ftype=="Jackie"||src.ftype=="Tsukishima"||src.ftype=="")
							if(src.infull||src.inafull)
								damage+=src.attack*3.5


						if(src.inshikai&&src.stype == "Mayuri" && src.client)
							damage = src.reiatsu *1.5
							damage=rand(damage*0.9,damage*1.2)
						if(src.infinal)
							damage+=(src.attack+src.defence+src.reiatsu)*3.5
							damage=rand(damage*2,damage*2.5)
						damage -= M.defence / 1.5
						if(M.stype == "Ikkaku")
							if(M.inbankai&&M.bankaidrain > 0)
								M.banmastery(8)
						if(src.stype=="Urahara")
							if(src.inshikai&&src.shikaidrain > 0)
								if(M.killable)src.shimastery(3)
							if(src.inbankai&&src.bankaidrain > 0)
								if(M.killable)src.banmastery(4)
						if(src.stype=="Tousen"&&src.inshikai && src.client||src.stype == "Tousen" && src.inbankai && src.client)
							damage=rand(damage*2.5,damage*4.5)
							damage += damage
							if(M.killable)src.banmastery(7)
							if(M.killable)src.shimastery(7)
						if(src.stype == "Zaraki")
							if(src.inshikai&&src.shikaidrain > 0)
								if(M.killable)src.shimastery(3)
							if(src.inbankai&&src.bankaidrain > 0)
								if(M.killable)src.banmastery(6)
						if(src.race=="Inoue")
							damage = src.defence *1.5
							damage=rand(damage*1.6,damage*2.3)
							damage-=M.defence/1.5
						if(damage < 1)
							damage =rand(25,1000)
						if(src.ressurectiontype=="Tijereta")
							flick("punch",src)
							new/obj/deadlyslice(M.loc)
							Blood(M.x,M.y,M.z)
							spawn()M.Death(src,damage,rand(2,5))
							//if(!M.protected)view(src,8) << "<b><font color = red>[src] attacked [M] for [damage*2] damage!"
						else
							spawn()M.Death(src,damage,rand(0,1))
							//if(!M.protected)view(src,8) << "<b><font color = red>[src] attacked [M] for [damage] damage!"
					/*	if(src.stype == "Yumichika" && src.inbankai)
								//	if(!M.protected||M.ko)
							//	for(var/mob/M in get_step(src,src.dir))
							damage =(src.reiatsu+src.attack)*11
							damage+=damage
							if(damage <= 1)
								damage =rand(25,1000)
							if(prob(src.bodypassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the core!"
								M.BrokenCore()
							if(prob(src.armpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the arm!"
								M.BrokenArm()
							if(prob(src.legpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the leg!"
								M.BrokenLeg()
							if(prob(src.headpassive*3))
								view(src,8) << "<font color = red>[src] hit [M] in the head!"
								M.BrokenHead()
								src.health += damage
								if(M.killable)src.banmastery(3)
								if(src.health >= src.mhealth*1.5)
									src.health = src.mhealth*1.5	*/
				/*	if(src.inshikai)
								if(M)
								//	if(!M.protected||M.ko)
							//	for(var/mob/M in get_step(src,src.dir))
									damage =(src.reiatsu+src.attack)*6
									damage+=damage
									if(damage <= 1)
										damage =rand(25,1000)
									if(prob(src.bodypassive*3))
										view(src,8) << "<font color = red>[src] hit [M] in the core!"
										M.BrokenCore()
									if(prob(src.armpassive*3))
										view(src,8) << "<font color = red>[src] hit [M] in the arm!"
										M.BrokenArm()
									if(prob(src.legpassive*3))
										view(src,8) << "<font color = red>[src] hit [M] in the leg!"
										M.BrokenLeg()
									if(prob(src.headpassive*3))
										view(src,8) << "<font color = red>[src] hit [M] in the head!"
										M.BrokenHead()
										src.health += damage
										if(M.killable)src.banmastery(3)
										if(src.health >= src.mhealth*1.5)
											src.health = src.mhealth*1.5	*/
					/*	if(src.stype == "Dark Bat")
							if(SpearThrow == 0)
								if(src.inshikai == 1||src.inbankai == 1)
									if(M)
										src.random = rand(1,75)
										if(src.random <= 25&&!M.protected)
											damage = round(src.reiatsu/1.5)
											damage+=rand(damage/2,damage/1.5)
											damage+=src.swordD
											if(damage <= 1)
												damage =rand(25,1000)
											view(src,8) <<"<font color=red><b>[src]: Tsukishiro!"
											M.Freeze(35)
											spawn()M.Death(src,damage,5)
											M.overlays += /obj/icicle
											M.overlays += /obj/icicle2
											if(M.killable)src.shimastery(8)
											spawn(35)
											if(M)
												M.overlays -= /obj/icicle
												M.overlays -= /obj/icicle2
							else
								if(!src.ulqgotsword)
									src.frozen=1
									sleep(4)
									flick("Sword Slash1",src)
									sleep(4)
									src.ulqgotsword=1
									src.canattack=1
									src.frozen=0
									src.overlays+=/obj/Zanpakutou/Ulq
									return
								if(src.ulqgotsword)
									flick("Sword Slash1",src)
									for(M in get_step(src,src.dir))
										if(M.volcano)
											M.Volcano(src)
										damage=src.reiatsu*2
										damage -= M.defence / 2
										damage=rand(damage*0.8,damage*1.2)
										if(damage <= 1)
											damage =rand(25,1000)
										if(prob(src.bodypassive*3))
											view(src,8) << "<font color = red>[src] hit [M] in the core!"
											M.BrokenCore()
										if(prob(src.armpassive*3))
											view(src,8) << "<font color = red>[src] hit [M] in the arm!"
											M.BrokenArm()
										if(prob(src.legpassive*3))
											view(src,8) << "<font color = red>[src] hit [M] in the leg!"
											M.BrokenLeg()
										if(prob(src.headpassive*3))
											view(src,8) << "<font color = red>[src] hit [M] in the head!"
											M.BrokenHead()
										if(prob(src.stunpassive*3))
											view(src,8) << "<font color = red>[src] stunned [M]!"
											M.Freeze(12)
										spawn()M.Death(src,damage,rand(0,2))
										if(!M.protected)Blood(M.x,M.y,M.z)
										sleep(7)
										src.canattack = 1
										return*/
						if(src.stype == "Rukia"  && src.client|| src.stype=="Dark Bat"  && src.client|| src.ftype=="Dark Bat" && src.client|| src.ressurectiontype=="Dark Bat" && src.client)
							if(src.inshikai == 1||src.inbankai == 1||src.infull || src.inafull||src.ressurection)
								if(M)
									if(src.stype == "Dark Bat"  && src.client|| src.ftype=="Dark Bat" && src.client|| src.ressurectiontype=="Dark Bat" && src.client)
										src.random = rand(1,75)
										if(src.random <= 25&&!M.protected)
											damage = round(src.reiatsu/1.5)
											damage+=rand(damage/2,damage/1.5)
											damage+=src.swordD
											if(damage <= 1)
												damage =rand(25,1000)
											view(src,8) <<"<font color=red><b>[src]: Burn!"
											M.Freeze(35)
											spawn()M.Death(src,damage,5)

											M.overlays += /obj/BlackFlame
											//M.overlays += /obj/BlackFlame2
											if(M.killable)src.shimastery(8)
											spawn(35)
											if(M)
												M.overlays -= /obj/BlackFlame
											//	M.overlays -= /obj/BlackFlame2
									else
										src.random = rand(1,75)
										if(src.random <= 25&&!M.protected)
											damage = round(src.reiatsu/1.5)
											damage+=rand(damage/2,damage/1.5)
											damage+=src.swordD
											if(damage <= 1)
												damage =rand(25,1000)
											view(src,8) <<"<font color=red><b>[src]: Tsukishiro!"
											M.Freeze(35)
											spawn()M.Death(src,damage,5)

											M.overlays += /obj/icicle
											M.overlays += /obj/icicle2
											if(M.killable)src.shimastery(8)
											spawn(35)
											if(M)
												M.overlays -= /obj/icicle
												M.overlays -= /obj/icicle2
								if(src.stype=="Dark Bat"||src.ftype=="Dark Bat"|| src.ressurectiontype=="Dark Bat")
									if(!src.ulqgotsword)
										src.frozen=1
										sleep(4)
										flick("Sword Slash1",src)
										sleep(4)
										src.ulqgotsword=1
										src.canattack=1
										src.frozen=0
										src.overlays+=/obj/Zanpakutou/Dark_Aura/top
										src.overlays+=/obj/Zanpakutou/Dark_Aura/mid
										src.overlays+=/obj/Zanpakutou/Dark_Aura/bot
										return
									if(src.ulqgotsword)
										flick("Sword Slash1",src)
										for(M in get_step(src,src.dir))
											if(M.volcano)
												M.Volcano(src)
											damage=src.reiatsu*2
											damage -= M.defence / 2
											damage=rand(damage*0.8,damage*1.2)
											if(damage <= 1)
												damage =rand(25,1000)
											if(prob(src.bodypassive*3))
												view(src,8) << "<font color = red>[src] hit [M] in the core!"
												M.BrokenCore()
											if(prob(src.armpassive*3))
												view(src,8) << "<font color = red>[src] hit [M] in the arm!"
												M.BrokenArm()
											if(prob(src.legpassive*3))
												view(src,8) << "<font color = red>[src] hit [M] in the leg!"
												M.BrokenLeg()
											if(prob(src.headpassive*3))
												view(src,8) << "<font color = red>[src] hit [M] in the head!"
												M.BrokenHead()
											if(prob(src.stunpassive*3))
												view(src,8) << "<font color = red>[src] stunned [M]!"
												M.Freeze(12)
											spawn()M.Death(src,damage,rand(0,2))
											if(!M.protected)Blood(M.x,M.y,M.z)
											sleep(7)
											src.canattack = 1
											return
						if(src.stype == "Mayuri")
							if(src.inshikai == 1)
								if(M)
									src.random = rand(1,100)
									if(src.random <= 75&&src.random > 50)
										M.Freeze(35)
										if(M.killable)src.shimastery(4)
									if(src.random <= 100&&src.random > 75)
										M.Slowed(5,35)
										if(M.killable)src.shimastery(4)
					if(src.inbankai)
						if(src.stype == "Ichigo")
							sleep(6)
							src.canattack=1
							src.banmastery(5)
							return
					if(src.stype=="Fujimaru"&&src.inbankai)
						src.banmastery(6)
						flick("Sword Slash1",src)
						var/obj/FujiBankaiM/A = new /obj/FujiBankaiM/
					//	var/obj/FujiBankaiR/B = new /obj/FujiBankaiR/
					//	var/obj/FujiBankaiL/C = new /obj/FujiBankaiL/
						A.loc = locate(src.x, src.y, src.z)
					//	C.loc = locate(src.x+1, src.y, src.z)
					//	B.loc = locate(src.x-1, src.y, src.z)
						A.dir = src.dir
					//	B.dir = src.dir
					//	C.dir = src.dir
						A.Gowner = src
				//		B.Gowner = src
				//		C.Gowner = src
						walk(A,src.dir)
				//		walk(C,src.dir)
				//		walk(B,src.dir)
						sleep(10)
						src.canattack = 1
						return
					if(src.stype=="Hitsugaya"&&src.inbankai && src.client)
						damage = round(src.reiatsu*1.5)
						damage+=rand(damage/2,damage/1.5)
						if(damage <= 1)
							damage =rand(25,1000)
						spawn(1)
							var/K = new/obj/hit1(src.loc)
							step(K,src.dir)
							for(var/mob/M in get_step(src,src.dir))
								M.random = rand(1,5)
								damage -= M.defence / 2
								if(damage < 1)
									damage =rand(25,1000)
								//if(!M.protected)view(src,8) << "<b><font color = red>[src] attacked [M] for [damage] damage!"
								if(M.random == 1)
									M.Freeze(20)
									M.overlays += /obj/icicle
									M.overlays += /obj/icicle2
									if(M.killable)src.banmastery(15)
									spawn(20)
										M.overlays -= /obj/icicle
										M.overlays -= /obj/icicle2
									spawn()M.Death(src,damage,rand(1,2))
							spawn(1)
								del K
								var/B = new/obj/hit2(src.loc)
								step(B,src.dir)
								var/A = new/obj/hit1(src.loc)
								step(A,src.dir)
								step(A,src.dir)
								for(var/mob/M3 in A:loc)
									damage -= M3.defence / 2
									if(damage < 1)
										damage =rand(25,1000)
									M3.random = rand(1,5)
									if(M3.random == 1)
										M3.Freeze(20)
										M3.overlays += /obj/icicle
										M3.overlays += /obj/icicle2
										src.banmastery(15)
										spawn(20)
											M3.frozen = 0
											M3.overlays -= /obj/icicle
											M3.overlays -= /obj/icicle2
									if(M3.volcano)
										M3.frozen=0
										M3.Volcano(src)
									spawn()M3.Death(src,damage,rand(1,2))
								spawn(1)
									del A
									var/As = new/obj/hit2(src.loc)
									step(As,src.dir)
									step(As,src.dir)
									var/W = new/obj/hit1(src.loc)
									step(W,src.dir)
									step(W,src.dir)
									step(W,src.dir)
									for(var/mob/M2 in W:loc)
										damage -= M2.defence / 2
										if(damage < 1)
											damage =rand(25,1000)
										//if(!M2.protected)view(src,8) << "<b><font color = red>[src] attacked [M2] for [damage] damage!"
										M2.random = rand(1,5)
										if(M2.random == 1)
											M2.Freeze(20)
											M2.overlays += /obj/icicle
											M2.overlays += /obj/icicle2
											src.banmastery(4)
											spawn(20)
												M2.frozen = 0
												M2.overlays -= /obj/icicle
												M2.overlays -= /obj/icicle2
										spawn()M2.Death(src,damage,rand(1,2))
									spawn(2)
										del A
										del As
										del W
										del B
						sleep(12)
						src.canattack = 1
						return
					if(src.ftype=="Wings")
						if(src.devoraron)
							src.shurikened+=1
							flick("Sword Slash1",src)
							var/K = new/mob/Wingror(usr.loc)
							K:owner = usr
							walk(K,usr.dir)
							if(src.etarget)
								walk_towards(K,src.etarget)
							if(src.shurikened>=7)
								sleep(20)
								src.shurikened=0
							sleep(2)
							src.canattack=1
							return
						else
							sleep(4)
							src.canattack=1
							return
					if(src.ftype=="Samurai")
						if(src.infull||src.inafull)
							flick("Sword Slash1",src)
							var/obj/K = new/obj/Slash/s1
							K:Gowner = usr
							K:dir = usr.dir
							var/obj/Ks = new/obj/Slash/s2
							Ks:Gowner = usr
							Ks:dir = usr.dir
							var/obj/Ka = new/obj/Slash/s3
							Ka:Gowner = usr
							Ka:dir = usr.dir
							if(src.dir==NORTH)
								Ka.loc=locate(src.x+1,src.y+1,src.z)
								Ks.loc=locate(src.x,src.y+1,src.z)
								K.loc=locate(src.x-1,src.y+1,src.z)
							if(src.dir==SOUTH)
								Ka.loc=locate(src.x+1,src.y-1,src.z)
								Ks.loc=locate(src.x,src.y-1,src.z)
								K.loc=locate(src.x-1,src.y-1,src.z)
							if(src.dir==EAST)
								Ka.loc=locate(src.x+1,src.y+1,src.z)
								Ks.loc=locate(src.x+1,src.y,src.z)
								K.loc=locate(src.x+1,src.y-1,src.z)
							if(src.dir==WEST)
								Ka.loc=locate(src.x-1,src.y+1,src.z)
								Ks.loc=locate(src.x-1,src.y,src.z)
								K.loc=locate(src.x-1,src.y-1,src.z)
							if(src.dir==NORTHEAST)
								Ka.loc=locate(src.x+1,src.y+2,src.z)
								Ks.loc=locate(src.x+1,src.y+1,src.z)
								K.loc=locate(src.x+1,src.y,src.z)
							if(src.dir==NORTHWEST)
								Ka.loc=locate(src.x-1,src.y+2,src.z)
								Ks.loc=locate(src.x-1,src.y+1,src.z)
								K.loc=locate(src.x-1,src.y,src.z)
							if(src.dir==SOUTHEAST)
								Ka.loc=locate(src.x+1,src.y,src.z)
								Ks.loc=locate(src.x+1,src.y-1,src.z)
								K.loc=locate(src.x+1,src.y-2,src.z)
							if(src.dir==SOUTHWEST)
								Ka.loc=locate(src.x-1,src.y,src.z)
								Ks.loc=locate(src.x-1,src.y-1,src.z)
								K.loc=locate(src.x-1,src.y-2,src.z)
							sleep(1.3 SECONDS)
							src.canattack=1
							return




							if(src.key=="Dragonpearl123")
								src.canattack=1
							sleep(3 SECONDS)
							src.canattack=1
							return


					if(src.key in specialverbs)
						sleep(1.5 SECONDS)
						src.canattack=1
						return

					if(src.infull&&src.ftype=="Jackie")
						sleep(9)
						src.canattack=1
						return
					if(src.inafull&&src.ftype=="Jackie")
						sleep(4)
						src.canattack=1
						return
					if(src.ftype=="Shishigawara")
						sleep(7)
						src.canattack=1
						return
					if(src.ressurection&&src.ressurectiontype=="Pantera")
						sleep(5)
						src.canattack=1
						return
					if(src.infinal)
						sleep(5)
						src.canattack=1
						return
					sleep(12)
					src.canattack=1
				if(src.crownprince||src.iswandevent)
					sleep(5)
					src.canattack=1
					return
					flick("Sword Slash1",src)
					var/obj/M = new/obj/crownprinceshot(src.loc)
					M:Gowner = src
					walk(M,src.dir)
				if(src.stype == "Renji"&&src.inshikai && src.client)
					src.frozen = 1
					src.extending=1
					damage+=damage*3.5
					src.overlays-= /obj/Zanpakutou/Zabimaru
					flick("punch",src)
					spawn(8)
						src.extending=0
						src.overlays+= /obj/Zanpakutou/Zabimaru
						src.icon_state = ""
						src.frozen = 0
						src.canattack = 1
					spawn(1)
						var/K = new/obj/renji1(src.loc)
						step(K,src.dir)
						for(var/mob/M in K:loc)
							if(M.volcano)
								M.Volcano(src)
							damage -= M.defence / 2
							if(damage <= 1)
								damage =rand(25,1000)
							//if(!M.protected)view(src,8) << "<b><font color = red>[src] attacked [M] for [damage] damage!"
							spawn()M.Death(src,damage,rand(0,1))
							if(M.killable)src.shimastery(5)
						spawn(1)
							del K
							var/B = new/obj/renji2(src.loc)
							step(B,src.dir)
							var/A = new/obj/renji1(src.loc)
							step(A,src.dir)
							step(A,src.dir)
							for(var/mob/M in A:loc)
								if(M.volcano)
									M.Volcano(src)
								damage -= M.defence / 2
								if(damage < 1)
									damage =rand(25,1000)
								//if(!M.protected)view(src,8) << "<b><font color = red>[src] attacked [M] for [damage] damage!"
								spawn()M.Death(src,damage,rand(0,1))
								if(M.killable)src.shimastery(4)
							spawn(1)
								del A
								var/As = new/obj/renji2(src.loc)
								step(As,src.dir)
								step(As,src.dir)
								var/W = new/obj/renji1(src.loc)
								step(W,src.dir)
								step(W,src.dir)
								step(W,src.dir)
								for(var/mob/M in W:loc)
									if(prob(src.bodypassive*3))
										view(src,8) << "<font color = red>[src] hit [M] in the core!"
										M.BrokenCore()
									if(prob(src.armpassive*3))
										view(src,8) << "<font color = red>[src] hit [M] in the arm!"
										M.BrokenArm()
									if(prob(src.legpassive*3))
										view(src,8) << "<font color = red>[src] hit [M] in the leg!"
										M.BrokenLeg()
									if(prob(src.headpassive*3))
										view(src,8) << "<font color = red>[src] hit [M] in the head!"
										M.BrokenHead()
									if(prob(src.stunpassive*3))
										view(src,8) << "<font color = red>[src] stunned [M]!"
										M.Freeze(12)
									damage -= M.defence / 2
									if(damage < 1)
										damage =rand(25,1000)
									//if(!M.protected)view(src,8) << "<b><font color = red>[src] attacked [M] for [damage] damage!"
									spawn()M.Death(src,damage,rand(0,1))
									if(M.killable)src.shimastery(4)
								spawn(1)
									for(var/mob/M in W:loc)
										damage -= M.defence / 2
										if(damage < 1)
											damage =rand(25,1000)
										//if(!M.protected)view(src,8) << "<b><font color = red>[src] attacked [M] for [damage] damage!"
										spawn()M.Death(src,damage,rand(0,1))
										if(M.killable)src.shimastery(4)
									spawn(1)
										del A
										del As
										var/Ge = new/obj/renji1(src.loc)
										step(Ge,src.dir)
										step(Ge,src.dir)
										del W
										for(var/mob/M in Ge:loc)
											damage -= M.defence / 2
											if(damage < 1)
												damage =rand(25,1000)
											//if(!M.protected)view(src,8) << "<b><font color = red>[src] attacked [M] for [damage] damage!"
											spawn()M.Death(src,damage,rand(0,1))
											if(M.killable)src.shimastery(2)
										spawn(1)
											del B
											del Ge
											var/jue = new/obj/renji1(src.loc)
											step(jue,src.dir)
											del W
											for(var/mob/M in jue:loc)
												damage -= M.defence / 2
												if(damage < 1)
													damage =rand(25,1000)
												//if(!M.protected)view(src,8) << "<b><font color = red>[src] attacked [M] for [damage] damage!"
												spawn()M.Death(src,damage,rand(0,1))
												if(M.killable)src.shimastery(1)
											spawn(1)
												del jue
												return
					/*sleep(8)
					src.extending=0
					src.Load_Overlays()
					src.icon_state = ""
					src.frozen = 0
					src.canattack = 1*/