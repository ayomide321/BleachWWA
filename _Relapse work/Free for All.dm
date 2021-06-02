


mob
	var/tmp
		freeforall
		inffa = 0




var
	free_for_all
		free_for_all

	hostingffa = 0

mob
	player
		verb
			Join_FFA()
				set category = "Event"
				if(!free_for_all) return
				free_for_all.Join(src)
				src.freeforall = 1
				src.inffa = 1


			Leave_FFA()
				set category = "Event"
				if(!free_for_all) return
				free_for_all.Leave(src)
				src.freeforall = 0
				src.inffa = 0





free_for_all
	var
		status

		list
			participants = new




	proc
	//	Announce(text)
		//	if(!istext(text))
		//		return

		//	world << "<font color =#FFA500>[text]</font>"


		Join(mob/user)
			if(user in participants || status != "Join")
				return

			user << "You joined the FFA event."

			if(user.shopping)
				user.shopping = 0
				user.see_invisible = 0

			participants += user
			user.inffa = 1
			user.RemoveDonorStats()
			online_admins <<"[user] joined FFA."
			user.lost=1



		Leave(mob/user)
			if(user in participants)
				participants -= user

				user << "You left the FFA event."
				online_admins <<"[user] left FFA."

				Respawn(user)
				user.inffa = 0
				user.lost=0
				user.GiveDonorStats()



		Respawn(mob/user)
			if(user.client)
				if(user in participants)
					participants -= user

				user.x=15
				user.y=190
				user.z=1




		Check(mob/player)
			if(player in participants)
				return 1
			return 0


		healPlayer(mob/user)
			user.wound = 0
			user.health = user.mhealth
			user.rei = user.mrei


		Countdown(mob/user)
			if(!user.client)return

			spawn()
				user << "3..."
				sleep 10
				user << "2.."
				sleep 10
				user << "1..."
				sleep 10
				user << "GO!"
				user.stunned = 0
				user.frozen = 0
				user.safe=0
			//	user.RemoveDonorStats()
				healPlayer(user)


		SpawnPlayers()
			if(participants.len)
				world << "<b><font color=red>The Free For All event is starting!</font></b>"

				for(var/mob/m in participants)
					m.loc = locate_tag("newtdm_waiting")
					m << "The countdown will begin shortly, be patient."
				//	m.stunned = 500
					m.safe=1
					healPlayer(m)
					sleep(-1)

				sleep(30)

				for(var/mob/b in participants)
					spawn()
						Countdown(b)

				spawn()
					while(participants.len > 1)
						sleep(50)

					if(participants.len == 1)
						for(var/mob/j in participants)
							Winner(j)
							j.inffa = 0

					End()



		Winner(mob/winning)
			if(winning.client)
				world << "<b><font color=red>[winning] has won the FFA event!</font></b>"
				winning<<"Congratulations on winning Free for All!"
				winning<<"Gained 500000 Dollars"
				winning<<"+30 Event Points"
				winning.GainExp(winning.mexp)
				winning.Level_Up()
				winning.GainExp(winning.mexp)
				winning.Level_Up()
				winning.GainExp(winning.mexp)
				winning.Level_Up()
				winning.GainExp(winning.mexp)
				winning.Level_Up()
				winning.GainExp(winning.mexp)
				winning.Level_Up()
				winning.GainExp(winning.mexp)
				winning.Level_Up()
				winning.GainExp(winning.mexp)
				winning.Level_Up()
				winning.money += 500000
				winning.eventpoints += 30
				winning.aftereventbuffs()
				winning.inffa = 0
				winning.GiveDonorStats()
				winning.lost=0
				if(winning) Respawn(winning)
			return 1




		Start()
			world<<"<b><font color=red>An FFA event has been started!</font></b>"

			status = "Join"

			participants = new

			hostingffa = 1

			for(var/mob/player/x in All_Clients())
				spawn()
					world<<"<b><font color=red>Free for All Event has been started! You have 30 seconds to join!</font></b>"
					if(x.client)
						if(!free_for_all||!status)
							free_for_all.Join(x)
							return

			spawn(30 SECONDS)
				world<<"<b><font color=red>FFA registrations are now closed.</font></b>"

				status = 0

				spawn(50)
					if(!participants.len || participants.len < 2)
						return

					SpawnPlayers()



		End()
			status = 0

			for(var/mob/M in participants)
				Respawn(M)
				M.inffa = 0
				M.lost=0

			participants = new

			hostingffa = 0
			eventon = 0

			world<<"<b><font color=red>The Free For All is now over.</font></b>"
			del free_for_all





mob
	Owner
		verb
			Start_FFA_Event()
				set category = "Owner"
				set name = "Host Free for All"

				del free_for_all

				free_for_all = new
				free_for_all.Start()

			End_FFA_Event()
				set category = "Owner"
				set name = "End Free for All"

				if(free_for_all)
					free_for_all.End()