var
	entry=0
	lostzan=0
	realzans=0
	lostreigai=0
	reigaimish=0
	lostcaps=0
	capsmish=0
	lostesp=0
	espmish=0
	vastomish=0
	totalvastoskilled=0
	eventon=0
	lastevent=0
	ppl=0
	timelimit=2
	list/races=new

	//address_of_other_server
	maxplayers = 0
	//block_alts = 0
mob
	verb
		GiveEventPoints(mob/m)
			var/epGive=input({"How many event points do you want to give [m.name]?)"})as num
			if(epGive>0)
				if(epGive<=usr.eventpoints)
					usr.eventpoints-=epGive
					m.eventpoints+=epGive
					m<<"[usr] gave you [epGive] event points!"
					usr<<"You gave [m] [epGive] event points!"
					AutoSave()
proc/Start_Lost_Zan_Event()
	sleep(12 MINUTES) //Changedfrom
	if(eventon)Start_Lost_Zan_Event()
	if(!changedevent)
		lastevent=pick(1,2,3,4,5,6,9)//(0,1,2,2,3,4,4,5) 9 is zagz new
	changedevent=0
	if(lastevent==0&&!eventon)
		world<<"<font color=teal>The Final Horde Event is starting.All the Final Shinigamis have gone out of control and are planning on destroying everything, so you must stop as many as possible.Join by going to the Event tab(You must over level 400 to join)You have 2 mins."
		lastevent=1
		eventon=1
		timelimit=2
		ppl=0
		for(var/mob/player/M in All_Clients())
			M.lost=0
		vastomish=0
		entry=1
		sleep(1200)
		entry=0
		world<<"<font color=teal>The Final Horde Event has started."
		if(ppl<=333)
			world<<"<font color=teal>Not enough players."
			eventon=0
			for(var/mob/player/L in All_Clients())
				if(L.lost)
					L.lost=0
					L.safe=0
			Start_Lost_Zan_Event()
			return
		for(var/mob/player/M in All_Clients())
			if(M.lost==1)
				M.inghouse=0
				M.oldspot=M.loc
				M.loc=locate(rand(65,75),rand(15,25),10)
				M.safe=0
				M.frozen=0
				M.canattack=1
				M.protected=0
				M.lost=1
				M.wound=0
				M.health=M.mhealth
				M.rei=M.mrei
				M.vastoskilled=0
				vastomish+=1
				M.attack+=(M.mattack/20)*M.olympics
				M.defence+=(M.mdefence/20)*M.olympics
				M.reiatsu+=(M.mreiatsu/20)*M.olympics
		Start_Lost_Zan_Event()
	if(lastevent==9&&!eventon)
		world<<"<font color=teal><font size=3>The Wandenreich Prince has invaded help stop him at all costs!(You must be at least level 400 to join)You have 2 mins."
		lastevent=8
		eventon=1
		ppl=0
		for(var/mob/E in world)
			E.lost=0
		entry=1
		spawn(1 MINUTE)
			world<<"<font color=teal><font size=3>1 minute left to join the The Wandenreich Prince event."
		sleep(1200) //CHANGEDFrom
		entry=0
		world<<"<font color=teal>The invasion has begun, DEFEND!."
		if(ppl<1)
			world<<"<font color=teal>Not enough players."
			eventon=0
			for(var/mob/L in world)
				if(L.lost)
					L.lost=0
					L.safe=0
			Start_Lost_Zan_Event()
			return
		new/mob/Wandenreich_Prince(locate(25,120,13))
		for(var/mob/M in world)
			if(M.lost==1)
				M.oldspot=M.loc
				M.inghouse=0
				M.loc=locate(rand(15,30),rand(105,120),13)
				M.safe=0
				M.frozen=0
				M.canattack=1
				M.protected=0
				M.lost=1
				M.wound=0
				M.dmgdone=0
				M.wnddone=0
				M.health=M.mhealth
				M.rei=M.mrei
				M.attack+=(M.mattack/20)*M.olympics
				M.defence+=(M.mdefence/20)*M.olympics
				M.reiatsu+=(M.mreiatsu/20)*M.olympics
		Start_Lost_Zan_Event()
	if(lastevent==1&&!eventon)
		world<<"<font color=teal><font size=3>The Reigai Event is starting.Everyone has been cloned and you must help at any cost by defeating your reigai.Join by going to the Event tab(You must be over 250 to join)You have 2 mins."
		lastevent=2
		eventon=1
		ppl=0
		for(var/mob/M in world)
			M.lost=0
		entry=1
		spawn(1 MINUTE)
			world<<"<font color=teal><font size=3>1 minute left to join the The Reigai event."
		sleep(1200)
		entry=0
		world<<"<font color=teal>The Reigai Event has started."
		if(ppl<1)
			world<<"<font color=teal>Not enough players."
			eventon=0
			for(var/mob/player/L in All_Clients())
				if(L.lost)
					L.lost=0
					L.safe=0
			Start_Lost_Zan_Event()
			return
		for(var/mob/player/M in All_Clients())
			if(M.lost==1)
				M.oldspot=M.loc
				M.inghouse=0
				M.loc=locate(rand(15,30),rand(105,120),13)
				M.safe=0
				M.frozen=0
				M.canattack=1
				M.protected=0
				M.lost=1
				M.wound=0
				M.dmgdone=0
				M.wnddone=0
				M.health=M.mhealth
				M.rei=M.mrei
				M.MakeReigai(M)
				lostreigai+=1
				reigaimish+=1
				M.attack+=(M.mattack/20)*M.olympics
				M.defence+=(M.mdefence/20)*M.olympics
				M.reiatsu+=(M.mreiatsu/20)*M.olympics
		Start_Lost_Zan_Event()
	if(lastevent==2&&!eventon)
		world<<"<font color=teal><font size=3>The Gotei 13 Event is starting.Test your strength against the captains of the Gotei 13.Join by going to the Event tab(You must be over 400 to join)You have 2 mins."
		lastevent=3
		eventon=1
		ppl=0
		for(var/mob/player/M in All_Clients())
			M.lost=0
		entry=1
		spawn(1 MINUTE)
			world<<"<font color=teal><font size=3>1 minute left to join the Gotei 13 event."
		sleep(1200)
		entry=0
		world<<"<font color=teal>The Gotei 13 Event has started."
		if(ppl<=1)
			world<<"<font color=teal>Not enough players."
			eventon=0
			for(var/mob/player/L in All_Clients())
				if(L.lost)
					L.lost=0
					L.safe=0
			Start_Lost_Zan_Event()
			return
		for(var/mob/Gotei_13/Yo in world)
			del Yo
		new/mob/Gotei_13/C1(locate(rand(135,185),rand(125,155),19))
		new/mob/Gotei_13/C2(locate(rand(135,185),rand(125,155),19))
		new/mob/Gotei_13/C3(locate(rand(135,185),rand(125,155),19))
		new/mob/Gotei_13/C4(locate(rand(135,185),rand(125,155),19))
		new/mob/Gotei_13/C5(locate(rand(135,185),rand(125,155),19))
		new/mob/Gotei_13/C6(locate(rand(135,185),rand(125,155),19))
		new/mob/Gotei_13/C7(locate(rand(135,185),rand(125,155),19))
		new/mob/Gotei_13/C8(locate(rand(135,185),rand(125,155),19))
		new/mob/Gotei_13/C9(locate(rand(135,185),rand(125,155),19))
		new/mob/Gotei_13/C10(locate(rand(135,185),rand(125,155),19))
		new/mob/Gotei_13/C11(locate(rand(135,185),rand(125,155),19))
		new/mob/Gotei_13/C12(locate(rand(135,185),rand(125,155),19))
		new/mob/Gotei_13/C13(locate(rand(135,185),rand(125,155),19))
		capsmish=13
		for(var/mob/player/M in All_Clients())
			if(M.lost==1)
				M.oldspot=M.loc
				M.inghouse=0
				M.loc=locate(rand(135,185),rand(125,155),19)
				M.safe=0
				M.frozen=0
				M.canattack=1
				M.protected=0
				M.lost=1
				M.wound=0
				M.dmgdone=0
				M.wnddone=0
				M.health=M.mhealth
				M.rei=M.mrei
				lostcaps+=1
				M.attack+=(M.mattack/20)*M.olympics
				M.defence+=(M.mdefence/20)*M.olympics
				M.reiatsu+=(M.mreiatsu/20)*M.olympics
		Start_Lost_Zan_Event()
	if(lastevent==3&&!eventon)
		world<<"<font color=teal><font size=3>The Final GetsugaTenshou Ichigo Event is starting. Ichigo is angry at the world and will stop at nothing to kill you all, stop him in his tracks within 10 minutes.Join by going to the Event tab(You must be at least level 350 to join)You have 2 mins."
		lastevent=4
		eventon=1
		ppl=0
		for(var/mob/E in world)
			E.lost=0
		entry=1
		spawn(1 MINUTE)
			world<<"<font color=teal><font size=3>1 minute left to join the Final GetsugaTenshou Ichigo event."
		sleep(1200)
		entry=0
		world<<"<font color=teal>The Final GetsugaTenshou Ichigo Event has started."
		if(ppl<1)
			world<<"<font color=teal>Not enough players."
			eventon=0
			for(var/mob/L in world)
				if(L.lost)
					L.lost=0
					L.safe=0
			Start_Lost_Zan_Event()
			return
		new/mob/Final_Getsuga_Tenshou(locate(25,120,13))
		for(var/mob/M in world)
			if(M.lost==1)
				M.oldspot=M.loc
				M.inghouse=0
				M.loc=locate(rand(15,30),rand(105,120),13)
				M.safe=0
				M.frozen=0
				M.canattack=1
				M.protected=0
				M.lost=1
				M.wound=0
				M.dmgdone=0
				M.wnddone=0
				M.health=M.mhealth
				M.rei=M.mrei
				M.attack+=(M.mattack/20)*M.olympics
				M.defence+=(M.mdefence/20)*M.olympics
				M.reiatsu+=(M.mreiatsu/20)*M.olympics
		Start_Lost_Zan_Event()
	if(lastevent==4&&!eventon)
		world<<"<font color=teal><font size=3>Capture the Flag is starting. You will be pit against a random team in a battlefield and must capture their flag and bring it back to your base(You must be over level 150 to join)You have 2 mins."
		lastevent=5
		eventon=1
		ppl=0
		for(var/mob/E in world)
			E.lost=0
		entry=1
		sleep(1200)
		entry=0
		world<<"<font color=teal>Capture the Flag has started."
		if(ppl<=4)
			world<<"<font color=teal>Not enough players."
			eventon=0
			for(var/mob/M in world)
				if(M.lost)
					M.ctf=0
					M.lost=0
					M.canattack=1
					M.canattacks=0
					M.Respawn()
			Start_Lost_Zan_Event()
			return
		var/list/ctflevels=list()
		var/list/ctfmembers=list()
		var/number=0
		var/redlevel=0
		var/bluelevel=0
		for(var/mob/N in world)
			if(N.ctf==1)
				number++
				ctfmembers+=N
				ctflevels+=min(1000,N.level)
		while(number)
			//var/person=max(ctflevels)
			for(var/mob/B in ctfmembers) //if(B&&B.level==person)
				if(redlevel==bluelevel||(!redlevel&&!bluelevel))
					switch(rand(1,2))
						if(1)
							B.colorr="Red"
							redlevel+=min(1000,B.level)
						if(2)
							B.colorr="Blue"
							bluelevel+=min(1000,B.level)
				else
					if(redlevel<bluelevel)
						B.colorr="Red"
						redlevel+=min(1000,B.level)
					else
						B.colorr="Blue"
						bluelevel+=min(1000,B.level)
				ctflevels-=min(1000,B.level)
				ctfmembers-=B
			number-=1
		for(var/mob/M in world)
			if(M.lost==1)
				M.canattack=1
				M.canattacks=0
				M.attack+=(M.mattack/20)*M.olympics
				M.defence+=(M.mdefence/20)*M.olympics
				M.reiatsu+=(M.mreiatsu/20)*M.olympics
				M.CTF()
		world<<"<font size=3>RED TEAM."
		for(var/mob/M in world)
			if(M.colorr=="Red"&&M.ctf)
				world << "<font color=red>[M]"
		world<<"<font size=3>BLUE TEAM."
		for(var/mob/M in world)
			if(M.colorr=="Blue"&&M.ctf)
				world << "<font color=blue>[M]"
		Start_Lost_Zan_Event()
	if(lastevent==5&&!eventon)
		world<<"<font color=teal><font size=3>The Race Wars are starting. You will have to put your race against others, but which race is the strongest of all.Join by going to the Event tab(Must be over level 250)You have 2 mins."
		world<<"<font color=teal>The Following are Eligible Races:"
		world<<"<font color=teal>Vaizards"
		world<<"<font color=teal>Humans - Quincies, Sados, Fullbringers"
		world<<"<font color=teal>Soul Society - Shinigamis"
		world<<"<font color=teal>Hueco Mundo - Hollows, Arrancars"
		lastevent=0
		eventon=1
		ppl=0
		races=null
		for(var/mob/E in world)
			E.lost=0
		entry=1
		spawn(1 MINUTE)
			world<<"<font color=teal><font size=3>1 minute left to join the Race Wars event."
		sleep(1200)
		entry=0
		world<<"<font color=teal>The Race Wars have started."
		if(ppl<=5)
			world<<"<font color=teal>Not enough players."
			eventon=0
			for(var/mob/player/M in All_Clients())
				if(M.lost)
					M.frozen=0
					M.canattack=1
					M.canattacks=0
					M.protected=0
					M.lost=0
					M.Respawn()
			Start_Lost_Zan_Event()
			return
		var/vai=0
		var/hum=0
		var/hol=0
		var/shi=0
		for(var/mob/player/M in All_Clients())
			if(M.lost==1)
				if(M.hollow)hol+=1
				if(M.shinip)shi+=1
				if(M.earth&&M.race!="Vaizard")hum+=1
				if(M.race=="Vaizard")vai+=1
				M.loc=locate(rand(15,30),rand(105,120),13)
				M.safe=0
				M.frozen=0
				M.canattack=1
				M.canattacks=0
				M.protected=0
				M.lost=1
				M.wound=0
				M.health=M.mhealth
				M.rei=M.mrei
				M.attack+=(M.mattack/20)*M.olympics
				M.defence+=(M.mdefence/20)*M.olympics
				M.reiatsu+=(M.mreiatsu/20)*M.olympics
		if(vai&&!hum&&!hol&&!shi||!vai&&hum&&!hol&&!shi||!vai&&!hum&&hol&&!shi||!vai&&!hum&&!hol&&shi)
			for(var/mob/player/M in All_Clients())
				if(M.lost==1)
					M.frozen=0
					M.attack=M.mattack
					M.defence=M.mdefence
					M.reiatsu=M.mreiatsu
					M.canattack=1
					M.canattacks=0
					M.protected=0
					M.lost=0
					M.Respawn()
			eventon=0
			Start_Lost_Zan_Event()
			return
		Start_Lost_Zan_Event()
	if(lastevent==6&&!eventon)
		world<<"<font color=teal><font size=3>The Espada Event is starting.Test your strength against the espadas of Las Noches.Join by going to the Event tab(You must be over 400 to join)You have 2 mins."
		lastevent=7
		eventon=1
		ppl=0
		for(var/mob/player/M in All_Clients())
			M.lost=0
		entry=1
		spawn(1 MINUTE)
			world<<"<font color=teal><font size=3>1 minute left to join the Espada event."
		sleep(1200)
		entry=0
		world<<"<font color=teal>The Espada Event has started."
		if(ppl<2)
			world<<"<font color=teal>Not enough players."
			eventon=0
			for(var/mob/player/L in All_Clients())
				if(L.lost)
					L.lost=0
					L.safe=0
			Start_Lost_Zan_Event()
			return
		for(var/mob/Espadas/Yo in world)
			del Yo
		new/mob/Espadas/C1(locate(rand(135,185),rand(125,155),19))
		new/mob/Espadas/C2(locate(rand(135,185),rand(125,155),19))
		new/mob/Espadas/C3(locate(rand(135,185),rand(125,155),19))
		new/mob/Espadas/C4(locate(rand(135,185),rand(125,155),19))
		new/mob/Espadas/C5(locate(rand(135,185),rand(125,155),19))
		new/mob/Espadas/C6(locate(rand(135,185),rand(125,155),19))
		new/mob/Espadas/C7(locate(rand(135,185),rand(125,155),19))
		new/mob/Espadas/C8(locate(rand(135,185),rand(125,155),19))
		espmish=8
		for(var/mob/player/M in All_Clients())
			if(M.lost==1)
				M.oldspot=M.loc
				M.inghouse=0
				M.loc=locate(rand(135,185),rand(125,155),19)
				M.safe=0
				M.frozen=0
				M.canattack=1
				M.protected=0
				M.lost=1
				M.wound=0
				M.dmgdone=0
				M.wnddone=0
				M.health=M.mhealth
				M.rei=M.mrei
				lostesp+=1
				M.attack+=(M.mattack/20)*M.olympics
				M.defence+=(M.mdefence/20)*M.olympics
				M.reiatsu+=(M.mreiatsu/20)*M.olympics
		Start_Lost_Zan_Event()
mob/verb
	Join_Lost_Zan_Event()
		set hidden=1
		if(!entry&&eventon)
			src<<"You missed registration, event has already started"
			return
		if(src.lost)
			src<<"You already joined"
			return
		if(src.gotthecharge)
			src<<"You can't join an event while holding the charge"
			return
		if(!eventon)
			src<<"There is no event on right now"
			return
		if(lastevent!=5)
			src<<"Wrong event, try again"
			return
		if(eventon)
			//if(usr.z==13||usr.z==14||usr.z==15||usr.z==16||usr.z==17||usr.z==10||usr.z==9||usr.z==8||usr.z==6)
			//	src<<"You're in the middle of something"
			//	return
		//	if(src.in_team)
		//		src<<"Not while in a party"
		//		return
			if(usr.z==6||usr.z==8||usr.z==10||usr.z==13||usr.z==14||usr.z==16||usr.z==20||usr.z==19&&usr.x>100&&usr.y>100)
				src<<"You're in the middle of something"
				return
			if(usr.level<=150)
				usr<<"You must be over level 150"
				return
			usr.inghouse=0
			usr.safe=0
			usr.frozen=0
			usr.canattack=1
			usr.canattacks=1
			usr.protected=0
			usr.see_invisible=2
			usr.ctf=1
			src.lost=1
			ppl+=1
			usr.loc=locate(152,194,16)
			usr.RemoveDonorStats()
	Leave_Event()
		set hidden=1
		if(!entry&&eventon)
			src<<"You missed registration, event has already started"
			return
		if(!src.lost)
			src<<"You're not in an event"
			return
		if(eventon)
			if(src.lost)
				src.lost=0
				ppl-=1
				usr.GiveDonorStats()
				usr<<"You're not in event anymore"
		//		if(lastevent==5)
				usr.Respawn()
		else
			src<<"There is no event on right now"

		if(src.intdm && !tdmstarted)
			src.intdm = 0
			src << "You left Team Deathmatch."
	Join_Vand_Event()// zag event
		set hidden=1
		if(!entry&&eventon)
			src<<"You missed registration, event has already started"
			return
		if(src.gotthecharge)
			src<<"You can't join an event while holding the charge"
			return
		if(src.lost)
			src<<"You already joined"
			return
		if(!eventon)
			src<<"There is no event on right now"
			return
		if(lastevent!=8)
			src<<"Wrong event, try again"
			return
		if(eventon)
			//	if(src.in_team)
		//		src<<"Not while in a party"
		//		return
			if(usr.z==6||usr.z==8||usr.z==10||usr.z==13||usr.z==14||usr.z==16||usr.z==20||usr.z==19&&usr.x>100&&usr.y>100)
				src<<"You're in the middle of something"
				return
			if(src.level<400)
				src<<"You must be level 400 or higher"
				return
			src.lost=1
			ppl+=1
			src<<"You're in the event you must wait a little!"
			online_admins<<"[src] joined the wand event."
	Join_Reigai_Event()
		set hidden=1
		if(!entry&&eventon)
			src<<"You missed registration, event has already started"
			return
		if(src.gotthecharge)
			src<<"You can't join an event while holding the charge"
			return
		if(src.lost)
			src<<"You already joined"
			return
		if(!eventon)
			src<<"There is no event on right now"
			return
		if(lastevent!=2)
			src<<"Wrong event, try again"
			return
		if(eventon)
			//if(usr.z==13||usr.z==14||usr.z==15||usr.z==16||usr.z==17||usr.z==10||usr.z==9||usr.z==8||usr.z==6)
			//	src<<"You're in the middle of something"
			//	return
			//	if(src.in_team)
		//		src<<"Not while in a party"
		//		return
			if(usr.z==6||usr.z==8||usr.z==10||usr.z==13||usr.z==14||usr.z==16||usr.z==20||usr.z==19&&usr.x>100&&usr.y>100)
				src<<"You're in the middle of something"
				return
			if(src.level<250)
				src<<"You're too weak"
				return
			src.lost=1
			ppl+=1
			usr.RemoveDonorStats()
			usr<<"You're in the event you must wait a little!"
	Join_Ichigo_Event()
		set hidden=1
		if(!entry&&eventon)
			src<<"You missed registration, event has already started"
			return
		if(src.lost)
			src<<"You already joined"
			return
		if(!eventon)
			src<<"There is no event on right now"
			return
		if(src.gotthecharge)
			src<<"You can't join an event while holding the charge"
			return
		if(lastevent!=4)
			src<<"Wrong event, try again"
			return
		if(eventon)
			//if(usr.z==13||usr.z==14||usr.z==15||usr.z==16||usr.z==17||usr.z==10||usr.z==9||usr.z==8||usr.z==6)
			//	src<<"You're in the middle of something"
			//	return
			//	if(src.in_team)
		//		src<<"Not while in a party"
		//		return
			if(usr.z==6||usr.z==8||usr.z==10||usr.z==13||usr.z==14||usr.z==16||usr.z==20||usr.z==19&&usr.x>100&&usr.y>100)
				src<<"You're in the middle of something"
				return
			if(src.level<350)
				usr<<"You must be level 350 or higher"
				return
			src.lost=1
			usr.RemoveDonorStats()
			ppl+=1
			src<<"You're in the event you must wait a little!"
	Join_Battle_Royale()
		set hidden=1
		if(!entry&&eventon)
			src<<"You missed registration, event has already started"
			return
		if(src.lost)
			src<<"You already joined"
			return
		if(!eventon)
			src<<"There is no event on right now"
			return
		if(src.gotthecharge)
			src<<"You can't join an event while holding the charge"
			return
		if(lastevent!=3)
			src<<"Wrong event, try again"
			return
		if(eventon)
			//if(usr.z==13||usr.z==14||usr.z==15||usr.z==16||usr.z==17||usr.z==10||usr.z==9||usr.z==8||usr.z==6)
			//	src<<"You're in the middle of something"
			//	return
			//	if(src.in_team)
		//		src<<"Not while in a party"
		//		return
			if(usr.z==6||usr.z==8||usr.z==10||usr.z==13||usr.z==14||usr.z==16||usr.z==20||usr.z==19&&usr.x>100&&usr.y>100)
				src<<"You're in the middle of something"
				return
			if(usr.level<400)//400
				usr<<"You must be over level 400"
				return
			usr.lost=1
			ppl+=1
			usr.RemoveDonorStats()
			usr<<"You're in the event you must wait a little!"
	Join_Vasto_Event()
		set hidden=1
		if(!entry&&eventon)
			src<<"You missed registration, event has already started"
			return
		if(src.lost)
			src<<"You already joined"
			return
		if(!eventon)
			src<<"There is no event on right now"
			return
		if(src.gotthecharge)
			src<<"You can't join an event while holding the charge"
			return
		if(lastevent!=1)
			src<<"Wrong event, try again"
			return
		if(eventon)
			//if(usr.z==13||usr.z==14||usr.z==15||usr.z==16||usr.z==17||usr.z==10||usr.z==9||usr.z==8||usr.z==6)
			//	src<<"You're in the middle of something"
			//	return
			//	if(src.in_team)
		//		src<<"Not while in a party"
		//		return
			if(usr.z==6||usr.z==8||usr.z==10||usr.z==13||usr.z==14||usr.z==16||usr.z==20||usr.z==19&&usr.x>100&&usr.y>100)
				src<<"You're in the middle of something"
				return
			if(src.level<400)
				src<<"You must be level 400 or higher"
				return
			src.lost=1
			ppl+=1
			usr.RemoveDonorStats()
			src<<"You're in the event you must wait a little!"
	Join_Race_War()
		set hidden=1
		if(!entry&&eventon)
			src<<"You missed registration, event has already started"
			return
		if(src.lost)
			src<<"You already joined"
			return
		if(!eventon)
			src<<"There is no event on right now"
			return
		if(src.gotthecharge)
			src<<"You can't join an event while holding the charge"
			return
		if(lastevent!=0)
			src<<"Wrong event, try again"
			return
		if(eventon)
			//if(usr.z==13||usr.z==14||usr.z==15||usr.z==16||usr.z==17||usr.z==10||usr.z==9||usr.z==8||usr.z==6)
			//	src<<"You're in the middle of something"
			//	return
			//	if(src.in_team)
		//		src<<"Not while in a party"
		//		return
			if(usr.z==6||usr.z==8||usr.z==10||usr.z==13||usr.z==14||usr.z==16||usr.z==20||usr.z==19&&usr.x>100&&usr.y>100)
				src<<"You're in the middle of something"
				return
			if(src.level<=250)
				src<<"You must be level 250 or higher"
				return
			src.lost=1
			src.safe=0
			src.inghouse=0
			src.frozen=0
			src.canattack=0
			usr.RemoveDonorStats()
			src.canattacks=1
			src.protected=1
			src.loc=locate(152,194,16)
			ppl+=1
			if(!src.race in races)
				races+=src.race
			src<<"You're in the event you must wait a little!"
	Join_Espada_Event()
		set hidden=1
		if(!entry&&eventon)
			src<<"You missed registration, event has already started"
			return
		if(src.lost)
			src<<"You already joined"
			return
		if(src.gotthecharge)
			src<<"You can't join an event while holding the charge"
			return
		if(!eventon)
			src<<"There is no event on right now"
			return
		if(lastevent!=7)
			src<<"Wrong event, try again"
			return
		if(eventon)
			//if(usr.z==13||usr.z==14||usr.z==15||usr.z==16||usr.z==17||usr.z==10||usr.z==9||usr.z==8||usr.z==6)
			//	src<<"You're in the middle of something"
			//	return
			//	if(src.in_team)
		//		src<<"Not while in a party"
		//		return
			if(usr.z==6||usr.z==8||usr.z==10||usr.z==13||usr.z==14||usr.z==16||usr.z==20||usr.z==19&&usr.x>100&&usr.y>100)
				src<<"You're in the middle of something"
				return
			if(src.level<400)
				src<<"You must be over level 400"
				return
			src.lost=1
			usr.safe=1
			usr.RemoveDonorStats()
			ppl+=1
			src<<"You're in the event you must wait a little!"
	Watch_Event()
		set hidden=1
		if(src.spectate==1)
			client.eye=client.mob
			src.spectate=0
			return
		var/list/li=new
		for(var/mob/player/x in All_Clients())
			if(x.lost)
				li+=x
			if(x.intdm)
				li+=x
			if(x.inffa)
				li+=x
		for(var/mob/Gotei_13/x in world)
			li+=x
		for(var/mob/Espadas/x in world)
			li+=x
		for(var/mob/Final_Getsuga_Tenshou/x in world)
			li+=x
		var/mob/spec=input3(usr,"Who do you wish to spectate","Spectate", li)
		if(spec)
			usr.spectate=1
			usr.client.eye=spec
			client.perspective=EYE_PERSPECTIVE
			usr<<"<font size=+1>Spectating. (Only your vision has changed, your character is still in the same spot.)</font>"
mob/Lost_Zan
	swordon=1
	maskuses=50
	iszan=1
	killable=1
	hostile=1
	enemy=1
	name="{Zanpaktou}Lost"
	legit=1
	New()
		..()
obj/lostspawn