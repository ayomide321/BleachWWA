var
	list/Mutee=list()
	currentMutee=null
	vote=0
	voteyes=0
	voteno=0
mob/var
	votecool=0

proc
	World_Vote(mob/D)
		if(vote)return
		if(!vote)
			vote=1
			currentMutee=D
			voteyes=0
			voteno=0
			sleep(1200)
			if(voteyes>voteno)
				world << "<b><font color = green><font size=2>[D] has been muted with [voteyes]/[voteno+voteyes] votes for 30 minutes"
			else
				world << "<b><font color = green><font size=2>[D] has failed to be muted with [voteno]/[voteno+voteyes] votes"
				D.muted=0
			vote=0
			for(var/mob/player/S in world)
				S.verbs-=/mob/vote/verb/Vote_No
				S.verbs-=/mob/vote/verb/Vote_Yes
				S.verbs-=/mob/vote/verb/Vote_What
mob
	verb
		Vote_Mute()
			set hidden=1
			if(src.votecool)
				src<<"You must wait [round(src.votecool/600,1)] minutes"
				return
			switch(input("Would you like to mute somebody?", text) in list ("Yes","No"))
				if("Yes")
					if(vote)return
					if(!src.votecool)
						var/list/Menu = list()
						for(var/mob/player/M in world)
							if(!M.client) continue
							if(M.name != usr.name)
								Menu.Add(M)
						var/mob/D = input("Who do you want to mute?","") as null | anything in Menu
						if(!src.votecool)
							if(!D.muted)
								if(D in Mutee)
									src<<"[D] cannot be voted on until next reboot"
								if(D.key in specialverbs)
								//	world<<"<b><font color=green><font size=4>Stop trying to bully Zagros! shame on you all!"
									return
								else
									src.votecool=36000
									world << "<b><font color = green><font size=2>[src] has elected to mute [D], you have 2 mins to vote"
									for(var/mob/player/S in world)
										if(S.name!=D.name)
											S.verbs+=/mob/vote/verb/Vote_No
											S.verbs+=/mob/vote/verb/Vote_Yes
											S.verbs+=/mob/vote/verb/Vote_What
									D.muted=18000
									Mutee+=D
									spawn()World_Vote(D)
							else
								src<<"[D] is already muted"
mob
	vote
		verb
			Vote_Yes()
				set hidden=1
				voteyes+=1
				usr<<"You voted to mute [currentMutee]"
				usr.verbs-=/mob/vote/verb/Vote_No
				usr.verbs-=/mob/vote/verb/Vote_Yes
				usr.verbs-=/mob/vote/verb/Vote_What
			Vote_No()
				set hidden=1
				voteno+=1
				usr<<"You voted to unmute [currentMutee]"
				usr.verbs-=/mob/vote/verb/Vote_No
				usr.verbs-=/mob/vote/verb/Vote_Yes
				usr.verbs-=/mob/vote/verb/Vote_What

			Vote_What()
				set hidden=1
				alert(usr,"Mute [currentMutee]?")























































































































































































































var/global/list/dskeys=list("dariuc","avidanimefan")