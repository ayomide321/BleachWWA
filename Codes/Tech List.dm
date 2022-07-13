obj/Ichigomove
	icon='Icons/Zan.dmi'
	icon_state="Combo"
	layer=20
	New()
		spawn(10)
		del src
	m1
		icon_state="Combo2"
		New()
			var/t=rand(1,2)
			if(t==1)
				flick("Combo1",src)
			if(t==2)
				flick("Combo2",src)
			if(t==3)
				flick("Combo3",src)
			if(t==4)
				flick("Combo4",src)
			//flick("Combo[t]",src)
			spawn(6)
			del src
mob
	var
		ninja = 0
		dnotecool=0
		blueballcd=0
		bluedeboostcd=0
obj/center
mob
 special
		verb
			Ninja_Activate()
				set hidden = 1
				if(!src.ninja)
					src.ninja = 1
					src << "<b>You have activated your Ninja Powers."
				else
					src.ninja = 0
					src << "<b>You have deactivated your Ninja Powers."
mob/var
	tmp
		susanos=0
		amatcd=0
		fatboysbooston=0
		acesBoostOn=0
		shinjiDissed=0//attack back move random
		shinjiWorldCd=0
mob
	proc
		shinjiDissed()
			src.shinjiDissed=1
			spawn(75)
				if(!isnull(src))
					src.shinjiDissed=0
					src<<"Your world is no longer inverted"
mob
	proc
		ShinjiWorld()
			if(src.shinjiWorldCd)
				return
			if(src.inshikai)
				src.shinjiWorldCd=1
				for(var/mob/player/m in oview(5,src))
					if(m!=src)
						m.shinjiDissed()
				for(var/j=0;j<10;j++)
					for(var/i=0;i<10;i++)
						var/obj/ShinjiEffect/a=new()
						a.Gowner=src
						a.loc=locate(src.x-5+i,src.y-5+j,src.z)
			else if(src.inbankai)
				src.shinjiWorldCd=1
				for(var/mob/player/m in oview(7,src))
					if(m!=src)
						m.shinjiDissed()
				for(var/j=0;j<14;j++)
					for(var/i=0;i<14;i++)
						var/obj/ShinjiEffect/a=new()
						a.Gowner=src
						a.loc=locate(src.x-7+i,src.y-7+j,src.z)
			spawn(300)shinjiWorldCd=0

		AcesBoost()
			if(src.acesBoostOn==0)
				src.acesBoostOn=1
				src.attack+=src.mattack
				src.defence+=src.mdefence
				src.reiatsu+=src.mreiatsu
				rundelay=rundelay/2
				return
			if(src.acesBoostOn==1)
				src.acesBoostOn=0
				src.attack-=src.mattack
				src.defence-=src.mdefence
				src.reiatsu-=src.mreiatsu
				rundelay=2
				return
		FatBoysBoost()
			if(src.fatboysbooston==0)
				src.fatboysbooston=1
				src.attack+=src.mattack
				src.defence+=src.mdefence
				src.reiatsu+=src.mreiatsu
				return
			if(src.fatboysbooston==1)
				src.fatboysbooston=0
				src.attack-=src.mattack
				src.defence-=src.mdefence
				src.reiatsu-=src.mreiatsu
				return
		Amaterasu()
			src.immunetoflames=1
			if(src.safe||src.fireback)
				return
			if(src.rei <= 1500)
				src << "<b>Your reiatsu is too low [src.rei]/1500!"
				return
			if(src.amatcd)
				return
			if(!src.amatcd)
				src.amatcd = 1
				src.rei -= 1500
				var/list/ef=list()
				for(var/turf/t in orange(6,usr))
					ef+=t
				spawn()
					for(var/mob/m in orange(5,usr))
						m.overlays+=/obj/amatover
						spawn(150)
							m.overlays-=/obj/amatover
				var/duration=rand(15,20)
		//		var/numba=rand(5,10)
				spawn()
					for(duration,duration>0,duration--)
			//			while(numba>0)
			//				numba--
						var/obj/BlackFlames/a=new
						var/obj/BlackFlames/b=new
						var/obj/BlackFlames/c=new
						b.loc=pick(ef)
						c.loc=pick(ef)
						a.loc=pick(ef)
						for(var/mob/m in orange(5,usr))
							m.Death(src,30000,rand(1,2))
						sleep(5)
				spawn(350)
					src.amatcd=0
		Air_Strike()
			if(src.safe||src.fireback)return
			//	if(!src.inbankai)
		//		src << "<b>You must be in bankai!"//ressurection
		//		return
			if(src.rei <= 1500)
				src << "<b>Your rei is too low [src.rei]/1500!"
				return
			if(!src.airstrikecd)
				src.airstrikecd=1
				src.rei-=1500
				if(src.dir == NORTH||src.dir == SOUTH||src.dir == NORTHEAST||src.dir == NORTHWEST||src.dir == SOUTHEAST||src.dir == SOUTHWEST)
					var/obj/airblades/A = new /obj/airblades/
					var/obj/airblades/B = new /obj/airblades/
					var/obj/airblades/C = new /obj/airblades/
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
					var/obj/airblades/Ar = new /obj/airblades/
					var/obj/airblades/Ba = new /obj/airblades/
					var/obj/airblades/Ca = new /obj/airblades/
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
					var/obj/airblades/Aa = new /obj/airblades/
					var/obj/airblades/Bs = new /obj/airblades/
					var/obj/airblades/Cs = new /obj/airblades/
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
					var/obj/airblades/As = new /obj/airblades/
					var/obj/airblades/Bd = new /obj/airblades/
					var/obj/airblades/Cd = new /obj/airblades/
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
					var/obj/airblades/Ad = new /obj/airblades/
					var/obj/airblades/Bf = new /obj/airblades/
					var/obj/airblades/Cf = new /obj/airblades/
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
					var/obj/airblades/Ae = new /obj/airblades/
					var/obj/airblades/Bg = new /obj/airblades/
					var/obj/airblades/Cg = new /obj/airblades/
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
					sleep(200)
					src.airstrikecd=0
					return
				if(src.dir == WEST||src.dir == EAST)
					var/obj/airblades/A = new /obj/airblades/
					var/obj/airblades/B = new /obj/airblades/
					var/obj/airblades/C = new /obj/airblades/
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
					var/obj/airblades/Ar = new /obj/airblades/
					var/obj/airblades/Ba = new /obj/airblades/
					var/obj/airblades/Ca = new /obj/airblades/
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
					var/obj/airblades/Aa = new /obj/airblades/
					var/obj/airblades/Bs = new /obj/airblades/
					var/obj/airblades/Cs = new /obj/airblades/
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
					var/obj/airblades/As = new /obj/airblades/
					var/obj/airblades/Bd = new /obj/airblades/
					var/obj/airblades/Cd = new /obj/airblades/
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
					var/obj/airblades/Ad = new /obj/airblades/
					var/obj/airblades/Bf = new /obj/airblades/
					var/obj/airblades/Cf = new /obj/airblades/
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
					var/obj/airblades/Ae = new /obj/airblades/
					var/obj/airblades/Bg = new /obj/airblades/
					var/obj/airblades/Cg = new /obj/airblades/
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
					sleep(200)
					src.airstrikecd=0
					return
		Blindin()
			if(src.safe||src.fireback)
				return
			if(!src.inshikai&&!src.inbankai)
				src<<"<b>You must be in Shikai!"
				return
			if(src.rei<500)
				src<<"<b>You need [rei]/500 rei to use this!"
				return
			if(!src.shadowcd)
				src.shadowcd=1
				src.rei-=500
				world<<"<b><font color = lime>Tousen has blinded the enemies"
				for(var/mob/player/Ms in All_Clients())
					if(Ms.lost)
						Ms.Untarget()
						Ms.Blindyou(100)
				sleep(300)
				src.shadowcd=0
		Shadow()
			if(src.safe||src.fireback)
				return
			if(!src.inshikai&&!src.inbankai)
				src<<"<b>You must be in Shikai!"
				return
			if(src.rei<1000)
				src<<"<b>You need [rei]/2000 rei to use this!"
				return
			if(!src.shadowcd)
				src.shadowcd=1
				src.rei-=1000
				var/obj/Kad = new/obj/Shadow(locate(src.x,src.y,src.z))
				Kad.Gowner=src
				var/image/Idd = image('Icons/Shadow.dmi',Kad)  //make an image attached to src
				src << Idd
				src<<"<b>You have created an invisible shadow, whoever steps into it within the next 5 secs will be stunned!"
				sleep(60)
				src.shadowcd=0
//------------------------------------------Zagz
		Rage_Spin()
			if(src.safe||src.fireback)
				return
			if(!src.inbankai)
				src<<"<b>You must be in Bankai!"
				return
			if(src.rei<1500)
				src<<"<b>You need [rei]/1500 rei to use this!"
				return
			if(!src.ragespincd)
				src.ragespincd=1
				src.rei-=1500
				src.frozen = 1
				src.Spins()
				sleep(6)
				src.frozen=0
				src.rage=70
				src<<"<b>You channel all of your rage into your next strike, if you take damage this is cancelled!"
				sleep(150)
				src.ragespincd=0
		Extend()
			if(src.safe||src.fireback)
				return
			if(!src.inshikai)
				src<<"<b>You must be in Shikai!"
				return
			if(src.rei<500)
				src<<"<b>You need [rei]/500 rei to use this!"
				return
			if(!src.extendcd)
				src.extendcd=1
				src.rei-=500
				flick("punch",src)
				src.frozen = 1
				var/K = new/obj/ikkakuextend(src.loc)
				K:Gowner = src;K:dir = src.dir;walk(K,usr.dir)
				sleep(6)
				src.frozen=0
				sleep(25)
				src.extendcd=0
		Boost_Negation()
			if(src.safe||src.fireback)
				return
			if(!src.inshikai&&!src.inbankai)
				src<<"<b>You must be in Shikai!"
				return
			if(src.rei<1000)
				src<<"<b>You need [rei]/1000 rei to use this!"
				return
			if(!src.boostnagationcd)
				src.boostnagationcd=1
				src.rei-=1000
				src.Spins()
				for(var/mob/M in oview(1,src))
					if(M.killable)src.shimastery(4)
					if(!M.inHolZan)
						M<<"Your boost has been negated"
						M.Death(src,src.attack*3,5)
						M.attack=M.mattack
						M.reiatsu=M.mreiatsu
						M.defence=M.mdefence
					else
						M<<"You're immune to the boost negation."
				sleep(450)
				src.boostnagationcd=0
		Release_Seal()
			if(src.safe||src.fireback)
				return
			if(!src.inshikai&&!src.inbankai)
				if(src.key == "Frenzyyy")goto here
				src<<"<b>You must be in Shikai!"
				return
			if(src.rei<1000)
				src<<"<b>You need [rei]/1000 rei to use this!"
				return
			here
			if(!src.releaseseelcd)
				src.releaseseelcd=1
				src.rei-=1000
				src.Spins()
				for(var/mob/M in oview(1,src))
					if(M.killable)src.banmastery(4)
					M<<"[src] forcefully severes your powers and seals your release"
					if(M.infull&&!M.inafull||M.inafull&&!M.infull)
						spawn()M.Fullbring()
						M.Death(src,0,6)
					if(M.inbankai)
						spawn()M.Bankai()
						M.Death(src,0,6)
					if(M.inshikai)
						spawn()M.Shikai()
						M.Death(src,0,6)
					if(M.armon)
						spawn()M.Arm1()
						M.Death(src,0,6)
					if(M.finalb)
						spawn()M.Final()
						M.Death(src,0,6)
					if(M.ressurection)
						spawn()M.Ressurection()
						M.Death(src,0,20)
					spawn()M.StartShikCool()
				sleep(450)
				src.releaseseelcd=0
		Segunda_Ress()
			if(src.ftype=="Wings")
				goto here
			if(!src.ressurection)
				src<<"<b>You must be in Ressurection!"
				return
			if(src.ressdrain)
				src<<"<b>You must first master Ressurection!"
				return
			here
			if(src.segunda)
				src.segunda=0
				src.overlays-=/obj/blacktail
				src.overlays-=/obj/horns
				return
			if(!src.segunda)
				src.segunda=1
				src.overlays+=/obj/blacktail
				src.overlays+=/obj/horns
				return
		Limit_Release()
			if(usr.race=="Vaizard")
				usr << "<b>You must be Shinigami!"
				return
			if(!usr.inbankai&&usr.race=="Shinigami"&&usr.stype!="Kido Class"||!usr.race=="Sado"||!usr.race=="Quincy")
				usr << "<b>You must be in bankai!"
				return
			if(!usr.inafull&&usr.race=="Fullbringer")
				usr << "<b>You must be in advanced fullbring!"
				return
			if(usr.stype=="Kido Class"&&usr.level<800)
				usr << "<b>You must be level 800"
				return
			if(usr.limitrelease)
				if(usr.limitreleasecool)
					usr << "<b>You can't take it off so soon!"
					return
				src.limitrelease=0
				src.rundelay=2
				if(src.guildpassive>=1)
					src.rundelay=src.rundelay/2
				if(src.beerboost)
					src.attack+=round(src.mattack/2)
					src.defence+=round(src.mdefence/2)
					src.reiatsu+=round(src.mreiatsu/2)
				usr.Load_Overlays()
				usr.Affirm_Icon()
				if(usr.inbankai)
					if(src.stype == "Unohana")
						src.rundelay=1
					if(src.stype == "Ichigo")
						src.rundelay=1
					if(src.stype == "Hisagi")
						src.rundelay=1
					if(src.stype == "Zaraki")
						src.rundelay=1
					if(src.stype == "Kommamaru")
						src.rundelay=2
				return
			if(!usr.limitrelease)
				if(usr.limitreleasecool)
					usr << "<b>You must wait before using this again!"
					return
				if(usr.safe)
					return
				usr.limitreleasecool=1
				usr.Freeze(8)
				if(src.lreleaseuses<70)
					src.lreleaseuses+=10
				sleep(3)
				view()<<"<b><FONT FACE=Palatino Linotype><FONT COLOR=#808080>[src] releases their true power!"
				sleep(5)
				src.limitrelease=1
				//usr.MaskDrain()
				src.Affirm_Icon()
				src.Load_Overlays()
				src.density= 1
				src.rundelay -=1
				if(src.beer1)
					src.rundelay+=1
				sleep(50)
				src.limitreleasecool=0
				return

		Limit_Release2()
			if(usr.limitrelease)
				if(usr.limitreleasecool)
					usr << "<b>You can't take it off so soon!"
					return
				src.limitrelease=0
				src.rundelay=2
				if(src.guildpassive>=1)
					src.rundelay=src.rundelay/2
				if(src.beerboost)
					src.attack+=round(src.mattack/2)
					src.defence+=round(src.mdefence/2)
					src.reiatsu+=round(src.mreiatsu/2)
				usr.Load_Overlays()
				usr.Affirm_Icon()
				if(usr.inbankai)
					if(src.stype == "Unohana")
						src.rundelay=1
					if(src.stype == "Ichigo")
						src.rundelay=1
					if(src.stype == "Hisagi")
						src.rundelay=1
					if(src.stype == "Zaraki")
						src.rundelay=1
					if(src.stype == "Kommamaru")
						src.rundelay=2
				return
			if(!usr.limitrelease)
				if(usr.limitreleasecool)
					usr << "<b>You must wait before using this again!"
					return
				if(usr.safe)
					return
				usr.limitreleasecool=1
				usr.Freeze(8)
				if(src.lreleaseuses<70)
					src.lreleaseuses+=10
				sleep(3)
				view()<<"<b><FONT FACE=Palatino Linotype><FONT COLOR=#808080>[src] releases their true power!"
				sleep(5)
				src.limitrelease=1
				//usr.MaskDrain()
				src.Affirm_Icon()
				src.Load_Overlays()
				src.density= 1
				src.rundelay -=1
				if(src.beer1)
					src.rundelay+=1
				sleep(50)
				src.limitreleasecool=0
				return



mob
	proc
		Drainage()
			if(src.safe||src.fireback)
				return
			if(!src.ressurection && !src.bossyama && !src.bossyama2)
				src<<"<b>You must be in Ressurection!"
				return
			if(src.rei<200)
				src<<"<b>You need [rei]/200 rei to use this!"
				return
			if(!src.drainagecd)
				src.drainagecd=1
				src.rei-=400
				flick("",src)
				for(var/turf/t in orange(2,src))
					var/obj/a = new/obj/Drain
		//			var/image/a=new(visual)
					a.loc=t
/*				new/obj/Drain(locate(src.x+1,src.y,src.z))&&new/obj/Drain(locate(src.x+1,src.y-1,src.z))&&new/obj/Drain(locate(src.x+1,src.y+1,src.z))
				new/obj/Drain(locate(src.x-1,src.y-1,src.z))&&new/obj/Drain(locate(src.x-1,src.y,src.z))&&new/obj/Drain(locate(src.x-1,src.y+1,src.z))
				new/obj/Drain(locate(src.x,src.y-1,src.z))&&new/obj/Drain(locate(src.x,src.y+1,src.z))*/
				for(var/mob/G in oview(2,src))
					var/damage = round(src.attack*1.2)+round(src.reiatsu*1.2)
					damage+=rand(damage/2,damage/1.5)
					damage -= G.defence / 5
					if(damage <= 1)
						damage =rand(25,1000)
					var/drainage=G.rei/4
					if(!G.protected)G.rei -= round(drainage)
					if(G.rei<(G.mrei-(G.mrei*1.5)))G.rei=(G.mrei-(G.mrei*1.5))
					G.Death(src,damage,rand(1,3))
				sleep(20)
				src.drainagecd=0
/*			var/k=pick(1,2,3,4)
			if(k==1)
				src.MN=1;src.MS=0;QueN=1;src.MovementLoop()
			if(k==2)
				src.MN=0;src.MS=1;QueS=1;src.MovementLoop()
			if(k==3)
				src.ME=1;src.MW=0;QueE=1;src.MovementLoop()
			if(k==4)
				src.ME=0;src.MW=1;QueW=1;src.MovementLoop()
			return*/
		Random_Stretch()
			if(src.safe||src.fireback)
				return
			if(!src.inshikai&&!src.inbankai)
				src<<"<b>You must be in Shikai!"
				return
			if(src.rei<300)
				src<<"<b>You need [rei]/500 rei to use this!"
				return
			if(!src.randomcd)
				src.rei-=500
				if(src.inshikai)
					src.shimastery(4)
				if(src.inbankai)
					src.banmastery(4)
				src.frozen=1
				src.randomcd = 1
				var/obj/K = new/obj/shinsou3(src.loc)
				K:Gowner = src
				walk(K,pick(NORTH,SOUTH,WEST,EAST),0,100)
				spawn(2)
				src.frozen=0
				spawn(10)
				src.randomcd = 0
		Stretch()
			if(src.safe||src.fireback)
				return
			if(!src.inshikai&&!src.inbankai)
				src<<"<b>You must be in Shikai!"
				return
			if(src.rei<500)
				src<<"<b>You need [rei]/500 rei to use this!"
				return
			if(!src.stretchcd)
				src.rei-=500
				if(src.inshikai)
					src.shimastery(4)
				if(src.inbankai)
					src.banmastery(4)
				src.frozen=0
				if(src.etarget)Facedir(etarget)
				src.stretchcd = 1
				var/obj/K = new/obj/shinsou3(src.loc)
				K:Gowner = src
				K:dir = src.dir
				walk(K,src.dir,0,100)
				spawn(1)
				src.frozen=0
				spawn(15)
				src.stretchcd = 0
		Extravagant_Emotions()
			if(src.rei<2000)
				src<<"You need [rei]/1000"
				return
			if(src.extravagantcool)
				src << "<b>You must wait at least 2 minute before using this again"
				return
			else
				src.rei-=1000
				src.extravagantcool = 1
				src.extravagant = 1
				src << "<b>You start using Extravagant Emotions, your rei will regen 3x faster(Lasts 30 secs)!"
				sleep(300)
				src.extravagant=0
				src << "<b>Extravagant Emotions has ended"
				sleep(900)
				src.extravagantcool=0
		Carnage()
			/*if(src.carnagecool)
				src << "<b>You must wait at least 1 minute before using this again"
				return
			else
				src.carnagecool = 1
				src.carnage = 1
				src << "<b>You start using Carnage, every second your cooldown will reset but you will gain wounds and stop regening(Lasts 10 secs)!"
				sleep(100)
				src.carnage=0
				sleep(500)
				src.carnagecool=0*/
			if(src.extravagantcool)
				src << "<b>You must wait at least 2 minute before using this again"
				return
			else
				src.extravagantcool = 1
				src.extravagant = 1
				src << "<b>You start using Carnage, your rei will regen 3x faster(Lasts 30 secs)!"
				sleep(300)
				src.extravagant=0
				src << "<b>Carnage has ended"
				sleep(900)
				src.extravagantcool=0
		Chronicle_Explosion()
			if(src.safe)return
			if(src.explocool)
				src << "<b>You must wait at least [round(explocool/60)] minute before using this again"
				return
			else
				src.explocool = 300
				src.MakeBombs()
				for(var/mob/M in oview(3,src))
					M.Death(src,round(src.health/2),5)
				src.Death(src,src.health,0)
		Danku()
			if(src.safe||src.fireback)return
			if(src.dankucd)
				src << "<b>You must wait at least 5 seconds before using this again"
				return
			else
				src.dankucd = 1
				if(src.dir==WEST||src.dir==NORTHWEST||src.dir==SOUTHWEST)
					new/obj/Danku/side/a1(locate(src.x-1,src.y-1,src.z))
					new/obj/Danku/side/a2(locate(src.x-1,src.y,src.z))
					new/obj/Danku/side/a3(locate(src.x-1,src.y+1,src.z))
				if(src.dir==EAST||src.dir==NORTHEAST||src.dir==SOUTHEAST)
					new/obj/Danku/side/a1(locate(src.x+1,src.y-1,src.z))
					new/obj/Danku/side/a2(locate(src.x+1,src.y,src.z))
					new/obj/Danku/side/a3(locate(src.x+1,src.y+1,src.z))
				if(src.dir==NORTH)
					new/obj/Danku/a1(locate(src.x-1,src.y+1,src.z))
					new/obj/Danku/a2(locate(src.x,src.y+1,src.z))
					new/obj/Danku/a3(locate(src.x+1,src.y+1,src.z))
				if(src.dir==SOUTH)
					new/obj/Danku/a1(locate(src.x-1,src.y-1,src.z))
					new/obj/Danku/a2(locate(src.x,src.y-1,src.z))
					new/obj/Danku/a3(locate(src.x+1,src.y-1,src.z))
				sleep(50)
				src.dankucd=0
		Full_Danku()
			if(src.rei < 1000)
				src << "<b>Your rei is too low!"
				return
			if(src.coffincool)
				src<<"<b>You have to wait at least 20 seconds."
				return
			if(src.safe||src.fireback)
				return
			if(src.firing)
				return
			if(!src.fulldanku)
				src.firing=1
				src.fulldankucd=1
				spawn(1)
				src.fulldanku=1
				src.rei-=1000
				src << "<b>Click anywhere to cast a full Danku Barrier"
				spawn(50)
				src.firing=0
				spawn(200)
				src.fulldankucd=0
		Itto_Kasu()
			if(src.safe)return
			if(src.ittocd)
				src << "<b>You must wait at least 60 seconds before using this again"
				return
			else
				src.ittocd = 1
				src.dir=SOUTH
				src.Freeze(5)
				spawn(1)
				new/obj/IttoKasu/flick(locate(src.x,src.y,src.z))
				sleep(5)
				src.MakeBombs()
				new/obj/IttoKasu/a1(locate(src.x,src.y,src.z))
				for(var/mob/M in oview(5,src))
					spawn()M.Death(src,src.reiatsu*rand(5,8),rand(5,9),1)
				src.Death(src,src.health,0)
				sleep(595)
				src.ittocd=0
		Particle_Crippler()
			if(src.particlecripcool)
				src << "<b>You must wait at least 1 minute before using this again"
				return
			else
				src.particlecripcool = 1
				src.particlecrip = 1
				src << "<b>You start using Particle_Crippler, flash step behind someone to cripple them(Lasts 15 seconds)!"
				sleep(150)
				src.particlecrip=0
				sleep(450)
				src.particlecripcool=0
		Relic_Shock()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 100)
				src << "<b>Your rei is too low!"
				return
			if(!src.etarget)
				src << "<b>You need a target!"
				return
			var/mob/f=src.etarget
			if(f.flags)
				src<<"<b>You can't use this while [f] has the flag"
				return
			if(src.etarget in oview(6,src))
				if(!src.relicshockcd)
					view(src,8) << "<b>[src]: Relic Shock!"
					src.relicshockcd = 1
					src.rei -= 100
					new/obj/hado1(f.loc)
					f.allowmove=1
					step_away(f,src)
					f.moving=1
					f.allowmove=0
					spawn(1)
						f.allowmove=1
						step_away(f,src)
						f.moving=1
						f.allowmove=0
						spawn(1)
							f.allowmove=1
							step_away(f,src)
							f.moving=1
							f.allowmove=0
							spawn(1)
								f.allowmove=1
								f.moving=0
								step_away(f,src)
								f.allowmove=0
								f.Death(src,src.reiatsu,1)
					sleep(30)
					src.relicshockcd = 0
		Death_Note_PVP()
			if(src.z==23||src.z==22||src.z==24||src.z==25||src.z==17||src.z==26||src.z==13||src.z==27||src.z==28)
				return
			if(src.dnotecool)
				src<<"You must wait [round(dnotecool/60)] minutes to use this again"
				return
			src.dnotecool=600
			for(var/mob/M in oview(3,src))
				M.Death(src,M.mhealth,0)
		Weak_Push()
			if(src.safe)return
			if(src.weakpushcd)return
			if(src.fireback)return
			if(src.rei<500)
				src<<"<b>You need more rei [src.rei]/500)"
				return
			if(!weakpushcd)
				src.weakpushcd=1
				src.rei-=500
				for(var/mob/x in oview(2,src))
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
							x.Death(src,src.attack*2,rand(1,2))
				sleep(55)
				src.weakpushcd=0
		Wind_Level()
			switch(input(src,"What Wind Level will you use?(This affects range, cooldown, and rei cost)", "Wind Level") in list ("1","2","3","4","5","6"))
				if("1")
					src.almighty=1
				if("2")
					src.almighty=2
				if("3")
					src.almighty=3
				if("4")
					src.almighty=4
				if("5")
					src.almighty=5
				if("6")
					src.almighty=6
		Wind_Push()
			if(src.safe)return
			if(src.windpushcd)return
			if(src.fireback)return
			if(!src.ressurection&&!src.inshikai&&!src.inbankai)
				src << "<b>You must be in ressurection!"//ressurection
				return
			if(src.rei<500*src.almighty)
				src<<"<b>You need more rei [src.rei]/[500*src.almighty])"
				return
			if(!windpushcd)
				src.windpushcd=1
				src.rei-=500*src.almighty
				for(var/mob/x in oview(src.almighty,src))
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
							x.Death(src,src.attack*2,rand(2,4))
				if(src.adjhollowtype!=2)
					sleep(25*src.almighty)
				else if(src.adjhollowtype==2)
					sleep(25*(src.almighty/2))
				src.windpushcd=0
		Wind_Pull()
			if(src.safe)return
			if(src.windpullcd)return
			if(src.fireback)return
			if(!src.ressurection&&!src.inshikai&&!src.inbankai)
				src << "<b>You must be in ressurection!"//ressurection
				return
			if(src.rei<500*src.almighty)
				src<<"<b>You need more rei [src.rei]/[500*src.almighty])"
				return
			if(!windpullcd)
				src.windpullcd=1
				src.rei-=500*src.almighty
				for(var/mob/x in oview(src.almighty,src))
					step_to(x,src)
					x.Facedir(src)
					x.moving=1
					spawn(1)
						x.moving=0
						step_to(x,src)
						x.Facedir(src)
						x.moving=1
						spawn(1)
							x.moving=0
							step_to(x,src)
							x.Facedir(src)
							x.Death(src,src.attack*2,rand(2,4))
				sleep(10*src.almighty)
				src.windpullcd=0
		Cloak()
			if(src.safe)return
			if(src.cloakcd)return
			if(src.fireback)return
			if(src.rei<2000)
				src<<"<b>You need more rei [src.rei]/2000)"
				return
			if(!src.cloakcd)
				src.cloakcd=1
				src.rei-=2000
				world<<"<b><font color = lime>Aizen cloaks the Gotei 13"
				for(var/mob/Gotei_13/M)
					spawn()M.Cloaks()
				sleep(600)
				src.cloakcd=0
		Fog()
			if(src.safe)return
			if(src.fogcd)return
			if(src.fireback)return
			if(src.rei<2000)
				src<<"<b>You need more rei [src.rei]/2000)"
				return
			if(!src.inbankai)
				src<<"<b>You need to be in bankai"
				return
			src.fogcd=1
			src.rei-=2000
			src.Freeze(15)
			var/obj/K = new/obj/fog(src.loc)
			K:Gowner = src
			K.dir=src.dir
			walk(K,src.dir)
			spawn(1)
				var/obj/Ka = new/obj/fog(K.loc)
				Ka:Gowner = src
				Ka.dir = turn(K.dir, 45)
				walk(Ka,Ka.dir)
				var/obj/Ks = new/obj/fog(K.loc)
				Ks:Gowner = src
				Ks.dir = turn(K.dir, -45)
				walk(Ks,Ks.dir)
				spawn(1)
					var/obj/Kaa = new/obj/fog(Ka.loc)
					Kaa:Gowner = src
					Kaa.dir = turn(Ka.dir, -45)
					walk(Kaa,Kaa.dir)
					var/obj/Kss = new/obj/fog(Ks.loc)
					Kss:Gowner = src
					Kss.dir = turn(Ks.dir, 45)
					walk(Kss,Kss.dir)
					spawn(1)
						var/obj/Kaad = new/obj/fog(Ka.loc)
						Kaad:Gowner = src
						Kaad.dir = turn(Ka.dir, -45)
						walk(Kaad,Kaad.dir)
						var/obj/Ksss = new/obj/fog(Ks.loc)
						Ksss:Gowner = src
						Ksss.dir = turn(Ks.dir, 45)
						walk(Ksss,Ksss.dir)
						spawn(1)
							for(var/obj/fog/m)
								if(m.Gowner==src)
									walk(m,src.dir)
									spawn(3)
									walk(m,0)
			sleep(150)
			src.fogcd=0
		Life_Contract()
			/*if(src.x == 151 && src.y == 111 && src.z == 1)
				src<<"<b>You are too close to the boss portal."
				return
			for(var/i = 151, 151 <=155, i ++)
				for(var/j = 109, 109 <=110, j++)
					if (src.x == i && src.y == j && src.z ==1)
						src<<"<b>You are too close to the boss portal."
						return
			for(var/i = 140, 145 <=155, i ++)
				for(var/j = 113, 113 <=109, j++)
					if (src.x == i && src.y == j && src.z ==1)
						src<<"<b>You are too close to the boss portal."
						return
			for(var/i = 158, 158 <=163, i ++)
				for(var/j = 107, 107 <=111, j++)
					if (src.x == i && src.y == j && src.z ==1)
						src<<"<b>You are too close to the boss portal."
						return*/
			if(src.z==23||src.z==22||src.z==24||src.z==25||src.z==17||src.z==26||src.z == 13||src.z==27||src.z==28)
				src<<"<b>You cannot do that here."
				return
			if(src.lconcool)
				src<<"<b>You need to wait at least 3 mins"
				return
			src.lcon=1
			src.lconcool=1
			src<<"If you are koed within 10 seconds your attacker will also get koed"
			sleep(100)
			src.lcon=0
			src<<"It has worn off"
			sleep(1800)
			src.lconcool=0
		Koten_Zanshun()
			if(src.kotenzanshuncd)
				src<<"<b>You have to wait a little!"
				return
			if(src.rei<1000)
				src<<"<b>You need more rei [src.rei]/1000"
				return
			if(src.safe||src.fireback)
				src<<"<b>You're in a safe zone!"
				return
			if(!src.kotenzanshuncd)
				src.kotenzanshuncd = 1
				src.rei -= 1000
				var/obj/K = new/obj/inouepow(src.loc)
				K:Gowner = src
				K:dir = src.dir
				walk(K,src.dir)
				sleep(65)
				src.kotenzanshuncd = 0
		Soten_Kisshun()
			if(src.inocool)
				src<<"<b>You have to wait at least 28 seconds!"
				return
			if(src.safe||src.fireback)
				src<<"<b>You're in a safe zone!"
				return
			if(src.rei < 2000)
				src << "<b>Your rei is too low!"
				return
			if(!src.inosh)
				src.firing=1
				src.inocool=1
				spawn(1)
				src.inosh=1
				src.rei-=2000
				src << "<b>Click the person you want to heal!"
				spawn(70)
				src.firing=0
				sleep(15 SECONDS)
				src.inocool=0
		Dungeon_AOE_Heal()
			if(src.z == 27||src.z == 28)
				goto hereheal1
			else
				src<<"<b>You cannot use that here!"
				return
			hereheal1
				if(src.dungeon_healer==0)
					src<<"<b>You must be a healer to use this!"
					return
				if(src.aoehealcd)
					src<<"<b>You have to wait at least 1 minute!"
					return
		//		if(src.squad!=4||src.squad!="Kido Corps")
		//			src<<"<b>You must be a member of the kido corps or squad 4 to use this!!</b>"
		//			return
				if(src.safe||src.fireback)
					src<<"<b>You're in a safe zone!"
					return
				if(src.rei < 2500)
					src << "<b>Your rei is too low!"
					return
				if(!src.dhealactive)
					src.firing=1
					src.aoehealcd=1
					spawn(1)
					src.dhealactive=1
					src.rei-=750
					src << "<b>Click the person you want to heal around!"
					spawn(70)
					src.firing=0
					sleep(600)
					src.aoehealcd=0
		Dungeon_Heal()
			if(src.z == 27||src.z == 28)
				goto hereheal1
			else
				src<<"<b>You cannot use that here!"
				return
			hereheal1
				if(src.dungeon_healer==0)
					src<<"<b>You must be a healer to use this!"
					return
				if(src.dhealcd)
					src<<"<b>You have to wait at least 15 seconds!"
					return
	//			if(src.squad!=4||src.squad!="Kido Corps")
	//				src<<"<b>You must be a member of the kido corps or squad 4 to use this!!</b>"
	//				return
				if(src.safe||src.fireback)
					src<<"<b>You're in a safe zone!"
					return
				if(src.rei < 750)
					src << "<b>Your rei is too low!"
					return
				if(!src.healingkidoactive)
					src.firing=1
					src.dhealcd=1
					spawn(1)
					src.healingkidoactive=1
					src.rei-=750
					src << "<b>Click the person you want to heal!"
					spawn(70)
					src.firing=0
					sleep(150)
					src.dhealcd=0
		Kido_Corp_Heal()
			var obj/skillcard/Kido_Corp_Heal/z = locate() in src.contents
			if(isnull(z))
				alert(src,"You can't squad bug this skill anymore.")
				return
			if(src.key == currentPlayerTest)
				src << "<b>You cannot use this during a ranked test!"
				return
			if(src.healkidocd)
				src<<"<b>You have to wait at least 30 seconds!"
				return
	//		if(src.squad!=4||src.squad!="Kido Corps")
	//			src<<"<b>You must be a member of the kido corps or squad 4 to use this!!</b>"
	//			return
			if(src.safe||src.fireback)
				src<<"<b>You're in a safe zone!"
				return
			if(src.rei < 1000)
				src << "<b>Your rei is too low!"
				return
			if(!src.dhealactive)
				src.firing=1
				src.healkidocd=1
		//		src.dhealactive=1
				src.healingkidoactive=1
				src.rei-=1000
				src << "<b>Click the person you want to heal!"
				spawn(70)
				src.firing=0
				sleep(300)
				src.healkidocd=0
		Santen_Kesshun()
			if(src.firing)
				src<<"<b>You have to wait a little!"
				return
			if(src.rei<1000)
				src<<"<b>You need more rei [src.rei]/1000"
				return
			if(src.safe||src.fireback)
				src<<"<b>You're in a safe zone!"
				return
			if(!src.santenkesshuncd)
				src.santenkesshuncd=1
				src.shielduses+=1
				if(src.shielduses==100)
					src.contents +=new/obj/skillcard/Shiten_Koshun
				new/obj/inoueshield(locate(src.x,src.y,src.z))
				sleep(120)
				src.santenkesshuncd=0
		Shiten_Koshun()
			if(src.shitenkoshuncd)
				src<<"<b>You have to wait a little!"
				return
			if(src.rei<1000)
				src<<"<b>You need more rei [src.rei]/1000"
				return
			if(src.safe||src.fireback)
				src<<"<b>You're in a safe zone!"
				return
			if(!src.shitenkoshuncd)
				src.shitenkoshuncd=1
				src.shelda=1
				new/obj/inoueshield(locate(src.x,src.y,src.z))
				sleep(80)
				src.shelda=0
				sleep(250)
				src.shitenkoshuncd=0
				src.shelda=0
		Sharingan_Reversal()
			if(src.firing)
				src<<"<b>You have to wait a little!"
				return
			if(src.rei<1000)
				src<<"<b>You need more rei [src.rei]/1000"
				return
			if(src.safe||src.fireback)
				src<<"<b>You're in a safe zone!"
				return
			if(!src.etarget)
				src<<"<b>You need a target!"
				return
			if(src.sharinganreversalcool)
				src<<"You must wait 7 seconds"
				return
			if(src.firing==0)
				src.rei-=1000
				src.sharinganreversalcool=1
				src.firing=1
				var/mob/M=src.etarget
				var/dx=M.x
				var/dy=M.y
				var/dz=M.z
				var/di=M.dir
				M.loc=src.loc
				M.dir=src.dir
				src.dir=di
				src.loc=locate(dx,dy,dz)
				var/ds=M.overlays
				var/dd=src.overlays
				M.overlays=dd
				src.overlays=ds
				src.client.perspective=EYE_PERSPECTIVE
				src.client.eye=M
				if(M.client)
					M.client.perspective=EYE_PERSPECTIVE
					M.client.eye=src
				sleep(20)
				src.client.eye=src
				if(M.client)
					M.client.eye=M
				src.overlays=dd
				M.overlays=ds
				sleep(50)
				src.firing=0
				src.sharinganreversalcool=0
		Hide_Presence()
			if(src.hiding)
				src.hiding=0
				src<<"You can be sensed again"
				return
			src.hiding=1
			src<<"You can't be sensed"
		Sense()
			if(src.spectate==1)
				client.eye=client.mob
				spectate=0
				return
			var/list/Menu = list()
			for(var/mob/player/M in All_Clients())
				if(!M.hiding||src.GM>4||src.key=="Not|WSHGC")
					Menu.Add(M)
				if(M.hiding)
					if(src.GM>3)Menu.Add(M)
				if(src.squad==3)
					if(M.z==src.z)
						Menu.Add(M)
			var/mob/M = input("Who do you want to sense?","") as null | anything in Menu
			if(!M)return
			if(M.x<20&&M.y<20&&M.z==1)
				src<<"He's at login screen"
				return
			if(istype(M,/mob/player))
				client.perspective=EYE_PERSPECTIVE
				client.eye=M
				src.spectate=1
		Bankai_Skill()
			if(!src.inbankai)
				src<<"You must be in bankai"
				return
			if(src.stype=="Aizen")
				src.Restep()
			if(src.stype=="Byakuya")
				src.Petal_Sword()
			if(src.stype=="Ichimaru")
				src.Poison()
			if(src.stype=="Hinamori")
				src.Rapid_Burst()
				src.Hinamori_Attack()
			if(src.stype=="Hisagi")
				src.Reap()
			if(src.stype=="Ichigo")
				src.Getsuga_Tenshou()
			if(src.stype=="Ikkaku"||src.stype=="Kommamaru")
				src<<"He has no skills"
			if(src.stype=="Jiroubou")
				src.Shuriken_Toss()
			if(src.stype=="Kaiens")
				src.Wave()
			if(src.stype=="Zaraki")
				src.Berserk()
			if(src.stype=="Kira")
				src.Heavy_Hit()
			if(src.stype=="Mayuri")
				src.Lethal_Poison()
			if(src.stype=="Muramasa")
				src.Release_Seal()
			if(src.stype=="Rangiku")
				src.Explode()
			if(src.stype=="Renji")
				src.Baboon_Blast()
			if(src.stype=="Rukia")
				src.Hakuren()
			if(src.stype=="Shonshui")
				src.Bushogoma()
			if(src.stype=="Stinger")
				src.Rocket()
			if(src.stype=="Tousen")
				src.Benihikou()
			if(src.stype=="Hitsugaya")
				src.Shoot_Dragon()
			if(src.stype=="Ukitake")
				src.Return_Blast()
			if(src.stype=="Unohana")
				src.Reversal_Healing()
			if(src.stype=="Urahara")
				src.Nake()
			if(src.stype=="Yammamoto")
				src.Shoen()
			if(src.stype=="Yumichika")
				src.Yumi()
		Bankai2()
			if(!src.inbankai)
				src<<"You must be in bankai"
				return
			if(src.inbankai2)
				src.inbankai2=0
				src.attack-=round(src.mrei/4)
				src.defence-=round(src.mrei/4)
				src<<"You have reverted"
				src.Load_Overlays()
				return
			if(src.inbankai&&!src.inbankai2)
				src.inbankai2=1
				src.attack+=round(src.mrei/4)
				src.defence+=round(src.mrei/4)
				src.rei=1
				src<<"You have converted rei into attack and defence"
				src.Load_Overlays()
				return
		Dual_Swords()
			if(!src.ressurection)
				src<<"You must be in ressurection"
				return
			if(src.dualon)
				src.dualon=0
				src<<"You are now using cero pistols"
				src.Load_Overlays()
				return
			if(!src.dualon)
				src.dualon=1
				src<<"You sre now using cero swords"
				src.Load_Overlays()
				return
		Rodeo()
			if(!src.ressurection)
				src<<"You must be in ressurection"
				return
			if(src.rodeo)
				src.rodeo=0
				src<<"You have calmed down and will deal and take normal damage"
				return
			if(!src.rodeo)
				src.rodeo=1
				src<<"You have chosen to go wild and deal 50% more damage, but take 50% more damage from enemies"
				return
		Kamikaze()
			if(src.kamikaze)
				src.kamikaze=0
				src<<"You have calmed down and will take normal damage/wounds"
				return
			if(!src.kamikaze)
				src.kamikaze=1
				src<<"You have chosen to go kamikaze and will take twice as much wounds, but take half damage"
				return
		Healing()
			if(src.healingcd)
				src<<"<b>You have to wait a little!"
				return
			if(src.rei<500)
				src<<"<b>You need more rei [src.rei]/500"
				return
			if(src.safe||src.fireback)
				src<<"<b>You're in a safe zone!"
				return
			src.healingcd=1
			src.rei-=500
			flick("Sword Slash1",src)
			if(!src.npccaptain)
				for(var/mob/M in get_step(src,src.dir))
					if(!M.ko)
						M.health+=M.mhealth/3
						if(M.health>=M.mhealth)M.health=M.mhealth
						M.rei+=M.mrei/3
						if(M.rei>=M.mrei)M.rei=M.mrei
						M.wound-=5
						if(M.wound>=0)M.wound=0
						view(src)<<"<b>[src] has healed [M]!"
			if(src.npccaptain&&!src.pet)
				for(var/mob/Gotei_13/M)
					M.health+=M.mhealth/2
					if(M.health>=M.mhealth)M.health=M.mhealth
					M.rei+=M.mrei/2
					if(M.rei>=M.mrei)M.rei=M.mrei
					M.wound-=5
					if(M.wound>=0)M.wound=0
				world<<"<b><font color = lime>Unohana has healed all of the Gotei 13"
				sleep(900)
			sleep(100)
			src.healingcd=0
		Regeneration_Mode()
			if(src.rei < src.mrei / 2)
				src << "<b>Your rei is too low!"
				return
			if(src.regenmoded)
				return
			if(src.safe||src.fireback)
				return
			if(src.seeleuse)
				return
			if(!src.firing)
				src.rei-=src.mrei/2
				src.regenmoded = 1
				src.regenmode = 1
				src << "<b>[src]: You will regenerate 3 times faster for 30 seconds!"
				if(src.bossyama||src.bossyama2)
					src.regenmoded=0
				sleep(300)
				src.regenmode = 0
				sleep(500)
				src.regenmoded = 0
		Blood_Thirsty()
			if(src.rei < src.mrei / 4)
				src << "<b>Your rei is too low [src.rei]/[src.mrei/4]!"
				return
			if(src.protectivecool)
				return
			if(src.safe||src.fireback)
				return
			if(src.seeleuse)
				return
			if(!src.firing)
				src.rei-=src.mrei/4
				src.protectivecool = 1
				src.protective = 1
				src << "<b>[src]: You will gain 20% health everytime you take damage!"
				sleep(100)
				src.protective = 0
				if(src.bossyama||src.bossyama2)
					src.protectivecool=0
				sleep(600)
				src.protectivecool = 0
		Reversal_Healing()
			if(src.safe||src.fireback)
				src<<"You are in a safe zone!"
				return
			if(src.unohana1)
				src<<"You must wait at least 30 seconds!"
				return
			if(!src.unohana1)
				src<<"<b>You transfer all your rei to your health(1 rei for 20 health)(1000 rei for 1 wound)"
				src.unohana1=1
				var/d=abs(0-src.rei)
				src.wound-=round(d/1000,1)
				if(src.wound<0)src.wound=0
				src.rei=0
				src.health+=d*20
				if(src.health>src.mhealth*2)src.health=src.mhealth
				sleep(300)
				src.unohana1=0
		Pure_Rei()
			if(src.rei < 1000)
				src << "<b>Your need more rei [src.rei]/1000!"
				return
			if(src.safe||src.fireback)
				src<<"You are in a safe zone!"
				return
			if(src.pure)
				src<<"You must wait at least 60 seconds!"
				return
			if(!src.pure)
				src.rei-=1000
				src<<"<b>You put everything into Reiatsu"
				var/sa=src.attack
				var/sd=src.defence
				src.pure=1
				var/d=abs(0-src.attack)
				src.attack=0
				var/r=abs(0-src.defence)
				src.defence=0
				src.reiatsu+=d+r
				sleep(4 SECONDS)
				src<<"<b>You balance out again"
				src.reiatsu-=d+r
				if(src.defence==sd)
					src.defence+=r
				if(src.attack==sa)
					src.attack+=d
				sleep(1 SECOND)
				src.pure=0
		Pure_Def()
			if(src.rei < 1000)
				src << "<b>Your need more rei [src.rei]/1000!"
				return
			if(src.safe||src.fireback)
				src<<"You are in a safe zone!"
				return
			if(src.pure)
				src<<"You must wait at least 60 seconds!"
				return
			if(!src.pure)
				src.rei-=1000
				src<<"<b>You put everything into defence"
				src.pure=1
				var/d=abs(0-src.attack)
				src.attack=0
				var/r=abs(0-src.reiatsu)
				src.reiatsu=0
				src.defence+=d+r
				var/sa=src.attack
				var/sr=src.reiatsu
				sleep(300)
				src<<"<b>You balance out again"
				src.defence-=d+r
				if(src.reiatsu==sr)
					src.reiatsu=r
				if(src.attack==sa)
					src.attack=d
				sleep(600)
				src.pure=0
		Pure_Atk()
			if(src.rei < 1000)
				src << "<b>Your need more rei [src.rei]/1000!"
				return
			if(src.safe||src.fireback)
				src<<"You are in a safe zone!"
				return
			if(src.pure)
				src<<"You must wait at least 60 seconds!"
				return
			if(!src.pure)
				src.rei-=1000
				src<<"<b>You put everything into attack"
				src.pure=1
				var/d=abs(0-src.defence)
				src.defence=0
				var/r=abs(0-src.reiatsu)
				src.reiatsu=0
				src.attack+=d+r
				var/sd=src.defence
				var/sr=src.reiatsu
				sleep(300)
				src<<"<b>You balance out again"
				src.attack-=d+r
				if(src.reiatsu==sr)
					src.reiatsu=r
				if(src.defence==sd)
					src.defence=d
				sleep(600)
				src.pure=0
		Hollow_Screech()
			if(!src.screech)
				src.screech = 1
				view(8) << "<b><font color = silver>[src]: AAARRGGHHH!!!!"
				for(var/mob/M in oview(8,src))
					if(src.rei > M.rei)
						M.Slowed(10,200)
						var/sound/S = sound('Sounds/009D_0000.wav',volume=50)
						M << S
						if(M.client)
							M.client.DE_SFL_Uqs()
							spawn(15)
							M.client.DE_SFL_ARqs()
					spawn(900)
					src.screech = 0
		Ruthlessness()
			if(src.rei < 1000)
				src << "<b>Your need more rei [src.rei]/1000!"
				return
			if(src.safe||src.fireback)
				src<<"You are in a safe zone!"
				return
			if(src.ruth)
				if(src.race=="Quincy")
					src<<"You must wait at least 60 seconds!"
					return
				src<<"You must wait at least 30 seconds!"
				return
			if(!src.ruth)
				src.rei-=1000
				src<<"<b>You are now invincible"
				src.ruth=1
				src.protected=1
				sleep(100)
				src<<"<b>You are now vulnerable"
				src.protected=0
				sleep(500)
				src.ruth=0
		Rapid_Burst()
			if(src.rei < 1500)
				src << "<b>Your need more rei [src.rei]/1500!"
				return
			if(src.safe||src.fireback)
				src<<"You are in a safe zone!"
				return
			if(src.bursted)
				src<<"You must wait at least 20 seconds!"
				return
			if(!src.bursted)
				src.rei-=1500
				src.bursted=1
				src.burst=1
				sleep(40)
				src.burst=0
				sleep(150)
				src.bursted=0

		Hinamori_Attack()
			if(src.stype == "Hinamori" && src.inshikai && src.usinghinafi|| src.stype == "Hinamori" && src.inbankai&& src.usinghinafi)
				src.usinghinafi = 0
				src <<"Rei blast when attacking turned OFF"
			else if(src.stype == "Hinamori" && src.inshikai &&!src.usinghinafi|| src.stype == "Hinamori" && src.inbankai&& !src.usinghinafi)
				src.usinghinafi = 1
				src <<"Rei blast when attacking turned ON"

		Reflect()
			if(src.rei < 2000)
				src << "<b>Your need more rei [src.rei]/2000!"
				return
			if(src.safe||src.fireback)
				src<<"You are in a safe zone!"
				return
			if(src.bursted)
				src<<"You must wait at least 30 seconds!"
				return
			if(!src.bursted)
				src.bursted=1
				src.chadref=1
				src<<"You can now reflect projectiles"
				sleep(150)
				src.chadref=0
				src<<"Reflect has ended"
				sleep(80)
				src.bursted=0
				src<<"You can now use Reflect again"
		Trip()
			src <<"Removed....retarded skill."
		/*	if(src.safe||src.fireback)
				src<<"You are in a safe zone!"
				return
			if(!src.etarget)
				src<<"You need a target"
				return
			if(src.tripcd)
				src<<"You must wait at least 18 seconds!"
				return
			if(src.rei<500)
				src<<"You need more rei [src.rei]/500"
				return
			if(!src.tripcd)
				src.rei-=500
				src<<"If you stay still for 2 secs without taking damage you will trip your target"
				src.tripcd=1
				src.gothit=0
				var/xx=src.x
				var/yy=src.y
				var/zz=src.z
				sleep(20)
				if(src.x==xx&&src.y==yy&&src.z==zz)
					var/mob/e=src.etarget
					if(e)
						if(e in oview(7,src))
							if(!src.gothit)
								flick("shun",src)
								var/turf/T=get_step(e,e.dir)
								if(T)
									src.loc=locate(T.x,T.y,T.z)
									e.Tripped()
									e<<"[src] has tripped you while running"
									src<<"You tripped that sucka [e]"
				else
					src<<"You moved"
				sleep(75)
				src.tripcd=0	*/
		Flash_Smash()
			if(src.safe||src.fireback)
				src<<"You are in a safe zone!"
				return
			if(!src.etarget)
				src<<"You need a target"
				return
			if(src.smashed)
				src<<"You must wait at least 20 seconds!"
				return
			if(src.rei<1000)
				src<<"You need more rei [src.rei]/1000"
				return
			if(!src.smashed)
				src.rei-=1000
				src<<"If you get close to your target you will flash step towards them and throw them"
				src.smashed=1
				src.smashing=1
				sleep(50)
				src.smashing=0
				sleep(150)
				src.smashed=0
		Severed_Smash()
			if(src.safe||src.fireback)
				src<<"You are in a safe zone!"
				return
			if(!src.etarget)
				src<<"You need a target"
				return
			if(src.esmashed)
				src<<"You must wait at least 20 seconds!"
				return
			if(src.rei<1000)
				src<<"You need more rei [src.rei]/1000"
				return
			if(!src.esmashed)
				src.rei-=1000
				src<<"If you get close to your target you will throw them causing a great deal of wounds"
				src.esmashed=1
				src.esmashing=1
				sleep(50)
				src.esmashing=0
				sleep(150)
				src.esmashed=0
		Aging_Barrier()
			if(src.safe||src.fireback)
				src<<"You are in a safe zone!"
				return
			if(src.ageshield)
				src<<"You must wait at least 20 seconds!"
				return
			if(src.rei<1000)
				src<<"You need more rei [src.rei]/1000"
				return
			if(!src.ageshield)
				src.rei-=1000
				src.ageshield=1
				src.ageshielding=1
				src<<"If you get attacked from over 1 tile you will not take damage for 20 seconds"
				sleep(200)
				src.ageshielding=0
				src<<"Your aging barrier has worn off"
				sleep(150)
				src.ageshield=0
		Eat_Clones()
			if(src.safe||src.fireback)
				src<<"You are in a safe zone!"
				return
			if(src.justate)
				src<<"You must wait at least 44 seconds!"
				return
			if(src.rei<2000)
				src<<"You need more rei [src.rei]/2000"
				return
			if(src.cloned<2)
				src<<"You need more clones"
				return
			if(!src.justate)
				src.rei-=2000
				src.justate=1
				src.health+=round(src.mhealth/3)
				src.wound-=10
				if(src.health>src.mhealth)
					src.health=src.mhealth
				var/mob/x1 = pick(src.clones)
				src<<"These people are in your list:[src.clones]"
				src<<"You chose [x1] to eat and gain 25% health, rei, and heal 5 wounds"
				src.cloned-=1
				del x1
				sleep(440)
				src.justate=0
		Lethal_Poison()
			if(src.safe||src.fireback)
				src<<"You are in a safe zone!"
				return
			if(src.lethaled)
				src<<"You must wait at least 20 seconds!"
				return
			if(src.rei<2000)
				src<<"You need more rei [src.rei]/2000"
				return
			if(!src.lethaled)
				src.rei-=2000
				src.lethaled=1
				src.lethal=1
				src<<"Hit someone with your poison to do damage over time."
				sleep(125)
				src.lethal=0
				src<<"The lethality of your poison has decreased"
				sleep(200)
				src.lethaled=0
		Double_Fire()
			if(src.safe||src.fireback)
				src<<"You are in a safe zone!"
				return
			if(src.dblfire)
				src<<"You must wait at least 35 seconds!"
				return
			if(!src.dblfire)
				src<<"You have completely reduced your cooldowns"
				src.firing=0
				src.desd=0
				src.dblfire=1
				sleep(350)
				src.dblfire=0
		Bankai_Extraction()
			if(src.safe||src.fireback)
				src<<"You are in a safe zone!"
				return
			if(src.rei<1000)
				src<<"<b>You need more rei [src.rei]/1000"
				return
			if(src.bankaied)
				return
			if(src.frozen)
				return
		//	if(src.bowon)
		//		src<<"<b>You must take off your bow"
		//		return
			if(src.inbankai)
				src.Bankai()
				return
			var/mob/M=src.etarget
			if(!M in oview(src))
				src << "<b>You need a target in view!"
				return
			if(!M)
				src << "<b>You need a target in view!"
				return
			if(!M.inbankai)
				src<<"He must be in bankai"
				return
			if(M.inbankai)
				src.rei-=1000
				M.Bankai()
				src.bankaidrain=1
				src.inshikai=1
				src.swordon=1
				src.stype=M.stype
				src.Bankai()
				for(var/obj/skillcard/s in src.contents)
					if(s.iszan)
						src.contents-=s
				src.bankaied=1
		Rev_Up()
			if(src.wound>=100)
				src<<"<b>You're boots are dirty enough!"
				return
			if(src.rei<500)
				src<<"<b>You need more rei [src.rei]/500"
				return
			if(src.frozen)
				return
			src.rei-=500
			src.wound+=10
			src<<"<b>You have reved up causing your boots to get dirtier!"
			src.frozen=1
			new/obj/revup(src.loc)
			sleep(4)
			src.frozen=0
		Critical_Hit()
			if(src.crit)
				src<<"<b>It's already active!"
				return
			if(src.rei<1000)
				src<<"<b>You need more rei [src.rei]/1000"
				return
			src.rei-=1000
			src.crit=1
			src<<"<b>The next hit you do will send someone flying!"
			sleep(100)
			src.crit=0
		Critical_Burst()
			if(src.critburst)
				src.critburst=0
				src<<"<b>You deactivated it!"
				return
			if(src.rei<4000)
				src<<"<b>You need more rei [src.rei]/4000"
				return
			src.rei-=4000
			src.critburst=1
			src<<"<b>Each hit you do will send someone flying for the cost of gaining wounds for 20 seconds!"
			sleep(250)
			src.critburst=0
		Critical_Stun()
			if(src.critstun)
				src.critstun=0
				src<<"<b>You deactivated it!"
				return
			if(src.rei<2000)
				src<<"<b>You need more rei [src.rei]/2000"
				return
			src.rei-=2000
			src.critstun=1
			src<<"<b>The higher your wounds the higher chance you have of stunning someone with a punch!"
		Poison()
			if(src.poison)
				src<<"<b>It's already active!"
				return
			if(src.poisoncool)
				src<<"<b>You must wait at least 20 seconds!"
				return
			if(src.rei<1800)
				src<<"<b>You need more rei [src.rei]/1800"
				return
			src.rei-=1800
			src.poison=1
			src.poisoncool=1
			src<<"<b>For the next 10 seconds if you hit someone with your sword they will get posioned!"
			sleep(100)
			src.poison=0
			sleep(200)
			src.poisoncool=0
		Harmful_Recoil()
			if(src.hrecoil)
				src<<"<b>It's already active!"
				return
			if(src.hrecoilcool)
				src<<"<b>You must wait at least a minute!"
				return
			if(src.rei<4000)
				src<<"<b>You need more rei [src.rei]/4000"
				return
			src.rei-=4500
			src.hrecoil=1
			src.hrecoilcool=1
			src<<"<b>The next hit you do will cause harmful recoil for 10 seconds!"
		Memory_Strikes()
			if(src.memstrike)
				src<<"<b>It's already active!"
				return
			if(src.memstrikecool)
				src<<"<b>You must wait atleast 45 seconds!"
				return
			if(src.rei<2000)
				src<<"<b>You need more rei [src.rei]/2000"
				return
			src.rei-=2000
			src.memstrike=1
			src.memstrikecool=1
			src<<"<b>The next hit you do will mess someone up for 20 seconds!"
		First_Hit()
			if(src.firsthit)
				src<<"<b>It's already active!"
				return
			if(src.firsthitcd==1)
				src<<"<b>Your still tired!"
				return
			if(src.firsthitcool)
				src<<"<b>You must now do the second hit!"
				return
			if(src.rei<250)
				src<<"<b>You need more rei [src.rei]/250"
				return
			src.firsthitcd=1
			src.rei-=250
			src.firsthit=1
			src.secondhit=0
			src.thirdhit=0
			src.forthhit=0
			src.secondhitcool=1
			src.thirdhitcool=1
			src.forthhitcool=1
			src<<"<b>The next hit you do will prevent someone from attacking for 10 seconds!"
			sleep(75)
			src.firsthitcd=0
			src<<"<b>Your not as tired anymore"
		Second_Hit()
			if(src.secondhit)
				src<<"<b>It's already active!"
				return
			if(src.secondhitcd==1)
				src<<"<b>Your still tired!"
				return
			if(src.secondhitcool)
				src<<"<b>You must now do the third hit!"
				return
			if(src.rei<250)
				src<<"<b>You need more rei [src.rei]/250"
				return
			src.secondhitcd=1
			src.rei-=250
			src.firsthit=0
			src.secondhit=1
			src.thirdhit=0
			src.forthhit=0
			src.firsthitcool=1
			src.secondhitcool=0
			src.thirdhitcool=1
			src.forthhitcool=1
			src<<"<b>The next hit you do will cause a person to stop moving!"
			sleep(75)
			src.secondhitcd=0
			src<<"<b>Your not as tired anymore"
		Third_Hit()
			if(src.thirdhit)
				src<<"<b>It's already active!"
				return
			if(src.thirdhitcd==1)
				src<<"<b>Your still tired!"
				return
			if(src.thirdhitcool)
				src<<"<b>You must now do the forth hit!"
				return
			if(src.rei<250)
				src<<"<b>You need more rei [src.rei]/250"
				return
			src.thirdhitcd=1
			src.rei-=250
			src.firsthit=0
			src.secondhit=0
			src.thirdhit=1
			src.forthhit=0
			src.firsthitcool=1
			src.secondhitcool=1
			src.thirdhitcool=0
			src.forthhitcool=1
			src<<"<b>The next hit you do will cause a person to have an emotional breakdown!"
			sleep(75)
			src.thirdhitcd=0
			src<<"<b>Your not as tired anymore"
		Forth_Hit()
			if(src.forthhit)
				src<<"<b>It's already active!"
				return
			if(src.fourthhitcd==1)
				src<<"<b>Your still tired!"
				return
			if(src.forthhitcool)
				src<<"<b>You must now do the first hit!"
				return
			if(src.rei<250)
				src<<"<b>You need more rei [src.rei]/250"
				return
			src.fourthhitcd=1
			src.rei-=250
			src.firsthit=0
			src.secondhit=0
			src.thirdhit=0
			src.forthhit=1
			src.firsthitcool=1
			src.secondhitcool=1
			src.thirdhitcool=1
			src.forthhitcool=0
			src<<"<b>The next hit you do will cause a person to close their eyes!"
			sleep(75)
			src.fourthhitcd=0
			src<<"<b>Your not as tired anymore"
		Save_Freeze()
			if(src.saveuse>=50)
				src.contents+=new/obj/skillcard/Delete_Profile
				src.RefreshSkillList()
			if(src.savefreezecd)
				src<<"<b>You have to wait a little!"
				return
			if(src.rei<1000)
				src<<"<b>You need more rei [src.rei]/1000"
				return
			if(src.safe||src.fireback)
				src<<"<b>You're in a safe zone!"
				return
			var/mob/G=src.etarget
			if(!G in oview(src))
				src << "<b>You need a target in view!"
				return
			if(!G)
				src << "<b>You need a target in view!"
				return
			src.savefreezecd=1
			src.saveuse+=1
			src.rei-=1000
			var/mob/M=src.etarget
			var/obj/K=new/obj/saves/a5(M.loc)
			flick("new",K)
			new/obj/saves/a1(M.loc)
			new/obj/saves/a2(M.loc)
			new/obj/saves/a3(M.loc)
			new/obj/saves/a4(M.loc)
			new/obj/saves/a6(M.loc)
			new/obj/saves/a7(M.loc)
			new/obj/saves/a8(M.loc)
			new/obj/saves/a9(M.loc)
			M.SaveFreeze()
			sleep(200)
			src.savefreezecd=0
		Delete_Profile()
			if(src.ftype!="Yukio")
				src<<"<b>You need a PSP"
				return
			if(src.delcd)
				src<<"<b>You have to wait a little!"
				return
			if(src.rei<1500)
				src<<"<b>You need more rei [src.rei]/1000"
				return
			if(src.safe||src.fireback)
				src<<"<b>You're in a safe zone!"
				return
			var/mob/M=src.etarget
			var/ds=get_dist(src,M)
			if(!M in oview(2))
				src<<"<b>You need a target in [ds]/2 tiles!"
				return
			if(!M)return
			src.delcd=1
			src.rei-=1500
			var/obj/K=new/obj/saves/a5(M.loc)
			K.icon_state="5del"
			flick("newdel",K)
			new/obj/saves/a1(M.loc)
			new/obj/saves/a2(M.loc)
			new/obj/saves/a3(M.loc)
			var/obj/j=new/obj/saves/a4(M.loc)
			j.icon_state="4del"
			var/obj/d=new/obj/saves/a6(M.loc)
			d.icon_state="6del"
			new/obj/saves/a7(M.loc)
			new/obj/saves/a8(M.loc)
			new/obj/saves/a9(M.loc)
			M.DelPro(src)
			sleep(250)
			src.delcd=0
		Game_Trap()
			if(src.gaming)
				src<<"<b>You must wait a little"
				return
			if(src.rei<1000)
				src<<"<b>You need more rei [src.rei]/1000"
				return
			if(src.safe||src.fireback)
				src<<"<b>You're in a safe zone!"
				return
			src.gaming=1
			src.rei-=1000
			view(src,8) << "<b>[src]: Initiating [src.swordname] Game!"
			if(src.etarget)src.Facedir(src.etarget)
			var/obj/A = new/obj/gameturf(locate(src.x-7,src.y-3,src.z))
			spawn(0)
				flick("create",A)
				A.icon_state=""
			var/obj/A1 = new/obj/gameturf(locate(src.x-7,src.y-2,src.z))
			spawn(2)
				flick("create",A1)
				A1.icon_state=""
			var/obj/A2 = new/obj/gameturf(locate(src.x-7,src.y-1,src.z))
			spawn(4)
				flick("create",A2)
				A2.icon_state=""
			var/obj/A3 = new/obj/gameturf(locate(src.x-7,src.y,src.z))
			spawn(6)
				flick("create",A3)
				A3.icon_state=""
			var/obj/A4 = new/obj/gameturf(locate(src.x-7,src.y+1,src.z))
			spawn(8)
				flick("create",A4)
				A4.icon_state=""
			var/obj/A5 = new/obj/gameturf(locate(src.x-7,src.y+2,src.z))
			spawn(10)
				flick("create",A5)
				A5.icon_state=""
			var/obj/A6 = new/obj/gameturf(locate(src.x-7,src.y+3,src.z))
			spawn(12)
				flick("create",A6)
				A6.icon_state=""
			var/obj/A7 = new/obj/gameturf(locate(src.x+7,src.y-3,src.z))
			spawn(44)
				flick("create",A7)
				A7.icon_state=""
			var/obj/A8 = new/obj/gameturf(locate(src.x+7,src.y-2,src.z))
			spawn(46)
				flick("create",A8)
				A8.icon_state=""
			var/obj/A9 = new/obj/gameturf(locate(src.x+7,src.y-1,src.z))
			spawn(48)
				flick("create",A9)
				A9.icon_state=""
			var/obj/B = new/obj/gameturf(locate(src.x+7,src.y,src.z))
			spawn(50)
				flick("create",B)
				B.icon_state=""
			var/obj/B1 = new/obj/gameturf(locate(src.x+7,src.y+1,src.z))
			spawn(52)
				flick("create",B1)
				B1.icon_state=""
			var/obj/B2 = new/obj/gameturf(locate(src.x+7,src.y+2,src.z))
			spawn(54)
				flick("create",B2)
				B2.icon_state=""
			var/obj/B3 = new/obj/gameturf(locate(src.x+7,src.y+3,src.z))
			spawn(56)
				flick("create",B3)
				B3.icon_state=""
			var/obj/B4 = new/obj/gameturf(locate(src.x-3,src.y+7,src.z))
			spawn(28)
				flick("create",B4)
				B4.icon_state=""
			var/obj/B5 = new/obj/gameturf(locate(src.x-2,src.y+7,src.z))
			spawn(30)
				flick("create",B5)
				B5.icon_state=""
			var/obj/B6 = new/obj/gameturf(locate(src.x-1,src.y+7,src.z))
			spawn(32)
				flick("create",B6)
				B6.icon_state=""
			var/obj/B7 = new/obj/gameturf(locate(src.x,src.y+7,src.z))
			spawn(34)
				flick("create",B7)
				B7.icon_state=""
			var/obj/B8 = new/obj/gameturf(locate(src.x+1,src.y+7,src.z))
			spawn(36)
				flick("create",B8)
				B8.icon_state=""
			var/obj/B9 = new/obj/gameturf(locate(src.x+2,src.y+7,src.z))
			spawn(38)
				flick("create",B9)
				B9.icon_state=""
			var/obj/C = new/obj/gameturf(locate(src.x+3,src.y+7,src.z))
			spawn(40)
				flick("create",C)
				C.icon_state=""
			var/obj/C1 = new/obj/gameturf(locate(src.x-3,src.y-7,src.z))
			spawn(16)
				flick("create",C1)
				C1.icon_state=""
			var/obj/C2 = new/obj/gameturf(locate(src.x-2,src.y-7,src.z))
			spawn(18)
				flick("create",C2)
				C2.icon_state=""
			var/obj/C3 = new/obj/gameturf(locate(src.x-1,src.y-7,src.z))
			spawn(20)
				flick("create",C3)
				C3.icon_state=""
			var/obj/C4 = new/obj/gameturf(locate(src.x,src.y-7,src.z))
			spawn(22)
				flick("create",C4)
				C4.icon_state=""
			var/obj/C5 = new/obj/gameturf(locate(src.x+1,src.y-7,src.z))
			spawn(24)
				flick("create",C5)
				C5.icon_state=""
			var/obj/C6 = new/obj/gameturf(locate(src.x+2,src.y-7,src.z))
			spawn(26)
				flick("create",C6)
				C6.icon_state=""
			var/obj/C7 = new/obj/gameturf(locate(src.x+3,src.y-7,src.z))
			spawn(28)
				flick("create",C7)
				C7.icon_state=""
			var/obj/C8 = new/obj/gameturf(locate(src.x-7,src.y-4,src.z))
			spawn(2)
				flick("create",C8)
				C8.icon_state=""
			var/obj/C9 = new/obj/gameturf(locate(src.x-7,src.y-5,src.z))
			spawn(4)
				flick("create",C9)
				C9.icon_state=""
			var/obj/D1 = new/obj/gameturf(locate(src.x-7,src.y-6,src.z))
			spawn(6)
				flick("create",D1)
				D1.icon_state=""
			var/obj/D2 = new/obj/gameturf(locate(src.x+7,src.y+6,src.z))
			spawn(50)
				flick("create",D2)
				D2.icon_state=""
			var/obj/D3 = new/obj/gameturf(locate(src.x+7,src.y+5,src.z))
			spawn(52)
				flick("create",D3)
				D3.icon_state=""
			var/obj/D4 = new/obj/gameturf(locate(src.x+7,src.y+4,src.z))
			spawn(54)
				flick("create",D4)
				D4.icon_state=""
			var/obj/D5 = new/obj/gameturf(locate(src.x+6,src.y+7,src.z))
			spawn(46)
				flick("create",D5)
				D5.icon_state=""
			var/obj/D6 = new/obj/gameturf(locate(src.x+5,src.y+7,src.z))
			spawn(44)
				flick("create",D6)
				D6.icon_state=""
			var/obj/D7 = new/obj/gameturf(locate(src.x+4,src.y+7,src.z))
			spawn(42)
				flick("create",D7)
				D7.icon_state=""
			var/obj/D8 = new/obj/gameturf(locate(src.x-4,src.y-7,src.z))
			spawn(14)
				flick("create",D8)
				D8.icon_state=""
			var/obj/D9 = new/obj/gameturf(locate(src.x-5,src.y-7,src.z))
			spawn(12)
				flick("create",D9)
				D9.icon_state=""
			var/obj/D = new/obj/gameturf(locate(src.x-6,src.y-7,src.z))
			spawn(10)
				flick("create",D)
				D.icon_state=""
			var/obj/E1 = new/obj/gameturf(locate(src.x-7,src.y+4,src.z))
			spawn(14)
				flick("create",E1)
				E1.icon_state=""
			var/obj/E2 = new/obj/gameturf(locate(src.x-7,src.y+5,src.z))
			spawn(16)
				flick("create",E2)
				E2.icon_state=""
			var/obj/E3 = new/obj/gameturf(locate(src.x-7,src.y+6,src.z))
			spawn(18)
				flick("create",E3)
				E3.icon_state=""
			var/obj/E4 = new/obj/gameturf(locate(src.x+7,src.y-6,src.z))
			spawn(38)
				flick("create",E4)
				E4.icon_state=""
			var/obj/E5 = new/obj/gameturf(locate(src.x+7,src.y-5,src.z))
			spawn(40)
				flick("create",E5)
				E5.icon_state=""
			var/obj/E6 = new/obj/gameturf(locate(src.x+7,src.y-4,src.z))
			spawn(42)
				flick("create",E6)
				E6.icon_state=""
			var/obj/E7 = new/obj/gameturf(locate(src.x-6,src.y+7,src.z))
			spawn(22)
				flick("create",E7)
				E7.icon_state=""
			var/obj/E8 = new/obj/gameturf(locate(src.x-5,src.y+7,src.z))
			spawn(24)
				flick("create",E8)
				E8.icon_state=""
			var/obj/E9 = new/obj/gameturf(locate(src.x-4,src.y+7,src.z))
			spawn(26)
				flick("create",E9)
				E9.icon_state=""
			var/obj/E = new/obj/gameturf(locate(src.x+4,src.y-7,src.z))
			spawn(30)
				flick("create",E)
				E.icon_state=""
			var/obj/F = new/obj/gameturf(locate(src.x+5,src.y-7,src.z))
			spawn(32)
				flick("create",F)
				F.icon_state=""
			var/obj/F1 = new/obj/gameturf(locate(src.x+6,src.y-7,src.z))
			spawn(34)
				flick("create",F1)
				F1.icon_state=""
			var/obj/F2 = new/obj/gameturf(locate(src.x-7,src.y+7,src.z))
			spawn(20)
				flick("create",F2)
				F2.icon_state=""
			var/obj/F3 = new/obj/gameturf(locate(src.x+7,src.y-7,src.z))
			spawn(36)
				flick("create",F3)
				F3.icon_state=""
			var/obj/F4 = new/obj/gameturf(locate(src.x-7,src.y-7,src.z))
			spawn(8)
				flick("create",F4)
				F4.icon_state=""
			var/obj/F5 = new/obj/gameturf(locate(src.x+7,src.y+7,src.z))
			spawn(48)
				flick("create",F5)
				F5.icon_state=""
			A:owner = src
			A1:owner = src
			A2:owner = src
			A3:owner = src
			A4:owner = src
			A5:owner = src
			A6:owner = src
			A7:owner = src
			A8:owner = src
			A9:owner = src
			B:owner = src
			B1:owner = src
			B2:owner = src
			B3:owner = src
			B4:owner = src
			B5:owner = src
			B6:owner = src
			B7:owner = src
			B8:owner = src
			B9:owner = src
			C:owner = src
			C1:owner = src
			C2:owner = src
			C3:owner = src
			C4:owner = src
			C5:owner = src
			C6:owner = src
			C7:owner = src
			C8:owner = src
			C9:owner = src
			D:owner = src
			D1:owner = src
			D2:owner = src
			D3:owner = src
			D4:owner = src
			D5:owner = src
			D6:owner = src
			D7:owner = src
			D8:owner = src
			D9:owner = src
			E:owner = src
			E1:owner = src
			E2:owner = src
			E3:owner = src
			E4:owner = src
			E5:owner = src
			E6:owner = src
			E7:owner = src
			E8:owner = src
			E9:owner = src
			F:owner = src
			F1:owner = src
			F2:owner = src
			F3:owner = src
			F4:owner = src
			F5:owner = src
			spawn(900)
			src.gaming=0
		Jomon()
			if(src.gaming)
				src<<"<b>You must wait a little"
				return
			if(src.rei<1000)
				src<<"<b>You need more rei [src.rei]/1000"
				return
			if(src.safe||src.fireback)
				src<<"<b>You're in a safe zone!"
				return
			src.gaming=1
			src.rei-=1000
			view(src,8) << "<b>[src]: Kikai no Jomon!"
			if(src.etarget)src.Facedir(src.etarget)
			var/obj/A = new/obj/jomon(locate(src.x-7,src.y-3,src.z))
			spawn(0)
				flick("create",A)
				A.icon_state=""
			var/obj/A1 = new/obj/jomon(locate(src.x-7,src.y-2,src.z))
			spawn(2)
				flick("create",A1)
				A1.icon_state=""
			var/obj/A2 = new/obj/jomon(locate(src.x-7,src.y-1,src.z))
			spawn(4)
				flick("create",A2)
				A2.icon_state=""
			var/obj/A3 = new/obj/jomon(locate(src.x-7,src.y,src.z))
			spawn(6)
				flick("create",A3)
				A3.icon_state=""
			var/obj/A4 = new/obj/jomon(locate(src.x-7,src.y+1,src.z))
			spawn(8)
				flick("create",A4)
				A4.icon_state=""
			var/obj/A5 = new/obj/jomon(locate(src.x-7,src.y+2,src.z))
			spawn(10)
				flick("create",A5)
				A5.icon_state=""
			var/obj/A6 = new/obj/jomon(locate(src.x-7,src.y+3,src.z))
			spawn(12)
				flick("create",A6)
				A6.icon_state=""
			var/obj/A7 = new/obj/jomon(locate(src.x+7,src.y-3,src.z))
			spawn(44)
				flick("create",A7)
				A7.icon_state=""
			var/obj/A8 = new/obj/jomon(locate(src.x+7,src.y-2,src.z))
			spawn(46)
				flick("create",A8)
				A8.icon_state=""
			var/obj/A9 = new/obj/jomon(locate(src.x+7,src.y-1,src.z))
			spawn(48)
				flick("create",A9)
				A9.icon_state=""
			var/obj/B = new/obj/jomon(locate(src.x+7,src.y,src.z))
			spawn(50)
				flick("create",B)
				B.icon_state=""
			var/obj/B1 = new/obj/jomon(locate(src.x+7,src.y+1,src.z))
			spawn(52)
				flick("create",B1)
				B1.icon_state=""
			var/obj/B2 = new/obj/jomon(locate(src.x+7,src.y+2,src.z))
			spawn(54)
				flick("create",B2)
				B2.icon_state=""
			var/obj/B3 = new/obj/jomon(locate(src.x+7,src.y+3,src.z))
			spawn(56)
				flick("create",B3)
				B3.icon_state=""
			var/obj/B4 = new/obj/jomon(locate(src.x-3,src.y+7,src.z))
			spawn(28)
				flick("create",B4)
				B4.icon_state=""
			var/obj/B5 = new/obj/jomon(locate(src.x-2,src.y+7,src.z))
			spawn(30)
				flick("create",B5)
				B5.icon_state=""
			var/obj/B6 = new/obj/jomon(locate(src.x-1,src.y+7,src.z))
			spawn(32)
				flick("create",B6)
				B6.icon_state=""
			var/obj/B7 = new/obj/jomon(locate(src.x,src.y+7,src.z))
			spawn(34)
				flick("create",B7)
				B7.icon_state=""
			var/obj/B8 = new/obj/jomon(locate(src.x+1,src.y+7,src.z))
			spawn(36)
				flick("create",B8)
				B8.icon_state=""
			var/obj/B9 = new/obj/jomon(locate(src.x+2,src.y+7,src.z))
			spawn(38)
				flick("create",B9)
				B9.icon_state=""
			var/obj/C = new/obj/jomon(locate(src.x+3,src.y+7,src.z))
			spawn(40)
				flick("create",C)
				C.icon_state=""
			var/obj/C1 = new/obj/jomon(locate(src.x-3,src.y-7,src.z))
			spawn(16)
				flick("create",C1)
				C1.icon_state=""
			var/obj/C2 = new/obj/jomon(locate(src.x-2,src.y-7,src.z))
			spawn(18)
				flick("create",C2)
				C2.icon_state=""
			var/obj/C3 = new/obj/jomon(locate(src.x-1,src.y-7,src.z))
			spawn(20)
				flick("create",C3)
				C3.icon_state=""
			var/obj/C4 = new/obj/jomon(locate(src.x,src.y-7,src.z))
			spawn(22)
				flick("create",C4)
				C4.icon_state=""
			var/obj/C5 = new/obj/jomon(locate(src.x+1,src.y-7,src.z))
			spawn(24)
				flick("create",C5)
				C5.icon_state=""
			var/obj/C6 = new/obj/jomon(locate(src.x+2,src.y-7,src.z))
			spawn(26)
				flick("create",C6)
				C6.icon_state=""
			var/obj/C7 = new/obj/jomon(locate(src.x+3,src.y-7,src.z))
			spawn(28)
				flick("create",C7)
				C7.icon_state=""
			var/obj/C8 = new/obj/jomon(locate(src.x-7,src.y-4,src.z))
			spawn(2)
				flick("create",C8)
				C8.icon_state=""
			var/obj/C9 = new/obj/jomon(locate(src.x-7,src.y-5,src.z))
			spawn(4)
				flick("create",C9)
				C9.icon_state=""
			var/obj/D1 = new/obj/jomon(locate(src.x-7,src.y-6,src.z))
			spawn(6)
				flick("create",D1)
				D1.icon_state=""
			var/obj/D2 = new/obj/jomon(locate(src.x+7,src.y+6,src.z))
			spawn(50)
				flick("create",D2)
				D2.icon_state=""
			var/obj/D3 = new/obj/jomon(locate(src.x+7,src.y+5,src.z))
			spawn(52)
				flick("create",D3)
				D3.icon_state=""
			var/obj/D4 = new/obj/jomon(locate(src.x+7,src.y+4,src.z))
			spawn(54)
				flick("create",D4)
				D4.icon_state=""
			var/obj/D5 = new/obj/jomon(locate(src.x+6,src.y+7,src.z))
			spawn(46)
				flick("create",D5)
				D5.icon_state=""
			var/obj/D6 = new/obj/jomon(locate(src.x+5,src.y+7,src.z))
			spawn(44)
				flick("create",D6)
				D6.icon_state=""
			var/obj/D7 = new/obj/jomon(locate(src.x+4,src.y+7,src.z))
			spawn(42)
				flick("create",D7)
				D7.icon_state=""
			var/obj/D8 = new/obj/jomon(locate(src.x-4,src.y-7,src.z))
			spawn(14)
				flick("create",D8)
				D8.icon_state=""
			var/obj/D9 = new/obj/jomon(locate(src.x-5,src.y-7,src.z))
			spawn(12)
				flick("create",D9)
				D9.icon_state=""
			var/obj/D = new/obj/jomon(locate(src.x-6,src.y-7,src.z))
			spawn(10)
				flick("create",D)
				D.icon_state=""
			var/obj/E1 = new/obj/jomon(locate(src.x-7,src.y+4,src.z))
			spawn(14)
				flick("create",E1)
				E1.icon_state=""
			var/obj/E2 = new/obj/jomon(locate(src.x-7,src.y+5,src.z))
			spawn(16)
				flick("create",E2)
				E2.icon_state=""
			var/obj/E3 = new/obj/jomon(locate(src.x-7,src.y+6,src.z))
			spawn(18)
				flick("create",E3)
				E3.icon_state=""
			var/obj/E4 = new/obj/jomon(locate(src.x+7,src.y-6,src.z))
			spawn(38)
				flick("create",E4)
				E4.icon_state=""
			var/obj/E5 = new/obj/jomon(locate(src.x+7,src.y-5,src.z))
			spawn(40)
				flick("create",E5)
				E5.icon_state=""
			var/obj/E6 = new/obj/jomon(locate(src.x+7,src.y-4,src.z))
			spawn(42)
				flick("create",E6)
				E6.icon_state=""
			var/obj/E7 = new/obj/jomon(locate(src.x-6,src.y+7,src.z))
			spawn(22)
				flick("create",E7)
				E7.icon_state=""
			var/obj/E8 = new/obj/jomon(locate(src.x-5,src.y+7,src.z))
			spawn(24)
				flick("create",E8)
				E8.icon_state=""
			var/obj/E9 = new/obj/jomon(locate(src.x-4,src.y+7,src.z))
			spawn(26)
				flick("create",E9)
				E9.icon_state=""
			var/obj/E = new/obj/jomon(locate(src.x+4,src.y-7,src.z))
			spawn(30)
				flick("create",E)
				E.icon_state=""
			var/obj/F = new/obj/jomon(locate(src.x+5,src.y-7,src.z))
			spawn(32)
				flick("create",F)
				F.icon_state=""
			var/obj/F1 = new/obj/jomon(locate(src.x+6,src.y-7,src.z))
			spawn(34)
				flick("create",F1)
				F1.icon_state=""
			var/obj/F2 = new/obj/jomon(locate(src.x-7,src.y+7,src.z))
			spawn(20)
				flick("create",F2)
				F2.icon_state=""
			var/obj/F3 = new/obj/jomon(locate(src.x+7,src.y-7,src.z))
			spawn(36)
				flick("create",F3)
				F3.icon_state=""
			var/obj/F4 = new/obj/jomon(locate(src.x-7,src.y-7,src.z))
			spawn(8)
				flick("create",F4)
				F4.icon_state=""
			var/obj/F5 = new/obj/jomon(locate(src.x+7,src.y+7,src.z))
			spawn(48)
				flick("create",F5)
				F5.icon_state=""
			A:owner = src
			A1:owner = src
			A2:owner = src
			A3:owner = src
			A4:owner = src
			A5:owner = src
			A6:owner = src
			A7:owner = src
			A8:owner = src
			A9:owner = src
			B:owner = src
			B1:owner = src
			B2:owner = src
			B3:owner = src
			B4:owner = src
			B5:owner = src
			B6:owner = src
			B7:owner = src
			B8:owner = src
			B9:owner = src
			C:owner = src
			C1:owner = src
			C2:owner = src
			C3:owner = src
			C4:owner = src
			C5:owner = src
			C6:owner = src
			C7:owner = src
			C8:owner = src
			C9:owner = src
			D:owner = src
			D1:owner = src
			D2:owner = src
			D3:owner = src
			D4:owner = src
			D5:owner = src
			D6:owner = src
			D7:owner = src
			D8:owner = src
			D9:owner = src
			E:owner = src
			E1:owner = src
			E2:owner = src
			E3:owner = src
			E4:owner = src
			E5:owner = src
			E6:owner = src
			E7:owner = src
			E8:owner = src
			E9:owner = src
			F:owner = src
			F1:owner = src
			F2:owner = src
			F3:owner = src
			F4:owner = src
			F5:owner = src
			for(var/mob/M in view(7,src))
				M.Jomoned()
			spawn(700)
			src.gaming=0
mob
	proc
		Shirafune()
			if(src.stype=="Dark Bat"||src.ftype=="Dark Bat"|| src.ressurectiontype=="Dark Bat")
				if(src.shirafunecd)
					src<<"<b>You have to wait a little!"
					return
				if(src.rei<2000)
					src<<"<b>You need more rei [src.rei]/2000"
					return
				if(src.safe||src.fireback)
					src<<"<b>You're in a safe zone!"
					return
				view(src)<<"<b>[src]:Dark Spear!"
				src.rei-=2000
				src.frozen=1
				src.shirafunecd=1
				var/obj/o=new/obj/darkshirafune(src.loc)
				o.Gowner=src
				flick("trail",o)
				step(o,src.dir)
				var/obj/os=new/obj/darkshirafune(src.loc)
				os.Gowner=src
				flick("trail",os)
				step(os,src.dir)
				step(os,src.dir)
				var/obj/od=new/obj/darkshirafune(src.loc)
				od.Gowner=src
				flick("head",od)
				step(od,src.dir)
				step(od,src.dir)
				step(od,src.dir)
				spawn(10)
				src.frozen=0
				sleep(100)
				src.shirafunecd=0
			else
				if(src.shirafunecd)
					src<<"<b>You have to wait a little!"
					return
				if(src.rei<2000)
					src<<"<b>You need more rei [src.rei]/2000"
					return
				if(src.safe||src.fireback)
					src<<"<b>You're in a safe zone!"
					return
				view(src)<<"<b>[src]:Shirafune!"
				src.rei-=2000
				src.frozen=1
				src.shirafunecd=1
				var/obj/o=new/obj/shirafune(src.loc)
				o.Gowner=src
				flick("trail",o)
				step(o,src.dir)
				var/obj/os=new/obj/shirafune(src.loc)
				os.Gowner=src
				flick("trail",os)
				step(os,src.dir)
				step(os,src.dir)
				var/obj/od=new/obj/shirafune(src.loc)
				od.Gowner=src
				flick("head",od)
				step(od,src.dir)
				step(od,src.dir)
				step(od,src.dir)
				spawn(10)
				src.frozen=0
				sleep(100)
				src.shirafunecd=0
		Ice_Freeze()
			if(src.stype == "Dark Bat"||src.ftype=="Dark Bat"|| src.ressurectiontype=="Dark Bat")
				if(src.icefreezecd)
					src<<"<b>You have to wait a little (25 secs)!"
					return
				if(src.rei<1500)
					src<<"<b>You need more rei [src.rei]/1500"
					return
				if(src.safe||src.fireback)
					src<<"<b>You're in a safe zone!"
					return
				if(!src.etarget)
					src<<"<b>You need a target!"
					return
				view(src)<<"<b>[src]:Freeze from fear!"
				src.icefreezecd=1
				src.rei-=1500
				var/mob/M=src.etarget
				var/obj/o=new/obj/darksuffocation(M.loc)
				o.Gowner=src
				sleep(250)
				src.icefreezecd=0
			else
				if(src.icefreezecd)
					src<<"<b>You have to wait a little (25 secs)!"
					return
				if(src.rei<1500)
					src<<"<b>You need more rei [src.rei]/1500"
					return
				if(src.safe||src.fireback)
					src<<"<b>You're in a safe zone!"
					return
				if(!src.etarget)
					src<<"<b>You need a target!"
					return
				view(src)<<"<b>[src]:Ice Freeze!"
				src.icefreezecd=1
				src.rei-=1500
				var/mob/M=src.etarget
				var/obj/o=new/obj/papersuffocation(M.loc)
				o.Gowner=src
				sleep(250)
				src.icefreezecd=0
		Laceration()
			if(src.lacerationcd)
				src<<"<b>You have to wait a little!"
				return
			if(src.rei<1000)
				src<<"<b>You need more rei [src.rei]/1000"
				return
			if(src.safe||src.fireback)
				src<<"<b>You're in a safe zone!"
				return
			src.lacerationcd=1
			src.rei-=1000
			flick("punch",src)
			for(var/mob/M in get_step(src,src.dir))
				if(!M.protected&&!M.ko)
					M.Lacerated()
					view(src)<<"<b>[src] has lacerated [M] to the point where he cannot regen and will continually lose blood!"
					M.Death(src,0,0)
			sleep(300)
			src.lacerationcd=0
		Outrage()
			if(src.outraging)
				src<<"<b>You have to wait a little!"
				return
			if(src.rei<1000)
				src<<"<b>You need more rei [src.rei]/1000"
				return
			if(src.safe||src.fireback)
				src<<"<b>You're in a safe zone!"
				return
			for(var/mob/M in get_step(src,src.dir))
				if(!M.ko)
					src<<"<b>He must first be koed!"
					return
				else
					src.outraging=1
					new/obj/outrage(M.loc)
					Blood(M.x,M.y,M.z)
					src.rei-=1000
					M.wound+=20
					view(src)<<"<b>[src] has outraged on [M], giving him 20 wounds!"
					if(M.outback==1)
						src.wound+=20
						view(src)<<"<b>[M] has reflected outraged back to [src], giving him 20 wounds!"
					spawn()M.Deathd(src)
					if(src.key=="Audain1")
						sleep(350)
					else
						sleep(400)
					src.outraging=0
		Restep()
			if(src.restepping)
				src<<"<b>You have to wait at least 10 seconds!"
				return
			if(src.rei<500)
				src<<"<b>You need more rei [src.rei]/500"
				return
			src.restep=1
			src.restepping=1
			src.steploc=src.loc
			src<<"<b>After taking 8 foot steps you will make an illusion!"
			src.controlbug=1
			src.rei-=500
		Illusionary_Death()
			if(src.kawacool)
				src<<"<b>You have to wait at least 20 seconds!"
				return
			if(src.gotthecharge)
				return
			if(src.rei<500)
				src<<"<b>You need more rei [src.rei]/500"
				return
			src.kawa=1
			src.inindeath=1
			src<<"<b>If you are attacked within 20 seconds you will come back here!"
			src.kx=src.x
			src.ky=src.y
			src.kz=src.z
			src.kawacool=1
			src.rei-=500
			sleep(20 SECONDS)
			src.inindeath=0
			src.kawa=0
			src<<"<b>It has ended!"
			sleep(50)
			src.kawacool=0
		Zanpaktou_Seal()
			if(src.sealed)
				src<<"<b>You have to wait a little bit!"
				return
			if(src.rei<1000)
				src<<"<b>You need more rei [src.rei]/1000"
				return
			if(!src.materialized)
				src<<"<b>You must first materialize your zanpaktou"
				return
			if(!src.etarget)
				src<<"<b>You need a target"
				return
			for(var/mob/M in view(8,src))
				if(M.ismura)
					if(M.owner==src)
						M.sealing=1
						walk_towards(M,src.etarget,3)
						spawn(12)
							walk(M,0)
							M.sealing=0
			src.sealed=1
			src.rei-=1000
			sleep(100)
			src.sealed=0
		Zanpaktou_Instincts()
			if(src.sealed)
				src<<"<b>You have to wait a little bit!"
				return
			if(src.rei<1500)
				src<<"<b>You need more rei [src.rei]/1500"
				return
			if(!src.materialized)
				src<<"<b>You must first materialize your zanpaktou"
				return
			if(!src.etarget)
				src<<"<b>You need a target"
				return
			for(var/mob/M in view(8,src))
				if(M.ismura)
					if(M.owner==src)
						M.sealing=1
						M.bringout=1
						walk_towards(M,src.etarget,3)
						spawn(12)
							walk(M,0)
							M.sealing=0
							M.bringout=0
			src.sealed=1
			src.rei-=1500
			sleep(300)
			src.sealed=0
		Invisible_Wires()
			if(src.wired)
				src<<"<b>You have to wait a little bit!"
				return
			if(src.rei<500)
				src<<"<b>You need more rei [src.rei]/500"
				return
			if(!src.etarget)
				src<<"<b>You need a target"
				return
			for(var/mob/M in view(8,src))
				if(M.killable)src.shimastery(4)
				var/mob/n=src.etarget
				n.Wired()
			src.wired=1
			src.rei-=500
			sleep(200)
			src.wired=0
		Materialize()
			if(src.materialized)
				for(var/mob/M in All_Clients())
					if(M.ismura)
						if(M.owner==src)
							del M
							src.materializedcool=1
							src.materialized=0
							src.Start_Zan_Restore()
							return
			if(src.safe||src.fireback)
				src<<"<b>You are in a safe zone"
				return
			if(src.rei<500)
				src<<"<b>You need more rei [src.rei]/500"
				return
			if(src.materializedcool)
				src<<"<b>You must wait at least 20 seconds before materializing again"
				return
			if(src.inshikai||src.inbankai)
				src.rei-=500
				src.shimastery(5)
				src.materialized=1
				var/mob/M=new/mob/Zan2(src.loc)
				M.owner=src
				M.mattack=src.mattack
				M.attack=M.mattack
				M.mdefence=src.mdefence
				M.defence=src.defence
				M.mreiatsu=src.mreiatsu
				M.reiatsu=src.reiatsu
				M.mhealth=src.mhealth
				M.health=M.mhealth
				M.mrei=src.mrei
				M.rei=M.mrei
				M.name="{Zanpaktou}[src.swordname]"
				M.Aggro(src.etarget)
				src.materializedcool=1
				sleep(20 SECONDS)
				src.materializedcool=0
		Petal_Sword()
			if(src.safezone)
				src<<"You reactivate your safe zone!"
				src.safezone=0
				src.caughtpetal=0
				src.Load_Overlays()
				return
			if(!src.safezone)
				src.safezone=1
				src.Load_Overlays()
				src<<"<b>You remove your safe zone, allowing your own petals to attack you when you press F to shoot a petal sword!"
		Berserk()
			if(src.inberserk)
				src<<"You deactivate this!"
				inberserk=0
				src.Load_Overlays()
				return
	//		if(src.wound<25)
	//			src<<"You need to have over 25 wounds!"
	//		if(src.wound>=25)
			else
				src.inberserk=1

				src.Load_Overlays()
				if(!src.etarget)
					src<<"<b>You must target someone to start going berserk"
				else
					src.Berserks(src.etarget)
		Homing_Shurikens()
			if(src.hs)
				src<<"You deactivate this!"
				src.hs=0
				src.Load_Overlays()
				return
			if(src.frozen)
				src<<"Wait!"
				return
			if(!src.hs)
				src.hs=1
				src.Load_Overlays()
				src<<"<b>You can now make your shurikens home in on targets"

		Homing_Blasts()
			if(src.hs)
				src<<"You deactivate this!"
				src.hs=0
				return
			if(src.frozen)
				src<<"Wait!"
				return
			if(!src.hs)
				src.hs=1
				src<<"<b>Your blasts now home in on targets"
		Critical_Punch()
			if(src.crit)
				src<< "You must wait a little to use this again!"
				return
			if(!src.armon)
				src<< "<b>You must have an arm on!"
				return
			if(src.safe||src.fireback)
				return
			if(src.rei < 750)
				src<< "You need [src.rei]/1000 rei!"
				return
			if(src.criticalhitcd)
				src<<"You must wait at least 9 secs"
				return
			if(!src.criticalhitcd)
				src<<"Press F to attack"
				src.crit=1
				src.criticalhitcd=1
				sleep(90)
				src.criticalhitcd=0
		Sprenger_Pentagon()
			if(!src.enemy)
				for(var/obj/items/Seele_Schneider/k in src.contents)
					if(k.suffix=="0"||k.suffix=="1"||k.suffix=="2"||k.suffix=="3"||k.suffix=="4")
						src << "<b>You need 5 Seele Schneiders to use this move."
						return
			if(src.rei < 1000)
				src << "<b>Your rei is too low!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.bowon)
				src << "<b>You need to have your bow on!"
				return
			var/many=0
			for(var/obj/ji)
				if(ji.Gowner==src)
					if(ji.sp)
						many+=1
			if(many>12)
				src<<"<b>You can only set up 3 pentagons at a time"
				return
			if(!src.sprengerpentagoncd)
				src.sprengerpentagoncd = 1
				src.rei -= 1000
				src.spren=0
				for(var/obj/items/Seele_Schneider/k in src.contents)
					k.stacked--
					k.stacked--
					k.stacked--
					k.stacked--
					k.stacked--
					if(k.stacked<=0)
						src.hasaseele=0
						src.seelsword=0
						del(k)
				var/obj/s=new/obj/center(src.loc)
				s.Gowner=src
				var/obj/K=new/obj(locate(src.x,src.y+2,src.z))
				K.Gowner=src
				K.sp=1
				var/image/I = image('Icons/silverstand.dmi',K)  //make an image attached to src
				src << I
				var/obj/Ka=new/obj(locate(src.x-2,src.y+1,src.z))
				Ka.Gowner=src
				Ka.sp=1
				var/image/Id = image('Icons/silverstand.dmi',Ka)  //make an image attached to src
				src << Id
				var/obj/Kad=new/obj(locate(src.x+2,src.y+1,src.z))
				Kad.Gowner=src
				Kad.sp=1
				var/image/Idd = image('Icons/silverstand.dmi',Kad)  //make an image attached to src
				src << Idd
				var/obj/Kac=new/obj(locate(src.x-2,src.y-3,src.z))
				Kac.Gowner=src
				Kac.sp=1
				var/image/Idc = image('Icons/silverstand.dmi',Kac)  //make an image attached to src
				src << Idc
				var/obj/Kads=new/obj(locate(src.x+2,src.y-3,src.z))
				Kads.Gowner=src
				Kads.sp=1
				var/image/Idds = image('Icons/silverstand.dmi',Kads)  //make an image attached to src
				src << Idds
				if(src.spiritweapon!=2)
					src<<"You must shoot an arrow through each seele to prepare the finishing attacking!(NOTE: You can set up 2 Pentagons)"
				if(src.spiritweapon==2)
					src.spren=5
					src<<"The next time you press F you will detonate your Pentagon"
				sleep(50)
				src.sprengerpentagoncd=0
		Splitting_Arrow()
			if(src.rei < 300)
				src << "<b>Your rei is too low!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.bowon)
				src << "<b>You need to have your bow on!"
				return
			if(!src.splittingarrowcd)
				view(8) << "<b>[src]: Splitting Arrow!"
				src.splittingarrowcd = 1
				src.rei -= 400
				var/obj/K = new/obj/arrow(src.loc)
				K:Gowner = src
				K.dir=src.dir
				walk(K,src.dir)
				K:attack = src.reiatsu
				spawn(1)
					if(K)
						var/obj/Ka = new/obj/arrow(K.loc)
						Ka:Gowner = src
						Ka.dir = turn(K.dir, 45)
						Ka:attack = src.reiatsu
						walk(Ka,Ka.dir)
						var/obj/Ks = new/obj/arrow(K.loc)
						Ks:Gowner = src
						Ks.dir = turn(K.dir, -45)
						Ks:attack = src.reiatsu
						walk(Ks,Ks.dir)
						spawn(1)
							if(Ka)
								var/obj/Kaa = new/obj/arrow(Ka.loc)
								Kaa:Gowner = src
								Kaa.dir = turn(Ka.dir, -45)
								Kaa:attack = src.reiatsu
								walk(Kaa,Kaa.dir)
							if(Ks)
								var/obj/Kss = new/obj/arrow(Ks.loc)
								Kss:Gowner = src
								Kss.dir = turn(Ks.dir, 45)
								Kss:attack = src.reiatsu
								walk(Kss,Kss.dir)
				sleep(45)
				src.splittingarrowcd=0
		Sovereigns()
			if(src.rei < 500)
				src << "<b>Your rei is too low [src.rei]/500!"
				return
			if(src.safe||src.fireback)
				return
			var/mob/G=src.etarget
			if(!G in oview(src))
				src << "<b>You need a target in view!"
				return
			if(!G)
				src << "<b>You need a target in view!"
				return
			if(!src.sov)
				src.sov = 1
				src.rei -= 500
				spawn()G.Sovereign(src)
				sleep(150)
				src.sov=0
		Tentacle_Attack()
			if(!src.ressurection)
				src<<"You must be in ressurection"
				return
			if(src.safe||src.fireback)
				return
			if(src.rei <= 1000)
				src << "<b>Your rei is too low!"
				return
			if(!src.tentacleattackcd)
				src.tentacleattackcd = 1
				src.rei -= 1000
				if(src.dir == SOUTH||src.dir == NORTH)
					var/obj/tentacle/A = new /obj/tentacle/
					var/obj/tentacle/B = new /obj/tentacle/
					var/obj/tentacle/C = new /obj/tentacle/
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
					var/obj/tentacle/Ca = new /obj/tentacle/
					var/obj/tentacle/Ba = new /obj/tentacle/
					Ca.loc = locate(src.x+2, src.y, src.z)
					Ba.loc = locate(src.x-2, src.y, src.z)
					Ba.dir = src.dir
					Ca.dir = src.dir
					Ba.Gowner = src
					Ca.Gowner = src
					walk(Ca,src.dir)
					walk(Ba,src.dir)
					var/obj/tentacle/Caa = new /obj/tentacle/
					var/obj/tentacle/Baa = new /obj/tentacle/
					Caa.loc = locate(src.x+3, src.y, src.z)
					Baa.loc = locate(src.x-3, src.y, src.z)
					Baa.dir = src.dir
					Caa.dir = src.dir
					Baa.Gowner = src
					Caa.Gowner = src
					walk(Caa,src.dir)
					walk(Baa,src.dir)
					var/obj/tentacle/Caaa = new /obj/tentacle/
					var/obj/tentacle/Baaa = new /obj/tentacle/
					Caaa.loc = locate(src.x+4, src.y, src.z)
					Baaa.loc = locate(src.x-4, src.y, src.z)
					Baaa.dir = src.dir
					Caaa.dir = src.dir
					Baaa.Gowner = src
					Caaa.Gowner = src
					walk(Caaa,src.dir)
					walk(Baaa,src.dir)
					var/obj/tentacle/Caaaa = new /obj/tentacle/
					var/obj/tentacle/Baaaa = new /obj/tentacle/
					Caaaa.loc = locate(src.x+5, src.y, src.z)
					Baaaa.loc = locate(src.x-5, src.y, src.z)
					Baaaa.dir = src.dir
					Caaaa.dir = src.dir
					Baaaa.Gowner = src
					Caaaa.Gowner = src
					walk(Caaaa,src.dir)
					walk(Baaaa,src.dir)
				if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST||src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
					var/obj/tentacle/A = new /obj/tentacle/
					var/obj/tentacle/B = new /obj/tentacle/
					var/obj/tentacle/C = new /obj/tentacle/
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
					var/obj/tentacle/Ca = new /obj/tentacle/
					var/obj/tentacle/Ba = new /obj/tentacle/
					Ca.loc = locate(src.x, src.y+2, src.z)
					Ba.loc = locate(src.x, src.y-2, src.z)
					Ba.dir = src.dir
					Ca.dir = src.dir
					Ba.Gowner = src
					Ca.Gowner = src
					walk(Ca,src.dir)
					walk(Ba,src.dir)
					var/obj/tentacle/Caa = new /obj/tentacle/
					var/obj/tentacle/Baa = new /obj/tentacle/
					Caa.loc = locate(src.x, src.y+3, src.z)
					Baa.loc = locate(src.x, src.y-3, src.z)
					Baa.dir = src.dir
					Caa.dir = src.dir
					Baa.Gowner = src
					Caa.Gowner = src
					walk(Caa,src.dir)
					walk(Baa,src.dir)
					var/obj/tentacle/Caaa = new /obj/tentacle/
					var/obj/tentacle/Baaa = new /obj/tentacle/
					Caaa.loc = locate(src.x, src.y+4, src.z)
					Baaa.loc = locate(src.x, src.y-4, src.z)
					Baaa.dir = src.dir
					Caaa.dir = src.dir
					Baaa.Gowner = src
					Caaa.Gowner = src
					walk(Caaa,src.dir)
					walk(Baaa,src.dir)
					var/obj/tentacle/Caaaa = new /obj/tentacle/
					var/obj/tentacle/Baaaa = new /obj/tentacle/
					Caaaa.loc = locate(src.x, src.y+5, src.z)
					Baaaa.loc = locate(src.x, src.y-5, src.z)
					Baaaa.dir = src.dir
					Caaaa.dir = src.dir
					Baaaa.Gowner = src
					Caaaa.Gowner = src
					walk(Caaaa,src.dir)
					walk(Baaaa,src.dir)
				sleep(110)
				src.tentacleattackcd = 0
		Acceleration()
			if(src.running)
				src << "<b>You are already using this"
				return
			if(src.runningcool)
				src << "<b>You must wait a few seconds before using this again"
				return
			if(src.flags)
				src << "<b>You can't use this with the flag"
				return
			if(src.gotthecharge)
				src << "<b>You can't use this with the charge"
				return
			if(!src.running)
				if(!src.inbankai&&src.stype=="Ichigo"&&src.ftype!="Ichigo"||!src.stype=="Fujimaru")
					src << "<b>You must be in bankai."
					return
				if(!src.inshikai&&src.stype=="Stinger"&&src.ftype!="Ichigo"||!src.stype=="Fujimaru")
					src << "<b>You must be in shikai."
					return
				else
					src.running=0
					fg
					spawn(1)
						src.running+=1
						src.allowmove=1
						step(src,src.dir)
						if(src.running<100)
							goto fg
						else
							src.running=0
							src.runningcool=1
							src.allowmove=0
					sleep(300)
					src.runningcool=0
		Acceleration_Overdrive()
			if(src.running)
				src << "<b>You are already using this"
				return
			if(src.runningcool)
				src << "<b>You must wait a few seconds before using this again"
				return
			if(!src.running)
				src.running=0
				fg
				spawn(1)
					src.running+=1
					src.moving=0
					step(src,src.dir)
					src.moving=0
					step(src,src.dir)
					src.moving=0
					if(src.running<100)
						goto fg
					else
						src.running=0
						src.runningcool=1
				sleep(400)
				src.runningcool=0
		Benihikou()
			if(src.rei < 500)
				src << "<b>Your rei is too low!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.benihikoucd)
				view(8) << "<b>[src]: Benihikou!"
				src.benihikoucd = 1
				src.rei -= 500
				flick("Sword Slash1",src)
				var/K = new/obj/benihikou(src.loc)
				K:Gowner = src
				walk(K,src.dir)
				spawn(2)
					var/Ka = new/obj/benihikou(src.loc)
					Ka:Gowner = src
					walk(Ka,src.dir)
					if(src.inbankai)
						spawn(2)
							var/Kda = new/obj/benihikou(src.loc)
							Kda:Gowner = src
							walk(Kda,src.dir)
				sleep(50)
				src.benihikoucd=0
		Rocket()
			if(!src.inbankai)
				src << "You must be in bankai!"
				return
			if(src.rei < 1500)
				src << "<b>Your rei is too low!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.rocketcd)
				src.rocketcd = 1
				src.rei -= 1500
				src.moving=0
				var/obj/K = new/obj/rocket(src.loc)
				var/d=src.dir
				step(src,src.OppositeDirection())
				src.dir=d
				src.frozen=1
				flick("punch",src)
				K:Gowner = src
				K:dir=src.dir
				spawn(1)
				src.frozen=0
				sleep(25 SECONDS)
				src.rocketcd=0
		La_Gota()
			if(src.key=="Audain1") goto here_la
			if(!src.ressurection)
				src << "You must be in ressurection!"
				return
			here_la
			if(src.rei < 3500)
				src << "<b>Your rei is too low [src.rei]/4000!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.lagotacd)
				src.lagotacd = 1
				src.rei -= 3500
				src.frozen=1
				flick("Sword Slash1",src)
				var/obj/K = new/obj/trident(src.loc)
				K:Gowner = src
				K:dir=src.dir
				spawn(1)
				src.frozen=0
				spawn(330)
				src.lagotacd=0
		Air_Blade()
			if(!src.inshikai&&!src.inbankai)
				src << "You must be in shikai!"
				return
			if(src.rei < 500)
				src << "<b>Your rei is too low [src.rei]/500!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.lagotacd)
				src.lagotacd = 1
				src.rei -= 1000
				src.frozen=1
				flick("punch",src)
				var/obj/K = new/obj/airblade(src.loc)
				K:Gowner = src
				K:dir=src.dir
				spawn(1)
				src.frozen=0
				spawn(25)
				src.lagotacd=0
		Throw()
			if(src.race!="Arrancar")
				if(!src.ulqgotsword)
					src << "<b>Press F to  make your lance!"
					return
			else
				ulqgotsword=1
			if(src.rei < 3500)
				src << "<b>Your rei is too low [src.rei]/3500!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.throwcd)
				src.throwcd = 1
				src.ulqgotsword=0
				if(src.stype == "Dark Bat"||src.ftype=="Dark Bat"|| src.ressurectiontype=="Dark Bat")
					src.overlays-=/obj/Zanpakutou/Dark_Aura/top
					src.overlays-=/obj/Zanpakutou/Dark_Aura/mid
					src.overlays-=/obj/Zanpakutou/Dark_Aura/bot
					src.rei -= 3500
					flick("Sword Slash1",src)
					var/K = new/obj/darksword(src.loc)
					K:Gowner = src
					walk(K,src.dir)
					spawn(200)
					src.throwcd=0
				else
					src.overlays-=/obj/Zanpakutou/Ulq
					src.rei -= 3500
					flick("Sword Slash1",src)
					var/K = new/obj/ulqsword(src.loc)
					K:Gowner = src
					walk(K,src.dir)
					if(src.race!="Arrancar")
						spawn(150)
						src.throwcd=0
					else
						spawn(200)
						src.throwcd=0
		Spear()
			if(src.rei < 1500)
				src << "<b>Your rei is too low!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.spearcd)
				src.spearcd = 1
				src.frozen=1
				src.rei -= 1500
				flick("Sword Slash1",src)
				var/K = new/obj/spear1(src.loc)
				var/Ka = new/obj/spear2(src.loc)
				var/Kaa = new/obj/spear3(src.loc)
				K:Gowner = src
				Ka:Gowner = src
				Kaa:Gowner = src
				walk(K,src.dir)
				spawn(1)
				walk(Ka,src.dir)
				spawn(2)
					walk(Kaa,src.dir)
					src.frozen=0
				spawn(70)
				src.spearcd=0
		Copy()
			if(!src.etarget)
				src << "You must target someone first"
				return
			if(src.rei<300)
				src << "You need [src.rei]/300 rei"
				return
			if(src.etarget && src.rei>=300)
				var/mob/M=src.etarget
				if(M.npc)return
				if(!src.copycd)
					if(M in oview())
						src.copycd=1
						view() << "<font size=1><font face=verdana><b><font color=white>[src]<font color=green> Says: Copy!"
						var/list/O = src.overlays.Copy()
						var/list/Or = M.overlays.Copy()
						var/Ol = src.icon
						var/Op = M.icon
						src.rei-=300
						src.overlays = 0
						M.overlays=0
						src.overlays = Or.Copy()
						M.overlays = O.Copy()
						src.icon=Op
						M.icon=Ol
						//flick("smoke2",src)
						//src.overlays += M.overlays
						sleep(170)
						src.copycd=0
						src.overlays = O.Copy()
						M.overlays = Or.Copy()
						M.Affirm_Icon()
						src.Affirm_Icon()
						return
		Invisibility()
			if(!src.inbankai||!src.ressurection)
				src << "Release your sword!"
			if(src.rei < 1000)
				src << "<b>Your rei is too low [src.rei]/1000!"
				return
			if(src.safe||src.fireback)
				return
			if(src.invisibcd)
				return
			if(src.rei>=1000)
				src.rei-=1000
				src.invisibcd=1
				src.invisibility=10
				src.see_invisible=10
				view() << "<font size=1><font face=verdana><b><font color=white>[src]<font color=green> Says: Invisibility!"
				var/mob/M=new/mob/clone(src.loc)
				M.overlays = src.overlays
				M.icon=src.icon
				M.name=src.name
				M.dir=src.dir
				M.health=-1000
				M.mhealth=src.mhealth
				for(var/mob/m in oview(4,src))
					if(m.etarget==src)
						m.Untarget()
						var/image/I=image('Icons/tgt.dmi',M,"",30)
						I.name="TargetUnder";src.client<<I
				//flick("smoke2",src)
				//src.overlays += M.overlays
				spawn(20)
					var/mob/Ma=new/mob/clone(src.loc)
					Ma.name=src.name
					Ma.dir=src.dir
					Ma.health=-1000
					Ma.mhealth=src.mhealth
					for(var/mob/m in view(8,src))
						if(m.etarget==src)
							m.Untarget()
							var/image/I=image('Icons/tgt.dmi',Ma,"",30)
							I.name="TargetUnder";src.client<<I
						Ma.overlays = src.overlays
						Ma.icon=src.icon
				spawn(40)
					var/mob/Maf=new/mob/clone(src.loc)
					Maf.name=src.name
					Maf.overlays = src.overlays
					Maf.icon=src.icon
					src.invisibility=0
					src.see_invisible=2
					return
				sleep(150)
				src.invisibcd=0
//CHECK
mob/clone
	New()
		spawn(20)
		del src
mob
 proc
		shimastery(var/K)
			if(src.shikaidrain > 0&&src.inshikai)
		//		src.random = rand(1,20)
				src.random = rand(1,10)
				if(src.random <= K)
					src << "<b><font color = green>You have gotten better at maintaining your shikai!"
					src.shikaidrain -= 0.1
					if(src.shikaidrain < 0)
						src.shikaidrain = 0
					if(src.shikaidrain==0&&src.mastered==2)
						src.mastered=1
						if(src.stype=="Jiroubou")
							src << "<b><font color = green>You have mastered shikai and learned Homing Shurikens!"
							src.contents+=new/obj/skillcard/Homing_Shurikens
							src.RefreshSkillList()
						if(src.stype=="Rukia")
							src << "<b><font color = green>You have mastered shikai and learned Ice Freeze!"
							src.contents+=new/obj/skillcard/Ice_Freeze
							src.RefreshSkillList()
		banmastery(var/K)
			if(src.bankaidrain > 0&&src.inbankai)
				src.random = rand(1,13)
				if(src.random <= K)
					src << "<b><font color = green>You have gotten better at maintaining your bankai!"
					src.bankaidrain -= 0.25
					if(src.bankaidrain < 0)
						src.bankaidrain = 0
					if(src.bankaidrain==0&&src.mastered==1)
						src.mastered=0
						if(src.stype=="Ichigo")
							src.contents+=new/obj/skillcard/Ichigo_Slash
							src.RefreshSkillList()
							src << "<b><font color = green>You have gotten a new technique for mastering bankai!"
						if(src.stype=="Hitsugaya")
							src.contents+=new/obj/skillcard/Frozen_Heavens
							src.contents+=new/obj/skillcard/Ice_Field
							src.contents+=new/obj/skillcard/Hakuren
							src.RefreshSkillList()
							src << "<b><font color = green>You have gotten new techniques for mastering bankai!"
						if(src.stype=="Aizen")
							src.contents+=new/obj/skillcard/Illusion
							src.RefreshSkillList()
							src << "<b><font color = green>You have gotten a new technique for mastering bankai!"
						if(src.stype=="Yammamoto")
							src.contents+=new/obj/skillcard/Creamation
							src.RefreshSkillList()
							src << "<b><font color = green>You have gotten a new technique for mastering bankai!"
						if(src.stype=="Byakuya")
							src.contents+=new/obj/skillcard/Pivotal_Scene
							src.contents+=new/obj/skillcard/Petal_Sword
							src.RefreshSkillList()
							src << "<b><font color = green>You have gotten a new technique for mastering bankai!"
		ressmastery(var/K)
			if(src.ressdrain > 0&&src.ressurection)
				src.random = rand(1,20)
				if(src.random <= K)
					src << "<b><font color = green>You have gotten better at maintaining your ressurection!"
					src.ressdrain -= 1
					if(src.ressdrain < 0)
						src.ressdrain = 0

mob
 DblClick()
		..()
		if(usr.see)
			return
		if(usr.GM>=3)
			usr.see = 1
			usr << "<b><font size=+1><font color = red><font face=times new roman>[src]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Level [src.level]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Level Points: [src.levelpoints]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Race: [src.race]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Experience: [src.exp]/[src.mexp]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Health: [src.health]/[src.mhealth]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Rei: [src.rei]/[src.mrei]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Location: [src.x],[src.y],[src.z]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Kills: [src.kills]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Flash Step Uses: [src.flashuse]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Attack: [src.attack]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Defence: [src.defence]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Reiatsu: [src.reiatsu]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Deaths: [src.deaths]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Money: [src.money]"

			sleep(30)
			if(usr)
				usr.see = 0


mob
 DblClick()
		..()
		if(usr.see)
			return
		if(usr.key in specialverbs)
			usr.see = 1
			usr << "<b><font size=+1><font color = red><font face=times new roman>[src]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Level [src.level]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Level Points: [src.levelpoints]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Race: [src.race]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Experience: [src.exp]/[src.mexp]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Health: [src.health]/[src.mhealth]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Rei: [src.rei]/[src.mrei]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Location: [src.x],[src.y],[src.z]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Kills: [src.kills]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Flash Step Uses: [src.flashuse]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Attack: [src.attack]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Defence: [src.defence]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Reiatsu: [src.reiatsu]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Deaths: [src.deaths]"
			usr << "<b><font size=+1><font color = red><font face=times new roman>Money: [src.money]"

			sleep(30)
			if(usr)
				usr.see = 0


mob
 var
		tmp/see = 0
client
 Southwest()
		return
 Southeast()
		return
 Northwest()
		return
 Northeast()
		return

obj
	darkdust
		zer = 1
		icon = 'Icons/darktrail.dmi'
		New()
			spawn(7)
			del src
obj
 rukiadust
		zer = 1
		icon = 'Icons/icetrail.dmi'
		New()
			spawn(7)
			del src
//CHECK
obj
	byakublade
		icon = 'Icons/byakuyabankai.dmi'
		density = 1
		opacity=1
		layer = 150
		New()
			//src.overlays+=/obj/byakublade/b1
			//src.overlays+=/obj/byakublade/b2
			//src.overlays+=/obj/byakublade/b3
			icon_state="invis"
			spawn(58)
				icon_state=""
			spawn(400)
				if(src)
					src.density = 0
					src.icon_state = "deactivate"
					spawn(200)
						if(src)
							del src
		b1
			//icon='Icons/byakuyabankai2.dmi'
			pixel_y=32
		b2
			pixel_y=64
		b3
			//icon='Icons/byakuyabankai2.dmi'
			pixel_y=96
obj
	gameturf
		icon = 'Icons/game.dmi'
		density = 1
		opacity=1
		layer = 3
		gamer=1
		New()
			icon_state="game"
			spawn(400)
				if(src)
					flick("end",src)
					spawn(8)
					del src
obj
	jomon
		icon = 'Icons/kido.dmi'
		density = 1
		opacity=1
		layer = 3
		New()
			icon_state="game"
			spawn(15 SECONDS)
				if(src)
					flick("end",src)
					spawn(8)
					del src
obj
	bountofiretrail
		zer = 1
		icon = 'Icons/bountofireman.dmi'
		icon_state = "Trail"
		New()
			spawn(20)
			del src

//CHECK
mob
	var
		trans3=0
		tmp/trans6=0
mob
	proc
		BoostUp()
			src.frozen=1
			flick("punch",src)
			spawn(10)
			if(src.trans3<1)
				for(var/mob/M in view(src))
					Quake_Effect(M,4,1)
			spawn(14)
				src.frozen=0
				if(src.trans3<1)
					src.trans3=1
					src.Load_Overlays()
					src.attack+=round(src.mattack,1)
					src.defence+=round(src.mdefence,1)
					src.reiatsu+=round(src.mreiatsu,1)
				else
					src.trans3=0
					src.attack=src.mattack
					src.defence=src.mdefence
					src.reiatsu=src.mreiatsu
					src.Load_Overlays()
mob
	proc
		BoostUpOuga()
			src.frozen=1
			flick("punch",src)
			spawn(10)
			if(src.trans3<1)
				for(var/mob/M in view(src))
					Quake_Effect(M,4,1)
			spawn(14)
				src.frozen=0
				if(src.trans3<1)
					src.trans3=1
					src.Load_Overlays()
					src.overlays+=/obj/stage2/s1
					src.overlays+=/obj/stage2/s2
					src.overlays+=/obj/stage2/s3
					src.overlays+=/obj/stage2/s4
					src.overlays+=/obj/stage2/s5
					src.overlays+=/obj/stage2/s6
					src.overlays+=/obj/stage2/s7
					src.overlays+=/obj/stage2/s8
					src.overlays+=/obj/stage2/s9
					src.overlays+=/obj/stage2/s10
					src.overlays+=/obj/stage2/s11
					src.overlays+=/obj/stage2/s12
					src.overlays+=/obj/stage2/s13
					src.overlays+=/obj/stage2/s14
					src.overlays+=/obj/stage2/s15
					src.overlays+=/obj/stage2/s16
					src.overlays+=/obj/stage2/s17
					src.susanos=2
			//		src.attack+=round(src.mattack,1)
					src.defence+=round(src.mdefence*2,1)
			//		src.reiatsu+=round(src.mreiatsu,1)
				else
					src.trans3=0
					src.attack=src.mattack
					src.defence=src.mdefence
					src.reiatsu=src.mreiatsu
					src.overlays-=/obj/stage2/s1
					src.overlays-=/obj/stage2/s2
					src.overlays-=/obj/stage2/s3
					src.overlays-=/obj/stage2/s4
					src.overlays-=/obj/stage2/s5
					src.overlays-=/obj/stage2/s6
					src.overlays-=/obj/stage2/s7
					src.overlays-=/obj/stage2/s8
					src.overlays-=/obj/stage2/s9
					src.overlays-=/obj/stage2/s10
					src.overlays-=/obj/stage2/s11
					src.overlays-=/obj/stage2/s12
					src.overlays-=/obj/stage2/s13
					src.overlays-=/obj/stage2/s14
					src.overlays-=/obj/stage2/s15
					src.overlays-=/obj/stage2/s16
					src.overlays-=/obj/stage2/s17
					src.susanos=0
					src.Load_Overlays()
		BoostUp2()
			src.frozen=1
			flick("punch",src)
			spawn(10)
			if(src.trans3<1)
				for(var/mob/M in view(src))
					Quake_Effect(M,4,1)
			spawn(14)
				src.frozen=0
				if(src.trans3<1)
					src.trans3=1
					src.Load_Overlays()
					src.attack+=round(src.mattack,1)
					src.defence+=round(src.mdefence,1)
					src.reiatsu+=round(src.mreiatsu,1)
				else
					src.trans3=0
					src.attack=src.mattack
					src.defence=src.mdefence
					src.reiatsu=src.mreiatsu
					src.Load_Overlays()
		Twilight()
			src.frozen=1
			flick("punch",src)
			spawn(10)
			if(!src.twilightboost)
				for(var/mob/M in view(src))
					Quake_Effect(M,4,1)
			spawn(14)
				src.frozen=0
				if(!src.twilightboost)
					src.twilightboost=1
					src.overlays+=/obj/Twilight_Boost
					src.attack+=src.mattack * 3.8
					src.defence+=src.mdefence * 3.8
					src.reiatsu+=src.mreiatsu * 3.8
				else
					src.overlays-=/obj/Twilight_Boost
					src.twilightboost=0
					src.attack=src.mattack
					src.defence=src.mdefence
					src.reiatsu=src.mreiatsu
		AkitoRinnegan()
			src.frozen=1
			flick("punch",src)
			spawn(10)
			if(!src.rinneg)
				for(var/mob/M in view(src))
					Quake_Effect(M,4,1)
			spawn(14)
				src.frozen=0
				if(!src.rinneg)
					src.rinneg=1
					src.Load_Overlays()
					if (src.key in specialverbs)
						src.overlays+=/obj/KiseRinnegan
						src.attack+=src.mattack * 5
						src.defence+=src.mdefence * 5
						src.reiatsu+=src.mreiatsu * 5
					else
						src.overlays+=/obj/rinnegan
						src.attack+=round(src.mattack,1)
						src.defence+=round(src.mdefence,1)
						src.reiatsu+=round(src.mreiatsu,1)
				else
					src.rinneg=0
					if (src.key in specialverbs)
						src.attack=src.mattack
						src.defence=src.mdefence
						src.reiatsu=src.mreiatsu
						src.overlays-=/obj/KiseRinnegan
						src.Load_Overlays()
					else
						src.attack=src.mattack
						src.defence=src.mdefence
						src.reiatsu=src.mreiatsu
						src.overlays-=/obj/rinnegan
						src.Load_Overlays()

mob/var
	tmp
		sharingancd=0
		rinnegcd=0
		rinneg=0
		twilightboost=0

mob
	proc
		SSJ1()
			if(!src.sharingancd)
				for(var/mob/M in view(src))
					Quake_Effect(M,4,1)
			src.frozen=1
			flick("bankai",src)
			spawn(10)
			spawn(14)
				src.frozen=0
				if(!src.sharingancd)
					src.sharingancd=1
					src.Load_Overlays()
					src.attack+=round(src.mattack/4)
					src.defence+=round(src.mdefence/4)
					src.reiatsu+=round(src.mreiatsu/4)
				else
					src.sharingancd=0
					src.attack=src.mattack
					src.defence=src.mdefence
					src.reiatsu=src.mreiatsu
					src.Load_Overlays()
		VaiInnerRage()
			src.frozen=1
			flick("bankai",src)
			spawn(10)
			if(src.trans6<1)
				for(var/mob/M in view(src))
					Quake_Effect(M,4,1)
			spawn(14)
				src.frozen=0
				if(src.trans6<1)
					src.trans6=1
					src.Load_Overlays()
					src.attack+=round(src.mattack/3)
					src.defence+=round(src.mdefence/3)
					src.reiatsu+=round(src.mreiatsu/3)
					rundelay=1
				else
					src.trans6=0
					src.attack=src.mattack
					src.defence=src.mdefence
					src.reiatsu=src.mreiatsu
					src.Load_Overlays()
		Criss_Cross()
			if(!src.inbankai)
				src << "You must be in bankai!"
				return
			if(src.safe||src.fireback)
				return
			if(src.crissed)
				src << "<b>You must wait at least 9 seconds!"
				return
			if(!src.crissed)
				src.crissed=1
				src.overlays-=/obj/Zanpakutou/Hisagi2
				var/obj/hisagi/A = new /obj/hisagi(src.loc)
				A.Gowner=src
				A.dir=src.dir
				A.ZigZag()
				sleep(1)
				src.overlays-=/obj/Zanpakutou/Hisagi
				var/obj/hisagi/Ad = new /obj/hisagi(src.loc)
				Ad.Gowner=src
				Ad.dir=src.dir
				Ad.ZigZag()
				sleep(11)
				src.overlays+=/obj/Zanpakutou/Hisagi2
				src.overlays+=/obj/Zanpakutou/Hisagi
				sleep(78)
				src.crissed=0
		Sennen_Hyoro()
			if(!src.inbankai)
				src << "You must be in bankai!"
			if(src.rei < 2000)
				src << "<b>Your rei is too low!"
				return
			if(src.safe||src.fireback)
				return
			var/mob/G=src.etarget
			if(!G in oview(src))
				src << "<b>You need a target in view!"
				return
			if(!G)
				src << "<b>You need a target in view!"
				return
			if(!src.sennenhyorocd)
				src.sennenhyorocd = 1
				src.rei-=2000
				view(8) << "<b>[src]: Sennen Hyoro!"
				var/obj/j=new/obj/Ice/Ice(locate(G.x-3,G.y,G.z))
				var/obj/je=new/obj/Ice/Ice(locate(G.x+3,G.y,G.z))
				var/obj/jw=new/obj/Ice/Ice(locate(G.x+3,G.y-3,G.z))
				var/obj/jq=new/obj/Ice/Ice(locate(G.x-3,G.y-3,G.z))
				var/obj/jf=new/obj/Ice/Ice(locate(G.x,G.y-3,G.z))
				var/obj/jd=new/obj/Ice/Ice(locate(G.x+3,G.y+3,G.z))
				var/obj/js=new/obj/Ice/Ice(locate(G.x-3,G.y+3,G.z))
				var/obj/ja=new/obj/Ice/Ice(locate(G.x,G.y+3,G.z))
				walk(j,EAST)
				walk(jq,NORTHEAST)
				walk(js,SOUTHEAST)
				walk(je,WEST)
				walk(jd,SOUTHWEST)
				walk(jw,NORTHWEST)
				walk(jf,NORTH)
				walk(ja,SOUTH)
				j.Gowner=src
				jq.Gowner=src
				js.Gowner=src
				je.Gowner=src
				jd.Gowner=src
				jw.Gowner=src
				jf.Gowner=src
				ja.Gowner=src
				spawn(3)
					walk(j,0)
					walk(jq,0)
					walk(js,0)
					walk(je,0)
					walk(jd,0)
					walk(jw,0)
					walk(jf,0)
					walk(ja,0)
				sleep(100)
				src.sennenhyorocd = 0
		Cyclone_Slash()
			if(!src.inshikai && !src.inbankai)
				src << "Use shikai first"
				return
			if(!src.cycloneslashcd)
				src.cycloneslashcd = 1
				if(src.etarget)Facedir(etarget)
				new/obj/hurricane(locate(src.x-1,src.y,src.z))
				new/obj/hurricane(locate(src.x+1,src.y,src.z))
				new/obj/hurricane(locate(src.x+1,src.y-1,src.z))
				new/obj/hurricane(locate(src.x-1,src.y-1,src.z))
				new/obj/hurricane(locate(src.x,src.y-1,src.z))
				new/obj/hurricane(locate(src.x+1,src.y+1,src.z))
				new/obj/hurricane(locate(src.x-1,src.y+1,src.z))
				new/obj/hurricane(locate(src.x,src.y+1,src.z))
				for(var/mob/G in oview(1))
					if(!G.protected)
						var/damage = round(src.attack/1.5)
						damage+=rand(damage/2,damage/1.5)
						damage+=src.swordD
						damage -= G.defence / 2
						src.health += damage
						if(src.health >= src.mhealth)
							src.health = src.mhealth
						if(damage <= 1)
							damage =rand(25,1000)
						if(G.enemy)
							src.hollowprotection = 1
						viewers(src) << output("<b><font color = red>[src] slashed [G] for [damage] damage!", "combat_output")
					//	view(src,8) << "<b><font color = red>[src] slashed [G] for [damage] damage!"
						spawn()G.Death(src,damage,rand(5,7))
				sleep(70)
				src.cycloneslashcd = 0
		Shishkabob()
			if(!src.inshikai && !src.inbankai)
				src << "Use shikai first"
				return
			if(!src.shishkabobcd)
				src.shishkabobcd = 1
				if(src.etarget)Facedir(etarget)
				new/obj/sis(locate(src.x-1,src.y,src.z))
				new/obj/sis(locate(src.x+1,src.y,src.z))
				new/obj/sis(locate(src.x+1,src.y-1,src.z))
				new/obj/sis(locate(src.x-1,src.y-1,src.z))
				new/obj/sis(locate(src.x,src.y-1,src.z))
				new/obj/sis(locate(src.x+1,src.y+1,src.z))
				new/obj/sis(locate(src.x-1,src.y+1,src.z))
				new/obj/sis(locate(src.x,src.y+1,src.z))
				for(var/mob/G in oview(2))
					var/damage = round(src.attack*2)
					damage+=rand(damage/2,damage/1.5)
					if(damage <= 1)
						damage =rand(25,1000)
					if(src.poison)
						G.Poisoned(src)
					G.Death(src,damage,rand(1,4))
				sleep(175)
				src.shishkabobcd = 0
		Decimate()
			if(!src.iceagecd)
				src.iceagecd = 1
				if(src.etarget)Facedir(etarget)
				new/obj/decimation(locate(src.x-1,src.y,src.z))
				new/obj/decimation(locate(src.x+1,src.y,src.z))
				new/obj/decimation(locate(src.x+1,src.y-1,src.z))
				new/obj/decimation(locate(src.x-1,src.y-1,src.z))
				new/obj/decimation(locate(src.x,src.y-1,src.z))
				new/obj/decimation(locate(src.x+1,src.y+1,src.z))
				new/obj/decimation(locate(src.x-1,src.y+1,src.z))
				new/obj/decimation(locate(src.x,src.y+1,src.z))
				for(var/mob/G in oview(2))
					var/damage = round(src.attack+src.reiatsu*2)
					damage+=rand(damage/6,damage/5)
					if(damage <= 1)
						damage =rand(25,1000)
					G.Death(src,damage,rand(5,7))
				sleep(175)
				src.iceagecd = 0
		Chain_Wrap()
			if(!src.inshikai && !src.inbankai)
				src << "Use shikai first"
				return
			if(!src.chainwrapcd)
				src.chainwrapcd = 1
				if(src.etarget)Facedir(etarget)
				src.overlays-=/obj/Zanpakutou/Hisagi
				var/obj/hisagi/A = new /obj/hisagi(usr.loc)
				A.Gowner=usr
				A.chainwrap=1
				walk(A,usr.dir,0)
				sleep(70)
				src.chainwrapcd = 0
		Tentacle_Wrap()
//			if(!ressurection)
//				src<<"<b>You don't have your tentacles out!"
//				return
			if(!src.chainwrapcd)
				src.chainwrapcd = 1
				if(src.etarget)Facedir(etarget)
		//		src.overlays-=/obj/Zanpakutou/Hisagi
				var/obj/tentaclebind/A = new /obj/tentaclebind(usr.loc)
				A.Gowner=usr
				A.chainwrap=1
				walk(A,usr.dir,0)
				sleep(70)
				src.chainwrapcd = 0
		Utsusemi()
			if(src.utsemicool)
				src<<"<b>You have to wait at 5 seconds before Utsusemi can work again!"
				return
			if(src.rei<500)
				return
			if(src.gotthecharge)
				return
			if(src.flags)
				src<<"You cannot use this skill while holding the flag"
				return
			src.utsemi=1
			src<<"<b>Utsusemi: If you are attacked within 10 seconds you will come back here!"
			src.ux=src.x
			src.uy=src.y
			src.uz=src.z
			src.utsemicool=1
			src.rei-=500
			sleep(100)
			src.utsemi=0
			src<<"<b>It has ended!"
			sleep(50)
			src.utsemicool=0
		Ichigo_Slash()
			if(src.safe||src.fireback)return
			if(!src.inbankai)
				src << "Use bankai first"
				return
			if(src.cheated)
				src << "You must wait before using this move again!"
				return
			if(!src.cheated)
				src.cheated = 1
				src.frozen=1
				src.canattack=0
				src.protected=1
				if(src.etarget)Facedir(etarget)
				new/obj/Ichigomove(src.loc)
				spawn(10)
					src.frozen=0
					src.canattack=1
					src.protected=0
					for(var/mob/G in oview(2))
						if(G.protected==1)return
						walk_away(G,src,3)
						spawn(3)
						walk(G,0)
						var/damage = round(src.attack)
						damage+=rand(damage/1.5,damage/0.5)
						if(damage <= 1)
							damage =rand(25,1000)
						if(G.enemy)
							src.hollowprotection = 1
						spawn(2)
						G.Death(src,damage,0)
				sleep(120)
				src.cheated=0
		Power_Transfer()
			if(src.safe||src.fireback)
				return
			if(!src.inafull)
				src << "You must be in Advanced Fullbring to use Power Transfer."
				return
			if(src.stolen)
				if(src.reiatsu!=src.mreiatsu)
					src.reiatsu-=src.stolenr
				if(src.attack!=src.mattack)
					src.attack-=src.stolena
				if(src.defence!=src.mdefence)
					src.defence-=src.stolend
				src<<"You release your power"
				src.stolen=0
				return
			if(src.stolencool)
				src<<"You must wait at least 60 seconds"
				return
			if(!src.etarget)
				src<<"You need a target"
				return
			if(!src.stolen)
				var/mob/M=src.etarget
				src.stolenr=min(25000,M.reiatsu-M.mreiatsu)
				src.stolena=min(25000,M.attack-M.mattack)
				src.stolend=min(25000,M.defence-M.mdefence)
				src.reiatsu+=src.stolenr
				src.attack+=src.stolena
				src.defence+=src.stolend
				M<<"[src] has transferred your power"
				src<<"You have transferred [M]'s power"
				src.stolen=1
				src.stolencool=1
				spawn(700)
				src.stolencool=0
//CHECK

obj
 hurricane
		icon = 'Icons/yumichikamove.dmi'
		New()
			spawn(10)
			del src
obj/decimation
	icon='Icons/Blast - 30.dmi'
	New()
		src.overlays+=/obj/decimation/s1
		src.overlays+=/obj/decimation/s2
		src.overlays+=/obj/decimation/s3
		src.overlays+=/obj/decimation/s4
		flick("rise",src)
		spawn(5)
		del src
	s1
		pixel_x=-32
	s2
		pixel_x=32
	s3
		pixel_y=-32
	s4
		pixel_y=32


obj
	sis
		icon = 'Icons/ichimarushikai.dmi'
		New()
			src.overlays+=/obj/sis/s1
			src.overlays+=/obj/sis/s2
			src.overlays+=/obj/sis/s3
			src.overlays+=/obj/sis/s4
			flick("rise",src)
			spawn(5)
			del src
		s1
			pixel_x=-32
		s2
			pixel_x=32
		s3
			pixel_y=-32
		s4
			pixel_y=32
obj/garganta
	garganta=1
	New()
		src.overlays+=/obj/garganta1
		src.overlays+=/obj/garganta2
		..()
		flick("go",src)
		spawn(19)
		del src
obj/garganta2
	pixel_x=16
	icon='Icons/Garganta2.dmi'
obj/garganta1
	pixel_x=-16
	icon='Icons/Garganta1.dmi'
obj/senkaimon
	icon='Icons/Senkaimon.dmi'
	garganta=1
	New()
		..()
		flick("flick",src)
		spawn(18)
		del src
mob
	proc
		Garganta()
			if(src.z==23)
				src<<"<b><font color=gray> The Gate is restricting your powers?!"
				return
			if(src.safe||src.fireback)
				return
			if(gotcharge=="[src.name]")
				return
			if(src.tourny)
				return
			if(src.lost)
				src<<"You're in an event"
				return
			if(src.health <= src.mhealth/1.2)
				src << "<b>You must have more physical energy!"
				return
			if(src.wound>50)
				src <<"<b>You have too many wounds"
				return
			if(src.traveltime)
				src<<"<b>You have to wait 10 seconds"
				return
			if(!src.firing)
				src.frozen=1
				src.traveltime=10
				if(src.hollow)
					new/obj/garganta(src.loc)
				if(!src.hollow)
					new/obj/senkaimon(src.loc)
				spawn(9)
					src.loc = locate(147,103,1)
					src.safe = 0
					src.frozen=0
				sleep(10 SECONDS)
				src.traveltime=0

mob/proc/Reap()
	if(src.safe||src.fireback)
		return
	if(src.spiritsword)
		src << "You can't use this while its active"
		return
	if(src.rei<1000)
		src<<"You need more rei [src.rei]/1000"
		return
	if(!src.reapcd)
		src.rei-=1000
		view(src)<< "<b><font color=red>[src.name]: Reap!"
		src.spiritsword=1
		src.canattack=0
		src.reapcd=1
		spawn()src.Spin()
		sleep(160)
		src.reapcd=0

mob
	proc
		Heavy_Hit()
			if(src.rei < 1500)
				src << "<b>Your reiatsu is too low [src.rei]/1500!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.heavyhitcd)
				src.rei-=1500
				src.heavyhitcd=1
				flick("Sword Slash1",src)
				for(var/mob/M in oview(1,src))
					var/hit=abs(src.attack/2)
					M.Hard_Hit(hit)
				sleep(140)
				src.heavyhitcd=0
		Clone_Spit()
			if(src.rei < 1500)
				src << "<b>Your rei is too low!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.clonespitcd)
				src.clonespitcd=1
				src.rei-=1500
				var/obj/K=new/obj/blood(src.loc)
				K.Gowner=src
				walk(K,src.dir)
				sleep(100)
				src.clonespitcd=0
		Coffin()
			if(src.rei < 2500)
				src << "<b>Your rei is too low!"
				return
			if(src.coffincool)
				src<<"<b>You have to wait at least 30 secs"
				return
			if(src.safe||src.fireback)
				return
			if(src.firing)
				return
			if(!src.coffin)
				src.firing=1
				src.coffincool=1
				spawn(1)
				src.coffin=1
				src.rei-=2500
				src << "<b>Click anywhere to perform Kido 90!"
				spawn(50)
				src.firing=0
				if(src.key in specialverbs)
					src.coffincool = 0
				spawn(30 SECONDS)
				src.coffincool=0
		Sai()
			if(src.rei < 800)
				src << "<b>Your rei is too low [src.rei]/800!"
				return
			if(src.safe||src.fireback)
				return
			var/mob/G=src.etarget
			if(!G)
				src << "<b>You need a target in view!"
				return
			if(src.saicd)
				src<<"You must wait 15 seconds"
				return
			if(!src.saicd)
				if(src.etarget)Facedir(etarget)
				src.rei -= 800
				src.saicd = 1
				if(!G in oview(src,2))
					src << "<b>You need to be near your target!"
				else
					view(8) << "<b>[src]: Binding Spell No.1! Sai!"
					G<<"You have been binded by [src]"
					G.Sais()
				sleep(250)
				src.saicd = 0
				if(src.gothealingkido==0)
					src.contents+=new/obj/skillcard/Kido_Corp_Heal
					src.RefreshSkillList()
					src.gothealingkido=1
		Shitotsu_Sansen()
			if(src.rei < 2000)
				src << "<b>Your rei is too low [src.rei]/2000!"
				return
			if(src.safe||src.fireback)
				return
			if(src.shitotsucd)
				src<<"You must wait 30 seconds"
				return
			if(!src.shitotsucd)
				if(src.etarget)Facedir(etarget)
				src.rei -= 2000
				src.shitotsucd = 1
				view(8) << "<b>[src]: Bakudo Spell No.30! Shitotsu Sansen"
				src.overlays+=/obj/shitotsu
				sleep(5)
				if(src.etarget)Facedir(etarget)
				var/K = new/obj/shitotsusansen(usr.loc)
				K:Gowner = usr;K:dir = usr.dir;walk(K,usr.dir)
				sleep(5)
				if(src.etarget)Facedir(etarget)
				var/Ka = new/obj/shitotsusansen(usr.loc)
				Ka:Gowner = usr;Ka:dir = usr.dir;walk(Ka,usr.dir)
				sleep(5)
				if(src.etarget)Facedir(etarget)
				var/Ks = new/obj/shitotsusansen(usr.loc)
				Ks:Gowner = usr;Ks:dir = usr.dir;walk(Ks,usr.dir)
				src.overlays-=/obj/shitotsu
				sleep(280)
				src.shitotsucd = 0
		Rikujoukourou()
			if(src.rei < 1500)
				src << "<b>Your rei is too low [src.rei]/1500!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.rikujoukouroucd)
				if(src.etarget)Facedir(etarget)
				view(8) << "<b>[src]: Binding Spell No.61! Rikujoukourou!"
				src.rikujoukouroucd = 1
				src.rei -= 1500
				var/K = new/obj/riku(src.loc)
				K:Gowner = src
				K:dir = src.dir
				walk(K,src.dir)
				sleep(140)
				src.rikujoukouroucd = 0
		Raikouhou()
			if(src.rei < 1000)
				src << "<b>Your rei is too low [src.rei]/1000!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.raikouhoucd)
				if(src.etarget)Facedir(etarget)
				view(8) << "<b>[src]: Destructive Spell No.63! Raikouhou!"
				src.raikouhoucd = 1
				src.rei -= 1000
				var/K = new/obj/raikouhou(src.loc)
				K:Gowner = src
				K:dir = src.dir
				walk(K,src.dir)
				sleep(200)
				src.raikouhoucd = 0
		Byakurai()
			if(src.rei < 400)
				src << "<b>Your rei is too low!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.byakuraicd)
				if(src.etarget)Facedir(etarget)
				view(8) << "<b>[src]: Destruction Spell No.4! Byakurai!"
				src.byakuraicd = 1
				src.rei -= 400
				var/K = new/obj/byaku(src.loc)
				K:Gowner = src
				K:dir = src.dir
				walk(K,src.dir)
				sleep(35)
				src.byakuraicd = 0
		Power_Burst()
			if(src.safe||src.fireback)
				return
			if(src.rei < 400)
				src << "<b>Need at least 400 rei!"
				return
			if(!src.powerburstcd)
				if(src.etarget)Facedir(etarget)
				src.rei -= 400
				view(8) << "<b>[src]: [src.swordname]! Snap!"
				src.powerburstcd = 1
				var/K = new/obj/pinkbyaku(src.loc)
				K:Gowner = src
				K:dir = src.dir
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				sleep(25)
				src.powerburstcd = 0
		Kendo()
			if(src.safe||src.fireback)
				return
			if(src.rei<3000)
				src<<"<b>You need [rei]/3000 rei to use this!"
				return
			if(!src.kendocd)
				src.rei-=3000
				src.frozen=1
				if(src.etarget)Facedir(etarget)
				view(8,src) << "<b>[src]: [src.swordname] Kendo!"
				src.kendocd = 1
				var/K = new/obj/Kendo(src.loc)
				K:Gowner = src
				K:dir = src.dir
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				spawn(10)
				src.frozen=0
				spawn(150)
				src.kendocd = 0
		//matsuricopy
		Pink_Mugetsu()
			if(src.z==23||src.z==22||src.z==24||src.z==25||src.z==17||src.z==26|| src.z==13)
				src<<"Your powers are restricted here?!"
				return
			if(src.race!="Shinigami"&&!src.enemy&&!src.npc)
				src<<"Only shinigamis can use this!"
				return
			if(src.safe||src.fireback)
				return
			if(src.rei<3000)
				src<<"<b>You need [rei]/3000 rei to use this!"
				return
			if(!src.mugetsucd)
				src.rei-=3000
				src.frozen=1
				if(src.etarget)Facedir(etarget)
				view(8,src) << "<b>[src]: [src.swordname] Koto Enbu!"
				src.mugetsucd = 1
				if(!src.enemy&&!src.npc)
					src.fgtmax+=5
					src.fgttime=round(src.fgttime/2)+1
					if(src.fgtmax>100)src.fgtmax=100
				if(src.isavasto)
					src.rei=2500
				var/K = new/obj/Pink_Mugetsu(src.loc)
				K:Gowner = src
				K:dir = src.dir
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				spawn(10)
				src.frozen=0
				spawn(70)
				src.mugetsucd = 0
		//end matsuricopy
		Mugetsu()
			if(src.z==23||src.z==22||src.z==24||src.z==25||src.z==17||src.z==26|| src.z==13)
				src<<"Your powers are restricted here?!"
				return
			if(src.race!="Shinigami"&&!src.enemy&&!src.npc)
				src<<"Only shinigamis can use this!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.infinal)
				src<<"<b>You must be in your Final Bankai!"
				return
			if(src.rei<3000)
				src<<"<b>You need [rei]/3000 rei to use this!"
				return
			if(!src.mugetsucd)
				src.rei=0
				src.frozen=1
				if(src.etarget)Facedir(etarget)
				view(8,src) << "<b>[src]: [src.swordname] Mugetsu!"
				src.mugetsucd = 1
				if(!src.enemy&&!src.npc)
					src.fgtmax+=5
					src.fgttime=round(src.fgttime/2)+1
					if(src.fgtmax>100)src.fgtmax=100
				if(src.isavasto)
					src.rei=3000
				var/K = new/obj/Mugetsu(src.loc)
				K:Gowner = src
				K:dir = src.dir
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				step(K,src.dir)
				spawn(10)
				src.frozen=0
				spawn(70)
				src.mugetsucd = 0


		ShadowTeleport()
			src.rapidattacking = 1

		Tenran()
			if(src.rei < 1500)
				src << "<b>Your rei is too low [src.rei]/1500!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.tenrancd)
				view(8) << "<b>[src]: Destruction Spell No.58! Tenran!"
				src.tenrancd = 1
				src.rei -= 1600
				var/K = new/obj/wind(locate(src.x,src.y,src.z))
				K:Gowner = src
				K:dir = src.dir
				walk(K,src.dir)
				if(src.dir==NORTH||src.dir==SOUTH)
					var/Ka = new/obj/wind(locate(src.x-1,src.y,src.z))
					Ka:Gowner = src
					Ka:dir = src.dir
					walk(Ka,src.dir)
					var/Kd = new/obj/wind(locate(src.x+1,src.y,src.z))
					Kd:Gowner = src
					Kd:dir = src.dir
					walk(Kd,src.dir)
				if(src.dir==EAST||src.dir==WEST||src.dir==NORTHEAST||src.dir==NORTHWEST||src.dir==SOUTHEAST||src.dir==SOUTHWEST)
					var/Ka = new/obj/wind(locate(src.x,src.y+1,src.z))
					Ka:Gowner = src
					Ka:dir = src.dir
					walk(Ka,src.dir)
					var/Kd = new/obj/wind(locate(src.x,src.y-1,src.z))
					Kd:Gowner = src
					Kd:dir = src.dir
					walk(Kd,src.dir)
				sleep(150)
				src.tenrancd = 0
		Shakkahou()
			if(src.rei < 500)
				src << "<b>Your rei is too low [src.rei]/500!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.firing)
				view(8) << "<b>[src]: Destruction Spell No.31! Shakkahou!"
				src.firing = 1
				src.rei -= 500
				var/K = new/obj/shakkahou(src.loc)
				K:Gowner = src
				K:dir = src.dir
				walk(K,src.dir)
				sleep(25)
				src.firing = 0
		Fireball()
			if(src.rei < 1000)
				src << "<b>Your rei is too low [src.rei]/1000!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.fireballcd)
				src.fireballcd = 1
				src.rei -= 1000
				var/K = new/obj/fireball(src.loc)
				K:Gowner = src
				K:dir = src.dir
				walk(K,src.dir)
				sleep(50)
				src.fireballcd = 0
		Reiatsu_Blast()
			if(src.rei < 50)
				src << "<b>Your rei is too low [src.rei]/50!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.reiatsublastcd)
				view(8) << "<b>[src]: Reiatsu Blast!"
				src.reiatsublastcd = 1
				src.rei -= 50
				var/K = new/obj/reiatsu_blast(src.loc)
				K:Gowner = src
				K:dir = src.dir
				walk(K,src.dir)
				sleep(15)
				src.reiatsublastcd = 0
		Soukatsui()
			if(src.rei < 1300)
				src << "<b>Your rei is too low [src.rei]/1300!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.soukatsuicd)
				view(8) << "<b>[src]: Destruction Spell No.33! Soukatsui!"
				src.soukatsuicd = 1
				src.rei -= 1300
				var/K = new/obj/soukatsui(src.loc)
				K:Gowner = src
				K:dir = src.dir
				walk(K,src.dir)
				sleep(70)
				src.soukatsuicd = 0
		Creamation()
			if(src.rei < 1000)
				src << "<b>Your rei is too low!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.inbankai)
				src << "<b>You must be in bankai!"
				return
			if(!src.etarget)
				src<<"You need a target!"
				return
			if(src.trapping)
				src<<"You must wait before using this again"
				return
			if(!src.trapping)
				src.trapping=1
				if(src.key in specialverbs)
					src.rei -= 1
				src.rei -= 1000
				var/mob/u=src.etarget
				var/obj/Ka = new/obj/Fire/RightBot(locate(u.x-1,u.y-1,u.z))
				Ka:Gowner = src
				Ka.opacity=0
				//Ka.density=1
				var/obj/Kd = new/obj/Fire/LeftBot(locate(u.x-1,u.y+1,u.z))
				Kd:Gowner = src
				Kd.opacity=0
				//Kd.density=1
				var/obj/Ks = new/obj/Fire/RightUp(locate(u.x+1,u.y-1,u.z))
				Ks:Gowner = src
				Ks.opacity=0
				//Ks.density=1
				var/obj/K = new/obj/Fire/LeftUp(locate(u.x+1,u.y+1,u.z))
				K:Gowner = src
				K.opacity=0
				//K.density=1
				var/obj/Kadd = new/obj/Fire/Right(locate(u.x+1,u.y,u.z))
				Kadd:Gowner = src
				Kadd.opacity=0
				//Kadd.density=1
				var/obj/Kdfg = new/obj/Fire/Left(locate(u.x-1,u.y,u.z))
				Kdfg:Gowner = src
				Kdfg.opacity=0
				//Kdfg.density=1
				var/obj/Ksb = new/obj/Fire/Up(locate(u.x,u.y+1,u.z))
				Ksb:Gowner = src
				Ksb.opacity=0
				//Ksb.density=1
				var/obj/Kb = new/obj/Fire/Bot(locate(u.x,u.y-1,u.z))
				Kb:Gowner = src
				Kb.opacity=0
				//Kb.density=1
				var/obj/Kdd = new/obj/Fire/Mid(locate(u.x,u.y,u.z))
				Kdd:Gowner = src
				Kdd.opacity=0
				//Kdd.density=1
				u.trapped=1
				src.Cremate(u)
				sleep(50)
				src.trapping = 0
		Roar()
			if(src.safe||src.fireback)
				return
			if(src.rei<1000)
				src << "<b>You don't have enough rei [src.rei]/1000!"
				return
			if(src.roared)
				src << "<b>You must wait a little before using this again!"
				return
			if(!src.roared)
				src.roared=1
				src.roaring=1
				src.rei-=1000
				var/L=src.overlays
				L += /obj/roar/r1
				L += /obj/roar/r2
				L += /obj/roar/r3
				L += /obj/roar/r4
				L += /obj/roar/r9
				L += /obj/roar/r6
				L += /obj/roar/r7
				L += /obj/roar/r8
				var/damage = src.level * 3
				if(damage < 1)
					damage =rand(25,1000)
				for(var/mob/m in oview(1))
					step_away(m,src)
				for(var/mob/M in oview(3))
					M.Slowed(1,3)
					M.Death(src,damage,0)
				for(var/mob/M in oview(2))
					M.Slowed(2,3)
				spawn(3)
					for(var/mob/M in oview(3))
						M.Slowed(1,3)
						M.Death(src,damage,0)
					for(var/mob/M in oview(2))
						M.Slowed(2,3)
				spawn(6)
					for(var/mob/M in oview(3))
						M.Slowed(1,3)
						M.Death(src,damage,0)
					for(var/mob/M in oview(2))
						M.Slowed(2,3)
				spawn(9)
					for(var/mob/M in oview(3))
						M.Slowed(1,3)
						M.Death(src,damage,0)
					for(var/mob/M in oview(2))
						M.Slowed(2,3)
				spawn(12)
					for(var/mob/M in oview(3))
						M.Slowed(1,3)
						M.Death(src,damage,0)
					for(var/mob/M in oview(2))
						M.Slowed(2,3)
				spawn(15)
					for(var/mob/M in oview(3))
						M.Slowed(1,3)
						M.Death(src,damage,0)
					for(var/mob/M in oview(2))
						M.Slowed(2,3)
				spawn(18)
					for(var/mob/M in oview(3))
						M.Slowed(1,3)
						M.Death(src,damage,0)
					for(var/mob/M in oview(2))
						M.Slowed(2,3)
				spawn(21)
					src.roaring=0
					L -= /obj/roar/r1
					L -= /obj/roar/r2
					L -= /obj/roar/r3
					L -= /obj/roar/r4
					L -= /obj/roar/r9
					L -= /obj/roar/r6
					L -= /obj/roar/r7
					L -= /obj/roar/r8
				sleep(250)
				src.roared=0
		Pantera_Roar()
			if(src.safe||src.fireback)
				return
			if(src.rei<1000)
				src << "<b>You don't have enough rei [src.rei]/1000!"
				return
			if(src.panteraroarcd)
				src << "<b>You must wait a little before using this again!"
				return
			if(!src.panteraroarcd)
				src.panteraroarcd=1
				src.roaring=1
				src.rei-=1000
				var/L=src.overlays
				L += /obj/roar/r1
				L += /obj/roar/r2
				L += /obj/roar/r3
				L += /obj/roar/r4
				L += /obj/roar/r9
				L += /obj/roar/r6
				L += /obj/roar/r7
				L += /obj/roar/r8
				L += /obj/roar/r11
				L += /obj/roar/r22
				L += /obj/roar/r33
				L += /obj/roar/r44
				L += /obj/roar/r99
				L += /obj/roar/r66
				L += /obj/roar/r77
				L += /obj/roar/r88
				var/damage = src.level * 3 + ((src.reiatsu+src.attack)/6)
				if(damage < 1)
					damage =rand(25,1000)
				for(var/mob/m in oview(1))
					step_away(m,src)
				for(var/mob/M in oview(3))
					M.Slowed(1,3)
					M.Death(src,damage,0)
				for(var/mob/M in oview(2))
					M.Slowed(2,3)
				spawn(3)
					for(var/mob/M in oview(5))
						M.Death(src,damage,0)
						M.Slowed(2,3)
					for(var/mob/M in oview(2))
						M.Slowed(3,3)
				spawn(6)
					for(var/mob/M in oview(5))
						M.Death(src,damage,0)
						M.Slowed(2,3)
					for(var/mob/M in oview(2))
						M.Slowed(3,3)
				spawn(9)
					for(var/mob/M in oview(5))
						M.Death(src,damage,0)
						M.Slowed(2,3)
					for(var/mob/M in oview(2))
						M.Slowed(3,3)
				spawn(12)
					for(var/mob/M in oview(5))
						M.Death(src,damage,0)
						M.Slowed(2,3)
					for(var/mob/M in oview(2))
						M.Slowed(3,3)
				spawn(15)
					for(var/mob/M in oview(5))
						M.Death(src,damage,0)
						M.Slowed(2,3)
					for(var/mob/M in oview(2))
						M.Slowed(3,3)
				spawn(18)
					for(var/mob/M in oview(5))
						M.Death(src,damage,0)
						M.Slowed(2,3)
					for(var/mob/M in oview(2))
						M.Slowed(3,3)
				spawn(21)
					src.roaring=0
					L -= /obj/roar/r1
					L -= /obj/roar/r2
					L -= /obj/roar/r3
					L -= /obj/roar/r4
					L -= /obj/roar/r9
					L -= /obj/roar/r6
					L -= /obj/roar/r7
					L -= /obj/roar/r8
					L -= /obj/roar/r11
					L -= /obj/roar/r22
					L -= /obj/roar/r33
					L -= /obj/roar/r44
					L -= /obj/roar/r99
					L -= /obj/roar/r66
					L -= /obj/roar/r77
					L -= /obj/roar/r88
				sleep(350)
				src.panteraroarcd=0
		Bum_Rush()
			if(src.safe||src.fireback)
				return
			/*if(!src.armon)
				src << "<b>You must have your arm to do this!"
				return*/
			if(src.rushed)
				src << "<b>You must wait a little before using this again!"
				return
			if(src.flags)
				src<<"You cannot use this skill while holding the flag"
				return
			if(!src.rushed)
				src.rushing = 1
				src.rushed=1
				src.allowmove=1
				var/obj/h=new/obj/craters/begin(src.loc)
				h.dir=src.dir
				step(src,src.dir)
				var/obj/d=new/obj/craters/rammed(src.loc)
				d.dir=src.dir
				sleep(1)
				step(src,src.dir)
				var/obj/da=new/obj/craters/rammed(src.loc)
				da.dir=src.dir
				sleep(1)
				step(src,src.dir)
				var/obj/ds=new/obj/craters/rammed(src.loc)
				ds.dir=src.dir
				sleep(1)
				step(src,src.dir)
				var/obj/dv=new/obj/craters/rammed(src.loc)
				dv.dir=src.dir
				sleep(1)
				step(src,src.dir)
				var/obj/dvda=new/obj/craters/rammed(src.loc)
				dvda.dir=src.dir
				sleep(1)
				step(src,src.dir)
				var/obj/dc=new/obj/craters/begin(src.loc)
				dc.dir=src.OppositeDirection()
				src.allowmove=0
				src.rushing=0
				src.moving=0
				sleep(30)
				src.rushed=0
		Quake_Quake_Punch()
			if(src.safe||src.fireback)
				return
			if(src.rei<2500)
				src << "<b>You don't have enough rei [src.rei]/2500!"
				return
			if(src.quakequakecd==1)
				src << "<b>You must wait a little before using this again!"
				return
			if(!src.quakequakecd)
				src.quakequakecd=1
				src.roaring=1
				src.rei-=3000
				flick("sword Slash1",src)
				flick("shun",src)
				var/L=src.overlays
				L += /obj/roar/r1
				L += /obj/roar/r2
				L += /obj/roar/r3
				L += /obj/roar/r4
				L += /obj/roar/r9
				L += /obj/roar/r6
				L += /obj/roar/r7
				L += /obj/roar/r8
				L += /obj/roar/r11
				L += /obj/roar/r22
				L += /obj/roar/r33
				L += /obj/roar/r44
				L += /obj/roar/r99
				L += /obj/roar/r66
				L += /obj/roar/r77
				L += /obj/roar/r88
				var/damage = src.level * 100//82.5
				if(damage < 1)
					damage =rand(25,1000)
				for(var/mob/m in oview(1))
					step_away(m,src)
				for(var/mob/M in oview(3))
					M.Slowed(1,3)
					M.Death(src,damage,rand(2,3))
				for(var/mob/M in oview(2))
					M.Slowed(2,3)
				spawn(3)
					for(var/mob/M in oview(5))
						M.Death(src,damage,rand(2,3))
						M.Slowed(2,3)
					for(var/mob/M in oview(2))
						M.Slowed(3,3)
					sleep(11)
					src.roaring=0
					L -= /obj/roar/r1
					L -= /obj/roar/r2
					L -= /obj/roar/r3
					L -= /obj/roar/r4
					L -= /obj/roar/r9
					L -= /obj/roar/r6
					L -= /obj/roar/r7
					L -= /obj/roar/r8
					L -= /obj/roar/r11
					L -= /obj/roar/r22
					L -= /obj/roar/r33
					L -= /obj/roar/r44
					L -= /obj/roar/r99
					L -= /obj/roar/r66
					L -= /obj/roar/r77
					L -= /obj/roar/r88
				sleep(150)//300
				src.quakequakecd=0
		EncircleBlack()
			if(src.encircle)
				src.encircle=0
				for(var/obj/blackFire/f)
					if(f.Gowner==src)
						del f
				return
			if(src.rei < 1000)
				src << "<b>Your rei is too low!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.encirclecd)
				src.encirclecd = 1
				src.rei -= 1000
				if(src.inbankai)
					src.banmastery(3)
				var/Ka = new/obj/blackFire/RightBot(locate(src.x+4,src.y-4,src.z))
				Ka:Gowner = src
				Ka:dir = WEST
				walk(Ka,WEST)
				var/Kd = new/obj/blackFire/LeftBot(locate(src.x-4,src.y-4,src.z))
				Kd:Gowner = src
				Kd:dir = NORTH
				walk(Kd,NORTH)
				var/Ks = new/obj/blackFire/RightUp(locate(src.x+4,src.y+4,src.z))
				Ks:Gowner = src
				Ks:dir = SOUTH
				walk(Ks,SOUTH)
				var/K = new/obj/blackFire/LeftUp(locate(src.x-4,src.y+4,src.z))
				K:Gowner = src
				K:dir = EAST
				walk(K,EAST)
				src.Freeze(5)
				if(src.npccaptain)
					world<<"<b><font color = lime>[src] incinerates the arena with the darkestflames!"
				src.encircle=1
				spawn()src.blackFlame()
				sleep(300)
				src.encirclecd = 0
		EncirlePurple()
			if(src.encircle)
				src.encircle=0
				for(var/obj/purpleFire/f)
					if(f.Gowner==src)
						del f
				return
			if(src.safe||src.fireback)
				return
			if(!src.encirclecd)
				src.encirclecd = 1
				if(src.inbankai)
					src.banmastery(3)
				var/Ka = new/obj/purpleFire/RightBot(locate(src.x+4,src.y-4,src.z))
				Ka:Gowner = src
				Ka:dir = WEST
				walk(Ka,WEST)
				var/Kd = new/obj/purpleFire/LeftBot(locate(src.x-4,src.y-4,src.z))
				Kd:Gowner = src
				Kd:dir = NORTH
				walk(Kd,NORTH)
				var/Ks = new/obj/purpleFire/RightUp(locate(src.x+4,src.y+4,src.z))
				Ks:Gowner = src
				Ks:dir = SOUTH
				walk(Ks,SOUTH)
				var/K = new/obj/purpleFire/LeftUp(locate(src.x-4,src.y+4,src.z))
				K:Gowner = src
				K:dir = EAST
				walk(K,EAST)
				src.Freeze(5)
				if(src.npccaptain)
					world<<"<b><font color = lime>[src] incinerates the arena with the hottest flames!"
				src.encircle=1
				spawn()src.purpleFlame()
				if(src.key in specialverbs)
					src.encirclecd=0
				sleep(500)
				src.encirclecd = 0

		EncirleThrom()
			if(src.encircle)
				src.encircle=0
				for(var/obj/purpleFire/f)
					if(f.Gowner==src)
						del f
				return
			if(src.safe||src.fireback)
				return
			if(!src.encirclecd)
				src.encirclecd = 1
				if(src.inbankai)
					src.banmastery(3)
				var/Ka = new/obj/purpleFire/RightBot(locate(src.x+4,src.y-4,src.z))
				Ka:Gowner = src
				Ka:dir = WEST
				walk(Ka,WEST)
				var/Kd = new/obj/purpleFire/LeftBot(locate(src.x-4,src.y-4,src.z))
				Kd:Gowner = src
				Kd:dir = NORTH
				walk(Kd,NORTH)
				var/Ks = new/obj/purpleFire/RightUp(locate(src.x+4,src.y+4,src.z))
				Ks:Gowner = src
				Ks:dir = SOUTH
				walk(Ks,SOUTH)
				var/K = new/obj/purpleFire/LeftUp(locate(src.x-4,src.y+4,src.z))
				K:Gowner = src
				K:dir = EAST
				walk(K,EAST)
				src.Freeze(5)
				if(src.npccaptain)
					world<<"<b><font color = lime>[src] incinerates the arena with the hottest flames!"
				src.encircle=1
				spawn()src.thromFlame()
				if(src.key in specialverbs)
					src.encirclecd=0
				sleep(100)
				src.encirclecd = 0
		Encircle()
			if(src.encircle)
				src.encircle=0
				for(var/obj/Fire/f)
					if(f.Gowner==src)
						del f
				return
			if(src.rei < 1000)
				src << "<b>Your rei is too low!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.inbankai)
				src << "<b>You must be in bankai!"
				return
			if(!src.encirclecd)
				src.encirclecd = 1
				src.rei -= 1000
				if(src.inbankai)
					src.banmastery(3)
				var/Ka = new/obj/Fire/RightBot(locate(src.x+4,src.y-4,src.z))
				Ka:Gowner = src
				Ka:dir = WEST
				walk(Ka,WEST)
				var/Kd = new/obj/Fire/LeftBot(locate(src.x-4,src.y-4,src.z))
				Kd:Gowner = src
				Kd:dir = NORTH
				walk(Kd,NORTH)
				var/Ks = new/obj/Fire/RightUp(locate(src.x+4,src.y+4,src.z))
				Ks:Gowner = src
				Ks:dir = SOUTH
				walk(Ks,SOUTH)
				var/K = new/obj/Fire/LeftUp(locate(src.x-4,src.y+4,src.z))
				K:Gowner = src
				K:dir = EAST
				walk(K,EAST)
				src.Freeze(5)
				if(src.npccaptain)
					world<<"<b><font color = lime>Yammamoto incinerates the arena"
				src.encircle=1
				spawn()src.Flame()
				if(src.bossyama||src.bossyama2)
					encirclecd = 0
				sleep(300)
				src.encirclecd = 0
		Encircle2()
			if(src.encircle)
				src.encircle=0
				for(var/obj/Fire/f)
					if(f.Gowner==src)
						del f
				return
			if(src.rei < 1000)
				src << "<b>Your rei is too low!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.encirclecd)
				src.encirclecd = 1
				src.rei -= 1000
				//if(src.inbankai)
					//src.banmastery(3)
				var/Ka = new/obj/Fire/RightBot(locate(src.x+4,src.y-4,src.z))
				Ka:Gowner = src
				Ka:dir = WEST
				walk(Ka,WEST)
				var/Kd = new/obj/Fire/LeftBot(locate(src.x-4,src.y-4,src.z))
				Kd:Gowner = src
				Kd:dir = NORTH
				walk(Kd,NORTH)
				var/Ks = new/obj/Fire/RightUp(locate(src.x+4,src.y+4,src.z))
				Ks:Gowner = src
				Ks:dir = SOUTH
				walk(Ks,SOUTH)
				var/K = new/obj/Fire/LeftUp(locate(src.x-4,src.y+4,src.z))
				K:Gowner = src
				K:dir = EAST
				walk(K,EAST)
				src.Freeze(5)
				src.encircle=1
				spawn()src.Flame()
				sleep(300)
				src.encirclecd = 0
		Yumi()
			if(src.rei < 1000)
				src << "<b>Your rei is too low!"
				return
			if(src.key == currentPlayerTest)
				src << "<b>You cannot use this during a ranked test!"
			return
			if(src.safe||src.fireback)
				return
			if(!src.inshikai&&!src.inbankai)
				src << "<b>You must be in shikai or bankai!"
				return
			if(!src.yumicd)
				src.yumicd = 1
				src.rei -= 1000
				var/Ka = new/obj/Yumi(locate(src.x+1,src.y+1,src.z))
				Ka:Gowner = src
				Ka:dir = WEST
				walk(Ka,WEST)
				var/Kd = new/obj/Yumi(locate(src.x+1,src.y-1,src.z))
				Kd:Gowner = src
				Kd:dir = NORTH
				walk(Kd,NORTH)
				var/Ks = new/obj/Yumi(locate(src.x-1,src.y+1,src.z))
				Ks:Gowner = src
				Ks:dir = SOUTH
				walk(Ks,SOUTH)
				var/K = new/obj/Yumi(locate(src.x-1,src.y-1,src.z))
				K:Gowner = src
				K:dir = EAST
				walk(K,EAST)
				if(src.inbankai)
					var/Kad = new/obj/Yumi(locate(src.x+1,src.y+2,src.z))
					Kad:Gowner = src
					Kad:dir = WEST
					walk(Kad,WEST)
					var/Kdd = new/obj/Yumi(locate(src.x+2,src.y-1,src.z))
					Kdd:Gowner = src
					Kdd:dir = NORTH
					walk(Kdd,NORTH)
					var/Ksd = new/obj/Yumi(locate(src.x-2,src.y+1,src.z))
					Ksd:Gowner = src
					Ksd:dir = SOUTH
					walk(Ksd,SOUTH)
					var/Kg = new/obj/Yumi(locate(src.x-1,src.y-2,src.z))
					Kg:Gowner = src
					Kg:dir = EAST
					walk(Kg,EAST)
				sleep(115)
				src.yumicd = 0
mob
	var
		tmp
			tensatboost=0
mob
	proc
		Tensat()
			if(src.rei < 250)
				src << "<b>Your rei is too low!"
				return
			if(src.safe||src.fireback)
				return
			if(src.tensat)
				src.tensat=0
				src.attack-=src.tensatboost
				src.tensatboost=0
				src.Load_Overlays()
				return
			if(!src.tensat&&src.inbankai)
				src.tensat=1
				src.tensatboost=round(src.mreiatsu/3,1)
				src.attack+=tensatboost
				src.rei -= 250
				src.Load_Overlays()
				return
		Haizen()
			if(src.rei < 400)
				src << "<b>Your rei is too low!(400 required)"
				return
			if(src.safe||src.fireback)
				return
			if(!src.haizencd)
				view(8) << "<b>[src]: Feel the wrath of battle and accept this sacred chalice - Sacred Bite!"
				src.haizencd = 1
				src.rei -= 400
				var/K = new/obj/haizen(src.loc)
				K:Gowner = src
				K:dir = src.dir
				walk(K,src.dir)
				sleep(2)
				var/K2 = new/obj/haizen(src.loc)
				K2:Gowner = src
				K2:dir = src.dir
				walk(K2,src.dir)
				sleep(2)
				var/K1 = new/obj/haizen(src.loc)
				K1:Gowner = src
				K1:dir = src.dir
				walk(K1,src.dir)
				sleep(60)
				src.haizencd = 0
		Tshunko()
			if(src.safe||src.fireback)
				return
			if(!src.firing)
				if(!src.tshunkoed)
					if(src.rei < src.mrei / 1.5)
						src << "<b>Your rei is too low [round(src.rei/src.mrei,0.1)*100]/70%!"
						return
					src.rei-=src.mrei/1.5
					src.tshunkoed = 1
					src.tshunko = 1
					src.Load_Overlays()
					src.rundelay = 0
					view(8) << "<b>[src]: Shunko!"
				else
					src.tshunkoed =0
					src.tshunko = 0
					src.rundelay = 2
					src.Load_Overlays()
		Shunko()
			if(src.rei < src.mrei / 1.5)
				src << "<b>Your rei is too low [round(src.rei/src.mrei,0.1)*100]/70%!"
				return
			if(src.shunkoed)
				return
			if(src.safe||src.fireback)
				return
			if(!src.firing)
				src.rei-=src.mrei/1.5
				src.shunkoed = 1
				src.shunko = 1
				src.Load_Overlays()
				src.rundelay = 0
				view(8) << "<b>[src]: Shunko!"
				sleep(270)
				src.rundelay = 2
				src.shunko = 0
				src.Load_Overlays()
				sleep(300)
				src.rundelay = 2
				sleep(600)
				src.shunkoed = 0
		Ransoutengai()
			if(src.rei < src.mrei / 1.5)
				src << "<b>Your rei is too low!"
				return
			if(src.usedran)
				return
			if(src.safe||src.fireback)
				return
			if(src.seeleuse)
				return
			if(src.frozen>0||src.stunned>0)
				src.frozen=0
				src.stunned=0
			if(!src.firing)
				src.usedran = 1
				src.inran = 1
				src.Load_Overlays()
				src.rundelay = 0
				view(8) << "<b>[src]: Heavenly Wild Puppet Suit!"
				sleep(1200)
				src.rundelay = 2
				src.inran = 0
				src.frozen=0
				src.stunned=0
				src.Load_Overlays()
				src.rei = 0
				sleep(200)
				src.rundelay = 2
				sleep(500)
				src.usedran = 0
		Gritz()
			if(src.rei < 950)
				src << "<b>Your rei is too low!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.etarget)
				src<<"You need a target"
				return
			var/mob/M=src.etarget
			if(!src.gritzed)
				view(8) << "<b>[src]: A silver rod strikes the five-fingered stone bed - Quintuple Restraining Frames!"
				src.rei -= 950
				src.gritzed=1
				if(M in oview(6,src))
					M.overlays += /obj/gritz
					M.frozen=1
					var/d=abs(src.level-M.level)
					if(d>=50)d=60
					if(d<=10)d=30
					sleep(d)
					if(M)
						M.overlays -= /obj/gritz
						M.overlays -= /obj/gritz
						M.frozen=0
				sleep(200)
				src.gritzed = 0
		Shibari_Explosion()
			if(src.safe||src.fireback)
				return
			if(!src.etarget)
				src<<"You need a target"
				return
			if(!src.shibari)
				src<<"You must have someone effected by shibari first"
				return
			if(src.rei < 2000)
				src << "<b>Your rei is too low [src.rei]/2000!"
				return
			var/mob/M=src.etarget
			if(!M.frozen)
				src<<"They aren't stunned anymore"
				return
			view(8) << "<b>[src]: Shibari Explosion!"
			src.shibari=0
			src.rei -= 2000
			new/obj/explode/k5(locate(M.x,M.y,M.z))
			for(var/mob/m in view(1,M))
				var/damage=src.reiatsu*4
				m.Death(src,damage,5)
		Shibari()
			if(src.rei < 1000)
				src << "<b>Your rei is too low [src.rei]/1000!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.etarget)
				src<<"You need a target"
				return
			if(src.shibaring)
				src<<"You must wait a little"
				return
			var/mob/M=src.etarget
			if(!src.firing)
				view(8) << "<b>[src]: Shibari!"
				src.firing = 1
				src.shibari=1
				src.shibaring=1
				src.rei -= 1000
				if(M in view(4,src))
					M.overlays += 'Icons/BindingKido.dmi'
					M.frozen=1
					sleep(40)
					if(M)
						M.overlays -= 'Icons/BindingKido.dmi'
						M.overlays -= 'Icons/BindingKido.dmi'
						M.frozen=0
				src.shibari=0
				sleep(50)
				src.firing = 0
				sleep(200)
				src.shibaring=0
		Volcore()
			if(src.rei < 1050)
				src << "<b>Your rei is too low!"
				return
			if(src.safe||src.fireback)
				return
			if(src.seeleuse)
				return
			if(!src.volcorecd)
				view(8) << "<b>[src]: Tilt the goblet to the west - Emerald Grail!"
				src.volcorecd = 1
				src.rei -= 1050
				var/K = new/obj/volcore(src.loc)
				K:Gowner = src
				K:dir = src.dir
				walk(K,src.dir)
				sleep(80)
				src.volcorecd = 0
		Sprenger()
			if(!src.enemy)
				for(var/obj/items/Seele_Schneider/k in src.contents)
					if(k.suffix=="0"||k.suffix=="1"||k.suffix=="2"||k.suffix=="3"||k.suffix=="4")
						src << "<b>You need 5 Seele Schneiders to use this move."
						return
			if(src.rei < src.mrei / 2)
				src << "<b>Your rei is too low!"
				return
			if(src.safe||src.fireback)
				return
			if(src.seele > 0)
				return
			if(src.seeleuse)
				return
			if(!src.firing)
				src.seeleuse = 1
				view(8) << "<b>[src]: Seele Schneider! Activate, Sprenger!"
				src.rei -= src.mrei / 2
				for(var/obj/items/Seele_Schneider/k in src.contents)
					k.stacked--
					k.stacked--
					k.stacked--
					k.stacked--
					k.stacked--
					if(k.stacked<=0)
						src.hasaseele=0
						src.seelsword=0
						del(k)
				src.overlays +=/obj/seele1
				src.overlays +=/obj/seele2
				src.overlays +=/obj/seele3
				src.overlays +=/obj/seele4
				src.overlays +=/obj/seele5
				src.seele = 5

mob
 var
		tmp/inran = 0
		tmp/usedran = 0
		tmp/seele = 0
		tmp/seeleuse
obj
 seele1
		icon = 'Icons/silverseele.dmi'
		pixel_y = 32
obj
 seele2
		icon = 'Icons/silverseele.dmi'
		pixel_x =32
		pixel_y = 10
obj
 seele3
		icon = 'Icons/silverseele.dmi'
		pixel_x =-32
		pixel_y = 10
obj
 seele4
		icon = 'Icons/silverseele.dmi'
		pixel_y =-32
		pixel_x =-16
obj
 seele5
		icon = 'Icons/silverseele.dmi'
		pixel_y =-32
		pixel_x =16

mob
	proc
		Flash_Step()
			if(src.flashstep)
				src.flashstep = 0
				if(src.race=="Shinigami")
					src << "<b>You are not using Shunpo anymore."
				if(src.race=="Quincy")
					src << "<b>You are not using Hirenkyaku anymore."
				if(src.race=="Fullbringer")
					src << "<b>You are not using Bringer Light anymore."
				if(src.race=="Arrancar"||src.race=="Numero"||src.race=="Espada"||src.race=="Sado"||src.race=="Chad"||src.race=="Hollow")
					src << "<b>You are not using Sonido anymore."
			else
				src.flashstep = 1
				if(src.race=="Shinigami")
					src << "<b>You start using Shunpo!"
				if(src.race=="Fullbringer")
					src << "<b>You start using Bringer Light!"
				if(src.race=="Quincy")
					src << "<b>You start using Hirenhyaku!"
				if(src.race=="Arrancar"||src.race=="Numero"||src.race=="Espada"||src.race=="Sado"||src.race=="Chad"||src.race=="Hollow")
					src << "<b>You start using Sonido!"
			if(src.z==23)
				flashstep=0
				src <<"<b>The power of the Gate is restricting your ability to move at extreme speeds!"
			if(src.z==27||src.z==28)
				flashstep=0
				src <<"<b>The overwhelming power of the dungoen bosses are restricting your ability to move at extreme speeds!"
		Flashing_Melee()
			if(src.flashcool)
				src << "<b>You must wait at least 1 minute before using this again"
				return
			else
				src.flashcool = 1
				src.flashmelee = 1
				src << "<b>You start using Flashing Melee, attack someone to flash step around them!"
				sleep(150)
				src.flashmelee=0
				sleep(450)
				src.flashcool=0

obj
 afterimage
		icon = 'Icons/flashstep2.dmi'
		zer = 1
		New()
			spawn(5)
			del src
obj
	afterImage
		zer = 1
		New()
			spawn(4)
			del src
obj
 afterimage1
		icon = 'Icons/flash.dmi'
		zer = 1
		New()
			spawn(5)
			del src
obj
 afterimage3
		icon = 'Icons/flash.dmi'
		icon_state="fullbring"
		zer = 1
		New()
			spawn(5)
			del src
obj
 afterimage2
		icon = 'Icons/flashstep3.dmi'
		zer = 1
		New()
			spawn(5)
			del src
mob
 var
		notarara = 0


mob
	proc
		Frozen_Heavens()
			if(src.safe||src.fireback)
				return
			if(src.heaven)
				src<<"<b>You must wait a little before using this again"
				return
			if(src.rei<2000)
				src<<"<b>You need [src.rei]/2000"
				return
			if(!src.heaven)
				src.heaven=1
				src.rei-=2000
				if(!src.npccaptain||src.npccaptain&&src.pet)
					for(var/mob/m in oview(8,src))
						var/obj/n=new/obj/frozen(m.loc)
						n.Gowner=src
						m.frozen=1
						m.canattack=0
						spawn(30)
							m.frozen=0
							m.canattack=1
							src.frozen=0
					for(var/mob/b in view(8,src))
						if(b.client)
							b.client.DE_SFL_b()
				if(src.npccaptain&&!src.pet)
					world<<"<b><font color = lime>Hitsugaya has changed the weather"
					for(var/mob/player/m in All_Clients())
						if(m.lost)
							var/obj/n=new/obj/frozen(m.loc)
							n.Gowner=src
							m.frozen=1
							m.canattack=0
							spawn(30)
								m.frozen=0
								m.canattack=1
								src.frozen=0
					for(var/mob/player/b in All_Clients())
						if(b.lost&&b.client)
							b.client.DE_SFL_b()
				spawn(300)
				src.heaven=0
		SmokeScreen()
			if(src.safe||src.fireback)
				return
			if(src.heaven)
				src<<"<b>You must wait a little before using this again"
				return
			if(src.rei<2000)
				src<<"<b>You need [src.rei]/2000"
				return
			if(!src.heaven)
				src.heaven=1
				src.rei-=2000
				for(var/mob/m in oview(8,src))
					var/obj/n=new/obj/smoke(m.loc)
					n.Gowner=src
				for(var/mob/b in view(8,src))
					if(b.client)
						b.client.DE_SFL_smoke()
				sleep(400)
				src.heaven=0
		Heat_Wave()
			if(src.safe||src.fireback)
				return
			if(src.heaven)
				src<<"<b>You must wait a little before using this again"
				return
			if(src.rei<2000)
				src<<"<b>You need [src.rei]/2000"
				return
			if(!src.heaven)
				src.heaven=1
				src.rei-=2000
				for(var/mob/m in oview(4,src))
					var/obj/n=new/obj/burning(m.loc)
					src.overlays+=/obj/fire/spark
					n.Gowner=src
					m.canattack=0
					spawn(30)
						src.overlays-=/obj/fire/spark
						m.canattack=1
				for(var/mob/b in view(4,src))
					if(b.client)
						b.client.DE_SFL_b1()
				spawn(450)
				src.heaven=0
		Flood()
			if(src.safe||src.fireback)
				return
			if(src.heaven)
				src<<"<b>You must wait a little before using this again"
				return
			if(!src.inshikai&&!src.inbankai)
				src<<"You must go shikai"
				return
			if(src.rei<2000)
				src<<"<b>You need [src.rei]/2000"
				return
			if(!src.heaven)
				src.heaven=1
				src.rei-=2000
				for(var/mob/m in oview(8,src))
					m.frozen=1
					m.Death(src,(src.reiatsu*3)-((m.defence*get_dist(m,src))/4),3)
					spawn(30)
						m.frozen=0
				for(var/mob/b in view(8,src))
					if(b.client)
						b.client.DE_SFL_b2()
				sleep(200)
				src.heaven=0
mob
	proc
		Rasen()//really rasen i just messed up
			if(src.safe||src.fireback)
				src << "<b>You are in safe zone!"
				return
			if(src.rei <= 2000)
				src << "<b>Your rei is too low!"
				return
			if(src.rasencd)
				return
			if(!src.rasencd)
				src.rei -= 2000
				src.rasencd = 1
				flick("Sword Slash1",src)
				var/ct=7
				while(ct>0)
					flick("Sword Slash1",src)
					var/obj/Rasen/A=new/obj/Rasen(src.loc)
					if(src.dir=="NORTH"||src.dir=="SOUTH")
						if(prob(25))
							A.loc = locate(src.x, src.y, src.z)
						if(prob(25))
							A.loc = locate(src.x+1, src.y, src.z)
						if(prob(25))
							A.loc = locate(src.x+2, src.y, src.z)
						if(prob(25))
							A.loc = locate(src.x-1, src.y, src.z)
						if(prob(25))
							A.loc = locate(src.x-2, src.y, src.z)
						A.dir = src.dir
						walk(A,src.dir)
					if(src.dir=="WEST"||src.dir=="EAST")
						if(prob(25))
							A.loc = locate(src.x, src.y+1, src.z)
						if(prob(25))
							A.loc = locate(src.x, src.y+2, src.z)
						if(prob(25))
							A.loc = locate(src.x, src.y-1, src.z)
						if(prob(25))
							A.loc = locate(src.x, src.y-2, src.z)
						if(prob(25))
							A.loc = locate(src.x, src.y+x, src.z)
						A.dir = src.dir
						walk(A,src.dir)
					walk(A,src.dir)
					A.Gowner = src
					sleep(5)
					ct--
			spawn(170)
				src.rasencd=0
mob
	proc
		Getsuga_Tenshou()
			if(src.safe||src.fireback)
				src << "<b>You are in safe zone!"
				return
			if(src.rei <= 1200)
				src << "<b>Your rei is too low!"
				return
			if(!src.getsugacd)
				src.rei -= 1200
				src.getsugacd = 1
				flick("Sword Slash1",src)
				if(src.shikaidrain>0)
					var/obj/yaiba/A = new /obj/yaiba/(src.loc)
					A.Gowner=src
					A.icon_state="3"
					A.dir = src.dir
					walk(A,src.dir)
					sleep(50)
					src.firing=0
					src.getsugacd=0
					return
				if(src.dir == NORTH)
					var/obj/yaiba/A = new /obj/yaiba/
					var/obj/yaiba2/B = new /obj/yaiba2/
					var/obj/yaiba1/C = new /obj/yaiba1/
					if(src.inbankai)
						A.icon = 'Icons/getsugablack.dmi'
						B.icon = 'Icons/getsugablack.dmi'
						C.icon = 'Icons/getsugablack.dmi'
					A.loc = locate(src.x, src.y, src.z)
					C.loc = locate(src.x+1, src.y, src.z)
					B.loc = locate(src.x-1, src.y, src.z)
					A.dir = NORTH
					B.dir = NORTH
					C.dir = NORTH
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,NORTH)
					walk(C,NORTH)
					walk(B,NORTH)
				if(src.dir == SOUTH)
					var/obj/yaiba/A = new /obj/yaiba/
					var/obj/yaiba1/B = new /obj/yaiba1/
					var/obj/yaiba2/C = new /obj/yaiba2/
					if(src.inbankai)
						A.icon = 'Icons/getsugablack.dmi'
						B.icon = 'Icons/getsugablack.dmi'
						C.icon = 'Icons/getsugablack.dmi'
					A.loc = locate(src.x, src.y, src.z)
					C.loc = locate(src.x+1, src.y, src.z)
					B.loc = locate(src.x-1, src.y, src.z)
					A.dir = SOUTH
					B.dir = SOUTH
					C.dir = SOUTH
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,SOUTH)
					walk(C,SOUTH)
					walk(B,SOUTH)
				if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST||src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
					var/obj/yaiba1/A = new /obj/yaiba1/
					var/obj/yaiba2/B = new /obj/yaiba2/
					var/obj/yaiba/C = new /obj/yaiba/
					if(src.inbankai)
						A.icon = 'Icons/getsugablack.dmi'
						B.icon = 'Icons/getsugablack.dmi'
						C.icon = 'Icons/getsugablack.dmi'
					A.loc = locate(src.x, src.y-1, src.z)
					C.loc = locate(src.x, src.y, src.z)
					B.loc = locate(src.x, src.y+1, src.z)
					A.dir = src.dir
					B.dir = src.dir
					C.dir = src.dir
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,src.dir)
					walk(C,src.dir)
					walk(B,src.dir)
				sleep(60)
				src.getsugacd = 0
		Ola_Azul()
			if(src.safe||src.fireback)
				src << "<b>You are in safe zone!"
				return
			if(src.rei <= 2000)
				src << "<b>Your rei is too low!"
				return
			if(!src.olaazulcd)
				src.rei -= 2000
				src.olaazulcd = 1
				flick("Sword Slash1",src)
				if(!src.ressurection)
					var/obj/ola/A = new /obj/ola/(src.loc)
					A.Gowner=src
					A.icon_state="3"
					A.dir = src.dir
					walk(A,src.dir)
					sleep(100)
					src.olaazulcd=0
					return
				if(src.dir == NORTH||src.dir == SOUTH)
					var/obj/ola/A = new /obj/ola/
					var/obj/ola/B = new /obj/ola/
					var/obj/ola/C = new /obj/ola/
					A.loc = locate(src.x, src.y, src.z)
					C.loc = locate(src.x+1, src.y, src.z)
					B.loc = locate(src.x-1, src.y, src.z)
					A.icon_state="4"
					C.icon_state="6"
					B.icon_state="5"
					A.dir = src.dir
					B.dir = src.dir
					C.dir = src.dir
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,src.dir)
					walk(C,src.dir)
					walk(B,src.dir)
				if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST||src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
					var/obj/ola/A = new /obj/ola/
					var/obj/ola/B = new /obj/ola/
					var/obj/ola/C = new /obj/ola/
					A.icon_state="5"
					B.icon_state="6"
					C.icon_state="4"
					A.loc = locate(src.x, src.y-1, src.z)
					C.loc = locate(src.x, src.y, src.z)
					B.loc = locate(src.x, src.y+1, src.z)
					A.dir = src.dir
					B.dir = src.dir
					C.dir = src.dir
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,src.dir)
					walk(C,src.dir)
					walk(B,src.dir)
				sleep(100)
				src.olaazulcd = 0
		Getsuga_Ring()
			if(src.safe||src.fireback)
				src << "<b>You are in safe zone!"
				return
			if(src.rei <= 500)
				src << "<b>Your rei is too low!"
				return
			if(!src.getsugaringcd)
				src.rei -= 500
				src.getsugaringcd = 1
				src.getsugaring+=1
				if(src.getsugaring==100)
					src<<"<b><font color=lime>Fullbringer Info: You have awakened your fullbring and can now shoot a barrage of getsuga rings!"
				if(src.getsugaring==150)
					src<<"<b><font color=lime>Fullbringer Info: You have fully awakened your fullbring and will now gain a protective coat!"
					src.Load_Overlays()
				flick("Sword Slash1",src)
				if(src.getsugaring<100)
					var/obj/getsugaring/A = new /obj/getsugaring/(src.loc)
					A.Gowner=src
					A.icon_state=""
					A.dir = src.dir
					walk(A,src.dir)
					sleep(40)
					src.getsugaringcd=0
					return
				if(src.getsugaring>=100)
					var/obj/getsugaring/A = new /obj/getsugaring/(src.loc)
					A.Gowner=src
					A.icon_state=""
					A.dir = src.dir
					walk(A,src.dir)
					spawn(3)
						var/obj/getsugaring/Aa = new /obj/getsugaring/(src.loc)
						Aa.Gowner=src
						Aa.icon_state=""
						Aa.dir = src.dir
						walk(Aa,src.dir)
						spawn(3)
							var/obj/getsugaring/As = new /obj/getsugaring/(src.loc)
							As.Gowner=src
							As.icon_state=""
							As.dir = src.dir
							walk(As,src.dir)
				sleep(50)
				src.getsugaringcd=0
				return
		Bringer_Blast()
			if(src.safe||src.fireback)
				src << "<b>You are in safe zone!"
				return
			if(src.rei <= 2000)
				src << "<b>Your rei is too low!"
				return
			if(!src.bbcd)
				src.rei -= 2000
				src.bbcd = 1
				src.bringerblast+=1
				if(src.bringerblast==100)
					src<<"<b><font color=lime>Fullbringer Info: You have fully awakened your fullbring and can now shoot a bigger bringer blast!"
				flick("Sword Slash1",src)
				if(src.bringerblast<100)
					var/obj/bringerb/A = new /obj/bringerb/(src.loc)
					A.Gowner=src
					A.icon_state="3"
					A.dir = src.dir
					walk(A,src.dir)
					sleep(100)
					src.bbcd=0
					return
				if(src.dir == NORTH)
					var/obj/bringerb/A = new /obj/bringerb/
					var/obj/bringerb2/B = new /obj/bringerb2/
					var/obj/bringerb1/C = new /obj/bringerb1/
					A.loc = locate(src.x, src.y, src.z)
					C.loc = locate(src.x+1, src.y, src.z)
					B.loc = locate(src.x-1, src.y, src.z)
					A.dir = NORTH
					B.dir = NORTH
					C.dir = NORTH
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,NORTH)
					walk(C,NORTH)
					walk(B,NORTH)
				if(src.dir == SOUTH)
					var/obj/bringerb/A = new /obj/bringerb/
					var/obj/bringerb1/B = new /obj/bringerb1/
					var/obj/bringerb2/C = new /obj/bringerb2/
					A.loc = locate(src.x, src.y, src.z)
					C.loc = locate(src.x+1, src.y, src.z)
					B.loc = locate(src.x-1, src.y, src.z)
					A.dir = SOUTH
					B.dir = SOUTH
					C.dir = SOUTH
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,SOUTH)
					walk(C,SOUTH)
					walk(B,SOUTH)
				if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST||src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
					var/obj/bringerb1/A = new /obj/bringerb1/
					var/obj/bringerb2/B = new /obj/bringerb2/
					var/obj/bringerb/C = new /obj/bringerb/
					A.loc = locate(src.x, src.y-1, src.z)
					C.loc = locate(src.x, src.y, src.z)
					B.loc = locate(src.x, src.y+1, src.z)
					A.dir = src.dir
					B.dir = src.dir
					C.dir = src.dir
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,src.dir)
					walk(C,src.dir)
					walk(B,src.dir)
				sleep(100)
				src.bbcd = 0
mob
	proc
		Nake()
			if(src.safe||src.fireback)
				src << "<b>You are in safe zone!"
				return
			if(!src.inshikai&&!src.inbankai)
				src << "<b>You must be in shikai!"
				return
			if(src.rei <= 1200)
				src << "<b>Your rei is too low [src.rei]/1200!"
				return
			if(!src.nakecd)
				src.rei -= 1200
				src.nakecd = 1
				flick("Sword Slash1",src)
				if(src.dir == NORTH)
					var/obj/yaiba/A = new /obj/nake/
					var/obj/yaiba2/B = new /obj/nake2/
					var/obj/yaiba1/C = new /obj/nake1/
					A.loc = locate(src.x, src.y, src.z)
					C.loc = locate(src.x+1, src.y, src.z)
					B.loc = locate(src.x-1, src.y, src.z)
					A.dir = NORTH
					B.dir = NORTH
					C.dir = NORTH
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,NORTH)
					walk(C,NORTH)
					walk(B,NORTH)
				if(src.dir == SOUTH)
					var/obj/yaiba/A = new /obj/nake/
					var/obj/yaiba1/B = new /obj/nake1/
					var/obj/yaiba2/C = new /obj/nake2/
					A.loc = locate(src.x, src.y, src.z)
					C.loc = locate(src.x+1, src.y, src.z)
					B.loc = locate(src.x-1, src.y, src.z)
					A.dir = SOUTH
					B.dir = SOUTH
					C.dir = SOUTH
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,SOUTH)
					walk(C,SOUTH)
					walk(B,SOUTH)
				if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST||src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
					var/obj/yaiba1/A = new /obj/nake1/
					var/obj/yaiba2/B = new /obj/nake2/
					var/obj/yaiba/C = new /obj/nake/
					A.loc = locate(src.x, src.y-1, src.z)
					C.loc = locate(src.x, src.y, src.z)
					B.loc = locate(src.x, src.y+1, src.z)
					A.dir = src.dir
					B.dir = src.dir
					C.dir = src.dir
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,src.dir)
					walk(C,src.dir)
					walk(B,src.dir)
				sleep(60)
				src.nakecd = 0

mob
	proc
		Rengoku()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 1500)
				src << "<b>Your reiatsu is too low [src.rei]/1500!"
				return
			if(src.rengokucd)
				return
			if(!src.rengokucd)
				src.rengokucd = 1
				src.rei -= 1500
				var/list/ef=list()
				for(var/turf/t in orange(5,src))
					ef+=t
				var/duration=rand(5,15)
				spawn()
					for(duration,duration>0,duration--)
						var/numba=rand(5,10)
						while(numba>0)
							numba--
							var/image/a=new
							a.icon='Icons/fire geisers aoe.dmi'
							view(20)<<a
							a.loc=pick(ef)
							var/tt=rand(5,30)
							spawn(tt)
								del a
							sleep(world.tick_lag)
						for(var/mob/f in oview(5,src))
							if(!f.protected)
								var/damage = src.reiatsu * 3.5- f.defence / 2
								if(damage < 1)
									damage =rand(25,1000)
						//		view(src,10)<<"<b> <font color=red>[f] is being burned by [src]'s burning geisers for [damage] damage!</font>"
								f.Death(src,damage,rand(1,2))
				spawn(350)
					src.rengokucd=0

		Universal_Aging()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 2500)
				src << "<b>Your reiatsu is too low [src.rei]/2500!"
				return
			if(!src.universalagingcd)
				src.universalagingcd = 1
				src.rei -= 2500
				new/obj/drain/drain(src.loc)
				for(var/mob/M in oview(3,src))
					if(!M.protected)
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
						var/damage = src.reiatsu * 3.7- M.defence / 2
						if(damage < 1)
							damage =rand(25,1000)
						M.Aged()
						M.DrainRei(src,6000)
				//		M.rei-=6000
						if(M.rei<0)
							M.rei=0
						view(src,8) << "<b><font color = red>[src] begins to rot away at [M] with his Respira!"
						if(M.enemy)
							src.hollowprotection = 1
						M.Death(src,damage,rand(5,10))
				sleep(250)
				src.universalagingcd = 0
		Shoot_Dragon()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 500)
				src << "<b>Your rei is too low!"
				return
			if(!src.shootdragoncd)
				src.shootdragoncd = 1
				src.rei -= 500
				var/K = new/obj/ice(src.loc)
				K:Gowner = src
				walk(K,src.dir)
				if(src.stype == "Hitsugaya")
					src.shimastery(10)
				sleep(50)
				src.shootdragoncd = 0
		Negacion()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 500)
				src << "<b>Your rei is too low!"
				return
			if(src.negacionon)
				src<<"<b>You have it active"
				return
			if(src.negacioncd)
				src<<"<b>You have to wait 100 seconds"
				return
			if(!src.negacioncd)
				if(src.HasSkill("Instant Regen")||src.npcespada==4)
					src<<"If you take over 10% damage within the next 20 secs, damage will be nullified"
					src.negacionon=1
					spawn(200)
						src.negacionon=0
						src<<"Negacion has ended"
				if(src.HasSkill("Arrancar Release")||src.npcespada==6)
					var/mob/f=usr.etarget
					if(!f)
						src<<"You need a target close by"
						return
					if(!f in oview(2,src))
						src<<"You need a target close by"
						return
					else
						if(f.protected||f.frozen||f.ko)
							src<<"They can't be stunned already"
							return
						if(src.npcespada==6)
							src.aggrod=0
							src.aggro=null
						spawn()f.NegacionEffect()
				src.negacioncd = 1
				src.rei -= 500
				sleep(1000)
				src.negacioncd = 0
		Hado_1()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 500)
				src << "<b>Your rei is too low!"
				return
			if(!src.etarget)
				src << "<b>You need a target!"
				return
			var/mob/f=src.etarget
			if(f.flags)
				src<<"<b>You can't use this while [f] has the flag"
				return
			if(src.etarget in oview(6,src))
				if(!src.hado1cd)
					view(src,8) << "<b>[src]: Hado #1! Thrust!"
					src.hado1cd = 1
					src.rei -= 500
					new/obj/hado1(f.loc)
					f.allowmove=1
					step_away(f,src)
					f.moving=1
					f.allowmove=0
					spawn(1)
						f.allowmove=1
						step_away(f,src)
						f.moving=1
						f.allowmove=0
						spawn(1)
							f.allowmove=1
							step_away(f,src)
							f.moving=1
							f.allowmove=0
							spawn(1)
								f.allowmove=1
								f.moving=0
								step_away(f,src)
								f.allowmove=0
								f.Death(src,round(src.reiatsu*0.8),1)
					sleep(50)
					src.hado1cd = 0

mob
	proc
		Shoen()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 1500)
				src << "<b>Your rei is too low!"
				return
			if(src.shoencd)return
			if(!src.inshikai && !src.inbankai)
				src <<"<b>You must be in shikai to use this!"
				return
			if(!src.shoencd)
				src.shoencd = 1
				src.rei -= 1500
				view(src,8) << "<b>[src]: Shoen!"
				if(src.inbankai)
					var/obj/K = new/obj/Shoen(locate(src.x+2,src.y,src.z))
					var/obj/Kr = new/obj/Shoen(locate(src.x+1,src.y+1,src.z))
					var/obj/Ka = new/obj/Shoen(locate(src.x,src.y+2,src.z))
					var/obj/Ks = new/obj/Shoen(locate(src.x-2,src.y,src.z))
					var/obj/Kd = new/obj/Shoen(locate(src.x-1,src.y-1,src.z))
					var/obj/Kf = new/obj/Shoen(locate(src.x,src.y-2,src.z))
					var/obj/Ksbb = new/obj/Shoen(locate(src.x-1,src.y+1,src.z))
					var/obj/Kdbb = new/obj/Shoen(locate(src.x+1,src.y-1,src.z))
					K.Gowner = src
					Kr.Gowner = src
					Ka.Gowner = src
					Ks.Gowner = src
					Kd.Gowner = src
					Ksbb.Gowner = src
					Kdbb.Gowner = src
					Kf.Gowner = src
					for(var/mob/G in oview(4,src))
						if(Ksbb.loc==G.loc||Kdbb.loc==G.loc||K.loc==G.loc||Kr.loc==G.loc||Ka.loc==G.loc||Ks.loc==G.loc||Kd.loc==G.loc||Kf.loc==G.loc)//||Kaa.loc==G.loc||Ksa.loc==G.loc||Kfa.loc==G.loc||Kda.loc==G.loc)
							Blood(G.x,G.y,G.z)
							var/damage = src.reiatsu*3.7- G.defence / 2
							if(damage <= 0)
								damage =rand(25,1000)
							view(8,G) << "<b><font color = red>[src] hit [G] with his Shoen!"
							spawn()G.Death(src,damage,rand(1,2))
				var/obj/Kaa = new/obj/Shoen(locate(src.x+1,src.y,src.z))
				var/obj/Ksa = new/obj/Shoen(locate(src.x-1,src.y,src.z))
				var/obj/Kda = new/obj/Shoen(locate(src.x,src.y+1,src.z))
				var/obj/Kfa = new/obj/Shoen(locate(src.x,src.y-1,src.z))
				Kaa:Gowner = src
				Ksa:Gowner = src
				Kda:Gowner = src
				Kfa:Gowner = src
				for(var/mob/G in oview(4,src))
					if(Kaa.loc==G.loc||Ksa.loc==G.loc||Kda.loc==G.loc||Kfa.loc==G.loc)//||Kaa.loc==G.loc||Ksa.loc==G.loc||Kfa.loc==G.loc||Kda.loc==G.loc)
						Blood(G.x,G.y,G.z)
						var/damage = src.reiatsu*3.7 - G.defence / 2
						if(damage <= 0)
							damage =rand(25,1000)
						view(8,G) << "<b><font color = red>[src] hit [G] with his Shoen!"
						if(src.inshikai)
							src.shimastery(3)
						if(src.inbankai)
							src.banmastery(5)
						spawn()G.Death(src,damage,rand(1,2))
				sleep(50)
				src.shoencd = 0
		Tentacle_Field()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 1000)
				src << "<b>Your rei is too low!"
				return
			if(src.tentaclefieldcd)return
			if(!src.tentaclefieldcd)
				src.tentaclefieldcd = 1
				src.rei -= 1000
				view(src,8) << "<b>[src]: Tentacle Field!"
				var/obj/K = new/obj/tentacle(locate(src.x+2,src.y,src.z))
				var/obj/Kr = new/obj/tentacle(locate(src.x+1,src.y+1,src.z))
				var/obj/Ka = new/obj/tentacle(locate(src.x,src.y+2,src.z))
				var/obj/Ks = new/obj/tentacle(locate(src.x-2,src.y,src.z))
				var/obj/Kd = new/obj/tentacle(locate(src.x-1,src.y-1,src.z))
				var/obj/Kf = new/obj/tentacle(locate(src.x,src.y-2,src.z))
				var/obj/Ksbb = new/obj/tentacle(locate(src.x-1,src.y+1,src.z))
				var/obj/Kdbb = new/obj/tentacle(locate(src.x+1,src.y-1,src.z))
				var/obj/Kbbbb = new/obj/tentacle(locate(src.x+3,src.y,src.z))
				var/obj/Kbbbbb = new/obj/tentacle(locate(src.x-3,src.y,src.z))
				var/obj/Kbbbbbb = new/obj/tentacle(locate(src.x,src.y-3,src.z))
				var/obj/Kbbbbbbb = new/obj/tentacle(locate(src.x,src.y+3,src.z))
				Kbbbb.Gowner = src
				Kbbbbb.Gowner = src
				Kbbbbbb.Gowner = src
				Kbbbbbbb.Gowner = src
				K.Gowner = src
				Kr.Gowner = src
				Ka.Gowner = src
				Ks.Gowner = src
				Kd.Gowner = src
				Ksbb.Gowner = src
				Kdbb.Gowner = src
				Kf.Gowner = src
				spawn(60)
				src.tentaclefieldcd = 0
				for(var/mob/G in oview(4,src))
					if(Ksbb.loc==G.loc||Kbbbb.loc==G||Kbbbbb.loc==G||Kbbbbbb.loc==G||Kbbbbbbb.loc==G||Kdbb.loc==G.loc||K.loc==G.loc||Kr.loc==G.loc||Ka.loc==G.loc||Ks.loc==G.loc||Kd.loc==G.loc||Kf.loc==G.loc)//||Kaa.loc==G.loc||Ksa.loc==G.loc||Kfa.loc==G.loc||Kda.loc==G.loc)
						var/damage = src.reiatsu*4- G.defence / 2
						if(damage <= 0)
							damage =rand(25,1000)
						G.Death(src,damage,rand(1,2))
				var/obj/Kaa = new/obj/tentacle(locate(src.x+1,src.y,src.z))
				var/obj/Ksa = new/obj/tentacle(locate(src.x-1,src.y,src.z))
				var/obj/Kda = new/obj/tentacle(locate(src.x,src.y+1,src.z))
				var/obj/Kfa = new/obj/tentacle(locate(src.x,src.y-1,src.z))
				Kaa:Gowner = src
				Ksa:Gowner = src
				Kda:Gowner = src
				Kfa:Gowner = src
				for(var/mob/G in oview(4,src))
					if(Kaa.loc==G.loc||Ksa.loc==G.loc||Kda.loc==G.loc||Kfa.loc==G.loc)//||Kaa.loc==G.loc||Ksa.loc==G.loc||Kfa.loc==G.loc||Kda.loc==G.loc)
						var/damage = src.attack*2.5
						if(damage <= 0)
							damage =rand(25,1000)
						G.Death(src,damage,rand(1,4))
		Ice_Field()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 1800)
				src << "<b>Your rei is too low!"
				return
			if(src.icefieldcd)return
			if(!src.icefieldcd)
				src.icefieldcd = 1
				src.rei -= 1800
				if(src.stype=="Dark Bat"||src.ftype=="Dark Bat"|| src.ressurectiontype=="Dark Bat")
					view(src,8) << "<b>[src]: Dark Field!"
					var/obj/K = new/obj/BlackFlame(locate(src.x+2,src.y,src.z))
					var/obj/Kr = new/obj/BlackFlame(locate(src.x+1,src.y+1,src.z))
					var/obj/Ka = new/obj/BlackFlame(locate(src.x,src.y+2,src.z))
					var/obj/Ks = new/obj/BlackFlame(locate(src.x-2,src.y,src.z))
					var/obj/Kd = new/obj/BlackFlame(locate(src.x-1,src.y-1,src.z))
					var/obj/Kf = new/obj/BlackFlame(locate(src.x,src.y-2,src.z))
					var/obj/Ksbb = new/obj/BlackFlame(locate(src.x-1,src.y+1,src.z))
					var/obj/Kdbb = new/obj/BlackFlame(locate(src.x+1,src.y-1,src.z))
					var/obj/Kbbbb = new/obj/BlackFlame(locate(src.x+3,src.y,src.z))
					var/obj/Kbbbbb = new/obj/BlackFlame(locate(src.x-3,src.y,src.z))
					var/obj/Kbbbbbb = new/obj/BlackFlame(locate(src.x,src.y-3,src.z))
					var/obj/Kbbbbbbb = new/obj/BlackFlame(locate(src.x,src.y+3,src.z))
					Kbbbb.Gowner = src
					Kbbbbb.Gowner = src
					Kbbbbbb.Gowner = src
					Kbbbbbbb.Gowner = src
					K.Gowner = src
					Kr.Gowner = src
					Ka.Gowner = src
					Ks.Gowner = src
					Kd.Gowner = src
					Ksbb.Gowner = src
					Kdbb.Gowner = src
					Kf.Gowner = src
					spawn(130)
					src.icefieldcd = 0
					for(var/mob/G in oview(4,src))
						if(Ksbb.loc==G.loc||Kbbbb.loc==G||Kbbbbb.loc==G||Kbbbbbb.loc==G||Kbbbbbbb.loc==G||Kdbb.loc==G.loc||K.loc==G.loc||Kr.loc==G.loc||Ka.loc==G.loc||Ks.loc==G.loc||Kd.loc==G.loc||Kf.loc==G.loc)//||Kaa.loc==G.loc||Ksa.loc==G.loc||Kfa.loc==G.loc||Kda.loc==G.loc)
							var/damage = src.reiatsu*4- G.defence / 2
							if(damage <= 0)
								damage =rand(25,1000)
							G.Death(src,damage,rand(1,2))
					var/obj/Kaa = new/obj/BlackFlame(locate(src.x+1,src.y,src.z))
					var/obj/Ksa = new/obj/BlackFlame(locate(src.x-1,src.y,src.z))
					var/obj/Kda = new/obj/BlackFlame(locate(src.x,src.y+1,src.z))
					var/obj/Kfa = new/obj/BlackFlame(locate(src.x,src.y-1,src.z))
					Kaa:Gowner = src
					Ksa:Gowner = src
					Kda:Gowner = src
					Kfa:Gowner = src
					for(var/mob/G in oview(4,src))
						if(Kaa.loc==G.loc||Ksa.loc==G.loc||Kda.loc==G.loc||Kfa.loc==G.loc)//||Kaa.loc==G.loc||Ksa.loc==G.loc||Kfa.loc==G.loc||Kda.loc==G.loc)
							var/damage = src.reiatsu*4 - G.defence / 2
							if(damage <= 0)
								damage =rand(25,1000)
							G.Death(src,damage,rand(1,2))
				else
					view(src,8) << "<b>[src]: Ice Field!"
					var/obj/K = new/obj/icicle(locate(src.x+2,src.y,src.z))
					var/obj/Kr = new/obj/icicle(locate(src.x+1,src.y+1,src.z))
					var/obj/Ka = new/obj/icicle(locate(src.x,src.y+2,src.z))
					var/obj/Ks = new/obj/icicle(locate(src.x-2,src.y,src.z))
					var/obj/Kd = new/obj/icicle(locate(src.x-1,src.y-1,src.z))
					var/obj/Kf = new/obj/icicle(locate(src.x,src.y-2,src.z))
					var/obj/Ksbb = new/obj/icicle(locate(src.x-1,src.y+1,src.z))
					var/obj/Kdbb = new/obj/icicle(locate(src.x+1,src.y-1,src.z))
					var/obj/Kbbbb = new/obj/icicle(locate(src.x+3,src.y,src.z))
					var/obj/Kbbbbb = new/obj/icicle(locate(src.x-3,src.y,src.z))
					var/obj/Kbbbbbb = new/obj/icicle(locate(src.x,src.y-3,src.z))
					var/obj/Kbbbbbbb = new/obj/icicle(locate(src.x,src.y+3,src.z))
					Kbbbb.Gowner = src
					Kbbbbb.Gowner = src
					Kbbbbbb.Gowner = src
					Kbbbbbbb.Gowner = src
					K.Gowner = src
					Kr.Gowner = src
					Ka.Gowner = src
					Ks.Gowner = src
					Kd.Gowner = src
					Ksbb.Gowner = src
					Kdbb.Gowner = src
					Kf.Gowner = src
					spawn(130)
					src.icefieldcd = 0
					for(var/mob/G in oview(4,src))
						if(Ksbb.loc==G.loc||Kbbbb.loc==G||Kbbbbb.loc==G||Kbbbbbb.loc==G||Kbbbbbbb.loc==G||Kdbb.loc==G.loc||K.loc==G.loc||Kr.loc==G.loc||Ka.loc==G.loc||Ks.loc==G.loc||Kd.loc==G.loc||Kf.loc==G.loc)//||Kaa.loc==G.loc||Ksa.loc==G.loc||Kfa.loc==G.loc||Kda.loc==G.loc)
							var/damage = src.reiatsu*4- G.defence / 2
							if(damage <= 0)
								damage =rand(25,1000)
							G.Death(src,damage,rand(1,2))
					var/obj/Kaa = new/obj/icicle(locate(src.x+1,src.y,src.z))
					var/obj/Ksa = new/obj/icicle(locate(src.x-1,src.y,src.z))
					var/obj/Kda = new/obj/icicle(locate(src.x,src.y+1,src.z))
					var/obj/Kfa = new/obj/icicle(locate(src.x,src.y-1,src.z))
					Kaa:Gowner = src
					Ksa:Gowner = src
					Kda:Gowner = src
					Kfa:Gowner = src
					for(var/mob/G in oview(4,src))
						if(Kaa.loc==G.loc||Ksa.loc==G.loc||Kda.loc==G.loc||Kfa.loc==G.loc)//||Kaa.loc==G.loc||Ksa.loc==G.loc||Kfa.loc==G.loc||Kda.loc==G.loc)
							var/damage = src.reiatsu*4 - G.defence / 2
							if(damage <= 0)
								damage =rand(25,1000)
							G.Death(src,damage,rand(1,2))
mob
	proc
		Explode()
			if(src.safe||src.fireback)
				return
			if(src.frozen==1)
				return
			if(!src.inbankai && !src.inshikai)
				src << "<b>Your sword must first be in shikai or bankai."
				return
			if(src.rei<2000)
				src << "<b>You need more rei [rei]/2000."
				return
			if(src.firing==0)
				src.rei-=2000
				for(var/mob/M in view(8,src))
					if(M in src.smoked)
						new/obj/explode/k5(M.loc)
						if(!M.protected)
							var/damage = src.attack * 3 - M.defence / 3
							damage=rand(damage*0.8,damage*1.3)
							if(damage <= 0)
								damage =rand(25,1000)
							viewers(src) << output("<b><font color = red>[src] exploded [M] for [damage] damage!", "combat_output")
						//	view(src,8) << "<b><font color = red>[src] exploded [M] for [damage] damage!"
							M.Load_Overlays()
							M.Death(src,damage,rand(2,3))
							if(src.inshikai&&src.shikaidrain > 0)
								if(M.killable)src.shimastery(3)
							if(src.inbankai&&src.bankaidrain > 0)
								if(M.killable)src.banmastery(3)
					if(src.key=="Awesome93" || src.key =="Audain1")
						new/obj/explode/k5(M.loc)
						if(!M.protected)
							var/damage = src.attack * 3 - M.defence / 3
							damage=rand(damage*0.8,damage*1.3)
							if(damage <= 0)
								damage =rand(25,1000)
							viewers(src) << output("<b><font color = red>[src] exploded [M] for [damage] damage!", "combat_output")
							//view(src,8) << "<b><font color = red>[src] exploded [M] for [damage] damage!"
							M.Load_Overlays()
							M.Death(src,damage,rand(2,3))
							if(src.inshikai&&src.shikaidrain > 0)
								if(M.killable)src.shimastery(3)
							if(src.inbankai&&src.bankaidrain > 0)
								if(M.killable)src.banmastery(3)
				sleep(30)
				src.firing=0

mob
	proc
		Hakuren()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 1800)
				src << "<b>Your rei is too low!"
				return
			if(src.stype == "Dark Bat"||src.ftype=="Dark Bat"|| src.ressurectiontype=="Dark Bat")
				if(!src.hakurencd)
					src.hakurencd = 1
					src.rei -= 1800
					view(src,8) << "<b>[src]: Hakuren!"
					if(!src.inbankai)
						var/K = new/obj/Darkban(src.loc)
						K:Gowner = src
						walk(K,src.dir)
					if(src.inbankai)
						src.Freeze(10)
						var/obj/K = new/obj/Darkban(src.loc)
						K:Gowner = src
						K.dir=src.dir
						walk(K,src.dir)
						spawn(1)
							if(K)
								var/obj/Ka = new/obj/Darkban(K.loc)
								Ka:Gowner = src
								Ka.dir = turn(K.dir, 45)
								walk(Ka,Ka.dir)
								var/obj/Ks = new/obj/Darkban(K.loc)
								Ks:Gowner = src
								Ks.dir = turn(K.dir, -45)
								walk(Ks,Ks.dir)
								spawn(1)
									if(Ka)
										var/obj/Kaa = new/obj/Darkban(Ka.loc)
										Kaa:Gowner = src
										Kaa.dir = turn(Ka.dir, -45)
										walk(Kaa,Kaa.dir)
									if(Ks)
										var/obj/Kss = new/obj/Darkban(Ks.loc)
										Kss:Gowner = src
										Kss.dir = turn(Ks.dir, 45)
										walk(Kss,Kss.dir)
									spawn(1)
										if(Ka)
											var/obj/Kaad = new/obj/Darkban(Ka.loc)
											Kaad:Gowner = src
											Kaad.dir = turn(Ka.dir, -45)
											walk(Kaad,Kaad.dir)
										if(Ks)
											var/obj/Ksss = new/obj/Darkban(Ks.loc)
											Ksss:Gowner = src
											Ksss.dir = turn(Ks.dir, 45)
											walk(Ksss,Ksss.dir)
										spawn(1)
											for(var/obj/Darkban/m)
												if(m.Gowner==src)
													walk(m,src.dir)
													spawn(7)
													walk(m,0)
					src.banmastery(10)
					sleep(150)
					src.hakurencd = 0
			else
				if(!src.hakurencd)
					src.hakurencd = 1
					src.rei -= 1800
					view(src,8) << "<b>[src]: Hakuren!"
					if(!src.inbankai)
						var/K = new/obj/rukiaban(src.loc)
						K:Gowner = src
						walk(K,src.dir)
					if(src.inbankai)
						src.Freeze(10)
						var/obj/K = new/obj/rukiaban(src.loc)
						K:Gowner = src
						K.dir=src.dir
						walk(K,src.dir)
						spawn(1)
							if(K)
								var/obj/Ka = new/obj/rukiaban(K.loc)
								Ka:Gowner = src
								Ka.dir = turn(K.dir, 45)
								walk(Ka,Ka.dir)
								var/obj/Ks = new/obj/rukiaban(K.loc)
								Ks:Gowner = src
								Ks.dir = turn(K.dir, -45)
								walk(Ks,Ks.dir)
								spawn(1)
									if(Ka)
										var/obj/Kaa = new/obj/rukiaban(Ka.loc)
										Kaa:Gowner = src
										Kaa.dir = turn(Ka.dir, -45)
										walk(Kaa,Kaa.dir)
									if(Ks)
										var/obj/Kss = new/obj/rukiaban(Ks.loc)
										Kss:Gowner = src
										Kss.dir = turn(Ks.dir, 45)
										walk(Kss,Kss.dir)
									spawn(1)
										if(Ka)
											var/obj/Kaad = new/obj/rukiaban(Ka.loc)
											Kaad:Gowner = src
											Kaad.dir = turn(Ka.dir, -45)
											walk(Kaad,Kaad.dir)
										if(Ks)
											var/obj/Ksss = new/obj/rukiaban(Ks.loc)
											Ksss:Gowner = src
											Ksss.dir = turn(Ks.dir, 45)
											walk(Ksss,Ksss.dir)
										spawn(1)
											for(var/obj/rukiaban/m)
												if(m.Gowner==src)
													walk(m,src.dir)
													spawn(7)
													walk(m,0)
					src.banmastery(10)
					sleep(150)
					src.hakurencd = 0
mob
	proc
		Dragon()
			if(src.rei < 1550)
				src << "<b>Your rei is too low!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.firing)
				src<<"This skill got taken out"
mob
	proc
		Blades()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 1800)
				src << "<b>Your rei is too low!"
				return
			if(src.firing == 0)
				src.firing = 1
				src.rei -= 1800
				var/obj/K = new/obj/shinsou2(src.loc)
				K.dir=src.dir
				K:Gowner = src
				walk(K,src.dir)
				src.banmastery(10)
				sleep(50)
				src.firing = 0
mob
	proc
		Shuriken_Toss()
			if(src.safe||src.fireback)return
			if(src.rei <= 1000)
				src << "<b>Your rei is too low!"
				return
			if(src.firing ==0)
				src.firing=1
				src.rei -=1000
				var/mob/shuriken/A = new /mob/shuriken(src.loc)
				var/mob/shuriken/C = new /mob/shuriken(src.loc)
				A.owner = src
				C.owner = src
				var/mob/shuriken/Ar = new /mob/shuriken(src.loc)
				var/mob/shuriken/Ba = new /mob/shuriken(src.loc)
				var/mob/shuriken/Ca = new /mob/shuriken(src.loc)
				Ar.owner = src
				Ba.owner = src
				Ca.owner = src
				var/mob/shuriken/Aa = new /mob/shuriken(src.loc)
				var/mob/shuriken/Bs = new /mob/shuriken(src.loc)
				var/mob/shuriken/Cs = new /mob/shuriken(src.loc)
				Aa.owner = src
				Bs.owner = src
				Cs.owner = src
				spawn(1)
					A.icon='Icons/shuriken.dmi'
					Aa.icon='Icons/shuriken.dmi'
					Ar.icon='Icons/shuriken.dmi'
					Ba.icon='Icons/shuriken.dmi'
					Bs.icon='Icons/shuriken.dmi'
					C.icon='Icons/shuriken.dmi'
					Cs.icon='Icons/shuriken.dmi'
					Ca.icon='Icons/shuriken.dmi'
					walk(Aa,NORTH)
					walk(Cs,NORTHEAST)
					walk(Bs,NORTHWEST)
					walk(Ar,SOUTH)
					walk(Ca,SOUTHEAST)
					walk(Ba,SOUTHWEST)
					walk(A,EAST)
					walk(C,WEST)
				spawn(88)
				src.firing=0

		RapidShot()
			if(src.safe||src.fireback)return
			if(src.rei <= 1000)
				src << "<b>Your rei is too low [src.rei]/1000!"
				return
			if(!src.rapidshotcd)
				src.rapidshotcd=1
				src.rei-=1000
				if(src.dir == NORTH||src.dir == SOUTH||src.dir == NORTHEAST||src.dir == NORTHWEST||src.dir == SOUTHEAST||src.dir == SOUTHWEST)
					var/obj/arrowrapid/A = new /obj/arrowrapid/
					var/obj/arrowrapid/B = new /obj/arrowrapid/
					var/obj/arrowrapid/C = new /obj/arrowrapid/
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
					var/obj/arrowrapid/Ar = new /obj/arrowrapid/
					var/obj/arrowrapid/Ba = new /obj/arrowrapid/
					var/obj/arrowrapid/Ca = new /obj/arrowrapid/
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
					var/obj/arrowrapid/Aa = new /obj/arrowrapid/
					var/obj/arrowrapid/Bs = new /obj/arrowrapid/
					var/obj/arrowrapid/Cs = new /obj/arrowrapid/
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
					var/obj/arrowrapid/As = new /obj/arrowrapid/
					var/obj/arrowrapid/Bd = new /obj/arrowrapid/
					var/obj/arrowrapid/Cd = new /obj/arrowrapid/
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
					var/obj/arrowrapid/Ad = new /obj/arrowrapid/
					var/obj/arrowrapid/Bf = new /obj/arrowrapid/
					var/obj/arrowrapid/Cf = new /obj/arrowrapid/
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
					var/obj/arrowrapid/Ae = new /obj/arrowrapid/
					var/obj/arrowrapid/Bg = new /obj/arrowrapid/
					var/obj/arrowrapid/Cg = new /obj/arrowrapid/
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
					sleep(150)
					src.rapidshotcd=0
					return
				if(src.dir == WEST||src.dir == EAST)
					var/obj/arrowrapid/A = new /obj/arrowrapid/
					var/obj/arrowrapid/B = new /obj/arrowrapid/
					var/obj/arrowrapid/C = new /obj/arrowrapid/
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
					var/obj/arrowrapid/Ar = new /obj/arrowrapid/
					var/obj/arrowrapid/Ba = new /obj/arrowrapid/
					var/obj/arrowrapid/Ca = new /obj/arrowrapid/
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
					var/obj/arrowrapid/Aa = new /obj/arrowrapid/
					var/obj/arrowrapid/Bs = new /obj/arrowrapid/
					var/obj/arrowrapid/Cs = new /obj/arrowrapid/
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
					var/obj/arrowrapid/As = new /obj/arrowrapid/
					var/obj/arrowrapid/Bd = new /obj/arrowrapid/
					var/obj/arrowrapid/Cd = new /obj/arrowrapid/
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
					var/obj/arrowrapid/Ad = new /obj/arrowrapid/
					var/obj/arrowrapid/Bf = new /obj/arrowrapid/
					var/obj/arrowrapid/Cf = new /obj/arrowrapid/
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
					var/obj/arrowrapid/Ae = new /obj/arrowrapid/
					var/obj/arrowrapid/Bg = new /obj/arrowrapid/
					var/obj/arrowrapid/Cg = new /obj/arrowrapid/
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
					sleep(150)
					src.rapidshotcd=0
		Ring_Parade()
			if(src.safe||src.fireback)return
			if(!src.inafull&&!src.infinal)
				src << "<b>You must be in advanced fullbring!"//ressurection
				return
			if(src.rei <= 3000)
				src << "<b>Your rei is too low [src.rei]/3000!"
				return
			if(!src.ringparadecd)
				src.ringparadecd=1
				src.rei-=3000
				src.overlays -= /obj/Zanpakutou/Ichigo_F
				src.overlays -= /obj/Zanpakutou/Ichigo_F2
				if(src.dir == NORTH||src.dir == SOUTH||src.dir == NORTHEAST||src.dir == NORTHWEST||src.dir == SOUTHEAST||src.dir == SOUTHWEST)
					var/obj/getsugaring/A = new /obj/getsugaring/
					var/obj/getsugaring/B = new /obj/getsugaring/
					var/obj/getsugaring/C = new /obj/getsugaring/
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
					var/obj/getsugaring/Ar = new /obj/getsugaring/
					var/obj/getsugaring/Ba = new /obj/getsugaring/
					var/obj/getsugaring/Ca = new /obj/getsugaring/
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
					var/obj/getsugaring/Aa = new /obj/getsugaring/
					var/obj/getsugaring/Bs = new /obj/getsugaring/
					var/obj/getsugaring/Cs = new /obj/getsugaring/
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
					var/obj/getsugaring/As = new /obj/getsugaring/
					var/obj/getsugaring/Bd = new /obj/getsugaring/
					var/obj/getsugaring/Cd = new /obj/getsugaring/
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
					var/obj/getsugaring/Ad = new /obj/getsugaring/
					var/obj/getsugaring/Bf = new /obj/getsugaring/
					var/obj/getsugaring/Cf = new /obj/getsugaring/
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
					var/obj/getsugaring/Ae = new /obj/getsugaring/
					var/obj/getsugaring/Bg = new /obj/getsugaring/
					var/obj/getsugaring/Cg = new /obj/getsugaring/
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
					var/obj/getsugaring/A = new /obj/getsugaring/
					var/obj/getsugaring/B = new /obj/getsugaring/
					var/obj/getsugaring/C = new /obj/getsugaring/
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
					var/obj/getsugaring/Ar = new /obj/getsugaring/
					var/obj/getsugaring/Ba = new /obj/getsugaring/
					var/obj/getsugaring/Ca = new /obj/getsugaring/
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
					var/obj/getsugaring/Aa = new /obj/getsugaring/
					var/obj/getsugaring/Bs = new /obj/getsugaring/
					var/obj/getsugaring/Cs = new /obj/getsugaring/
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
					var/obj/getsugaring/As = new /obj/getsugaring/
					var/obj/getsugaring/Bd = new /obj/getsugaring/
					var/obj/getsugaring/Cd = new /obj/getsugaring/
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
					var/obj/getsugaring/Ad = new /obj/getsugaring/
					var/obj/getsugaring/Bf = new /obj/getsugaring/
					var/obj/getsugaring/Cf = new /obj/getsugaring/
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
					var/obj/getsugaring/Ae = new /obj/getsugaring/
					var/obj/getsugaring/Bg = new /obj/getsugaring/
					var/obj/getsugaring/Cg = new /obj/getsugaring/
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
		Aging_Barrage2()
			if(src.safe||src.fireback)return
			if(!src.ressurection)
				src << "<b>You must be in your ressurecion!"//ressurection
				return
			if(src.rei <= 3000)
				src << "<b>Your rei is too low [src.rei]/3000!"
				return
			if(!src.ringparadecd)
				src.ringparadecd=1
				if(!src.key in specialverbs)
					src.rei-=3000
				if(src.dir == NORTH||src.dir == SOUTH||src.dir == NORTHEAST||src.dir == NORTHWEST||src.dir == SOUTHEAST||src.dir == SOUTHWEST)
					var/obj/getsugaring/A = new /obj/getsugaring/
					var/obj/getsugaring/B = new /obj/getsugaring/
					var/obj/getsugaring/C = new /obj/getsugaring/
					A.icon='Icons/respira ball.dmi'
					B.icon='Icons/respira ball.dmi'
					C.icon='Icons/respira ball.dmi'
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
					var/obj/getsugaring/Ar = new /obj/getsugaring/
					var/obj/getsugaring/Ba = new /obj/getsugaring/
					var/obj/getsugaring/Ca = new /obj/getsugaring/
					Ar.icon='Icons/respira ball.dmi'
					Ba.icon='Icons/respira ball.dmi'
					Ca.icon='Icons/respira ball.dmi'
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
					var/obj/getsugaring/Aa = new /obj/getsugaring/
					var/obj/getsugaring/Bs = new /obj/getsugaring/
					var/obj/getsugaring/Cs = new /obj/getsugaring/
					Aa.icon='Icons/respira ball.dmi'
					Bs.icon='Icons/respira ball.dmi'
					Cs.icon='Icons/respira ball.dmi'
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
					var/obj/getsugaring/As = new /obj/getsugaring/
					var/obj/getsugaring/Bd = new /obj/getsugaring/
					var/obj/getsugaring/Cd = new /obj/getsugaring/
					As.icon='Icons/respira ball.dmi'
					Bd.icon='Icons/respira ball.dmi'
					Cd.icon='Icons/respira ball.dmi'
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
					var/obj/getsugaring/Ad = new /obj/getsugaring/
					var/obj/getsugaring/Bf = new /obj/getsugaring/
					var/obj/getsugaring/Cf = new /obj/getsugaring/
					Ad.icon='Icons/respira ball.dmi'
					Bf.icon='Icons/respira ball.dmi'
					Cf.icon='Icons/respira ball.dmi'
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
					var/obj/getsugaring/Ae = new /obj/getsugaring/
					var/obj/getsugaring/Bg = new /obj/getsugaring/
					var/obj/getsugaring/Cg = new /obj/getsugaring/
					Ae.icon='Icons/respira ball.dmi'
					Bg.icon='Icons/respira ball.dmi'
					Cg.icon='Icons/respira ball.dmi'
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
					var/obj/getsugaring/A = new /obj/getsugaring/
					var/obj/getsugaring/B = new /obj/getsugaring/
					var/obj/getsugaring/C = new /obj/getsugaring/
					A.icon='Icons/respira ball.dmi'
					B.icon='Icons/respira ball.dmi'
					C.icon='Icons/respira ball.dmi'
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
					var/obj/getsugaring/Ar = new /obj/getsugaring/
					var/obj/getsugaring/Ba = new /obj/getsugaring/
					var/obj/getsugaring/Ca = new /obj/getsugaring/
					Ar.icon='Icons/respira ball.dmi'
					Ba.icon='Icons/respira ball.dmi'
					Ca.icon='Icons/respira ball.dmi'
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
					var/obj/getsugaring/Aa = new /obj/getsugaring/
					var/obj/getsugaring/Bs = new /obj/getsugaring/
					var/obj/getsugaring/Cs = new /obj/getsugaring/
					Aa.icon='Icons/respira ball.dmi'
					Bs.icon='Icons/respira ball.dmi'
					Cs.icon='Icons/respira ball.dmi'
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
					var/obj/getsugaring/As = new /obj/getsugaring/
					var/obj/getsugaring/Bd = new /obj/getsugaring/
					var/obj/getsugaring/Cd = new /obj/getsugaring/
					As.icon='Icons/respira ball.dmi'
					Bd.icon='Icons/respira ball.dmi'
					Cd.icon='Icons/respira ball.dmi'
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
					var/obj/getsugaring/Ad = new /obj/getsugaring/
					var/obj/getsugaring/Bf = new /obj/getsugaring/
					var/obj/getsugaring/Cf = new /obj/getsugaring/
					Ad.icon='Icons/respira ball.dmi'
					Bf.icon='Icons/respira ball.dmi'
					Cf.icon='Icons/respira ball.dmi'
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
					var/obj/getsugaring/Ae = new /obj/getsugaring/
					var/obj/getsugaring/Bg = new /obj/getsugaring/
					var/obj/getsugaring/Cg = new /obj/getsugaring/
					Ae.icon='Icons/respira ball.dmi'
					Bg.icon='Icons/respira ball.dmi'
					Cg.icon='Icons/respira ball.dmi'
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
					if(src.key in specialverbs)
						src.ringparadecd=0
					sleep(350)
					src.ringparadecd=0
					return
mob
	proc
		Baboon_Blast()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 2000)
				src << "<b>Your rei is too low!"
				return
			if(!src.inbankai)
				src<<"<b>You must be in bankai!"
				return
			if(src.extending)
				src<<"<b>You have to retract [src.swordname] first"
				return
			if(src.stype!="Renji")
				src<<"Only Renji can do this"
				return
			if(src.renjifire == 0)
				src.renjifire = 1
				src.frozen=1
				src.rei -= 2000
				src.extending=1
				src.Load_Overlays()
				var/mob/k=new/mob/zabimaru(src.loc)
				k.dir=src.dir
				k.owner=src
				var/obj/K2 = new/obj/charge(src.loc)
				K2.icon = 'Icons/renjibankaimove.dmi'
				flick("charge",K2)
				sleep(5)
				src.frozen=0
				if(k)
					var/obj/cannon/A = new /obj/cannon/b2
					A.loc = locate(k.x, k.y, k.z)
					A.dir = src.dir
					A.Gowner = src
					walk(A,src.dir)
				sleep(10)
				src.extending=0
				src.Load_Overlays()
				sleep(140)
				src.renjifire = 0
		Cero()
			if(src.race == "Yammy Boss" || src.race == "Hollow"||src.race == "Arrancar"||src.race == "Vaizard"||src.ulquiorra||src.grimmjow||src.szayel||src.stark||src.vastoichigo||src.vaifuse==1)
				if(src.safe||src.fireback)
					return
				if(src.rei <= 500)
					src << "<b>Your rei is too low!"
					return
				if(!src.cerocd)
					src.cerocd = 1
					src.rei -= 500
					if(src.etarget)src.Facedir(src.etarget)
					var/obj/K = new/obj/cero(src.loc)
					K.Gowner = src
					if(src.cerocolor=="Red")K.icon='Icons/new red cero.dmi'
					if(src.cerocolor=="Blue")K.icon='Icons/bluenew cero.dmi'
					if(src.cerocolor=="Green")K.icon='Icons/greennew cero.dmi'
					if(src.cerocolor=="Yellow")K.icon='Icons/yellownew cero.dmi'
					K:dir = src.dir
					walk(K,src.dir)
					spawn(50)
					src.cerocd = 0
			else
				src << "<b>Only Hollows/Arrancars/Vaizards can use this move!"
				return
		Raihou()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 3000)
				src << "<b>Your rei is too low [src.rei]/3000!"
				return
			if(!src.ocerocd)
				src.ocerocd = 1
				src.rei -= 3000
				if(src.etarget)src.Facedir(src.etarget)
				src.Freeze(7)
				new/obj/raihoucharge(src.loc)
				sleep(7)
				var/obj/K = new/obj/raihou(src.loc)
				K.Gowner = src
				K:dir = src.dir
				walk(K,src.dir)
				sleep(120)
				src.ocerocd = 0
		Cero_Oscura()
			if(src.ressurection)
				if(src.safe||src.fireback)
					return
				if(src.rei <= 2000)
					src << "<b>Your rei is too low!"
					return
				if(!src.ocerocd)
					src.ocerocd = 1
					src.rei -= 2000
					if(src.etarget)src.Facedir(src.etarget)
					src.Freeze(7)
					new/obj/ocerocharge(src.loc)
					sleep(7)
					var/obj/K = new/obj/ocero(src.loc)
					K.Gowner = src
					K:dir = src.dir
					walk(K,src.dir)
					sleep(100)
					src.ocerocd = 0
			else
				src << "<b>You must be in ressurection!"
				return
		Cero_Doble()
			if(src.ressurection)
				if(src.safe||src.fireback)
					return
				if(src.rei <= 500)
					src << "<b>Your rei is too low!"
					return
				if(src.absorbcero)
					if(!src.cerodoblecd)
						src.cerodoblecd=1
						src.absorbcero = 0
						src.rei -= 500
						if(src.etarget)src.Facedir(src.etarget)
						var/obj/K = new/obj/cerodoble(src.loc)
						if(src.cerocolor=="Red")K.icon='Icons/new red cero.dmi'
						if(src.cerocolor=="Blue")K.icon='Icons/bluenew cero.dmi'
						if(src.cerocolor=="Green")K.icon='Icons/greennew cero.dmi'
						if(src.cerocolor=="Yellow")K.icon='Icons/yellownew cero.dmi'
						K:Gowner = src
						K:dir = src.dir
						walk(K,src.dir)
						sleep(200)
						src.cerodoblecd=0
			else
				src << "<b>You must be in ressurection!"
				return
		Cero2()
			if(src.race == "Yammy Boss"||src.race == "Arrancar"||src.race == "Vaizard"||src.ulquiorra||src.grimmjow||src.szayel||src.stark||src.vastoichigo||src.ftype=="Ginjo"||src.vaifuse==1)
				if(src.safe||src.fireback)
					return
				if(src.rei <= 2500)
					src << "<b>Your rei is too low [src.rei]/2500!"
					return
				if(!src.cero2cd)
					src.cero2cd = 1
					src.frozen=1
					src.rei -= 2500
					var/obj/K2 = new/obj/charge(src.loc)
					new/obj/ceroc(locate(src.x-5,src.y,src.z))
					new/obj/ceroc(locate(src.x+5,src.y,src.z))
					new/obj/ceroc(locate(src.x+5,src.y-5,src.z))
					new/obj/ceroc(locate(src.x-5,src.y-5,src.z))
					new/obj/ceroc(locate(src.x,src.y-5,src.z))
					new/obj/ceroc(locate(src.x,src.y+5,src.z))
					new/obj/ceroc(locate(src.x+5,src.y+5,src.z))
					new/obj/ceroc(locate(src.x-5,src.y+5,src.z))
					for(var/obj/ceroc/DF in oview(6))
						walk_towards(DF,src,0)
					K2:icon = 'Icons/ceroc2.dmi'
					if(src.cerocolor=="Red")K2.icon='Icons/cero2red.dmi'
					if(src.cerocolor=="Blue")K2.icon='Icons/cero2blue.dmi'
					if(src.cerocolor=="Green")K2.icon='Icons/cero2green.dmi'
					if(src.cerocolor=="Yellow")K2.icon='Icons/cero2yellow.dmi'
					sleep(5)
					src.frozen=0
					if(src.dir == NORTH)
						var/obj/ccero/A = new /obj/ccero/
						var/obj/ccero/B = new /obj/ccero/
						var/obj/ccero/C = new /obj/ccero/
						if(src.cerocolor=="Red")A.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")A.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Red")B.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")B.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Red")C.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")C.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Green")A.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")A.icon='Icons/cero2yellow.dmi'
						if(src.cerocolor=="Green")B.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")B.icon='Icons/cero2yellow.dmi'
						if(src.cerocolor=="Green")C.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")C.icon='Icons/cero2yellow.dmi'
						A.loc = locate(src.x, src.y, src.z)
						C.loc = locate(src.x-1, src.y, src.z)
						B.loc = locate(src.x+1, src.y, src.z)
						B.icon_state = "1"
						C.icon_state = "2"
						A.dir = src.dir
						B.dir = src.dir
						C.dir = src.dir
						A.Gowner = src
						B.Gowner = src
						C.Gowner = src
						walk(A,NORTH)
						walk(C,NORTH)
						walk(B,NORTH)
					if(src.dir == SOUTH)
						var/obj/ccero/A = new /obj/ccero/
						var/obj/ccero/B = new /obj/ccero/
						var/obj/ccero/C = new /obj/ccero/
						if(src.cerocolor=="Red")A.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")A.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Red")B.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")B.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Red")C.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")C.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Green")A.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")A.icon='Icons/cero2yellow.dmi'
						if(src.cerocolor=="Green")B.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")B.icon='Icons/cero2yellow.dmi'
						if(src.cerocolor=="Green")C.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")C.icon='Icons/cero2yellow.dmi'
						A.loc = locate(src.x, src.y, src.z)
						C.loc = locate(src.x+1, src.y, src.z)
						B.loc = locate(src.x-1, src.y, src.z)
						C.icon_state = "1"
						B.icon_state = "2"
						A.dir = src.dir
						B.dir = src.dir
						C.dir = src.dir
						A.Gowner = src
						B.Gowner = src
						C.Gowner = src
						walk(A,SOUTH)
						walk(C,SOUTH)
						walk(B,SOUTH)
					if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST)
						var/obj/ccero/A = new /obj/ccero/
						var/obj/ccero/B = new /obj/ccero/
						var/obj/ccero/C = new /obj/ccero/
						if(src.cerocolor=="Red")A.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")A.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Red")B.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")B.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Red")C.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")C.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Green")A.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")A.icon='Icons/cero2yellow.dmi'
						if(src.cerocolor=="Green")B.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")B.icon='Icons/cero2yellow.dmi'
						if(src.cerocolor=="Green")C.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")C.icon='Icons/cero2yellow.dmi'
						A.loc = locate(src.x, src.y+1, src.z)
						C.loc = locate(src.x, src.y, src.z)
						B.loc = locate(src.x, src.y-1, src.z)
						A.Gowner = src
						B.Gowner = src
						C.Gowner = src
						A.dir = src.dir
						B.dir = src.dir
						C.dir = src.dir
						B.icon_state = "1"
						A.icon_state = "2"
						walk(A,src.dir)
						walk(C,src.dir)
						walk(B,src.dir)
					if(src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
						var/obj/ccero/A = new /obj/ccero/
						var/obj/ccero/B = new /obj/ccero/
						var/obj/ccero/C = new /obj/ccero/
						if(src.cerocolor=="Red")A.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")A.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Red")B.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")B.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Red")C.icon='Icons/cero2red.dmi'
						if(src.cerocolor=="Blue")C.icon='Icons/cero2blue.dmi'
						if(src.cerocolor=="Green")A.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")A.icon='Icons/cero2yellow.dmi'
						if(src.cerocolor=="Green")B.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")B.icon='Icons/cero2yellow.dmi'
						if(src.cerocolor=="Green")C.icon='Icons/cero2green.dmi'
						if(src.cerocolor=="Yellow")C.icon='Icons/cero2yellow.dmi'
						A.loc = locate(src.x, src.y+1, src.z)
						C.loc = locate(src.x, src.y, src.z)
						B.loc = locate(src.x, src.y-1, src.z)
						A.Gowner = src
						B.Gowner = src
						C.Gowner = src
						A.dir = src.dir
						B.dir = src.dir
						C.dir = src.dir
						B.icon_state = "2"
						A.icon_state = "1"
						walk(A,src.dir)
						walk(C,src.dir)
						walk(B,src.dir)
					var/t=src.dir
					src.allowmove=1
					step(src,src.OppositeDirection())
					src.allowmove=0
					src.dir=t
					var/cd=300
					if(src.espadas||src.status)cd=200
					sleep(cd)
					cero2cd = 0
			else
				src << "<b>Only Arrancars and Vaizards can use this move!"
				return
		Cero3()
			//if(src.ressurection)
			if(src.safe||src.fireback)
				return
			if(src.ressurectiontype!="Shooter")
				src << "<b>Only Shooters can use this move!"
				return
			if(!src.ressurection&&!src.inshikai&&!src.inbankai)
				src << "<b>You must be in ressurection!"//ressurection
				return
			if(src.rei <= 2500)
				src << "<b>Your rei is too low [src.rei]/2500!"
				return
			if(!src.cero3cd)
				src.cero3cd = 1
				src.rei -= 2500
				sleep(5)
				if(src.dir == NORTH)
					var/obj/cceros/A = new /obj/cceros/
					var/obj/cceros/B = new /obj/cceros/
					var/obj/cceros/C = new /obj/cceros/
					if(src.cerocolor=="Red")A.icon='Icons/cerosred.dmi'
					if(src.cerocolor=="Blue")A.icon='Icons/cerosblue.dmi'
					if(src.cerocolor=="Red")B.icon='Icons/cerosred.dmi'
					if(src.cerocolor=="Blue")B.icon='Icons/cerosblue.dmi'
					if(src.cerocolor=="Red")C.icon='Icons/cerosred.dmi'
					if(src.cerocolor=="Blue")C.icon='Icons/cerosblue.dmi'
					if(src.cerocolor=="Green")A.icon='Icons/cerosgreen.dmi'
					if(src.cerocolor=="Yellow")A.icon='Icons/cerosyellow.dmi'
					if(src.cerocolor=="Green")B.icon='Icons/cerosgreen.dmi'
					if(src.cerocolor=="Yellow")B.icon='Icons/cerosyellow.dmi'
					if(src.cerocolor=="Green")C.icon='Icons/cerosgreen.dmi'
					if(src.cerocolor=="Yellow")C.icon='Icons/cerosyellow.dmi'
					A.loc = locate(src.x, src.y, src.z)
					C.loc = locate(src.x-1, src.y, src.z)
					B.loc = locate(src.x+1, src.y, src.z)
					B.icon_state = "3"
					C.icon_state = "1"
					A.icon_state = "2"
					A.dir = src.dir
					B.dir = src.dir
					C.dir = src.dir
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,NORTH)
					walk(C,NORTH)
					walk(B,NORTH)
				if(src.dir == SOUTH)
					var/obj/cceros/A = new /obj/cceros/
					var/obj/cceros/B = new /obj/cceros/
					var/obj/cceros/C = new /obj/cceros/
					if(src.cerocolor=="Red")A.icon='Icons/cerosred.dmi'
					if(src.cerocolor=="Blue")A.icon='Icons/cerosblue.dmi'
					if(src.cerocolor=="Red")B.icon='Icons/cerosred.dmi'
					if(src.cerocolor=="Blue")B.icon='Icons/cerosblue.dmi'
					if(src.cerocolor=="Red")C.icon='Icons/cerosred.dmi'
					if(src.cerocolor=="Blue")C.icon='Icons/cerosblue.dmi'
					if(src.cerocolor=="Green")A.icon='Icons/cerosgreen.dmi'
					if(src.cerocolor=="Yellow")A.icon='Icons/cerosyellow.dmi'
					if(src.cerocolor=="Green")B.icon='Icons/cerosgreen.dmi'
					if(src.cerocolor=="Yellow")B.icon='Icons/cerosyellow.dmi'
					if(src.cerocolor=="Green")C.icon='Icons/cerosgreen.dmi'
					if(src.cerocolor=="Yellow")C.icon='Icons/cerosyellow.dmi'
					A.loc = locate(src.x, src.y, src.z)
					C.loc = locate(src.x+1, src.y, src.z)
					B.loc = locate(src.x-1, src.y, src.z)
					C.icon_state = "3"
					B.icon_state = "1"
					A.icon_state = "2"
					A.dir = src.dir
					B.dir = src.dir
					C.dir = src.dir
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,SOUTH)
					walk(C,SOUTH)
					walk(B,SOUTH)
				if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST)
					var/obj/cceros/A = new /obj/cceros/
					var/obj/cceros/B = new /obj/cceros/
					var/obj/cceros/C = new /obj/cceros/
					if(src.cerocolor=="Red")A.icon='Icons/cerosred.dmi'
					if(src.cerocolor=="Blue")A.icon='Icons/cerosblue.dmi'
					if(src.cerocolor=="Red")B.icon='Icons/cerosred.dmi'
					if(src.cerocolor=="Blue")B.icon='Icons/cerosblue.dmi'
					if(src.cerocolor=="Red")C.icon='Icons/cerosred.dmi'
					if(src.cerocolor=="Blue")C.icon='Icons/cerosblue.dmi'
					if(src.cerocolor=="Green")A.icon='Icons/cerosgreen.dmi'
					if(src.cerocolor=="Yellow")A.icon='Icons/cerosyellow.dmi'
					if(src.cerocolor=="Green")B.icon='Icons/cerosgreen.dmi'
					if(src.cerocolor=="Yellow")B.icon='Icons/cerosyellow.dmi'
					if(src.cerocolor=="Green")C.icon='Icons/cerosgreen.dmi'
					if(src.cerocolor=="Yellow")C.icon='Icons/cerosyellow.dmi'
					A.loc = locate(src.x, src.y+1, src.z)
					C.loc = locate(src.x, src.y, src.z)
					B.loc = locate(src.x, src.y-1, src.z)
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					A.dir = src.dir
					B.dir = src.dir
					C.dir = src.dir
					B.icon_state = "2"
					A.icon_state = "1"
					C.icon_state = "3"
					walk(A,src.dir)
					walk(C,src.dir)
					walk(B,src.dir)
				if(src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
					var/obj/cceros/A = new /obj/cceros/
					var/obj/cceros/B = new /obj/cceros/
					var/obj/cceros/C = new /obj/cceros/
					if(src.cerocolor=="Red")A.icon='Icons/cerosred.dmi'
					if(src.cerocolor=="Blue")A.icon='Icons/cerosblue.dmi'
					if(src.cerocolor=="Red")B.icon='Icons/cerosred.dmi'
					if(src.cerocolor=="Blue")B.icon='Icons/cerosblue.dmi'
					if(src.cerocolor=="Red")C.icon='Icons/cerosred.dmi'
					if(src.cerocolor=="Blue")C.icon='Icons/cerosblue.dmi'
					if(src.cerocolor=="Green")A.icon='Icons/cerosgreen.dmi'
					if(src.cerocolor=="Yellow")A.icon='Icons/cerosyellow.dmi'
					if(src.cerocolor=="Green")B.icon='Icons/cerosgreen.dmi'
					if(src.cerocolor=="Yellow")B.icon='Icons/cerosyellow.dmi'
					if(src.cerocolor=="Green")C.icon='Icons/cerosgreen.dmi'
					if(src.cerocolor=="Yellow")C.icon='Icons/cerosyellow.dmi'
					A.loc = locate(src.x, src.y+1, src.z)
					C.loc = locate(src.x, src.y, src.z)
					B.loc = locate(src.x, src.y-1, src.z)
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					A.dir = src.dir
					B.dir = src.dir
					C.dir = src.dir
					B.icon_state = "2"
					A.icon_state = "1"
					C.icon_state = "3"
					walk(A,src.dir)
					walk(C,src.dir)
					walk(B,src.dir)
				sleep(300)
				src.cero3cd = 0
		Darts()
			if(!src.ressurection)
				src << "<b>You must be in ressurection!"
				return
			if(src.safe||src.fireback)
				return
			if(src.rei <= 1100)
				src << "<b>Your rei is too low!"
				return
			if(!src.dartscd)
				src.dartscd = 1
				src.rei -= 1100
				var/obj/K = new/obj/darts(src.loc)
				K:Gowner = src
				K.dir=src.dir
				walk(K,src.dir)
				K:attack = src.reiatsu
				spawn(1)
					if(K)
						var/obj/Ka = new/obj/darts(K.loc)
						Ka:Gowner = src
						Ka.dir = turn(K.dir, 45)
						walk(Ka,Ka.dir)
						var/obj/Ks = new/obj/darts(K.loc)
						Ks:Gowner = src
						Ks.dir = turn(K.dir, -45)
						walk(Ks,Ks.dir)
						spawn(1)
							if(Ka)
								var/obj/Kaa = new/obj/darts(Ka.loc)
								Kaa:Gowner = src
								Kaa.dir = turn(Ka.dir, -45)
								walk(Kaa,Kaa.dir)
							if(Ks)
								var/obj/Kss = new/obj/darts(Ks.loc)
								Kss:Gowner = src
								Kss.dir = turn(Ks.dir, 45)
								walk(Kss,Kss.dir)
				spawn(150)
				src.dartscd=0
		YoYo()
			//if(src.ressurection)
			if(src.safe||src.fireback)
				return
			if(src.rei <= 500)
				src << "<b>Your rei is too low!"
				return
			if(src.firing == 0)
				src<<"This skill got taken out"
		Bushogoma()
			if(src.safe||src.fireback)
				return
//			if(!src.ressurection&&!src.inshikai&&!src.inbankai)
//				src << "<b>You must be in shikai!"//ressurection
//				return
			if(src.rei <= 700)
				src << "<b>Your rei is too low!"
				return
			if(!src.bushogomacd)
				src.bushogomacd = 1
				src.rei -= 700
				var/obj/tornado/A = new /obj/tornado(src.loc)
				A.Gowner=src
				walk(A,src.dir,0)
				sleep(100)
				src.bushogomacd=0
		Bushogoma2()
			if(src.safe||src.fireback)
				return
//			if(!src.ressurection&&!src.inshikai&&!src.inbankai)
//				src << "<b>You must be in shikai!"//ressurection
//				return
			if(src.rei <= 300)
				src << "<b>Your rei is too low!"
				return
			if(!src.bushogomacd)
				src.bushogomacd = 1
				src.rei -= 700
				var/obj/tornado/A = new /obj/wtornado(src.loc)
				A.Gowner=src
				walk(A,src.dir,0)
				sleep(50)
				src.bushogomacd=0
		Pivotal_Scene()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 1500)
				src << "<b>Your reiatsu is too low [src.rei]/1500!"
				return
			if(!src.inbankai)
				src << "You need to be in bankai"
				return
			if(src.stype!="Byakuya")
				src << "You must have Byakuya's zanpaktou"
				return
			if(!src.etarget)
				src << "You need a target"
				return
			var/mob/m=src.etarget
			if(!src.pivotalscenecd)
				src.pivotalscenecd = 1
				src.rei -= 1500
				var/obj/A = new/obj/pivotal/k5(m.loc)
				var/obj/a1=new/obj/pivotal/k1(locate(m.x-1,m.y-1,m.z))
				var/obj/a2=new/obj/pivotal/k2(locate(m.x,m.y-1,m.z))
				var/obj/a3=new/obj/pivotal/k3(locate(m.x+1,m.y-1,m.z))
				var/obj/a4=new/obj/pivotal/k4(locate(m.x-1,m.y,m.z))
				var/obj/a6=new/obj/pivotal/k6(locate(m.x+1,m.y,m.z))
				var/obj/a7=new/obj/pivotal/k7(locate(m.x-1,m.y+1,m.z))
				var/obj/a8=new/obj/pivotal/k8(locate(m.x,m.y+1,m.z))
				var/obj/a9=new/obj/pivotal/k9(locate(m.x+1,m.y+1,m.z))
				a1.Gowner=src
				a2.Gowner=src
				a3.Gowner=src
				a4.Gowner=src
				a6.Gowner=src
				a7.Gowner=src
				a8.Gowner=src
				a9.Gowner=src
				A.Gowner=src
				A.owner=src
				src.petalsfired=1
				spawn(16)
					src.petalsfired=0
					for(var/obj/dk in view(12,src))
						if(dk.Gowner==src)
							del dk
				spawn(70)
				src.pivotalscenecd=0
		WeakDesgarron()
	//		if(!src.ressurection)
	//			src << "<b>You must be in ressurection!"
	//			return
			if(src.safe||src.fireback)
				return
			if(src.rei <= 500)
				src << "<b>Your rei is too low [src.rei]/500!"
				return
			if(src.wdesd)
				src << "<b>You must wait atleast 20seconds!"
				return
			if(!src.wdesd)
				if(src.dir == SOUTHEAST||src.dir == NORTHEAST||src.dir == SOUTHWEST||src.dir == NORTHWEST)
					return
				src.wdesd=1
				src.rei -= 2000
				if(src.dir == SOUTH)
					var/obj/desgarron/A = new /obj/desgarron/
					var/obj/desgarron/B = new /obj/desgarron/
					var/obj/desgarron/C = new /obj/desgarron/
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
				if(src.dir == NORTH)
					var/obj/desgarron/A = new /obj/desgarron/
					var/obj/desgarron/B = new /obj/desgarron/
					var/obj/desgarron/C = new /obj/desgarron/
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
				if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST||src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
					var/obj/desgarron/A = new /obj/desgarron/
					var/obj/desgarron/B = new /obj/desgarron/
					var/obj/desgarron/C = new /obj/desgarron/
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
				spawn(200)
				src.wdesd=0
		Desgarron()
	//		if(!src.ressurection)
	//			src << "<b>You must be in ressurection!"
	//			return
			if(src.safe||src.fireback)
				return
			if(src.rei <= 2000)
				src << "<b>Your rei is too low [src.rei]/2000!"
				return
			if(src.desd)
				src << "<b>You must wait at least 35 seconds!"
				return
			if(!src.desd)
				if(src.dir == SOUTHEAST||src.dir == NORTHEAST||src.dir == SOUTHWEST||src.dir == NORTHWEST)
					return
				src.desd=1
				src.rei -= 2000
				if(src.dir == SOUTH)
					var/obj/desgarron/A = new /obj/desgarron/
					var/obj/desgarron/B = new /obj/desgarron/
					var/obj/desgarron/C = new /obj/desgarron/
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
					var/obj/desgarron/Aa = new /obj/desgarron/
					var/obj/desgarron/Ca = new /obj/desgarron/
					Aa.loc = locate(src.x-2, src.y, src.z)
					Ca.loc = locate(src.x+2, src.y, src.z)
					Aa.dir = src.dir
					Ca.dir = src.dir
					Aa.Gowner = src
					Ca.Gowner = src
					walk(Aa,SOUTH)
					walk(Ca,SOUTH)
				if(src.dir == NORTH)
					var/obj/desgarron/A = new /obj/desgarron/
					var/obj/desgarron/B = new /obj/desgarron/
					var/obj/desgarron/C = new /obj/desgarron/
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
					var/obj/desgarron/Aa = new /obj/desgarron/
					var/obj/desgarron/Ca = new /obj/desgarron/
					Aa.loc = locate(src.x-2, src.y, src.z)
					Ca.loc = locate(src.x+2, src.y, src.z)
					Aa.dir = src.dir
					Ca.dir = src.dir
					Aa.Gowner = src
					Ca.Gowner = src
					walk(Aa,NORTH)
					walk(Ca,NORTH)
				if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST||src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
					var/obj/desgarron/A = new /obj/desgarron/
					var/obj/desgarron/B = new /obj/desgarron/
					var/obj/desgarron/C = new /obj/desgarron/
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
					var/obj/desgarron/Aa = new /obj/desgarron/
					var/obj/desgarron/Ca = new /obj/desgarron/
					Aa.loc = locate(src.x, src.y+2, src.z)
					Ca.loc = locate(src.x, src.y-2, src.z)
					Aa.dir = src.dir
					Ca.dir = src.dir
					Aa.Gowner = src
					Ca.Gowner = src
					walk(Aa,src.dir)
					walk(Ca,src.dir)
				if(src.hollowtype!=3)
					spawn(230)
					src.desd=0
				else if(src.hollowtype==3)
					spawn(120)
					src.desd=0
/*		Cero_Obscura()
			//if(src.ressurection)
			if(src.safe||src.fireback)
				return
			if(src.rei <= 1000)
				src << "<b>Your rei is too low!"
				return
			if(src.firing == 0)
				src.frozen=1
				src.firing = 1
				src.overlays+=/obj/oscuracharge
				sleep(10)
				src.frozen=0
				src.overlays-=/obj/oscuracharge
				src.rei -= 1000
				if(src.dir == SOUTHEAST||src.dir == NORTHEAST||src.dir == SOUTHWEST||src.dir == NORTHWEST)
					src.rei +=1000
					src.firing=0
					return
				if(src.dir == SOUTH)
					var/obj/ceroobscura/A = new /obj/ceroobscura/
					A.loc = locate(src.x, src.y-1, src.z)
					A.dir = src.dir
					A.Gowner = src
				if(src.dir == NORTH)
					var/obj/ceroobscura/A = new /obj/ceroobscura/
					A.loc = locate(src.x, src.y+1, src.z)
					A.dir = src.dir
					A.Gowner = src
				if(src.dir == EAST)
					var/obj/ceroobscura/A = new /obj/ceroobscura/
					A.loc = locate(src.x+1, src.y, src.z)
					A.dir = src.dir
					A.Gowner = src
				if(src.dir == WEST)
					var/obj/ceroobscura/A = new /obj/ceroobscura/
					A.loc = locate(src.x-1, src.y, src.z)
					A.dir = src.dir
					A.Gowner = src
				spawn(100)
				src.firing=0*/
		Wave()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 1000)
				src << "<b>Your rei is too low!"
				return
			if(!src.wavecd)
				src.wavecd = 1
				src.rei -= 1000
				if(src.dir == SOUTH||src.dir == NORTH)
					var/obj/cascada/A = new /obj/newkaeinwave/
					var/obj/cascada/B = new /obj/newkaeinwave/
					var/obj/cascada/C = new /obj/newkaeinwave/
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
					var/obj/cascada/Ca = new /obj/newkaeinwave/
					var/obj/cascada/Ba = new /obj/newkaeinwave/
					Ca.loc = locate(src.x+2, src.y, src.z)
					Ba.loc = locate(src.x-2, src.y, src.z)
					Ba.dir = src.dir
					Ca.dir = src.dir
					Ba.Gowner = src
					Ca.Gowner = src
					walk(Ca,src.dir)
					walk(Ba,src.dir)
					var/obj/cascada/Caa = new /obj/newkaeinwave/
					var/obj/cascada/Baa = new /obj/newkaeinwave/
					Caa.loc = locate(src.x+3, src.y, src.z)
					Baa.loc = locate(src.x-3, src.y, src.z)
					Baa.dir = src.dir
					Caa.dir = src.dir
					Baa.Gowner = src
					Caa.Gowner = src
					walk(Caa,src.dir)
					walk(Baa,src.dir)
					var/obj/cascada/Caaa = new /obj/newkaeinwave/
					var/obj/cascada/Baaa = new /obj/newkaeinwave/
					Caaa.loc = locate(usr.x+4, usr.y, usr.z)
					Baaa.loc = locate(usr.x-4, usr.y, usr.z)
					Baaa.dir = usr.dir
					Caaa.dir = usr.dir
					Baaa.Gowner = usr
					Caaa.Gowner = usr
					walk(Caaa,usr.dir)
					walk(Baaa,usr.dir)
					var/obj/cascada/Caaaa = new /obj/newkaeinwave/
					var/obj/cascada/Baaaa = new /obj/newkaeinwave/
					Caaaa.loc = locate(usr.x+5, usr.y, usr.z)
					Baaaa.loc = locate(usr.x-5, usr.y, usr.z)
					Baaaa.dir = usr.dir
					Caaaa.dir = usr.dir
					Baaaa.Gowner = usr
					Caaaa.Gowner = usr
					walk(Caaaa,usr.dir)
					walk(Baaaa,usr.dir)
				if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST||src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
					var/obj/cascada/A = new /obj/newkaeinwave/
					var/obj/cascada/B = new /obj/newkaeinwave/
					var/obj/cascada/C = new /obj/newkaeinwave/
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
					var/obj/cascada/Ca = new /obj/newkaeinwave/
					var/obj/cascada/Ba = new /obj/newkaeinwave/
					Ca.loc = locate(src.x, src.y+2, src.z)
					Ba.loc = locate(src.x, src.y-2, src.z)
					Ba.dir = src.dir
					Ca.dir = src.dir
					Ba.Gowner = src
					Ca.Gowner = src
					walk(Ca,src.dir)
					walk(Ba,src.dir)
					var/obj/cascada/Caa = new /obj/newkaeinwave/
					var/obj/cascada/Baa = new /obj/newkaeinwave/
					Caa.loc = locate(src.x, src.y+3, src.z)
					Baa.loc = locate(src.x, src.y-3, src.z)
					Baa.dir = src.dir
					Caa.dir = src.dir
					Baa.Gowner = src
					Caa.Gowner = src
					walk(Caa,src.dir)
					walk(Baa,src.dir)
					var/obj/cascada/Caaa = new /obj/newkaeinwave/
					var/obj/cascada/Baaa = new /obj/newkaeinwave/
					Caaa.loc = locate(usr.x, usr.y+4, usr.z)
					Baaa.loc = locate(usr.x, usr.y-4, usr.z)
					Baaa.dir = usr.dir
					Caaa.dir = usr.dir
					Baaa.Gowner = usr
					Caaa.Gowner = usr
					walk(Caaa,usr.dir)
					walk(Baaa,usr.dir)
					var/obj/cascada/Caaaa = new /obj/newkaeinwave/
					var/obj/cascada/Baaaa = new /obj/newkaeinwave/
					Caaaa.loc = locate(usr.x, usr.y+5, usr.z)
					Baaaa.loc = locate(usr.x, usr.y-5, usr.z)
					Baaaa.dir = usr.dir
					Caaaa.dir = usr.dir
					Baaaa.Gowner = usr
					Caaaa.Gowner = usr
					walk(Caaaa,usr.dir)
					walk(Baaaa,usr.dir)
				sleep(110)
				src.wavecd = 0
		Cascada()
			if(!src.ressurection)
				src<<"You must be in ressurection"
				return
			if(src.safe||src.fireback)
				return
			if(src.rei <= 1000)
				src << "<b>Your rei is too low!"
				return
			if(!src.cascadacd)
				src.cascadacd = 1
				src.rei -= 1000
				if(src.dir == SOUTH||src.dir == NORTH)
					var/obj/cascada/A = new /obj/cascada/
					var/obj/cascada/B = new /obj/cascada/
					var/obj/cascada/C = new /obj/cascada/
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
					var/obj/cascada/Ca = new /obj/cascada/
					var/obj/cascada/Ba = new /obj/cascada/
					Ca.loc = locate(src.x+2, src.y, src.z)
					Ba.loc = locate(src.x-2, src.y, src.z)
					Ba.dir = src.dir
					Ca.dir = src.dir
					Ba.Gowner = src
					Ca.Gowner = src
					walk(Ca,src.dir)
					walk(Ba,src.dir)
					var/obj/cascada/Caa = new /obj/cascada/
					var/obj/cascada/Baa = new /obj/cascada/
					Caa.loc = locate(src.x+3, src.y, src.z)
					Baa.loc = locate(src.x-3, src.y, src.z)
					Baa.dir = src.dir
					Caa.dir = src.dir
					Baa.Gowner = src
					Caa.Gowner = src
					walk(Caa,src.dir)
					walk(Baa,src.dir)
					var/obj/cascada/Caaa = new /obj/cascada/
					var/obj/cascada/Baaa = new /obj/cascada/
					Caaa.loc = locate(usr.x+4, usr.y, usr.z)
					Baaa.loc = locate(usr.x-4, usr.y, usr.z)
					Baaa.dir = usr.dir
					Caaa.dir = usr.dir
					Baaa.Gowner = usr
					Caaa.Gowner = usr
					walk(Caaa,usr.dir)
					walk(Baaa,usr.dir)
					var/obj/cascada/Caaaa = new /obj/cascada/
					var/obj/cascada/Baaaa = new /obj/cascada/
					Caaaa.loc = locate(usr.x+5, usr.y, usr.z)
					Baaaa.loc = locate(usr.x-5, usr.y, usr.z)
					Baaaa.dir = usr.dir
					Caaaa.dir = usr.dir
					Baaaa.Gowner = usr
					Caaaa.Gowner = usr
					walk(Caaaa,usr.dir)
					walk(Baaaa,usr.dir)
				if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST||src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
					var/obj/cascada/A = new /obj/cascada/
					var/obj/cascada/B = new /obj/cascada/
					var/obj/cascada/C = new /obj/cascada/
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
					var/obj/cascada/Ca = new /obj/cascada/
					var/obj/cascada/Ba = new /obj/cascada/
					Ca.loc = locate(src.x, src.y+2, src.z)
					Ba.loc = locate(src.x, src.y-2, src.z)
					Ba.dir = src.dir
					Ca.dir = src.dir
					Ba.Gowner = src
					Ca.Gowner = src
					walk(Ca,src.dir)
					walk(Ba,src.dir)
					var/obj/cascada/Caa = new /obj/cascada/
					var/obj/cascada/Baa = new /obj/cascada/
					Caa.loc = locate(src.x, src.y+3, src.z)
					Baa.loc = locate(src.x, src.y-3, src.z)
					Baa.dir = src.dir
					Caa.dir = src.dir
					Baa.Gowner = src
					Caa.Gowner = src
					walk(Caa,src.dir)
					walk(Baa,src.dir)
					var/obj/cascada/Caaa = new /obj/cascada/
					var/obj/cascada/Baaa = new /obj/cascada/
					Caaa.loc = locate(usr.x, usr.y+4, usr.z)
					Baaa.loc = locate(usr.x, usr.y-4, usr.z)
					Baaa.dir = usr.dir
					Caaa.dir = usr.dir
					Baaa.Gowner = usr
					Caaa.Gowner = usr
					walk(Caaa,usr.dir)
					walk(Baaa,usr.dir)
					var/obj/cascada/Caaaa = new /obj/cascada/
					var/obj/cascada/Baaaa = new /obj/cascada/
					Caaaa.loc = locate(usr.x, usr.y+5, usr.z)
					Baaaa.loc = locate(usr.x, usr.y-5, usr.z)
					Baaaa.dir = usr.dir
					Caaaa.dir = usr.dir
					Baaaa.Gowner = usr
					Caaaa.Gowner = usr
					walk(Caaaa,usr.dir)
					walk(Baaaa,usr.dir)
				sleep(110)
				src.cascadacd = 0
		Sovereign_Wave()
			//if(src.ressurection)
			if(src.safe||src.fireback)
				return
			if(!src.ressurection)
				src << "<b>You must be in ressurection!"
				return
			if(src.controlbug)
				src<<"<b>Your already controlling something"
				return
			if(src.rei <= 1000)
				src << "<b>Your rei is too low!"
				return
			if(!src.sovereignwavecd)
				src.sovereignwavecd = 1
				src.rei -= 1000
				if(src.dir == SOUTH)
					var/obj/sovereign/A = new /obj/sovereign/
					var/obj/sovereign/B = new /obj/sovereign/
					var/obj/sovereign/C = new /obj/sovereign/
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
					var/obj/sovereign/Ca = new /obj/sovereign/
					var/obj/sovereign/Ba = new /obj/sovereign/
					Ca.loc = locate(src.x+2, src.y, src.z)
					Ba.loc = locate(src.x-2, src.y, src.z)
					Ba.dir = src.dir
					Ca.dir = src.dir
					Ba.Gowner = src
					Ca.Gowner = src
					walk(Ca,SOUTH)
					walk(Ba,SOUTH)
				if(src.dir == NORTH)
					var/obj/sovereign/Aa = new /obj/sovereign/
					var/obj/sovereign/Ba = new /obj/sovereign/
					var/obj/sovereign/Ca = new /obj/sovereign/
					Aa.loc = locate(src.x, src.y, src.z)
					Ca.loc = locate(src.x-1, src.y, src.z)
					Ba.loc = locate(src.x+1, src.y, src.z)
					Aa.dir = src.dir
					Ba.dir = src.dir
					Ca.dir = src.dir
					Aa.Gowner = src
					Ba.Gowner = src
					Ca.Gowner = src
					walk(Aa,NORTH)
					walk(Ca,NORTH)
					walk(Ba,NORTH)
					var/obj/sovereign/Caa = new /obj/sovereign/
					var/obj/sovereign/Baa = new /obj/sovereign/
					Caa.loc = locate(src.x+2, src.y, src.z)
					Baa.loc = locate(src.x-2, src.y, src.z)
					Baa.dir = src.dir
					Caa.dir = src.dir
					Baa.Gowner = src
					Caa.Gowner = src
					walk(Caa,NORTH)
					walk(Baa,NORTH)
				if(src.dir == WEST||src.dir == NORTHWEST||src.dir == SOUTHWEST||src.dir == EAST||src.dir == NORTHEAST||src.dir == SOUTHEAST)
					var/obj/sovereign/A = new /obj/sovereign/
					var/obj/sovereign/B = new /obj/sovereign/
					var/obj/sovereign/C = new /obj/sovereign/
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
					var/obj/sovereign/Caa = new /obj/sovereign/
					var/obj/sovereign/Baa = new /obj/sovereign/
					Caa.loc = locate(src.x, src.y+2, src.z)
					Baa.loc = locate(src.x, src.y-2, src.z)
					Baa.dir = src.dir
					Caa.dir = src.dir
					Baa.Gowner = src
					Caa.Gowner = src
					walk(Caa,src.dir)
					walk(Baa,src.dir)
			sleep(230)
			src.sovereignwavecd = 0


adjlobo
mob
	proc
		AdjWolf()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 500)
				src << "<b>Your reiatsu is too low [src.rei]/500!"
				return
			if(src.adjcerowolfcd)
				return
			if(!src.adjcerowolfcd)
				src.adjcerowolfcd = 1
				src.rei -= 1000
				var/obj/K = new/obj/adjlobo(src.loc)
				K:Gowner = src
				if(src.etarget)
					walk_to(K,etarget,0,2)
				else
					walk(K,src.dir,2)
				sleep(60)
				src.adjcerowolfcd = 0
		Fire_Blue_Ball()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 1000)
				src << "<b>Your reiatsu is too low [src.rei]/1000!"
				return
			if(src.blueballcd)
				src << "<b>Your Blast is on cooldown!"
				return
			if(!src.blueballcd)
				src.blueballcd = 1
				src.rei -= 1000
				var/obj/K = new/obj/BlueFireBlast(src.loc)
				K.icon='Icons/Blue Fire Blast.dmi'
				K:Gowner = src
				if(src.etarget)
					walk_to(K,etarget,0,2)
				else
					walk(K,src.dir,2)
				sleep(30)
				src.blueballcd = 0
		CeroWolf()
			if(src.safe||src.fireback)
				return
			if(!src.ressurection)
				src << "<b>You must be in ressurection!"
				return
			if(src.rei <= 1000)
				src << "<b>Your reiatsu is too low [src.rei]/1000!"
				return
			if(!src.cerowolfcd)
				src.cerowolfcd = 1
				src.rei -= 1000
				var/obj/K = new/obj/wolf(src.loc)
				if(src.cerocolor=="Red")K.icon='Icons/wolfred.dmi'
				if(src.cerocolor=="Blue")K.icon='Icons/wolfblue.dmi'
				if(src.cerocolor=="Green")K.icon='Icons/wolfgreen.dmi'
				if(src.cerocolor=="Yellow")K.icon='Icons/wolfyellow.dmi'
				K:Gowner = src
				if(src.etarget)
					walk_to(K,etarget,0,2)
				else
					walk(K,src.dir,2)
				if(src.adjhollowtype==1)
					sleep(90)
					src.cerowolfcd=0
				else if(src.adjhollowtype!=1)
					sleep(150)
					src.cerowolfcd = 0
		Cero_Pack()
			if(src.safe||src.fireback)
				return
			if(!src.ressurection)
				src << "<b>You must be in ressurection!"
				return
			if(src.rei <= 1500)
				src << "<b>Your reiatsu is too low [src.rei]/1500!"
				return
			if(!src.ceropackcd)
				src.ceropackcd = 1
				src.rei -= 1500
				var/obj/K = new/obj/weakwolf
				K:Gowner = src
				var/obj/Ka = new/obj/weakwolf
				Ka:Gowner = src
				var/obj/Ks = new/obj/weakwolf
				Ks:Gowner = src
				var/obj/Kd = new/obj/weakwolf
				Kd:Gowner = src
				var/obj/Kzz = new/obj/weakwolf
				Kzz:Gowner = src
				var/obj/Kz = new/obj/weakwolf
				Kz:Gowner = src
				if(src.cerocolor=="Red")K.icon='Icons/wolfred.dmi'
				if(src.cerocolor=="Blue")K.icon='Icons/wolfblue.dmi'
				if(src.cerocolor=="Red")Ka.icon='Icons/wolfred.dmi'
				if(src.cerocolor=="Blue")Ka.icon='Icons/wolfblue.dmi'
				if(src.cerocolor=="Red")Ks.icon='Icons/wolfred.dmi'
				if(src.cerocolor=="Blue")Ks.icon='Icons/wolfblue.dmi'
				if(src.cerocolor=="Red")Kd.icon='Icons/wolfred.dmi'
				if(src.cerocolor=="Blue")Kd.icon='Icons/wolfblue.dmi'
				if(src.cerocolor=="Green")K.icon='Icons/wolfgreen.dmi'
				if(src.cerocolor=="Yellow")K.icon='Icons/wolfyellow.dmi'
				if(src.cerocolor=="Green")Ka.icon='Icons/wolfgreen.dmi'
				if(src.cerocolor=="Yellow")Ka.icon='Icons/wolfyellow.dmi'
				if(src.cerocolor=="Green")Ks.icon='Icons/wolfgreen.dmi'
				if(src.cerocolor=="Yellow")Ks.icon='Icons/wolfyellow.dmi'
				if(src.cerocolor=="Green")Kd.icon='Icons/wolfgreen.dmi'
				if(src.cerocolor=="Yellow")Kd.icon='Icons/wolfyellow.dmi'
				if(src.dir==NORTH||src.dir==SOUTH)
					K.loc=locate(src.x-2,src.y,src.z)
					Ka.loc=locate(src.x-1,src.y,src.z)
					Ks.loc=locate(src.x+1,src.y,src.z)
					Kd.loc=locate(src.x+2,src.y,src.z)
					Kzz.loc=locate(src.x-3,src.y,src.z)
					Kz.loc=locate(src.x+3,src.y,src.z)
				if(src.dir==WEST||src.dir==SOUTHWEST||src.dir==NORTHWEST||src.dir==EAST||src.dir==SOUTHEAST||src.dir==NORTHEAST)
					K.loc=locate(src.x,src.y-2,src.z)
					Ka.loc=locate(src.x,src.y-1,src.z)
					Ks.loc=locate(src.x,src.y+1,src.z)
					Kd.loc=locate(src.x,src.y+2,src.z)
					Kzz.loc=locate(src.x-3,src.y,src.z)
					Kz.loc=locate(src.x+3,src.y,src.z)
				walk(K,src.dir,2)
				walk(Ka,src.dir,2)
				walk(Ks,src.dir,2)
				walk(Kd,src.dir,2)
				walk(Kzz,src.dir,2)
				walk(Kz,src.dir,2)
				if(src.adjhollowtype!=1)
					sleep(250)
					src.ceropackcd = 0
				if(src.adjhollowtype==1)
					sleep(150)
					src.ceropackcd=0
		Pills()
			if(src.safe||src.fireback)
				return
			if(src.rei <=200)
				src << "<b>Your rei is too low!"
				return
			if(!src.ressurection)
				src << "<b>You must be in ressurection!"
				return
			if(!src.pillscd)
				src.rei-=200
				for(var/mob/G in oview(2,src))
					Blood(G.x,G.y,G.z)
					var/k=rand(1,4)
					if(k==1)
						view(src,8) << "<font color = red>[src] hit [G] in the core!"
						G.BrokenCore()
						G.Death(src,src.reiatsu*2,rand(1,3))
					if(k==2)
						view(src,8) << "<font color = red>[src] hit [G] in the arm!"
						G.BrokenArm()
						G.Death(src,src.reiatsu*1.5,rand(1,3))
					if(k==3)
						view(src,8) << "<font color = red>[src] hit [G] in the leg!"
						G.BrokenLeg()
						G.Death(src,src.reiatsu*1.5,rand(1,3))
					if(k==4)
						view(src,8) << "<font color = red>[src] hit [G] in the head!"
						G.BrokenHead()
						G.Death(src,src.reiatsu*3,rand(1,3))
				src.pillscd=1
				sleep(20)
				src.pillscd=0
		HeatBlast()
			if(src.rei < 200)
				src << "<b>Your rei is too low!"
				return
			if(src.safe||src.fireback)
				return
			if(!src.aquacd)
				src.aquacd = 1
				src.rei -= 200
				var/obj/K = new/obj/KidoZag(src.loc)
				K:Gowner = src
				K:dir = src.dir
				walk(K,src.dir)
				sleep(12)
				src.aquacd = 0

mob
	proc
		Bala()
			if(src.race=="Arrancar"||src.race=="Yammy Boss"||src.hasressfuse)
				if(src.rei < 200)
					src << "<b>Your rei is too low!"
					return
				if(src.safe||src.fireback)
					return
				if(!src.balacd)
					src.balacd = 1
					src.rei -= 200
					var/obj/K = new/obj/Bala(src.loc)
					K:Gowner = src
					if(src.cerocolor=="Red")K.icon='Icons/Balared.dmi'
					if(src.cerocolor=="Blue")K.icon='Icons/Balablue.dmi'
					if(src.cerocolor=="Green")K.icon='Icons/Balagreen.dmi'
					if(src.cerocolor=="Yellow")K.icon='Icons/Balayellow.dmi'
					K:dir = src.dir
					walk(K,src.dir)
					sleep(8)
					src.balacd = 0
mob/proc/SingleTileGetsuga()
	if(src.rei < 1000)
		src << "<b>Your rei is too low!"
		return
	if(src.safe||src.fireback)
		return
	if(!src.singlegetsugacd)
		flick("Sword Slash1",src)
		src.singlegetsugacd = 1
		src.rei -= 1000
		var/obj/K = new/obj/SingleNewGetsuga(src.loc)
		K:Gowner = src
		K:dir = src.dir
		walk(K,src.dir)
		sleep(22)
		src.singlegetsugacd = 0

mob/proc/Hakuteiken()
	if(src.wings == 0)
		//src.overlays += 'hakuteiken.dmi'
		src.overlays += /obj/HWing/w1
		src.overlays += /obj/HWing/w2
		src.overlays += /obj/HWing/w3
		src.protected=1
		src.attack += src.attack*1.7
		src.reiatsu += src.reiatsu*1.7
		src.health = src.mhealth/2
		src.wings = 1
		oview() << "<b>[src]:.....Hakuteiken!</b>"
		spawn(300)
			src.attack = src.mattack
			src.reiatsu = src.mreiatsu
			src.health=1
			src.protected=0
			src.overlays -= /obj/HWing/w1
			src.overlays -= /obj/HWing/w2
			src.overlays -= /obj/HWing/w3
			src.inbankai=0
			spawn(1200)
				src.wings = 0


mob/proc/HakuteikenCustom()
	if(src.wings == 0)
		//src.overlays += 'hakuteiken.dmi'
		src.overlays += /obj/HWing2/w1
		src.overlays += /obj/HWing2/w2
		src.overlays += /obj/HWing2/w3
	//	src.protected=1
		src.attack += src.attack*3.7
		src.reiatsu += src.reiatsu*3.7
		src.health = src.mhealth/2
		src.wings = 2
		oview() << "<b>[src]:.....Hakuteiken!</b>"

	else if(src.wings==2)
		src.attack = src.mattack
		src.reiatsu = src.mreiatsu
		src.overlays -= /obj/HWing2/w1
		src.overlays -= /obj/HWing2/w2
		src.overlays -= /obj/HWing2/w3
		src.wings = 0

mob
	proc
		HollowRage()
			if(src.race != "Hollow")
				src << "You should not have this skill...you are not hollow..removing"
				usr.contents-=new/obj/skillcard/HollowRage
				return
			if(src.safe||src.fireback)
				return
			if(src.rei<1000)
				src<<"You need more rei [src.rei]/1000"
				return
			if(src.HollowRageCD == 1)
				usr << "<b><font color = yellow>Wait the delay!"
				return
			if(src.HollowRageCD == 0)
				src.rei-=1000
				view(src) << "<b><font color=yellow>[src.name]: ARGHHHHHHHHHHHHHHHH!"
				src.HollowRageCD=1
				src.overlays += /obj/auramess/a1
				src.overlays += /obj/auramess/a2
				src.overlays += /obj/auramess/a3
				src.overlays+= /obj/auramess/a4
				src.attack = src.mattack * 2
				src.defence = src.mdefence * 2
				src.reiatsu = src.mreiatsu *2
				sleep(600)
				src.overlays -= /obj/auramess/a1
				src.overlays -= /obj/auramess/a2
				src.overlays -= /obj/auramess/a3
				src.overlays -= /obj/auramess/a4
				src.attack = src.mattack *1
				src.defence = src.mdefence *1
				src.reiatsu = src.mreiatsu *1
				view(src) << "<b><font color=yellow>[src.name]: Has calmed down"
				sleep(50)
				src.HollowRageCD =0
			return
//--------------------------------------lightning leut



mob
	var
		tmp/inVandBoost=0
	proc
		VandBoost()
			if(src.inVandBoost)
				src.inVandBoost=0
				src.attack=src.mattack
				src.reiatsu=src.mreiatsu
				src << "<b>You take off your boost!"
				src.Load_Overlays()
			//	src.overlays-=/obj/Vandauranew
			else
				src.inVandBoost=1
				src.attack += src.mattack * 3
				src.reiatsu += src.mreiatsu * 2.5
				if(src.issternr)
					src.reiatsu+=(src.mreiatsu/10)
				if(src.issternrleader)
					src.reiatsu+=(src.mreiatsu/6)
				if(src.key == "None|WSHGC"||src.key == "None|Devilminions528"||src.key=="None|WorldStar")
					src.attack += src.mattack * 8
					src.reiatsu += src.mreiatsu * 8
					src.defence += src.mdefence * 8
				src << "<b>You put on your boost!"
				src.Load_Overlays()
			//	src.overlays+=/obj/Vandauranew

/*mob
	var
		tmp/pow=0
	proc
		TakePower()
				for(var/mob/player/M in All_Clients())
					if(M.race=="Quincy")
						rei=M.mreiatsu-M.donorstat*150
						src.reiatsu += pow
						src << "You've absorbed the Collective power of your Subjects!"


					else
						if(src.pow==1)
							src << "You can't Take Any More power!" */ // old take power

mob
	var
		tpow=0
		gpow=0
		tmp/haspower=0
	proc
		TakePower()
			if(!tpow)
				if(gpow) return;
				for(var/mob/player/M in All_Clients())
					if(M.race=="Quincy")
						tpow+=(M.reiatsu)
				src.reiatsu += (tpow / 5)
				src << "You've absorbed power from the other Quincies!"
			else
				src << "You've given the reiatsu back!"
				src.reiatsu -= (tpow / 5)
				tpow = 0

	proc
		GivePower()
			if(!gpow)
				if(tpow) return;
				gpow = src.mreiatsu
				for(var/mob/player/M in All_Clients())
					if(M.race=="Quincy")
						M.reiatsu += gpow
						M.haspower=gpow
				world << "<b><font color = lightblue>World News: [src] Has Gifted Their Fellow Quincy some of their Power!"
			else
				src << "Your Power Returns to you!"
				src.reiatsu=src.mreiatsu
				for(var/mob/player/M in All_Clients())
					if(M.race=="Quincy"&&M.haspower)
						M.reiatsu -= M.haspower
						M.haspower=0
				gpow = 0
				world << "<b><font color = lightblue>World News: [src] Has Reclaimed their Power!"

/*	proc    // this is the backup/ original attempt haha
		GivePower()
			if(!pow)
				for(var/mob/player/M in All_Clients())
					if(M.race=="Quincy")
						pow= src.reiatsu-=src.donorstat*150
					M.reiatsu += (pow/10)
				world << "<b><font color = red>World News: [usr] Has Gifted Their Fellow Quincy some of their Power!"
			else
				src << "Your Power Returns to you!"
				for(var/mob/player/M in All_Clients())
					if(M.race=="Quincy")
						src.reiatsu=src.mreiatsu
						M.reiatsu=M.mreiatsu
						pow = 0 */