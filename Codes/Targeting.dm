atom/proc/OppositeDirection()
	if(src.dir==1)	return 2
	if(src.dir==2)	return 1
	if(src.dir==4)	return 8
	if(src.dir==8)	return 4
	if(src.dir==5)	return 10
	if(src.dir==6)	return 9
	if(src.dir==9)	return 6
	if(src.dir==10)	return 5
//1=south2=north4=east0=west
atom/proc/DeflectionDirection()
	if(src.dir==1)	return pick(5,9)
	if(src.dir==2)	return pick(6,10)
	if(src.dir==4)	return pick(5,6)
	if(src.dir==8)	return pick(9,10)
	if(src.dir==5)	return pick(1,4)
	if(src.dir==6)	return pick(2,4)
	if(src.dir==9)	return pick(1,8)
	if(src.dir==10)	return pick(2,8)

atom/proc/ReverseDeflectionDirection()
	if(src.dir==1)	return pick(6,10)
	if(src.dir==2)	return pick(5,9)
	if(src.dir==4)	return pick(9,10)
	if(src.dir==8)	return pick(5,6)
	if(src.dir==5)	return pick(2,8)
	if(src.dir==6)	return pick(1,8)
	if(src.dir==9)	return pick(2,4)
	if(src.dir==10)	return pick(1,4)
mob/var
	tmp/mob/etarget
	target_graphic
atom/DblClick(turf/loca)
	..()

	if(!istype(loca,/turf))return
	var/i=0
	var/mob/e=0
	while(!e && i<3)
		for(var/mob/X in view(i,src))
			if(X!=usr)
				e=X



		i++

	if(e)
		if(istype(usr,/mob/player))

			for(var/obj/S in view(0,e))
				if(S.tousb==1)
					return
			var/mob/M = usr
			M.Untarget()
			M.etarget=e
			if(e.ispedal)
				M.etarget=null
				return
			if(e.isdisplay)
				M.etarget=null
				return
			if(M.client)
				var/image/I=image('Icons/tgt.dmi',e,"",30)
				I.name="TargetUnder";M.client<<I
				var/T = "Analyzed [e]: [e.frozen?"<b>Frozen</b> -- ":""]<b>[e.health]</b>/[e.mhealth] Health -- <b>[e.rei]</b>/[e.mrei] Rei -- <b>[e.wound]</b> Wound\s <br><b><font color=aqua>Guild:[e.guildname]</font></br>"
				var/difference=round(M.level/e.level *100)
				if(difference<25)
					T+="\nYou can't beat [e]!"
				else if(difference<50)
					T+="\nYou are way weaker than [e]."
				else if(difference<75)
					T+="\nYou are slightly weaker than [e]."
				else if(difference<120)
					T+="\nYou are similar in strength to [e]."
				else if(difference<140)
					T+="\nYou are slightly stronger than [e]."
				else if(difference<160)
					T+="\nYou are stronger than [e]."
				else if(difference<180)
					T+="\nYou are way stronger than [e]."
				else if(difference<200)
					T+="\nYou can demolish [e]."
				else
					T+="\nYou can demolish [e]!"
				M << T
				if(e.level<150&&e.client)
					M <<"<font color=red>[e] is a noob, don't kill him"
				if(M.inberserk)
					M.Berserks(e)
				for(var/mob/K in view(8,src))
					if(K.owner==M)
						K.Aggro(e)
					if(K.myclone==M)
						K.aggrod=0
						K.Aggro(e)
						src<<"You tell monsters to attack"

mob/verb/Untarget()
	set hidden=1
	if(src.client)	for(var/image/I in src.client.images)	if(I.name=="TargetUnder")	{src.client.images-=I;del I}
	src.etarget=null
	src<<"Untargeted"
	for(var/mob/K in view(8,src))
		if(K.myclone==src)
			K.aggrod=0
			K.aggro=0
			K.Approach(src)
			src<<"Your monsters are calm now"
	if(src.killclones)
		for(var/mob/K in view(8,src))
			if(K.myclone==src)
				del K
				src.aclones=0
				src<<"You have killed your monsters"
mob/verb/Target()
	set hidden=1
	var/mob/e=locate() in oview(3,src)
	if(e&&!e.ispedal&&!e.invisibility)
		var/mob/M = usr
		for(var/obj/S in view(0,e))
			if(S.tousb==1)
				return
		M.etarget=e
		if(M.client)
			for(var/image/I in src.client.images)	if(I.name=="TargetUnder")	{src.client.images-=I;del I}
			M.etarget=e
			var/image/I=image('Icons/tgt.dmi',e,"",30)
			I.name="TargetUnder";M.client<<I
			var/T = "Analyzed [e]: [e.frozen?"<b>Frozen</b> -- ":""]<b>[e.health]</b>/[e.mhealth] Health -- <b>[e.rei]</b>/[e.mrei] Rei -- <b>[e.wound]</b> Wound\s<br><font color=aqua>Guild:[e.guildname]</font></br>"
			var/difference=round(M.level/e.level *100)
			if(difference<25)
				T+="\nYou can't beat [e]!"
			else if(difference<50)
				T+="\nYou are way weaker than [e]."
			else if(difference<75)
				T+="\nYou are slightly weaker than [e]."
			else if(difference<120)
				T+="\nYou are similar in strength to [e]."
			else if(difference<140)
				T+="\nYou are slightly stronger than [e]."
			else if(difference<160)
				T+="\nYou are stronger than [e]."
			else if(difference<180)
				T+="\nYou are way stronger than [e]."
			else if(difference<200)
				T+="\nYou can demolish [e]."
			else
				T+="\nYou can demolish [e]!"
			M << T
			if(e.level<150&&e.client)
				M <<"<font color=red>[e] is a noob, don't kill him"
			if(M.inberserk)
				M.Berserks(e)
			for(var/mob/K in view(8,src))
				if(K.owner==M)
					K.Aggro(e)
				if(K.myclone==M)
					K.aggrod=0
					K.Aggro(e)
					src<<"You tell your monsters to attack!"

mob
	proc/Facedir(atom/x)
		src.dir = angle2dir(get_real_angle(src, x))
atom
	proc
		FaceTowards(atom/A)
			dir = angle2dir(get_real_angle(src, A))
proc/get_real_angle(atom/A, atom/B)
	var/dx = B.x - A.x
	var/dy = B.y - A.y
	//if(usr) usr << "get_real_angle([A], [B]): dx=[dx], dy=[dy]"
	return arctan2(dy, dx)
proc/_arctan(x)
	var/y=arcsin(x/sqrt(1+x*x))
	//if(usr) usr << "arctan([x]): y = [y]"
	if(x>=0) return y
	return -y

proc/arctan2(dy, dx)
	//if(usr) usr << "arctan2([dy], [dx]):"
	if(dy == 0)
		if(dx > 0)
			//if(usr) usr << "	return 0"
			return 0
		else if(dx == 0)
			//if(usr) usr << "	return 0"
			return 0
		else
			//if(usr) usr << "	return 180"
			return 180
	if(dx == 0)
		if(dy > 0)
			//if(usr) usr << "	return 90"
			return 90
		else if(dy == 0)
			//if(usr) usr << "	return 0"
			return 0
		else
			//if(usr) usr << "	return -90"
			return -90
	else
		var/angle = _arctan(dy/dx)
		if(dx < 0)
			angle = 180 - angle
		if(dy < 0)
			angle = -angle
		//if(usr) usr << "	return [angle]"
		return angle
proc
	dir2ref(d)
		switch(d)
			if(NORTH)//NORTH
				return 1
			if(NORTHEAST)//NORTHEAST
				return 2
			if(EAST)//EAST
				return 3
			if(SOUTHEAST)//SOUTHEAST
				return 4
			if(SOUTH)//SOUTH
				return 5
			if(SOUTHWEST)//SOUTHWEST
				return 6
			if(WEST)//WEST
				return 7
			if(NORTHWEST)//NORTHWEST
				return 8

	dir2angle(d)
		switch(d)
			if(NORTH)//NORTH
				return 90
			if(NORTHEAST)//NORTHEAST
				return 45
			if(EAST)//EAST
				return 0
			if(SOUTHEAST)//SOUTHEAST
				return -45
			if(SOUTH)//SOUTH
				return -90
			if(SOUTHWEST)//SOUTHWEST
				return -135
			if(WEST)//WEST
				return 180
			if(NORTHWEST)//NORTHWEST
				return 135

	angle2dir(angle)
		angle = normalize_angle(angle)
		switch(angle)
			if(-180 to -157.5, 157.5 to 180)
				return WEST
			if(-157.5 to -112.5)
				return SOUTHWEST
			if(-112.5 to -67.5)
				return SOUTH
			if(-67.5 to -22.5)
				return SOUTHEAST
			if(-22.5 to 22.5)
				return EAST
			if(22.5 to 67.5)
				return NORTHEAST
			if(67.5 to 112.5)
				return NORTH
			if(112.5 to 157.5)
				return NORTHWEST

	normalize_angle(angle)
		while(angle > 180)
			angle -= 360
		while(angle <= -180)
			angle += 360
		return angle
