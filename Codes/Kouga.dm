mob
	Kouga
		name = "{NPC}Kouga"
		enemy = 1
		level=400
		killable=1
		hostile=1
		rundelay = 0
		mhealth = 80000
		mattack = 4000
		mdefence = 4000
		mreiatsu = 4000
		mrei=6500
		health = 80000
		attack = 4000
		defence = 4000
		reiatsu = 4000
		rei=6500
		hair_type=7
		New()
			src.swordon=1
			src.cheating=-5000
			src.oldspot = src.loc
			spawn()src.Load_Overlays()
			legarmor=/obj/legarmor/l1
			..()
			spawn(2)
				src.Cheatmode()
mob
	var
		tmp/cheating=0
mob/proc
	Cheatmode()
		if(src.safe)
			return
		if(!src.inbankai)
			src<<"<b>You must be in bankai to use this move!"
			return
		if(src.cheating)
			src<<"<b>This skill is active!"
			return
		if(src.rei<600)
			src<<"<b>You need more rei [src.rei]/600!"
			return
		src.rei-=600
		var/obj/afterimage1/M=new/obj/afterimage1(src.loc)
		M.overlays=src.overlays
		M.icon=src.icon
		M.name=src.name
		walk(M,src.OppositeDirection())