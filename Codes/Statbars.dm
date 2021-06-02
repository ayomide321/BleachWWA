mob
	proc//src<<sound(null,0,1,1,35)//do not remove.
		CreateStatBars()
			new/obj/hudMeters/health_01(src.client)
			new/obj/hudMeters/health_02(src.client)
			new/obj/hudMeters/wound/wound_01(src.client)
			new/obj/hudMeters/wound/wound_02(src.client)
			new/obj/hudMeters/exp/exp_01(src.client)
			new/obj/hudMeters/exp/exp_02(src.client)
			new/obj/hudMeters/rei/health_01(src.client)
			new/obj/hudMeters/rei/health_02(src.client)
			src.updateHealth()
			new/obj/help(src.client)
			new/obj/skill_tree(src.client)
			new/obj/updatelog(src.client)
			new/obj/hud/M1(src.client)
			new/obj/NewHud/s1(src.client)
			new/obj/NewHud/s2(src.client)
			new/obj/NewHud/s3(src.client)
			new/obj/NewHud/s4(src.client)
			new/obj/NewHud/a1(src.client)
			new/obj/NewHud/a2(src.client)
			new/obj/NewHud/a3(src.client)
			new/obj/NewHud/a4(src.client)
			if(src.skill0)
				var/obj/hud/s=src.skill0
				for(var/obj/hud/M1/d in client.screen)
					d.overlays = null
					d.overlays += image(icon_state = s.icon_state)
					d.names = s.names
			new/obj/hud/M2(src.client)
			if(src.skillsub)
				var/obj/hud/s=src.skillsub
				for(var/obj/hud/M2/d in client.screen)
					d.overlays = null
					d.overlays += image(icon_state = s.icon_state)
					d.names = s.names
			new/obj/hud/M3(src.client)
			if(src.skillequ)
				var/obj/hud/s=src.skillequ
				for(var/obj/hud/M3/d in client.screen)
					d.overlays = null
					d.overlays += image(icon_state = s.icon_state)
					d.names = s.names
			new/obj/hud/M4(src.client)
			if(src.skill1)
				var/obj/hud/s=src.skill1
				for(var/obj/hud/M4/d in client.screen)
					d.overlays = null
					d.overlays += image(icon_state = s.icon_state)
					d.names = s.names
			new/obj/hud/M5(src.client)
			if(src.skill2)
				var/obj/hud/s=src.skill2
				for(var/obj/hud/M5/d in client.screen)
					d.overlays = null
					d.overlays += image(icon_state = s.icon_state)
					d.names = s.names
			new/obj/hud/M6(src.client)
			if(src.skill3)
				var/obj/hud/s=src.skill3
				for(var/obj/hud/M6/d in client.screen)
					d.overlays = null
					d.overlays += image(icon_state = s.icon_state)
					d.names = s.names
			new/obj/hud/M7(src.client)
			if(src.skill4)
				var/obj/hud/s=src.skill4
				for(var/obj/hud/M7/d in client.screen)
					d.overlays = null
					d.overlays += image(icon_state = s.icon_state)
					d.names = s.names
			new/obj/hud/M8(src.client)
			if(src.skill5)
				var/obj/hud/s=src.skill5
				for(var/obj/hud/M8/d in client.screen)
					d.overlays = null
					d.overlays += image(icon_state = s.icon_state)
					d.names = s.names
			new/obj/hud/M9(src.client)
			if(src.skill6)
				var/obj/hud/s=src.skill6
				for(var/obj/hud/M9/d in client.screen)
					d.overlays = null
					d.overlays += image(icon_state = s.icon_state)
					d.names = s.names
			new/obj/hud/M0(src.client)
			if(src.skill7)
				var/obj/hud/s=src.skill7
				for(var/obj/hud/M0/d in client.screen)
					d.overlays = null
					d.overlays += image(icon_state = s.icon_state)
					d.names = s.names
			new/obj/hud/Msub(src.client)
			if(src.skill8)
				var/obj/hud/s=src.skill8
				for(var/obj/hud/Msub/d in client.screen)
					d.overlays = null
					d.overlays += image(icon_state = s.icon_state)
					d.names = s.names
			new/obj/hud/Mequ(src.client)
			if(src.skill9)
				var/obj/hud/s=src.skill9
				for(var/obj/hud/Mequ/d in client.screen)
					d.overlays = null
					d.overlays += image(icon_state = s.icon_state)
					d.names = s.names
			new/obj/hud/Mq(src.client)
			spawn(3)
			if(src.skillq)
				var/obj/hud/s=src.skillq
				for(var/obj/hud/Mq/d in client.screen)
					d.overlays = null
					d.overlays += image(icon_state = s.icon_state)
					d.names = s.names
			new/obj/hud/Me(src.client)
			spawn(3)
			if(src.skille)
				var/obj/hud/s=src.skille
				for(var/obj/hud/Me/d in client.screen)
					d.overlays = null
					d.overlays += image(icon_state = s.icon_state)
					d.names = s.names
			new/obj/hud/Mo(src.client)
			spawn(3)
			if(src.skillo)
				var/obj/hud/s=src.skillo
				for(var/obj/hud/Mo/d in client.screen)
					d.overlays = null
					d.overlays += image(icon_state = s.icon_state)
					d.names = s.names
			new/obj/hud/Mp(src.client)
			spawn(3)
			if(src.skillp)
				var/obj/hud/s=src.skillp
				for(var/obj/hud/Mp/d in client.screen)
					d.overlays = null
					d.overlays += image(icon_state = s.icon_state)
					d.names = s.names
			new/obj/hud/Mpar(src.client)
			spawn(3)
			if(src.skillpar)
				var/obj/hud/s=src.skillpar
				for(var/obj/hud/Mpar/d in client.screen)
					d.overlays = null
					d.overlays += image(icon_state = s.icon_state)
					d.names = s.names

			new/obj/hud/My(src.client)
			spawn(3)
			if(src.skilly)
				var/obj/hud/s=src.skilly
				for(var/obj/hud/My/d in client.screen)
					d.overlays = null
					d.overlays += image(icon_state = s.icon_state)
					d.names = s.names

		/*	new/obj/hud/Mw(src.client)
			spawn(3)
			if(src.skillw)
				var/obj/hud/s=src.skillw
				for(var/obj/hud/Mw/d in client.screen)
					d.overlays = null
					d.overlays += image(icon_state = s.icon_state)
					d.names = s.names	*/

		updateHealth()
			if(isnull(src.client))
				return
			var/percent=round(src.health/src.mhealth*100,2)
			if(percent>100) percent=100
			if(percent<0) percent=0
			for(var/obj/hudMeters/health_01/o in src.client.screen)
				o.icon_state="[num2text(percent)] 0,0"
			for(var/obj/hudMeters/health_02/o in src.client.screen)
				o.icon_state="[num2text(percent)] 1,0"
			var/percents=round(src.rei/src.mrei*100,2)
			if(percents>100) percents=100
			if(percents<0) percents=0
			for(var/obj/hudMeters/rei/health_01/o in src.client.screen)
				o.icon_state="[num2text(percents)] 0,0"
			for(var/obj/hudMeters/rei/health_02/o in src.client.screen)
				o.icon_state="[num2text(percents)] 1,0"
			var/percentsd=round(src.wound,2)
			if(percentsd>100) percentsd=100
			if(percentsd<0) percentsd=0
			for(var/obj/hudMeters/wound/wound_01/o in src.client.screen)
				o.icon_state="[num2text(percentsd)] 0,0"
			for(var/obj/hudMeters/wound/wound_02/o in src.client.screen)
				o.icon_state="[num2text(percentsd)] 1,0"
			var/percentsda=round(src.exp/src.mexp*100,2)
			if(percentsda>100) percentsda=100
			if(percentsda<0) percentsda=0
			for(var/obj/hudMeters/exp/o in src.client.screen)
				o.icon_state="[num2text(percentsda)] 0,0"
			spawn(20)
				src.updateHealth()



obj
	hudMeters
		health_01
			layer=96
			icon='Icons/HP1.dmi'
			icon_state="0"
			New(client/c)
				screen_loc="2:18,17:-8"
				c.screen+=src
		health_02
			layer=96
			icon='Icons/HP2.dmi'
			icon_state="0"
			New(client/c)
				screen_loc="3:18,17:-8"
				c.screen+=src
		rei
			health_01
				layer=96
				icon='Icons/Rei1.dmi'
				icon_state="0"
				New(client/c)
					screen_loc="2:13,17:-24"
					c.screen+=src
			health_02
				layer=96
				icon='Icons/Rei2.dmi'
				icon_state="0"
				New(client/c)
					screen_loc="3:13,17:-24"
					c.screen+=src
		wound
			wound_01
				layer=96
				icon='Icons/Wnd1.dmi'
				icon_state="0"
				New(client/c)
					screen_loc="2:5,16:-8"
					c.screen+=src
			wound_02
				layer=96
				icon='Icons/Wnd2.dmi'
				icon_state="0"
				New(client/c)
					screen_loc="3:5,16:-8"
					c.screen+=src
		exp
			exp_01
				layer=96
				icon='Icons/Exp.dmi'
				icon_state="0"
				New(client/c)
					screen_loc="1:7,16:-21"
					c.screen+=src
			exp_02
				layer=97
				icon='Icons/New Meter 90.dmi'
				icon_state="0"
				New(client/c)
					screen_loc="13,17"
					c.screen+=src