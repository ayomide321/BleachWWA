obj
	ihud
		icon='Icons/gui.dmi'
		icon_state="items"
		//mouse_drop_zone = 1 //Indicates a valid site to drop objects
		layer = 70 //Above all other layers

var/screen_objects = newlist(/obj/hud/M1, /obj/hud/M2, /obj/hud/M3,\
 /obj/hud/M4, /obj/hud/M5, /obj/hud/M6, /obj/hud/M7, /obj/hud/M8, /obj/hud/M9, /obj/hud/M0,\
  /obj/hud/Msub, /obj/hud/Mequ, /obj/hud/Mpar, /obj/hud/My)//, /obj/hud/Mw)

var/testobjects = newlist(/obj/skillcard/test, /obj/skillcard/test2, /obj/skillcard/test3, /obj/skillcard/test4)
obj/var
	names=""

obj
	hud
		icon='Icons/gui.dmi'
		mouse_drop_zone = 1 //Indicates a valid site to drop objects
		layer = 70 //Above all other layers

		Click()
			if(istype(usr,/mob/player))
				if(usr.noskill)
					usr<<"Skills are disabled"
					return
				if(usr.ko)
					usr<<"You are koed"
					return
				if(usr.frozen)
					usr<<"You are stunned"
					return
				if(usr.fireback)
					usr<<"You're core hurts too much to use skills"
					return
				if(!usr.firing)
					if(prob(usr.angel))
						usr.Angel()
				if(usr.etarget)
					usr.Facedir(usr.etarget)
					var/mob/er=usr.etarget
					var/dista=get_dist(usr,er)
					if(dista>10)
						usr.Untarget()
				if(usr.shinjiDissed)
					usr.dir=(turn(usr.dir, 180))
				if(src.names=="Utsusemi")
					usr.Utsusemi()
				if(src.names=="Shakkahou")
					usr.Shakkahou()
				if(src.names=="Raihou")
					usr.Raihou()
				if(src.names=="Jomon")
					usr.Jomon()
				if(src.names=="Shitotsu Sansen")
					usr.Shitotsu_Sansen()
				if(src.names=="Full Danku")
					usr.Full_Danku()
				if(src.names=="Danku")
					usr.Danku()
				if(src.names=="Shadow Attack")
					usr.ShadowTeleport()
				if(src.names=="Itto Kasu")
					usr.Itto_Kasu()
				if(src.names=="Trip")
					usr.Trip()
				if(src.names=="Kamikaze")
					usr.Kamikaze()
				if(src.names=="Dual Swords")
					usr.Dual_Swords()
				if(src.names=="Limit Release")
					usr.Limit_Release()
				if(src.names=="Limit Release Custom")
					usr.Limit_Release2()
				if(src.names=="Air Strike")
					usr.Air_Strike()
				if(src.names=="Air Bullet")
					usr.Air_Blade()
				if(src.names=="Negacion")
					usr.Negacion()
				if(src.names=="Rodeo")
					usr.Rodeo()
				if(src.names=="Rage Spin")
					usr.Rage_Spin()
				if(src.names=="Extend")
					usr.Extend()
				if(src.names=="Raikouhou")
					usr.Raikouhou()
				if(src.names=="Release Seal")
					usr.Release_Seal()
				if(src.names=="Boost Negation")
					usr.Boost_Negation()
				if(src.names=="Segunda Ress")
					usr.Segunda_Ress()
				if(src.names=="Drainage")
					usr.Drainage()
				if(src.names=="Random Stretch")
					usr.Random_Stretch()
				if(src.names=="Stretch")
					usr.Stretch()
				if(src.names=="Random Blast")
					usr.Random_Blast()
				if(src.names=="Cero Doble")
					usr.Cero_Doble()
				if(src.names=="Bull Arm")
					usr.Bull_Arm()
				if(src.names=="Extravagant Emotions")
					usr.Extravagant_Emotions()
				if(src.names=="Carnage")
					usr.Carnage()
				if(src.names=="Chronicle Explosion")
					usr.Chronicle_Explosion()
				if(src.names=="Particle Crippler")
					usr.Particle_Crippler()
				if(src.names=="Relic Shock")
					usr.Relic_Shock()
				if(src.names=="Death Note")
					usr.Death_Note_PVP()
				if(src.names=="Ice Field")
					usr.Ice_Field()
				if(src.names=="Shibari Explosion")
					usr.Shibari_Explosion()
				if(src.names=="Shibari")
					usr.Shibari()
				if(src.names=="Fireball")
					usr.Fireball()
				if(src.names=="Wind Pull")
					usr.Wind_Pull()
				if(src.names=="Wind Push")
					usr.Wind_Push()
				if(src.names=="Wind Level")
					usr.Wind_Level()
				if(src.names=="Eat Clones")
					usr.Eat_Clones()
				if(src.names=="Spinning Blades")
					usr.Reap()
				if(src.names=="Aging Barrier")
					usr.Aging_Barrier()
				if(src.names=="Severed Smash")
					usr.Severed_Smash()
				if(src.names=="Pantera Roar")
					usr.Pantera_Roar()
				if(src.names=="Lanza Smash"||src.names=="Cero Obscura")
					usr.Cero_Oscura()
				if(src.names=="Homing Blasts")
					usr.Homing_Blasts()
				if(src.names=="SmokeScreen")
					usr.SmokeScreen()
				if(src.names=="Execution")
					usr.Outrage()
				if(src.names=="Flood")
					usr.Flood()
				if(src.names=="Chain Wrap")
					usr.Chain_Wrap()
				if(src.names=="Decimate")
					usr.Decimate()
				if(src.names=="Shishkabob")
					usr.Shishkabob()
				if(src.names=="Fireball Graveyard")
					usr.Fireball_Graveyard()
				if(src.names=="Floating Graveyard")
					usr.Shuriken_Graveyard()
				if(src.names=="Tentacle Wheel")
					usr.Tentacle_Wheel()
				if(src.names=="Tentacle Wrap")
					usr.Tentacle_Wrap()
				if(src.names=="Fog")
					usr.Fog()
				if(src.names=="Life Contract")
					usr.Life_Contract()
				if(src.names=="Kendo")
					usr.Kendo()
				if(src.names=="Harmful Recoil")
					usr.Harmful_Recoil()
				if(src.names=="Critical Stun")
					usr.Critical_Stun()
				if(src.names=="Critical Burst")
					usr.Critical_Burst()
				if(src.names=="Power Monsters")
					usr.Power_Monsters()
				if(src.names=="Ring Parade")
					usr.Ring_Parade()
				if(src.names=="Finalbring")
					usr.Limit_Release()
				if(src.names=="Koten Zanshun")
					usr.Koten_Zanshun()
				if(src.names=="Soten Kisshun")
					usr.Soten_Kisshun()
				//Dunegon heal
				if(src.names=="Dungeon AOE Heal")
					usr.Dungeon_AOE_Heal()
				if(src.names=="Dungeon Heal")
					usr.Dungeon_Heal()
				if(src.names=="Heal Kido")
					usr.Kido_Corp_Heal()
				if(src.names=="Santen Kesshun")
					usr.Santen_Kesshun()
				if(src.names=="Shiten Koshun")
					usr.Shiten_Koshun()
				if(src.names=="Power_Transfer")
					usr.Power_Transfer()
				if(src.names=="Blood_Thirsty")
					usr.Blood_Thirsty()
				if(src.names=="Acceleration Overdrive")
					if(usr.status=="<font color = #FF5600>Captain</font>"||usr.status=="<font color = #f0f217>Captain Commander</font>"||usr.statusold== "<font color = #f0f217>Captain Commander</font>")
						usr.Acceleration_Overdrive()
					else
						usr<<"Only Captains can use this"
				if(src.names=="Sharingan Reversal")
					usr.Sharingan_Reversal()
				if(src.names=="Zanpaktou Skill")
					usr.Zanpaktou_Skill()
				if(src.names=="Hide Presence")
					usr.Hide_Presence()
				if(src.names=="Sense")
					usr.Sense()
				if(src.names=="Bankai Skill")
					usr.Bankai_Skill()
				if(src.names=="Healing")
					usr.Healing()
				if(src.names=="Bankai Version 2")
					usr.Bankai2()
				if(src.names=="Regeneration Mode")
					usr.Regeneration_Mode()
				if(src.names=="Reversal Healing")
					usr.Reversal_Healing()
				if(src.names=="Pure Atk")
					usr.Pure_Atk()
				if(src.names=="Pure Rei")
					usr.Pure_Rei()
				if(src.names=="Pure Def")
					usr.Pure_Def()
				if(src.names=="Vasto Form")
					usr.Vasto_Form()
				if(src.names=="Vasto FormDP")
					usr.Vasto_FormDP()
				if(src.names=="Shunko")
					usr.Shunko()
				if(src.names=="Twilight Shunko")
					usr.Tshunko()
				if(src.names=="Return Blast")
					usr.Return_Blast()
				if(src.names=="Reflect")
					usr.Reflect()
				if(src.names=="Fire Burn")
					usr.Burning()
				if(src.names=="Fire Bolt")
					usr.Fire_Bolt()
				if(src.names=="Fire Slash")
					usr.FireDollSlash()
				if(src.names=="Fire Bullet")
					usr.Fire_Doll_Bullet()
				if(src.names=="Fire Ring")
					usr.Fire_Doll_Ring()
				if(src.names=="Heat Wave")
					usr.Heat_Wave()
				if(src.names=="Ruthlessness")
					usr.Ruthlessness()
				if(src.names=="Hollow Screech")
					usr.Hollow_Screech()
				if(src.names=="Scatter Shot")
					usr.Rapid_Burst()
				if(src.names=="Hinamori Blast Toggle")
					usr.Hinamori_Attack()
				if(src.names=="Lethal Poison")
					usr.Lethal_Poison()
				if(src.names=="Flash Smash")
					usr.Flash_Smash()
				if(src.names=="Double Fire")
					usr.Double_Fire()
				if(src.names=="Shirafune")
					usr.Shirafune()
				if(src.names=="Ice Freeze")
					usr.Ice_Freeze()
				if(src.names=="Delete Profile")
					usr.Delete_Profile()
				if(src.names=="Spiritual Pressure")
					usr.Spiritual_Pressure()
				if(src.names=="Reiatsu Blast")
					usr.Reiatsu_Blast()
				if(src.names=="Bankai Extraction")
					usr.Bankai_Extraction()
				if(src.names=="Baboon Blast")
					usr.Baboon_Blast()
				if(src.names=="Zen")
					usr.BoostUp2()
				if(src.names=="Fat Boy")
					usr.BoostUp()
				if(src.names=="Super Saiyan")
					usr.SSJ1()
				if(src.names=="Amaterasu")
					usr.Amaterasu()
				if(src.names=="Vaizard Rage")
					usr.VaiInnerRage()
				if(src.names=="La Gota")
					usr.La_Gota()
				if(src.names=="Ola Azul")
					usr.Ola_Azul()
				if(src.names=="Cascada")
					usr.Cascada()
				if(src.names=="Sovereign Wave")
					usr.Sovereign_Wave()
				if(src.names=="Rev Up")
					usr.Rev_Up()
				if(src.names=="Poison")
					usr.Poison()
				if(src.names=="Advanced Fullbring")
					usr.AFullbring()
				if(src.names=="Memory Strike")
					usr.Memory_Strikes()
				if(src.names=="First Hit")
					usr.First_Hit()
				if(src.names=="Second Hit")
					usr.Second_Hit()
				if(src.names=="Third Hit")
					usr.Third_Hit()
				if(src.names=="Forth Hit")
					usr.Forth_Hit()
				if(src.names=="Critical Hit")
					usr.Critical_Hit()
				if(src.names=="Getsuga Ring")
					usr.Getsuga_Ring()
				if(src.names=="Illusion")
					usr.Cheatmode()
				if(src.names=="Bringer Blast")
					usr.Bringer_Blast()
				if(src.names=="Game Trap")
					usr.Game_Trap()
				if(src.names=="Save Freeze")
					usr.Save_Freeze()
				if(src.names=="Fullbring")
					usr.Fullbring()
				if(src.names=="Laceration")
					usr.Laceration()
				if(src.names=="Outrage")
					usr.Outrage()
				if(src.names=="Restep")
					usr.Restep()
				if(src.names=="Illusionary Death")
					usr.Illusionary_Death()
				if(src.names=="Zanpaktou Instincts")
					usr.Zanpaktou_Instincts()
				if(src.names=="Invisible Wires")
					usr.Invisible_Wires()
				if(src.names=="Materialize")
					usr.Materialize()
				if(src.names=="Aging Barrage")
					usr.Aging_Barrage2()
				if(src.names=="Quake Quake Punch")
					usr.Quake_Quake_Punch()
				if(src.names=="Zanpaktou Seal")
					usr.Zanpaktou_Seal()
				if(src.names=="Flashing Attack")
					usr.Flashing_Melee()
				if(src.names=="Heavy Hit")
					usr.Heavy_Hit()
				if(src.names=="Explode")
					usr.Explode()
				if(src.names=="Petal Sword")
					usr.Petal_Sword()
				if(src.names=="Criss Cross")
					usr.Criss_Cross()
				if(src.names=="Release Color")
					usr.Release_Color()
				if(src.names=="Arrancar Release")
					usr.Arrancar_Release()
				if(src.names=="Instant Regen")
					usr.Instant_Regen()
				if(src.names=="Create_Mini_Kushanada")
					usr.Create_Mini_Kushanada()
				if(src.names=="Create Monsters")
					usr.Create_Monsters()
				if(src.names=="Cero Pack")
					usr.Cero_Pack()
				if(src.names=="Berserk")
					usr.Berserk()
				if(src.names=="Homing Shurikens")
					usr.Homing_Shurikens()
				if(src.names=="Sovereign")
					usr.Sovereigns()
				if(src.names=="Sprenger Pentagon")
					usr.Sprenger_Pentagon()
				if(src.names=="Splitting Arrow")
					usr.Splitting_Arrow()
				if(src.names=="Darts")
					usr.Darts()
				if(src.names=="Universal Aging")
					usr.Universal_Aging()
				if(src.names=="Roar")
					usr.Roar()
				if(src.names=="Bum Rush")
					usr.Bum_Rush()
				if(src.names=="Pivotal Scene")
					usr.Pivotal_Scene()
				if(src.names=="Creamation")
					usr.Creamation()
				if(src.names=="Rocket")
					usr.Rocket()
				if(src.names=="Tentacle Attack")
					usr.Tentacle_Attack()
				if(src.names=="Tentacle Field")
					usr.Tentacle_Field()
				if(src.names=="Ryuten Soshun")
					usr.Acceleration()
				if(src.names=="Rasen")
					usr.Rasen()
				if(src.names=="Rengoku")
					usr.Rengoku()
				if(src.names=="Acceleration")
					usr.Acceleration()
				if(src.names=="Sennen Hyoro")
					usr.Sennen_Hyoro()
				if(src.names=="Black Fortress Blaze")
					usr.EncircleBlack()
				if(src.names=="Purple Fortress Blaze")
					usr.EncirlePurple()
				if(src.names=="Throm Fortress Blaze")
					usr.EncirleThrom()
				if(src.names=="Fortress Blaze")
					usr.Encircle()
				if(src.names=="Fortress Blaze Custom")
					usr.Encircle2()
				if(src.names=="Ruri iro Kujaku")
					usr.Yumi()
				if(src.names=="Tenran")
					usr.Tenran()
				if(src.names=="Hado 1")
					usr.Hado_1()
				if(src.names=="Mugetsu")
					usr.Mugetsu()
				if(src.names=="Getsuga Enhanced Blade")
					usr.Tensat()
				if(src.names=="Kido 90")
					usr.Coffin()
				if(src.names=="Power Blast")
					usr.Power_Blast()
				if(src.names=="El Directo")
					usr.El_Directo()
				if(src.names=="Diablo Besar")
					usr.Diablo_Besar()
				if(src.names=="Spear")
					usr.Spear()
				if(src.names=="Copy")
					usr.Copy()
				if(src.names=="Invisibility")
					usr.Invisibility()
				if(src.names=="Dragon Blast")
					usr.Dragon()
				if(src.names=="Throw")
					usr.Throw()
				if(src.names=="Slice and Dice")
					usr.Ichigo_Slash()
				if(src.names=="Slice")
					usr.KennyWide()
				if(src.names=="Frozen Heavens")
					usr.Frozen_Heavens()
				if(src.names=="Hakuteiken")
					usr.Hakuteiken()
				if(src.names=="RedHakuteiken")
					usr.HakuteikenCustom()
				if(src.names=="Sprenger")
					usr.Sprenger()
				if(src.names=="Ransoutengai")
					usr.Ransoutengai()
				if(src.names=="Haizen")
					usr.Haizen()
				if(src.names=="Gritz")
					usr.Gritz()
				if(src.names=="Volcore")
					usr.Volcore()
				if(src.names=="Los Lobos")
					usr.AdjWolf()
				if(src.names=="Raiho Burst")
					usr.LightningAOEStun()
				if(src.names=="Hakuren")
					usr.Hakuren()
				if(src.names=="Blades")
					//usr.Blades()
					usr<<"This skill is bugged"
				if(src.names=="Shoot Dragon")
					usr.Shoot_Dragon()
				if(src.names=="Blood Sheild")
					usr.Blood_Mist()
				if(src.names=="Nake")
					usr.Nake()
				if(src.names=="Wind Gust")
					usr.Weak_Push()
				if(src.names=="Getsuga Tenshou")
					usr.Getsuga_Tenshou()
				if(src.names=="Shuriken Toss")
					usr.Shuriken_Toss()
				if(src.names=="Bushogoma")
					usr.Bushogoma()
				if(src.names=="Benihikou")
					usr.Benihikou()
				if(src.names=="YoYo")
					usr.YoYo()
				if(src.names=="Pills")
					usr.Pills()
				if(src.names=="Wave")
					usr.Wave()
				if(src.names=="Desgarron")
					usr.Desgarron()
				if(src.names=="Homing Fire Blast")
					usr.Fire_Blue_Ball()
				if(src.names=="CeroWolf")
					usr.CeroWolf()
				if(src.names=="Ceros")
					usr.Cero3()
				if(src.names=="RapidShot")
					usr.RapidShot()
				if(src.names=="Bow")
					usr.Bow()
				if(src.names=="Final")
					usr.Final()
				if(src.names=="Shadow")
					usr.Shadow()
				if(src.names=="Ressurection")
					usr.Ressurection()
				if(src.names=="Arm1")
					usr.Arm1()
				if(src.names=="Hell_Armor")
					usr.Hell_Armor()
				if(src.names=="Arm2")
					usr.Arm2()
				if(src.names=="Fire Pillar")
					usr.FirePillar()
				if(src.names=="Fire Barrier")
					usr.CreateFireBarrier()
				if(src.names=="Fire Skurn")
					usr.SummonMinions()
				if(src.names=="Arm3")
					usr.Arm3()
				if(src.names=="Lamuerte")
					usr.Lamuerte()
				if(src.names=="Bala")
					usr.Bala()
				if(src.names=="Flash Step")
					usr.Flash_Step()
				if(src.names=="Wind Roar")
					usr.Bushogoma2()
				if(src.names=="Soukatsui")
					usr.Soukatsui()
				if(src.names=="Paw Slash")
					usr.WeakDesgarron()
				if(src.names=="Twilight Boost")
					usr.Twilight()
				if(src.names=="KiseRinnegan")
					usr.AkitoRinnegan()
				if(src.names=="Rinnegan")
					usr.AkitoRinnegan()
				if(src.names=="Shoen")
					usr.Shoen()
				if(src.names=="Power Burst")
					usr.Power_Burst()
				if(src.names=="Shikai")
					usr.Shikai()
				if(src.names=="Bankai")
					usr.Bankai()
				if(src.names=="Inner Mode")
					usr.Inner_Mode()
				if(src.names=="Final Bankai")
					usr.FinalBankai()
				if(src.names=="Byakurai")
					usr.Byakurai()
				if(src.names=="Raiho Ignite")
					usr.Raiho_Halberd()
				if(src.names=="Rikujoukourou")
					usr.Rikujoukourou()
				if(src.names=="Scene of Massacre")
					usr.Scene_of_Massacre()
				if(src.names=="Dark Pit")
					usr.Dark_Pit()
				if(src.names=="Raiho Bolt")
					usr.CCLightning_Bolt()
				if(src.names=="Cyclone Slash")
					usr.Cyclone_Slash()
				if(src.names=="Garganta")
					if(usr.z==23||usr.z==22||usr.z==24||usr.z==25||usr.z==17||usr.z==26||usr.key==currentPlayerTest)
						usr<<"Your powers are restricted here?!"
						return
					usr.Garganta()
				if(src.names=="Heat Blast")
					usr.HeatBlast()
				if(src.names=="Sai")
					usr.Sai()
				if(src.names=="Cero")
					usr.Cero()
				if(src.names=="Gran Rey Cero")
					usr.Cero2()
				if(src.names=="Susano")
					usr.BoostUpOuga()
				if(src.names=="Clone Spit")
					usr.Clone_Spit()
				if(src.names=="Reap")
					usr.Reap()
				if(src.names=="HollowRage")
					usr.HollowRage()
				if(src.names=="Water Wave")
					usr.Water_Wave()
				if(src.names=="Water Bullet")
					usr.Water_Doll_Bullet()
				if(src.names=="Water Bolt")
					usr.Water_Bolt()
				if(src.names=="Heavenly WaterFall")
					usr.Water_Heavens()
				if(src.names=="Commander Bolt")
					usr.Commander_Bolt()
				if(src.names=="Vandenreich Power")
					usr.VandBoost()
				if(src.names=="Wind Stream")
					usr.Wind_Quincy_Stream()
				if(src.names=="Commander Stream")
					usr.Commander_Stream()
				if(src.names=="Wind Bullet")
					usr.WindQuincyBullet()
				if(src.names=="Fire Commander Stream")
					usr.Fire_Commander_Stream()
				if(src.names=="Fire Stream")
					usr.Fire_Quincy_Stream()
				if(src.names=="Fire Bullet")
					usr.FireQuincyBullet()
				if(src.names=="Lightning Bullet")
					usr.LightningQuincyBullet()
				if(src.names=="Lightning Bolt")
					usr.Lightning_Bolt()
				if(src.names=="Sado ArmDP")
					usr.ArmDP()
				if(src.names=="Getsuga Jab")
					usr.SingleTileGetsuga()
				if(src.names=="Wind Barrier")
					usr.CreateWindBarrier()
				if(src.names=="Wingrar Pluma")
					usr.Wingrar()
				if(src.names=="Devrar Pluma")
					usr.Devrar()
				if(src.names=="Rapid Flap")
					usr.AguilaKnockBack()
				if(src.names=="Tekkai")
					usr.SadoTekkai()
				if(src.names=="Wing Stun")
					usr.WingStun()
				if(src.names=="Hyosuke Stun")
					usr.HyosukeStun()
				if(src.names=="Infinity Ball")
					usr.DirectionBlast()
				if(src.names=="Death Wave")
					usr.DecayWave()
				if(src.names=="Samurai Freeze")
					usr.SwordFBStun()
				if(src.names=="Samurai Jab")
					usr.SpearJabIce()
				if(src.names=="Samurai Barrage")
					usr.Fire_Barrage()
				if(src.names=="Ress AoE Heal")
					usr.Healingcustom()
				if(src.names=="Ress AoE Knock")
					usr.ApolloPush()
				if(src.names=="Healer Basic Attack")
					usr.HealerAttack()
				if(src.names=="Pheonix Ball")
					usr.homingfireball()
				if(src.names=="Blue Fire Pillar")
					usr.FirePillarBlue()
				if(src.names=="Blade Barrage")
					usr.Blade_Barrage()
				//matsuricopy
				if(src.names=="Pink Mugetsu")
					usr.Pink_Mugetsu()
				if(src.names=="PrinceRewardShot")
					usr.PrinceRewardShot()
				if(src.names=="Freezing Mary")
					usr.FreezingMary()
				if(src.names=="Ice Breath")
					usr.SpearJabIce2()
				if(src.names=="The Boost Chase That D")
					usr.FatBoysBoost()
				if(src.names=="Ace's Supa Boost")
					usr.AcesBoost()
				if(src.names=="Sakasama no Sekai")
					usr.ShinjiWorld()
				if(src.names=="Full Random Blast")
					usr.Random_Blast()
				if(src.names=="Boost of Peace")
					usr.PeaceBoost()
				if(src.names=="Hidden Boost")
					usr.YipBoost()
				if(src.names=="Wound Swap")
					usr.WoundSwap()
				if(src.names=="Hollow Zangetsu")
					usr.HollowZangetsu()
				if(src.names=="Gedon Kido")
					usr.GedonKido()
				if(src.names=="Take Power")
					usr.TakePower()
				if(src.names=="Give Power")
					usr.GivePower()
				if(prob(10))
					if(usr.truereiatsu>=20000)
						return
					else
						usr.truereiatsu++
						usr.mrei++

												//gota make this pink
				//if(src.names=="Koso_Renbu")
				//	usr.Koso_Renbu()						//gota add this
				//end matsuricopy
			..()
		M1
			screen_loc = "12,1" //X and Y for location on screen
		M2
			screen_loc = "13,1"
		Minventory
			icon='Icons/UI2 Buttons.dmi'
			icon_state="Bag"
			screen_loc = "2,15"
			layer=999
			Click()
				if(istype(usr,/mob/player/))
					usr.Inventory()
		Mskill
			icon='Icons/UI2 Buttons.dmi'
			icon_state="Skill"
			screen_loc = "1,15"
			Click()
				if(istype(usr,/mob/player/))
					usr.Skills()
		M3
			screen_loc = "14,1"
		Mo
			screen_loc = "15,1"
		Mp
			screen_loc = "16,1"
		M4
			screen_loc = "3,1"
		M5
			screen_loc = "4,1"
		M6
			screen_loc = "5,1"
		M7
			screen_loc = "6,1"
		M8
			screen_loc = "7,1"
		M9
			screen_loc = "8,1"
		M0
			screen_loc = "9,1"
		Msub
			screen_loc = "10,1"
		Mequ
			screen_loc = "11,1"
		Mq
			screen_loc = "1,1"
		Me
			screen_loc = "2,1"
		Mpar
			screen_loc = "17,1"
		My
			screen_loc = "17,2"
	//	Mw
	//		screen_loc = "1,2"
		Mskill1
			icon_state="1"
			screen_loc = "3,2"
		Mskill2
			icon_state="2"
			screen_loc = "4,2"
		Mskill3
			icon_state="3"
			screen_loc = "5,2"
		Mskill4
			icon_state="4"
			screen_loc = "6,2"
		Mskill5
			icon_state="5"
			screen_loc = "7,2"
		Mskill6
			icon_state="6"
			screen_loc = "8,2"
		Mskill7
			icon_state="7"
			screen_loc = "9,2"
		Mskill8
			icon_state="8"
			screen_loc = "10,2"
		Mskill9
			icon_state="9"
			screen_loc = "11,2"
		Mskill0
			icon_state="0"
			screen_loc = "12,2"
		Mskill11
			icon_state="-"
			screen_loc = "13,2"
		Mskill12
			icon_state="="
			screen_loc = "14,2"
		Mskill13
			icon_state="o"
			screen_loc = "15,2"
		Mskill14
			icon_state="p"
			screen_loc = "16,2"
		Mskill15
			icon_state="q"
			screen_loc = "1,2"
		Mskill16
			icon_state="e"
			screen_loc = "2,2"
		Mskill17
			icon_state="t"
			screen_loc = "17,2"
		Mskill18
			icon_state="y"
			screen_loc = "17,3"
	//	Mskill19
	//		icon_state="w"
	//		screen_loc = "1,3"

	skillcard
		icon = 'gui.dmi'

		/*MouseUp() //When mouse is released over the object
			for(var/obj/skillcard/o in usr)
				if(o.names == src.names)
					usr.Click(src)*/

		MouseDrag()
			if(src in usr.contents)
				var/icon/I = new(src.icon,src.icon_state)
				mouse_drag_pointer = I

		MouseDrop(over_object)
			var/obj/hud/s
			if(istype(over_object, /obj/hud/))
				if(istype(over_object,/obj/hud/M4))
					usr.skill1=src
				if(istype(over_object,/obj/hud/M5))
					usr.skill2=src
				if(istype(over_object,/obj/hud/M6))
					usr.skill3=src
				if(istype(over_object,/obj/hud/M7))
					usr.skill4=src
				if(istype(over_object,/obj/hud/M8))
					usr.skill5=src
				if(istype(over_object,/obj/hud/M9))
					usr.skill6=src
				if(istype(over_object,/obj/hud/M0))
					usr.skill7=src
				if(istype(over_object,/obj/hud/Msub))
					usr.skill8=src
				if(istype(over_object,/obj/hud/Mequ))
					usr.skill9=src
				if(istype(over_object,/obj/hud/M1))
					usr.skill0=src
				if(istype(over_object,/obj/hud/M2))
					usr.skillsub=src
				if(istype(over_object,/obj/hud/M3))
					usr.skillequ=src
				if(istype(over_object,/obj/hud/Mq))
					usr.skillq=src
				if(istype(over_object,/obj/hud/Me))
					usr.skille=src
				if(istype(over_object,/obj/hud/Mo))
					usr.skillo=src
				if(istype(over_object,/obj/hud/Mp))
					usr.skillp=src
				if(istype(over_object,/obj/hud/Mpar))
					usr.skillpar=src
				if(istype(over_object,/obj/hud/My))
					usr.skilly=src
			//	if(istype(over_object,/obj/hud/Mw))
			//		usr.skillw=src
				s=over_object
				s.overlays = null
				s.overlays += image(icon_state = src.icon_state)
				s.names = src.names
		proc
			Interact()
/*
	Now in this section all you have to do is define
	an object, and under the interact proc, have a proc/verb run
*/

		var/mob/M = new //set up reference to yourself, can be used throughout objects
		var/skill/skill

		test
			icon_state="w"
			Interact()
				M.Test_Proc_Usage() //Use the procedure of the defined variable
		test2
			icon_state="l"
			Interact()
				usr << "<font color = blue>[src]"
		test3
			icon_state="a"
			Interact()
				usr << "<font color = green>[src]"
		test4
			icon_state="c"
			Interact()
				usr << "<font color = red>[src] ([M.key])" //also display M's key
obj/skillcard/var
	iszan=0
obj/skillcard
	Dark_Pit
		names = "Dark Pit"
		icon = 'gui.dmi'
		icon_state = "Dark Pit"
		layer = MOB_LAYER+100
		iszan=1
	Rikujoukourou
		names = "Rikujoukourou"
		icon = 'gui.dmi'
		icon_state = "Rikujoukourou"
		layer = MOB_LAYER+100
	Cyclone_Slash
		names = "Cyclone Slash"
		icon = 'gui.dmi'
		icon_state = "cyclone slash"
		layer = MOB_LAYER+100
		iszan=1
	Garganta
		names = "Garganta"
		icon = 'gui.dmi'
		icon_state = "garganta"
		layer = MOB_LAYER+100
	Inner_Mode
		names = "Inner Mode"
		icon = 'gui.dmi'
		icon_state = "Vaizard"
		layer = MOB_LAYER+100
	Power_Burst
		names = "Power Burst"
		icon = 'gui.dmi'
		icon_state = "Power Burst"
		layer = MOB_LAYER+100
	Utsusemi
		names = "Utsusemi"
		icon = 'gui.dmi'
		icon_state = "Bum Rush"
		layer= MOB_LAYER+100
	Byakurai
		names = "Byakurai"
		icon = 'gui.dmi'
		icon_state = "Byakurai"
		layer = MOB_LAYER+100
	Shoen
		names = "Shoen"
		icon = 'gui.dmi'
		icon_state = "Shoen"
		layer = MOB_LAYER+100
		iszan=1
	Soukatsui
		names = "Soukatsui"
		icon = 'gui.dmi'
		icon_state = "Soukatsui"
		layer = MOB_LAYER+100
	Cero
		names = "Cero"
		icon = 'gui.dmi'
		icon_state = "Cero"
		layer = MOB_LAYER+100
	Gran_Rey_Cero
		names = "Gran Rey Cero"
		icon = 'gui.dmi'
		icon_state = "Gran Rey Cero"
		layer = MOB_LAYER+100
	Bala
		names = "Bala"
		icon = 'gui.dmi'
		icon_state = "Bala"
		layer = MOB_LAYER+100
	Flash_Step
		names = "Flash Step"
		icon = 'gui.dmi'
		icon_state = "shunpo"
		layer = MOB_LAYER+100
	Shadow
		names = "Shadow"
		icon = 'gui.dmi'
		icon_state = "shadow"
		layer = MOB_LAYER+100
		iszan=1
	Bow
		names = "Bow"
		icon = 'gui.dmi'
		icon_state = "bow"
		layer = MOB_LAYER+100
	Final
		names = "Final"
		icon = 'gui.dmi'
		icon_state = "final"
		layer = MOB_LAYER+100
	RapidShot
		names = "RapidShot"
		icon = 'gui.dmi'
		icon_state = "rapidshot"
		layer = MOB_LAYER+100
	Ceros
		names = "Ceros"
		icon = 'gui.dmi'
		icon_state = "ceros"
		layer = MOB_LAYER+100
		iszan=1
	HomingBlueFire
		names = "Homing Fire Blast"
		icon = 'gui.dmi'
		icon_state = "Homing Blast"
		layer = MOB_LAYER+100
	CeroWolf
		names = "CeroWolf"
		icon = 'gui.dmi'
		icon_state = "wolf"
		layer = MOB_LAYER+100
		iszan=1
	Desgarron
		names = "Desgarron"
		icon = 'gui.dmi'
		icon_state = "desgarron"
		layer = MOB_LAYER+100
		iszan=1

	Pills
		names = "Pills"
		icon = 'gui.dmi'
		icon_state = "pill"
		layer = MOB_LAYER+100
		iszan=1
	YoYo
		names = "YoYo"
		icon = 'gui.dmi'
		icon_state = "YoYo"
		layer = MOB_LAYER+100
		iszan=1
	Cero_Obscura
		names = "Cero Obscura"
		icon = 'gui.dmi'
		icon_state = "ceroobscura"
		layer = MOB_LAYER+100
		iszan=1
	Benihikou
		names = "Benihikou"
		icon = 'gui.dmi'
		icon_state = "Benihikou"
		layer = MOB_LAYER+100
		iszan=1
	Bushogoma
		names = "Bushogoma"
		icon = 'gui.dmi'
		icon_state = "Bushogoma"
		layer = MOB_LAYER+100
		iszan=1
	Shuriken_Toss
		names = "Shuriken Toss"
		icon = 'gui.dmi'
		icon_state = "shuriken"
		layer = MOB_LAYER+100
		iszan=1
	Getsuga_Tenshou
		names = "Getsuga Tenshou"
		icon = 'gui.dmi'
		icon_state = "Getsuga Tenshou"
		layer = MOB_LAYER+100
		iszan=1
	Nake
		names = "Nake"
		icon = 'gui.dmi'
		icon_state = "Nake"
		layer = MOB_LAYER+100
		iszan=1
	Blood_Sheild
		names = "Blood Sheild"
		icon = 'gui.dmi'
		icon_state = "Blood Sheild"
		layer = MOB_LAYER+100
		iszan=1
	Shoot_Dragon
		names = "Shoot Dragon"
		icon = 'gui.dmi'
		icon_state = "Shoot Dragon"
		layer = MOB_LAYER+100
		iszan=1
	Blades
		names = "Blades"
		icon = 'gui.dmi'
		icon_state = "Blades"
		layer = MOB_LAYER+100
		iszan=1
	Hakuren
		names = "Hakuren"
		icon = 'gui.dmi'
		icon_state = "Hakuren"
		layer = MOB_LAYER+100
		iszan=1
	Ransoutengai
		names = "Ransoutengai"
		icon = 'gui.dmi'
		icon_state = "Ransoutengai"
		layer = MOB_LAYER+100
	Haizen
		names = "Haizen"
		icon = 'gui.dmi'
		icon_state = "Haizen"
		layer = MOB_LAYER+100
	Gritz
		names = "Gritz"
		icon = 'gui.dmi'
		icon_state = "Gritz"
		layer = MOB_LAYER+100
	Volcore
		names = "Volcore"
		icon = 'gui.dmi'
		icon_state = "Volcore"
		layer = MOB_LAYER+100
	Sprenger
		names = "Sprenger"
		icon = 'gui.dmi'
		icon_state = "Sprenger"
		layer = MOB_LAYER+100
	Hakuteiken
		names = "Hakuteiken"
		icon = 'gui.dmi'
		icon_state = "Hakuteiken"
		layer = MOB_LAYER+100
		iszan=1
	RedHakuteiken
		names = "RedHakuteiken"
		icon = 'gui.dmi'
		icon_state = "Hakuteiken2"
		layer = MOB_LAYER+100
		iszan=1

	Frozen_Heavens
		names = "Frozen Heavens"
		icon = 'gui.dmi'
		icon_state = "Frozen Heavens"
		layer = MOB_LAYER+100
		iszan=1
	Ultimate
		names = "Ultimate"
		icon = 'gui.dmi'
		icon_state = "Ultimate"
		layer = MOB_LAYER+100
	Ichigo_Slash
		names = "Slice and Dice"
		icon = 'gui.dmi'
		icon_state = "Ichigo Slash"
		layer = MOB_LAYER+100
		iszan=1
	Throw
		names = "Throw"
		icon = 'gui.dmi'
		icon_state = "Throw"
		layer = MOB_LAYER+100
		iszan=1
	Dragon_Blast
		names = "Dragon Blast"
		icon = 'gui.dmi'
		icon_state = "Dragon Blast"
		layer = MOB_LAYER+100
		iszan=1
	Spear
		names = "Spear"
		icon = 'gui.dmi'
		icon_state = "Spear"
		layer = MOB_LAYER+100
		iszan=1
	Copy
		names = "Copy"
		icon = 'gui.dmi'
		icon_state = "clones"
		layer = MOB_LAYER+100
		iszan=1
	Invisibility
		names = "Invisibility"
		icon = 'gui.dmi'
		icon_state = "invisibility"
		layer = MOB_LAYER+100
		iszan=1
	El_Directo
		names = "El Directo"
		icon = 'gui.dmi'
		icon_state = "el directo"
		layer = MOB_LAYER+100
	Diablo_Besar
		names = "Diablo Besar"
		icon = 'gui.dmi'
		icon_state = "diablo besar"
		layer = MOB_LAYER+100
	Power_Blast
		names = "Power Blast"
		icon = 'gui.dmi'
		icon_state = "power blast"
		layer = MOB_LAYER+100
	Kido_90
		names = "Kido 90"
		icon = 'gui.dmi'
		icon_state = "coffin"
		layer = MOB_LAYER+100
	Clone_Spit
		names = "Clone Spit"
		icon = 'gui.dmi'
		icon_state = "clones"
		layer = MOB_LAYER+100
		iszan=1
	Reap
		names = "Reap"
		icon = 'gui.dmi'
		icon_state = "reap"
		layer = MOB_LAYER+100
		iszan=1
	Getsuga_Enhanced_Blade
		names = "Getsuga Enhanced Blade"
		icon = 'gui.dmi'
		icon_state = "gtb"
		layer = MOB_LAYER+100
		iszan=1
	Final_Bankai
		names = "Final Bankai"
		icon = 'gui.dmi'
		icon_state = "finalb"
		layer = MOB_LAYER+100
	Mugetsu
		names = "Mugetsu"
		icon = 'gui.dmi'
		icon_state = "mugetsu"
		layer = MOB_LAYER+100
	Hado_1
		names = "Hado 1"
		icon = 'gui.dmi'
		icon_state = "hado1"
		layer = MOB_LAYER+100
	Tenran
		names = "Tenran"
		icon = 'gui.dmi'
		icon_state = "tenran"
		layer = MOB_LAYER+100
	Ruri_iro_Kujaku
		names = "Ruri iro Kujaku"
		icon = 'gui.dmi'
		icon_state = "yumi"
		iszan=1
	Black_Fortress_Blaze
		names = "Black Fortress Blaze"
		icon = 'gui.dmi'
		icon_state = "bencircle"
		layer = MOB_LAYER+100
	Purple_Fortress_Blaze
		names = "Purple Fortress Blaze"
		icon = 'gui.dmi'
		icon_state = "pencircle"
		layer = MOB_LAYER+100
	Throm_Fortress_Blaze
		names = "Throm Fortress Blaze"
		icon = 'gui.dmi'
		icon_state = "pencircle"
		layer = MOB_LAYER+100
		//iszan=1
	Fortress_Blaze_Custom
		names = "Fortress Blaze Custom"
		icon = 'gui.dmi'
		icon_state = "encircle"
		layer = MOB_LAYER+100
		iszan=1
	Fortress_Blaze
		names = "Fortress Blaze"
		icon = 'gui.dmi'
		icon_state = "encircle"
		layer = MOB_LAYER+100
		iszan=1
	Sennen_Hyoro
		names = "Sennen Hyoro"
		icon = 'gui.dmi'
		icon_state = "sennen"
		layer = MOB_LAYER+100
		iszan=1
	Water_Tornado
		names = "Water Tornado"
		icon = 'gui.dmi'
		icon_state = "water tornado"
		layer = MOB_LAYER+100
		iszan=1
	Acceleration
		names = "Acceleration"
		icon = 'gui.dmi'
		icon_state = "acceleration"
		layer = MOB_LAYER+100
		iszan=1
	Tentacle_Attack
		names = "Tentacle Attack"
		icon = 'gui.dmi'
		icon_state = "tentacle"
		layer = MOB_LAYER+100
		iszan=1
	Rocket
		names = "Rocket"
		icon = 'gui.dmi'
		icon_state = "rocket"
		layer = MOB_LAYER+100
		iszan=1
	Creamation
		names = "Creamation"
		icon = 'gui.dmi'
		icon_state = "creamation"
		layer = MOB_LAYER+100
		iszan=1
	Pivotal_Scene
		names = "Pivotal Scene"
		icon = 'gui.dmi'
		icon_state = "pivotal"
		layer = MOB_LAYER+100
		iszan=1
	Bum_Rush
		names = "Bum Rush"
		icon = 'gui.dmi'
		icon_state = "Bum Rush"
		layer = MOB_LAYER+100
	Roar
		names = "Roar"
		icon = 'gui.dmi'
		icon_state = "roar"
		layer = MOB_LAYER+100
	Universal_Aging
		names = "Universal Aging"
		icon = 'gui.dmi'
		icon_state = "drain"
		layer = MOB_LAYER+100
		iszan=1
	Aging_Barrier
		names = "Aging Barrier"
		icon = 'gui.dmi'
		icon_state = "drain"
		layer = MOB_LAYER+100
		iszan=1
	Darts
		names = "Darts"
		icon = 'gui.dmi'
		icon_state = "darts"
		layer = MOB_LAYER+100
		iszan=1
	Quake_Quake_Punch
		names = "Quake Quake Punch"
		icon = 'gui.dmi'
		icon_state = "glove1"
		layer = MOB_LAYER+100
	Splitting_Arrow
		names = "Splitting Arrow"
		icon = 'gui.dmi'
		icon_state = "splittingarrow"
		layer = MOB_LAYER+100
	Sprenger_Pentagon
		names = "Sprenger Pentagon"
		icon = 'gui.dmi'
		icon_state = "pentagon"
		layer = MOB_LAYER+100
	Sovereign
		names = "Sovereign"
		icon = 'gui.dmi'
		icon_state = "sovereign"
		layer = MOB_LAYER+100
		iszan=1
	Cero_Pack
		names = "Cero Pack"
		icon = 'gui.dmi'
		icon_state = "pack"
		layer = MOB_LAYER+100
		iszan=1
	Homing_Shurikens
		names = "Homing Shurikens"
		icon = 'gui.dmi'
		icon_state = "hs"
		layer = MOB_LAYER+100
		iszan=1
	Berserk
		names = "Berserk"
		icon = 'gui.dmi'
		icon_state = "berserk"
		layer = MOB_LAYER+100
		iszan=1
	Create_Monsters
		names = "Create Monsters"
		icon = 'gui.dmi'
		icon_state = "monsters"
		layer = MOB_LAYER+100
		iszan=1
	Create_Mini_Kushanada
		names = "Create_Mini_Kushanada"
		icon = 'gui.dmi'
		icon_state = "reaper2"
		layer = MOB_LAYER+100
	Instant_Regen
		names = "Instant Regen"
		icon = 'gui.dmi'
		icon_state = "instant regen"
		layer = MOB_LAYER+100
	Arrancar_Release
		names = "Arrancar Release"
		icon = 'gui.dmi'
		icon_state = "arrancar release"
		layer = MOB_LAYER+100
	Release_Color
		names = "Release Color"
		icon = 'gui.dmi'
		icon_state = "crelease"
		layer = MOB_LAYER+100
	Criss_Cross
		names = "Criss Cross"
		icon = 'gui.dmi'
		icon_state = "criss cross"
		layer = MOB_LAYER+100
		iszan=1
	Petal_Sword
		names = "Petal Sword"
		icon = 'gui.dmi'
		icon_state = "petal sword"
		layer = MOB_LAYER+100
		iszan=1
	Explode
		names = "Explode"
		icon = 'gui.dmi'
		icon_state = "explode"
		layer = MOB_LAYER+100
		iszan=1
	Heavy_Hit
		names = "Heavy Hit"
		icon = 'gui.dmi'
		icon_state = "heavy"
		layer = MOB_LAYER+100
		iszan=1
	Flashing_Attack
		names = "Flashing Attack"
		icon = 'gui.dmi'
		icon_state = "flashing melee"
		layer = MOB_LAYER+100
	Contrict
		names = "Constrict"
		icon = 'gui.dmi'
		icon_state = "constrict"
		layer = MOB_LAYER+100
		iszan=1
	Zanpaktou_Seal
		names = "Zanpaktou Seal"
		icon = 'gui.dmi'
		icon_state = "seal"
		layer = MOB_LAYER+100
		iszan=1
	Materialize
		names = "Materialize"
		icon = 'gui.dmi'
		icon_state = "materialize"
		layer = MOB_LAYER+100
		iszan=1
	Invisible_Wires
		names = "Invisible Wires"
		icon = 'gui.dmi'
		icon_state = "wires"
		layer = MOB_LAYER+100
		iszan=1
	Zanpaktou_Instincts
		names = "Zanpaktou Instincts"
		icon = 'gui.dmi'
		icon_state = "zan instinct"
		layer = MOB_LAYER+100
		iszan=1
	Illusionary_Death
		names = "Illusionary Death"
		icon = 'gui.dmi'
		icon_state = "illusion"
		layer = MOB_LAYER+100
		iszan=1
	Restep
		names = "Restep"
		icon = 'gui.dmi'
		icon_state = "restep"
		layer = MOB_LAYER+100
		iszan=1
	Outrage
		names = "Outrage"
		icon = 'gui.dmi'
		icon_state = "outrage"
		layer = MOB_LAYER+100
		iszan=1
	Laceration
		names = "Laceration"
		icon = 'gui.dmi'
		icon_state = "laceration"
		layer = MOB_LAYER+100
		iszan=1
	Fullbring
		names = "Fullbring"
		icon = 'gui.dmi'
		icon_state = "fullbring"
		layer = MOB_LAYER+100
	Save_Freeze
		names = "Save Freeze"
		icon = 'gui.dmi'
		icon_state = "save"
		layer = MOB_LAYER+100
		iszan=1
	Game_Trap
		names = "Game Trap"
		icon = 'gui.dmi'
		icon_state = "game"
		layer = MOB_LAYER+100
		iszan=1
	Bringer_Blast
		names = "Bringer Blast"
		icon = 'gui.dmi'
		icon_state = "bringer blast"
		layer = MOB_LAYER+100
		iszan=1
	Illusion
		names = "Illusion"
		icon = 'gui.dmi'
		icon_state = "illusions"
		layer = MOB_LAYER+100
		iszan=1
	Getsuga_Ring
		names = "Getsuga Ring"
		icon = 'gui.dmi'
		icon_state = "getsuga ring"
		layer = MOB_LAYER+100
		iszan=1
	Critical_Hit
		names = "Critical Hit"
		icon = 'gui.dmi'
		icon_state = "critical"
		layer = MOB_LAYER+100
		iszan=1
	First_Hit
		names = "First Hit"
		icon = 'gui.dmi'
		icon_state = "first hit"
		layer = MOB_LAYER+100
		iszan=1
	Second_Hit
		names = "Second Hit"
		icon = 'gui.dmi'
		icon_state = "second hit"
		layer = MOB_LAYER+100
		iszan=1
	Third_Hit
		names = "Third Hit"
		icon = 'gui.dmi'
		icon_state = "third hit"
		layer = MOB_LAYER+100
		iszan=1
	Forth_Hit
		names = "Forth Hit"
		icon = 'gui.dmi'
		icon_state = "forth hit"
		layer = MOB_LAYER+100
		iszan=1
	Memory_Strikes
		names = "Memory Strike"
		icon = 'gui.dmi'
		icon_state = "mem strike"
		layer = MOB_LAYER+100
		iszan=1
	Advanced_Fullbring
		names = "Advanced Fullbring"
		icon = 'gui.dmi'
		icon_state = "afullbring"
		layer = MOB_LAYER+100
	Poison
		names = "Poison"
		icon = 'gui.dmi'
		icon_state = "poison"
		layer = MOB_LAYER+100
		iszan=1
	Rev_Up
		names = "Rev Up"
		icon = 'gui.dmi'
		icon_state = "rev up"
		layer = MOB_LAYER+100
		iszan=1
	Sovereign_Wave
		names = "Sovereign Wave"
		icon = 'gui.dmi'
		icon_state = "sov wave"
		layer = MOB_LAYER+100
		iszan=1
	Cascada
		names = "Cascada"
		icon = 'gui.dmi'
		icon_state = "flood"
		layer = MOB_LAYER+100
		iszan=1
	Ola_Azul
		names = "Ola Azul"
		icon = 'gui.dmi'
		icon_state = "ola"
		layer = MOB_LAYER+100
		iszan=1
	La_Gota
		names = "La Gota"
		icon = 'gui.dmi'
		icon_state = "la gota"
		layer = MOB_LAYER+100
		iszan=1
	Zen
		names = "Zen"
		icon = 'gui.dmi'
		icon_state = "ssjd"
		layer = MOB_LAYER+100
	Fat_Boy
		names = "Fat Boy"
		icon = 'gui.dmi'
		icon_state = "ssjd"
		layer = MOB_LAYER+100
	Sharingan
		names = "Super Saiyan"
		icon = 'gui.dmi'
		icon_state = "ssj"
		layer = MOB_LAYER+100
	Baboon_Blast
		names = "Baboon Blast"
		icon = 'gui.dmi'
		icon_state = "baboon blast"
		layer = MOB_LAYER+100
		iszan=1
	Bankai_Extraction
		names = "Bankai Extraction"
		icon = 'gui.dmi'
		icon_state = "bankai extraction"
		layer = MOB_LAYER+100
	Reiatsu_Blast
		names = "Reiatsu Blast"
		icon = 'gui.dmi'
		icon_state = "reiatsu blast"
		layer = MOB_LAYER+100
	Spiritual_Pressure
		names = "Spiritual Pressure"
		icon = 'gui.dmi'
		icon_state = "pressure"
		layer = MOB_LAYER+100
	Delete_Profile
		names = "Delete Profile"
		icon = 'gui.dmi'
		icon_state = "del"
		layer = MOB_LAYER+100
		iszan=1
	Ice_Freeze
		names = "Ice Freeze"
		icon = 'gui.dmi'
		icon_state = "ice freeze"
		layer = MOB_LAYER+100
		iszan=1
	Shirafune
		names = "Shirafune"
		icon = 'gui.dmi'
		icon_state = "shirafune"
		layer = MOB_LAYER+100
		iszan=1
	Double_Fire
		names = "Double Fire"
		icon = 'gui.dmi'
		icon_state = "Double Fire"
		layer = MOB_LAYER+100
	Flash_Smash
		names = "Flash Smash"
		icon = 'gui.dmi'
		icon_state = "Flash Smash"
		layer = MOB_LAYER+100
	Lethal_Poison
		names = "Lethal Poison"
		icon = 'gui.dmi'
		icon_state = "Lethal Poison"
		layer = MOB_LAYER+100
		iszan=1
	Scatter_Shot
		names = "Scatter Shot"
		icon = 'gui.dmi'
		icon_state = "Scatter Shot"
		layer = MOB_LAYER+100
		iszan=1
	Hinamori_Blast_Toggle
		names = "Hinamori Blast Toggle"
		icon = 'gui.dmi'
		icon_state = "Hinamori Blast Toggle"
		layer = MOB_LAYER+100
		iszan=1
	Ruthlessness
		names = "Ruthlessness"
		icon = 'gui.dmi'
		icon_state = "Ruthlessness"
		layer = MOB_LAYER+100
	Hollow_Screech
		names = "Hollow Screech"
		icon = 'gui.dmi'
		icon_state = "Hollow Screech"
		layer = MOB_LAYER+100
	Heat_Wave
		names = "Heat Wave"
		icon = 'gui.dmi'
		icon_state = "Heat Wave"
		layer = MOB_LAYER+100
		iszan=1
	Reflect
		names = "Reflect"
		icon = 'gui.dmi'
		icon_state = "Reflect"
		layer = MOB_LAYER+100
	Return_Blast
		names = "Return Blast"
		icon = 'gui.dmi'
		icon_state = "Return Blast"
		layer = MOB_LAYER+100
		iszan=1
	Tshunko
		names = "Twilight Shunko"
		icon = 'gui.dmi'
		icon_state = "Shunko"
		layer = MOB_LAYER+100
	Shunko
		names = "Shunko"
		icon = 'gui.dmi'
		icon_state = "Shunko"
		layer = MOB_LAYER+100
	Vasto_Form
		names = "Vasto Form"
		icon = 'gui.dmi'
		icon_state = "Vasto Form"
		layer = MOB_LAYER+100
	Pure_Atk
		names = "Pure Atk"
		icon = 'gui.dmi'
		icon_state = "pure atk"
		layer = MOB_LAYER+100
	Pure_Rei
		names = "Pure Rei"
		icon = 'gui.dmi'
		icon_state = "pure rei"
		layer = MOB_LAYER+100
	Pure_Def
		names = "Pure Def"
		icon = 'gui.dmi'
		icon_state = "pure def"
		layer = MOB_LAYER+100
	Regeneration_Mode
		names = "Regeneration Mode"
		icon = 'gui.dmi'
		icon_state = "Regeneration Mode"
		layer = MOB_LAYER+100
		iszan=1
	Reversal_Healing
		names = "Reversal Healing"
		icon = 'gui.dmi'
		icon_state = "Reversal Healing"
		layer = MOB_LAYER+100
		iszan=1
	Healing
		names = "Healing"
		icon = 'gui.dmi'
		icon_state = "Healing"
		layer = MOB_LAYER+100
		iszan=1
	Bankai_Version_2
		names = "Bankai Version 2"
		icon = 'gui.dmi'
		icon_state = "bankai2"
		layer = MOB_LAYER+100
		iszan=1
	Bankai_Skill
		names = "Bankai Skill"
		icon = 'gui.dmi'
		icon_state = "bankai skill"
		layer = MOB_LAYER+100
	Sense
		names = "Sense"
		icon = 'gui.dmi'
		icon_state = "sense"
		layer = MOB_LAYER+100
	Hide_Presence
		names = "Hide Presence"
		icon = 'gui.dmi'
		icon_state = "hide"
		layer = MOB_LAYER+100
	Zanpaktou_Skill
		names = "Zanpaktou Skill"
		icon = 'gui.dmi'
		icon_state = "bankai skill"
		layer = MOB_LAYER+100
	Sharingan_Reversal
		names = "Sharingan Reversal"
		icon = 'gui.dmi'
		icon_state = "Reversal Healing"
		layer = MOB_LAYER+100
	ThreeSixty
		names = "360 Palms"
		icon = 'gui.dmi'
		icon_state = "360"
		layer = MOB_LAYER+100
	Acceleration_Overdrive
		names = "Acceleration Overdrive"
		icon = 'gui.dmi'
		icon_state = "acceleration overdrive"
		layer = MOB_LAYER+100
	Blood_Thirsty
		names = "Blood_Thirsty"
		icon = 'gui.dmi'
		icon_state = "Blood Thirsty"
		layer = MOB_LAYER+100
	Power_Transfer
		names = "Power_Transfer"
		icon = 'gui.dmi'
		icon_state = "Power Transfer"
		layer = MOB_LAYER+100
	Koten_Zanshun
		names = "Koten Zanshun"
		icon = 'gui.dmi'
		icon_state = "Koten Zanshun"
		layer = MOB_LAYER+100
		iszan=1
	Soten_Kisshun
		names = "Soten Kisshun"
		icon = 'gui.dmi'
		icon_state = "Soten Kisshun"
		layer = MOB_LAYER+100
		iszan=1
	//dungeon healer skills
	Dungeon_AOE_Heal
		names="Dungeon AOE Heal"
		icon='Icons/gui.dmi'
		icon_state="Power Transfer"
		layer=MOB_LAYER+100
	Dungeon_Heal
		names="Dungeon Heal"
		icon='Icons/gui.dmi'
		icon_state="kidocorpheal"
		layer=MOB_LAYER+100
	Kido_Corp_Heal
		names="Heal Kido"
		icon='Icons/gui.dmi'
		icon_state="kidocorpheal"
		layer=MOB_LAYER+100
	Santen_Kesshun
		names = "Santen Kesshun"
		icon = 'gui.dmi'
		icon_state = "Santen Kesshun"
		layer = MOB_LAYER+100
		iszan=1
	Shiten_Koshun
		names = "Shiten Koshun"
		icon = 'gui.dmi'
		icon_state = "Shiten Koshun"
		layer = MOB_LAYER+100
		iszan=1
	Finalbring
		names = "Finalbring"
		icon = 'gui.dmi'
		icon_state = "Finalbring"
		layer = MOB_LAYER+100
	Ring_Parade
		names = "Ring Parade"
		icon = 'gui.dmi'
		icon_state = "Ring Parade"
		layer = MOB_LAYER+100
		iszan=1
	Power_Monsters
		names = "Power Monsters"
		icon = 'gui.dmi'
		icon_state = "Power Monsters"
		layer = MOB_LAYER+100
		iszan=1
	Critical_Stun
		names = "Critical Stun"
		icon = 'gui.dmi'
		icon_state = "Stun"
		layer = MOB_LAYER+100
		iszan=1
	Critical_Burst
		names = "Critical Burst"
		icon = 'gui.dmi'
		icon_state = "Burst"
		layer = MOB_LAYER+100
		iszan=1
	Harmful_Recoil
		names = "Harmful Recoil"
		icon = 'gui.dmi'
		icon_state = "Harmful Recoil"
		layer = MOB_LAYER+100
		iszan=1
	Kendo
		names = "Kendo"
		name="Kendo Slash"
		icon = 'gui.dmi'
		icon_state = "Kendo"
		layer = MOB_LAYER+100
		iszan=1
	Life_Contract
		names = "Life Contract"
		icon = 'gui.dmi'
		icon_state = "Life Contract"
		layer = MOB_LAYER+100
	Secret_Skill
		names = "Secret Skill"
		icon = 'gui.dmi'
		icon_state = "secret skill"
		layer = MOB_LAYER+100
		iszan=1
	Shibari
		names = "Shibari"
		icon = 'gui.dmi'
		icon_state = "shibari"
		layer = MOB_LAYER+100
		iszan=1
	Decimate
		names = "Decimate"
		icon='Icons/gui.dmi'
		icon_state="decimate"
		layer=MOB_LAYER+100
		iszan=1
	Shishkabob
		names = "Shishkabob"
		icon = 'gui.dmi'
		icon_state = "shishkabob"
		layer = MOB_LAYER+100
		iszan=1
	Wind_Push
		names = "Wind Push"
		icon = 'gui.dmi'
		icon_state = "wind push"
		layer = MOB_LAYER+100
		iszan=1
	Wind_Pull
		names = "Wind Pull"
		icon = 'gui.dmi'
		icon_state = "wind pull"
		layer = MOB_LAYER+100
		iszan=1
	Death_Note
		names = "Death Note"
		icon = 'gui.dmi'
		icon_state = "note"
		layer = MOB_LAYER+100
	Ice_Field
		names = "Ice Field"
		icon = 'gui.dmi'
		icon_state = "Hakuren"
		layer = MOB_LAYER+100
	Relic_Shock
		names = "Relic Shock"
		icon = 'gui.dmi'
		icon_state = "Relic Shock"
		layer = MOB_LAYER+100
	Particle_Crippler
		names = "Particle Crippler"
		icon = 'gui.dmi'
		icon_state = "Particle Crippler"
		layer = MOB_LAYER+100
	Chronicle_Explosion
		names = "Chronicle Explosion"
		icon = 'gui.dmi'
		icon_state = "Chronicle Explosion"
		layer = MOB_LAYER+100
	Carnage
		names = "Carnage"
		icon = 'gui.dmi'
		icon_state = "Carnage"
		layer = MOB_LAYER+100
	Extravagant_Emotions
		names = "Extravagant Emotions"
		icon = 'gui.dmi'
		icon_state = "Extravagant Emotions"
		layer = MOB_LAYER+100
	Bull_Arm
		names = "Bull Arm"
		icon = 'gui.dmi'
		icon_state = "Bull Arm"
		layer = MOB_LAYER+100
	Cero_Doble
		names = "Cero Doble"
		icon = 'gui.dmi'
		icon_state = "Cero"
		layer = MOB_LAYER+100
		iszan=1
	Random_Stretch
		names = "Random Stetch"
		icon = 'gui.dmi'
		icon_state= "tentacle"
		layer = MOB_LAYER+100
	Stretch
		names = "Stretch"
		icon = 'gui.dmi'
		icon_state = "poison"
		layer = MOB_LAYER+100
		iszan=1
	Drainage
		names = "Drainage"
		icon = 'gui.dmi'
		icon_state = "drainage"
		layer = MOB_LAYER+100
		iszan=1
	Segunda_Ress
		names = "Segunda Ress"
		icon = 'gui.dmi'
		icon_state = "ress 2"
		layer = MOB_LAYER+100
	Limit_Release
		names = "Limit Release"
		icon = 'gui.dmi'
		icon_state = "Limit Release"
		layer = MOB_LAYER+100

	Limit_Release_Custom
		names = "Limit Release Custom"
		icon = 'gui.dmi'
		icon_state = "Limit Release"
		layer = MOB_LAYER+100
	Boost_Negation
		names = "Boost Negation"
		icon = 'gui.dmi'
		icon_state = "zan instinct"
		layer = MOB_LAYER+100
		iszan=1
	Release_Seal
		names = "Release Seal"
		icon = 'gui.dmi'
		icon_state = "seal"
		layer = MOB_LAYER+100
		iszan=1
	Raikouhou
		names = "Raikouhou"
		icon = 'gui.dmi'
		icon_state = "Raikouhou"
		layer = MOB_LAYER+100
		iszan=1
	Extend
		names = "Extend"
		icon = 'gui.dmi'
		icon_state = "Extend"
		layer = MOB_LAYER+100
		iszan=1
	Rage_Spin
		names = "Rage Spin"
		icon = 'gui.dmi'
		icon_state = "Rage Spin"
		layer = MOB_LAYER+100
		iszan=1
	Blut_Veine
		names = "Ruthlessness"
		icon = 'gui.dmi'
		icon_state = "Extravagant Emotions"
		layer = MOB_LAYER+100
	Negacion
		names = "Negacion"
		icon = 'gui.dmi'
		icon_state = "Negacion"
		layer = MOB_LAYER+100
	Air_Bullet
		names = "Air Bullet"
		icon = 'gui.dmi'
		icon_state = "Air Bullet"
		layer = MOB_LAYER+100
		iszan=1
	Air_Strike
		names = "Air Strike"
		icon = 'gui.dmi'
		icon_state = "Air Strike"
		layer = MOB_LAYER+100
		iszan=1
	Dual_Swords
		names = "Dual Swords"
		icon = 'gui.dmi'
		icon_state = "dual swords"
		layer = MOB_LAYER+100
		iszan=1
	Trip
		names = "Trip"
		icon = 'gui.dmi'
		icon_state = "Trip"
		layer = MOB_LAYER+100
	Kamikaze
		names = "Kamikaze"
		icon = 'gui.dmi'
		icon_state = "Kamikaze"
		layer = MOB_LAYER+100
	Itto_Kasu
		names = "Itto Kasu"
		icon = 'gui.dmi'
		icon_state = "Itto Kasu"
		layer = MOB_LAYER+100
		iszan=1
	Danku
		names = "Danku"
		icon = 'gui.dmi'
		icon_state = "Danku"
		layer = MOB_LAYER+100
		iszan=1
	ShadowAttack
		name="Shadow Attack"
		layer = MOB_LAYER+100
	FullDanku
		names="Full Danku"
		icon='Icons/gui.dmi'
		icon_state="Danku"
		layer=MOB_LAYER+100
		iszan=1
	Sai
		names = "Sai"
		icon = 'gui.dmi'
		icon_state = "sai"
		layer = MOB_LAYER+100
		iszan=1
	Heat_Blast
		names="Heat Blast"
		icon='Icons/gui.dmi'
		icon_state="heatblast"
		layer=MOB_LAYER+100
	Shitotsu_Sansen
		names = "Shitotsu Sansen"
		icon = 'gui.dmi'
		icon_state = "Shitotsu Sansen"
		layer = MOB_LAYER+100
		iszan=1
	Jomon
		names = "Jomon"
		icon = 'gui.dmi'
		icon_state = "Jomon"
		layer = MOB_LAYER+100
		iszan=1
	Raihou
		names = "Raihou"
		icon = 'gui.dmi'
		icon_state = "Raihou"
		layer = MOB_LAYER+100
		iszan=1
	Shakkahou
		names = "Shakkahou"
		icon = 'gui.dmi'
		icon_state = "Shakkahou"
		layer = MOB_LAYER+100
		iszan=1
	WaterBullet
		names="Water Bullet"
		icon='Icons/gui.dmi'
		icon_state="waterbullet"
		layer=MOB_LAYER+100
		iszan=1
	WaterBolt
		names="Water Bolt"
		icon='Icons/gui.dmi'
		icon_state="waterbolt"
		layer=MOB_LAYER+100
		iszan=1
	WaterWave
		names="Water Wave"
		icon='Icons/gui.dmi'
		icon_state="waterwave"
		layer=MOB_LAYER+100
		iszan=1
	WaterHeavens
		names="Heavenly WaterFall"
		icon='Icons/gui.dmi'
		icon_state="waterheaven"
		layer=MOB_LAYER+100
		iszan=1
	FireBullet
		names = "Fire Bullet"
		icon = 'gui.dmi'
		icon_state = "firedbullet"
		layer = MOB_LAYER+100
		iszan=1
	FireRing
		names = "Fire Ring"
		icon = 'gui.dmi'
		icon_state = "firering"
		layer = MOB_LAYER+100
		iszan=1
	FireSlash
		names = "Fire Slash"
		icon = 'gui.dmi'
		icon_state = "fireslash"
		layer = MOB_LAYER+100
		iszan=1
	FireBurning
		names = "Fire Burn"
		icon = 'gui.dmi'
		icon_state = "burning"
		layer = MOB_LAYER+100
		iszan=1
	FireBolt
		names = "Fire Bolt"
		icon = 'gui.dmi'
		icon_state = "firebolt"
		layer = MOB_LAYER+100
		iszan=1
	HollowRage
		names = "HollowRage"
		icon = 'gui.dmi'
		icon_state = "explode"
		layer = MOB_LAYER+100
	Tentacle_Field
		names = "Tentacle Field"
		icon = 'gui.dmi'
		icon_state = "shishkabob"
		layer = MOB_LAYER+100
		iszan=1
	Tentacle_Wheel
		names = "Tentacle Wheel"
		icon = 'gui.dmi'
		icon_state = "tentacle wheel"
		layer = MOB_LAYER+100
		iszan=1
	Tentacle_Wrap
		names = "Tentacle Wrap"
		icon = 'gui.dmi'
		icon_state = "tentacle wheel"
		layer = MOB_LAYER+100
		iszan=1
	Vaizard_Rage
		names="Vaizard Rage"
		icon='Icons/gui.dmi'
		icon_state="vai rage"
		layer=MOB_LAYER+100
	VandenreichAura
		names="Vandenreich Power"
		icon='Icons/gui.dmi'
		icon_state="quincyvandaura"
		layer=MOB_LAYER+100
	CommanderStream
		names="Commander Stream"
		icon='Icons/gui.dmi'
		icon_state="windstream"
		layer=MOB_LAYER+100
	Vandwindstream
		names="Wind Stream"
		icon='Icons/gui.dmi'
		icon_state="windstream"
		layer=MOB_LAYER+100
	Vandwindbullet
		names="Wind Bullet"
		icon='Icons/gui.dmi'
		icon_state="windbullet"
		layer=MOB_LAYER+100
	Vandfirestream
		names="Fire Stream"
		icon='Icons/gui.dmi'
		icon_state="firestream"
		layer=MOB_LAYER+100
	Fire_Commander_Stream
		names="Fire Commander Stream"
		icon='Icons/gui.dmi'
		icon_state="firestream"
		layer=MOB_LAYER+100
	Vandfirebullet
		names="Fire Bullet"
		icon='Icons/gui.dmi'
		icon_state="firebullet"
		layer=MOB_LAYER+100
	Vandlightnbullet
		names="Lightning Bullet"
		icon='Icons/gui.dmi'
		icon_state="lightningbullet"
		layer=MOB_LAYER+100
	CommanderBolt
		names="Commander Bolt"
		icon='Icons/gui.dmi'
		icon_state="lightningbolt"
		layer=MOB_LAYER+100
	Vandlightnbolt
		names="Lightning Bolt"
		icon='Icons/gui.dmi'
		icon_state="lightningbolt"
		layer=MOB_LAYER+100
	Getsuga_Jab
		names="Getsuga Jab"
		icon='Icons/gui.dmi'
		icon_state="singlegetsuga"
		layer=MOB_LAYER+100
		iszan=1
	Vasto_FormDP
		names = "Vasto FormDP"
		icon = 'gui.dmi'
		icon_state = "Vasto FormDP"
		layer = MOB_LAYER+100
	Sado_ArmDP
		names = "Sado ArmDP"
		icon = 'gui.dmi'
		icon_state = "Sado armDP"
		layer = MOB_LAYER+100
	Wave
		names = "Wave"
		icon = 'gui.dmi'
		icon_state = "wave"
		layer = MOB_LAYER+100
		iszan=1
	Ryuten_Soshun
		names = "Ryuten Soshun"
		icon = 'gui.dmi'
		icon_state = "ryuten"
		layer = MOB_LAYER+100
		iszan=1
	Rengoku
		names="Rengoku"
		icon='Icons/gui.dmi'
		icon_state="rengoku"
		layer=MOB_LAYER+100
		iszan=1
	Rasen
		names="Rasen"
		icon='Icons/gui.dmi'
		icon_state="rasen"
		layer=MOB_LAYER+100
		iszan=1
	Susano
		names="Susano"
		icon='Icons/gui.dmi'
		icon_state="susano"
		layer=MOB_LAYER+100
	Amaterasu
		names="Amaterasu"
		icon='Icons/gui.dmi'
		icon_state="amat"
		layer=MOB_LAYER+100
	Twilight_Boost
		names="Twilight Boost"
		icon='Icons/gui.dmi'
		icon_state="sai"
		layer=MOB_LAYER+100
	KiseRinnegan
		names="Rinnegan"
		icon='Icons/gui.dmi'
		icon_state="rinnegan"
		layer=MOB_LAYER+100
	Rinnegan
		names="Rinnegan"
		icon='Icons/gui.dmi'
		icon_state="rinnegan"
		layer=MOB_LAYER+100
	Windadj
		names="Wind Roar"
		icon='Icons/gui.dmi'
		icon_state="windroar"
		layer=MOB_LAYER+100
	Pushadj
		names="Wind Gust"
		icon='Icons/gui.dmi'
		icon_state="gust"
		layer=MOB_LAYER+100
	Desgadj
		names="Paw Slash"
		icon='Icons/gui.dmi'
		icon_state="pawslash"
		layer=MOB_LAYER+100
	AdjWolf
		names="Los Lobos"
		icon='Icons/gui.dmi'
		icon_state="adjwolf"
		layer=MOB_LAYER+100

	Aging_Barrage
		names="Aging Barrage"
		icon='Icons/gui.dmi'
		icon_state="agbar"
		layer=MOB_LAYER+100
		iszan=1
	Raiho_Ignite
		names="Raiho Ignite"
		icon='Icons/gui.dmi'
		icon_state="cclh"
		layer=MOB_LAYER+100
		iszan=1
	Raiho_Bolt
		names="Raiho Bolt"
		icon='Icons/gui.dmi'
		icon_state="cclb"
		iszan=1
		layer=MOB_LAYER+100
	Raiho_Burst
		names="Raiho Burst"
		icon='Icons/gui.dmi'
		icon_state="ccburst"
		iszan=1
		layer=MOB_LAYER+100
	Fire_Pillar
		names="Fire Pillar"
		icon='Icons/gui.dmi'
		icon_state="firepillar"
		iszan=1
		layer=MOB_LAYER+100
	Fire_Skurn
		names="Fire Skurn"
		icon='Icons/gui.dmi'
		icon_state="skurn"
		iszan=1
		layer=MOB_LAYER+100
	Fire_Barrier
		names="Fire Barrier"
		icon='Icons/gui.dmi'
		icon_state="firebarrier"
		iszan=1
		layer=MOB_LAYER+100
	Slice
		names="Slice"
		icon='Icons/gui.dmi'
		icon_state="wideslash"
		iszan=1
		layer=MOB_LAYER+100
	Wind_Barrier
		names="Wind Barrier"
		icon='Icons/gui.dmi'
		icon_state="windbarrier"
		iszan=1
		layer=MOB_LAYER+100
	Aguila_Blow
		icon_state="windpush"
		icon='Icons/gui.dmi'
		names="Rapid Flap"
		iszan=1
		layer=MOB_LAYER+100
	Wingrar_Pluma
		names="Wingrar Pluma"
		icon='Icons/gui.dmi'
		icon_state="WingHome"
		iszan=1
		layer=MOB_LAYER+100
	Devrar_Pluma
		names="Devrar Pluma"
		icon='Icons/gui.dmi'
		icon_state="devrar"
		iszan=1
		layer=MOB_LAYER+100
	Tekkai
		names="Tekkai"
		icon='Icons/gui.dmi'
		icon_state="tekkai"
		layer=MOB_LAYER+100
	Wing_Stun
		names="Wing Stun"
		icon='Icons/gui.dmi'
		icon_state="WingStun"
		layer=MOB_LAYER+100
	Hyosuke_Stun
		names="Hyosuke Stun"
		icon='Icons/gui.dmi'
		icon_state="hyosuke stun"
		layer=MOB_LAYER+100
	Death_Wave
		names="Death Wave"
		icon='Icons/gui.dmi'
		icon_state="deathwave"
		layer=MOB_LAYER+100
	Infinity_Ball
		names="Infinity Ball"
		icon='Icons/gui.dmi'
		icon_state="infball"
		layer=MOB_LAYER+100
	Samurai_Freeze
		names="Samurai Freeze"
		icon='Icons/gui.dmi'
		iszan=1
		icon_state="aoefreeze"
		layer=MOB_LAYER+100
	Samurai_Jab
		names="Samurai Jab"
		icon='Icons/gui.dmi'
		iszan=1
		icon_state="jab"
		layer=MOB_LAYER+100
	Samurai_Barrage
		names="Samurai Barrage"
		icon='Icons/gui.dmi'
		iszan=1
		icon_state="firebarrage"
		layer=MOB_LAYER+100
	Ress_AoE_Heal
		names="Ress AoE Heal"
		icon='Icons/gui.dmi'
		iszan=1
		icon_state="ressaoeheal"
		layer=MOB_LAYER+100
	Ress_AoE_Knock
		names="Ress AoE Knock"
		icon='Icons/gui.dmi'
		iszan=1
		icon_state="ressaoeknock"
		layer=MOB_LAYER+100
	Healer_Basic_Attack
		names="Healer Basic Attack"
		icon='Icons/gui.dmi'
		iszan=1
		layer=MOB_LAYER+100
		icon_state="deadly slash"
	Pheonix_Ball
		names="Pheonix Ball"
		icon='Icons/gui.dmi'
		iszan=1
		icon_state="resshome"
		layer=MOB_LAYER+100
	BlueFirePillar
		names="Blue Fire Pillar"
		icon='Icons/gui.dmi'
		iszan=1
		icon_state="bluefirepillar"
		layer=MOB_LAYER+100
	//matsuricopy
	Pink_Mugetsu
		names="Pink Mugetsu"
		icon='Icons/gui.dmi'
		icon_state="mugetsu"
		iszan=1
		layer=MOB_LAYER+100
	Fireball_Graveyard
		names="Fireball Graveyard"
		icon='Icons/gui.dmi'
		icon_state="firegrave"
		iszan=1
		layer=MOB_LAYER+100
	Floating_Graveyard
		names="Floating Graveyard"
		icon='Icons/gui.dmi'
		icon_state="graveyardf"
		iszan=1
		layer=MOB_LAYER+100
	Blade_Barrage
		names="Blade Barrage"
		icon='Icons/gui.dmi'
		icon_state="bladebarrage"
		iszan=1
		layer=MOB_LAYER+100
	PrinceRewardShot
		names="PrinceRewardShot"
		icon='Icons/gui.dmi'
		icon_state="bladebarrage"
		layer=MOB_LAYER+100
	Freezing_Mary
		names="Freezing Mary"
		icon='Icons/gui.dmi'
		icon_state="freezingmar"
		iszan=1
		layer=MOB_LAYER+100
	Breath_Of_Lance
		names="Ice Breath"
		icon='Icons/gui.dmi'
		iszan=1
		icon_state="jab"
		layer=MOB_LAYER+100
	Aces_Boost
		names="Ace's Supa Boost"
		icon='Icons/gui.dmi'
		iszan=1
		icon_state="fatboywants"
		layer=MOB_LAYER+100
	The_Boost_Chase
		names="The Boost Chase That D"
		icon='Icons/gui.dmi'
		iszan=1
		icon_state="fatboywants"
		layer=MOB_LAYER+100
	Sakasama_no_Sekai
		names="Sakasama no Sekai"
		icon='Icons/gui.dmi'
		iszan=1
		icon_state="sakasama"
		layer=MOB_LAYER+100
	Full_Random_Blast
		names="Full Random Blast"
		icon='Icons/gui.dmi'
		icon_state="rasen"
		layer=MOB_LAYER+100
	Peace_Boost
		names="Boost of Peace"
		icon='Icons/gui.dmi'
		icon_state="quincyvandaura"
		layer=MOB_LAYER+100
	Jaff_Boost
		names="Hidden Boost"
		icon='Icons/gui.dmi'
		icon_state="quincyvandaura"
		layer=MOB_LAYER+100
	Yip_Boost
		names="Hidden Boost"
		icon='Icons/gui.dmi'
		icon_state="quincyvandaura"
		layer=MOB_LAYER+100
	Wound_Swap
		names="Wound Swap"
		icon='Icons/gui.dmi'
		icon_state="woundswap"
		layer=MOB_LAYER+100
	Gedon_Kido
		names="Gedon Kido"
		icon='Icons/gui.dmi'
		icon_state="gedon"
		layer=MOB_LAYER+100
	Hollow_Zangetsu
		names="Hollow Zangetsu"
		icon='Icons/gui.dmi'
		icon_state="hollowzangetsu"
		layer=MOB_LAYER+100
	Take_Power
		names="Take Power"
		icon='Icons/gui.dmi'
		icon_state="wind pull"
		layer=MOB_LAYER+100
	Give_Power
		names="Give Power"
		icon='Icons/gui.dmi'
		icon_state="wind push"
		layer=MOB_LAYER+100
	//end matsuricopy
mob/proc/Test_Proc_Usage() //Proc to show example under interact with obj
	alert("Test_Proc_Usage() has been run from /obj/skillcards/test. // Interact() M.Test_Proc_Usage")

