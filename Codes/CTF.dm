
mob
	Move()
		if(src.client)
			for(var/obj/Flags/F in get_step(src,src.dir))
				if(src.colorr=="Red")
					if(istype(F,/obj/Flags/Red))
						if(!src.flags&&F.opened==1)
							F:pickingup=1
							redcarry=src
							src.flags="red"
							src.Load_Overlays()
							del F
							src.Move(get_step(src,src.dir))
					if(istype(F,/obj/Flags/Blue))
						if(!src.flags)
							F:pickingup=1
							bluecarry=src
							src.flags="blue"
							src.Load_Overlays()
							for(var/mob/M in world)
								if(M != src)
									M<<Message("OtherCapture",src,rgb(255,0,0),0)
								else
									M<<Message("SrcCapture",src,rgb(255,0,0),0)
							del F
							src.Move(get_step(src,src.dir))
				else if(src.colorr=="Blue")
					if(istype(F,/obj/Flags/Blue))
						if(!src.flags&&F.opened==1)
							F:pickingup=1
							bluecarry=src
							src.flags="blue"
							src.Load_Overlays()
							del F
							src.Move(get_step(src,src.dir))
					if(istype(F,/obj/Flags/Red))
						if(!src.flags)
							F:pickingup=1
							redcarry=src
							src.flags="red"
							src.Load_Overlays()
							for(var/mob/M in world)
								if(M != src)
									M<<Message("OtherCapture",src,rgb(0,0,255),1)
								else
									M<<Message("SrcCapture",src,rgb(0,0,255),1)
							del F
							src.Move(get_step(src,src.dir))
		..()
mob
	Bump(O)
		..()
		if(istype(O,/obj/Health))
			if(!O:used)
				if(src.health < mhealth)
					O:used=1
					O:density=0
					src.hp=100
					O:icon_state=""
					src.Move(get_step(src,src.dir))
					spawn(rand(100,300))
						if(O:used)
							O:used=0
							O:density=1
							O:icon_state="HP"
obj
	Health
		icon='Icons/ctf.dmi'
		icon_state="HP"
		var/used=0
		density=1
	Flags
		icon='Icons/ctf.dmi'
		density=1
		var/pickingup=0
		Red
			icon_state="RFlag"
			name="Red Flag"
		Blue
			icon_state="BFlag"
			name="Blue Flag"
		Fuzzy
			icon='Icons/ctf.dmi'
			icon_state="YellowFuzzy"
			name="Place Flag Here"
			density=0
			var/id


area
	BlueFlag
		Entered(M)
			..()
			if(ismob(M))
				var/carry=0
				if(M:flags=="blue")
					var/mob/j=M
					j.flags=0
					j.Load_Overlays()
					var/obj/Flags/Blue/R = new()
					R.loc=locate(137, 139, 13)
					for(var/mob/A in world)
						A<<Message("Returned",M,rgb(0,0,255))
				if(M:flags=="red")
					var/mob/j=M
					var/i=0
					for(var/obj/Flags/Blue/l in world)
						if(l.x==137&&l.y==139)
							i+=1
					if(i==0)
						for(var/mob/A in world)
							if(A.ctf)
								A<<Message("NeedFlag",M,rgb(255,0,0))
						return
					j.flags=0
					j.Load_Overlays()
					carry=1
				if(carry)
					var/obj/Flags/Red/R = new()
					R.loc=locate(137, 13, 13)
					M:scores++
					if(bluescore<99 && bluescore<maxscore-1)
						bluescore++
						for(var/mob/A in world)
							if(A != M)
								A<<Message("OtherScore",M,M:colorr)
							else
								A<<Message("SrcScore",M,M:colorr)
							if(A.lost)
								A.wound=0
								A.health=A.mhealth
								A.Respawn(50)
					else
						bluescore++
						world<<Message("ReportScore")
						redscore=0
						bluescore=0
						for(var/mob/K in world)
							if(K.ctf==2&&K.colorr=="Blue")
								K.GainExp(K.mexp*7)
								var/catch2 = K.mexp*7
								K.GainMoney(150000)
								K.eventpoints+=15
								K.Level_Up()
								K<<"<b><font color=blue>You got [catch2] exp!"
								K<<"<b><font color=blue>You got $150,000"
								K<<"<b><font color=lime>You got 15 event points"
							else if(K.ctf==2&&K.colorr=="Red")
								K.GainExp(K.mexp*4)
								var/catch2 = K.mexp*4
								K.GainMoney(50000)
								K.eventpoints+=5
								K.Level_Up()
								K<<"<b><font color=red>You got [catch2] exp!"
								K<<"<b><font color=red>You got $50,000"
								K<<"<b><font color=lime>You got 5 event points"
						eventon=0
						world<<"<b><font color=blue>Blue team wins!"
						for(var/mob/X in world)
							if(X.ctf==2)
								X.attack=X.mattack
								X.reiatsu=X.mreiatsu
								X.defence=X.mdefence
								X.colorr=0
								X.ctf=0
								X.flags=0
								X.lost=0
								eventon=0
								X.Respawn()
								X.wound=0
								X.health=X.mhealth
	RedFlag
		Entered(M)
			..()
			if(ismob(M))
				var/carry=0
				if(M:flags=="red")
					var/mob/j=M
					j.flags=0
					j.Load_Overlays()
					var/obj/Flags/Red/R = new()
					R.loc=locate(137, 13, 13)
					for(var/mob/A in world)
						A<<Message("Returned",M,rgb(255,0,0))
				if(M:flags=="blue")
					var/mob/j=M
					var/i=0
					for(var/obj/Flags/Red/l in world)
						if(l.x==137&&l.y==13)
							i+=1
					if(i==0)
						for(var/mob/A in world)
							if(A.ctf)
								A<<Message("NeedFlag",M,rgb(0,0,255))
						return
					j.flags=0
					j.Load_Overlays()
					carry=1
				if(carry)
					var/obj/Flags/Blue/B = new()
					B.loc=locate(137, 139, 13)
					M:scores++
					if(redscore<99 && redscore<maxscore-1)
						redscore++
						for(var/mob/A in world)
							if(A != M)
								A<<Message("OtherScore",M,M:colorr)
							else
								A<<Message("SrcScore",M,M:colorr)
							if(A.lost)
								A.wound=0
								A.health=A.mhealth
								A.Respawn(50)
					else
						redscore++
						world<<Message("ReportScore")
						redscore=0
						bluescore=0
						for(var/mob/K in world)
							if(K.ctf==2&&K.colorr=="Red")
								K.GainExp(K.mexp*7)
								var/catch2 = K.mexp*7
								K.GainMoney(150000)
								K.eventpoints+=15
								K.Level_Up()
								K<<"<b><font color=red>You got [catch2] exp!"
								K<<"<b><font color=red>You got $150,000"
								K<<"<b><font color=lime>You got 15 event points"
							else if(K.ctf==2&&K.colorr=="Blue")
								K.GainExp(K.mexp*4)
								var/catch2 = K.mexp*4
								K.GainMoney(50000)
								K.eventpoints+=5
								K.Level_Up()
								K<<"<b><font color=red>You got [catch2] exp!"
								K<<"<b><font color=red>You got $50,000"
								K<<"<b><font color=lime>You got 5 event points"
						eventon=0
						world<<"<b><font color=red>Red team wins!"
						for(var/mob/X in world)
							if(X.ctf==2)
								X.lost=0
								X.colorr=0
								X.ctf=0
								X.flags=0
								X.attack=X.mattack
								X.reiatsu=X.mreiatsu
								X.defence=X.mdefence
								eventon=0
								X.Respawn()
								X.wound=0
								X.health=X.mhealth
mob
	Del()
		if(src:flags=="red")
			new/obj/Flags/Red(src.loc)
			for(var/mob/A in world)
				A<<Message("Logout",src,src:colorr)
		if(src:flags=="blue")
			new/obj/Flags/Blue(src.loc)
			for(var/mob/A in world)
				A<<Message("Logout",src,src:colorr)
		..()
var
	tmp/bluescore=0
	tmp/redscore=0
	maxscore=3
var
	global
		tmp/redcarry
		tmp/redreturning
		tmp/bluecarry
		tmp/bluereturning