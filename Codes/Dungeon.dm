var
	tmp/dun1check=0
	tmp/dun2check=0
	tmp/dun3check=0
mob
	var
		tmp/bossR1kills=0
		tmp/bossR2kills=0
		tmp/bossR3kills=0
		tmp/bosskill=0
		tmp/musicStart=0
		tmp/d1cd=0
		tmp/d2cd=0
		tmp/d3cd=0
		tmp/entered=0
		tmp/completed=0
		tmp/dteamid
		tmp/dteam_leader = 0
		tmp/dteam_member = 0
		tmp/dungeon_tank = 0
		tmp/dungeon_healer = 0
		tmp/dungeon_atck = 0
		tmp/dungeon_count = 0
		tmp/changeLeader=0
		is_dnpc=10
		outback=0
turf
	var
		tmp/dungeonpick = 0
		list/dungeonnum = list(1,2,3)
		tmp/dun1=0
		tmp/dun2=0
		tmp/dun3=0
		//tmp/dun4=0
		//tmp/dun5=0
		tmp/hasleft1=0
turf
	EnterBosses
		EnterBossR1
			Entered(mob/M)
				if(M.bossR1kills>=20)
				else
					M << "<b>You do not have enough kills to enter this room!"
					step(M,WEST)
					return
		EnterBossR2U
			Entered(mob/M)
				if(M.bossR2kills>=20)
				else
					M << "<b>You do not have enough kills to enter this room!"
					step(M,SOUTH)
					return
		EnterBossR2L
			Entered(mob/M)
				if(M.bossR2kills>=20)
				else
					M << "<b>You do not have enough kills to enter this room!"
					step(M,EAST)
					return

		EnterBossR3
			Entered(mob/M)
				if(M.bossR3kills>=20)
				else
					M << "<b>You do not have enough kills to enter this room!"
					step(M,SOUTH)
					return
		EnterBossR3L
			Entered(mob/M)
				if(M.bossR3kills>=20)
				else
					M << "<b>You do not have enough kills to enter this room!"
					step(M,EAST)
					return

turf/EnterMusic
	density=0
	Entered(mob/M)
		if(M.client)
			if(M.musicStart==0)
				M.musicStart=1
				var/sound/S = sound('Icons/YammyFight.ogg',volume=45)
				M << S
				spawn(6000)
					M.musicStart=0
obj/dankaifloor
			icon='Icons/Stones.dmi'
			icon_state="3"
obj/DungeonHouse
	icon='Icons/dthe house.png'
	layer=MOB_LAYER-2
	pixel_x=-16
turf/DungeonHouse2
	icon='Icons/dthe house.png'
	layer=MOB_LAYER-2
	pixel_x=-16
turf/halfMountin
		icon='Icons/halfmountin.dmi'
		density = 1
turf/bothalfhellfloor
	icon='Icons/bot half hell floor.dmi'
turf/halfhellfloor
	icon='Icons/half hell floor.dmi'
turf
	dungeon1hidden_rooms
		hiddenroom1go
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(88,195,27)
				else
					if(istype(A,/obj/)) return
		hiddenroom1back
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(30,7,27)
				else
					if(istype(A,/obj/)) return
		hiddenroom2go
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(78,175,27)
				else
					if(istype(A,/obj/)) return
		hiddenroom2back
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(56,125,27)
				else
					if(istype(A,/obj/)) return
		hiddenroom3go
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(88,175,27)
				else
					if(istype(A,/obj/)) return
		hiddenroom3back
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(95,5,27)
				else
					if(istype(A,/obj/)) return
	dungeon2hidden_rooms
		hiddenroom12go
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(175,195,27)
				else
					if(istype(A,/obj/)) return
		hiddenroom12back
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(165,126,27)
				else
					if(istype(A,/obj/)) return
		hiddenroom22go
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(178,185,27)
				else
					if(istype(A,/obj/)) return
		hiddenroom22back
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(150,28,27)
				else
					if(istype(A,/obj/)) return
		hiddenroom32go
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(189,185,27)
				else
					if(istype(A,/obj/)) return
		hiddenroom32back
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(164,74,27)
				else
					if(istype(A,/obj/)) return
	dungeon3hidden_rooms
		hiddenroom13go
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(88,195,28)
				else
					if(istype(A,/obj/)) return
		hiddenroom13back
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(30,33,28)
				else
					if(istype(A,/obj/)) return
		hiddenroom23go
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(78,175,28)
				else
					if(istype(A,/obj/)) return
		hiddenroom23back
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(15,126,28)
				else
					if(istype(A,/obj/)) return
		hiddenroom33go
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(89,175,28)
				else
					if(istype(A,/obj/)) return
		hiddenroom33back
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						usr.loc = locate(55,125,28)
				else
					if(istype(A,/obj/)) return
turf/teleoutofdungeon
	icon = 'Icons/dungeon_portal.dmi'
	Enter(A)
		if(ismob(A))
			var/mob/M = A
			if(M.client)
				for(var/mob/player/X in All_Clients())
					if(X.dteamid==M.dteamid)
						X << output("<b><font color = yellow>Dungeon info: Congradulations on completing the dungeon! you have a 5min cooldown before you can start again.","output")
						X.loc = locate(148,103,1)
						X.completed=1
						X.d1cd=0
						if(X.dteam_leader == 1)
							X.entered=0
							world << "<b><font color = yellow>[X]'s Dungeon Party has Completed the dungeon with defeating [X.bosskill]/3 bosses!"
							dun1check=2
							for(var/mob/player/Kd in All_Clients())
								if(X.dteamid==Kd.dteamid)
									if(X.bosskill ==1)
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd << "<b><font color = lime>Good try, only got 1/3 bosses, but its worth 10 levels. Try harder next time!"
									if(X.bosskill==2)
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd << "<b><font color = lime>So close! But you only got 2/3 bosses, but its worth 15 levels. Try a little harder next time!"
									if(X.bosskill==3)
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd << "<b><font color = lime>Good Job! Your group got all 3 bosses, Here are 20 levels for the hard work!"
									Kd.bossR1kills=0
									Kd.bossR2kills=0
									Kd.bossR3kills=0
						X.bosskill=0
						if(X.dungeon_healer==1)
							var obj/skillcard/Dungeon_Heal/y = locate() in X.contents
							var obj/skillcard/Dungeon_AOE_Heal/z = locate() in X.contents
							if(!isnull(z))
								X.contents-=z
							if(!isnull(y))
								X.contents-=y
						//	X.contents-=/obj/skillcard/Dungeon_Heal
						//	X.contents-=/obj/skillcard/Dungeon_AOE_Heal
							X.RefreshSkillList()
						spawn(3000)
							X.completed=0
				if(M.dungeon_healer==1)
					var obj/skillcard/Dungeon_Heal/y = locate() in M.contents
					var obj/skillcard/Dungeon_AOE_Heal/z = locate() in M.contents
					if(!isnull(z))
						M.contents-=z
					if(!isnull(y))
						M.contents-=y
						//	X.contents-=/obj/skillcard/Dungeon_Heal
						//	X.contents-=/obj/skillcard/Dungeon_AOE_Heal
						//	X.RefreshSkillList()
					M.RefreshSkillList()
				for(var/mob/D in world)
					var/tmp/cnt=0
					if(D.race == "Demon NPC" || D.race == "Rawr NPC"|| D.race == "Hollow NPC"|| D.race == "Yammy Boss"|| D.race == "Dark Pheonix"|| D.race == "Fire Demon")
						del(D)
						cnt++
						if(cnt==30)
							sleep(10)
				spawn(3000)
					M.completed=0
		else
			if(istype(A,/obj/))return

turf/teleoutofdungeon2
	icon = 'Icons/dungeon_portal.dmi'
	Enter(A)
		if(ismob(A))
			var/mob/M = A
			if(M.client)
				for(var/mob/player/X in All_Clients())
					if(X.dteamid==M.dteamid)
						X << output("<b><font color = yellow>Dungeon info: Congradulations on completing the dungeon! you have a 5min cooldown before you can start again.","output")
						X.loc = locate(148,103,1)
						X.completed=1
						X.d2cd=0
						if(X.dteam_leader == 1)
							X.entered=0
							world << "<b><font color = yellow>[X]'s Dungeon Party has Completed the dungeon with defeating [X.bosskill]/3 bosses!"
							dun2check=2
							for(var/mob/player/Kd in All_Clients())
								if(X.dteamid==Kd.dteamid)
									if(X.bosskill ==1)
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd << "<b><font color = lime>Good try, only got 1/3 bosses, but its worth 10 levels. Try harder next time!"
									if(X.bosskill==2)
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd << "<b><font color = lime>So close! But you only got 2/3 bosses, but its worth 15 levels. Try a little harder next time!"
									if(X.bosskill==3)
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd << "<b><font color = lime>Good Job! Your group got all 3 bosses, Here are 20 levels for the hard work!"
									Kd.bossR1kills=0
									Kd.bossR2kills=0
									Kd.bossR3kills=0
						X.bosskill=0
						if(X.dungeon_healer==1)
							var obj/skillcard/Dungeon_Heal/y = locate() in X.contents
							var obj/skillcard/Dungeon_AOE_Heal/z = locate() in X.contents
							if(!isnull(z))
								X.contents-=z
							if(!isnull(y))
								X.contents-=y
						//	X.contents-=/obj/skillcard/Dungeon_Heal
						//	X.contents-=/obj/skillcard/Dungeon_AOE_Heal
						//	X.RefreshSkillList()
							X.RefreshSkillList()
						spawn(3000)
							X.completed=0
				if(M.dungeon_healer==1)
					var obj/skillcard/Dungeon_Heal/y = locate() in M.contents
					var obj/skillcard/Dungeon_AOE_Heal/z = locate() in M.contents
					if(!isnull(z))
						M.contents-=z
					if(!isnull(y))
						M.contents-=y
						//	X.contents-=/obj/skillcard/Dungeon_Heal
						//	X.contents-=/obj/skillcard/Dungeon_AOE_Heal
							//X.RefreshSkillList()
					M.RefreshSkillList()
				for(var/mob/D in world)
					var/tmp/cnt=0
					if(D.race == "Demon NPC2" || D.race == "Rawr NPC2"|| D.race == "Hollow NPC2"|| D.race == "Yammy Boss2"|| D.race == "Dark Pheonix2"|| D.race == "Fire Demon2")
						del(D)
						cnt++
						if(cnt==30)
							sleep(10)
				spawn(3000)
					M.completed=0
		else
			if(istype(A,/obj/))return

turf/teleoutofdungeon3
	icon = 'Icons/dungeon_portal.dmi'
	Enter(A)
		if(ismob(A))
			var/mob/M = A
			if(M.client)
				for(var/mob/player/X in All_Clients())
					if(X.dteamid==M.dteamid)
						X << output("<b><font color = yellow>Dungeon info: Congradulations on completing the dungeon! you have a 5min cooldown before you can start again.","output")
						X.loc = locate(148,103,1)
						X.completed=1
						X.d3cd=0
						if(X.dteam_leader == 1)
							X.entered=0
							world << "<b><font color = yellow>[X]'s Dungeon Party has Completed the dungeon with defeating [X.bosskill]/3 bosses!"
							dun3check=2
							for(var/mob/player/Kd in All_Clients())
								if(X.dteamid==Kd.dteamid)
									if(X.bosskill ==1)
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd << "<b><font color = lime>Good try, only got 1/3 bosses, but its worth 10 levels. Try harder next time!"
									if(X.bosskill==2)
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd << "<b><font color = lime>So close! But you only got 2/3 bosses, but its worth 15 levels. Try a little harder next time!"
									if(X.bosskill==3)
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd.GainExp(Kd.mexp)
										Kd.Level_Up()
										Kd << "<b><font color = lime>Good Job! Your group got all 3 bosses, Here are 20 levels for the hard work!"
									Kd.bossR1kills=0
									Kd.bossR2kills=0
									Kd.bossR3kills=0
						X.bosskill=0
						if(X.dungeon_healer==1)
							var obj/skillcard/Dungeon_Heal/y = locate() in X.contents
							var obj/skillcard/Dungeon_AOE_Heal/z = locate() in X.contents
							if(!isnull(z))
								X.contents-=z
							if(!isnull(y))
								X.contents-=y
								X.RefreshSkillList()
						spawn(3000)
							X.completed=0
				if(M.dungeon_healer==1)
					var obj/skillcard/Dungeon_Heal/y = locate() in M.contents
					var obj/skillcard/Dungeon_AOE_Heal/z = locate() in M.contents
					if(!isnull(z))
						M.contents-=z
					if(!isnull(y))
						M.contents-=y
					M.RefreshSkillList()
				for(var/mob/D in world)
					var/tmp/cnt=0
					if(D.race == "Demon NPC3" || D.race == "Rawr NPC3"|| D.race == "Hollow NPC3"|| D.race == "Yammy Boss3"|| D.race == "Dark Pheonix3"|| D.race == "Fire Demon3")
						del(D)
						cnt++
						if(cnt==30)
							sleep(10)
				spawn(3000)
					M.completed=0
		else
			if(istype(A,/obj/))return

turf/teletodungeon
	icon = 'Icons/dungeon_portal.dmi'
	layer=MOB_LAYER-1
	Enter(A)
		if(ismob(A))
			var/mob/M = A
			if(M.client)
				if(M.flashstep)
					M.flashstep=0
				if(M.completed==1)
					M<<"You are still on your 5 min cooldown from finishing the dungeon!"
					return
				if(M.gotthecharge&&portaltime)
					M<<"You can't leave with the charge"
					return
				if(M.level < 600)
					M<<"You do not meet the level requirement of 600, Train some more before entering!"
					return
				if(M.teamid && M.key != "Devilminions528")
					M<<"You must be in a Dungeon Party to enter!"
					return
				if(!M.dteamid && M.key != "Devilminions528")
					M<<"You must be in a Dungeon Party to enter!"
					return
				if(M.dungeon_count !=5 && M.key != "Devilminions528")
					M<<"You must have at least 5 players to enter dungeon!"
					return

				if(M.dteamid==dun1 && M.d1cd==1)
					M.flashstep=0
					if(M.dteam_leader == 1)
						if(M.entered == 0)
							M.entered=1
							world << "<b><font color = yellow>[M]'s Dungeon Party has Entered a dungeon! The 50 min cooldown has now begun."
					M.loc = locate(40,4,27)
					M.safe = 0
					if(M.dungeon_healer==1)
						M.contents|=new/obj/skillcard/Dungeon_Heal
						M.contents|=new/obj/skillcard/Dungeon_AOE_Heal
						M.RefreshSkillList()
					return

				if(M.dteamid==dun2 && M.d2cd==1)
					M.flashstep=0
					if(M.dteam_leader == 1)
						if(M.entered == 0)
							M.entered=1
							world << "<b><font color = yellow>[M]'s Dungeon Party has Entered a dungeon! The 50 min cooldown has now begun."
					M.loc = locate(140,4,27)
					M.safe = 0
					if(M.dungeon_healer==1)
						M.contents|=new/obj/skillcard/Dungeon_Heal
						M.contents|=new/obj/skillcard/Dungeon_AOE_Heal
						M.RefreshSkillList()
					return

				if(M.dteamid==dun3 && M.d3cd==1)
					M.flashstep=0
					if(M.dteam_leader == 1)
						if(M.entered == 0)
							M.entered=1
							world << "<b><font color = yellow>[M]'s Dungeon Party has Entered a dungeon! The 50 min cooldown has now begun."
					M.loc = locate(40,4,28)
					M.safe = 0
					if(M.dungeon_healer==1)
						M.contents|=new/obj/skillcard/Dungeon_Heal
						M.contents|=new/obj/skillcard/Dungeon_AOE_Heal
						M.RefreshSkillList()
					return

				if(dun1!=0 && dun2!=0 && dun3!=0)
					M<<"All dungeons are full please wait till a group finishes!"
					return

				if(dungeonnum.len != 0)
					dungeonpick=pick(dungeonnum)

				if(dungeonpick == 1)
					M.flashstep=0
					dungeonnum.Remove(dungeonpick)
					if(M.dteam_leader == 1)
						world << "<b><font color = yellow>[M]'s Dungeon Party has Entered a dungeon! The 50 min cooldown has now begun."
						M.entered=1
					M.loc = locate(40,4,27)
					M.safe = 0
					M.d1cd=1
					dun1check=1
					dun1= M.dteamid
					for(var/mob/Q in world)
						if(M.dteamid == Q.dteamid)
							Q.d1cd=1

					if(M.dungeon_healer==1)
						M.contents|=new/obj/skillcard/Dungeon_Heal
						M.contents|=new/obj/skillcard/Dungeon_AOE_Heal
						M.RefreshSkillList()
					new/obj/items/usable/Chests/Dungeon1R1Chest(locate(82,195,27))
					new/obj/items/usable/Chests/Dungeon1R2Chest(locate(78,180,27))
					new/obj/items/usable/Chests/Dungeon1R3Chest(locate(89,180,27))
					new/mob/Red_Demon(locate(40,16,27))
					new/mob/Blue_Demon(locate(40,22,27))
					new/mob/Blue_Demon(locate(35,20,27))
					new/mob/Red_Demon(locate(42,29,27))
					new/mob/Red_Demon(locate(37,35,27))
					new/mob/Blue_Demon(locate(40,40,27))
					sleep(5)
					new/mob/Red_Demon(locate(43,45,27))
					new/mob/Blue_Demon(locate(43,60,27))
					new/mob/Blue_Demon(locate(39,57,27))
					new/mob/Red_Demon(locate(44,53,27))
					new/mob/Blue_Demon(locate(28,22,27))
					new/mob/Red_Demon(locate(23,18,27))
					new/mob/Red_Demon(locate(17,19,27))
					sleep(5)
					new/mob/Blue_Demon(locate(19,13,27))
					new/mob/Red_Demon(locate(15,8,27))
					new/mob/Blue_Demon(locate(19,5,27))
					new/mob/Blue_Demon(locate(23,9,27))
					new/mob/Red_Demon(locate(28,5,27))
					new/mob/Blue_Demon(locate(30,9,27))
					new/mob/Red_Demon(locate(48,38,27))
					new/mob/Red_Demon(locate(53,41,27))
					new/mob/Blue_Demon(locate(58,38,27))
					new/mob/Red_Demon(locate(63,41,27))
					sleep(5)
					new/mob/Red_Demon(locate(37,47,27))
					new/mob/Blue_Demon(locate(32,44,27))
					new/mob/Blue_Demon(locate(25,48,27))
					new/mob/Red_Demon(locate(20,43,27))
					new/mob/Red_Demon(locate(15,45,27))
					new/mob/Blue_Demon(locate(12,47,27))
					new/mob/Red_Demon(locate(32,61,27))
					new/mob/Blue_Demon(locate(27,58,27))
					sleep(5)
					new/mob/Blue_Demon(locate(21,60,27))
					new/mob/Red_Demon(locate(16,58,27))
					new/mob/Blue_Demon(locate(12,61,27))
					new/mob/Red_Demon(locate(3,62,27))
					new/mob/Red_Demon(locate(7,58,27))
					new/mob/Blue_Demon(locate(4,53,27))
					new/mob/Red_Demon(locate(7,49,27))
					sleep(5)
					new/mob/Blue_Demon(locate(4,43,27))
					new/mob/Stinox(locate(64,33,27))
					new/mob/Swamp_thing(locate(60,28,27))
					new/mob/Swamp_thing(locate(63,24,27))
					new/mob/Stinox(locate(63,5,27))
					new/mob/Stinox(locate(57,8,27))
					new/mob/Swamp_thing(locate(49,5,27))
					new/mob/Stinox(locate(52,12,27))
					sleep(5)
					new/mob/Swamp_thing(locate(48,19,27))
					new/mob/Stinox(locate(53,24,27))
					new/mob/Stinox(locate(50,28,27))
					new/mob/Blue_Demon(locate(50,49,27))
					new/mob/Red_Demon(locate(55,52,27))
					new/mob/Blue_Demon(locate(52,58,27))
					new/mob/Red_Demon(locate(56,66,27))
					sleep(5)
					new/mob/Red_Demon(locate(8,39,27))
					new/mob/Blue_Demon(locate(3,35,27))
					new/mob/Blue_Demon(locate(30,34,27))
					new/mob/Red_Demon(locate(23,31,27))
					new/mob/Red_Demon(locate(23,34,27))
					new/mob/Blue_Demon(locate(18,31,27))
					new/mob/Red_Demon(locate(13,34,27))
					sleep(5)
					new/mob/Blue_Demon(locate(7,30,27))
					new/mob/Blue_Demon(locate(5,24,27))
					new/mob/Red_Demon(locate(7,18,27))
					new/mob/Blue_Demon(locate(4,13,27))
					new/mob/Red_Demon(locate(7,5,27))
					new/mob/Red_Demon(locate(50,66,27))
					new/mob/Blue_Demon(locate(54,72,27))
					sleep(5)
					new/mob/Red_Demon(locate(47,75,27))
					new/mob/Blue_Demon(locate(43,70,27))
					new/mob/Blue_Demon(locate(35,70,27))
					new/mob/Red_Demon(locate(35,71,27))
					new/mob/Blue_Demon(locate(29,73,27))
					new/mob/Red_Demon(locate(22,75,27))
					new/mob/Red_Demon(locate(17,70,27))
					sleep(5)
					new/mob/Blue_Demon(locate(12,73,27))
					new/mob/Red_Demon(locate(5,72,27))
					new/mob/Blue_Demon(locate(8,79,27))
					new/mob/Blue_Demon(locate(4,83,27))
					new/mob/Red_Demon(locate(6,92,27))
					new/mob/Red_Demon(locate(4,98,27))
					new/mob/Blue_Demon(locate(18,31,27))
					new/mob/Red_Demon(locate(9,102,27))
					sleep(5)
					new/mob/Stinox(locate(71,48,27))
					new/mob/Swamp_thing(locate(74,53,27))
					new/mob/Swamp_thing(locate(69,55,27))
					new/mob/Stinox(locate(63,60,27))
					new/mob/Stinox(locate(67,64,27))
					sleep(5)
					new/mob/Swamp_thing(locate(84,41,27))
					new/mob/Stinox(locate(86,49,27))
					new/mob/Swamp_thing(locate(81,51,27))
					new/mob/Stinox(locate(85,58,27))
					new/mob/Stinox(locate(83,66,27))
					new/mob/Stinox(locate(76,64,27))
					new/mob/Swamp_thing(locate(73,73,27))
					new/mob/Swamp_thing(locate(77,77,27))
					sleep(5)
					new/mob/Stinox(locate(74,84,27))
					new/mob/Stinox(locate(78,89,27))
					new/mob/Swamp_thing(locate(75,94,27))
					new/mob/Stinox(locate(75,102,27))
					new/mob/Swamp_thing(locate(89,95,27))
					new/mob/Stinox(locate(85,90,27))
					sleep(5)
					new/mob/Stinox(locate(72,36,27))
					new/mob/Swamp_thing(locate(73,44,27))
					new/mob/Swamp_thing(locate(67,23,27))
					new/mob/Swamp_thing(locate(74,21,27))
					new/mob/Stinox(locate(72,16,27))
					new/mob/Stinox(locate(74,10,27))
					sleep(5)
					new/mob/Swamp_thing(locate(72,6,27))
					new/mob/Stinox(locate(79,5,27))
					new/mob/Swamp_thing(locate(84,10,27))
					new/mob/Stinox(locate(82,16,27))
					new/mob/Stinox(locate(85,23,27))
					new/mob/Swamp_thing(locate(83,31,27))
					new/mob/Swamp_thing(locate(80,36,27))
					sleep(5)
					new/mob/Stinox(locate(88,86,27))
					new/mob/Stinox(locate(84,81,27))
					new/mob/Swamp_thing(locate(86,76,27))
					new/mob/Swamp_thing(locate(91,79,27))
					new/mob/Stinox(locate(97,76,27))
					new/mob/Stinox(locate(93,69,27))
					sleep(5)
					new/mob/Swamp_thing(locate(97,64,27))
					new/mob/Stinox(locate(95,59,27))
					new/mob/Swamp_thing(locate(92,53,27))
					new/mob/Stinox(locate(97,46,27))
					new/mob/Stinox(locate(93,41,27))
					new/mob/Swamp_thing(locate(97,36,27))
					new/mob/Swamp_thing(locate(93,33,27))
					sleep(5)
					new/mob/Stinox(locate(96,25,27))
					new/mob/Swamp_thing(locate(93,20,27))
					new/mob/Stinox(locate(97,12,27))
					new/mob/Swamp_thing(locate(93,6,27))
					new/mob/Demon_Adj(locate(81,99,27))
					new/mob/Green_Adj(locate(85,102,27))
					sleep(5)
					new/mob/Demon_Adj(locate(88,108,27))
					new/mob/Demon_Adj(locate(84,114,27))
					new/mob/Green_Adj(locate(79,112,27))
					new/mob/Demon_Adj(locate(75,115,27))
					new/mob/Green_Adj(locate(67,111,27))
					new/mob/Green_Adj(locate(60,115,27))
					sleep(5)
					new/mob/Green_Adj(locate(56,112,27))
					new/mob/Demon_Adj(locate(46,111,27))
					new/mob/Green_Adj(locate(40,113,27))
					new/mob/Demon_Adj(locate(32,116,27))
					new/mob/Demon_Adj(locate(28,111,27))
					new/mob/Green_Adj(locate(23,115,27))
					new/mob/Demon_Adj(locate(18,111,27))
					new/mob/Green_Adj(locate(14,114,27))
					sleep(5)
					new/mob/Green_Adj(locate(7,112,27))
					new/mob/Green_Adj(locate(5,117,27))
					new/mob/Demon_Adj(locate(8,123,27))
					new/mob/Green_Adj(locate(4,127,27))
					new/mob/Demon_Adj(locate(8,132,27))
					new/mob/Demon_Adj(locate(4,137,27))
					sleep(5)
					new/mob/Green_Adj(locate(9,141,27))
					new/mob/Demon_Adj(locate(13,138,27))
					new/mob/Green_Adj(locate(18,142,27))
					new/mob/Green_Adj(locate(22,138,27))
					new/mob/Green_Adj(locate(27,141,27))
					sleep(5)
					new/mob/Demon_Adj(locate(32,137,27))
					new/mob/Green_Adj(locate(35,131,27))
					new/mob/Demon_Adj(locate(34,124,27))
					new/mob/Demon_Adj(locate(28,128,27))
					new/mob/Green_Adj(locate(24,124,27))
					sleep(5)
					new/mob/Demon_Adj(locate(19,128,27))
					new/mob/Green_Adj(locate(15,125,27))
					new/mob/Green_Adj(locate(44,118,27))
					new/mob/Green_Adj(locate(42,124,27))
					new/mob/Demon_Adj(locate(45,129,27))
					new/mob/Green_Adj(locate(41,137,27))
					sleep(5)
					new/mob/Demon_Adj(locate(45,142,27))
					new/mob/Demon_Adj(locate(43.149,27))
					new/mob/Green_Adj(locate(41,155,27))
					new/mob/Demon_Adj(locate(35,151,27))
					new/mob/Green_Adj(locate(28,153,27))
					new/mob/Green_Adj(locate(22,150,27))
					new/mob/Green_Adj(locate(17,154,27))
					sleep(5)
					new/mob/Demon_Adj(locate(11,151,27))
					new/mob/Green_Adj(locate(6,153,27))
					new/mob/Demon_Adj(locate(8,159,27))
					new/mob/Demon_Adj(locate(5,165,27))
					new/mob/Green_Adj(locate(11,168,27))
					new/mob/Demon_Adj(locate(15,164,27))
					new/mob/Green_Adj(locate(20,166,27))
					sleep(5)
					new/mob/Green_Adj(locate(25,164,27))
					new/mob/Green_Adj(locate(28,168,27))
					new/mob/Demon_Adj(locate(33,164,27))
					new/mob/Demon_Adj(locate(37,166,27))
					new/mob/Green_Adj(locate(42,163,27))
					new/mob/Demon_Adj(locate(43,168,27))
					sleep(5)
					new/mob/Green_Adj(locate(49,167,27))
					new/mob/Green_Adj(locate(51,163,27))
					new/mob/Green_Adj(locate(56,167,27))
					new/mob/Demon_Adj(locate(55,160,27))
					new/mob/Green_Adj(locate(57,156,27))
					new/mob/Demon_Adj(locate(54,152,27))
					sleep(5)
					new/mob/Demon_Adj(locate(58,147,27))
					new/mob/Green_Adj(locate(56,143,27))
					new/mob/Demon_Adj(locate(54,139,27))
					new/mob/Green_Adj(locate(58,133,27))
					new/mob/Green_Adj(locate(88,119,27))
					new/mob/Green_Adj(locate(84,125,27))
					sleep(5)
					new/mob/Demon_Adj(locate(89,131,27))
					new/mob/Green_Adj(locate(86,138,27))
					new/mob/Demon_Adj(locate(89,145,27))
					new/mob/Demon_Adj(locate(85,151,27))
					new/mob/Green_Adj(locate(77,153,27))
					new/mob/Demon_Adj(locate(74,150,27))
					sleep(5)
					new/mob/Green_Adj(locate(67,152,27))
					new/mob/Green_Adj(locate(66,146,27))
					new/mob/Green_Adj(locate(65,139,27))
					new/mob/Demon_Adj(locate(71,137,27))
					new/mob/Green_Adj(locate(76,140,27))
					sleep(5)
					new/mob/Demon_Adj(locate(77,135,27))
					new/mob/Demon_Adj(locate(75,130,27))
					new/mob/Green_Adj(locate(77,125,27))
					new/mob/Demon_Adj(locate(69,127,27))
					new/mob/Green_Adj(locate(87,157,27))
					new/mob/Green_Adj(locate(84,165,27))
					new/mob/Green_Adj(locate(78,163,27))
					sleep(5)
					new/mob/Demon_Adj(locate(72,165,27))
					new/mob/Green_Adj(locate(67,163,27))
					new/mob/Demon_Adj(locate(66,170,27))
					new/mob/Demon_Adj(locate(69,177,27))
					new/mob/Green_Adj(locate(65,182,27))
					new/mob/Demon_Adj(locate(68,188,27))
					//spawn bosses
					sleep(5)
					new/mob/Fire_Demon(locate(30,93,27))
					new/mob/Dark_Pheonix(locate(47,94,27))
					new/mob/Yammy(locate(28,189,27))

					sleep(50 MINUTES)
					for(var/mob/player/X in All_Clients())
						if(X.dteamid == dun1)
							if(X.completed==0&&X.d1cd==1)
								X << output("<b><font color = yellow>Dungeon info: You have 10 minutes until the time limit is up! Better hurry up!","output")
					sleep(3000)
					for(var/mob/player/X in All_Clients())
						if(X.dteamid == dun1)
							if(X.completed==0&&X.d1cd==1)
								X << output("<b><font color = yellow>Dungeon info: You have 5 minutes until the time limit is up!","output")
					sleep(3000)
					for(var/mob/player/X in All_Clients())
						if(X.dteamid == dun1)
							if(X.completed == 0&&X.d1cd==1)
								X << output("<b><font color = yellow>Dungeon info: Time is up! You will now be teleported out! You have a 5min cooldown.","output")
								if(X.dteam_leader == 1)
									X.entered=0
									world<<"<b><font color = yellow>[X]'s Dungeon party has failed to complete the dungeon!"
									for(var/mob/player/Kd in All_Clients())
										if(X.dteamid==Kd.dteamid)
											if(X.bosskill ==1)
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd << "<b><font color = lime>Good try, only got 1/3 bosses, but its worth 10 levels. Try harder next time!"
											if(X.bosskill==2)
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd << "<b><font color = lime>So close! But you only got 2/3 bosses, but its worth 15 levels. Try a little harder next time!"
											if(X.bosskill==3)
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd << "<b><font color = lime>Good Job! Your group got all 3 bosses, Here are 20 levels for the hard work!"
											Kd.bossR1kills=0
											Kd.bossR2kills=0
											Kd.bossR3kills=0
									X.bosskill=0
								if(X.dungeon_healer==1)
									var obj/skillcard/Dungeon_Heal/y = locate() in X.contents
									var obj/skillcard/Dungeon_AOE_Heal/z = locate() in X.contents
									if(!isnull(z))
										X.contents-=z
									if(!isnull(y))
										X.contents-=y
									X.RefreshSkillList()
								X.loc = locate(148,103,1)
								X.safe = 0
								X.completed=1
								X.d1cd=0
								spawn(3000)
									X.completed=0
					//deleteing mobs
					for(var/mob/D in world)
						var/tmp/cnt=0
						if(D.race == "Demon NPC" || D.race == "Rawr NPC"|| D.race == "Hollow NPC"|| D.race == "Yammy Boss"|| D.race == "Dark Pheonix"|| D.race == "Fire Demon")
							del(D)
							cnt++
							if(cnt==30)
								sleep(10)
					world << "<b><font color = yellow>A Dungeon is now Avaliable!"
					dungeonnum.Insert(1,1)
					dun1 = 0
					dun1check=0

				if(dungeonpick == 2)
					M.flashstep=0
					dungeonnum.Remove(dungeonpick)
					if(M.dteam_leader == 1)
						world << "<b><font color = yellow>[M]'s Dungeon Party has Entered a dungeon! The 50 min cooldown has now begun."
						M.entered=1
					M.loc = locate(140,4,27)
					M.safe = 0
					dun2check=1
					M.d2cd=1
					dun2= M.dteamid
					for(var/mob/Q in world)
						if(M.dteamid == Q.dteamid)
							Q.d2cd=1

					if(M.dungeon_healer==1)
						M.contents|=new/obj/skillcard/Dungeon_Heal
						M.contents|=new/obj/skillcard/Dungeon_AOE_Heal
						M.RefreshSkillList()
					new/obj/items/usable/Chests/Dungeon2R1Chest(locate(82+100,195,27))
					new/obj/items/usable/Chests/Dungeon2R2Chest(locate(78+100,180,27))
					new/obj/items/usable/Chests/Dungeon2R3Chest(locate(89+100,180,27))
					new/mob/Red_Demon2(locate(40+100,16,27))
					new/mob/Blue_Demon2(locate(40+100,22,27))
					new/mob/Blue_Demon2(locate(35+100,20,27))
					new/mob/Red_Demon2(locate(42+100,29,27))
					new/mob/Red_Demon2(locate(37+100,35,27))
					new/mob/Blue_Demon2(locate(40+100,40,27))
					sleep(5)
					new/mob/Red_Demon2(locate(43+100,45,27))
					new/mob/Blue_Demon2(locate(43+100,60,27))
					new/mob/Blue_Demon2(locate(39+100,57,27))
					new/mob/Red_Demon2(locate(44+100,53,27))
					new/mob/Blue_Demon2(locate(28+100,22,27))
					new/mob/Red_Demon2(locate(23+100,18,27))
					new/mob/Red_Demon2(locate(17+100,19,27))
					sleep(5)
					new/mob/Blue_Demon2(locate(19+100,13,27))
					new/mob/Red_Demon2(locate(15+100,8,27))
					new/mob/Blue_Demon2(locate(19+100,5,27))
					new/mob/Blue_Demon2(locate(23+100,9,27))
					new/mob/Red_Demon2(locate(28+100,5,27))
					new/mob/Blue_Demon2(locate(30+100,9,27))
					new/mob/Red_Demon2(locate(48+100,38,27))
					new/mob/Red_Demon2(locate(53+100,41,27))
					new/mob/Blue_Demon2(locate(58+100,38,27))
					new/mob/Red_Demon2(locate(63+100,41,27))
					sleep(5)
					new/mob/Red_Demon2(locate(37+100,47,27))
					new/mob/Blue_Demon2(locate(32+100,44,27))
					new/mob/Blue_Demon2(locate(25+100,48,27))
					new/mob/Red_Demon2(locate(20+100,43,27))
					new/mob/Red_Demon2(locate(15+100,45,27))
					new/mob/Blue_Demon2(locate(12+100,47,27))
					new/mob/Red_Demon2(locate(32+100,61,27))
					new/mob/Blue_Demon2(locate(27+100,58,27))
					sleep(5)
					new/mob/Blue_Demon2(locate(21+100,60,27))
					new/mob/Red_Demon2(locate(16+100,58,27))
					new/mob/Blue_Demon2(locate(12+100,61,27))
					new/mob/Red_Demon2(locate(3+100,62,27))
					new/mob/Red_Demon2(locate(7+100,58,27))
					new/mob/Blue_Demon2(locate(4+100,53,27))
					new/mob/Red_Demon2(locate(7+100,49,27))
					sleep(5)
					new/mob/Blue_Demon2(locate(4+100,43,27))
					new/mob/Stinox2(locate(64+100,33,27))
					new/mob/Swamp_thing2(locate(60+100,28,27))
					new/mob/Swamp_thing2(locate(63+100,24,27))
					new/mob/Stinox2(locate(63+100,5,27))
					new/mob/Stinox2(locate(57+100,8,27))
					new/mob/Swamp_thing2(locate(49+100,5,27))
					new/mob/Stinox2(locate(52+100,12,27))
					sleep(5)
					new/mob/Swamp_thing2(locate(48+100,19,27))
					new/mob/Stinox2(locate(53+100,24,27))
					new/mob/Stinox2(locate(50+100,28,27))
					new/mob/Blue_Demon2(locate(50+100,49,27))
					new/mob/Red_Demon2(locate(55+100,52,27))
					new/mob/Blue_Demon2(locate(52+100,58,27))
					new/mob/Red_Demon2(locate(56+100,66,27))
					sleep(5)
					new/mob/Red_Demon2(locate(8+100,39,27))
					new/mob/Blue_Demon2(locate(3+100,35,27))
					new/mob/Blue_Demon2(locate(30+100,34,27))
					new/mob/Red_Demon2(locate(23+100,31,27))
					new/mob/Red_Demon2(locate(23+100,34,27))
					new/mob/Blue_Demon2(locate(18+100,31,27))
					new/mob/Red_Demon2(locate(13+100,34,27))
					sleep(5)
					new/mob/Blue_Demon2(locate(7+100,30,27))
					new/mob/Blue_Demon2(locate(5+100,24,27))
					new/mob/Red_Demon2(locate(7+100,18,27))
					new/mob/Blue_Demon2(locate(4+100,13,27))
					new/mob/Red_Demon2(locate(7+100,5,27))
					new/mob/Red_Demon2(locate(50+100,66,27))
					new/mob/Blue_Demon2(locate(54+100,72,27))
					sleep(5)
					new/mob/Red_Demon2(locate(47+100,75,27))
					new/mob/Blue_Demon2(locate(43+100,70,27))
					new/mob/Blue_Demon2(locate(35+100,70,27))
					new/mob/Red_Demon2(locate(35+100,71,27))
					new/mob/Blue_Demon2(locate(29+100,73,27))
					new/mob/Red_Demon2(locate(22+100,75,27))
					new/mob/Red_Demon2(locate(17+100,70,27))
					sleep(5)
					new/mob/Blue_Demon2(locate(12+100,73,27))
					new/mob/Red_Demon2(locate(5+100,72,27))
					new/mob/Blue_Demon2(locate(8+100,79,27))
					new/mob/Blue_Demon2(locate(4+100,83,27))
					new/mob/Red_Demon2(locate(6+100,92,27))
					new/mob/Red_Demon2(locate(4+100,98,27))
					new/mob/Blue_Demon2(locate(18+100,31,27))
					new/mob/Red_Demon2(locate(9+100,102,27))
					sleep(5)
					new/mob/Stinox2(locate(71+100,48,27))
					new/mob/Swamp_thing2(locate(74+100,53,27))
					new/mob/Swamp_thing2(locate(69+100,55,27))
					new/mob/Stinox2(locate(63+100,60,27))
					new/mob/Stinox2(locate(67+100,64,27))
					sleep(5)
					new/mob/Stinox2(locate(172,36,27))
					new/mob/Swamp_thing2(locate(173,44,27))
					new/mob/Swamp_thing2(locate(167,23,27))
					new/mob/Swamp_thing2(locate(174,21,27))
					new/mob/Stinox2(locate(172,16,27))
					new/mob/Stinox2(locate(174,10,27))
					sleep(5)
					new/mob/Swamp_thing2(locate(172,6,27))
					new/mob/Stinox2(locate(179,5,27))
					new/mob/Swamp_thing2(locate(184,10,27))
					new/mob/Stinox2(locate(182,16,27))
					new/mob/Stinox2(locate(185,23,27))
					new/mob/Swamp_thing2(locate(183,31,27))
					new/mob/Swamp_thing2(locate(180,36,27))
					sleep(5)
					new/mob/Swamp_thing2(locate(84+100,41,27))
					new/mob/Stinox2(locate(86+100,49,27))
					new/mob/Swamp_thing2(locate(81+100,51,27))
					new/mob/Stinox2(locate(85+100,58,27))
					new/mob/Stinox2(locate(83+100,66,27))
					new/mob/Stinox2(locate(76+100,64,27))
					new/mob/Swamp_thing2(locate(73+100,73,27))
					new/mob/Swamp_thing2(locate(77+100,77,27))
					sleep(5)
					new/mob/Stinox2(locate(74+100,84,27))
					new/mob/Stinox2(locate(78+100,89,27))
					new/mob/Swamp_thing2(locate(75+100,94,27))
					new/mob/Stinox2(locate(75+100,102,27))
					new/mob/Swamp_thing2(locate(89+100,95,27))
					new/mob/Stinox2(locate(85+100,90,27))
					sleep(5)
					new/mob/Stinox2(locate(88+100,86,27))
					new/mob/Stinox2(locate(84+100,81,27))
					new/mob/Swamp_thing2(locate(86+100,76,27))
					new/mob/Swamp_thing2(locate(91+100,79,27))
					new/mob/Stinox2(locate(97+100,76,27))
					new/mob/Stinox2(locate(93+100,69,27))
					sleep(5)
					new/mob/Swamp_thing2(locate(97+100,64,27))
					new/mob/Stinox2(locate(95+100,59,27))
					new/mob/Swamp_thing2(locate(92+100,53,27))
					new/mob/Stinox2(locate(97+100,46,27))
					new/mob/Stinox2(locate(93+100,41,27))
					new/mob/Swamp_thing2(locate(97+100,36,27))
					new/mob/Swamp_thing2(locate(93+100,33,27))
					sleep(5)
					new/mob/Stinox2(locate(96+100,25,27))
					new/mob/Swamp_thing2(locate(93+100,20,27))
					new/mob/Stinox2(locate(97+100,12,27))
					new/mob/Swamp_thing2(locate(93+100,6,27))
					new/mob/Demon_Adj2(locate(81+100,99,27))
					new/mob/Green_Adj2(locate(85+100,102,27))
					sleep(5)
					new/mob/Demon_Adj2(locate(88+100,108,27))
					new/mob/Demon_Adj2(locate(84+100,114,27))
					new/mob/Green_Adj2(locate(79+100,112,27))
					new/mob/Demon_Adj2(locate(75+100,115,27))
					new/mob/Green_Adj2(locate(67+100,111,27))
					new/mob/Green_Adj2(locate(60+100,115,27))
					sleep(5)
					new/mob/Green_Adj2(locate(56+100,112,27))
					new/mob/Demon_Adj2(locate(46+100,111,27))
					new/mob/Green_Adj2(locate(40+100,113,27))
					new/mob/Demon_Adj2(locate(32+100,116,27))
					new/mob/Demon_Adj2(locate(28+100,111,27))
					new/mob/Green_Adj2(locate(23+100,115,27))
					new/mob/Demon_Adj2(locate(18+100,111,27))
					new/mob/Green_Adj2(locate(14+100,114,27))
					sleep(5)
					new/mob/Green_Adj2(locate(7+100,112,27))
					new/mob/Green_Adj2(locate(5+100,117,27))
					new/mob/Demon_Adj2(locate(8+100,123,27))
					new/mob/Green_Adj2(locate(4+100,127,27))
					new/mob/Demon_Adj2(locate(8+100,132,27))
					new/mob/Demon_Adj2(locate(4+100,137,27))
					sleep(5)
					new/mob/Green_Adj2(locate(9+100,141,27))
					new/mob/Demon_Adj2(locate(13+100,138,27))
					new/mob/Green_Adj2(locate(18+100,142,27))
					new/mob/Green_Adj2(locate(22+100,138,27))
					new/mob/Green_Adj2(locate(27+100,141,27))
					sleep(5)
					new/mob/Demon_Adj2(locate(32+100,137,27))
					new/mob/Green_Adj2(locate(35+100,131,27))
					new/mob/Demon_Adj2(locate(34+100,124,27))
					new/mob/Demon_Adj2(locate(28+100,128,27))
					new/mob/Green_Adj2(locate(24+100,124,27))
					sleep(5)
					new/mob/Demon_Adj2(locate(19+100,128,27))
					new/mob/Green_Adj2(locate(15+100,125,27))
					new/mob/Green_Adj2(locate(44+100,118,27))
					new/mob/Green_Adj2(locate(42+100,124,27))
					new/mob/Demon_Adj2(locate(45+100,129,27))
					new/mob/Green_Adj2(locate(41+100,137,27))
					sleep(5)
					new/mob/Demon_Adj2(locate(45+100,142,27))
					new/mob/Demon_Adj2(locate(43+100.149,27))
					new/mob/Green_Adj2(locate(41+100,155,27))
					new/mob/Demon_Adj2(locate(35+100,151,27))
					new/mob/Green_Adj2(locate(28+100,153,27))
					new/mob/Green_Adj2(locate(22+100,150,27))
					new/mob/Green_Adj2(locate(17+100,154,27))
					sleep(5)
					new/mob/Demon_Adj2(locate(11+100,151,27))
					new/mob/Green_Adj2(locate(6+100,153,27))
					new/mob/Demon_Adj2(locate(8+100,159,27))
					new/mob/Demon_Adj2(locate(5+100,165,27))
					new/mob/Green_Adj2(locate(11+100,168,27))
					new/mob/Demon_Adj2(locate(15+100,164,27))
					new/mob/Green_Adj2(locate(20+100,166,27))
					sleep(5)
					new/mob/Green_Adj2(locate(25+100,164,27))
					new/mob/Green_Adj2(locate(28+100,168,27))
					new/mob/Demon_Adj2(locate(33+100,164,27))
					new/mob/Demon_Adj2(locate(37+100,166,27))
					new/mob/Green_Adj2(locate(42+100,163,27))
					new/mob/Demon_Adj2(locate(43+100,168,27))
					sleep(5)
					new/mob/Green_Adj2(locate(49+100,167,27))
					new/mob/Green_Adj2(locate(51+100,163,27))
					new/mob/Green_Adj2(locate(56+100,167,27))
					new/mob/Demon_Adj2(locate(55+100,160,27))
					new/mob/Green_Adj2(locate(57+100,156,27))
					new/mob/Demon_Adj2(locate(54+100,152,27))
					sleep(5)
					new/mob/Demon_Adj2(locate(58+100,147,27))
					new/mob/Green_Adj2(locate(56+100,143,27))
					new/mob/Demon_Adj2(locate(54+100,139,27))
					new/mob/Green_Adj2(locate(58+100,133,27))
					new/mob/Green_Adj2(locate(88+100,119,27))
					new/mob/Green_Adj2(locate(84+100,125,27))
					sleep(5)
					new/mob/Demon_Adj2(locate(89+100,131,27))
					new/mob/Green_Adj2(locate(86+100,138,27))
					new/mob/Demon_Adj2(locate(89+100,145,27))
					new/mob/Demon_Adj2(locate(85+100,151,27))
					new/mob/Green_Adj2(locate(77+100,153,27))
					new/mob/Demon_Adj2(locate(74+100,150,27))
					sleep(5)
					new/mob/Green_Adj2(locate(67+100,152,27))
					new/mob/Green_Adj2(locate(66+100,146,27))
					new/mob/Green_Adj2(locate(65+100,139,27))
					new/mob/Demon_Adj2(locate(71+100,137,27))
					new/mob/Green_Adj2(locate(76+100,140,27))
					sleep(5)
					new/mob/Demon_Adj2(locate(77+100,135,27))
					new/mob/Demon_Adj2(locate(75+100,130,27))
					new/mob/Green_Adj2(locate(77+100,125,27))
					new/mob/Demon_Adj2(locate(69+100,127,27))
					new/mob/Green_Adj2(locate(87+100,157,27))
					new/mob/Green_Adj2(locate(84+100,165,27))
					new/mob/Green_Adj2(locate(78+100,163,27))
					sleep(5)
					new/mob/Demon_Adj2(locate(72+100,165,27))
					new/mob/Green_Adj2(locate(67+100,163,27))
					new/mob/Demon_Adj2(locate(66+100,170,27))
					new/mob/Demon_Adj2(locate(69+100,177,27))
					new/mob/Green_Adj2(locate(65+100,182,27))
					new/mob/Demon_Adj2(locate(68+100,188,27))
					//spawn bosses
					sleep(5)
					new/mob/Fire_Demon2(locate(30+100,93,27))
					new/mob/Dark_Pheonix2(locate(47+100,94,27))
					new/mob/Yammy2(locate(28+100,189,27))
					sleep(50 MINUTES)
					for(var/mob/player/X in All_Clients())
						if(X.dteamid == dun2)
							if(X.completed==0&&X.d2cd==1)
								X << output("<b><font color = yellow>Dungeon info: You have 10 minutes until the time limit is up! Better hurry up!","output")
					sleep(3000)
					for(var/mob/player/X in All_Clients())
						if(X.dteamid == dun2)
							if(X.completed==0&&X.d2cd==1)
								X << output("<b><font color = yellow>Dungeon info: You have 5 minutes until the time limit is up!","output")
					sleep(3000)
					for(var/mob/player/X in All_Clients())
						if(X.dteamid == dun2)
							if(X.completed == 0&&X.d2cd==1)
								X << output("<b><font color = yellow>Dungeon info: Time is up! You will now be teleported out! You have a 5min cooldown.","output")
								if(X.dteam_leader == 1)
									X.entered=0
									world<<"<b><font color = yellow>[X]'s Dungeon party has failed to complete the dungeon!"
									for(var/mob/player/Kd in All_Clients())
										if(X.dteamid==Kd.dteamid)
											if(X.bosskill ==1)
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd << "<b><font color = lime>Good try, only got 1/3 bosses, but its worth 10 levels. Try harder next time!"
											if(X.bosskill==2)
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd << "<b><font color = lime>So close! But you only got 2/3 bosses, but its worth 15 levels. Try a little harder next time!"
											if(X.bosskill==3)
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd << "<b><font color = lime>Good Job! Your group got all 3 bosses, Here are 20 levels for the hard work!"
											Kd.bossR1kills=0
											Kd.bossR2kills=0
											Kd.bossR3kills=0
									X.bosskill=0
								if(X.dungeon_healer==1)
									var obj/skillcard/Dungeon_Heal/y = locate() in X.contents
									var obj/skillcard/Dungeon_AOE_Heal/z = locate() in X.contents
									if(!isnull(z))
										X.contents-=z
									if(!isnull(y))
										X.contents-=y
									X.RefreshSkillList()
								X.loc = locate(148,103,1)
								X.completed=1
								X.safe = 0
								X.d2cd=0
								spawn(3000)
									X.completed=0
					//deleteing mobs
					for(var/mob/D in world)
						var/tmp/cnt=0
						if(D.race == "Demon NPC2" || D.race == "Rawr NPC2"|| D.race == "Hollow NPC2"|| D.race == "Yammy Boss2"|| D.race == "Dark Pheonix2"|| D.race == "Fire Demon2")
							del(D)
							cnt++
							if(cnt==30)
								sleep(10)
					//for(var/obj/Ob in world)
					//	if(Ob == /items/usable/Chests/Dungeon3R1Chest|| Ob == /items/usable/Chests/Dungeon3R2Chest|| Ob==/items/usable/Chests/Dungeon3R3Chest)
					//		del(Ob)
					world << "<b><font color = yellow>A Dungeon is now Avaliable!"
					dungeonnum.Insert(2,2)
					dun2 = 0
					dun2check=0

				if(dungeonpick == 3)
					M.flashstep=0
					dungeonnum.Remove(dungeonpick)
					if(M.dteam_leader == 1)
						world << "<b><font color = yellow>[M]'s Dungeon Party has Entered a dungeon! The 50 min cooldown has now begun."
						M.entered=1
					M.loc = locate(40,4,28)
					M.safe = 0
					dun3check=1
					M.d3cd=1
					dun3= M.dteamid
					for(var/mob/Q in world)
						if(M.dteamid == Q.dteamid)
							Q.d3cd=1

					if(M.dungeon_healer==1)
						M.contents+=new/obj/skillcard/Dungeon_Heal
						M.contents|=new/obj/skillcard/Dungeon_AOE_Heal
						M.RefreshSkillList()
					new/obj/items/usable/Chests/Dungeon3R1Chest(locate(82,195,28))
					new/obj/items/usable/Chests/Dungeon3R2Chest(locate(78,180,28))
					new/obj/items/usable/Chests/Dungeon3R3Chest(locate(89,180,28))
					new/mob/Red_Demon3(locate(40,16,28))
					new/mob/Blue_Demon3(locate(40,22,28))
					new/mob/Blue_Demon3(locate(35,20,28))
					new/mob/Red_Demon3(locate(42,29,28))
					new/mob/Red_Demon3(locate(37,35,28))
					new/mob/Blue_Demon3(locate(40,40,28))
					sleep(5)
					new/mob/Red_Demon3(locate(43,45,28))
					new/mob/Blue_Demon3(locate(43,60,28))
					new/mob/Blue_Demon3(locate(39,57,28))
					new/mob/Red_Demon3(locate(44,53,28))
					new/mob/Blue_Demon3(locate(28,22,28))
					new/mob/Red_Demon3(locate(23,18,28))
					new/mob/Red_Demon3(locate(17,19,28))
					sleep(5)
					new/mob/Blue_Demon3(locate(19,13,28))
					new/mob/Red_Demon3(locate(15,8,28))
					new/mob/Blue_Demon3(locate(19,5,28))
					new/mob/Blue_Demon3(locate(23,9,28))
					new/mob/Red_Demon3(locate(28,5,28))
					new/mob/Blue_Demon3(locate(30,9,28))
					new/mob/Red_Demon3(locate(48,38,28))
					new/mob/Red_Demon3(locate(53,41,28))
					new/mob/Blue_Demon3(locate(58,38,28))
					new/mob/Red_Demon3(locate(63,41,28))
					sleep(5)
					new/mob/Red_Demon3(locate(37,47,28))
					new/mob/Blue_Demon3(locate(32,44,28))
					new/mob/Blue_Demon3(locate(25,48,28))
					new/mob/Red_Demon3(locate(20,43,28))
					new/mob/Red_Demon3(locate(15,45,28))
					new/mob/Blue_Demon3(locate(12,47,28))
					new/mob/Red_Demon3(locate(32,61,28))
					new/mob/Blue_Demon3(locate(27,58,28))
					sleep(5)
					new/mob/Blue_Demon3(locate(21,60,28))
					new/mob/Red_Demon3(locate(16,58,28))
					new/mob/Blue_Demon3(locate(12,61,28))
					new/mob/Red_Demon3(locate(3,62,28))
					new/mob/Red_Demon3(locate(7,58,28))
					new/mob/Blue_Demon3(locate(4,53,28))
					new/mob/Red_Demon3(locate(7,49,28))
					sleep(5)
					new/mob/Blue_Demon3(locate(4,43,28))
					new/mob/Stinox3(locate(64,33,28))
					new/mob/Swamp_thing3(locate(60,28,28))
					new/mob/Swamp_thing3(locate(63,24,28))
					new/mob/Stinox3(locate(63,5,28))
					new/mob/Stinox3(locate(57,8,28))
					new/mob/Swamp_thing3(locate(49,5,28))
					new/mob/Stinox3(locate(52,12,28))
					sleep(5)
					new/mob/Swamp_thing3(locate(48,19,28))
					new/mob/Stinox3(locate(53,24,28))
					new/mob/Stinox3(locate(50,28,28))
					new/mob/Blue_Demon3(locate(50,49,28))
					new/mob/Red_Demon3(locate(55,52,28))
					new/mob/Blue_Demon3(locate(52,58,28))
					new/mob/Red_Demon3(locate(56,66,28))
					sleep(5)
					new/mob/Red_Demon3(locate(8,39,28))
					new/mob/Blue_Demon3(locate(3,35,28))
					new/mob/Blue_Demon3(locate(30,34,28))
					new/mob/Red_Demon3(locate(23,31,28))
					new/mob/Red_Demon3(locate(23,34,28))
					new/mob/Blue_Demon3(locate(18,31,28))
					new/mob/Red_Demon3(locate(13,34,28))
					sleep(5)
					new/mob/Blue_Demon3(locate(7,30,28))
					new/mob/Blue_Demon3(locate(5,24,28))
					new/mob/Red_Demon3(locate(7,18,28))
					new/mob/Blue_Demon3(locate(4,13,28))
					new/mob/Red_Demon3(locate(7,5,28))
					new/mob/Red_Demon3(locate(50,66,28))
					new/mob/Blue_Demon3(locate(54,72,28))
					sleep(5)
					new/mob/Red_Demon3(locate(47,75,28))
					new/mob/Blue_Demon3(locate(43,70,28))
					new/mob/Blue_Demon3(locate(35,70,28))
					new/mob/Red_Demon3(locate(35,71,28))
					new/mob/Blue_Demon3(locate(29,73,28))
					new/mob/Red_Demon3(locate(22,75,28))
					new/mob/Red_Demon3(locate(17,70,28))
					sleep(5)
					new/mob/Blue_Demon3(locate(12,73,28))
					new/mob/Red_Demon3(locate(5,72,28))
					new/mob/Blue_Demon3(locate(8,79,28))
					new/mob/Blue_Demon3(locate(4,83,28))
					new/mob/Red_Demon3(locate(6,92,28))
					new/mob/Red_Demon3(locate(4,98,28))
					new/mob/Blue_Demon3(locate(18,31,28))
					new/mob/Red_Demon3(locate(9,102,28))
					sleep(5)
					new/mob/Stinox3(locate(71,48,28))
					new/mob/Swamp_thing3(locate(74,53,28))
					new/mob/Swamp_thing3(locate(69,55,28))
					new/mob/Stinox3(locate(63,60,28))
					new/mob/Stinox3(locate(67,64,28))
					sleep(5)
					new/mob/Swamp_thing3(locate(84,41,28))
					new/mob/Stinox3(locate(86,49,28))
					new/mob/Swamp_thing3(locate(81,51,28))
					new/mob/Stinox3(locate(85,58,28))
					new/mob/Stinox3(locate(83,66,28))
					new/mob/Stinox3(locate(76,64,28))
					new/mob/Swamp_thing3(locate(73,73,28))
					new/mob/Swamp_thing3(locate(77,77,28))
					sleep(5)
					new/mob/Stinox3(locate(74,84,28))
					new/mob/Stinox3(locate(78,89,28))
					new/mob/Swamp_thing3(locate(75,94,28))
					new/mob/Stinox3(locate(75,102,28))
					new/mob/Swamp_thing3(locate(89,95,28))
					new/mob/Stinox3(locate(85,90,28))
					sleep(5)
					new/mob/Stinox3(locate(72,36,28))
					new/mob/Swamp_thing3(locate(73,44,28))
					new/mob/Swamp_thing3(locate(67,23,28))
					new/mob/Swamp_thing3(locate(74,21,28))
					new/mob/Stinox3(locate(72,16,28))
					new/mob/Stinox3(locate(74,10,28))
					sleep(5)
					new/mob/Swamp_thing3(locate(72,6,28))
					new/mob/Stinox3(locate(79,5,28))
					new/mob/Swamp_thing3(locate(84,10,28))
					new/mob/Stinox3(locate(82,16,28))
					new/mob/Stinox3(locate(85,23,28))
					new/mob/Swamp_thing3(locate(83,31,28))
					new/mob/Swamp_thing3(locate(80,36,28))
					sleep(5)
					new/mob/Stinox3(locate(88,86,28))
					new/mob/Stinox3(locate(84,81,28))
					new/mob/Swamp_thing3(locate(86,76,28))
					new/mob/Swamp_thing3(locate(91,79,28))
					new/mob/Stinox3(locate(97,76,28))
					new/mob/Stinox3(locate(93,69,28))
					sleep(5)
					new/mob/Swamp_thing3(locate(97,64,28))
					new/mob/Stinox3(locate(95,59,28))
					new/mob/Swamp_thing3(locate(92,53,28))
					new/mob/Stinox3(locate(97,46,28))
					new/mob/Stinox3(locate(93,41,28))
					new/mob/Swamp_thing3(locate(97,36,28))
					new/mob/Swamp_thing3(locate(93,33,28))
					sleep(5)
					new/mob/Stinox3(locate(96,25,28))
					new/mob/Swamp_thing3(locate(93,20,28))
					new/mob/Stinox3(locate(97,12,28))
					new/mob/Swamp_thing3(locate(93,6,28))
					new/mob/Demon_Adj3(locate(81,99,28))
					new/mob/Green_Adj3(locate(85,102,28))
					sleep(5)
					new/mob/Demon_Adj3(locate(88,108,28))
					new/mob/Demon_Adj3(locate(84,114,28))
					new/mob/Green_Adj3(locate(79,112,28))
					new/mob/Demon_Adj3(locate(75,115,28))
					new/mob/Green_Adj3(locate(67,111,28))
					new/mob/Green_Adj3(locate(60,115,28))
					sleep(5)
					new/mob/Green_Adj3(locate(56,112,28))
					new/mob/Demon_Adj3(locate(46,111,28))
					new/mob/Green_Adj3(locate(40,113,28))
					new/mob/Demon_Adj3(locate(32,116,28))
					new/mob/Demon_Adj3(locate(28,111,28))
					new/mob/Green_Adj3(locate(23,115,28))
					new/mob/Demon_Adj3(locate(18,111,28))
					new/mob/Green_Adj3(locate(14,114,28))
					sleep(5)
					new/mob/Green_Adj3(locate(7,112,28))
					new/mob/Green_Adj3(locate(5,117,28))
					new/mob/Demon_Adj3(locate(8,123,28))
					new/mob/Green_Adj3(locate(4,127,28))
					new/mob/Demon_Adj3(locate(8,132,28))
					new/mob/Demon_Adj3(locate(4,137,28))
					sleep(5)
					new/mob/Green_Adj3(locate(9,141,28))
					new/mob/Demon_Adj3(locate(13,138,28))
					new/mob/Green_Adj3(locate(18,142,28))
					new/mob/Green_Adj3(locate(22,138,28))
					new/mob/Green_Adj3(locate(27,141,28))
					sleep(5)
					new/mob/Demon_Adj3(locate(32,137,28))
					new/mob/Green_Adj3(locate(35,131,28))
					new/mob/Demon_Adj3(locate(34,124,28))
					new/mob/Demon_Adj3(locate(28,128,28))
					new/mob/Green_Adj3(locate(24,124,28))
					sleep(5)
					new/mob/Demon_Adj3(locate(19,128,28))
					new/mob/Green_Adj3(locate(15,125,28))
					new/mob/Green_Adj3(locate(44,118,28))
					new/mob/Green_Adj3(locate(42,124,28))
					new/mob/Demon_Adj3(locate(45,129,28))
					new/mob/Green_Adj3(locate(41,137,28))
					sleep(5)
					new/mob/Demon_Adj3(locate(45,142,28))
					new/mob/Demon_Adj3(locate(43.149,28))
					new/mob/Green_Adj3(locate(41,155,28))
					new/mob/Demon_Adj3(locate(35,151,28))
					new/mob/Green_Adj3(locate(28,153,28))
					new/mob/Green_Adj3(locate(22,150,28))
					new/mob/Green_Adj3(locate(17,154,28))
					sleep(5)
					new/mob/Demon_Adj3(locate(11,151,28))
					new/mob/Green_Adj3(locate(6,153,28))
					new/mob/Demon_Adj3(locate(8,159,28))
					new/mob/Demon_Adj3(locate(5,165,28))
					new/mob/Green_Adj3(locate(11,168,28))
					new/mob/Demon_Adj3(locate(15,164,28))
					new/mob/Green_Adj3(locate(20,166,28))
					sleep(5)
					new/mob/Green_Adj3(locate(25,164,28))
					new/mob/Green_Adj3(locate(28,168,28))
					new/mob/Demon_Adj3(locate(33,164,28))
					new/mob/Demon_Adj3(locate(37,166,28))
					new/mob/Green_Adj3(locate(42,163,28))
					new/mob/Demon_Adj3(locate(43,168,28))
					sleep(5)
					new/mob/Green_Adj3(locate(49,167,28))
					new/mob/Green_Adj3(locate(51,163,28))
					new/mob/Green_Adj3(locate(56,167,28))
					new/mob/Demon_Adj3(locate(55,160,28))
					new/mob/Green_Adj3(locate(57,156,28))
					new/mob/Demon_Adj3(locate(54,152,28))
					sleep(5)
					new/mob/Demon_Adj3(locate(58,147,28))
					new/mob/Green_Adj3(locate(56,143,28))
					new/mob/Demon_Adj3(locate(54,139,28))
					new/mob/Green_Adj3(locate(58,133,28))
					new/mob/Green_Adj3(locate(88,119,28))
					new/mob/Green_Adj3(locate(84,125,28))
					sleep(5)
					new/mob/Demon_Adj3(locate(89,131,28))
					new/mob/Green_Adj3(locate(86,138,28))
					new/mob/Demon_Adj3(locate(89,145,28))
					new/mob/Demon_Adj3(locate(85,151,28))
					new/mob/Green_Adj3(locate(77,153,28))
					new/mob/Demon_Adj3(locate(74,150,28))
					sleep(5)
					new/mob/Green_Adj3(locate(67,152,28))
					new/mob/Green_Adj3(locate(66,146,28))
					new/mob/Green_Adj3(locate(65,139,28))
					new/mob/Demon_Adj3(locate(71,137,28))
					new/mob/Green_Adj3(locate(76,140,28))
					sleep(5)
					new/mob/Demon_Adj3(locate(77,135,28))
					new/mob/Demon_Adj3(locate(75,130,28))
					new/mob/Green_Adj3(locate(77,125,28))
					new/mob/Demon_Adj3(locate(69,127,28))
					new/mob/Green_Adj3(locate(87,157,28))
					new/mob/Green_Adj3(locate(84,165,28))
					new/mob/Green_Adj3(locate(78,163,28))
					sleep(5)
					new/mob/Demon_Adj3(locate(72,165,28))
					new/mob/Green_Adj3(locate(67,163,28))
					new/mob/Demon_Adj3(locate(66,170,28))
					new/mob/Demon_Adj3(locate(69,177,28))
					new/mob/Green_Adj3(locate(65,182,28))
					new/mob/Demon_Adj3(locate(68,188,28))
					//spawn bosses
					sleep(5)
					new/mob/Fire_Demon3(locate(30,93,28))
					new/mob/Dark_Pheonix3(locate(47,94,28))
					new/mob/Yammy3(locate(28,189,28))

					sleep(50 MINUTES)
					for(var/mob/player/X in All_Clients())
						if(X.dteamid == dun3)
							if(X.completed==0&&X.d3cd==1)
								X << output("<b><font color = yellow>Dungeon info: You have 10 minutes until the time limit is up! Better hurry up!","output")
					sleep(3000)
					for(var/mob/player/X in All_Clients())
						if(X.dteamid == dun3)
							if(X.completed==0&&X.d3cd==1)
								X << output("<b><font color = yellow>Dungeon info: You have 5 minutes until the time limit is up!","output")
					sleep(3000)
					for(var/mob/player/X in All_Clients())
						if(X.dteamid == dun3)
							if(X.completed == 0&&X.d3cd==1)
								X << output("<b><font color = yellow>Dungeon info: Time is up! You will now be teleported out! You have a 5min cooldown.","output")
								if(X.dteam_leader == 1)
									X.entered=0
									world<<"<b><font color = yellow>[X]'s Dungeon party has failed to complete the dungeon!"
									for(var/mob/player/Kd in All_Clients())
										if(X.dteamid==Kd.dteamid)
											if(X.bosskill ==1)
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd << "<b><font color = lime>Good try, only got 1/3 bosses, but its worth 10 levels. Try harder next time!"
											if(X.bosskill==2)
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd << "<b><font color = lime>So close! But you only got 2/3 bosses, but its worth 15 levels. Try a little harder next time!"
											if(X.bosskill==3)
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd.GainExp(Kd.mexp)
												Kd.Level_Up()
												Kd << "<b><font color = lime>Good Job! Your group got all 3 bosses, Here are 20 levels for the hard work!"
											Kd.bossR1kills=0
											Kd.bossR2kills=0
											Kd.bossR3kills=0
									X.bosskill=0
								if(X.dungeon_healer==1)
									var obj/skillcard/Dungeon_Heal/y = locate() in X.contents
									var obj/skillcard/Dungeon_AOE_Heal/z = locate() in X.contents
									if(!isnull(z))
										X.contents-=z
									if(!isnull(y))
										X.contents-=y
									X.RefreshSkillList()
								X.loc = locate(148,103,1)
								X.completed=1
								X.safe = 0
								X.d3cd=0
								spawn(3000)
									X.completed=0
					//deleteing mobs
					for(var/mob/D in world)
						var/tmp/cnt=0
						if(D.race == "Demon NPC3" || D.race == "Rawr NPC3"|| D.race == "Hollow NPC3"|| D.race == "Yammy Boss3"|| D.race == "Dark Pheonix3"|| D.race == "Fire Demon3")
							del(D)
							cnt++
							if(cnt==30)
								sleep(10)
					world << "<b><font color = yellow>A Dungeon is now Avaliable!"
					dungeonnum.Insert(3,3)
					dun3 = 0
					dun3check=0
		else
			if(istype(A,/obj/)) return


mob/verb
	Check_Dungeon_Availability()
		set category = "Commands"
		var/t=pick(1,2,3,4,5,6)//for randomly printing dungeons so players cannot learn dungeon1 is first etc. prob a better way but at this point idgaf
		if(t==1)
			if(dun1check==0)
				usr << output("<b><font color = #4CE9F0>Dungeon - Avaliable","output")
			else if(dun1check==1)
				usr << output("<b><font color = #4CE9F0>Dungeon - Occupied","output")
			else if(dun1check==2)
				usr << output("<b><font color = #4CE9F0>Dungeon - Completed, on Cooldown","output")
			if(dun2check==0)
				usr << output("<b><font color = #4CE9F0>Dungeon - Avaliable","output")
			else if(dun2check==1)
				usr << output("<b><font color = #4CE9F0>Dungeon - Occupied","output")
			else if(dun2check==2)
				usr << output("<b><font color = #4CE9F0>Dungeon - Completed, on Cooldown","output")
			if(dun3check==0)
				usr << output("<b><font color = #4CE9F0>Dungeon - Avaliable","output")
			else if(dun3check==1)
				usr << output("<b><font color = #4CE9F0>Dungeon - Occupied","output")
			else if(dun3check==2)
				usr << output("<b><font color = #4CE9F0>Dungeon - Completed, on Cooldown","output")
		if(t==2)
			if(dun3check==0)
				usr << output("<b><font color = #4CE9F0>Dungeon - Avaliable","output")
			else if(dun3check==1)
				usr << output("<b><font color = #4CE9F0>Dungeon - Occupied","output")
			else if(dun3check==2)
				usr << output("<b><font color = #4CE9F0>Dungeon - Completed, on Cooldown","output")
			if(dun1check==0)
				usr << output("<b><font color = #4CE9F0>Dungeon - Avaliable","output")
			else if(dun1check==1)
				usr << output("<b><font color = #4CE9F0>Dungeon - Occupied","output")
			else if(dun1check==2)
				usr << output("<b><font color = #4CE9F0>Dungeon - Completed, on Cooldown","output")
			if(dun2check==0)
				usr << output("<b><font color = #4CE9F0>Dungeon - Avaliable","output")
			else if(dun2check==1)
				usr << output("<b><font color = #4CE9F0>Dungeon - Occupied","output")
			else if(dun2check==2)
				usr << output("<b><font color = #4CE9F0>Dungeon - Completed, on Cooldown","output")
		if(t==3)
			if(dun2check==0)
				usr << output("<b><font color = #4CE9F0>Dungeon - Avaliable","output")
			else if(dun2check==1)
				usr << output("<b><font color = #4CE9F0>Dungeon - Occupied","output")
			else if(dun2check==2)
				usr << output("<b><font color = #4CE9F0>Dungeon - Completed, on Cooldown","output")
			if(dun1check==0)
				usr << output("<b><font color = #4CE9F0>Dungeon - Avaliable","output")
			else if(dun1check==1)
				usr << output("<b><font color = #4CE9F0>Dungeon - Occupied","output")
			else if(dun1check==2)
				usr << output("<b><font color = #4CE9F0>Dungeon - Completed, on Cooldown","output")
			if(dun3check==0)
				usr << output("<b><font color = #4CE9F0>Dungeon - Avaliable","output")
			else if(dun3check==1)
				usr << output("<b><font color = #4CE9F0>Dungeon - Occupied","output")
			else if(dun3check==2)
				usr << output("<b><font color = #4CE9F0>Dungeon - Completed, on Cooldown","output")
		if(t==4)
			if(dun3check==0)
				usr << output("<b><font color = #4CE9F0>Dungeon - Avaliable","output")
			else if(dun3check==1)
				usr << output("<b><font color = #4CE9F0>Dungeon - Occupied","output")
			else if(dun3check==2)
				usr << output("<b><font color = #4CE9F0>Dungeon - Completed, on Cooldown","output")
			if(dun2check==0)
				usr << output("<b><font color = #4CE9F0>Dungeon - Avaliable","output")
			else if(dun2check==1)
				usr << output("<b><font color = #4CE9F0>Dungeon - Occupied","output")
			else if(dun2check==2)
				usr << output("<b><font color = #4CE9F0>Dungeon - Completed, on Cooldown","output")
			if(dun1check==0)
				usr << output("<b><font color = #4CE9F0>Dungeon - Avaliable","output")
			else if(dun1check==1)
				usr << output("<b><font color = #4CE9F0>Dungeon - Occupied","output")
			else if(dun1check==2)
				usr << output("<b><font color = #4CE9F0>Dungeon - Completed, on Cooldown","output")
		if(t==5)
			if(dun2check==0)
				usr << output("<b><font color = #4CE9F0>Dungeon - Avaliable","output")
			else if(dun2check==1)
				usr << output("<b><font color = #4CE9F0>Dungeon - Occupied","output")
			else if(dun2check==2)
				usr << output("<b><font color = #4CE9F0>Dungeon - Completed, on Cooldown","output")
			if(dun3check==0)
				usr << output("<b><font color = #4CE9F0>Dungeon - Avaliable","output")
			else if(dun3check==1)
				usr << output("<b><font color = #4CE9F0>Dungeon - Occupied","output")
			else if(dun3check==2)
				usr << output("<b><font color = #4CE9F0>Dungeon - Completed, on Cooldown","output")
			if(dun1check==0)
				usr << output("<b><font color = #4CE9F0>Dungeon - Avaliable","output")
			else if(dun1check==1)
				usr << output("<b><font color = #4CE9F0>Dungeon - Occupied","output")
			else if(dun1check==2)
				usr << output("<b><font color = #4CE9F0>Dungeon - Completed, on Cooldown","output")
		if(t==6)
			if(dun1check==0)
				usr << output("<b><font color = #4CE9F0>Dungeon - Avaliable","output")
			else if(dun1check==1)
				usr << output("<b><font color = #4CE9F0>Dungeon - Occupied","output")
			else if(dun1check==2)
				usr << output("<b><font color = #4CE9F0>Dungeon - Completed, on Cooldown","output")
			if(dun3check==0)
				usr << output("<b><font color = #4CE9F0>Dungeon - Avaliable","output")
			else if(dun3check==1)
				usr << output("<b><font color = #4CE9F0>Dungeon - Occupied","output")
			else if(dun3check==2)
				usr << output("<b><font color = #4CE9F0>Dungeon - Completed, on Cooldown","output")
			if(dun2check==0)
				usr << output("<b><font color = #4CE9F0>Dungeon - Avaliable","output")
			else if(dun2check==1)
				usr << output("<b><font color = #4CE9F0>Dungeon - Occupied","output")
			else if(dun2check==2)
				usr << output("<b><font color = #4CE9F0>Dungeon - Completed, on Cooldown","output")


	Create_Dungeon_Party()
		set category = "Party"
		if(usr.in_team)
			usr << output("<b>You are already in a party!","output")
			return 0
		if(usr.level<600)
			usr << output("<b>You do not meet the level requirement to join or host a dungeon party! Level to at least 600.","output")
			return
		if(!usr.in_team)
			switch(alert("Are you sure you want to create a Dungeon party?","Dungeon Party Creator","Yes","No"))
				if("Yes")
					if(usr.in_team||in_team)
						alert(usr,"Can't do this multiple times.")
						online_admins << "[usr] is trying to bug the Dungeon creation."
						return 0
				/*	if(usr.dteam_leader)
						alert(usr,"You can't create a party when already a leader.")
						online_admins << "[usr] is trying to bug the Dungeon creation."
						return 0	*/
					usr.in_team=1
					in_team=1
					if(!usr.in_team||!in_team)	goto Create
				if("No")
					return
			Create
				if(usr.lost)
					usr<<"Not while in an event"
					return
				if(usr.dteam_leader)
					usr<<"You can't create another party."
					return
				usr.dteamid = rand(500000,550000)
				usr.dteam_leader = 1
				usr.in_team = 1
				usr << output("<b><font color = teal>You have joined [usr]'s Dungeon party!","output")
				usr << output("<b><font color = teal>You have created a Dungeon party!","output")
				switch(alert("What role do you wish to be during this Dungeon?","Dungeon Party Role","Tank","Healer","DPS role"))
					if("Tank")
						usr.dungeon_tank =1
					if("Healer")
						usr.dungeon_healer =1
					if("DPS role")
						usr.dungeon_atck = 1
				usr << alert("Make sure to talk with your group before hand as to what roles they want! to many tanks and healers can cause not enough damage! Too many DPS can cause wipes!","Helpful hint to dungeons")
				//usr << alert("If you must leave at all during your time in a dungeon or in a dungeon party, make sure you Leave the Dungeon Party so it can choose a new Leader! Falure to do this can cause a temp ban from dungeons!","Warning!")
				usr.overlays += /obj/gl
				usr.Give_Dungeon_Verbs()

mob/Dungeon_Party_Leader
	verb
		Dungeon_Team_Invite()
			set category = "Party"
			set name = "Dungeon Party Invite"
			var/list/Menu = list()
			var/J = 1
			for(var/mob/player/M in All_Clients())
				if(M.dteamid == usr.dteamid&&M.in_team)
					J += 1
					M.dungeon_count +=1
			if(J > 5)
				usr << output("<b>You have too many members in your Dungeon party! The limit is 5 people.","output")
				return
			for(var/mob/player/M in All_Clients() - usr)
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.in_team)
						Menu.Remove(M)
					if(!M.in_team)
						Menu.Add(M)
			var/mob/M = input("Who do you want to invite to your Dungeon party?","") as null | anything in Menu
			if(usr.sentinvite)
				alert(usr,"Multiple invites not sent as you're trying to do.....alerting to Relapse.")
				online_admins << "[usr] is trying to bug the Dungeon invites."
				return 0
			if(!M)return
			if(M.level<600)
				usr << output("<b>[M]'s level does not meet the requirement of 600.","output")
				return
			if(istype(M,/mob/player))
				usr.sentinvite = 1
				switch(alert(M,"Do you want to join [usr]'s Dungeon party?","Join Dungeon Party","Yes","No"))
					if("Yes")
						if(M.in_team||M.dteam_leader)
							alert(M,"You can't join [usr]'s party as you're already in a party.")
							alert(usr,"[M] can't join your party as he's already in one.")
							return 0

						var/Js = 1
						for(var/mob/player/Md in All_Clients())
							if(Md.dteamid == usr.dteamid)
								Js += 1
						if(Js > 5)
							M << output("<b>[usr] has no more space for you!","output")
							return
						if(M.lost)
							M<<"Not while in an event"
							return
						switch(alert(M,"What role do you wish to be during this Dungeon?","Dungeon Party Role","Tank","Healer","DPS role"))
							if("Tank")
								M.dungeon_tank =1
								usr << output("<b><font color = yellow>[M] has chosen the role of Tank!","output")
							if("Healer")
								M.dungeon_healer =1
								usr << output("<b><font color = yellow>[M] has chosen the role of Healer!","output")
							if("DPS role")
								M.dungeon_atck = 1
								usr << output("<b><font color = yellow>[M] has chosen the role of DPS!","output")
						M.dteamid = usr.dteamid
						if(usr.d1cd==1)
							M.d1cd=1
						if(usr.d2cd==1)
							M.d2cd=1
						if(usr.d3cd==1)
							M.d3cd=1
						M.bossR1kills=usr.bossR1kills
						M.bossR2kills=usr.bossR2kills
						M.bossR3kills=usr.bossR3kills
						M.dteam_member = 1
						M.in_team = 1
						M.Give_Dungeon_Verbs()
						for(var/mob/player/X in All_Clients())
							if(X.dteamid== usr.dteamid && X.in_team && usr.in_team)
								X << output("<b><font color = teal>Dungeon Party Info: [M] has joined the party!","output")
								usr.sentinvite=0
								if(Js == 5)
									usr.dungeon_count = 5
									X.dungeon_count = 5
									X << output("<b><font color = yellow>Dungon Party Info: You have reached 5 players! you may now Enter the Dungeon!","output")
					if("No")
						usr << output("[M] has declined your Dungeon Party Invite","output")
						usr.sentinvite=0
						sleep(60)
						return
		Dungeon_Party_Boot()
			set category = "Party"
			set name = "Dungeon Party Boot"
			var/list/Menu = list()
			for(var/mob/player/M in All_Clients())
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.in_team)
						if(M.dteamid == usr.dteamid)
							Menu.Add(M)
			var/mob/player/M = input("Who do you wish to boot from the Dungeon party","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob/player))
				switch(alert("Are you sure you want to boot [M] from the Dungeon party?","","Yes","No"))
					if("Yes")
						for(var/mob/player/X in All_Clients())
							if(X.dteamid== usr.dteamid)
								X << output("<b><font color = teal>Dungeon Party Info: [usr] has booted [M] from the Dungeon party!","output")
								if(X.dteam_leader==1)
									X.dungeon_count-=1

						if(M.dungeon_healer ==1)
							var obj/skillcard/Dungeon_Heal/y = locate() in M.contents
							var obj/skillcard/Dungeon_AOE_Heal/z = locate() in M.contents
							if(!isnull(z))
								M.contents-=z
							if(!isnull(y))
								M.contents-=y
							M.RefreshSkillList()

						if(M.z==27 || M.z==28)
							M.Respawn()
						M.d1cd=0
						M.d2cd=0
						M.d3cd=0
						M.leavedungeonteam()
						M.dteamid=null
						M.dungeon_tank = 0
						M.dungeon_healer = 0
						M.dungeon_atck = 0
						M.bosskill=0
						M.dteam_leader = 0
						M.dteam_member = 0
						M.dungeon_count = 0
						M.in_team = 0
					if("No")
						return
mob/Dungeon_Party_Verbs
	verb
		Dungeon_Say(T as text)
			set category = "Party"
			set name="Dungeon Say"
			var/list/L
			L = list("font size")
			if(length(T) > 500)
				alert("Your message must be less than 500 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/player/X in All_Clients())
				if(X.dteamid== usr.dteamid)
					X << output("<b><font color = teal><u>(Party Say)[src.name]: [T]","output")
		Dungeon_Who()
			set category = "Party"
			set name="Dungeon Who"
			src << output("<b><font color = teal><u>(Party Who)","output")
			for(var/mob/player/X in All_Clients())
				if(X.dteamid== usr.dteamid)
					if(X.dungeon_healer)
						src << output("<font color = teal>Healer - [X]","output")
					if(X.dungeon_atck)
						src << output("<font color = teal>DPS    - [X]","output")
					if(X.dungeon_tank)
						src << output("<font color = teal>Tank   - [X]","output")
		Leave_Dungeon_Party()
			set category = "Party"
			set name = "Leave Dungeon Party"
			switch(alert("Are you sure you want to leave the Dungeon party?","","Yes","No"))
				if("Yes")
					var/tmp/cnt=0
					for(var/mob/player/M in All_Clients())
						if(M.dteamid == usr.dteamid)
							M << output("<b><font color = teal>[usr] has left the Dungeon party!","output")
							M.dungeon_count-=1
							if(M.dteam_leader!=1)
								cnt++
								if(cnt==1)
									M.changeLeader=1
								if(cnt==2)
									M.changeLeader=2
								if(cnt==3)
									M.changeLeader=3
								if(cnt==4)
									M.changeLeader=4
					//picking new leader
					//if 1 person left in party
					if(usr.dteam_leader==1)
						if(cnt==1)
							/var/tmp/t = pick(1)
							for(var/mob/player/M in All_Clients())
								if(M.dteamid == usr.dteamid)
									if(t == M.changeLeader)
										M.dteam_member=0
										M.dteam_leader = 1
										M.bosskill=usr.bosskill
										M << output("<b><font color = yellow>You are the new Dungeon Leader!","output")
										M.Give_Dungeon_Verbs()
										world << "<b><font color = yellow>[M] is the new Dungeon Leader because [usr] has left or disconnected!"
						//if 2 person left in party
						if(cnt==2)
							/var/tmp/p = pick(1,2)
							for(var/mob/player/M in All_Clients())
								if(M.dteamid == usr.dteamid)
									if(p == M.changeLeader)
										M.dteam_member=0
										M.dteam_leader = 1
										M.bosskill=usr.bosskill
										M << output("<b><font color = yellow>You are the new Dungeon Leader!","output")
										M.Give_Dungeon_Verbs()
										world << "<b><font color = yellow>[M] is the new Dungeon Leader because [usr] has left or disconnected!"
						//if 3 person left in party
						if(cnt==3)
							/var/tmp/q = pick(1,2,3)
							for(var/mob/player/M in All_Clients())
								if(M.dteamid == usr.dteamid)
									if(q == M.changeLeader)
										M.dteam_member=0
										M.dteam_leader = 1
										M.bosskill=usr.bosskill
										M << output("<b><font color = yellow>You are the new Dungeon Leader!","output")
										M.Give_Dungeon_Verbs()
										world << "<b><font color = yellow>[M] is the new Dungeon Leader because [usr] has left or disconnected!"
						//if 4 person left in party
						if(cnt==4)
							/var/tmp/r = pick(1,2,3,4)
							for(var/mob/player/M in All_Clients())
								if(M.dteamid == usr.dteamid)
									if(r == M.changeLeader)
										M.dteam_member=0
										M.dteam_leader = 1
										M.bosskill=usr.bosskill
										M << output("<b><font color = yellow>You are the new Dungeon Leader!","output")
										M.Give_Dungeon_Verbs()
										world << "<b><font color = yellow>[M] is the new Dungeon Leader because [usr] has left or disconnected!"
					for(var/mob/player/M in All_Clients())
						if(M.dteamid == usr.dteamid)
							M.changeLeader=0
					if(src.dungeon_healer ==1)
						var obj/skillcard/Dungeon_Heal/y = locate() in src.contents
						var obj/skillcard/Dungeon_AOE_Heal/z = locate() in src.contents
						if(!isnull(z))
							src.contents-=z
						if(!isnull(y))
							src.contents-=y
						src.RefreshSkillList()
					if(src.z==27 || src.z==28)
						src.Respawn()
					src.leavedungeonteam()
					src.d1cd=0
					src.d2cd=0
					src.d3cd=0
					src.dteamid = null
					src.dungeon_tank = 0
					src.dungeon_healer = 0
					src.dungeon_atck = 0
					src.bosskill=0
					src.dteam_leader = 0
					src.dteam_member = 0
					src.dungeon_count = 0
					src.in_team = 0
				if("No")
					return

mob
	proc
		Give_Dungeon_Verbs()
			if(src.dteam_leader)
				src.verbs += typesof(/mob/Dungeon_Party_Leader/verb)
				src.verbs += typesof(/mob/Dungeon_Party_Verbs/verb)
			if(src.dteam_member)
				src.verbs += typesof(/mob/Dungeon_Party_Verbs/verb)
		leavedungeonteam()
			src.verbs -= typesof(/mob/Dungeon_Party_Leader/verb)
			src.verbs -= typesof(/mob/Dungeon_Party_Verbs/verb)
//------------------------------------npcs---------------------------

mob
	Red_Demon
		is_dnpc=1
		legit=0
		enemy = 1
		agrange=17
		level=1000
		delay=0
		mhealth = 44000000

		health = 44000000
		attack = 20000
		mattack = 20000
		mdefence = 20000
		mreiatsu = 20000
		defence = 20000
		reiatsu = 20000
		hostile=1
		killable=1
		healthwas = 44000000
		mrei = 200000
		rei=200000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		race="Demon NPC"
		armorpassive=20
		rundelay=0
		name="Red Demon"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Red_Demon/top
			src.overlays += /obj/Red_Demon/bottom
			src.oldspot = src.loc
			expgain=rand(33000000,39000000)
			..()
	Blue_Demon
		is_dnpc=2
		legit=0
		enemy = 1
		agrange=17
		level=1000
		delay=0
		mhealth = 44000000

		health = 440000
		attack = 20000
		mattack = 20000
		mdefence = 20000
		mreiatsu = 20000
		defence = 20000
		reiatsu = 20000
		hostile=1
		killable=1
		healthwas = 44000000
		mrei = 200000
		rei=200000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		race="Demon NPC"
		armorpassive=20
		rundelay=0
		name="Blue Demon"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Blue_Demon/botleft
			src.overlays += /obj/Blue_Demon/botright
			src.overlays += /obj/Blue_Demon/topleft
			src.overlays += /obj/Blue_Demon/topright
			src.oldspot = src.loc
			expgain=rand(33000000,39000000)
			..()
	Stinox
		is_dnpc=3
		legit=0
		enemy = 1
		agrange=17
		level=1000
		delay=0
		mhealth = 44000000

		health = 440000
		attack = 20000
		mattack = 20000
		mdefence = 20000
		mreiatsu = 20000
		defence = 20000
		reiatsu = 20000
		hostile=1
		killable=1
		healthwas = 44000000
		mrei = 200000
		rei=200000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		race="Rawr NPC"
		armorpassive=20
		rundelay=0
		name="Stinox"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Stinox/stinox00
			src.overlays += /obj/Stinox/stinox01
			src.overlays += /obj/Stinox/stinox10
			src.overlays += /obj/Stinox/stinox11
			src.oldspot = src.loc
			expgain=rand(33000000,39000000)
			..()
	Swamp_thing
		is_dnpc=4
		legit=0
		enemy = 1
		agrange=17
		level=1000
		delay=0
		mhealth = 44000000

		health = 440000
		attack = 20000
		mattack = 20000
		mdefence = 20000
		mreiatsu = 20000
		defence = 20000
		reiatsu = 20000
		hostile=1
		killable=1
		healthwas = 44000000
		mrei = 200000
		rei=200000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		race="Rawr NPC"
		armorpassive=20
		rundelay=0
		name="Swampy"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/SwampMonster/Swamp1
			src.overlays += /obj/SwampMonster/Swamp2
			src.overlays += /obj/SwampMonster/Swamp3
			src.overlays += /obj/SwampMonster/Swamp4
			src.oldspot = src.loc
			expgain=rand(33000000,39000000)
			..()
	Green_Adj
		is_dnpc=5
		legit=0
		enemy = 1
		agrange=17
		level=1000
		delay=0
		mhealth = 44000000

		health = 440000
		attack = 20000
		mattack = 20000
		mdefence = 20000
		mreiatsu = 20000
		defence = 20000
		reiatsu = 20000
		hostile=1
		killable=1
		healthwas = 44000000
		mrei = 200000
		rei=200000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		race="Hollow NPC"
		armorpassive=20
		rundelay=0
		name="Green Adjucha"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Green_Adj/adj00
			src.overlays += /obj/Green_Adj/adj10
			src.overlays += /obj/Green_Adj/adj20
			src.overlays += /obj/Green_Adj/adj01
			src.overlays += /obj/Green_Adj/adj11
			src.overlays += /obj/Green_Adj/adj21
			src.overlays += /obj/Green_Adj/adj02
			src.overlays += /obj/Green_Adj/adj12
			src.overlays += /obj/Green_Adj/adj22
			src.overlays += /obj/Green_Adj/adj03
			src.overlays += /obj/Green_Adj/adj13
			src.overlays += /obj/Green_Adj/adj23
			src.overlays += /obj/Green_Adj/adj04
			src.overlays += /obj/Green_Adj/adj14
			src.overlays += /obj/Green_Adj/adj24
			src.oldspot = src.loc
			expgain=rand(33000000,39000000)
			..()
	Demon_Adj
		is_dnpc=6
		legit=0
		enemy = 1
		agrange=17
		level=1000
		delay=0
		mhealth = 44000000

		health = 44000000
		attack = 20000
		mattack = 20000
		mdefence = 20000
		mreiatsu = 20000
		defence = 20000
		reiatsu = 20000
		hostile=1
		killable=1
		healthwas = 440000000
		mrei = 200000
		rei=200000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		race="Hollow NPC"
		armorpassive=20
		rundelay=0
		name="Green Adjucha"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Demon_Adj/bottomleft
			src.overlays += /obj/Demon_Adj/bottomright
			src.overlays += /obj/Demon_Adj/topleft
			src.overlays += /obj/Demon_Adj/topright
			src.oldspot = src.loc
			expgain=rand(33000000,39000000)
			..()
	Yammy
		enemy = 1
		is_dnpc=0
		agrange=22
		level=12500
		delay=0
		mhealth = 999999999
		legit=1
		health = 999999999
		attack = 500000
		mattack = 500000
		mdefence = 900000
		mreiatsu = 200000
		defence = 900000
		reiatsu = 200000
		hostile=1
		killable=1
		healthwas = 999999999
		mrei = 2000000
		rei=2000000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		swordon=1
		ressurection=1
		race="Yammy Boss"
		ressurectiontype="Yammy"
		wound=0
		armorpassive=20
		rundelay=2
		name="Yammy"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays+=/obj/releases/YammyRessIcon/yam00
			src.overlays+=/obj/releases/YammyRessIcon/yam01
			src.overlays+=/obj/releases/YammyRessIcon/yam02
			src.overlays+=/obj/releases/YammyRessIcon/yam03
			src.overlays+=/obj/releases/YammyRessIcon/yam04
			src.overlays+=/obj/releases/YammyRessIcon/yam05
			src.overlays+=/obj/releases/YammyRessIcon/yam10
			src.overlays+=/obj/releases/YammyRessIcon/yam11
			src.overlays+=/obj/releases/YammyRessIcon/yam12
			src.overlays+=/obj/releases/YammyRessIcon/yam13
			src.overlays+=/obj/releases/YammyRessIcon/yam14
			src.overlays+=/obj/releases/YammyRessIcon/yam15
			src.overlays+=/obj/releases/YammyRessIcon/yam20
			src.overlays+=/obj/releases/YammyRessIcon/yam21
			src.overlays+=/obj/releases/YammyRessIcon/yam22
			src.overlays+=/obj/releases/YammyRessIcon/yam23
			src.overlays+=/obj/releases/YammyRessIcon/yam24
			src.overlays+=/obj/releases/YammyRessIcon/yam25
			src.overlays+=/obj/releases/YammyRessIcon/yam30
			src.overlays+=/obj/releases/YammyRessIcon/yam31
			src.overlays+=/obj/releases/YammyRessIcon/yam32
			src.overlays+=/obj/releases/YammyRessIcon/yam33
			src.overlays+=/obj/releases/YammyRessIcon/yam34
			src.overlays+=/obj/releases/YammyRessIcon/yam35
			src.overlays+=/obj/releases/YammyRessIcon/yam40
			src.overlays+=/obj/releases/YammyRessIcon/yam41
			src.overlays+=/obj/releases/YammyRessIcon/yam42
			src.overlays+=/obj/releases/YammyRessIcon/yam43
			src.overlays+=/obj/releases/YammyRessIcon/yam44
			src.overlays+=/obj/releases/YammyRessIcon/yam45
			src.overlays+=/obj/releases/YammyRessIcon/yam50
			src.overlays+=/obj/releases/YammyRessIcon/yam51
			src.overlays+=/obj/releases/YammyRessIcon/yam52
			src.overlays+=/obj/releases/YammyRessIcon/yam53
			src.overlays+=/obj/releases/YammyRessIcon/yam54
			src.overlays+=/obj/releases/YammyRessIcon/yam55
			src.oldspot = src.loc
			expgain=rand(400000000,500000000)
	Dark_Pheonix
		enemy = 1
		is_dnpc=0
		agrange=22
		level=12500
		delay=0
		mhealth = 999999999
		legit=1
		health = 999999999
		attack = 400000
		mattack = 400000
		mdefence = 900000
		mreiatsu = 200000
		defence = 900000
		reiatsu = 200000
		hostile=1
		killable=1
		healthwas = 999999999
		mrei = 2000000
		rei=2000000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		swordon=1
		hasabankai=1
		hasashikai=1
		Tnpccaptain=1
		race="Dark Pheonix"
		stype="Yammamoto"
		swordcall="Let the Dark Fire Consume your soul!"
		swordname="Dark Hyosuke"
		wound=0
		armorpassive=20
		rundelay=0
		name="Dark Pheonix"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Dark_Pheonix/dp00
			src.overlays += /obj/Dark_Pheonix/dp01
			src.overlays += /obj/Dark_Pheonix/dp02
			src.overlays += /obj/Dark_Pheonix/dp10
			src.overlays += /obj/Dark_Pheonix/dp11
			src.overlays += /obj/Dark_Pheonix/dp12
			src.overlays += /obj/Dark_Pheonix/dp20
			src.overlays += /obj/Dark_Pheonix/dp21
			src.overlays += /obj/Dark_Pheonix/dp22
			src.oldspot = src.loc
			expgain=rand(400000000,500000000)
			..()
	Fire_Demon
		enemy = 1
		is_dnpc=0
		agrange=22
		level=12500
		delay=0
		mhealth = 999999999
		legit=1
		health = 999999999
		attack = 500000
		mattack = 500000
		mdefence = 900000
		mreiatsu = 200000
		defence = 900000
		reiatsu = 200000
		hostile=1
		killable=1
		healthwas = 999999999
		mrei = 2000000
		rei=2000000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		swordon=1
		hasabankai=1
		hasashikai=1
		Tnpccaptain=1
		race="Fire Demon"
		stype="Yammamoto"
		swordcall="I will burn everything to ash!"
		swordname="Inferno"
		wound=0
		armorpassive=20
		rundelay=0
		name="Fire Demon"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Fire_Demon/fd00
			src.overlays += /obj/Fire_Demon/fd01
			src.overlays += /obj/Fire_Demon/fd02
			src.overlays += /obj/Fire_Demon/fd10
			src.overlays += /obj/Fire_Demon/fd11
			src.overlays += /obj/Fire_Demon/fd12
			src.oldspot = src.loc
			expgain=rand(400000000,500000000)
			..()

mob
	Red_Demon2
		is_dnpc=1
		legit=0
		enemy = 1
		agrange=17
		level=1000
		delay=0
		mhealth = 44000000

		health = 44000000
		attack = 20000
		mattack = 20000
		mdefence = 20000
		mreiatsu = 20000
		defence = 20000
		reiatsu = 20000
		hostile=1
		killable=1
		healthwas = 44000000
		mrei = 200000
		rei=200000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		race="Demon NPC2"
		armorpassive=20
		rundelay=0
		name="Red Demon"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Red_Demon/top
			src.overlays += /obj/Red_Demon/bottom
			src.oldspot = src.loc
			expgain=rand(33000000,39000000)
			..()
	Blue_Demon2
		is_dnpc=2
		legit=0
		enemy = 1
		agrange=17
		level=1000
		delay=0
		mhealth = 44000000

		health = 440000
		attack = 20000
		mattack = 20000
		mdefence = 20000
		mreiatsu = 20000
		defence = 20000
		reiatsu = 20000
		hostile=1
		killable=1
		healthwas = 44000000
		mrei = 200000
		rei=200000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		race="Demon NPC2"
		armorpassive=20
		rundelay=0
		name="Blue Demon"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Blue_Demon/botleft
			src.overlays += /obj/Blue_Demon/botright
			src.overlays += /obj/Blue_Demon/topleft
			src.overlays += /obj/Blue_Demon/topright
			src.oldspot = src.loc
			expgain=rand(33000000,39000000)
			..()
	Stinox2
		is_dnpc=3
		legit=0
		enemy = 1
		agrange=17
		level=1000
		delay=0
		mhealth = 44000000

		health = 440000
		attack = 20000
		mattack = 20000
		mdefence = 20000
		mreiatsu = 20000
		defence = 20000
		reiatsu = 20000
		hostile=1
		killable=1
		healthwas = 44000000
		mrei = 200000
		rei=200000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		race="Rawr NPC2"
		armorpassive=20
		rundelay=0
		name="Stinox"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Stinox/stinox00
			src.overlays += /obj/Stinox/stinox01
			src.overlays += /obj/Stinox/stinox10
			src.overlays += /obj/Stinox/stinox11
			src.oldspot = src.loc
			expgain=rand(33000000,39000000)
			..()
	Swamp_thing2
		is_dnpc=4
		legit=0
		enemy = 1
		agrange=17
		level=1000
		delay=0
		mhealth = 44000000

		health = 440000
		attack = 20000
		mattack = 20000
		mdefence = 20000
		mreiatsu = 20000
		defence = 20000
		reiatsu = 20000
		hostile=1
		killable=1
		healthwas = 44000000
		mrei = 200000
		rei=200000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		race="Rawr NPC2"
		armorpassive=20
		rundelay=0
		name="Swampy"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/SwampMonster/Swamp1
			src.overlays += /obj/SwampMonster/Swamp2
			src.overlays += /obj/SwampMonster/Swamp3
			src.overlays += /obj/SwampMonster/Swamp4
			src.oldspot = src.loc
			expgain=rand(33000000,39000000)
			..()
	Green_Adj2
		is_dnpc=5
		legit=0
		enemy = 1
		agrange=17
		level=1000
		delay=0
		mhealth = 44000000

		health = 440000
		attack = 20000
		mattack = 20000
		mdefence = 20000
		mreiatsu = 20000
		defence = 20000
		reiatsu = 20000
		hostile=1
		killable=1
		healthwas = 44000000
		mrei = 200000
		rei=200000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		race="Hollow NPC2"
		armorpassive=20
		rundelay=0
		name="Green Adjucha"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Green_Adj/adj00
			src.overlays += /obj/Green_Adj/adj10
			src.overlays += /obj/Green_Adj/adj20
			src.overlays += /obj/Green_Adj/adj01
			src.overlays += /obj/Green_Adj/adj11
			src.overlays += /obj/Green_Adj/adj21
			src.overlays += /obj/Green_Adj/adj02
			src.overlays += /obj/Green_Adj/adj12
			src.overlays += /obj/Green_Adj/adj22
			src.overlays += /obj/Green_Adj/adj03
			src.overlays += /obj/Green_Adj/adj13
			src.overlays += /obj/Green_Adj/adj23
			src.overlays += /obj/Green_Adj/adj04
			src.overlays += /obj/Green_Adj/adj14
			src.overlays += /obj/Green_Adj/adj24
			src.oldspot = src.loc
			expgain=rand(33000000,39000000)
			..()
	Demon_Adj2
		is_dnpc=6
		legit=0
		enemy = 1
		agrange=17
		level=1000
		delay=0
		mhealth = 44000000

		health = 44000000
		attack = 20000
		mattack = 20000
		mdefence = 20000
		mreiatsu = 20000
		defence = 20000
		reiatsu = 20000
		hostile=1
		killable=1
		healthwas = 440000000
		mrei = 200000
		rei=200000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		race="Hollow NPC2"
		armorpassive=20
		rundelay=0
		name="Green Adjucha"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Demon_Adj/bottomleft
			src.overlays += /obj/Demon_Adj/bottomright
			src.overlays += /obj/Demon_Adj/topleft
			src.overlays += /obj/Demon_Adj/topright
			src.oldspot = src.loc
			expgain=rand(33000000,39000000)
			..()
	Yammy2
		enemy = 1
		is_dnpc=0
		agrange=22
		level=12500
		delay=0
		mhealth = 999999999
		legit=1
		health = 999999999
		attack = 500000
		mattack = 500000
		mdefence = 900000
		mreiatsu = 200000
		defence = 900000
		reiatsu = 200000
		hostile=1
		killable=1
		healthwas = 999999999
		mrei = 2000000
		rei=2000000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		swordon=1
		ressurection=1
		race="Yammy Boss2"
		ressurectiontype="Yammy"
		wound=0
		armorpassive=20
		rundelay=2
		name="Yammy"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays+=/obj/releases/YammyRessIcon/yam00
			src.overlays+=/obj/releases/YammyRessIcon/yam01
			src.overlays+=/obj/releases/YammyRessIcon/yam02
			src.overlays+=/obj/releases/YammyRessIcon/yam03
			src.overlays+=/obj/releases/YammyRessIcon/yam04
			src.overlays+=/obj/releases/YammyRessIcon/yam05
			src.overlays+=/obj/releases/YammyRessIcon/yam10
			src.overlays+=/obj/releases/YammyRessIcon/yam11
			src.overlays+=/obj/releases/YammyRessIcon/yam12
			src.overlays+=/obj/releases/YammyRessIcon/yam13
			src.overlays+=/obj/releases/YammyRessIcon/yam14
			src.overlays+=/obj/releases/YammyRessIcon/yam15
			src.overlays+=/obj/releases/YammyRessIcon/yam20
			src.overlays+=/obj/releases/YammyRessIcon/yam21
			src.overlays+=/obj/releases/YammyRessIcon/yam22
			src.overlays+=/obj/releases/YammyRessIcon/yam23
			src.overlays+=/obj/releases/YammyRessIcon/yam24
			src.overlays+=/obj/releases/YammyRessIcon/yam25
			src.overlays+=/obj/releases/YammyRessIcon/yam30
			src.overlays+=/obj/releases/YammyRessIcon/yam31
			src.overlays+=/obj/releases/YammyRessIcon/yam32
			src.overlays+=/obj/releases/YammyRessIcon/yam33
			src.overlays+=/obj/releases/YammyRessIcon/yam34
			src.overlays+=/obj/releases/YammyRessIcon/yam35
			src.overlays+=/obj/releases/YammyRessIcon/yam40
			src.overlays+=/obj/releases/YammyRessIcon/yam41
			src.overlays+=/obj/releases/YammyRessIcon/yam42
			src.overlays+=/obj/releases/YammyRessIcon/yam43
			src.overlays+=/obj/releases/YammyRessIcon/yam44
			src.overlays+=/obj/releases/YammyRessIcon/yam45
			src.overlays+=/obj/releases/YammyRessIcon/yam50
			src.overlays+=/obj/releases/YammyRessIcon/yam51
			src.overlays+=/obj/releases/YammyRessIcon/yam52
			src.overlays+=/obj/releases/YammyRessIcon/yam53
			src.overlays+=/obj/releases/YammyRessIcon/yam54
			src.overlays+=/obj/releases/YammyRessIcon/yam55
			src.oldspot = src.loc
			expgain=rand(400000000,500000000)
	Dark_Pheonix2
		enemy = 1
		is_dnpc=0
		agrange=22
		level=12500
		delay=0
		mhealth = 999999999
		legit=1
		health = 999999999
		attack = 400000
		mattack = 400000
		mdefence = 900000
		mreiatsu = 200000
		defence = 900000
		reiatsu = 200000
		hostile=1
		killable=1
		healthwas = 999999999
		mrei = 2000000
		rei=2000000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		swordon=1
		hasabankai=1
		hasashikai=1
		Tnpccaptain=1
		race="Dark Pheonix2"
		stype="Yammamoto"
		swordcall="Let the Dark Fire Consume your soul!"
		swordname="Dark Hyosuke"
		wound=0
		armorpassive=20
		rundelay=0
		name="Dark Pheonix"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Dark_Pheonix/dp00
			src.overlays += /obj/Dark_Pheonix/dp01
			src.overlays += /obj/Dark_Pheonix/dp02
			src.overlays += /obj/Dark_Pheonix/dp10
			src.overlays += /obj/Dark_Pheonix/dp11
			src.overlays += /obj/Dark_Pheonix/dp12
			src.overlays += /obj/Dark_Pheonix/dp20
			src.overlays += /obj/Dark_Pheonix/dp21
			src.overlays += /obj/Dark_Pheonix/dp22
			src.oldspot = src.loc
			expgain=rand(400000000,500000000)
			..()
	Fire_Demon2
		enemy = 1
		is_dnpc=0
		agrange=22
		level=12500
		delay=0
		mhealth = 999999999
		legit=1
		health = 999999999
		attack = 500000
		mattack = 500000
		mdefence = 900000
		mreiatsu = 200000
		defence = 900000
		reiatsu = 200000
		hostile=1
		killable=1
		healthwas = 999999999
		mrei = 2000000
		rei=2000000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		swordon=1
		hasabankai=1
		hasashikai=1
		Tnpccaptain=1
		race="Fire Demon2"
		stype="Yammamoto"
		swordcall="I will burn everything to ash!"
		swordname="Inferno"
		wound=0
		armorpassive=20
		rundelay=0
		name="Fire Demon"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Fire_Demon/fd00
			src.overlays += /obj/Fire_Demon/fd01
			src.overlays += /obj/Fire_Demon/fd02
			src.overlays += /obj/Fire_Demon/fd10
			src.overlays += /obj/Fire_Demon/fd11
			src.overlays += /obj/Fire_Demon/fd12
			src.oldspot = src.loc
			expgain=rand(400000000,500000000)
			..()

mob
	Red_Demon3
		is_dnpc=1
		legit=0
		enemy = 1
		agrange=17
		level=1000
		delay=0
		mhealth = 44000000

		health = 44000000
		attack = 20000
		mattack = 20000
		mdefence = 20000
		mreiatsu = 20000
		defence = 20000
		reiatsu = 20000
		hostile=1
		killable=1
		healthwas = 44000000
		mrei = 200000
		rei=200000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		race="Demon NPC3"
		armorpassive=20
		rundelay=0
		name="Red Demon"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Red_Demon/top
			src.overlays += /obj/Red_Demon/bottom
			src.oldspot = src.loc
			expgain=rand(33000000,39000000)
			..()
	Blue_Demon3
		is_dnpc=2
		legit=0
		enemy = 1
		agrange=17
		level=1000
		delay=0
		mhealth = 44000000

		health = 440000
		attack = 20000
		mattack = 20000
		mdefence = 20000
		mreiatsu = 20000
		defence = 20000
		reiatsu = 20000
		hostile=1
		killable=1
		healthwas = 44000000
		mrei = 200000
		rei=200000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		race="Demon NPC3"
		armorpassive=20
		rundelay=0
		name="Blue Demon"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Blue_Demon/botleft
			src.overlays += /obj/Blue_Demon/botright
			src.overlays += /obj/Blue_Demon/topleft
			src.overlays += /obj/Blue_Demon/topright
			src.oldspot = src.loc
			expgain=rand(33000000,39000000)
			..()
	Stinox3
		is_dnpc=3
		legit=0
		enemy = 1
		agrange=17
		level=1000
		delay=0
		mhealth = 44000000

		health = 440000
		attack = 20000
		mattack = 20000
		mdefence = 20000
		mreiatsu = 20000
		defence = 20000
		reiatsu = 20000
		hostile=1
		killable=1
		healthwas = 44000000
		mrei = 200000
		rei=200000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		race="Rawr NPC3"
		armorpassive=20
		rundelay=0
		name="Stinox"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Stinox/stinox00
			src.overlays += /obj/Stinox/stinox01
			src.overlays += /obj/Stinox/stinox10
			src.overlays += /obj/Stinox/stinox11
			src.oldspot = src.loc
			expgain=rand(33000000,39000000)
			..()
	Swamp_thing3
		is_dnpc=4
		legit=0
		enemy = 1
		agrange=17
		level=1000
		delay=0
		mhealth = 44000000

		health = 440000
		attack = 20000
		mattack = 20000
		mdefence = 20000
		mreiatsu = 20000
		defence = 20000
		reiatsu = 20000
		hostile=1
		killable=1
		healthwas = 44000000
		mrei = 200000
		rei=200000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		race="Rawr NPC3"
		armorpassive=20
		rundelay=0
		name="Swampy"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/SwampMonster/Swamp1
			src.overlays += /obj/SwampMonster/Swamp2
			src.overlays += /obj/SwampMonster/Swamp3
			src.overlays += /obj/SwampMonster/Swamp4
			src.oldspot = src.loc
			expgain=rand(33000000,39000000)
			..()
	Green_Adj3
		is_dnpc=5
		legit=0
		enemy = 1
		agrange=17
		level=1000
		delay=0
		mhealth = 44000000

		health = 440000
		attack = 20000
		mattack = 20000
		mdefence = 20000
		mreiatsu = 20000
		defence = 20000
		reiatsu = 20000
		hostile=1
		killable=1
		healthwas = 44000000
		mrei = 200000
		rei=200000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		race="Hollow NPC3"
		armorpassive=20
		rundelay=0
		name="Green Adjucha"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Green_Adj/adj00
			src.overlays += /obj/Green_Adj/adj10
			src.overlays += /obj/Green_Adj/adj20
			src.overlays += /obj/Green_Adj/adj01
			src.overlays += /obj/Green_Adj/adj11
			src.overlays += /obj/Green_Adj/adj21
			src.overlays += /obj/Green_Adj/adj02
			src.overlays += /obj/Green_Adj/adj12
			src.overlays += /obj/Green_Adj/adj22
			src.overlays += /obj/Green_Adj/adj03
			src.overlays += /obj/Green_Adj/adj13
			src.overlays += /obj/Green_Adj/adj23
			src.overlays += /obj/Green_Adj/adj04
			src.overlays += /obj/Green_Adj/adj14
			src.overlays += /obj/Green_Adj/adj24
			src.oldspot = src.loc
			expgain=rand(33000000,39000000)
			..()
	Demon_Adj3
		is_dnpc=6
		legit=0
		enemy = 1
		agrange=17
		level=1000
		delay=0
		mhealth = 44000000

		health = 44000000
		attack = 20000
		mattack = 20000
		mdefence = 20000
		mreiatsu = 20000
		defence = 20000
		reiatsu = 20000
		hostile=1
		killable=1
		healthwas = 440000000
		mrei = 200000
		rei=200000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		race="Hollow NPC3"
		armorpassive=20
		rundelay=0
		name="Green Adjucha"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Demon_Adj/bottomleft
			src.overlays += /obj/Demon_Adj/bottomright
			src.overlays += /obj/Demon_Adj/topleft
			src.overlays += /obj/Demon_Adj/topright
			src.oldspot = src.loc
			expgain=rand(33000000,39000000)
			..()
	Yammy3
		enemy = 1
		is_dnpc=0
		agrange=22
		level=12500
		delay=0
		mhealth = 999999999
		legit=1
		health = 999999999
		attack = 500000
		mattack = 500000
		mdefence = 900000
		mreiatsu = 200000
		defence = 900000
		reiatsu = 200000
		hostile=1
		killable=1
		healthwas = 999999999
		mrei = 2000000
		rei=2000000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		swordon=1
		ressurection=1
		race="Yammy Boss3"
		ressurectiontype="Yammy"
		wound=0
		armorpassive=20
		rundelay=2
		name="Yammy"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays+=/obj/releases/YammyRessIcon/yam00
			src.overlays+=/obj/releases/YammyRessIcon/yam01
			src.overlays+=/obj/releases/YammyRessIcon/yam02
			src.overlays+=/obj/releases/YammyRessIcon/yam03
			src.overlays+=/obj/releases/YammyRessIcon/yam04
			src.overlays+=/obj/releases/YammyRessIcon/yam05
			src.overlays+=/obj/releases/YammyRessIcon/yam10
			src.overlays+=/obj/releases/YammyRessIcon/yam11
			src.overlays+=/obj/releases/YammyRessIcon/yam12
			src.overlays+=/obj/releases/YammyRessIcon/yam13
			src.overlays+=/obj/releases/YammyRessIcon/yam14
			src.overlays+=/obj/releases/YammyRessIcon/yam15
			src.overlays+=/obj/releases/YammyRessIcon/yam20
			src.overlays+=/obj/releases/YammyRessIcon/yam21
			src.overlays+=/obj/releases/YammyRessIcon/yam22
			src.overlays+=/obj/releases/YammyRessIcon/yam23
			src.overlays+=/obj/releases/YammyRessIcon/yam24
			src.overlays+=/obj/releases/YammyRessIcon/yam25
			src.overlays+=/obj/releases/YammyRessIcon/yam30
			src.overlays+=/obj/releases/YammyRessIcon/yam31
			src.overlays+=/obj/releases/YammyRessIcon/yam32
			src.overlays+=/obj/releases/YammyRessIcon/yam33
			src.overlays+=/obj/releases/YammyRessIcon/yam34
			src.overlays+=/obj/releases/YammyRessIcon/yam35
			src.overlays+=/obj/releases/YammyRessIcon/yam40
			src.overlays+=/obj/releases/YammyRessIcon/yam41
			src.overlays+=/obj/releases/YammyRessIcon/yam42
			src.overlays+=/obj/releases/YammyRessIcon/yam43
			src.overlays+=/obj/releases/YammyRessIcon/yam44
			src.overlays+=/obj/releases/YammyRessIcon/yam45
			src.overlays+=/obj/releases/YammyRessIcon/yam50
			src.overlays+=/obj/releases/YammyRessIcon/yam51
			src.overlays+=/obj/releases/YammyRessIcon/yam52
			src.overlays+=/obj/releases/YammyRessIcon/yam53
			src.overlays+=/obj/releases/YammyRessIcon/yam54
			src.overlays+=/obj/releases/YammyRessIcon/yam55
			src.oldspot = src.loc
			expgain=rand(400000000,500000000)
	Dark_Pheonix3
		enemy = 1
		is_dnpc=0
		agrange=22
		level=12500
		delay=0
		mhealth = 999999999
		legit=1
		health = 999999999
		attack = 400000
		mattack = 400000
		mdefence = 900000
		mreiatsu = 200000
		defence = 900000
		reiatsu = 200000
		hostile=1
		killable=1
		healthwas = 999999999
		mrei = 2000000
		rei=2000000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		swordon=1
		hasabankai=1
		hasashikai=1
		Tnpccaptain=1
		race="Dark Pheonix3"
		stype="Yammamoto"
		swordcall="Let the Dark Fire Consume your soul!"
		swordname="Dark Hyosuke"
		wound=0
		armorpassive=20
		rundelay=0
		name="Dark Pheonix"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Dark_Pheonix/dp00
			src.overlays += /obj/Dark_Pheonix/dp01
			src.overlays += /obj/Dark_Pheonix/dp02
			src.overlays += /obj/Dark_Pheonix/dp10
			src.overlays += /obj/Dark_Pheonix/dp11
			src.overlays += /obj/Dark_Pheonix/dp12
			src.overlays += /obj/Dark_Pheonix/dp20
			src.overlays += /obj/Dark_Pheonix/dp21
			src.overlays += /obj/Dark_Pheonix/dp22
			src.oldspot = src.loc
			expgain=rand(400000000,500000000)
			..()
	Fire_Demon3
		enemy = 1
		is_dnpc=0
		agrange=22
		level=12500
		delay=0
		mhealth = 340000000
		legit=1
		health = 340000000
		attack = 200000
		mattack = 200000
		mdefence = 200000
		mreiatsu = 200000
		defence = 200000
		reiatsu = 200000
		hostile=1
		killable=1
		healthwas = 340000000
		mrei = 2000000
		rei=2000000
		instinct=5
		quickflash=5
		berserk=5
		boneharden=20
		criticalhits=5
		headpassive=5
		bodypassive=5
		armpassive=5
		legpassive=5
		swordon=1
		hasabankai=1
		hasashikai=1
		Tnpccaptain=1
		race="Fire Demon3"
		stype="Yammamoto"
		swordcall="I will burn everything to ash!"
		swordname="Inferno"
		wound=0
		armorpassive=20
		rundelay=0
		name="Fire Demon"
		spawntime=50 MINUTES
		New()
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			src.overlays += /obj/Fire_Demon/fd00
			src.overlays += /obj/Fire_Demon/fd01
			src.overlays += /obj/Fire_Demon/fd02
			src.overlays += /obj/Fire_Demon/fd10
			src.overlays += /obj/Fire_Demon/fd11
			src.overlays += /obj/Fire_Demon/fd12
			src.oldspot = src.loc
			expgain=rand(400000000,500000000)
			..()

//-------------------------------npcs overlay---------------------------
obj
	Heal_Aura
		icon='Icons/AOE heal.dmi'
		layer=68
		aoe00
			icon_state="0,0"
			pixel_x=-44
			pixel_y=-32
		aoe10
			icon_state="1,0"
			pixel_x=-12
			pixel_y=-21
		aoe20
			icon_state="2,0"
			pixel_x=20
			pixel_y=-32
		aoe30
			icon_state="3,0"
			pixel_x=52
			pixel_y=-32
		aoe01
			icon_state="0,1"
			pixel_x=-44
			//pixel_y=-32
		aoe11
			icon_state="1,1"
			pixel_x=-12
			//pixel_y=-32
		aoe21
			icon_state="2,1"
			pixel_x=20
			//pixel_y=-32
		aoe31
			icon_state="3,1"
			pixel_x=52
			//pixel_y=-32
		aoe02
			icon_state="0,2"
			pixel_x=-44
			pixel_y=32
		aoe12
			icon_state="1,2"
			pixel_x=-12
			pixel_y=32
		aoe22
			icon_state="2,2"
			pixel_x=20
			pixel_y=32
		aoe32
			icon_state="3,2"
			pixel_x=52
			pixel_y=32
		aoe03
			icon_state="0,3"
			pixel_x=-44
			pixel_y=64
		aoe13
			icon_state="1,3"
			pixel_x=-12
			pixel_y=64
		aoe23
			icon_state="2,3"
			pixel_x=20
			pixel_y=64
		aoe33
			icon_state="3,3"
			pixel_x=52
			pixel_y=64

	Heal_Overlay
		layer=69
		icon='Icons/healoverlay.dmi'
		bl
			icon_state="0,0"
			pixel_x=-12
			pixel_y=-20
		br
			icon_state="1,0"
			pixel_x=20
			pixel_y=-20
		tl
			icon_state="0,1"
			pixel_x=-12
			pixel_y=12
		tr
			icon_state="1,1"
			pixel_x=20
			pixel_y=12
	Red_Demon
		layer=MOB_LAYER+5
		bottom
			icon='Icons/dYokai21.dmi'
		top
			icon='Icons/dYokai22.dmi'
			pixel_y=32
	Blue_Demon
		layer=MOB_LAYER+5
		botleft
			icon='Icons/dYokai41.dmi'
			pixel_x=-16
		botright
			icon='Icons/dYokai42.dmi'
			pixel_x=16
		topleft
			icon='Icons/dYokai43.dmi'
			pixel_x=-16
			pixel_y=32
		topright
			icon='Icons/dYokai44.dmi'
			pixel_x=16
			pixel_y=32
	Green_Adj
		layer=MOB_LAYER+5
		adj00
			icon='Icons/adj00.dmi'
			pixel_x=-32
			pixel_y=-16
		adj10
			icon='Icons/adj10.dmi'
			pixel_y=-16
		adj20
			icon='Icons/adj20.dmi'
			pixel_x=32
			pixel_y=-16
		adj01
			icon='Icons/adj01.dmi'
			pixel_x=-32
			pixel_y=16
		adj11
			icon='Icons/adj11.dmi'
			pixel_y=16
		adj21
			icon='Icons/adj21.dmi'
			pixel_x=32
			pixel_y=16
		adj02
			icon='Icons/adj02.dmi'
			pixel_x=-32
			pixel_y=48
		adj12
			icon='Icons/adj12.dmi'
			pixel_y=48
		adj22
			icon='Icons/adj22.dmi'
			pixel_x=32
			pixel_y=48
		adj03
			icon='Icons/adj03.dmi'
			pixel_x=-32
			pixel_y=80
		adj13
			icon='Icons/adj13.dmi'
			pixel_y=80
		adj23
			icon='Icons/adj23.dmi'
			pixel_x=32
			pixel_y=80
		adj04
			icon='Icons/adj04.dmi'
			pixel_x=-32
			pixel_y=112
		adj14
			icon='Icons/adj14.dmi'
			pixel_y=112
		adj24
			icon='Icons/adj24.dmi'
			pixel_x=32
			pixel_y=112
	Demon_Adj
		layer=MOB_LAYER+5
		bottomleft
			icon = 'Icons/dadj00.dmi'
			pixel_x=-16
		bottomright
			icon = 'Icons/dadj10.dmi'
			pixel_x=16
		topleft
			icon = 'Icons/dadj01.dmi'
			pixel_y=32
			pixel_x=-16
		topright
			icon = 'Icons/dadj11.dmi'
			pixel_y =32
			pixel_x=16
	Fire_Demon
		layer=MOB_LAYER+5
		fd00
			icon = 'Icons/fd00.dmi'
			pixel_x=-16
			pixel_y=-16
		fd10
			icon = 'Icons/fd10.dmi'
			pixel_x=16
			pixel_y=-16
		fd01
			icon = 'Icons/fd01.dmi'
			pixel_x=-16
			pixel_y=16
		fd11
			icon = 'Icons/fd11.dmi'
			pixel_x=16
			pixel_y=16
		fd02
			icon = 'Icons/fd02.dmi'
			pixel_x=-16
			pixel_y=48
		fd12
			icon = 'Icons/fd12.dmi'
			pixel_x=16
			pixel_y=48
	Dark_Pheonix
		layer=MOB_LAYER+5
		dp00
			icon = 'Icons/dp00.dmi'
			pixel_x=-32
			pixel_y=-16
		dp10
			icon = 'Icons/dp10.dmi'
			pixel_y=-16
		dp20
			icon = 'Icons/dp20.dmi'
			pixel_x=32
			pixel_y=-16
		dp01
			icon = 'Icons/dp01.dmi'
			pixel_x=-32
			pixel_y=16
		dp11
			icon = 'Icons/dp11.dmi'
			pixel_y=16
		dp21
			icon = 'Icons/dp21.dmi'
			pixel_x=32
			pixel_y=16
		dp02
			icon = 'Icons/dp02.dmi'
			pixel_x=-32
			pixel_y=48
		dp12
			icon = 'Icons/dp12.dmi'
			pixel_y=48
		dp22
			icon = 'Icons/dp22.dmi'
			pixel_x=32
			pixel_y=48
	Stinox
		layer=MOB_LAYER+5
		stinox00
			icon = 'Icons/stinox00.dmi'
			pixel_x=-16
		stinox10
			icon = 'Icons/stinox10.dmi'
			pixel_x=16
		stinox01
			icon = 'Icons/stinox01.dmi'
			pixel_x=-16
			pixel_y=32
		stinox11
			icon = 'Icons/stinox11.dmi'
			pixel_x=16
			pixel_y=32




