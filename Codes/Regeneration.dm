mob
	proc
		regeneration()
			spawn(15)
				if(src.npc)return
				if(noboost)
					src.attack=src.mattack
					src.defence=src.mdefence
					src.reiatsu=src.mreiatsu
				if(!src.canRegenRei)
					if(!src.client&&!src.legit)
						return
				if(src.combatmode>0)
					src.combatmode-=1
				if(src.votecool>0)
					src.votecool-=1
				if(src.petcd>0)
					src.petcd-=1
				if(src.muted>0)
					src.muted-=10
					if(src.muted<=0)
						src.muted=0
						world<<"<b><font size = 1>[src] has been <font color=red>Unmuted."
				if(src.raid)
					if(src.z!=2&&src.z!=4&&src.z!=11&&src.z!=22)
						world<< "<b><font color = lime>[src] has retreated"
						src.raid=0
						spawn()RaidStill()
			//	if(src.gotonhoug)
			//		if(src.wound<50)src.wound=50
				if(src.speedful||src.segunda)
					src.rundelay=1
				if(src.inran||src.shunko||src.tshunko)
					src.frozen=0
					src.rundelay=0
				if(src.fgtcool>0)
					src.fgtcool-=1
				if(src.carnage)
					src.wound+=rand(1,2)
					src.firing=0
				if(src.etarget)
					var/mob/E = src.etarget
					if(E.z!=src.z||E.invisibility>2)
						if(E.pet)
							E.loc=locate(src.x,src.y,src.z)
						src.Untarget()
					var/distance = get_dist(src, E)
					if(distance>10)src.Untarget()
					if(src.sight!=0)src.Untarget()
				//if(src.health>=src.mhealth&&src.rei>=src.mrei&&src.wound&&!src.shunko&&!inbankai2)
				//	spawn()src.regeneration()
				//	return
					if(src.missiontarget==src.etarget&&src.mission==7)
						src.spy+=1
						if(src.spy>=10)
							src.CompleteMish(1,1,world)
				if(src.health<0 && src.wound>=100)
					src.health=1
				if(src.missioncool>0)
					src.missioncool-=1
				if(src.dnotecool>0)
					src.dnotecool-=1
				if(src.explocool>0)
					src.explocool-=1
			//	if(src.traveltime>0)
			//		src.traveltime-=1
				if(src.timed>0)
					src.timed-=1
					if(src.timed==0)
						if(src.mission==9)
							if(src.killedsofar>=5)
								src.CompleteMish(15000,rand(1000,1500),world)
							else
								src.FailMish(world)
						if(src.mission==12)
							if(!src.gothit)
								src.CompleteMish(8000,rand(3000,500),world)
				if(src.health>src.mhealth*1.5)
					src.health=src.mhealth*1.5
				if((health>=0 && wound<=99&&!lacerated||wound>=100 && bloodlust)&&!lacerated&&!carnage)
					if(src.stype=="Unohana")
						if(src.inshikai)
							src.shimastery(1)
						if(src.inbankai)
							src.banmastery(1)
					if(src.rei<src.mrei) //regen mrei
						src.rei+=round(mrei/regenrate,1)
						if(src.squad == "Kido Corps"||src.squad==0||src.karakuraheroplayer==1||src.humanleader==1 || src.newsadoking || src.newhollowking)
							src.rei+=round(mrei/regenrate,1)
						if(src.trans3==1)
							src.rei+=round(mrei/regenrate,1)
						if(src.extravagant)
							src.rei+=round(mrei/regenrate,1)*2
						if(src.wound>70)
							src.rei-=round(mrei/regenrate,1)/2
						if(src.frozen&&src.hibernation)
							src.rei+=round(mrei/(100+regenrate-(src.hibernation*5)),1)
						if(src.vasto&&src.client)
							src.rei+=round((mrei/regenrate)/2,1)
						if(src.shunko||src.regenmode||src.tshunko)
							src.rei+=round(mrei/regenrate,1)*2
						if(src.rei>src.mrei)
							src.rei=src.mrei
					//	if(src.inbankai2)src.rei=999
					if(!src.canRegenRei&&src.health<src.mhealth) //or else heal.
						src.health+=round((mhealth/regenrate)-(mhealth/regenrate * 0.33),1)
						if(src.wound>70)
							src.health-=round(mhealth/regenrate,1)/2
						if(src.squad==4)
							src.health+=round(mhealth/regenrate,1)/2
						if(src.trans3==1)
							src.health+=round(mhealth/regenrate,1)/2
						if(src.frozen&&src.hibernation)
							src.health+=round(mhealth/(100+regenrate-(src.hibernation*5)),1)
						if(src.vasto&&src.client)
							src.health+=round((mhealth/regenrate)/2,1)
						if(src.shunko||src.regenmode||src.tshunko)
							src.health+=round(mhealth/regenrate,1)
							src.health+=round(mhealth/regenrate,1)
						if(src.health>src.mhealth)
							src.health=src.mhealth
					if(src.regenmode)
						if(prob(src.woundregen*15))
							src.wound-=0.75
					if(prob(src.woundregen*4)&&!src.inberserk)
						src.wound-=1
						if(src.race=="Inoue")
							src.wound-=1
						if(src.shunko)
							src.wound+=1
						if(src.tshunko)
							src.wound+=0.25
						if(src.wound<0)
							src.wound=0


				//regenerate mhealth? put stuff like this here. This happens every second.
				spawn()src.regeneration()