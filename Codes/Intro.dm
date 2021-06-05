mob/proc
	Talks(msg)
		src.Say(msg)
mob/Storyline
	Stark
		name = "{NPC}Stark"
		npc=1
		race="Arrancar"
		level=1100
		rundelay = 0
		mhealth = 80000
		health = 80000
		mattack = 10500
		mdefence = 10500
		mreiatsu = 10500
		mrei=50000
		rei=50000
		healthwas = 80000
		ressurectiontype="Shooter"
		hair_blue=0
		hair_green=0
		hair_red=0
		hair_type=8
		cerored=20
		cerogreen=50
		ceroblue=150
		arrancarmask=10
		cloak=/obj/cloak/espada/e2
		ressurection=1
		New()
			..()
			spawn(34)
			del src
	Shonshui
		name = "{NPC}Shunsui Kyoraku"
		npc=1
		mhealth=20000
		rundelay = 0
		mhealth = 80000
		health = 80000
		mattack = 10500
		mdefence = 10500
		mreiatsu = 10500
		mrei=50000
		rei=50000
		healthwas = 80000
		New()
			src.icon_name="Base"
			src.hair_type=5
			src.rei=src.mrei
			src.reiatsu=src.mreiatsu
			src.health=src.mhealth
			src.attack=src.mattack
			src.defence=src.mdefence
			src.swordon=1
			src.stype="Shonshui"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/shinigami/s1
			src.cloak=/obj/cloak/captain/c1
			src.inshikai=1
			..()
			spawn(24)
			del src
	Kenpachi
		name = "{NPC}Kenpachi Zaraki"
		npc=1
		mhealth=20000
		rundelay = 0
		mhealth = 80000
		health = 80000
		mattack = 2500
		mdefence = 2500
		mreiatsu = 2500
		mrei=50000
		rei=50000
		healthwas = 80000
		wound=101
		hair_type=5
		icon_name="Base"
		New()
			src.rei=src.mrei
			src.reiatsu=src.mreiatsu
			src.health=src.mhealth
			src.attack=src.mattack
			src.defence=src.mdefence
			src.swordon=1
			src.stype="Shonshui"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.cloak=/obj/cloak/captain/c1
			src.inbankai=1
			..()
			spawn(300)
			del src
	Grimmjow
		name = "{NPC}Grimmjow"
		npc=1
		rei=10000
		mrei=10000
		hair_blue=255
		hair_green=102
		hair_red=0
		hair_type=7
		cerored=50
		ceroblue=50
		cerogreen=150
		arrancarmask=13
		cloak=/obj/cloak/espada/e2
		weapon=/obj/weapon/sword
		ressurectiontype="Pantera"
		ressurection=1
		New()
			..()
			spawn(24)
			del src
	IchigoFinal
		name = "{NPC}Ichigo(Final)"
		rundelay = 1
		level=1000
		mask=2
		maskon=1
		killable=1
		hostile=1
		wound=0
		mreiatsu=10500
		mrei = 6000
		spawntime = 500
		expgain = 16000
		mattack = 10500
		mhealth = 105000
		mdefence = 10500
		healthwas = 105000
		New()
			src.icon_name="BaseTan"
			src.hair_type=8
			src.hair_red=255
			src.hair_green=106
			src.hair_blue=0
			src.rei=src.mrei
			src.health=src.mhealth
			src.attack=src.mattack
			src.defence=src.mdefence
			src.reiatsu=src.mreiatsu
			src.swordon=1
			src.stype="Ichigo"
			src.swordcall="Tensa"
			src.swordname="Zangetsu!"
			src.inbankai=1
			src.overshirt=/obj/overshirt/shinigami/s1
			..()
			spawn(24)
			del src
	Ulquiorra
		icon = 'Aizen.dmi'
		name = "{NPC}Ulquiorra"
		npc = 1
		rei=10000
		mrei=10000
		hair_blue=0
		hair_green=0
		hair_red=0
		hair_type=8
		arrancarmask=14
		ressurectiontype="Ulq"
		cloak=/obj/cloak/espada/e2
		weapon=/obj/weapon/sword
		New()
			..()
			spawn(2)
			src.icon='Icons/HollowSelf.dmi'
			spawn(50)
			del src
	IshidaFinal
		name = "{NPC}Ishida(Final)"
		rundelay = 1
		level=1000
		race="Quincy"
		gotfinal2=1
		mreiatsu=10500
		mrei = 6000
		spawntime = 500
		finalb=1
		expgain = 16000
		mattack = 10500
		mhealth = 105000
		mdefence = 10500
		healthwas = 105000
		New()
			src.icon_name="BaseTan"
			src.hair_type=9
			src.hair_red=0
			src.hair_green=0
			src.hair_blue=0
			src.rei=src.mrei
			src.health=src.mhealth
			src.attack=src.mattack
			src.defence=src.mdefence
			src.reiatsu=src.mreiatsu
			src.shoes=/obj/Shoes/black
			src.pants=/obj/Pants/black
			src.overshirt=/obj/overshirt/quincy/s1
			src.bowon=1
			src.oldspot = src.loc
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
			spawn(30)
			del src
	Renji
		name = "{NPC}Renji"
		rundelay = 1
		mhealth = 40000
		health = 40000
		level=400
		race="Shinigami"
		mattack = 4000
		mdefence = 4000
		attack = 4000
		defence = 4000
		reiatsu = 4000
		mreiatsu = 4000
		mrei = 6000
		rei = 6000
		spawntime = 600
		healthwas = 40000
		inbankai=1
		New()
			src.icon_name="BaseTan"
			src.hair_type=12
			src.hair_red=150
			src.hair_green=0
			src.hair_blue=0
			src.swordon=1
			src.stype="Renji"
			src.swordcall="Howl"
			src.swordname="Zabimaru"
			src.weapon=/obj/weapon/sword
			src.oldspot = src.loc
			src.overshirt=/obj/overshirt/shinigami/s1
			src.facearmor=/obj/facearmor/s1
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
			spawn(30)
			del src
	SadoFinal
		name = "{NPC}Sado(Final)"
		rundelay = 1
		level=1000
		wound=0
		mreiatsu=10500
		mrei = 6000
		spawntime = 500
		expgain = 16000
		mattack = 10500
		mhealth = 105000
		mdefence = 10500
		armon=4
		healthwas = 105000
		New()
			src.icon_name="BaseTan"
			src.hair_type=14
			src.hair_red=0
			src.hair_green=0
			src.hair_blue=0
			src.rei=src.mrei
			src.health=src.mhealth
			src.attack=src.mattack
			src.defence=src.mdefence
			src.reiatsu=src.mreiatsu
			src.shirt=/obj/Shirt/white
			src.shoes=/obj/Shoes/black
			src.pants=/obj/Pants/black
			src.oldspot = src.loc
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
			spawn(30)
			del src
	Zommari
		name = "{NPC}Zommari"
		npc = 1
		hair_blue=190
		hair_green=190
		hair_red=190
		hair_type=0
		arrancarmask=3
		cloak=/obj/cloak/espada/e2
		ressurection=1
		ressurectiontype="Zommari"
		icon_name="BaseBlack"
		New()
			..()
			spawn(77)
			del src
	Byakuya
		npc = 1
		rei=50000
		mrei=50000
		New()
			..()
			src.icon_name="BaseTan"
			src.overshirt=/obj/overshirt/shinigami/s1
			src.cloak=/obj/cloak/captain/c1
			src.inbankai=1
			src.stype="Byakuya"
			src.hair_type=13
			src.Load_Overlays()
			src.Affirm_Icon()
			spawn(88)
			del src
	Friendly_Arrancar
		npc=1
		New()
			src.oldspot = src.loc
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.arrancarmask=rand(1,17)
			src.overshirt=pick(/obj/cloak/espada/e1,/obj/cloak/espada/e2)
			src.weapon=/obj/weapon/sword
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
			spawn(50)
			del src
	Friendly_Arrancar2
		npc=1
		New()
			src.oldspot = src.loc
			src.icon_name=pick("Base","BaseTan","BaseBlack")
			src.HairGen()
			src.arrancarmask=rand(1,17)
			src.overshirt=pick(/obj/cloak/espada/e1,/obj/cloak/espada/e2)
			src.weapon=/obj/weapon/sword
			spawn()src.Affirm_Icon()
			spawn()src.Load_Overlays()
			..()
			spawn(324)
			del src
mob/proc
	Hollow_Story()
		if(!src.didityet)
			//var/sound/dd = sound('Bleach Soundtrack - Encirclement Bat.wav',volume=50)
			//view(src) << dd
			src.Story_Talk("You have entered the world of bleach and you realize your lost in a huge wasteland of sand when suddely...")
			src.curpart="Part 1: The outbreak and the mysterious Arrancar"
			src.curmis="Train to level 100"
			src.storycom=5
			src.didityet=1
			src.rundelay=0
			src.controlled=1
			src.loc=locate(47,8,8)
			var/mob/M=new/mob/Storyline/Stark(locate(src.x+6,src.y,8))
			src.instinct=100
			M.dir=WEST
			src.dir=EAST
			M.Cero()
			sleep(8)
			walk(src,WEST,1)
			sleep(8)
			walk(src,0)
			M.loc=locate(src.x-2,src.y,src.z)
			M.dir=EAST
			flick("shun",M)
			M.Talks("Where do you think you're going?")
			sleep(10)
			M.cerocd=0
			M.Cero()
			walk(src,EAST,1)
			sleep(8)
			var/mob/A=new/mob/Storyline/Shonshui(locate(src.x-1,src.y,8))
			flick("shun",A)
			A.Talks("Leave I'll take care of this.")
			walk(src,NORTHEAST,1)
			var/mob/B=new/mob/Storyline/Grimmjow(locate(src.x+6,src.y+12,8))
			var/mob/C=new/mob/Storyline/IchigoFinal(locate(src.x+10,src.y+12,8))
			B.dir=EAST
			C.dir=WEST
			sleep(8)
			B.Talks("I'm King!")
			B.Desgarron()
			walk(src,0)
			var/mob/L=new/mob/Storyline/Ulquiorra(locate(src.x-12,src.y,8))
			L.dir=WEST
			sleep(6)
			walk(src,WEST,1)
			sleep(8)
			walk(src,0)
			L.Ressurection()
			L.Talks("This is my ressurection")
			var/mob/D=new/mob/Storyline/IshidaFinal(locate(src.x-4,src.y+10,8))
			var/mob/Da=new/mob/Storyline/IshidaFinal(locate(src.x,src.y+10,8))
			var/mob/Db=new/mob/Storyline/IshidaFinal(locate(src.x+4,src.y+10,8))
			D.dir=NORTH
			Da.dir=NORTH
			Db.dir=NORTH
			var/mob/E=new/mob/Storyline/Renji(locate(src.x-4,src.y+13,8))
			var/mob/Ea=new/mob/Storyline/Renji(locate(src.x,src.y+13,8))
			var/mob/Eb=new/mob/Storyline/Renji(locate(src.x+4,src.y+13,8))
			sleep(5)
			walk(src,NORTH,1)
			sleep(8)
			walk(src,0)
			Ea.Talks("Szayel created clones of us")
			sleep(8)
			walk(src,EAST,1)
			var/mob/F=new/mob/Storyline/SadoFinal(locate(src.x+12,src.y,8))
			var/mob/Gr=new/mob/shinigaminormal(locate(src.x+13,src.y,8))
			F.frozen=1
			Gr.icon_state="dead"
			sleep(8)
			walk(src,0)
			del L
			del D
			del Da
			del Db
			del E
			del Ea
			del Eb
			F.Talks("La Muerte")
			flick("punch",F)
			new/obj/Lamuertenew/a2(Gr.loc)
			var/mob/H=new/mob/Storyline/Byakuya(locate(src.x,src.y+14,8))
			var/mob/I=new/mob/Storyline/Zommari(locate(src.x,src.y+11,8))
			I.dir=NORTH
			I.protected=1
			H.etarget=I
			walk(src,NORTH,1)
			sleep(8)
			walk(src,0)
			del F
			del Gr
			I.Talks("I won't be defeated")
			sleep(4)
			H.Pivotal_Scene()
			sleep(8)
			flick("shun",I)
			H.Talks("Never underestimate me")
			H.dir=NORTH
			walk(src,EAST,1)
			sleep(12)
			walk(src,0)
			del H
			var/mob/J=new/mob/Storyline/Friendly_Arrancar(locate(src.x+2,src.y,8))
			flick("shun",J)
			J.Talks("Hello, it's been very chaotic lately")
			sleep(10)
			J.Talks("I'll give you this exp pill, a guide and take you somewhere safe until you learn how to survive")
			sleep(30)
			src.safe=0
			src.firing=0
			usr.loc = locate(56,150,5)
			sleep(9)
		//	src.GoCust3()
			del J
			src.exp=src.mexp+1
			var/gdif=48
			//if(src.key=="Critical172")
			//	gdif=99
			src.level=gdif
			src.rawbuff+=gdif*2
			src.mattack+=gdif*2
			src.attack+=gdif*2
			src.mdefence+=gdif*2
			src.defence+=gdif*2
			src.mreiatsu+=gdif*2
			src.reiatsu+=gdif*2
			src.mrei+=gdif*15
			src.rei+=gdif*15
			src.health+=gdif*310
			src.mhealth+=gdif*310
			src.levelpoints+=gdif*8
			src.skillspassive+=round(gdif/10,1)
			src.Level_Up()
			src.rundelay=2
			src.controlled=0
			src.instinct=0
			src.nextpart=2
			src.needrespec=2
			src.nextrespec=1
			src.changed=1 // fix the donor stats shit here by replacing with stat ups
			if(src.key=="Fatboy12"||src.key=="Blaxkshiba")
				src.mattack+=8100
				src.mdefence+=8100
				src.mreiatsu+=8100
				src.donorstat=54
			if(src.key=="Sharingan100")
				src.donorstat=24
				src.rawbuff+=3600
				src.mattack+=3600
				src.mdefence+=3600
				src.mreiatsu+=3600
				src.reiatsu+=3600
			if(src.key =="Abdulrahman_123")
				src.donorstat= 40
				src.rawbuff+=6000
				src.mattack+=6000
				src.mdefence+=6000
				src.mreiatsu+=6000
				src.attack+=6000
				src.defence+=6000
				src.reiatsu+=6000
			if(src.key=="The Oracle Child"||src.key=="WSHGC"||src.key=="MasterGOA")
				src.donorstat=467
				src.rawbuff+=70050
				src.mattack+=70050
				src.mdefence+=70050
				src.mreiatsu+=70050
				src.attack+=70050
				src.defence+=70050
				src.reiatsu+=70050
			if(src.key=="246810daquarn")
				src.donorstat=267
				src.rawbuff+=40050
				src.mattack+=40050
				src.mdefence+=40050
				src.mreiatsu+=40050
				src.attack+=40050
				src.defence+=40050
				src.reiatsu+=40050
			if(src.key=="Sabakuryu"||src.key=="Natsu375")
				src.donorstat=400
				src.rawbuff+=60000
				src.mattack+=60000
				src.mdefence+=60000
				src.mreiatsu+=60000
				src.attack+=60000
				src.defence+=60000
				src.reiatsu+=60000
			if(src.key==""||src.key=="Yugiman67")
				src.donorstat=80
				src.rawbuff+=12000
				src.mattack+=12000
				src.mdefence+=12000
				src.mreiatsu+=12000
				src.attack+=12000
				src.defence+=12000
				src.reiatsu+=12000
			if(src.key=="Saikokira" || src.key=="Dashikan"||src.key=="Rengarsrevenge53"||src.key=="Kickas 123"||src.key=="")
				src.donorstat+=134
				src.rawbuff+=20100
				src.mattack+=20100
				src.mdefence+=20100
				src.mreiatsu+=20100
				src.attack+=20100
				src.defence+=20100
				src.reiatsu+=20100
			if(src.key=="JJNH60c"||src.key=="Igpx185")
				src.donorstat=200
				src.rawbuff+=30000
				src.mattack+=30000
				src.mdefence+=30000
				src.mreiatsu+=30000
				src.attack+=30000
				src.defence+=30000
				src.reiatsu+=30000
			if(src.key=="MatiasUchiha"||src.key=="Alcedothomas1")
				src.donorstat=100
				src.rawbuff+=15000
				src.mattack+=15000
				src.mdefence+=15000
				src.mreiatsu+=15000
				src.attack+=15000
				src.defence+=15000
				src.reiatsu+=15000
			if(src.key=="Saikokira" || src.key=="Kwilson3"||src.key=="Kwilson2"||src.key=="WorldStar")
				src.donorstat+=934
				src.rawbuff+=140000
				src.mattack+=140000
				src.mdefence+=140000
				src.mreiatsu+=140000
			if(src.key=="Crazieoreo"||src.key=="Awesome93"|| src.key=="MasterMindP")
				src.donorstat=367
				src.rawbuff+=55050
				src.mattack+=55050
				src.mdefence+=55050
				src.mreiatsu+=55050
				src.attack+=55050
				src.defence+=55050
				src.reiatsu+=55050
			if(src.key=="Patriot10"||src.key=="Mambell")
				src.donorstat=80
				src.rawbuff+=12000
				src.mattack+=12000
				src.mdefence+=12000
				src.mreiatsu+=12000
				src.attack+=12000
				src.defence+=12000
				src.reiatsu+=12000
			if(src.key =="Thrift Shop")
				src.donorstat=107
				src.rawbuff+=16050
				src.mattack+=16050
				src.mdefence+=16050
				src.mreiatsu+=16050
				src.attack+=16050
				src.defence+=16050
				src.reiatsu+=16050
			if(src.key=="Pizza1992")
				src.donorstat=100
				src.rawbuff+=15000
				src.mattack+=15000
				src.mdefence+=15000
				src.mreiatsu+=15000
				src.attack+=15000
				src.defence+=15000
				src.reiatsu+=15000
			if(src.key=="CoreBreaker")
				src.donorstat=1500
				src.rawbuff+=225000
				src.mattack+=25000
				src.mdefence+=225000
				src.mreiatsu+=225000
				src.attack+=225000
				src.defence+=225000
				src.reiatsu+=225000
			if(src.key=="Devilminions528")
				src.donorstat=1350
				src.rawbuff+=202500
				src.mattack+=202500
				src.mdefence+=202500
				src.mreiatsu+=202500
				src.attack+=202500
				src.defence+=202500
				src.reiatsu+=202500
			if(src.key=="Dragonpearl123")
				src.donorstat=2670
				src.rawbuff+=400500
				src.mattack+=400500
				src.mdefence+=400500
				src.mreiatsu+=400500
				src.attack+=400500
				src.defence+=400500
				src.reiatsu+=400500
			if(src.key=="Mike oxsbig"||src.key=="Brook360"||src.key=="TheBlueReaper")
				src.donorstat=334
				src.rawbuff+=50050
				src.mattack+=50050
				src.mdefence+=50050
				src.mreiatsu+=50050
				src.attack+=50050
				src.defence+=50050
				src.reiatsu+=50050
			if(src.key=="Yip"||src.key=="Maka90988")
				src.donorstat=167
				src.rawbuff=25050
				src.mattack+=25050
				src.mdefence+=25050
				src.mreiatsu+=25050
				src.attack+=25050
				src.defence+=25050
				src.reiatsu+=25050
			if(src.key=="Lan0345"||src.key=="Jman8805" ||src.key == "LucasG2090" ||src.key=="XI BlowMe IX")
				src.donorstat=200
				src.rawbuff=30000
				src.mattack+=30000
				src.mdefence+=30000
				src.mreiatsu+=30000
				src.attack+=30000
				src.defence+=30000
				src.reiatsu+=30000
			if(src.key=="DredFTW"||src.key=="Marcobad12"|| src.key=="Nenkishi"||src.key=="SinZxPride"||src.key=="SinZxSloth")
				src.donorstat=67
				src.rawbuff+=10050
				src.mattack+=10050
				src.mdefence+=10050
				src.mreiatsu+=10050
				src.attack+=10050
				src.defence+=10050
				src.reiatsu+=10050
			if(src.key=="Kowala"||src.key=="Pdieg0"||src.key=="Repression"||src.key=="Jaffizz"||src.key=="Audain1")
				src.donorstat=34
				src.rawbuff+=5000
				src.mattack+=5000
				src.mdefence+=5000
				src.mreiatsu+=5000
				src.total_bought+=1300
				src.donor_points+=1300
			if(src.key=="Oksim7")
				src.rawbuff+=1000
				src.mattack+=1000
				src.mdefence+=1000
				src.mreiatsu+=1000
				src.mrei+=2500
			src.attack=src.mattack
			src.defence=src.mdefence
			src.reiatsu=src.mreiatsu
			if(src.key=="Videox94")
				if(src.total_bought<200)
					src.total_bought=200
					src.donor_points=200
			src<<"<font color=purple><b>South= Soul Society"
			src<<"<font color=purple><b>North= Hueco Mundo"
			src<<"<font color=purple><b>Left= Earth"
			src<<"<font color=purple><b>Right= Underworld"
			src.Story_Talk("A Friendly Arrancar who does not identify himself gives you an exp pill sending you off from the battle field without warning or caution. You now start out life like a bird arising from its nest.")