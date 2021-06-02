var
	levelreqs=1500
	levelmin=50
	round=1
	lastround=0
mob
	var
		tmp/tourny = 0

var/tournament = 0




mob
	verb
		Enter_Tournament()
			set hidden=1
			if(tournament==0)
				usr<<"<font color=white><font face=times new roman><b><u>There is no Tournament!</font></b></u>"
				return
			if(usr.tourny == 1)
				usr<<"<font color=white><font face=times new roman><b><u>Your already in the Tournament!</font></b></u>"
				return
			else
				if(usr.level>levelreqs)
					usr<<"You are too high of a level to join"
					return
				if(usr.level<levelmin)
					usr<<"You are too weak of a level to join"
					return
				usr.CArena()
				tourneyentries+=usr
				usr.tourny=1
				usr.safe=1
				usr<<"<font color=white><font face=times new roman><b>You Joined the Tournament!</font></b>"
		Leave_Tournament()
			set hidden=1
			if(tournament==0)
				usr<<"<font color=white><font face=times new roman><b><u>There is no Tournament!</font></b></u>"
				return
			if(usr.tourny == 0)
				usr<<"<font color=white><font face=times new roman><b>Your not in the Tournament!</font></b>"
				return
			else
				usr.tourny=0
				usr.Respawn()
				usr<<"<font color=white><font face=times new roman><b><u>You Left the Tournament!</font></b></u>"
		Watch_Tournament()
			set hidden=1
			if(src.spectate==1)
				client.eye=client.mob
				src.spectate=0
				return
			var/list/li=new
			for(var/mob/player/x in All_Clients())
				if(x.tourny)
					li+=x
			var/mob/spec=input3(usr,"Who do you wish to spectate","Spectate", li)
			if(spec)
				usr.spectate=1
				usr.client.eye=spec
				client.perspective=EYE_PERSPECTIVE
				usr<<"<font size=+1>Spectating, Hit Space to return. (Only your vision has changed, your character is still in the same spot.)</font>"


mob/GM5
	verb
		Start_Next_Round()
			set category = "Tournament"
			set name = "Start Next Round"
			if(tournament)
				world.Torney_start()
			else
				src<<"There is no torney"
		Start_Tourny()
			set category = "Tournament"
			set name = "Start Tourny"
			if(tournament == 1)
				usr<<"<font color=white><font face=times new roman><b><u>There is already a Tournament being Held!</font></b></u>"
				return
			else
				levelmin=input("You want to start a Tournament? What is The Min Level?")as num
				levelreqs=input("You want to start a Tournament? What is The Max Level?")as num
				world << "<center><font size=5><font color = green><font face=times new roman><b><center>[usr] has Started a Tournament!(You must be level [levelmin] - [levelreqs])<br><font size = 1><font face=times new roman>To Join please go to Tournament Tab and select Enter Tournament."
				tournament = 1
				tourneyentries=new
		Count_Tourney_Entries()
			set category = "Tournament"
			for(var/mob/player/M in All_Clients())
				if(M.tourny)
					world << "[M]"
		Stop_Tourny_Entries()
			set category = "Tournament"
			set name = "Stop Tournament Entry"
			if(tournament == 1)
				world << "<center><font size=2><font color = green><font face=times new roman><b><center>The Tournament Entry has now Ended."
				world << "<font size=1><font color = blue><font face=times new roman><b>The following People are in the Tournament"
				for(var/mob/player/M in All_Clients())
					if(M.tourny)
						world << "[M]"
					//world.Torney_start()
			else
				usr<<"<font color=white><font face=times new roman><b>There is no Tournament being Held!</font></b>"
				return
		End_Tourny()
			set category = "Tournament"
			set name = "End Tournament"
			if(tournament == 1)
				world <<"<center><font size=3><font color = white><font face=times new roman><b><center>The Tournament has Ended"
				tournament = 0
			else
				usr<<"<font color=white><font face=times new roman><b>There is no Tournament to End!</font></b>"
				return
world/proc
	Torney_start()
		//var/num_entrants = tourneyentries.len
		//StartArena()
		if(!tournament)return
		world<<"<font color = teal>{Tournament}: Starting round [round]!"
		HealTorney()
		var/roundon=0
		var/won_firstround[0]
		var/match_num = 0
		// First round -- run at least until the FOD is over to handle late entries
		while(tourneyentries.len >= 2)
			// Only run two-person matches while the FOD is running, a three-way shouldn't happen until the end.
			if(tourneyentries.len > 3 || tourneyentries.len == 2)
				var/mob/x1 = pick(tourneyentries)
				tourneyentries -= x1
				while(!x1 && tourneyentries.len)
					x1 = pick(tourneyentries)
					tourneyentries -= x1
				if(!x1) continue
				if(tourneyentries.len < 1)
					tourneyentries += x1
					continue
				var/mob/x2 = pick(tourneyentries)
				tourneyentries -= x2
				while(!x2 && tourneyentries.len)
					x2 = pick(tourneyentries)
					tourneyentries -= x2
				if(!x2)
					tourneyentries += x1
					continue

				Pick_1(x1)
				Pick_2(x2)
				Heal(x1)
				Heal(x2)
				world<<"<font color=green><b>{Tournament} Round [round], Match [++match_num]: [x1] VS [x2]!"
				sleep(70)
				StartFight()
				roundon=1
				while(roundon)
					sleep(50)
					if(!x1 || !x1.tourny || !x2 || !x2.tourny)
						roundon = 0

				if(x1 && x1.tourny)
					won_firstround += x1
					x1.tourny+=1
					x1.CArena()
					world<<"<font color=green><b>{Tournament} Round [round], Match [match_num]: [x1] wins!"
				if(x2 && x2.tourny)
					won_firstround += x2
					x2.tourny+=1
					x2.CArena()
					world<<"<font color=green><b>{Tournament} Round [round], Match [match_num]: [x2] wins!"

				sleep(20)
			else if(tourneyentries.len == 3)
				var/mob/x1 = pick(tourneyentries)
				tourneyentries -= x1
				while(!x1 && tourneyentries.len)
					x1 = pick(tourneyentries)
					tourneyentries -= x1
				if(!x1) continue
				if(tourneyentries.len < 2)
					tourneyentries += x1
					continue
				var/mob/x2 = pick(tourneyentries)
				tourneyentries -= x2
				while(!x2 && tourneyentries.len)
					x2 = pick(tourneyentries)
					tourneyentries -= x2
				if(!x2)
					tourneyentries += x1
					continue
				if(tourneyentries.len < 1)
					tourneyentries += x1
					tourneyentries += x2
					continue
				var/mob/x3 = pick(tourneyentries)
				tourneyentries -= x3
				while(!x3 && tourneyentries.len)
					x3 = pick(tourneyentries)
					tourneyentries -= x3
				if(!x3)
					tourneyentries += x1
					tourneyentries += x2
					continue

				Pick_1(x1)
				Pick_2(x2)
				Pick_3(x3)
				Heal(x1)
				Heal(x2)
				Heal(x3)
				world<<"<font color=green><b>{Tournament} Round [round], Match [++match_num]: [x1] VS [x2] VS [x3]!"
				sleep(70)
				StartFight()
				roundon=1
				while(roundon)
					sleep(50)
					var/fighting = 0
					if(x1 && x1.tourny)
						++fighting
					if(x2 && x2.tourny)
						++fighting
					if(x3 && x3.tourny)
						++fighting
					if(fighting < 2)
						roundon = 0

				if(x1 && x1.tourny)
					won_firstround += x1
					x1.tourny+=1
					x1.CArena()
					world<<"<font color=green><b>{Tournament} Round [round], Match [match_num]: [x1] wins!"
				if(x2 && x2.tourny)
					won_firstround += x2
					x2.CArena()
					x2.tourny+=1
					world<<"<font color=green><b>{Tournament} Round [round], Match [match_num]: [x2] wins!"
				if(x3 && x3.tourny)
					won_firstround += x3
					x3.tourny+=1
					x3.CArena()
					world<<"<font color=green><b>{Tournament} Round [round], Match [match_num]: [x3] wins!"

				sleep(20)
			else
				sleep(100)

		tourneyentries=new
		round+=1
		for(var/mob/player/Ms in All_Clients())
			if(Ms.tourny==round)
				tourneyentries+=Ms
				world<<"<font color=green><b>{Tournament}: [Ms] is advanced to round [round]!"
		if(tourneyentries.len==1)
			var/mob/M = pick(tourneyentries)
			round=1
			M.tourny=0
			tournament=0
			world<<"<font color=green><b>{Tournament}: [M] has won"
			world<<"<font color=green><b>{Tournament}: All the losers must use the Stuck verb when they are ready to leave"
			M.Reward()
			M.Respawn()
			return
proc
	Heal(mob/x)
		x.health=x.mhealth
		x.canattack=1
		x.canattacks=0
		x.controlled=0
		x.wound=0
		x.safe=0
		x.frozen=0
		x.firing=0
		x.rei=x.mrei
proc
	HealTorney()
		for(var/client/c)
			if(c.mob && c.mob.tourny)
				c.mob.health=c.mob.mhealth
				c.mob.wound=0
				c.mob.safe=0
				c.mob.firing=0
				c.mob.frozen=0
				c.mob.canattacks=0
				c.mob.canattack=1
				c.mob.controlled=0
				c.mob.rei=c.mob.mrei