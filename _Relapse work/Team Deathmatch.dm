mob
	player
		verb
			Join_TDM()
				set category = "Event"
				if(!team_deathmatch) return
				team_deathmatch.Join(src)


			Leave_TDM()
				set category = "Event"
				if(!team_deathmatch) return
				team_deathmatch.Leave(src)

	Owner
		verb
			Host_TDM()
				set category = "Owner"
				set name = "Host TDM"
				del team_deathmatch

				team_deathmatch = new
				team_deathmatch.TDMInitiate()

			End_TDM()
				set category = "Owner"
				set name = "End TDM"
				if(team_deathmatch)
					team_deathmatch.End()







var
	team_deathmatch
		team_deathmatch


	tdmstarted = 0

mob/var/tmp/intdm = 0

team_deathmatch
	var
		list
			white_team = new
			orig_white_team = new

			black_team = new
			orig_black_team = new

		status



	proc
	//	Announce(announcement)
		//	if(istext(announcement)) world<<"<font size = +1>[announcement]</font>"


		Join(mob/player)
			if((player in white_team) || (player in black_team))return
			if(status != "Join")
				player << "Team Deathmatch isn't being hosted right now"
				return

			if(player.intdm)
				player << "You already joined."
				return

			if(white_team.len >= black_team.len)
				black_team += player
				online_admins<<"[player] Joined the Black Team."

			else if(black_team.len > white_team.len)
				white_team += player
				online_admins<<"[player] Joined the White Team."

		//	player.loc = locate_tag("tdm_waiting")
			player.Load_Overlays()
			player<<"You joined Team Deathmatch."
			player.intdm = 1
			player.RemoveDonorStats()
			player.lost=1

			if(player.shopping)
				player.shopping = 0
			//	player.canmove = 1
				player.see_invisible = 0



		Leave(mob/player)
			if(player in white_team)
				white_team -= player
			else if(player in black_team)
				black_team -= player
			else
				return

			player<<"You left Team Deathmatch."
		//	online_admins<<"[player] left Team Deathmatch."
			player.intdm = 0
			player.GiveDonorStats()
			player.lost=0

			Respawn(player)


		TDMInitiate()
			var
				time = 30 SECONDS

			world<<"<b><font color=red>A Team Deathmatch Event has been started! You have 30 seconds to join!</font></b>"

			status = "Join"

			white_team = new
			black_team = new

			spawn(time)
				status = 0
				world<<"<b><font color=red>Team Deathmatch enlistment is over.</font></b>"

				if(!white_team.len || !black_team.len)
					for(var/list/List in list(white_team, black_team))
						for(var/mob/Mobile in List)
							Respawn(Mobile)
							del team_deathmatch
							Mobile.intdm = 0
							Mobile.lost=0
							world<<"<b><font color=red>Ending Team Deathmatch. Not enough players are in the event.</font></b>"
					return

				Start()



		End()
			status = 0

			for(var/list/List in list(white_team, black_team))
				for(var/mob/Mobile in List)
					Respawn(Mobile)
					Mobile.intdm = 0
					Mobile.lost=0

			world<<"<b><font color=red>Team Deathmatch is now over.</font></b>"

			white_team = new
			black_team = new

			del team_deathmatch



		Start()
			world<<"<b><font color=red>Team Deathmatch is starting...!</font></b>"

			orig_white_team = white_team.Copy()
			orig_black_team = black_team.Copy()

			sleep(50)

			tdmstarted = 1

			for(var/list/List in list(white_team, black_team))
				for(var/mob/m in List)
				//	m.RemoveDonorStats()
					if(m.inbankai) m.inbankai = 0
					if(m.inshikai) m.inshikai = 0
					Spawn(m)

			spawn()
				while(team_deathmatch && white_team.len>0 && black_team.len>0)
					sleep(50)

				if(!team_deathmatch)
					return

				if(white_team.len)
					world<<"<b><font color=red>The White team wins Team Deathmatch!</font></b>"
					WinningTeam("White")

				else if(black_team.len)
					world<<"<b><font color=red>The Black team wins Team Deathmatch!</font></b>"
					WinningTeam("Black")

				End()


		checkTeam(mob/player)
			if(player in white_team) return "White"
			if(player in black_team) return "Black"
			return null


		healPlayer(mob/player)
			player.wound = 0
			player.health = player.mhealth
			player.rei = player.mrei


		Spawn(mob/user)
			if(user in white_team)
				user.loc = locate_tag("tdm_white_team")
			//	user.stunned = 0
			//	user.frozen = 0
			//	user.canmove = 1
				healPlayer(user)

			else if(user in black_team)
				user.loc = locate_tag("tdm_black_team")
			//	user.stunned = 0
			//	user.frozen = 0
			//	user.canmove = 1
				healPlayer(user)

			user.Load_Overlays()
			user.safe=0



		Respawn(mob/user)
			if(user.client)
				if(user in white_team)
					white_team -= user
				if(user in black_team)
					black_team -= user


				user.x=15
				user.y=190
				user.z=1
				user.intdm = 0
				user.lost=0



		WinningTeam(winningteam)
			if(winningteam == "White")
				for(var/mob/winning in orig_white_team)
					winning<<"Congratulations on winning Team Deathmatch!"
					winning<<"Gained 150000 Dollars"
					winning<<"+30 Event Points"
					winning.GainExp(winning.mexp * 2)
					winning.money += 150000
					winning.eventpoints += 30
					winning.donor_points += 5
					if(winning.client) Respawn(winning)
					winning.intdm = 0
					winning.lost=0
					winning.Load_Overlays()

			else if(winningteam == "Black")
				for(var/mob/winning in orig_black_team)
					winning<<"Congratulations on winning Team Deathmatch!"
					winning<<"Gained 350000 Dollars"
					winning<<"+30 Event Points"
					winning.GainExp(winning.mexp/2)
					winning.money += 350000
					winning.eventpoints += 30
					winning.donor_points += 5
					if(winning.client) Respawn(winning)
					winning.intdm = 0
					winning.lost=0
					winning.Load_Overlays()