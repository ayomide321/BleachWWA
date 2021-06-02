var/tmp
	ktraid=0
	lnraid=0
	ssraid=0
	uwraid=0
	list/raided=list()
mob/Party_Leader_Guild
	verb
		Raid()
			set category = "Party"
			set name = "Raid"
			if("[src.name]" in raided)
				src<<"You already raided this reboot"
				return
			if(src.level<600)
				src<<"You must be stronger to start a raid level [src.level]/600"
				return
			if(src.z==2||src.z==4||src.z==11||src.z==22)
				var/J = 0
				for(var/mob/player/M in view(8,src))
					if(M.teamid == src.teamid&&M.in_team)
						J += M.level
				if(J >= 2000)
					src.StartRaid()
					return
				else
					src<<"Your party isn't strong enough Level: [J]/2,000"
			else
				src<<"You can't raid this area"
mob/proc
	StartRaid()
		if(src.z==2)
			if(ktraid)
				src<<"There is already a raid here"
				return
			else
				ktraid=1
				world<< "<b><font color = lime>There is a raid on Karakura Town, the whole area is on Code Red"
				world<< "<b><font color = lime>The following people are raiding:"
				for(var/mob/player/M in world)
					if(M.teamid == src.teamid&&M.in_team)
						M.raid=2
						raided+="[M.name]"
						world<< "<b><font color = lime>[M]"
				sleep(9000)
				EndRaid(1)
		if(src.z==4)
			if(ssraid)
				src<<"There is already a raid here"
				return
			else
				ssraid=1
				world<< "<b><font color = lime>There is a raid on Soul Society, the whole area is on Code Red"
				world<< "<b><font color = lime>The following people are raiding:"
				for(var/mob/player/M in world)
					if(M.teamid == src.teamid&&M.in_team)
						M.raid=4
						raided+="[M.name]"
						world<< "<b><font color = lime>[M]"
				sleep(9000)
				EndRaid(2)
		if(src.z==11)
			if(lnraid)
				src<<"There is already a raid here"
				return
			else
				lnraid=1
				world<< "<b><font color = lime>There is a raid on Las Noches, the whole area is on Code Red"
				world<< "<b><font color = lime>The following people are raiding:"
				for(var/mob/player/M in world)
					if(M.teamid == src.teamid&&M.in_team)
						M.raid=11
						raided+="[M.name]"
						world<< "<b><font color = lime>[M]"
				sleep(9000)
				EndRaid(3)
		if(src.z==22)
			if(lnraid)
				src<<"There is already a raid here"
				return
			else
				uwraid=1
				world<< "<b><font color = lime>There is a raid on the underworld!"
				world<< "<b><font color = lime>The following people are raiding:"
				for(var/mob/player/M in world)
					if(M.teamid == src.teamid&&M.in_team)
						M.raid=22
						raided+="[M.name]"
						world<< "<b><font color = lime>[M]"
				sleep(9000)
				EndRaid(4)
	RaidStill()
		if(ktraid)
			var/J=0
			for(var/mob/player/M in world)
				if(M.raid==2)
					J=1
			if(J==0)
				world<< "<b><font color = lime>The raid on Karakura Town has stopped"
				ktraid=0
		if(ssraid)
			var/J=0
			for(var/mob/player/M in world)
				if(M.raid==4)
					J=1
			if(J==0)
				world<< "<b><font color = lime>The raid on Soul Society has stopped"
				ssraid=0
		if(lnraid)
			var/J=0
			for(var/mob/player/M in world)
				if(M.raid==11)
					J=1
			if(J==0)
				world<< "<b><font color = lime>The raid on Las Noches has stopped"
				lnraid=0
		if(uwraid)
			var/J=0
			for(var/mob/player/M in world)
				if(M.raid==22)
					J=1
			if(J==0)
				world<<"<b><font color = white>The raid on the UnderWorld has stopped"
				uwraid=0
	EndRaid(which)
		if(which==1)
			if(ktraid)
				for(var/mob/player/M in world)
					if(M.raid==2)
						world<< "<b><font color = lime>The raid on Karakura Town has stopped"
						ktraid=0
			else
				world<< "<b><font color = lime>Karakura Town can now be raided again"
		if(which==2)
			if(ssraid)
				for(var/mob/player/M in world)
					if(M.raid==4)
						world<< "<b><font color = lime>The raid on Soul Society has stopped"
						ssraid=0
			else
				world<< "<b><font color = lime>Soul Society can now be raided again"
		if(which==3)
			if(lnraid)
				for(var/mob/player/M in world)
					if(M.raid==11)
						world<< "<b><font color = lime>The raid on Las Noches has stopped"
						lnraid=0
			else
				world<< "<b><font color = lime>Las Noches can now be raided again"
		if(which==4)
			if(uwraid)
				for(var/mob/player/M in world)
					if(M.raid==22)
						world<< "<b><font color = white>The raid on the Under World has ended"
						uwraid=0
			else
				world<< "<b><font color = lime>The UnderWorld can be raided again"