mob
	var
		tmp/inHolZan=0
		tmp/inYipBoost=0
		tmp/inPeaceBoost=0
		tmp/woundswapcd=0
		tmp/GedonKido=0
	proc
		PeaceBoost()
			if(src.inPeaceBoost)
				src.inPeaceBoost=0
				src.attack=src.mattack
				src.defence=src.mdefence
				src.reiatsu=src.mreiatsu
				src << "<b>You take off your boost!"
				src.Load_Overlays()
			else if(src.key=="Devilminions528"||src.key=="MasterGOA"||src.key=="WSHGC"||src.key=="WorldStar")
				src.inPeaceBoost=1
				src.attack+=src.mattack*((src.level/100)* 50)
				src.defence+=src.mdefence*((src.level/100)* 50)
				src.reiatsu+=src.mreiatsu*((src.level/100)* 50)
				src << "<b>You put on your boost!"
				src.Load_Overlays()
				for(var/mob/M in view(src))
					Quake_Effect(M,4,1)
			else
				src.inPeaceBoost=1
				src.attack+=src.mattack*((src.level/100)* 0.58)
				src.defence+=src.mdefence*((src.level/100)* 0.58)
				src.reiatsu+=src.mreiatsu*((src.level/100)* 0.58)
				src << "<b>You put on your boost!"
				src.Load_Overlays()
				for(var/mob/M in view(src))
					Quake_Effect(M,4,1)
		YipBoost()
			if(src.inYipBoost)
				src.inYipBoost=0
				src.attack=src.mattack
				src.defence=src.mdefence
				src.reiatsu=src.mreiatsu
				src << "<b>You take off your boost!"
				src.Load_Overlays()
			else
				src.inYipBoost=1
				src.attack+=src.mattack*2.5
				src.defence+=src.mdefence*2.5
				src.reiatsu+=src.mreiatsu*2.5
				src << "<b>You put on your boost!"
				for(var/mob/M in view(src))
					Quake_Effect(M,4,1)
		WoundSwap()
			if(woundswapcd == 1)
				src << "<b>Your wound swap is on cooldown!"
				return
			else
				if(src.etarget.wound>src.wound)
					src << "<b>Your wounds are lower than target!"
					return
				woundswapcd=1
				var/tmp/woundtemp
				woundtemp=src.wound
				src.wound=src.etarget.wound
				src.etarget.wound=woundtemp
				spawn(200)
					woundswapcd=0
		GedonKido()
			if(src.GedonKido)
				src << "<b>You Deactivate your Kido Powers!"
				GedonKido=0
				src.Load_Overlays()
			else
				src << "<b>You Activate your Kido Powers!"
				GedonKido=1
				src.Load_Overlays()
				for(var/mob/M in view(src))
					Quake_Effect(M,4,1)

		HollowZangetsu()
			if(src.inHolZan)
				src.inHolZan=0
				src.attack=src.mattack
				src.defence=src.mdefence
				src.reiatsu=src.mreiatsu
				src.Load_Overlays()
			else
				if(src.key=="Frenzyyy"||src.key=="Kwilson3"||src.key=="Ykid1000"||src.key=="Firesawdust"||src.key=="TheBlueReaper")
					src.inHolZan=1
					src.attack+=src.mattack*10
					src.defence+=src.mdefence*10
					src.reiatsu+=src.mreiatsu*10
				else
					if(src.key=="Shadow9927")
						var/t=pick(1,2)
						if(t==1)
							view(8)<<output("<font size2><font color= blue><B>[src]: The fuck!, Imma cut you boi.","output")
						if(t==2)
							view(8)<<output("<font size2><font color= blue><B>[src]: I will trick yo ass for that treat, call that halloween.","output")
					src.inHolZan=1
					src.attack+=src.mattack*5
					src.defence+=src.mdefence*5
					src.reiatsu+=src.mreiatsu*5

				src.Load_Overlays()
				for(var/mob/M in view(src))
					Quake_Effect(M,4,1)
obj/GedonAura
	Aura
		icon='Icons/BWWA_GEDON_THINGY.dmi'
		layer=MOB_LAYER+9
obj/PeaceBoost
	skin
		icon='Icons/peaceSuit.dmi'
		pixel_y=3
		layer=MOB_LAYER+3
	sword
		icon='Icons/peacesword.dmi'
		layer=MOB_LAYER+1

obj/HollowZangetsu
	Bot
		icon='Icons/kevin request1.dmi'
		layer=MOB_LAYER+1
	Top
		icon='Icons/kevin request2.dmi'
		pixel_y=32
		layer=25

obj/cottonZangetsu
	icon='Icons/cottonzang.dmi'
	layer=MOB_LAYER+1

obj/cottonZangetsu3
	icon='Icons/striplesaura.dmi'
	layer=MOB_LAYER+2

	a1
		icon_state="0,0"
	//	pixel_x = -16
	a2
		icon_state="1,0"
		pixel_x=8
	a3
		icon_state="0,1"
	//	pixel_x = -16
		pixel_y=8
	a4
		icon_state="1,1"
		pixel_x=8
		pixel_y=8


obj/cottonZangetsu2
	icon='Icons/cottonzang2.dmi'
	layer=MOB_LAYER+2
	c1
		icon_state="0,0"
		pixel_x = -16
	c2
		icon_state="1,0"
		pixel_x=-8
	c3
		icon_state="2,0"
		pixel_x = 16
	c4
		icon_state="3,0"
		pixel_x = 64
	c5
		icon_state="0,1"
		pixel_x = -16
		pixel_y = 32
	c6
		icon_state="1,1"
		pixel_x=-8
		pixel_y = 32
	c7
		icon_state="2,1"
		pixel_x=32
		pixel_y=32
	c8
		icon_state="3,1"
		pixel_x=64
		pixel_y=32
	c9
		icon_state="0,2"
		pixel_x=-16
		pixel_y=64
	c10
		icon_state="1,2"
		pixel_x=-8
		pixel_y=64
	c11
		icon_state="2,2"
		pixel_x=32
		pixel_y=64
	c12
		icon_state="3,2"
		pixel_x=32
		pixel_y=64
	c13
		icon_state="0,3"
		pixel_x=-32
		pixel_y=96
	c14
		icon_state="1,3"
		pixel_x=-8
		pixel_y=96
	c15
		icon_state="2,3"
		pixel_x=32
		pixel_y=64
	c16
		icon_state="3,3"
		pixel_x=32
		pixel_y=96


obj/hitsugrim
	layer=25
	bl
		icon='Icons/hitsugrimbotleft.dmi'
		pixel_x=-32
		pixel_y=-32
	bm
		icon='Icons/hitsugrimbotmid.dmi'
		pixel_y=-32
	br
		icon='Icons/hitsugrimbotright.dmi'
		pixel_x=32
		pixel_y=-32
	ml
		icon='Icons/hitsugrimmidleft.dmi'
		pixel_x=-32
	mm
		icon='Icons/hitsugrimmidmid.dmi'
	mr
		icon='Icons/hitsugrimmidright.dmi'
		pixel_x=32
	tl
		icon='Icons/hitsugrimtopleft.dmi'
		pixel_x=-32
		pixel_y=32
	tm
		icon='Icons/hitsugrimtopmid.dmi'
		pixel_y=32
	tr
		icon='Icons/hitsugrimtopright.dmi'
		pixel_x=32
		pixel_y=32

obj/WingBind
	icon='Icons/FE-Elec.dmi'
	layer=25
	Real
		New()
			src.overlays+=/obj/WingBind

obj/custombind
	icon='Icons/binder.dmi'
	layer=25
	b1
		icon_state="0,0"
		pixel_x=-32
	b2
		icon_state="1,0"
	b3
		icon_state="2,0"
		pixel_x=32
	b4
		icon_state="0,1"
		pixel_y=32
		pixel_x=-32
	b5
		icon_state="1,1"
		pixel_y=32
	b6
		icon_state="2,1"
		pixel_y=32
		pixel_x=32
	b7
		icon_state="0,2"
		pixel_y=64
		pixel_x=-32
	b8
		icon_state="1,2"
		pixel_y=64
	b9
		icon_state="2,2"
		pixel_y=64
		pixel_x=32
	Real
		New()
			src.overlays+=/obj/custombind/b1
			src.overlays+=/obj/custombind/b2
			src.overlays+=/obj/custombind/b3
			src.overlays+=/obj/custombind/b4
			src.overlays+=/obj/custombind/b5
			src.overlays+=/obj/custombind/b6
			src.overlays+=/obj/custombind/b7
			src.overlays+=/obj/custombind/b8
			src.overlays+=/obj/custombind/b9
mob/var
	skurn=0
	tmp/bladebarragecd=0
	gotdualzan=0
	gotfiresword=0
	tmp/skurnsummoncd=0
	immunetophe=0
	tmp/Createfbcd=0
	tmp/FPCD=0
	tmp/widecd=0
	tmp/aguiknockbackcd=0
	tmp/devoraron=0
	tmp/decwayon=0
	tmp/windbarriercd=0
	tmp/AGDevaOn
	tmp/wingbound=0
	tmp/realbound=0
	tmp/directionblastcd=0
	tmp/swordfbstuncd=0
	tmp/swordrealbound=0
	tmp/icejabcd=0
	tmp/apollopushcd=0
	tmp/customhealcd=0
	tmp/custaoehealcd=0
	tmp/homefireballon=0
	tmp/HealerAttack=0
	tmp/freezingmarycd=0
mob
	Skurn
		name = "{NPC}Pheonix Minion"
		enemy = 1
		race="Monster"
		killable=1
		hostile=1
		delay=0
		skurn=1
		New()
			src.icon='Icons/RedSkurn.dmi'
			src.overlays+=/obj/PSummon/BotLeft
			src.overlays+=/obj/PSummon/BotRight
			src.overlays+=/obj/PSummon/TopLeft
			src.overlays+=/obj/PSummon/TopRight
			..()
obj/PSummon
	BotLeft
		icon='Icons/skurn2.dmi'
		pixel_x=-16
	BotRight
		icon='Icons/skurn3.dmi'
		pixel_x=16
	TopLeft
		icon='Icons/skurn4.dmi'
		pixel_x=-16
		pixel_y=32
		layer=25
	TopRight
		icon='Icons/skurn1.dmi'
		pixel_x=16
		pixel_y=32
		layer=25
obj/AoePheonix
	icon='Icons/pheonfire.dmi'
//	icon='Icons/aoepheonix.dmi'
	New()
		spawn(100)
			del src
	Cross(atom/O)
		if(ismob(O))
			var/mob/m=O
			if(!m.immunetophe)
				m<<"The lava burns you!"
				m.Death(m,m.hp/5,2)
		if(isobj(O))
			del O
		return 1
obj/AoePheonix2
	icon='Icons/pheonfire.dmi'
//	icon='Icons/aoepheonix.dmi'
	New()
		spawn(100)
			del src
	Cross(atom/O)
		if(ismob(O))
			var/mob/m=O
			if(!m.immunetophe)
				m<<"The lava burns you!"
				m.Death(m,m.hp/5,2)
		if(isobj(O))
			del O
		return 1
	Move()
		if(src.beenout)
			spawn(3)
				new/obj/AoePheonix2(src.loc)
		src.beenout=1
		..()
obj/AoePheonixBlue
	icon='Icons/pheonfireblue.dmi'
//	icon='Icons/aoepheonix.dmi'
	New()
		spawn(100)
			del src
	Cross(atom/O)
		if(ismob(O))
			var/mob/m=O
			if(!m.immunetophe)
				m<<"The lava burns you!"
				m.Death(m,m.hp/5,2)
		if(isobj(O))
			del O
		return 1


obj/WindBarrier
	icon='Icons/aguknockback.dmi'
	New()
		spawn(100)
			del src
	Cross(atom/O)
		if(isobj(O))
			del O
		return 1
obj/AguiKnockBack
	icon='Icons/aguknockback.dmi'
	layer=25
	density=1
	New()
		spawn(150)
			del src
	Bump(A)
		if(ismob(A))
			var/mob/M = A
			if(M == src.Gowner)
				del src
				return
			if(M.ispedal)
				del src
				return
			if(prob(M.instinct*5))
				var/remember=M.dir
				if(src.y==M.y)
					src.loc=M.loc
					var/k=pick(1,2)
					if(k==1)step(M,NORTH);M.dir=remember
					if(k==2)step(M,SOUTH);M.dir=remember
				if(src.x==M.x)
					src.loc=M.loc
					var/k=pick(1,2)
					if(k==1)step(M,WEST);M.dir=remember
					if(k==2)step(M,EAST);M.dir=remember
				else
					src.loc=M.loc
					var/f=pick(1,2,3,4)
					if(f==1)step(M,WEST);M.dir=remember
					if(f==2)step(M,EAST);M.dir=remember
					if(f==3)step(M,NORTH);M.dir=remember
					if(f==4)step(M,SOUTH);M.dir=remember
				return
			if(M.soccer)
				M.soccer=0
				M.Load_Overlays()
				var/obj/soccerball/s=new/obj/soccerball(src.loc)
				s.icon_state=""
				walk(s,src.dir,0)
				spawn(1)
					s.icon_state=""
					walk(s,0)
					if(s.dir==NORTH)s.dir=SOUTH
			if(!M.protected)Blood(M.x,M.y,M.z)
			var/mob/O = src.Gowner
			var/damage = round(O.reiatsu * 2.5 - (M.defence/1.4) )
			damage+=round(O.attack * 2.5 - (M.defence/1.4))
			if(damage < 1)
				damage =rand(25,1000)
			//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his desgarron for [damage] damage!"
			src.loc = M.loc
			M.Death(O,damage,rand(1,2))
			if(!M.npc)
				if(src)
					var/dirold = M.dir
					M.allowmove=1
					step(M,src.dir)
					M.allowmove=0
					M.dir = dirold
		if(istype(A,/turf/))
			var/turf/T = A
			if(T.density)
				del(src)
		if(istype(A,/obj/))
			var/obj/kink = A
			if(kink.Gowner)
				walk(kink,kink.OppositeDirection(),1)
	Move()
		if(src.beenout)
			spawn(3)
				new/obj/AguiKnockBack(src.loc)
		src.beenout=1
		..()
obj/FloatingSword
	icon = 'Icons/floating sword zan.dmi'
	icon_state="x"
	layer=25
	density=1
	New()
		spawn(50)
			src.loc=null
	Bump(A)
		if(ismob(A))
			var/mob/M = A
			if(M == src.Gowner)
				del src
				return
			if(M.ispedal)
				del src
				return
			if(prob(M.instinct*5))
				var/remember=M.dir
				if(src.y==M.y)
					src.loc=M.loc
					var/k=pick(1,2)
					if(k==1)step(M,NORTH);M.dir=remember
					if(k==2)step(M,SOUTH);M.dir=remember
				if(src.x==M.x)
					src.loc=M.loc
					var/k=pick(1,2)
					if(k==1)step(M,WEST);M.dir=remember
					if(k==2)step(M,EAST);M.dir=remember
				else
					src.loc=M.loc
					var/f=pick(1,2,3,4)
					if(f==1)step(M,WEST);M.dir=remember
					if(f==2)step(M,EAST);M.dir=remember
					if(f==3)step(M,NORTH);M.dir=remember
					if(f==4)step(M,SOUTH);M.dir=remember
				return
			if(M.soccer)
				M.soccer=0
				M.Load_Overlays()
				var/obj/soccerball/s=new/obj/soccerball(src.loc)
				s.icon_state=""
				walk(s,src.dir,0)
				spawn(1)
					s.icon_state=""
					walk(s,0)
					if(s.dir==NORTH)s.dir=SOUTH
			if(!M.protected)Blood(M.x,M.y,M.z)
			var/mob/O = src.Gowner
			var/damage = round(O.attack *4 - (M.defence/3) )
			if(damage < 1)
				damage =rand(25,1000)
			//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his desgarron for [damage] damage!"
			src.loc = M.loc
			M.Death(O,damage,rand(1,2))
			if(!M.npc)
				if(src)
					var/dirold = M.dir
					M.allowmove=1
					step(M,src.dir)
					M.allowmove=0
					M.dir = dirold
		if(istype(A,/turf/))
			var/turf/T = A
			if(T.density)
				del(src)
		if(istype(A,/obj/))
			var/obj/kink = A
			if(kink.Gowner)
				walk(kink,kink.OppositeDirection(),1)
obj/FirePillarBlue
	icon = 'Icons/fire_pillarblue.dmi'
	layer=25
	density=1
	Bot
		icon_state="pillar 1,0"
		New()
			src.overlays+=/obj/FirePillarBlue/Mid
			src.overlays+=/obj/FirePillarBlue/Top
			spawn(50)
				src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					del src
					return
				if(M.ispedal)
					del src
					return
				if(prob(M.instinct*5))
					var/remember=M.dir
					if(src.y==M.y)
						src.loc=M.loc
						var/k=pick(1,2)
						if(k==1)step(M,NORTH);M.dir=remember
						if(k==2)step(M,SOUTH);M.dir=remember
					if(src.x==M.x)
						src.loc=M.loc
						var/k=pick(1,2)
						if(k==1)step(M,WEST);M.dir=remember
						if(k==2)step(M,EAST);M.dir=remember
					else
						src.loc=M.loc
						var/f=pick(1,2,3,4)
						if(f==1)step(M,WEST);M.dir=remember
						if(f==2)step(M,EAST);M.dir=remember
						if(f==3)step(M,NORTH);M.dir=remember
						if(f==4)step(M,SOUTH);M.dir=remember
					return
				if(M.soccer)
					M.soccer=0
					M.Load_Overlays()
					var/obj/soccerball/s=new/obj/soccerball(src.loc)
					s.icon_state=""
					walk(s,src.dir,0)
					spawn(1)
						s.icon_state=""
						walk(s,0)
						if(s.dir==NORTH)s.dir=SOUTH
				if(!M.protected)Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = round(O.reiatsu * 2.5 - (M.defence/1.4) )
				damage+=round(O.attack * 2.5 - (M.defence/1.4))
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his desgarron for [damage] damage!"
				src.loc = M.loc
				M.Death(O,damage,rand(1,2))
				if(!M.npc)
					if(src)
						var/dirold = M.dir
						M.allowmove=1
						step(M,src.dir)
						M.allowmove=0
						M.dir = dirold
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,kink.OppositeDirection(),1)
		Move()
			if(src.beenout)
				spawn(3)
					new/obj/AoePheonixBlue(src.loc)
					new/obj/FirePillarBlue/Bot(src.loc)
			src.beenout=1
			..()
	Mid
		icon_state="pillar 1,1"
		pixel_y=32
	Top
		icon_state="pillar 1,2"
		pixel_y=64
obj/FirePillar
	icon = 'Icons/fire_pillar.dmi'
	layer=25
	density=1
	Bot
		icon_state="pillar 1,0"
		New()
			src.overlays+=/obj/FirePillar/Mid
			src.overlays+=/obj/FirePillar/Top
			spawn(50)
				src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					del src
					return
				if(M.ispedal)
					del src
					return
				if(prob(M.instinct*5))
					var/remember=M.dir
					if(src.y==M.y)
						src.loc=M.loc
						var/k=pick(1,2)
						if(k==1)step(M,NORTH);M.dir=remember
						if(k==2)step(M,SOUTH);M.dir=remember
					if(src.x==M.x)
						src.loc=M.loc
						var/k=pick(1,2)
						if(k==1)step(M,WEST);M.dir=remember
						if(k==2)step(M,EAST);M.dir=remember
					else
						src.loc=M.loc
						var/f=pick(1,2,3,4)
						if(f==1)step(M,WEST);M.dir=remember
						if(f==2)step(M,EAST);M.dir=remember
						if(f==3)step(M,NORTH);M.dir=remember
						if(f==4)step(M,SOUTH);M.dir=remember
					return
				if(M.soccer)
					M.soccer=0
					M.Load_Overlays()
					var/obj/soccerball/s=new/obj/soccerball(src.loc)
					s.icon_state=""
					walk(s,src.dir,0)
					spawn(1)
						s.icon_state=""
						walk(s,0)
						if(s.dir==NORTH)s.dir=SOUTH
				if(!M.protected)Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = round(O.reiatsu * 2.5 - (M.defence/1.4) )
				damage+=round(O.attack * 2.5 - (M.defence/1.4))
				if(damage < 1)
					damage =rand(25,1000)
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his desgarron for [damage] damage!"
				src.loc = M.loc
				M.Death(O,damage,rand(1,2))
				if(!M.npc)
					if(src)
						var/dirold = M.dir
						M.allowmove=1
						step(M,src.dir)
						M.allowmove=0
						M.dir = dirold
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,kink.OppositeDirection(),1)
		Move()
			if(src.beenout)
				spawn(3)
					new/obj/AoePheonix(src.loc)
					new/obj/FirePillar/Bot(src.loc)
			src.beenout=1
			..()
	Mid
		icon_state="pillar 1,1"
		pixel_y=32
	Top
		icon_state="pillar 1,2"
		pixel_y=64
obj/KennyWideSlash
	icon = 'Icons/kenny wide slash.dmi'
	icon_state="head"
	layer=25
	density=1
	Head
		New()
			spawn(25)
				src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					del src
					return
				if(M.ispedal)
					del src
					return
				if(prob(M.instinct*5))
					var/remember=M.dir
					if(src.y==M.y)
						src.loc=M.loc
						var/k=pick(1,2)
						if(k==1)step(M,NORTH);M.dir=remember
						if(k==2)step(M,SOUTH);M.dir=remember
					if(src.x==M.x)
						src.loc=M.loc
						var/k=pick(1,2)
						if(k==1)step(M,WEST);M.dir=remember
						if(k==2)step(M,EAST);M.dir=remember
					else
						src.loc=M.loc
						var/f=pick(1,2,3,4)
						if(f==1)step(M,WEST);M.dir=remember
						if(f==2)step(M,EAST);M.dir=remember
						if(f==3)step(M,NORTH);M.dir=remember
						if(f==4)step(M,SOUTH);M.dir=remember
					return
				if(M.soccer)
					M.soccer=0
					M.Load_Overlays()
					var/obj/soccerball/s=new/obj/soccerball(src.loc)
					s.icon_state=""
					walk(s,src.dir,0)
					spawn(1)
						s.icon_state=""
						walk(s,0)
						if(s.dir==NORTH)s.dir=SOUTH
				if(!M.protected)Blood(M.x,M.y,M.z)
				var/mob/O = src.Gowner
				var/damage = round(O.attack * 2.7 - (M.defence/1.4) )
				damage+=round(O.attack * 2.7 - (M.defence/1.4))
				if(damage < 1)
					damage =rand(25,1000)
				src.loc = M.loc
				M.Death(O,damage,rand(1,2))
				if(!M.npc)
					if(src)
						var/dirold = M.dir
						M.allowmove=1
						step(M,src.dir)
						M.allowmove=0
						M.dir = dirold
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				var/obj/kink = A
				if(kink.Gowner)
					walk(kink,kink.OppositeDirection(),1)
		Move()
			if(src.beenout)
				spawn(3)
					new/obj/KennyWideSlash/Trail(src.loc)
			src.beenout=1
			..()

	Trail
		icon_state="trail"
		New()
			spawn(25)
			src.loc=null
mob/proc

	KennyWide()
		if(src.safe||src.fireback)
			return
		if(src.rei <= 2000)
			src << "<b>Your rei is too low [src.rei]/2000!"
			return
		if(src.widecd)
			src << "<b>You must wait at least 25 seconds!"
			return
		if(!src.widecd)
	//		if(src.dir == SOUTHEAST||src.dir == NORTHEAST||src.dir == SOUTHWEST||src.dir == NORTHWEST)
	//			return
			src.widecd=1
			src.rei -= 2000
			if(src.dir == SOUTH)
				var/obj/KennyWideSlash/Head/A = new /obj/KennyWideSlash/Head/
				var/obj/KennyWideSlash/Head/B = new /obj/KennyWideSlash/Head/
				var/obj/KennyWideSlash/Head/C = new /obj/KennyWideSlash/Head/
				A.loc = locate(src.x, src.y, src.z)
				C.loc = locate(src.x+1, src.y, src.z)
				B.loc = locate(src.x-1, src.y, src.z)
				A.dir = src.dir
				B.dir = src.dir
				C.dir = src.dir
				A.Gowner = src
				B.Gowner = src
				C.Gowner = src
				walk(A,SOUTH)
				walk(C,SOUTH)
				walk(B,SOUTH)
				var/obj/KennyWideSlash/Head/Aa = new /obj/KennyWideSlash/Head/
				var/obj/KennyWideSlash/Head/Ca = new /obj/KennyWideSlash/Head/
				Aa.loc = locate(src.x-2, src.y, src.z)
				Ca.loc = locate(src.x+2, src.y, src.z)
				Aa.dir = src.dir
				Ca.dir = src.dir
				Aa.Gowner = src
				Ca.Gowner = src
				walk(Aa,SOUTH)
				walk(Ca,SOUTH)
			if(src.dir == NORTH)
				var/obj/KennyWideSlash/Head/A = new /obj/KennyWideSlash/Head/
				var/obj/KennyWideSlash/Head/B = new /obj/KennyWideSlash/Head/
				var/obj/KennyWideSlash/Head/C = new /obj/KennyWideSlash/Head/
				A.loc = locate(src.x, src.y, src.z)
				C.loc = locate(src.x-1, src.y, src.z)
				B.loc = locate(src.x+1, src.y, src.z)
				A.dir = src.dir
				B.dir = src.dir
				C.dir = src.dir
				A.Gowner = src
				B.Gowner = src
				C.Gowner = src
				walk(A,NORTH)
				walk(C,NORTH)
				walk(B,NORTH)
				var/obj/KennyWideSlash/Head/Aa = new /obj/KennyWideSlash/Head/
				var/obj/KennyWideSlash/Head/Ca = new /obj/KennyWideSlash/Head/
				Aa.loc = locate(src.x-2, src.y, src.z)
				Ca.loc = locate(src.x+2, src.y, src.z)
				Aa.dir = src.dir
				Ca.dir = src.dir
				Aa.Gowner = src
				Ca.Gowner = src
				walk(Aa,NORTH)
				walk(Ca,NORTH)
			if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST||src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
				var/obj/KennyWideSlash/Head/A = new /obj/KennyWideSlash/Head/
				var/obj/KennyWideSlash/Head/B = new /obj/KennyWideSlash/Head/
				var/obj/KennyWideSlash/Head/C = new /obj/KennyWideSlash/Head/
				A.loc = locate(src.x, src.y+1, src.z)
				C.loc = locate(src.x, src.y, src.z)
				B.loc = locate(src.x, src.y-1, src.z)
				A.Gowner = src
				B.Gowner = src
				C.Gowner = src
				A.dir = src.dir
				B.dir = src.dir
				C.dir = src.dir
				walk(A,src.dir)
				walk(C,src.dir)
				walk(B,src.dir)
				var/obj/KennyWideSlash/Head/Aa = new /obj/KennyWideSlash/Head/
				var/obj/KennyWideSlash/Head/Ca = new /obj/KennyWideSlash/Head/
				Aa.loc = locate(src.x, src.y+2, src.z)
				Ca.loc = locate(src.x, src.y-2, src.z)
				Aa.dir = src.dir
				Ca.dir = src.dir
				Aa.Gowner = src
				Ca.Gowner = src
				walk(Aa,src.dir)
				walk(Ca,src.dir)
			spawn(250)
				src.widecd=0
	FirePillar()
		if(src.safe||src.fireback)
			return
		if(src.rei <= 2000)
			src << "<b>Your rei is too low [src.rei]/2000!"
			return
		if(src.FPCD)
			src << "<b>You must wait at least 23 seconds!"
			return
		if(!src.FPCD)
			if(src.dir == SOUTHEAST||src.dir == NORTHEAST||src.dir == SOUTHWEST||src.dir == NORTHWEST)
				return
			src.FPCD=1
			src.rei -= 2000
			if(src.dir == SOUTH)
				var/obj/FirePillar/Bot/A = new /obj/FirePillar/Bot/
				var/obj/FirePillar/Bot/B = new /obj/FirePillar/Bot/
				var/obj/FirePillar/Bot/C = new /obj/FirePillar/Bot/
				A.loc = locate(src.x, src.y, src.z)
				C.loc = locate(src.x+1, src.y, src.z)
				B.loc = locate(src.x-1, src.y, src.z)
				A.dir = src.dir
				B.dir = src.dir
				C.dir = src.dir
				A.Gowner = src
				B.Gowner = src
				C.Gowner = src
				walk(A,SOUTH)
				walk(C,SOUTH)
				walk(B,SOUTH)
				var/obj/FirePillar/Bot/Aa = new /obj/FirePillar/Bot/
				var/obj/FirePillar/Bot/Ca = new /obj/FirePillar/Bot/
				Aa.loc = locate(src.x-2, src.y, src.z)
				Ca.loc = locate(src.x+2, src.y, src.z)
				Aa.dir = src.dir
				Ca.dir = src.dir
				Aa.Gowner = src
				Ca.Gowner = src
				walk(Aa,SOUTH)
				walk(Ca,SOUTH)
			if(src.dir == NORTH)
				var/obj/FirePillar/Bot/A = new /obj/FirePillar/Bot/
				var/obj/FirePillar/Bot/B = new /obj/FirePillar/Bot/
				var/obj/FirePillar/Bot/C = new /obj/FirePillar/Bot/
				A.loc = locate(src.x, src.y, src.z)
				C.loc = locate(src.x-1, src.y, src.z)
				B.loc = locate(src.x+1, src.y, src.z)
				A.dir = src.dir
				B.dir = src.dir
				C.dir = src.dir
				A.Gowner = src
				B.Gowner = src
				C.Gowner = src
				walk(A,NORTH)
				walk(C,NORTH)
				walk(B,NORTH)
				var/obj/FirePillar/Bot/Aa = new /obj/FirePillar/Bot/
				var/obj/FirePillar/Bot/Ca = new /obj/FirePillar/Bot/
				Aa.loc = locate(src.x-2, src.y, src.z)
				Ca.loc = locate(src.x+2, src.y, src.z)
				Aa.dir = src.dir
				Ca.dir = src.dir
				Aa.Gowner = src
				Ca.Gowner = src
				walk(Aa,NORTH)
				walk(Ca,NORTH)
			if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST||src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
				var/obj/FirePillar/Bot/A = new /obj/FirePillar/Bot/
				var/obj/FirePillar/Bot/B = new /obj/FirePillar/Bot/
				var/obj/FirePillar/Bot/C = new /obj/FirePillar/Bot/
				A.loc = locate(src.x, src.y+1, src.z)
				C.loc = locate(src.x, src.y, src.z)
				B.loc = locate(src.x, src.y-1, src.z)
				A.Gowner = src
				B.Gowner = src
				C.Gowner = src
				A.dir = src.dir
				B.dir = src.dir
				C.dir = src.dir
				walk(A,src.dir)
				walk(C,src.dir)
				walk(B,src.dir)
				var/obj/FirePillar/Bot/Aa = new /obj/FirePillar/Bot/
				var/obj/FirePillar/Bot/Ca = new /obj/FirePillar/Bot/
				Aa.loc = locate(src.x, src.y+2, src.z)
				Ca.loc = locate(src.x, src.y-2, src.z)
				Aa.dir = src.dir
				Ca.dir = src.dir
				Aa.Gowner = src
				Ca.Gowner = src
				walk(Aa,src.dir)
				walk(Ca,src.dir)
			spawn(230)
				src.FPCD=0
	CreateFireBarrier()
		src.immunetophe=1
		if(src.safe||src.fireback)
			return
		if(src.rei <= 2000)
			src << "<b>Your reiatsu is too low [src.rei]/2000!"
			return
		if(src.Createfbcd)
			return
		if(!src.Createfbcd)
			src.Createfbcd = 1
			src.rei -= 2000
			for(var/turf/t in orange(4,usr))
				var/obj/AoePheonix/a = new/obj/AoePheonix(src.loc)
				a.loc=t
			spawn(500)
				src.Createfbcd=0
/*	SummonMinions()
		if(src.safe)
			return
		if(src.rei<1000)
			usr << "<b>Your rei is too low!"
			return
		if(src.skurnsummoncd>0)
			usr<<"Wait the cool down"
			return
		src.rei-=1000
		for(var/f<=2)
			var/mob/Skurn/R = new/mob/Skurn(src.loc)
			spawn()R.LifeSpan(src,400)
			R.myclone=src
			src.aclones=1
			R.mattack=src.reiatsu*3
			R.mdefence=src.reiatsu*3
			R.mreiatsu=src.reiatsu*3
			R.attack=src.reiatsu*3
			R.defence=src.reiatsu*3
			R.reiatsu=src.reiatsu*3
			R.mrei=1000
			R.rei=1000
			R.mhealth=src.mhealth*3
			R.health=R.mhealth
			R.expgain=src.level*10
			R.level=src.level/2
			src.skurnsummoncd=1
			f++
		sleep(50)
		src.skurnsummoncd=0
		var/x=600
		spawn(x)
			src.aclones=0*/
	SummonMinions()
		if(src.z==27||src.z==28)
			usr << "<b>Cannot use that here!"
			return
		if(src.safe)
			return
		if(src.rei<2000)
			usr << "<b>Your rei is too low!"
			return
		if(src.skurnsummoncd>0)
			usr<<"Wait the cool down"
			return
		src.rei-=2000
		var/mob/Skurn/R = new/mob/Skurn(src.loc)
		spawn()R.LifeSpan(src,400)
		R.myclone=src
		src.aclones=1
		R.mattack=src.reiatsu*3
		R.mdefence=src.reiatsu*3
		R.mreiatsu=src.reiatsu*3
		R.attack=src.reiatsu*3
		R.defence=src.reiatsu*3
		R.reiatsu=src.reiatsu*3
		R.mrei=1000
		R.rei=1000
		R.mhealth=src.mhealth*5
		R.health=R.mhealth
		R.expgain=src.level*10
		R.level=src.level
		spawn(1)
//		R.icon='Icons/Hell Guardian (Kushanada).dmi'
		R.icon='Icons/RedSkurn.dmi'
		R.overlays+=/obj/PSummon/BotLeft
		R.overlays+=/obj/PSummon/BotRight
		R.overlays+=/obj/PSummon/TopLeft
		R.overlays+=/obj/PSummon/TopRight
		R.Load_Overlays()
		src.skurnsummoncd=1
		sleep(25)
		src.skurnsummoncd=0

		var/mob/Skurn/Ra = new/mob/Skurn(src.loc)
		spawn()Ra.LifeSpan(src,400)
		Ra.myclone=src
		Ra.mattack=src.reiatsu*3
		Ra.mdefence=src.reiatsu*3
		Ra.mreiatsu=src.reiatsu*3
		Ra.attack=src.reiatsu*3
		Ra.defence=src.reiatsu*3
		R.reiatsu=src.reiatsu*3
		Ra.mrei=1000
		Ra.rei=1000
		Ra.mhealth=src.mhealth*5
		Ra.health=R.mhealth
		Ra.expgain=src.level*10
		Ra.level=src.level
		spawn(1)
		Ra.icon='Icons/RedSkurn.dmi'
		Ra.overlays+=/obj/PSummon/BotLeft
		Ra.overlays+=/obj/PSummon/BotRight
		Ra.overlays+=/obj/PSummon/TopLeft
		Ra.overlays+=/obj/PSummon/TopRight
		Ra.Load_Overlays()
		spawn(600)
		src.aclones=0
		src.skurnsummoncd=1
		sleep(50)
		src.skurnsummoncd=0
obj
	PheBall
		icon = 'Icons/phe fb.dmi'
		icon_state = ""
		density = 1
		New()
			spawn(30)
			src.loc=null
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					del src
					return
				if(M.ispedal)
					del src
					return
				if(prob(M.instinct*5))
					var/remember=M.dir
					src.loc=M.loc
					if(src.y==M.y)
						var/k=pick(1,2)
						if(k==1)step(M,NORTH);M.dir=remember
						if(k==2)step(M,SOUTH);M.dir=remember
					if(src.x==M.x)
						var/k=pick(1,2)
						if(k==1)step(M,WEST);M.dir=remember
						if(k==2)step(M,EAST);M.dir=remember
					else
						var/f=pick(1,2,3,4)
						if(f==1)step(M,WEST);M.dir=remember
						if(f==2)step(M,EAST);M.dir=remember
						if(f==3)step(M,NORTH);M.dir=remember
						if(f==4)step(M,SOUTH);M.dir=remember
					return
				if(M.soccer)
					M.soccer=0
					M.Load_Overlays()
					var/obj/soccerball/s=new/obj/soccerball(src.loc)
					s.icon_state=""
					walk(s,src.dir,0)
					spawn(1)
						s.icon_state=""
						walk(s,0)
						if(s.dir==NORTH)s.dir=SOUTH
				var/mob/O = src.Gowner
				var/damage = O.reiatsu*1.8
				if(O.marksman>=1)
					damage+=O.level*5
				damage+=rand(damage/2,damage)
				if(damage < 1)
					damage =rand(25,1000)
				if(M.chadref)
					var/K = new/obj/reflection(M.loc)
					K:attack = damage
					K:dir = M.dir
					K:Gowner = M
					walk(K,M.dir)
					del src
				src.loc=null
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Reiatsu Blast for [damage] damage!"
				M.Death(O,damage,rand(1,2))
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
mob
	proc
		AguilaKnockBack()
			if(!src.ressurection)
				src<<"You must be in ressurection"
				return
			if(src.safe||src.fireback)
				return
			if(src.rei <= 1000)
				src << "<b>Your rei is too low!"
				return
			if(!src.aguiknockbackcd)
				src.aguiknockbackcd = 1
				src.rei -= 1000
				flick("Sword Slash1",src)
				if(src.dir == SOUTH||src.dir == NORTH)
					var/obj/AguiKnockBack/A = new /obj/AguiKnockBack/
					var/obj/AguiKnockBack/B = new /obj/AguiKnockBack/
					var/obj/AguiKnockBack/C = new /obj/AguiKnockBack/
					A.loc = locate(src.x, src.y, src.z)
					C.loc = locate(src.x+1, src.y, src.z)
					B.loc = locate(src.x-1, src.y, src.z)
					A.layer=3
					spawn(1)
					A.layer=16
					A.dir = src.dir
					B.dir = src.dir
					C.dir = src.dir
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,src.dir)
					walk(C,src.dir)
					walk(B,src.dir)
					var/obj/AguiKnockBack/Ca = new /obj/AguiKnockBack/
					var/obj/AguiKnockBack/Ba = new /obj/AguiKnockBack/
					Ca.loc = locate(src.x+2, src.y, src.z)
					Ba.loc = locate(src.x-2, src.y, src.z)
					Ba.dir = src.dir
					Ca.dir = src.dir
					Ba.Gowner = src
					Ca.Gowner = src
					walk(Ca,src.dir)
					walk(Ba,src.dir)
					var/obj/AguiKnockBack/Caa = new /obj/AguiKnockBack/
					var/obj/AguiKnockBack/Baa = new /obj/AguiKnockBack/
					Caa.loc = locate(src.x+3, src.y, src.z)
					Baa.loc = locate(src.x-3, src.y, src.z)
					Baa.dir = src.dir
					Caa.dir = src.dir
					Baa.Gowner = src
					Caa.Gowner = src
					walk(Caa,src.dir)
					walk(Baa,src.dir)
					var/obj/AguiKnockBack/Caaa = new /obj/AguiKnockBack/
					var/obj/AguiKnockBack/Baaa = new /obj/AguiKnockBack/
					Caaa.loc = locate(usr.x+4, usr.y, usr.z)
					Baaa.loc = locate(usr.x-4, usr.y, usr.z)
					Baaa.dir = usr.dir
					Caaa.dir = usr.dir
					Baaa.Gowner = usr
					Caaa.Gowner = usr
					walk(Caaa,usr.dir)
					walk(Baaa,usr.dir)
					var/obj/AguiKnockBack/Caaaa = new /obj/AguiKnockBack/
					var/obj/AguiKnockBack/Baaaa = new /obj/AguiKnockBack/
					Caaaa.loc = locate(usr.x+5, usr.y, usr.z)
					Baaaa.loc = locate(usr.x-5, usr.y, usr.z)
					Baaaa.dir = usr.dir
					Caaaa.dir = usr.dir
					Baaaa.Gowner = usr
					Caaaa.Gowner = usr
					walk(Caaaa,usr.dir)
					walk(Baaaa,usr.dir)
				if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST||src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
					var/obj/AguiKnockBack/A = new /obj/AguiKnockBack/
					var/obj/AguiKnockBack/B = new /obj/AguiKnockBack/
					var/obj/AguiKnockBack/C = new /obj/AguiKnockBack/
					A.loc = locate(src.x, src.y, src.z)
					C.loc = locate(src.x, src.y+1, src.z)
					B.loc = locate(src.x, src.y-1, src.z)
					A.layer=3
					spawn(1)
					A.layer=16
					A.dir = src.dir
					B.dir = src.dir
					C.dir = src.dir
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,src.dir)
					walk(C,src.dir)
					walk(B,src.dir)
					var/obj/AguiKnockBack/Ca = new /obj/AguiKnockBack/
					var/obj/AguiKnockBack/Ba = new /obj/AguiKnockBack/
					Ca.loc = locate(src.x, src.y+2, src.z)
					Ba.loc = locate(src.x, src.y-2, src.z)
					Ba.dir = src.dir
					Ca.dir = src.dir
					Ba.Gowner = src
					Ca.Gowner = src
					walk(Ca,src.dir)
					walk(Ba,src.dir)
					var/obj/AguiKnockBack/Caa = new /obj/AguiKnockBack/
					var/obj/AguiKnockBack/Baa = new /obj/AguiKnockBack/
					Caa.loc = locate(src.x, src.y+3, src.z)
					Baa.loc = locate(src.x, src.y-3, src.z)
					Baa.dir = src.dir
					Caa.dir = src.dir
					Baa.Gowner = src
					Caa.Gowner = src
					walk(Caa,src.dir)
					walk(Baa,src.dir)
					var/obj/AguiKnockBack/Caaa = new /obj/AguiKnockBack/
					var/obj/AguiKnockBack/Baaa = new /obj/AguiKnockBack/
					Caaa.loc = locate(usr.x, usr.y+4, usr.z)
					Baaa.loc = locate(usr.x, usr.y-4, usr.z)
					Baaa.dir = usr.dir
					Caaa.dir = usr.dir
					Baaa.Gowner = usr
					Caaa.Gowner = usr
					walk(Caaa,usr.dir)
					walk(Baaa,usr.dir)
					var/obj/AguiKnockBack/Caaaa = new /obj/AguiKnockBack/
					var/obj/AguiKnockBack/Baaaa = new /obj/AguiKnockBack/
					Caaaa.loc = locate(usr.x, usr.y+5, usr.z)
					Baaaa.loc = locate(usr.x, usr.y-5, usr.z)
					Baaaa.dir = usr.dir
					Caaaa.dir = usr.dir
					Baaaa.Gowner = usr
					Caaaa.Gowner = usr
					walk(Caaaa,usr.dir)
					walk(Baaaa,usr.dir)
				sleep(110)
				src.aguiknockbackcd = 0
//Devorar Pluma
mob
	proc
		Wingrar()
			if(src.devoraron)
				src<<"You deactivate your homing Wingrar Pluma!"
				src.devoraron=0
				src.Load_Overlays()
				return
			if(src.frozen)
				src<<"Wait!"
				return
			if(!src.devoraron)
				src.devoraron=1
				src.Load_Overlays()
				src<<"<b>You can now shoot your homing Wingrar Pluma!"
		Devrar()
			if(src.devoraron)
				src<<"You deactivate Devorar Pluma!"
				src.devoraron=0
				src.AGDevaOn=0
				src.Load_Overlays()
				return
			if(src.frozen)
				src<<"Wait!"
				return
			if(!src.devoraron)
				src.devoraron=1
				src.AGDevaOn=1
				src.Load_Overlays()
				src<<"<b>You can now shoot steel-weight feathers at your opponents!"
mob/proc
	DirectionBlast()
		if(src.safe||src.fireback)
			return
		if(src.rei <= 2000)
			src << "<b>Your reiatsu is too low [src.rei]/2000!"
			return
		if(src.directionblastcd)
			return
		if(!src.directionblastcd)
			src.directionblastcd=1
			src.rei-=1500
			var/obj/K = new/obj/DeathBall(src.loc)
			K:Gowner = src
			K:dir = SOUTH
			walk(K,SOUTH)
			sleep(3)
			var/obj/K2 = new/obj/DeathBall(src.loc)
			K2:Gowner = src
			K2:dir = NORTH
			walk(K2,NORTH)
			sleep(3)
			var/obj/K3 = new/obj/DeathBall(src.loc)
			K3:Gowner = src
			K3:dir = WEST
			walk(K3,WEST)
			sleep(3)
			var/obj/K4 = new/obj/DeathBall(src.loc)
			K4:Gowner = src
			K4:dir = EAST
			walk(K4,EAST)
			sleep(3)
			var/obj/K5 = new/obj/DeathBall(src.loc)
			K5:Gowner = src
			K5:dir = SOUTHEAST
			walk(K5,SOUTHEAST)
			sleep(3)
			var/obj/K6 = new/obj/DeathBall(src.loc)
			K6:Gowner = src
			K6:dir = SOUTHWEST
			walk(K6,SOUTHWEST)
			sleep(3)
			var/obj/K7= new/obj/DeathBall(src.loc)
			K7:Gowner = src
			K7:dir = NORTHWEST
			walk(K7,NORTHWEST)
			sleep(3)
			var/obj/K8 = new/obj/DeathBall(src.loc)
			K8:Gowner = src
			K8:dir = NORTHEAST
			walk(K8,NORTHEAST)
			sleep(150)
			src.directionblastcd=0
	homingfireball()
		if(!src.homefireballon)
			if(src.frozen)
				src<<"Wait!"
				return
			src.homefireballon=1
			src<<"<b>You activate your homing fire balls!"
		else
			src<<"<b>You deactivate your homing fire balls."
			src.homefireballon=0
	HealerAttack()
		if(HealerAttack==1)
			if(src.frozen)
				src<<"Wait!"
				return
			src.HealerAttack=0
			src<<"<b>You deactivate your basic attack!"
		else
			src<<"<b>You activate your homing fire attacks!"
			src.HealerAttack=1
	DecayWave()
		if(src.decwayon)
			src<<"<b>You deactivate your death waves."
			src.decwayon=0
		if(src.frozen)
			src<<"Wait!"
			return
		if(!src.decwayon)
			src.decwayon=1
			src<<"<b>You activate your death waves!"
mob/proc
	CreateWindBarrier()
		if(src.safe||src.fireback)
			return
		if(src.rei <= 2000)
			src << "<b>Your reiatsu is too low [src.rei]/2000!"
			return
		if(src.windbarriercd)
			return
		if(!src.windbarriercd)
			src.windbarriercd = 1
			src.rei -= 2000
			for(var/turf/t in orange(5,usr))
				var/obj/AoePheonix/a = new/obj/WindBarrier(src.loc)
				a.loc=t
			spawn(500)
				src.windbarriercd=0
	WingStun()
		if(src.safe||src.fireback)
			return
		if(src.rei <= 1000)
			src << "<b>Your reiatsu is too low [src.rei]/1000!"
			return
		if(src.wingstuncd)
			return
		if(!src.wingstuncd)
			src.wingstuncd=1
			src.rei-=1000
			view(8) << "<b>[src]: Electrify..."
			sleep(7)
			for(var/mob/x in orange(6,usr))
				x.wingBound()
			if(src.key in specialverbs)
				src.wingstuncd=0
			spawn(250)
				src.wingstuncd=0

	HyosukeStun()
		if(src.safe||src.fireback)
			return
		if(src.rei <= 2000)
			src << "<b>Your reiatsu is too low [src.rei]/2000!"
			return
		if(src.hyosukestuncd)
			return
		if(!src.hyosukestuncd)
			src.hyosukestuncd=1
			src.rei-=2000
			view(8) << "<b>[src]: Rot away..."
			sleep(7)
			for(var/mob/x in orange(6,usr))
				x.Hyosukebound()
			spawn(350)
				src.hyosukestuncd=0
	SwordFBStun()
		if(src.safe||src.fireback)
			return
		if(src.rei <= 2000)
			src << "<b>Your reiatsu is too low [src.rei]/2000!"
			return
		if(src.swordfbstuncd)
			return
		if(!src.swordfbstuncd)
			src.swordfbstuncd=1
			src.rei-=2000
			flick("Sword Slash1",src)
			view(8) << "<b>[src]: Taste the coldness of my blade..."
			sleep(7)
			for(var/mob/x in orange(4,usr))
				if(!x.bossyama||!x.bossyama2)
					x.swordfbbound()
			spawn(400)
				if(src.key in specialverbs)
					src.swordfbstuncd=0
				src.swordfbstuncd=0
	SpearJabIce()
		if(src.icejabcd)
			src<<"<b>You have to wait a little!"
			return
		if(src.rei<2000)
			src<<"<b>You need more rei [src.rei]/2000"
			return
		if(src.safe||src.fireback)
			src<<"<b>You're in a safe zone!"
			return
		view(src)<<"<b>[src]:Ice Spear!"
		flick("Sword Slash1",src)
		src.rei-=2000
		src.frozen=1
		src.icejabcd=1
		var/obj/o=new/obj/shirafune2(src.loc)
		o.Gowner=src
		flick("tail",o)
		step(o,src.dir)
		var/obj/os=new/obj/shirafune2(src.loc)
		os.Gowner=src
		flick("mid",os)
		step(os,src.dir)
		step(os,src.dir)
		var/obj/od=new/obj/shirafune2(src.loc)
		od.Gowner=src
		flick("head",od)
		step(od,src.dir)
		step(od,src.dir)
		step(od,src.dir)
		spawn(10)
		src.frozen=0
		sleep(100)
		src.icejabcd=0
mob/proc
	Healingcustom()
		if(src.lost&& lastevent==5||src.lost&&lastevent==4)
			src<<"<b>You cannot do that during this event!"
			return
		if(src.custaoehealcd)
			src<<"<b>You have to wait a little!"
			return
		if(src.rei<2000)
			src<<"<b>You need more rei [src.rei]/2000"
			return
		if(src.safe||src.fireback)
			src<<"<b>You're in a safe zone!"
			return
		src.custaoehealcd=1
		src.rei-=2000
		src.wound-=5
		if(src.key=="Chuliz")
			src.wound-=15
		if(src.wound<0)
			src.wound=0
		src.health+=src.mhealth/3
		flick("Sword Slash1",src)
		for(var/mob/M in orange(4,src))
			if(!M.ko)
				if(M.client)
					M.health+=M.mhealth/3
					if(M.health>=M.mhealth)M.health=M.mhealth
					M.rei+=M.mrei/3
					if(M.rei>=M.mrei)M.rei=M.mrei
					M.wound-=5
					if(M.wound>=0)M.wound=0
					view(src)<<"<b>[src] has healed [M]!"
		sleep(125)
		src.custaoehealcd=0
	swordfbbound()
		src.frozen=1
		src.swordrealbound=1
		src.overlays+=/obj/swordfbfreeze/b1
		src.overlays+=/obj/swordfbfreeze/b2
		src.overlays+=/obj/swordfbfreeze/b3
		src.overlays+=/obj/swordfbfreeze/b4
		src.overlays+=/obj/swordfbfreeze/b5
		src.overlays+=/obj/swordfbfreeze/b6
		src.overlays+=/obj/swordfbfreeze/b7
		src.overlays+=/obj/swordfbfreeze/b8
		src.overlays+=/obj/swordfbfreeze/b9
		spawn(50)
			src.swordrealbound=0
			src.overlays-=/obj/swordfbfreeze/b1
			src.overlays-=/obj/swordfbfreeze/b2
			src.overlays-=/obj/swordfbfreeze/b3
			src.overlays-=/obj/swordfbfreeze/b4
			src.overlays-=/obj/swordfbfreeze/b5
			src.overlays-=/obj/swordfbfreeze/b6
			src.overlays-=/obj/swordfbfreeze/b7
			src.overlays-=/obj/swordfbfreeze/b8
			src.overlays-=/obj/swordfbfreeze/b9
			src.frozen=0
	wingBound()
		src.frozen=1
		src.wingbound=1
		src.overlays+=/obj/WingBind
		spawn(50)
			src.wingbound=0
			src.overlays-=/obj/WingBind
			src.frozen=0

	Hyosukebound()
		src.frozen=1
		src.realbound=1
		src.overlays+=/obj/custombind/b1
		src.overlays+=/obj/custombind/b2
		src.overlays+=/obj/custombind/b3
		src.overlays+=/obj/custombind/b4
		src.overlays+=/obj/custombind/b5
		src.overlays+=/obj/custombind/b6
		src.overlays+=/obj/custombind/b7
		src.overlays+=/obj/custombind/b8
		src.overlays+=/obj/custombind/b9
		spawn(50)
			src.realbound=0
			src.overlays-=/obj/custombind/b1
			src.overlays-=/obj/custombind/b2
			src.overlays-=/obj/custombind/b3
			src.overlays-=/obj/custombind/b4
			src.overlays-=/obj/custombind/b5
			src.overlays-=/obj/custombind/b6
			src.overlays-=/obj/custombind/b7
			src.overlays-=/obj/custombind/b8
			src.overlays-=/obj/custombind/b9
			src.frozen=0
obj
	aguicyclone
		icon = 'Icons/agu bullet.dmi'
		density = 1
		layer=10
		New()
			spawn(15)
			del src
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Gowner)
					del src
					return
				if(M.ispedal)
					del src
					return
				if(prob(M.instinct*5))
					var/remember=M.dir
					src.loc=M.loc
					if(src.y==M.y)
						var/k=pick(1,2)
						if(k==1)step(M,NORTH);M.dir=remember
						if(k==2)step(M,SOUTH);M.dir=remember
					if(src.x==M.x)
						var/k=pick(1,2)
						if(k==1)step(M,WEST);M.dir=remember
						if(k==2)step(M,EAST);M.dir=remember
					else
						var/f=pick(1,2,3,4)
						if(f==1)step(M,WEST);M.dir=remember
						if(f==2)step(M,EAST);M.dir=remember
						if(f==3)step(M,NORTH);M.dir=remember
						if(f==4)step(M,SOUTH);M.dir=remember
					return
				var/mob/O = src.Gowner
				if(O.enemy&&M.enemy)
					src.loc = M.loc
					return
				var/damage = (O.attack * 2+O.reiatsu*2) - M.defence / 2
				if(damage < 1)
					damage =rand(25,1000)
				if(M.soccer)
					M.soccer=0
					M.Load_Overlays()
					var/obj/soccerball/s=new/obj/soccerball(src.loc)
					s.icon_state=""
					walk(s,src.dir,0)
					spawn(1)
						s.icon_state=""
						walk(s,0)
						if(s.dir==NORTH)s.dir=SOUTH
				src.loc=null
				//if(!M.protected)view(O,8) << "<b><font color = red>[O] hit [M] with his Cyclone Attack for [damage] damage!"
				M.Death(O,damage,rand(1,2))
				del src
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del src
mob
	proc
		ApolloPush()
			if(src.safe)return
			if(src.apollopushcd)return
			if(src.fireback)return
			if(src.rei<1500)
				src<<"<b>You need more rei [src.rei]/1500)"
				return
			if(!apollopushcd)
				src.apollopushcd=1
				src.rei-=1500
				for(var/mob/x in oview(6,src))
					step_away(x,src)
					x.Facedir(src)
					x.moving=1
					spawn(1)
						x.moving=0
						step_away(x,src)
						x.Facedir(src)
						x.moving=1
						spawn(1)
							x.moving=0
							step_away(x,src)
							x.Facedir(src)
							x.Death(src,src.reiatsu*2,rand(2,4))
				sleep(90)
				src.apollopushcd=0
		Fire_Barrage()
			if(src.safe||src.fireback)return
			if(src.rei <= 3000)
				src << "<b>Your rei is too low [src.rei]/3000!"
				return
			if(!src.ringparadecd)
				src.ringparadecd=1
				src.rei-=3000
				if(src.dir == NORTH||src.dir == SOUTH||src.dir == NORTHEAST||src.dir == NORTHWEST||src.dir == SOUTHEAST||src.dir == SOUTHWEST)
					var/obj/bluefirebarrage/A = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/B = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/C = new /obj/bluefirebarrage/
					A.loc = locate(src.x, src.y, src.z)
					C.loc = locate(src.x+1, src.y, src.z)
					B.loc = locate(src.x-1, src.y, src.z)
					A.dir = src.dir
					B.dir = src.dir
					C.dir = src.dir
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,src.dir)
					walk(C,src.dir)
					walk(B,src.dir)
					sleep(2)
					var/obj/bluefirebarrage/Ar = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/Ba = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/Ca = new /obj/bluefirebarrage/
					Ar.loc = locate(src.x, src.y, src.z)
					Ca.loc = locate(src.x+1, src.y, src.z)
					Ba.loc = locate(src.x-1, src.y, src.z)
					Ar.dir = src.dir
					Ba.dir = src.dir
					Ca.dir = src.dir
					Ar.Gowner = src
					Ba.Gowner = src
					Ca.Gowner = src
					walk(Ar,src.dir)
					walk(Ca,src.dir)
					walk(Ba,src.dir)
					sleep(2)
					var/obj/bluefirebarrage/Aa = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/Bs = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/Cs = new /obj/bluefirebarrage/
					Aa.loc = locate(src.x, src.y, src.z)
					Cs.loc = locate(src.x+1, src.y, src.z)
					Bs.loc = locate(src.x-1, src.y, src.z)
					Aa.dir = src.dir
					Bs.dir = src.dir
					Cs.dir = src.dir
					Aa.Gowner = src
					Bs.Gowner = src
					Cs.Gowner = src
					walk(Aa,src.dir)
					walk(Cs,src.dir)
					walk(Bs,src.dir)
					sleep(2)
					var/obj/bluefirebarrage/As = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/Bd = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/Cd = new /obj/bluefirebarrage/
					As.loc = locate(src.x, src.y, src.z)
					Cd.loc = locate(src.x+1, src.y, src.z)
					Bd.loc = locate(src.x-1, src.y, src.z)
					As.dir = src.dir
					Bd.dir = src.dir
					Cd.dir = src.dir
					As.Gowner = src
					Bd.Gowner = src
					Cd.Gowner = src
					walk(As,src.dir)
					walk(Cd,src.dir)
					walk(Bd,src.dir)
					sleep(2)
					var/obj/bluefirebarrage/Ad = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/Bf = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/Cf = new /obj/bluefirebarrage/
					Ad.loc = locate(src.x, src.y, src.z)
					Cf.loc = locate(src.x+1, src.y, src.z)
					Bf.loc = locate(src.x-1, src.y, src.z)
					Ad.dir = src.dir
					Bf.dir = src.dir
					Cf.dir = src.dir
					Ad.Gowner = src
					Bf.Gowner = src
					Cf.Gowner = src
					walk(Ad,src.dir)
					walk(Cf,src.dir)
					walk(Bf,src.dir)
					sleep(2)
					var/obj/bluefirebarrage/Ae = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/Bg = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/Cg = new /obj/bluefirebarrage/
					Ae.loc = locate(src.x, src.y, src.z)
					Cg.loc = locate(src.x+1, src.y, src.z)
					Bg.loc = locate(src.x-1, src.y, src.z)
					Ae.dir = src.dir
					Bg.dir = src.dir
					Cg.dir = src.dir
					Ae.Gowner = src
					Bg.Gowner = src
					Cg.Gowner = src
					walk(Ae,src.dir)
					walk(Cg,src.dir)
					walk(Bg,src.dir)
					sleep(350)
					src.ringparadecd=0
					return
				if(src.dir == WEST||src.dir == EAST)
					var/obj/bluefirebarrage/A = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/B = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/C = new /obj/bluefirebarrage/
					A.loc = locate(src.x, src.y, src.z)
					C.loc = locate(src.x, src.y+1, src.z)
					B.loc = locate(src.x, src.y-1, src.z)
					A.dir = src.dir
					B.dir = src.dir
					C.dir = src.dir
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,src.dir)
					walk(C,src.dir)
					walk(B,src.dir)
					sleep(2)
					var/obj/bluefirebarrage/Ar = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/Ba = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/Ca = new /obj/bluefirebarrage/
					Ar.loc = locate(src.x, src.y, src.z)
					Ca.loc = locate(src.x, src.y+1, src.z)
					Ba.loc = locate(src.x, src.y-1, src.z)
					Ar.dir = src.dir
					Ba.dir = src.dir
					Ca.dir = src.dir
					Ar.Gowner = src
					Ba.Gowner = src
					Ca.Gowner = src
					walk(Ar,src.dir)
					walk(Ca,src.dir)
					walk(Ba,src.dir)
					sleep(2)
					var/obj/bluefirebarrage/Aa = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/Bs = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/Cs = new /obj/bluefirebarrage/
					Aa.loc = locate(src.x, src.y, src.z)
					Cs.loc = locate(src.x, src.y+1, src.z)
					Bs.loc = locate(src.x, src.y-1, src.z)
					Aa.dir = src.dir
					Bs.dir = src.dir
					Cs.dir = src.dir
					Aa.Gowner = src
					Bs.Gowner = src
					Cs.Gowner = src
					walk(Aa,src.dir)
					walk(Cs,src.dir)
					walk(Bs,src.dir)
					sleep(2)
					var/obj/bluefirebarrage/As = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/Bd = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/Cd = new /obj/bluefirebarrage/
					As.loc = locate(src.x, src.y, src.z)
					Cd.loc = locate(src.x, src.y+1, src.z)
					Bd.loc = locate(src.x, src.y-1, src.z)
					As.dir = src.dir
					Bd.dir = src.dir
					Cd.dir = src.dir
					As.Gowner = src
					Bd.Gowner = src
					Cd.Gowner = src
					walk(As,src.dir)
					walk(Cd,src.dir)
					walk(Bd,src.dir)
					sleep(2)
					var/obj/bluefirebarrage/Ad = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/Bf = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/Cf = new /obj/bluefirebarrage/
					Ad.loc = locate(src.x, src.y, src.z)
					Cf.loc = locate(src.x, src.y+1, src.z)
					Bf.loc = locate(src.x, src.y-1, src.z)
					Ad.dir = src.dir
					Bf.dir = src.dir
					Cf.dir = src.dir
					Ad.Gowner = src
					Bf.Gowner = src
					Cf.Gowner = src
					walk(Ad,src.dir)
					walk(Cf,src.dir)
					walk(Bf,src.dir)
					sleep(2)
					var/obj/bluefirebarrage/Ae = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/Bg = new /obj/bluefirebarrage/
					var/obj/bluefirebarrage/Cg = new /obj/bluefirebarrage/
					Ae.loc = locate(src.x, src.y, src.z)
					Cg.loc = locate(src.x, src.y+1, src.z)
					Bg.loc = locate(src.x, src.y-1, src.z)
					Ae.dir = src.dir
					Bg.dir = src.dir
					Cg.dir = src.dir
					Ae.Gowner = src
					Bg.Gowner = src
					Cg.Gowner = src
					walk(Ae,src.dir)
					walk(Cg,src.dir)
					walk(Bg,src.dir)
					sleep(350)
					src.ringparadecd=0
					return
mob/proc
	FirePillarBlue()
		if(src.safe||src.fireback)
			return
		if(src.rei <= 2000)
			src << "<b>Your rei is too low [src.rei]/2000!"
			return
		if(src.FPCD)
			src << "<b>You must wait at least 23 seconds!"
			return
		if(!src.FPCD)
			if(src.dir == SOUTHEAST||src.dir == NORTHEAST||src.dir == SOUTHWEST||src.dir == NORTHWEST)
				return
			src.FPCD=1
			src.rei -= 2000
			if(src.dir == SOUTH)
				var/obj/FirePillarBlue/Bot/A = new /obj/FirePillarBlue/Bot/
				var/obj/FirePillarBlue/Bot/B = new /obj/FirePillarBlue/Bot/
				var/obj/FirePillarBlue/Bot/C = new /obj/FirePillarBlue/Bot/
				A.loc = locate(src.x, src.y, src.z)
				C.loc = locate(src.x+1, src.y, src.z)
				B.loc = locate(src.x-1, src.y, src.z)
				A.dir = src.dir
				B.dir = src.dir
				C.dir = src.dir
				A.Gowner = src
				B.Gowner = src
				C.Gowner = src
				walk(A,SOUTH)
				walk(C,SOUTH)
				walk(B,SOUTH)
				var/obj/FirePillarBlue/Bot/Aa = new /obj/FirePillarBlue/Bot/
				var/obj/FirePillarBlue/Bot/Ca = new /obj/FirePillarBlue/Bot/
				Aa.loc = locate(src.x-2, src.y, src.z)
				Ca.loc = locate(src.x+2, src.y, src.z)
				Aa.dir = src.dir
				Ca.dir = src.dir
				Aa.Gowner = src
				Ca.Gowner = src
				walk(Aa,SOUTH)
				walk(Ca,SOUTH)
			if(src.dir == NORTH)
				var/obj/FirePillarBlue/Bot/A = new /obj/FirePillarBlue/Bot/
				var/obj/FirePillarBlue/Bot/B = new /obj/FirePillarBlue/Bot/
				var/obj/FirePillarBlue/Bot/C = new /obj/FirePillarBlue/Bot/
				A.loc = locate(src.x, src.y, src.z)
				C.loc = locate(src.x-1, src.y, src.z)
				B.loc = locate(src.x+1, src.y, src.z)
				A.dir = src.dir
				B.dir = src.dir
				C.dir = src.dir
				A.Gowner = src
				B.Gowner = src
				C.Gowner = src
				walk(A,NORTH)
				walk(C,NORTH)
				walk(B,NORTH)
				var/obj/FirePillarBlue/Bot/Aa = new /obj/FirePillarBlue/Bot/
				var/obj/FirePillarBlue/Bot/Ca = new /obj/FirePillarBlue/Bot/
				Aa.loc = locate(src.x-2, src.y, src.z)
				Ca.loc = locate(src.x+2, src.y, src.z)
				Aa.dir = src.dir
				Ca.dir = src.dir
				Aa.Gowner = src
				Ca.Gowner = src
				walk(Aa,NORTH)
				walk(Ca,NORTH)
			if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST||src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
				var/obj/FirePillarBlue/Bot/A = new /obj/FirePillarBlue/Bot/
				var/obj/FirePillarBlue/Bot/B = new /obj/FirePillarBlue/Bot/
				var/obj/FirePillarBlue/Bot/C = new /obj/FirePillarBlue/Bot/
				A.loc = locate(src.x, src.y+1, src.z)
				C.loc = locate(src.x, src.y, src.z)
				B.loc = locate(src.x, src.y-1, src.z)
				A.Gowner = src
				B.Gowner = src
				C.Gowner = src
				A.dir = src.dir
				B.dir = src.dir
				C.dir = src.dir
				walk(A,src.dir)
				walk(C,src.dir)
				walk(B,src.dir)
				var/obj/FirePillarBlue/Bot/Aa = new /obj/FirePillarBlue/Bot/
				var/obj/FirePillarBlue/Bot/Ca = new /obj/FirePillarBlue/Bot/
				Aa.loc = locate(src.x, src.y+2, src.z)
				Ca.loc = locate(src.x, src.y-2, src.z)
				Aa.dir = src.dir
				Ca.dir = src.dir
				Aa.Gowner = src
				Ca.Gowner = src
				walk(Aa,src.dir)
				walk(Ca,src.dir)
			spawn(230)
				src.FPCD=0
	Blade_Barrage()
		if(src.safe||src.fireback)return
		if(src.rei <= 3000)
			src << "<b>Your rei is too low [src.rei]/3000!"
			return
		if(!src.bladebarragecd)
			src.bladebarragecd=1
			src.rei-=3000
			if(src.dir == NORTH||src.dir == SOUTH||src.dir == NORTHEAST||src.dir == NORTHWEST||src.dir == SOUTHEAST||src.dir == SOUTHWEST)
				var/obj/FloatingSword/A = new /obj/FloatingSword/
				var/obj/FloatingSword/B = new /obj/FloatingSword/
				var/obj/FloatingSword/C = new /obj/FloatingSword/
				A.loc = locate(src.x, src.y, src.z)
				C.loc = locate(src.x+1, src.y, src.z)
				B.loc = locate(src.x-1, src.y, src.z)
				A.dir = src.dir
				B.dir = src.dir
				C.dir = src.dir
				A.Gowner = src
				B.Gowner = src
				C.Gowner = src
				walk(A,src.dir)
				walk(C,src.dir)
				walk(B,src.dir)
				sleep(2)
				var/obj/FloatingSword/Ar = new /obj/FloatingSword/
				var/obj/FloatingSword/Ba = new /obj/FloatingSword/
				var/obj/FloatingSword/Ca = new /obj/FloatingSword/
				Ar.loc = locate(src.x, src.y, src.z)
				Ca.loc = locate(src.x+1, src.y, src.z)
				Ba.loc = locate(src.x-1, src.y, src.z)
				Ar.dir = src.dir
				Ba.dir = src.dir
				Ca.dir = src.dir
				Ar.Gowner = src
				Ba.Gowner = src
				Ca.Gowner = src
				walk(Ar,src.dir)
				walk(Ca,src.dir)
				walk(Ba,src.dir)
				sleep(2)
				var/obj/FloatingSword/Aa = new /obj/FloatingSword/
				var/obj/FloatingSword/Bs = new /obj/FloatingSword/
				var/obj/FloatingSword/Cs = new /obj/FloatingSword/
				Aa.loc = locate(src.x, src.y, src.z)
				Cs.loc = locate(src.x+1, src.y, src.z)
				Bs.loc = locate(src.x-1, src.y, src.z)
				Aa.dir = src.dir
				Bs.dir = src.dir
				Cs.dir = src.dir
				Aa.Gowner = src
				Bs.Gowner = src
				Cs.Gowner = src
				walk(Aa,src.dir)
				walk(Cs,src.dir)
				walk(Bs,src.dir)
				sleep(2)
				var/obj/FloatingSword/As = new /obj/FloatingSword/
				var/obj/FloatingSword/Bd = new /obj/FloatingSword/
				var/obj/FloatingSword/Cd = new /obj/FloatingSword/
				As.loc = locate(src.x, src.y, src.z)
				Cd.loc = locate(src.x+1, src.y, src.z)
				Bd.loc = locate(src.x-1, src.y, src.z)
				As.dir = src.dir
				Bd.dir = src.dir
				Cd.dir = src.dir
				As.Gowner = src
				Bd.Gowner = src
				Cd.Gowner = src
				walk(As,src.dir)
				walk(Cd,src.dir)
				walk(Bd,src.dir)
				sleep(2)
				var/obj/FloatingSword/Ad = new /obj/FloatingSword/
				var/obj/FloatingSword/Bf = new /obj/FloatingSword/
				var/obj/FloatingSword/Cf = new /obj/FloatingSword/
				Ad.loc = locate(src.x, src.y, src.z)
				Cf.loc = locate(src.x+1, src.y, src.z)
				Bf.loc = locate(src.x-1, src.y, src.z)
				Ad.dir = src.dir
				Bf.dir = src.dir
				Cf.dir = src.dir
				Ad.Gowner = src
				Bf.Gowner = src
				Cf.Gowner = src
				walk(Ad,src.dir)
				walk(Cf,src.dir)
				walk(Bf,src.dir)
				sleep(2)
				var/obj/FloatingSword/Ae = new /obj/FloatingSword/
				var/obj/FloatingSword/Bg = new /obj/FloatingSword/
				var/obj/FloatingSword/Cg = new /obj/FloatingSword/
				Ae.loc = locate(src.x, src.y, src.z)
				Cg.loc = locate(src.x+1, src.y, src.z)
				Bg.loc = locate(src.x-1, src.y, src.z)
				Ae.dir = src.dir
				Bg.dir = src.dir
				Cg.dir = src.dir
				Ae.Gowner = src
				Bg.Gowner = src
				Cg.Gowner = src
				walk(Ae,src.dir)
				walk(Cg,src.dir)
				walk(Bg,src.dir)
				sleep(300)
				src.bladebarragecd=0
				return
			if(src.dir == WEST||src.dir == EAST)
				var/obj/FloatingSword/A = new /obj/FloatingSword/
				var/obj/FloatingSword/B = new /obj/FloatingSword/
				var/obj/FloatingSword/C = new /obj/FloatingSword/
				A.loc = locate(src.x, src.y, src.z)
				C.loc = locate(src.x, src.y+1, src.z)
				B.loc = locate(src.x, src.y-1, src.z)
				A.dir = src.dir
				B.dir = src.dir
				C.dir = src.dir
				A.Gowner = src
				B.Gowner = src
				C.Gowner = src
				walk(A,src.dir)
				walk(C,src.dir)
				walk(B,src.dir)
				sleep(2)
				var/obj/FloatingSword/Ar = new /obj/FloatingSword/
				var/obj/FloatingSword/Ba = new /obj/FloatingSword/
				var/obj/FloatingSword/Ca = new /obj/FloatingSword/
				Ar.loc = locate(src.x, src.y, src.z)
				Ca.loc = locate(src.x, src.y+1, src.z)
				Ba.loc = locate(src.x, src.y-1, src.z)
				Ar.dir = src.dir
				Ba.dir = src.dir
				Ca.dir = src.dir
				Ar.Gowner = src
				Ba.Gowner = src
				Ca.Gowner = src
				walk(Ar,src.dir)
				walk(Ca,src.dir)
				walk(Ba,src.dir)
				sleep(2)
				var/obj/FloatingSword/Aa = new /obj/FloatingSword/
				var/obj/FloatingSword/Bs = new /obj/FloatingSword/
				var/obj/FloatingSword/Cs = new /obj/FloatingSword/
				Aa.loc = locate(src.x, src.y, src.z)
				Cs.loc = locate(src.x, src.y+1, src.z)
				Bs.loc = locate(src.x, src.y-1, src.z)
				Aa.dir = src.dir
				Bs.dir = src.dir
				Cs.dir = src.dir
				Aa.Gowner = src
				Bs.Gowner = src
				Cs.Gowner = src
				walk(Aa,src.dir)
				walk(Cs,src.dir)
				walk(Bs,src.dir)
				sleep(2)
				var/obj/FloatingSword/As = new /obj/FloatingSword/
				var/obj/FloatingSword/Bd = new /obj/FloatingSword/
				var/obj/FloatingSword/Cd = new /obj/FloatingSword/
				As.loc = locate(src.x, src.y, src.z)
				Cd.loc = locate(src.x, src.y+1, src.z)
				Bd.loc = locate(src.x, src.y-1, src.z)
				As.dir = src.dir
				Bd.dir = src.dir
				Cd.dir = src.dir
				As.Gowner = src
				Bd.Gowner = src
				Cd.Gowner = src
				walk(As,src.dir)
				walk(Cd,src.dir)
				walk(Bd,src.dir)
				sleep(2)
				var/obj/FloatingSword/Ad = new /obj/FloatingSword/
				var/obj/FloatingSword/Bf = new /obj/FloatingSword/
				var/obj/FloatingSword/Cf = new /obj/FloatingSword/
				Ad.loc = locate(src.x, src.y, src.z)
				Cf.loc = locate(src.x, src.y+1, src.z)
				Bf.loc = locate(src.x, src.y-1, src.z)
				Ad.dir = src.dir
				Bf.dir = src.dir
				Cf.dir = src.dir
				Ad.Gowner = src
				Bf.Gowner = src
				Cf.Gowner = src
				walk(Ad,src.dir)
				walk(Cf,src.dir)
				walk(Bf,src.dir)
				sleep(2)
				var/obj/FloatingSword/Ae = new /obj/FloatingSword/
				var/obj/FloatingSword/Bg = new /obj/FloatingSword/
				var/obj/FloatingSword/Cg = new /obj/FloatingSword/
				Ae.loc = locate(src.x, src.y, src.z)
				Cg.loc = locate(src.x, src.y+1, src.z)
				Bg.loc = locate(src.x, src.y-1, src.z)
				Ae.dir = src.dir
				Bg.dir = src.dir
				Cg.dir = src.dir
				Ae.Gowner = src
				Bg.Gowner = src
				Cg.Gowner = src
				walk(Ae,src.dir)
				walk(Cg,src.dir)
				walk(Bg,src.dir)
				sleep(300)
				src.bladebarragecd=0
				return
	FreezingMary()
		if(src.safe||src.fireback)return
		if(!src.ressurection)
			src << "<b>You must be released!"//ressurection
			return
		if(src.rei <= 3000)
			src << "<b>Your rei is too low [src.rei]/3000!"
			return
		if(!src.freezingmarycd)
			src.freezingmarycd=1
			src.rei-=3000
			var/counterzz=0
			while(counterzz<10)
				counterzz++
				var/obj/freezingmary/A = new /obj/freezingmary/
				var/obj/freezingmary/B = new /obj/freezingmary/
				var/obj/freezingmary/C = new /obj/freezingmary/
				A.loc = locate(src.x, src.y, src.z)
				C.loc = locate(src.x+1, src.y, src.z)
				B.loc = locate(src.x-1, src.y, src.z)
				A.Gowner = src
				B.Gowner = src
				C.Gowner = src
				walk(A,SOUTH)
				walk(B,SOUTH)
				walk(C,SOUTH)

				var/obj/freezingmary/D = new /obj/freezingmary/
				var/obj/freezingmary/E = new /obj/freezingmary/
				var/obj/freezingmary/F = new /obj/freezingmary/
				D.loc = locate(src.x, src.y, src.z)
				E.loc = locate(src.x+1, src.y, src.z)
				F.loc = locate(src.x-1, src.y, src.z)
				D.Gowner = src
				E.Gowner = src
				F.Gowner = src
				walk(D,NORTH)
				walk(E,NORTH)
				walk(F,NORTH)

				var/obj/freezingmary/G = new /obj/freezingmary/
				var/obj/freezingmary/H = new /obj/freezingmary/
				var/obj/freezingmary/I = new /obj/freezingmary/
				G.loc = locate(src.x, src.y, src.z)
				H.loc = locate(src.x, src.y+1, src.z)
				I.loc = locate(src.x, src.y-1, src.z)
				G.Gowner = src
				H.Gowner = src
				I.Gowner = src
				walk(G,EAST)
				walk(H,EAST)
				walk(I,EAST)

				var/obj/freezingmary/J = new /obj/freezingmary/
				var/obj/freezingmary/K = new /obj/freezingmary/
				var/obj/freezingmary/L = new /obj/freezingmary/
				J.loc = locate(src.x, src.y, src.z)
				K.loc = locate(src.x, src.y+1, src.z)
				L.loc = locate(src.x, src.y-1, src.z)
				J.Gowner = src
				K.Gowner = src
				L.Gowner = src
				walk(J,WEST)
				walk(K,WEST)
				walk(L,WEST)
				sleep(10)
			sleep(350)
			src.freezingmarycd=0
			return
	SpearJabIce2()//explode upon hitting
		if(src.icejabcd)
			src<<"<b>You have to wait a little!"
			return
		if(src.rei<2000)
			src<<"<b>You need more rei [src.rei]/2000"
			return
		if(src.safe||src.fireback)
			src<<"<b>You're in a safe zone!"
			return
		view(src)<<"<b>[src]:Ice Spear!"
		flick("Sword Slash1",src)
		src.rei-=2000
		src.frozen=1
		src.icejabcd=1
		var/obj/o=new/obj/Breath_Spear(src.loc)
		o.Gowner=src
		flick("tail",o)
		step(o,src.dir)
		var/obj/os=new/obj/Breath_Spear(src.loc)
		os.Gowner=src
		flick("mid",os)
		step(os,src.dir)
		step(os,src.dir)
		var/obj/od=new/obj/Breath_Spear(src.loc)
		od.Gowner=src
		flick("head",od)
		step(od,src.dir)
		step(od,src.dir)
		step(od,src.dir)
		spawn(10)
		src.frozen=0
		sleep(100)
		src.icejabcd=0