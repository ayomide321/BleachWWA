mob/var
	ischip=0
	chip1=0
	chip1race=0
	chip1level=0
	chip1fstyle=0
	chip1zan=""
	chip1ress=""
	chip1fb=""
	chip1hair=0
	tmp/playingchips=0
mob/Chip_Manager
	npc=1
	verb/Talk()
		set category = "NPC's"
		set src in oview(2)
		if(usr.chip1)
			switch(input("Do you wish to upgrade your chip?", text) in list ("Yes","No"))
				if("Yes")
					if(!usr.chip1race)
						doit
						var/race = input("","What race would you like the chip?(Spell it properly, starting with a cap)") as text|null
						if(race=="Sub-Shinigami")race="Shinigami"
						if(race=="Arrancar")race="Hollow"
						if(race=="Vaizard")race="Shinigami"
						if(race!="Shinigami"&&race!="Quincy"&&race!="Sado"&&race!="Fullbringer"&&race!="Hollow")
							usr<<"Choose a proper race"
							goto doit
						usr.chip1race=race
					if(usr.chip1race=="Fullbringer"||usr.chip1race=="Hollow"||usr.chip1race=="Shinigami")
						switch(input("Do you wish to randomize a zan/fb for your chip?", text) in list ("Yes","No"))
							if("Yes")
								usr.chip1zan=usr.stype
								usr.chip1ress=usr.ressurectiontype
								usr.chip1fb=usr.ftype
					switch(input("What fighting style do you want your chip to have?", text) in list ("Normal","Range","Runner","Close-Range","Flash Stepper"))
						if("Normal")
							usr.chip1fstyle=0
						if("Flash Stepper")
							usr.chip1fstyle=1
						if("Range")
							usr.chip1fstyle=2
						if("Close-Range")
							usr.chip1fstyle=3
						if("Runner")
							usr.chip1fstyle=4
		else
			usr<<"Buy a chip first"
mob/Chips
turf/Chips
	Enter(A)
		if(ismob(A))
			usr.playingchips=1
			usr.loc=locate(src.x,src.y,src.z)
			var/turf/fd=get_step(usr,usr.dir)
			var/turf/fa=get_step(fd,usr.dir)
			usr.client.eye=locate(usr.x,fa.y,usr.z)
	Exit(A)
		if(ismob(A))
			usr.playingchips=0
			usr.client.eye=usr.client.mob
			..()
	verb/Insert_Chip()
		set src in oview(1)
		if(!usr.playingchips)return
		for(var/mob/Chips/G in world)
			if(G.owner==usr)
				del G
		var/mob/Chips/M=new/mob/Chips(locate(src.x,src.y+2,src.z))
		var/mob/O=usr
		M.ischip=1
		M.race=O.chip1race
		M.level=O.chip1level
		M.fstyle=O.chip1fstyle
		M.stype=O.chip1zan
		M.ressurectiontype=O.chip1ress
		M.ftype=O.chip1fb
		var/flevel=M.level
		M.mhealth=10000
		M.mhealth+=flevel*200
		M.health=M.mhealth
		M.mattack=100
		M.mattack+=flevel*2
		M.mdefence=100
		M.mdefence+=flevel*2
		M.mreiatsu=100
		M.mreiatsu+=flevel*2
		M.mrei=50
		M.mrei+=flevel*15