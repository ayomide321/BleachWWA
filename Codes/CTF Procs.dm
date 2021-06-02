
mob
	CTF
		verb
			Leave_Capture_the_Flag()
				set category="Commands"
				usr.loc=locate(15,190,1)
				usr.ctf=0
				usr.verbs-=/mob/CTF/verb/Leave_Capture_the_Flag

			Join_Capture_the_Flag()
				set category="Commands"
				usr.frozen=0
				usr.see_invisible=0
				usr.ctf=1
				usr.verbs-=/mob/CTF/verb/Join_Capture_the_Flag
				usr.loc=locate(152,194,16)

			Watch_Capture_the_Flag()
				set category="Commands"
				if(usr.spectate==1)
					client.eye=client.mob
					usr.spectate=0
					return
				var/list/li=new
				for(var/mob/x in world)
					if(x.ctf==2)
						li+=x
				var/mob/spec=input3(usr,"Who do you wish to spectate","Spectate", li)
				if(spec)
					usr.spectate=1
					usr.client.eye=spec
					client.perspective=EYE_PERSPECTIVE
					usr<<"<font size=+1>Spectating, Hit Space to return. (Only your vision has changed, your character is still in the same spot.)</font>"
var
	lastcolorr
mob
	GM5
		verb
			StartCTF()
				set category="Real GM"
				world<<"<font color = teal>[usr.name] has decided to host Capture the Flag.</span>"
				for(var/mob/s in world)
					s.verbs += typesof(/mob/CTF/verb)
				world<<"<font color = teal>Capture the Flag has been started. If you want to join you have <em>1 minutes</em> to register! You will be healed automatically when it starts!</span>"
				sleep(600)
				world<<"<font color = teal>Capture the Flag enlistment has ended.</span>"
				for(var/mob/m in world)
					if(m.ctf==1)
						m.CTF()
				sleep(15)
				world<<"<font size=3>RED TEAM."
				for(var/mob/M in world)
					if(M.colorr=="Red"&&M.ctf)
						world << "<font color=red>[M]"
				world<<"<font size=3>BLUE TEAM."
				for(var/mob/M in world)
					if(M.colorr=="Blue"&&M.ctf)
						world << "<font color=blue>[M]"
obj/redspawn
obj/bluespawn
mob
	proc
		CTF()
			sleep(-1)
			if(src.ctf==1)
				src.ctf=2
				src.wound=0
				src.health=src.mhealth
				src.rei=src.mrei
				src.safe=0
				if(src.colorr=="Red")
					src.colorr="Red"
					src<<"<font size=+1>You're on the Red Team!"
					var/list/spawnpoints=new
					for(var/obj/redspawn/Xx in world)
						var/turf/L=Xx.loc

						spawnpoints+=L
					var/obj/ey=pick(spawnpoints)
					src.loc=locate(ey.x,ey.y,ey.z)
				else
					src.colorr="Blue"
					src<<"<font size=+1>You're on the Blue Team!"
					var/list/spawnpoints=new
					for(var/obj/bluespawn/Xx in world)
						var/turf/L=Xx.loc

						spawnpoints+=L
					var/obj/ey=pick(spawnpoints)
					src.loc=locate(ey.x,ey.y,ey.z)
obj/var
	opened=0
mob
	var
//colorr Format: 1=Red 0=Blue
		tmp/colorr=0
		tmp/ctf=0
		tmp/flags=0
		movement=0
		spectator=0
		returnarea=0
		hp=100
		eyex=5
		eyey=5
		watch
		scores=0
proc
	Message(action,M as mob,colorr,flag)
		var/Return="<font color=red><TT>No action found to return."
		var/Flag
		switch(action)
			if("Logout")
				var/F="Blue"
				if(colorr)
					F="Red"
				Return="<font color=[colorr]><b>[F] dropped flag!"
			if("Returned")
				var/F="Blue"
				if(colorr)
					F="Red"
				Return="<font color=[colorr]><b>[F] flag returned!"
			if("SrcScore")
				var/C=rgb(0,0,255)
				if(colorr)
					C=rgb(255,0,0)
				Return="<font color=[C]><b>You scored!"
				Return+="\n"
				Return+="<b><font color=[rgb(255,0,0)]>Red: [redscore] / [maxscore]"
				Return+="\n"
				Return+="<b><font color=[rgb(0,0,255)]>Blue: [bluescore] / [maxscore]"
			if("OtherScore")
				var/C=rgb(0,0,255)
				var/Team="Blue"
				if(colorr)
					C=rgb(255,0,0)
					Team="Red"
				Return="<font color=[C]><b>[M] has scored for the [Team] team!"
				Return+="\n"
				Return+="<b><font color=[rgb(255,0,0)]>Red: [redscore] / [maxscore]"
				Return+="\n"
				Return+="<b><font color=[rgb(0,0,255)]>Blue: [bluescore] / [maxscore]"
			if("SrcKill")
				Return="<font color=[colorr]><b>You killed [M]!"
			if("NeedFlag")
				Return="<font color=[colorr]><b>[M] needs the [colorr] flag to score for his team!"
			if("Killed")
				Return="<font color=[colorr]><b>Killed by [M]!"
			if("OtherCapture")
				if(flag)
					Flag="red"
				else
					Flag="blue"
				Return="<b><font color=[colorr]>[M] has captured the [Flag] flag!"
			if("SrcCapture")
				if(flag)
					Flag="red"
				else
					Flag="blue"
				Return="<b><font color=[colorr]>You captured the [Flag] flag!"
			if("ReportScore")
				Return="<b><font color=[rgb(255,0,0)]>Red: [redscore] / [maxscore]"
				Return+="\n"
				Return+="<b><font color=[rgb(0,0,255)]>Blue: [bluescore] / [maxscore]"
		return Return

mob
	verb
		Stop_Watching()
			set hidden=1
			src.watch=0