var
	lastscroll=0
	list/tourneyentries=new
	hougyokureg=0
	hougyokucount=0
	list/hougyokuwinners=new
	hougyokuwatch=0
	FOD = 0
	tmp/hougyokuactive=0


mob
	Tournament
		verb
			Watch_Fight_Tournament()
				set category="Tournament"
				if(usr.spectate==1)
					client.eye=client.mob
					usr.spectate=0
					return
				var/list/li=new
				for(var/mob/x in All_Clients())
					if(x.tourny)
						li+=x
				var/mob/spec=input3(usr,"Who do you wish to spectate","Spectate", li)
				if(spec)
					if(spec.tourny)
						usr.spectate=1
						usr.client.eye=spec
						client.perspective=EYE_PERSPECTIVE
						usr<<"<font size=+1>Spectating, Hit Space to return. (Only your vision has changed, your character is still in the same spot.)</font>"
mob
	Hougyoku
		verb
			Leave_Pursuit()
				set category="Hougyoku"
				usr.cpursuit=0
				for(var/obj/items/RedHougyoku/X in usr.contents)
					del(X)
				for(var/obj/items/PurpleHougyoku/X in usr.contents)
					del(X)
				usr.loc=locate(117,192,1)
				winset(usr, "hougyoku_verb_leave", "parent=")
				if(!hashougyokuwatch) winset(usr, "hougyoku_menu", "parent=")
				usr.verbs-=/mob/Hougyoku/verb/Leave_Pursuit

			Join_Hougyoku()
				set category="Hougyoku"
				winset(usr, "hougyoku_verb_join", "parent=")
				if(!hashougyokuwatch) winset(usr, "hougyoku_menu", "parent=")
				usr.frozen=0
				usr.see_invisible=0
				usr.Join_Pursuit()
				usr.verbs-=/mob/Hougyoku/verb/Join_Hougyoku

			Watch_Fight_Hougyoku()
				set category="Hougyoku"
				var/list/li=new
				for(var/mob/x in All_Clients())
					if(x.cpursuit==5)
						li+=x
				var/mob/spec=input3(usr,"Who do you wish to spectate","Spectate", li)
				if(spec)
					if(spec.inarena)
						usr.spectate=1
						usr.client.eye=spec
						usr<<"<font size=+1>Spectating, Hit the Interact Button or Space to return. (Only your vision has changed, your character is still in the same spot.)</font>"


client/var/inputting
proc
	input3(client/x,y,z,az)//for lists of mobs
		if(x)
			var/list/tz=new/list()
			for(var/mob/o in az)
				tz+=o.name
			if(ismob(x))
				x = x:client
			while(x && x.inputting)
				sleep(1)
			if(!x) return
			x.inputting = 1
			var/answer=input(x, y, z) in tz
			if(x) x.inputting = 0
			for(var/mob/o in az)
				if(o.name==answer)
					return o
world/proc
	Auto_Hougyoku()
		if(hougyokuactive) return
		StartHougyoku()
		//wait 5 minutes
		hougyokucount=0
		hougyokureg=0//no more please
		sleep(100)
		HealHougyoku()
		for(var/client/c)
			if(c.mob && c.mob.cpursuit == 1)
				c<<"The objective of the Hougyoku Pursuit is simple. You start with either a Red or an Purple Hougyoku. When a player is knocked out they will drop a hougyoku. Pressing G will pick them up, collect both hougyokus and then enter the secret cave on the east side of town surrounded by grass. "
		Auto_FOD()

	Auto_FOD()
		StartFOD()
		world<<"<span class='hougyoku_pursuit'>{Hougyoku Pursuit}: Starting Hougyoku Pursuit!</span>"
		sleep(100)
		var/timer=150
		FOD=1
		spawn() Auto_Tournament()
		var/fod_running = 1
		while(fod_running && timer>0)
			timer--
			var/activeH=0
			var/activeE=0
			var/activeP=0
			for(var/client/C)
				var/mob/x = C.mob
				if(x && x.cpursuit==2)
					++activeP
			for(var/obj/items/I in world)
				if(I.loc && I.loc.z == 16)
					if(istype(I, /obj/items/RedHougyoku))
						++activeH
					else if(istype(I, /obj/items/PurpleHougyoku))
						++activeE
			for(var/client/C)
				if(C && C.mob)
					//if(!C.mob.cpursuit)
					C << "<span class='hougyoku_pursuit'>{Hougyoku Pursuit}: Players in pursuit: [activeP], Red Hougyokus in pursuit: [activeH], Purple Hougyokus in pursuit: [activeE]</span>"
					if(!(timer % 6))
						C << "<span class='hougyoku_pursuit'>{Hougyoku Pursuit}: Time remaining: [timer/6] minutes</span>"
			if(activeP<2 || activeH<1 ||activeE<1)
				fod_running=0

			sleep(100)
		world<<"<span class='hougyoku_pursuit'>{Hougyoku Pursuit}: Hougyoku Pursuit ended.</span>"
		//wait 20 seconds for stragglers
		sleep(200)
		EndFOD()

	Auto_Tournament()
		if(hougyokuwatch)
			world << "{Hougyoku - Tournament} Error: Multiple tournaments started"
			return
		var/num_entrants = tourneyentries.len
		while(num_entrants < 4)
			sleep(100)
			num_entrants = tourneyentries.len
		StartArena()
		world<<"<span class='hougyoku_pursuit'>{Hougyoku - Tournament}: Starting round one!</span>"
		HealHougyokuArena()
		var/roundon=0
		var/won_firstround[0]
		var/match_num = 0
		// First round -- run at least until the FOD is over to handle late entries
		while(FOD || tourneyentries.len >= 2)
			// Only run two-person matches while the FOD is running, a three-way shouldn't happen until the end.
			if((FOD && tourneyentries.len > 2) || (tourneyentries.len > 3 || tourneyentries.len == 2))
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
				world<<"<span class='hougyoku_pursuit'>{Hougyoku - Tournament} Round 1, Match [++match_num]: [x1] VS [x2]!</span>"
				sleep(70)
				StartFight()
				roundon=1
				while(roundon)
					sleep(50)
					if(!x1 || x1.cpursuit != 5 || !x2 || x2.cpursuit != 5)
						roundon = 0

				if(x1 && x1.cpursuit == 5)
					won_firstround += x1
					world<<"<span class='hougyoku_pursuit'>{Hougyoku - Tournament} Round 1, Match [match_num]: [x1] wins!</span>"
				if(x2 && x2.cpursuit == 5)
					won_firstround += x2
					world<<"<span class='hougyoku_pursuit'>{Hougyoku - Tournament} Round 1, Match [match_num]: [x2] wins!</span>"

				Declare()
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
				world<<"<span class='hougyoku_pursuit'>{Hougyoku - Tournament} Round 1, Match [++match_num]: [x1] VS [x2] VS [x3]!</span>"
				sleep(70)
				StartFight()
				roundon=1
				while(roundon)
					sleep(50)
					var/fighting = 0
					if(x1 && x1.cpursuit == 5)
						++fighting
					if(x2 && x2.cpursuit == 5)
						++fighting
					if(x3 && x3.cpursuit == 5)
						++fighting
					if(fighting < 2)
						roundon = 0

				if(x1 && x1.cpursuit == 5)
					won_firstround += x1
					world<<"<span class='hougyoku_pursuit'>{Hougyoku - Tournament} Round 1, Match [match_num]: [x1] wins!</span>"
				if(x2 && x2.cpursuit == 5)
					won_firstround += x2
					world<<"<span class='hougyoku_pursuit'>{Hougyoku - Tournament} Round 1, Match [match_num]: [x2] wins!</span>"
				if(x3 && x3.cpursuit == 5)
					won_firstround += x3
					world<<"<span class='hougyoku_pursuit'>{Hougyoku - Tournament} Round 1, Match [match_num]: [x3] wins!</span>"

				Declare()
				sleep(20)
			else
				sleep(100)

		if(tourneyentries.len)
			for(var/mob/M in tourneyentries)
				if(M)
					world<<"<span class='hougyoku_pursuit'>{Hougyoku - Tournament}: [M] is advanced to round two!</span>"
					won_firstround += M

		world<<"<span class='hougyoku_pursuit'>{Hougyoku - Tournament}: Starting round two!</span>"

		match_num = 0

		// Second round -- runs basically like before
		while(won_firstround.len >= 2)
			if(won_firstround.len > 3 || won_firstround.len == 2)
				var/mob/x1 = pick(won_firstround)
				won_firstround -= x1
				while(!x1 && won_firstround.len)
					x1 = pick(won_firstround)
					won_firstround -= x1
				if(!x1) continue
				if(won_firstround.len < 1)
					won_firstround += x1
					continue

				var/mob/x2 = pick(won_firstround)
				won_firstround -= x2
				while(!x2 && won_firstround.len)
					x2 = pick(won_firstround)
					won_firstround -= x2
				if(!x2)
					won_firstround += x1
					continue

				Pick_1(x1)
				Pick_2(x2)
				Heal(x1)
				Heal(x2)
				world<<"<span class='hougyoku_pursuit'>{Hougyoku - Tournament} Round 2, Match [++match_num]: [x1] VS [x2]!</span>"
				sleep(70)
				StartFight()
				roundon=1
				while(roundon)
					sleep(50)
					if(!x1 || x1.cpursuit != 5 || !x2 || x2.cpursuit != 5)
						roundon = 0

				if(x1 && x1.cpursuit == 5)
					MakeHougyoku(x1)
					world<<"<span class='hougyoku_pursuit'>{Hougyoku - Tournament} Round 2, Match [match_num]: [x1] wins!</span>"
				if(x2 && x2.cpursuit == 5)
					MakeHougyoku(x2)
					world<<"<span class='hougyoku_pursuit'>{Hougyoku - Tournament} Round 2, Match [match_num]: [x2] wins!</span>"

				Declare()
				sleep(20)

			else if(won_firstround.len == 3)
				var/mob/x1 = pick(won_firstround)
				won_firstround -= x1
				while(!x1 && won_firstround.len)
					x1 = pick(won_firstround)
					won_firstround -= x1
				if(!x1) continue
				if(won_firstround.len < 2)
					won_firstround += x1
					continue

				var/mob/x2 = pick(won_firstround)
				won_firstround -= x2
				while(!x2 && won_firstround.len)
					x2 = pick(won_firstround)
					won_firstround -= x2
				if(!x2)
					won_firstround += x1
					continue
				if(won_firstround.len < 1)
					won_firstround += x1
					won_firstround += x2
					continue

				var/mob/x3 = pick(won_firstround)
				won_firstround -= x3
				while(!x3 && won_firstround.len)
					x3 = pick(won_firstround)
					won_firstround -= x3
				if(!x3)
					won_firstround += x1
					won_firstround += x2
					continue

				Pick_1(x1)
				Pick_2(x2)
				Pick_3(x3)
				Heal(x1)
				Heal(x2)
				Heal(x3)
				world<<"<span class='hougyoku_pursuit'>{Hougyoku - Tournament} Round 2, Match [++match_num]: [x1] VS [x2] VS [x3]!</span>"
				sleep(70)
				StartFight()
				roundon=1
				while(roundon)
					sleep(50)
					var/fighting = 0
					if(x1 && x1.cpursuit == 5)
						++fighting
					if(x2 && x2.cpursuit == 5)
						++fighting
					if(x3 && x3.cpursuit == 5)
						++fighting
					if(fighting < 2)
						roundon = 0

				if(x1 && x1.cpursuit == 5)
					world<<"<span class='hougyoku_pursuit'>{Hougyoku - Tournament} Round 2, Match [match_num]: [x1] wins!</span>"
					MakeHougyoku(x1)
				if(x2 && x2.cpursuit == 5)
					world<<"<span class='hougyoku_pursuit'>{Hougyoku - Tournament} Round 2, Match [match_num]: [x2] wins!</span>"
					MakeHougyoku(x2)
				if(x3 && x3.cpursuit == 5)
					world<<"<span class='hougyoku_pursuit'>{Hougyoku - Tournament} Round 2, Match [match_num]: [x3] wins!</span>"
					MakeHougyoku(x3)

				Declare()
				sleep(20)
		if(won_firstround.len)
			for(var/mob/M in won_firstround)
				if(M)
					MakeHougyoku(M)
		world<<"<span class='hougyoku_pursuit'>Congratulations to the winner(s) of the Hougyoku Pursuit!</span>"
		sleep(20)
		HealHougyoku()
		hougyokucount=0
		hougyokureg=0
		hougyokuwatch=0
		lastscroll=0
		hougyokuactive=0

		tourneyentries=new/list()
		for(var/mob/X in world)
			if(X.cpursuit)
				X.cpursuit=0
				X.inarena=0
				X.frozen=0
				X.Respawn()
			sleep(-1)

		for(var/obj/items/RedHougyoku/X in world)
			del(X)
		for(var/obj/items/PurpleHougyoku/X in world)
			del(X)
	Heal(mob/x)
		x.health=x.mhealth
		x.wound=0
		x.safe=0
		x.frozen=0
		x.firing=0
		x.rei=x.mrei
	HealHougyokuArena()
		for(var/client/c)
			if(c.mob && c.mob.cpursuit == 3)
				c.mob.health=c.mob.mhealth
				c.mob.wound=0
				c.mob.safe=0
				c.mob.firing=0
				c.mob.frozen=0
				c.mob.rei=c.mob.mrei
	HealHougyoku()
		for(var/client/c)
			if(c.mob && c.mob.cpursuit)
				c.mob.health=c.mob.mhealth
				c.mob.wound=0
				c.mob.safe=0
				c.mob.firing=0
				c.mob.frozen=0
				c.mob.rei=c.mob.mrei
	StartHougyoku()
		if(hougyokuactive) return
		hougyokureg=1
		hougyokucount=0
		hougyokuwinners=new/list()
		hougyokuactive=1
		for(var/obj/items/RedHougyoku/X in world)
			del(X)
		for(var/obj/items/PurpleHougyoku/X in world)
			del(X)
			world<<"<span class='hougyoku_pursuit'>The Hougyoku Pursuit has been started. If you want to join you have <em>30 seconds</em> to register! You will be healed automatically when the pursuit starts!</span>"
		sleep(300)
		hougyokureg=0
		world<<"<span class='hougyoku_pursuit'>Hougyoku Pursuit enlistment has ended.</span>"

	StartFOD()
		for(var/mob/x in world)
			for(var/obj/items/RedHougyoku/X in usr.contents)
				del(X)
			for(var/obj/items/PurpleHougyoku/X in usr.contents)
				del(X)

		for(var/client/c)
			if(c.mob && c.mob.cpursuit)
				spawn()
					c.mob << "You only have 25 minutes to pass the Hougyoku Pursuit!"
					c.mob.Forest_of_Death()

	EndFOD()
		FOD = 0

		for(var/mob/X in world)
			if(X.cpursuit && X.cpursuit < 3)
				X.cpursuit=0
				X.inarena=0
				X.frozen=0
				X.Respawn()
			sleep(-1)

		for(var/obj/items/RedHougyoku/X in world)
			del(X)
		for(var/obj/items/PurpleHougyoku/X in world)
			del(X)

	StartArena()
		hougyokuwatch=1
		hougyokucount=0
		hougyokureg=0

	EndHougyoku()
		hougyokucount=0
		hougyokureg=0
		hougyokuwatch=0
		lastscroll=0
		hougyokuactive=0
		tourneyentries=new/list()
		for(var/mob/X in world)
			if(X.cpursuit)
				X.cpursuit=0
				X.inarena=0
				X.frozen=0

				X.Respawn()
		for(var/obj/items/RedHougyoku/X in world)
			del(X)
		for(var/obj/items/PurpleHougyoku/X in world)
			del(X)
	Pick_1(mob/x)//in tourneyentries
		hougyokuwatch=1
		if(x.client)
			x.safe=0
			x.pk=1
			var/leng=length(x.name)+1
			if(leng>20)
				leng=20
			var/oname=copytext(x.name,1,leng)
			var/turf/nturf=locate(129,191,16)

			for(var/mob/X in world)
				if(X.cpursuit && X.client)
					for(var/image/ex in X.client.images)
						if(ex.icon=='Icons/charset.dmi')
							del(ex)

			MapText(world, "[oname]", nturf)
			//world<<"<font color=Blue size= +1>[x.name] Has entered the Hougyoku Arena!</font>"
			x.loc=locate(125,180,16)
			x.dir=EAST
			x.frozen=1
			x.inarena=1
			x.cpursuit=5

	Pick_2(mob/x)
		hougyokuwatch=1
		if(x.client)
			x.safe=0
			x.pk=1
			var/leng=length(x.name)+1
			if(leng>20)
				leng=20
			var/oname=copytext(x.name,1,leng)
			var/turf/nturf=locate(129,189,16)
			var/turf/xturf=locate(130,190,16)

			MapText(world, "VS", xturf)
			MapText(world, "[oname]", nturf)
			//world<<"<font color=Blue size= +1>[x.name] Has entered the Hougyoku Arena!</font>"
			x.loc=locate(140,180,16)
			x.dir=WEST
			x.frozen=1
			x.inarena=1
			x.cpursuit=5
	Pick_3(mob/x)
		hougyokuwatch=1
		if(x.client)
			x.safe=0
			x.pk=1
			//world<<"<font color=Blue size= +1>[x.name] Has entered the Hougyoku Arena! (3 way match!)</font>"
			x.loc=locate(133,175,16)
			x.dir=NORTH
			x.frozen=1
			x.inarena=1
			x.cpursuit=5

	StartFight()
		for(var/mob/x in world)
			spawn()
				if(x.cpursuit||x.tourny)
					x.frozen=1
					x.safe=1
					x<<"On Go"
					sleep(10)
					x<<"3"
					sleep(10)
					x<<"2"
					sleep(10)
					x<<"1"
					sleep(10)
					x<<"0, GO!"
					x.frozen=0
					x.safe=0
		spawn(40)
			for(var/mob/x in world)
				if(x.inarena==1)
					x.pk=1
					x.frozen=0

	Declare()
		for(var/mob/x in world)
			if(x.cpursuit==5)
				//world<<"<font color=Blue size= +1>[x.name] Has won!</font>"
				hougyokuwinners+=x
				x.inarena=0
				x.wound=0
				x.health=x.mhealth
				x.rei=x.mrei
				x.cpursuit=6
				x.CArena()
		hougyokuwatch=0
	MakeHougyoku(mob/X)
		if(!hougyokuactive)
			X.exp+=((X.level*X.level*2)+1000)*10
			return
		world<<"<span class='hougyoku_pursuit'>[X.name] has been promoted to a Hougyoku!</span>"
		AwardMedal("Best of the Best", X)
		X.winner+=1
		X.hougonu=1
		X.Affirm_Icon()
mob
	Admin
		verb
			AUTO_Hougyoku_Start()
				set category="Hougyoku"
				if(hougyokuactive) return
				world<<"<span class='hougyoku_pursuit'>[usr.name] has decided to host a hougyoku pursuit.</span>"
				world<<"<span class='hougyoku_pursuit'>[usr.name] has decided to host a hougyoku pursuit. (<a href='[world.url]'>Join server</a>)</span>"
				for(var/mob/ma in world)ma.verbs+=typesof(/mob/Hougyoku/verb)
				world.Auto_Hougyoku()

			Make_Hougyoku(var/mob/X in world)
				set category="Hougyoku"
				if(X.rank=="Genin")
					AwardMedal("Hougyoku", X)
					world<<"<span class='hougyoku_pursuit'>[X.name] has been promoted to a Hougyoku!</span>"
					X.winner+=1

			Heal_Hougyoku()
				set category="Hougyoku"
				for(var/mob/x in world)
					if(x.cpursuit)
						x.health=x.mhealth
						x.wound=0
						x.rei=x.mrei
			Remove_Tourney_Entry(var/x in tourneyentries)
				set category="Hougyoku"
				tourneyentries.Remove(x)

			Goto_Hougyoku_Arena()
				set category="Hougyoku"
				src.cpursuit=1
				usr.CArena()
			Goto_Forest_of_Death()
				set category="Hougyoku"
				src.cpursuit=1
				usr.Forest_of_Death()
			Goto_Hougyoku_Start()
				set category="Hougyoku"
				src.cpursuit=1
				usr.loc=locate(145,145,16)
			Start_Hougyoku_Pursuit()
				set category="Hougyoku"
				if(hougyokuactive) return
				hougyokureg=1
				hougyokucount=0
				hougyokuwinners=new/list()
				hougyokuactive=1
				for(var/obj/items/RedHougyoku/X in world)
					del(X)
				for(var/obj/items/PurpleHougyoku/X in world)
					del(X)
				world<<"<span class='hougyoku_pursuit'>The Hougyoku Pursuit has been started. If you want to join you have <em>5 minutes</em> to register! You will be healed automatically when the pursuit starts!</span>"
				world<<"<span class='hougyoku_pursuit'>A hougyoku pursuit has started. (<a href='[world.url]'>Join server</a>)</span>"
				for(var/mob/ma in world)ma.verbs+=typesof(/mob/Hougyoku/verb)
				sleep(6000)
				hougyokureg=0
				world<<"<span class='hougyoku_pursuit'>Hougyoku Pursuit enlistment has ended.</span>"
			Start_Hougyoku_Pursuit_2_FOD()
				set category="Hougyoku"
				for(var/mob/x in world)
					if(x.cpursuit)
						x.Forest_of_Death()
						sleep(1)
			Start_Hougyoku_Pursuit_3_Arena()
				set category="Hougyoku"
				for(var/mob/x in world)
					for(var/obj/items/RedHougyoku/X in usr.contents)
						del(X)
					for(var/obj/items/PurpleHougyoku/X in usr.contents)
						del(X)
				hougyokuwatch=1

			End_Registration()
				set category="Hougyoku"
				hougyokucount=0
				hougyokureg=0
				world<<"<span class='hougyoku_pursuit'>Hougyoku Pursuit enlistment has ended.</span>"
			End_Hougyoku_Pursuit()
				set category="Hougyoku"
				hougyokucount=0
				hougyokureg=0
				hougyokuwatch=0
				lastscroll=0
				hougyokuactive=0
				world<<"<span class='hougyoku_pursuit'>The Hougyoku Pursuit has ended.</span>"
				tourneyentries=new/list()
				for(var/mob/X in world)
					if(X.cpursuit)
						X.cpursuit=0
						X.inarena=0
						X.frozen=0

						X.Respawn()
						for(var/obj/items/RedHougyoku/Xa in world)
							del(Xa)
						for(var/obj/items/PurpleHougyoku/Xd in world)
							del(Xd)
			Clear_Board()
				set category="Tournament"
				for(var/mob/X in world)
					if(X.cpursuit && X.client)
						for(var/image/ex in X.client.images)
							if(ex.icon=='Icons/charset.dmi')
								del(ex)

			Pick_Combatant_Tournament_1(mob/x in tourneyentries)
				set category="Tournament"
				hougyokuwatch=1
				if(x.client)
					x.pk=1
					var/leng=length(x.name)+1
					if(leng>20)
						leng=20
					var/oname=copytext(x.name,1,leng)
					var/turf/nturf=locate(128,191,16)

					for(var/mob/X in world)
						if(X.cpursuit && X.client)
							for(var/image/ex in X.client.images)
								if(ex.icon=='Icons/charset.dmi')
									del(ex)

					MapText(world, "[oname]", nturf)
					world<<"<font color=Blue size= +1>[x.name] Has entered the Tournament Arena!</font>"
					x.loc=locate(125,180,16)
					x.dir=EAST
					x.frozen=1
					x.inarena=1
					x.cpursuit=5
			Pick_Combatant_Tournament_2(mob/x in tourneyentries)
				set category="Tournament"
				hougyokuwatch=1
				if(x.client)
					x.pk=1
					var/leng=length(x.name)+1
					if(leng>20)
						leng=20
					var/oname=copytext(x.name,1,leng)
					var/turf/nturf=locate(128,189,16)
					var/turf/xturf=locate(129,190,16)

					MapText(world, "VS", xturf)
					MapText(world, "[oname]", nturf)
					world<<"<font color=Blue size= +1>[x.name] Has entered the Tournament Arena!</font>"
					x.loc=locate(140,180,16)
					x.dir=WEST
					x.frozen=1
					x.inarena=1
			Start_Tournament_Fight()
				set category="Tournament"
				for(var/mob/x in world)
					spawn()
						if(x.tourny)
							x<<"On Go"
							sleep(10)
							x<<"3"
							sleep(10)
							x<<"2"
							sleep(10)
							x<<"1"
							sleep(10)
							x<<"0, GO!"
				spawn(40)
					for(var/mob/x in world)
						if(x.inarena==1)
							x.pk=1
							x.safe=0
							x.frozen=0

			Declare_Winner_Tournament()
				set category="Tournament"
				for(var/mob/x in world)
					if(x.tourny && x.won)
						world<<"<font color=Blue size= +1>[x.name] Has won!</font>"
						hougyokuwinners+=x
						x.inarena=0
						x.wound=0
						x.won=0
						x.health=x.mhealth
						x.rei=x.mrei
						x.CArena()
				hougyokuwatch=0

turf/memberwarp
	Enter(mob/O)
		if(istype(O) && O.client)
			if(!O.client.IsByondMember())
				O<<"This is for BYOND Members Only!"
				return 0
		return ..()
	Entered(mob/O)
		if(istype(O) && O.client)
			for(var/turf/memberwarp/M in world)
				if(M!=src)
					if(M.loc)O.loc=locate(M.x,M.y,M.z)

obj/items
	mouse_drop_zone=1
	New()
		..()

		mouse_drag_pointer=new/icon(src.icon,src.icon_state)

/*	MouseDrop(obj/gui/over_object,src_location,over_location)
		if(istype(over_object,/obj/gui/placeholder) ||istype(over_object,/obj/gui/skillcards)||istype(over_object,/obj/items))
			if(!(istype(over_object,/obj/gui/skillcards)&&!over_object.deletable))
				var/spot
				switch(over_object.screen_loc)
					if("2,1")
						spot=1
					if("3,1")
						spot=2
					if("4,1")
						spot=3
					if("5,1")
						spot=4
					if("6,1")
						spot=5
					if("7,1")
						spot=6
					if("8,1")
						spot=7
					if("9,1")
						spot=8
					if("10,1")
						spot=9
					if("11,1")
						spot=0

				if(spot!=null)
					if(src==over_object)
						return
					src.Place("[spot]")

				if(istype(over_object,/obj/gui/skillcards))over_object.loc=null*/
	PurpleHougyoku
		layer=MOB_LAYER+5
		icon='Icons/Hougyoku.dmi'
		icon_state="purp"
		Click()
			src.Get(usr)
		verb
			Get()

				set src in oview(1)
				if(!usr.ko)
					Move(usr)
			Drop()
				src.loc=locate(usr.x,usr.y,usr.z)

	RedHougyoku
		layer=MOB_LAYER+5
		icon='Icons/Hougyoku.dmi'
		icon_state="red"
		Click()
			for(var/mob/x in oview(1,src))
				if(usr==x)
					src.Get(usr)

		verb
			Get()

				set src in oview(1)
				if(!usr.ko)
					Move(usr)
			Drop()
				src.loc=locate(usr.x,usr.y,usr.z)


obj/arenaspawn
obj/cpursuitspawn
mob
	proc
		Join_Pursuit()
			src.loc=locate(122,197,16)
			src.cpursuit=1
			hougyokucount++

		CArena()
			sleep(-1)
			var/list/Pik=new
			for(var/obj/arenaspawn/ex in world)
				var/turf/L=ex.loc
				Pik+=L
			var/turf/exe
			if(Pik)
				exe=pick(Pik)
			if(exe)
				src.loc=locate(exe.x,exe.y,exe.z)
			src.safe=1

		Forest_of_Death()
			sleep(-1)
			if(src.cpursuit==1)
				src.cpursuit=2
				var/list/spawnpoints=new
				for(var/obj/cpursuitspawn/Xx in world)
					var/turf/L=Xx.loc

					spawnpoints+=L
				var/obj/ey=pick(spawnpoints)
				src.loc=locate(ey.x,ey.y,ey.z)
				if(lastscroll==0)
					new/obj/items/RedHougyoku(src)
					lastscroll=1
				else
					new/obj/items/PurpleHougyoku(src)
					lastscroll=0

turf
	towerdoor
		Entered(mob/O)
			if(istype(O,/mob/))
				world<<"<span class='hougyoku_pursuit'>[O.name] has passed the Hougyoku Pursuit.</span>"
				tourneyentries+=O
				O:cpursuit=3
				O:stunned=2
				O:CArena()

		Enter(O)
			if(istype(O,/mob/))
				var/h=locate(/obj/items/RedHougyoku) in O
				var/e=locate(/obj/items/PurpleHougyoku) in O

				if(e&&h)
					for(var/obj/items/RedHougyoku/X in O:contents)
						X.loc = null
					for(var/obj/items/PurpleHougyoku/X in O:contents)
						X.loc = null
					return 1
				else
					O << "You need both the Red AND the Purple Hougyoku to enter!"
					return 0
			return ..()
