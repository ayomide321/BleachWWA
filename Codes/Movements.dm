mob/proc/AddMovementMacros()
	winset(src,"ID.MoveNorth","parent=macro;name=W;command=MoveNorth")
	winset(src,"ID.StopNorth","parent=macro;name=W+UP;command=StopNorth")
	winset(src,"ID.MoveSouth","parent=macro;name=S;command=MoveSouth")
	winset(src,"ID.StopSouth","parent=macro;name=S+UP;command=StopSouth")
	winset(src,"ID.MoveEast","parent=macro;name=D;command=MoveEast")
	winset(src,"ID.StopEast","parent=macro;name=D+UP;command=StopEast")
	winset(src,"ID.MoveWest","parent=macro;name=A;command=MoveWest")
	winset(src,"ID.StopWest","parent=macro;name=A+UP;command=StopWest")

	winset(src,"ID.MoveNorthA","parent=macro;name=NORTH;command=MoveNorth")
	winset(src,"ID.StopNorthA","parent=macro;name=NORTH+UP;command=StopNorth")
	winset(src,"ID.MoveSouthA","parent=macro;name=SOUTH;command=MoveSouth")
	winset(src,"ID.StopSouthA","parent=macro;name=SOUTH+UP;command=StopSouth")
	winset(src,"ID.MoveEastA","parent=macro;name=EAST;command=MoveEast")
	winset(src,"ID.StopEastA","parent=macro;name=EAST+UP;command=StopEast")
	winset(src,"ID.MoveWestA","parent=macro;name=WEST;command=MoveWest")
	winset(src,"ID.StopWestA","parent=macro;name=WEST+UP;command=StopWest")
mob/var/movement_map
client
	West()
		if(mob.movement_map)
			var/dir = mob.movement_map["[WEST]"]
			step(mob, dir)
			return
		..()

	East()
		if(mob.movement_map)
			var/dir = mob.movement_map["[EAST]"]
			step(mob, dir)
			return
		..()

	North()
		if(mob.movement_map)
			var/dir = mob.movement_map["[NORTH]"]
			step(mob, dir)
			return
		..()

	South()
		if(mob.movement_map)
			var/dir = mob.movement_map["[SOUTH]"]
			step(mob, dir)
			return
		..()

	Southeast()
		if(mob.movement_map)
			var/dir = mob.movement_map["[SOUTHEAST]"]
			step(mob, dir)
			return
		..()

	Northeast()
		if(mob.movement_map)
			var/dir = mob.movement_map["[NORTHEAST]"]
			step(mob, dir)
			return
		..()

	Southwest()
		if(mob.movement_map)
			var/dir = mob.movement_map["[SOUTHWEST]"]
			step(mob, dir)
			return
		..()

	Northwest()
		/*if(src.mob.controlmob)
			step(mob.controlmob,NORTHWEST)
			return
		if(src.mob.Primary)
			if(get_step(src.mob.Primary,NORTHWEST) in oview(20,src.mob))
				step(src.mob.Primary,NORTHWEST)
				return

		var/mob/user=src.mob
		if(user &&user.pixel_y<0)
			user.pixel_y-=user.pixel_y/abs(user.pixel_y) *min(8,abs(user.pixel_y))
		if(user &&user.pixel_x>0)
			user.pixel_x-=user.pixel_x/abs(user.pixel_x) *min(8,abs(user.pixel_x))*/

		if(mob.movement_map)
			var/dir = mob.movement_map["[NORTHWEST]"]
			step(mob, dir)
			return
		..()
mob/var
	tmp/Moving
	MN;MS;ME;MW
	QueN;QueS;QueE;QueW
	MovementSpeed=2

mob/proc/CancelMovement()
	src.MN=0;src.MS=0;src.MW=0;src.ME=0

mob/proc/MovementLoop()
	if(src.Moving)	return
	if(src.rushing)return
	if(src.controlled)return
	if(src.smooth>0)return
	else	src.Moving=1
	walk(src,0)
	for(var/mob/m in oview(8,src))
		if(m.enemy)
			if(!m.activated)
				m.activated=1
				spawn()m.AI()
	var/FirstStep=1
	//while(src.MN || src.ME || src.MW || src.MS || src.QueN || src.QueS || src.QueE || src.QueW)
/*
		if(src.MN || src.QueN)
			if(src.ME || src.QueE)	if(!step(src,NORTHEAST) && !step(src,NORTH))	step(src,EAST)
			else if(src.MW || src.QueW)	if(!step(src,NORTHWEST) && !step(src,NORTH))	step(src,WEST)
			else	step(src,NORTH)
		else	if(src.MS || src.QueS)
			if(src.ME || src.QueE)	if(!step(src,SOUTHEAST) && !step(src,SOUTH))	step(src,EAST)
			else if(src.MW || src.QueW)	if(!step(src,SOUTHWEST) && !step(src,SOUTH))	step(src,WEST)
			else	step(src,SOUTH)
		else	if(src.ME || src.QueE)	step(src,EAST)
		else	if(src.MW || src.QueW)	step(src,WEST)
		src.QueN=0;src.QueS=0;src.QueE=0;src.QueW=0
		if(FirstStep)	{sleep(1);FirstStep=0}
		if(src.rundelay<=0)src.rundelay=1
		sleep(src.rundelay)
	src.Moving=0*/
	while(src.MN || src.ME || src.MW || src.MS || src.QueN || src.QueS || src.QueE || src.QueW)
		if(src.MN || src.QueN)
			if(src.ME || src.QueE)	step(src,NORTHEAST)//if(!step(src,NORTHEAST) && !step(src,NORTH))	step(src,EAST)
			else if(src.MW || src.QueW)	step(src,NORTHWEST)//if(!step(src,NORTHWEST) && !step(src,NORTH))	step(src,WEST)
			else	step(src,NORTH)
		else	if(src.MS || src.QueS)
			if(src.ME || src.QueE)	step(src,SOUTHEAST)//if(!step(src,SOUTHEAST) && !step(src,SOUTH))	step(src,EAST)
			else if(src.MW || src.QueW)	step(src,SOUTHWEST)//if(!step(src,SOUTHWEST) && !step(src,SOUTH))	step(src,WEST)
			else	step(src,SOUTH)
		else	if(src.ME || src.QueE)	step(src,EAST)
		else	if(src.MW || src.QueW)	step(src,WEST)
		src.QueN=0;src.QueS=0;src.QueE=0;src.QueW=0
		if(FirstStep)	{sleep(1);FirstStep=0}
		if(src.rundelay<=0)src.rundelay=1
		sleep(src.rundelay)
	src.Moving=0

mob/verb
	MoveNorth()
		set hidden=1;set instant=1
		if(src.charging)
			src.dir=NORTH
			return
		if(src.confused||src.beer3||src.shinjiDissed)
			var/k=pick(1,2,3,4)
			if(k==1)
				src.MN=1;src.MS=0;QueN=1;src.MovementLoop()
			if(k==2)
				src.MN=0;src.MS=1;QueS=1;src.MovementLoop()
			if(k==3)
				src.ME=1;src.MW=0;QueE=1;src.MovementLoop()
			if(k==4)
				src.ME=0;src.MW=1;QueW=1;src.MovementLoop()
			return
		src.MN=1;src.MS=0;QueN=1;src.MovementLoop()
	StopNorth()
		set hidden=1;set instant=1
		src.MN=0

	MoveSouth()
		set hidden=1;set instant=1
		if(src.charging)
			src.dir=SOUTH
			return
		if(src.confused||src.beer3||src.shinjiDissed)
			var/k=pick(1,2,3,4)
			if(k==1)
				src.MN=1;src.MS=0;QueN=1;src.MovementLoop()
			if(k==2)
				src.MN=0;src.MS=1;QueS=1;src.MovementLoop()
			if(k==3)
				src.ME=1;src.MW=0;QueE=1;src.MovementLoop()
			if(k==4)
				src.ME=0;src.MW=1;QueW=1;src.MovementLoop()
			return
		src.MN=0;src.MS=1;QueS=1;src.MovementLoop()
	StopSouth()
		set hidden=1;set instant=1
		src.MS=0

	MoveEast()
		set hidden=1;set instant=1
		if(src.charging)
			src.dir=EAST
			return
		if(src.confused||src.beer3||src.shinjiDissed)
			var/k=pick(1,2,3,4)
			if(k==1)
				src.MN=1;src.MS=0;QueN=1;src.MovementLoop()
			if(k==2)
				src.MN=0;src.MS=1;QueS=1;src.MovementLoop()
			if(k==3)
				src.ME=1;src.MW=0;QueE=1;src.MovementLoop()
			if(k==4)
				src.ME=0;src.MW=1;QueW=1;src.MovementLoop()
			return
		src.ME=1;src.MW=0;QueE=1;src.MovementLoop()
	StopEast()
		set hidden=1;set instant=1
		src.ME=0

	MoveWest()
		set hidden=1;set instant=1
		if(src.charging)
			src.dir=WEST
			return
		if(src.confused||src.beer3||src.shinjiDissed)
			var/k=pick(1,2,3,4)
			if(k==1)
				src.MN=1;src.MS=0;QueN=1;src.MovementLoop()
			if(k==2)
				src.MN=0;src.MS=1;QueS=1;src.MovementLoop()
			if(k==3)
				src.ME=1;src.MW=0;QueE=1;src.MovementLoop()
			if(k==4)
				src.ME=0;src.MW=1;QueW=1;src.MovementLoop()
			return
		src.ME=0;src.MW=1;QueW=1;src.MovementLoop()
	StopWest()
		set hidden=1;set instant=1
		src.MW=0