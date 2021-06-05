var
	hmlab=0
	sslab=0
	ktlab=0
	labtime=0
	portaltime=120//how long u stay in CR
	sslabtime=60
	ktlabtime=60
	hmlabtime=120//time u have to leave hm
	chargeout=0//represents that someone has the charge
	stolefrom=null
	gotcharge=null//represents person
	winningrace=null//represents race
	tmp/list/alreadywent=list()
obj/var
	kt=0
	hm=0
	ss=0
	lb=0
obj/Labs
	lb=1
	earth
		kt=1
	lasnoches
		hm=1
	rukongai
		ss=1
mob/var
	tmp/incr=0
mob
	proc
		CheckLab(obj/J)
			if(!src.client)return
			if(src.level<200)
				src<<"You need to be at least level 200 to interact with the lab"
				return
			if(gotcharge=="[src.name]")
				if(portaltime==0)
					if(J.kt)
						if(src.earth)
							gotcharge=null
							winningrace=1
							labtime=1
							src.gotthecharge=0
							src.chargewins+=1
							if(src.chargewins==10)
								AwardMedal("Runner!", src)
							world<<"<font color=lime><b>[src] has successfully retrieved the charge and allows everyone from Earth double the exp from npcs and all other races's required exp will increase, making it harder for them to gain a level"
							for(var/mob/player/Ms in world)
								if(stolefrom==3)
									if(Ms.shinip)
										Ms<<"Your required exp has increased from [Ms.mexp] to [Ms.mexp*2]"
										Ms.mexp+=Ms.mexp
										Ms.chargedalready=1
						/*				if(Ms.chargedalready == 1)
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Shinigami"&&Ms.level==150&&Ms.beatkenpachi==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Fullbringer"&&Ms.level==150&&Ms.beatkenpachi==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Holllow"&&Ms.level==220&&Ms.beatichigo==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Quincy"&&Ms.level==220&&Ms.gotfinal==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.level==400&&Ms.talktoshinji==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.level==300&&Ms.gamemish<5)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2*/
								if(stolefrom==2)
									if(Ms.hollow)
										Ms<<"Your required exp has increased from [Ms.mexp] to [Ms.mexp*2]"
										Ms.mexp+=Ms.mexp
										Ms.chargedalready=1
								/*		if(Ms.chargedalready == 1)
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Shinigami"&&Ms.level==150&&Ms.beatkenpachi==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Fullbringer"&&Ms.level==150&&Ms.beatkenpachi==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Holllow"&&Ms.level==220&&Ms.beatichigo==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Quincy"&&Ms.level==220&&Ms.gotfinal==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.level==400&&Ms.talktoshinji==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.level==300&&Ms.gamemish<5)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2*/
							for(var/mob/player/M in view(8,src))
								if(M.shinip==src.shinip&&M.hollow==src.hollow&&M.earth==src.earth)
									M<<"For helping to retrieve the charge you get 5 free levels, 3 passive points, 20 event points and $100,000"
									M.GainExp(M.mexp * 15)
									M.skillspassive+=3
									M.GainMoney(100000)
									M.eventpoints+=200
									if(M.squad==12)
										M.GainExp(M.mexp * 5)
										M.combos+=1
										M.skillspassive+=4
										M.GainMoney(50000)
										M.eventpoints+=50
										M<<"For being in Squad 12 you get bigger rewards and a combo point!"
									M.Level_Up()
					if(J.hm)
						if(src.hollow)
							gotcharge=null
							labtime=1
							winningrace=2
							src.gotthecharge=0
							src.chargewins+=1
							if(src.chargewins==10)
								AwardMedal("Runner!", src)
							world<<"<font color=lime><b>[src] has successfully retrieved the charge and allows everyone from Hueco Mundo double the exp from npcs and all other races's required exp will increase, making it harder for them to gain a level"
							for(var/mob/player/Ms in world)
								if(stolefrom==3)
									if(Ms.shinip)
										Ms<<"Your required exp has increased from [Ms.mexp] to [Ms.mexp*2]"
										Ms.mexp+=Ms.mexp
										Ms.chargedalready=1
							/*			if(Ms.chargedalready == 1)
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Shinigami"&&Ms.level==150&&Ms.beatkenpachi==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Fullbringer"&&Ms.level==150&&Ms.beatkenpachi==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Holllow"&&Ms.level==220&&Ms.beatichigo==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Quincy"&&Ms.level==220&&Ms.gotfinal==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.level==400&&Ms.talktoshinji==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.level==300&&Ms.gamemish<5)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2*/
								if(stolefrom==1)
									if(Ms.earth)
										Ms<<"Your required exp has increased from [Ms.mexp] to [Ms.mexp*2]"
										Ms.mexp+=Ms.mexp
										Ms.chargedalready=1
							/*			if(Ms.chargedalready == 1)
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Shinigami"&&Ms.level==150&&Ms.beatkenpachi==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Fullbringer"&&Ms.level==150&&Ms.beatkenpachi==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Holllow"&&Ms.level==220&&Ms.beatichigo==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Quincy"&&Ms.level==220&&Ms.gotfinal==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.level==400&&Ms.talktoshinji==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.level==300&&Ms.gamemish<5)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2*/
							for(var/mob/player/M in view(6,src))
								if(M.shinip==src.shinip&&M.hollow==src.hollow&&M.earth==src.earth)
									M<<"For helping to retrieve the charge you get 5 free levels, 3 passive points, 20 event points and $100,000"
									M.GainExp(M.mexp * 15)
									M.skillspassive+=3
									M.GainMoney(100000)
									M.eventpoints+=200


					if(J.ss)
						if(src.shinip)
							gotcharge=null
							labtime=1
							winningrace=3
							src.gotthecharge=0
							src.chargewins+=1
							if(src.chargewins==10)
								AwardMedal("Runner!", src)
							world<<"<font color=lime><b>[src] has successfully retrieved the charge and allows everyone from Soul Society double the exp from npcs and all other races's required exp will increase, making it harder for them to gain a level"
							for(var/mob/player/Ms in world)
								if(stolefrom==1)
									if(Ms.earth)
										Ms<<"Your required exp has increased from [Ms.mexp] to [Ms.mexp*2]"
										Ms.mexp+=Ms.mexp
								/*		Ms.chargedalready=1
										if(Ms.chargedalready == 1)
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Shinigami"&&Ms.level==150&&Ms.beatkenpachi==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Fullbringer"&&Ms.level==150&&Ms.beatkenpachi==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Holllow"&&Ms.level==220&&Ms.beatichigo==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Quincy"&&Ms.level==220&&Ms.gotfinal==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.level==400&&Ms.talktoshinji==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.level==300&&Ms.gamemish<5)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2*/
								if(stolefrom==2)
									if(Ms.hollow)
										Ms<<"Your required exp has increased from [Ms.mexp] to [Ms.mexp*2]"
										Ms.mexp+=Ms.mexp
										Ms.chargedalready=1
								/*		if(Ms.chargedalready == 1)
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Shinigami"&&Ms.level==150&&Ms.beatkenpachi==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Fullbringer"&&Ms.level==150&&Ms.beatkenpachi==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Holllow"&&Ms.level==220&&Ms.beatichigo==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.race=="Quincy"&&Ms.level==220&&Ms.gotfinal==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.level==400&&Ms.talktoshinji==0)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2
										if(Ms.level==300&&Ms.gamemish<5)
											Ms<<"Your required exp has been reduced from [Ms.mexp] to [Ms.mexp/2] for Story purposes"
											Ms.mexp-=Ms.mexp/2*/
							for(var/mob/player/M in view(6,src))
								if(M.shinip==src.shinip&&M.hollow==src.hollow&&M.earth==src.earth)
									M<<"For helping to retrieve the charge you get 5 free levels, 3 passive points, 20 event points and $100,000"
									M.GainExp(M.mexp * 15)
									M.skillspassive+=3
									M.GainMoney(100000)
									M.eventpoints+=200
			if(labtime)
				if(winningrace==1)
					src<<"<font color=lime><b>Humans/Vaizards have lab invincibility at the moment"
				if(winningrace==2)
					src<<"<font color=lime><b>Hollows have lab invincibility at the moment"
				if(winningrace==3)
					src<<"<font color=lime><b>Shinigamis have lab invincibility at the moment"
				return
			if(chargeout)
				src<<"<font color=lime><b>The charge isn't here at the moment"
				return
			var/Jd=0
			for(var/mob/player/M in oview(1,src))
				if(M.shinip==src.shinip&&M.hollow==src.hollow&&M.earth==src.earth)
					if(M.level>=150)
						Jd+=1
			if(Jd<1)
				src<<"You need at least 2 players over level 150 from your world to help you"
				return
			if(src in alreadywent)
				src<<"You already tried to steal the charge"
				return
			if(J.kt)
				if(src.shinip||src.hollow)
					alreadywent+=src
					gotcharge="[src.name]"
					stolefrom=1
					chargeout=1
					src.gotthecharge=1
					world<<"<font color=lime><b>[gotcharge] has shut down the lab in Southern Karakura Town"
					view(src)<<"<font color=lime><b>You have 60 seconds to get to the Precipe World(Crossroads)"
					spawn()ChargeCount(1,src)
			if(J.hm)
				if(src.shinip||src.earth)
					gotcharge="[src.name]"
					stolefrom=2
					alreadywent+=src
					src.gotthecharge=1
					chargeout=1
					world<<"<font color=lime><b>[gotcharge] has shut down the lab in Las Noches"
					view(src)<<"<font color=lime><b>You have 120 seconds to get to the Precipe World(Crossroads)"
					spawn()ChargeCount(2,src)
			if(J.ss)
				if(src.hollow||src.earth)
					gotcharge="[src.name]"
					stolefrom=3
					alreadywent+=src
					src.gotthecharge=1
					chargeout=1
					world<<"<font color=lime><b>[gotcharge] has shut down the lab in Rukongai"
					view(src)<<"<font color=lime><b>You have 60 seconds to get to the Precipe World(Crossroads)"
					spawn()ChargeCount(3,src)
proc/ResetLabs()
	hmlab=0
	sslab=0
	ktlab=0
	labtime=0
	portaltime=120//how long u stay in CR
	sslabtime=60
	ktlabtime=60
	stolefrom=0
	hmlabtime=120//time u have to leave hm
	//chargeout=0//represents that someone has the charge
	gotcharge=null//represents person
	winningrace=null
proc/ChargeCount(labtype,mob/M)
	spawn(18000)
		chargeout=0
		world<<"<font color=lime><b>Labs have been reset"
		ResetLabs()
	//var/mob/M=gotcharge
	if(labtype==1)
		sleep(600)
		if(!M)
			world<<"<font color=lime><b>Labs have been reset"
			ResetLabs()
		if(M.incr)
			M.Freeze(5)
			world<<"<font color=lime><b>[M] is in the Precipe World(Crossroads) with Earth's exp charge and has to wait for 4 mins before they can leave"
		else
			world<<"<font color=lime><b>[M] didn't make it to the Precipe World(Crossroads) in time so Earth scientists managed to turn their lab back on"
			if(!M.failcharge)
				AwardMedal("Failure", M)
				M.failcharge=1
			ResetLabs()
			return
	if(labtype==2)
		sleep(1200)
		if(!M)
			world<<"<font color=lime><b>Labs have been reset"
			ResetLabs()
		if(M.incr)
			M.Freeze(5)
			world<<"<font color=lime><b>[M] is in the Precipe World(Crossroads) with Las Noches's exp charge and has to wait for 4 mins before they can leave"
		else
			world<<"<font color=lime><b>[M] didn't make it to the Precipe World(Crossroads) in time so Arrancar scientists managed to turn their lab back on"
			if(!M.failcharge)
				AwardMedal("Failure", M)
				M.failcharge=1
			ResetLabs()
			return
	if(labtype==3)
		sleep(600)
		if(!M)
			world<<"<font color=lime><b>Labs have been reset"
			ResetLabs()
		if(M.incr)
			M.Freeze(5)
			world<<"<font color=lime><b>[M] is in the Precipe World(Crossroads) with Soul Society's exp charge and has to wait for 4 mins before they can leave"
		else
			world<<"<font color=lime><b>[M] didn't make it to the Precipe World(Crossroads) in time so Shinigami scientists managed to turn their lab back on"
			if(!M.failcharge)
				AwardMedal("Failure", M)
				M.failcharge=1
			ResetLabs()
			return
	sleep(2400)
	if(!M)
		world<<"<font color=lime><b>You must now wait"
		ResetLabs()
		return
	if(!M.gotthecharge)
		world<<"<font color=lime><b>You must now wait"
		ResetLabs()
		return
	if(M)
		world<<"<font color=lime><b>[M] has completely fueled the charge and must now return to their lab"
		portaltime=0
