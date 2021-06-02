skill
	var
		name
mob
	proc

		HasSkill(name)
			for(var/obj/skillcard/skill in src.contents)
				if(skill.name == name)
					return 1
			return 0


		GetSkill(name)
			for(var/skill/skill in Skills)
				if(skill.name == name)
					return skill

mob/proc/Get_Skill_Info(index)
	switch(index)
		if(4)
			var/popup = {"SkillPoint Cost: 100, Reaitsu Cost:10<br>
			<br><p><b>Tousen's ultimate bankai move. You and your opponents get trapped withing a dark balloon and can't see anything. You can see them, but they can't see you. Do you want to buy this for 100 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(5)
			var/popup = {"SkillPoint Cost: 100, Reaitsu Cost:10<br>
			<br><p><b>Yumichika's special attack that comes with his shikai. It can attack anyone within a 1 tile radius. Do you want to buy this for 100 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(6)
			var/popup = {"SkillPoint Cost: 250, Reaitsu Cost:50<br>
			<br><p><b>Byakuya's ultimate bankai move. It traps you and your enemy around your swords while you can control all of them, so you have the advantage. Do you want to buy this for 100 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(7)
			var/popup = {"SkillPoint Cost: 400, Reaitsu Cost:50<br>
			<br><p><b>Binding Spell No.61, Rikujoukourou will shoot a blast and stun anyone that it hits. Do you want to buy this for 400 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(8)
			var/popup = {"SkillPoint Cost: 200, Reaitsu Cost:50<br>
			<br><p><b>Destruction Spell No.4, Byakurai will shoot a long beam with a trail. Do you want to buy this for 200 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(9)
			var/popup = {"SkillPoint Cost: 400, Reaitsu Cost:50<br>
			<br><p><b>Destruction Spell No.4, Power Burst will shoot a long beam with a trail. Do you want to buy this for 400 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(10)
			var/popup = {"SkillPoint Cost: 80, Reaitsu Cost:50<br>
			<br><p><b>Garganta/Senkaimon can transport you through dimensions. Do you want to buy this for 80 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(11)
			var/popup = {"SkillPoint Cost: 200, Reaitsu Cost:50<br>
			<br><p><b>Shoen, Yammamoto's specialty, it fires fireballs from underneath you. Do you want to buy this for 200 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(12)
			var/popup = {"SkillPoint Cost: 200, Reaitsu Cost:150<br>
			<br><p><b>Hado Spell No.1, Thrust pushes someone away from you. Do you want to buy this for 200 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(13)
			var/popup = {"SkillPoint Cost: 400, Reaitsu Cost:1700<br>
			<br><p><b>Destruction Spell No.33! Soukatsui fires a bright blast. Do you want to buy this for 400 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(14)
			var/popup = {"SkillPoint Cost: 400, Reaitsu Cost:3400<br>
			<br><p><b>Tenran sends a wave of wind to enemies. Do you want to buy this for 400 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(15)
			var/popup = {"SkillPoint Cost: 400, Reaitsu Cost:500<br>
			<br><p><b>Cero shoots a beam. Do you want to buy this for 400 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(16)
			var/popup = {"SkillPoint Cost: 1200, Reaitsu Cost:2500<br>
			<br><p><b>Gran Rey Cero shoots a large deadly beam. Do you want to buy this for 1200 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(17)
			var/popup = {"SkillPoint Cost: 200<br>
			<br><p><b>Shunpo. Double-Click somewhere and POOF you instantly move there. Do you want to buy this for 200 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(18)
			var/popup = {"SkillPoint Cost: 800, Reaitsu Cost:500<br>
			<br><p><b>Bala. Quick blasts. Do you want to buy this for 800 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(19)
			var/popup = {"SkillPoint Cost: 400, Reaitsu Cost:none<br>
			<br><p><b>Arm#1. Grants a slight boost in attack and defence. Do you want to buy this for 400 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(20)
			var/popup = {"SkillPoint Cost: 800, Reaitsu Cost:none<br>
			<br><p><b>Arm#2. Grants a good boost in attack and defence. Do you want to buy this for 800 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(21)
			var/popup = {"SkillPoint Cost: none, Reaitsu Cost:none<br>
			<br><p><b>Arm#3. Grants a large boost in attack and defence and more attacks. You learn this by killing Nnoitra in Las Noches(Level 400+)</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(22)
			var/popup = {"SkillPoint Cost: 1500, Reaitsu Cost:2000<br>
			<br><p><b>Lamuerte means death and that's what happens to anyone who gets hit with it. Do you want to buy this for 1000 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(23)
			var/popup = {"SkillPoint Cost: 200, Reaitsu Cost:none<br>
			<br><p><b>This is Shonsui's special move. He creates a shadow, and anyone who steps in it gets trapped. Do you want to buy this for 200 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(24)
			var/popup = {"SkillPoint Cost: 140, Reaitsu Cost:200<br>
			<br><p><b>Fires multiple ceros at once. Do you want to buy this for 140 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(25)
			var/popup = {"SkillPoint Cost: 140, Reaitsu Cost:2000 <br>
			<br><p><b>Creates a wolf with the power of a strong cero and blows up upon contact. Do you want to buy this for 140 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(26)
			var/popup = {"SkillPoint Cost: 100, Reaitsu Cost:150<br>
			<br><p><b>Destruction Spell No.4! Byakurai shoots blue lightning. Do you want to buy this for 100 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(27)
			var/popup = {"SkillPoint Cost: 400, Reaitsu Cost:950 <br>
			<br><p><b>Gritz. Creates five silver rods that strike the opponent and slows them down. Do you want to buy this for 400 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(28)
			var/popup = {"SkillPoint Cost: 400, Reaitsu Cost:1050<br>
			<br><p><b>Volcore. Creates a huge metal ball that shoots at an opponent. Do you want to buy this for 400 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(29)
			var/popup = {"SkillPoint Cost: 1000, Reaitsu Cost:6000<br>
			<br><p><b>Kido 90. Creates a deadly coffin with immense power within it. Do you want to buy this for 200 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(30)
			var/popup = {"SkillPoint Cost: 400, Reaitsu Cost:75% to activate.<br>
			<br><p><b>Ransoutengai. You get your quincy aura and cannot be stunned or slowed down for 1 minute. Do you want to buy this for 400 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(31)
			var/popup = {"SkillPoint Cost: 800, Reaitsu Cost:1000.<br>
			<br><p><b>Sprenger Pentagon. You set up your 5 seele schneiders, then shoot them with your arrows. After you hit all of them press F to blow up anyone within the radius. Do you want to buy this for 800 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(32)
			var/popup = {"SkillPoint Cost: 200, Reaitsu Cost:1800.<br>
			<br><p><b>Poison. You activate this and anyone who is hit by your zanpaktou gets poisoned and starts bleeding and can't regenerate for a temporary time. Do you want to buy this for 400 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(33)
			var/popup = {"SkillPoint Cost: 200, Reaitsu Cost:500<br>
			<br><p><b>Reiatsu Blast, Shoots a reiatsu blast. Do you want to buy this for 200 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(34)
			var/popup = {"SkillPoint Cost: 800, Reaitsu Cost:1000<br>
			<br><p><b>Flash Smash, You will teleport to your target and throw them. Do you want to buy this for 800 skillpoints?NOTE:If your a Shinigami don't get this before you get shikai(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(35)
			var/popup = {"SkillPoint Cost: 2000, Reaitsu Cost:75% rei<br>
			<br><p><b>Shunko, You will gain incredible speed to teleport to enemies with every attack,you're reflexes will be greatly increased, and you will have great regeneration powers at the cost of wounding yourself,. Do you want to buy this for 2000 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(36)
			var/popup = {"SkillPoint Cost: 3200, Reaitsu Cost:25% rei<br>
			<br><p><b>Blood Thirsty, You will gain 20% health before taking damage for 10 seconds,. Do you want to buy this for 3200 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(37)
			var/popup = {"SkillPoint Cost: 400, Reaitsu Cost:varies<br>
			<br><p><b>Zanpaktou Skill, You will gain your secondary zanpaktou/ress skill. Do you want to buy this for 400 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(40)
			var/popup = {"SkillPoint Cost: 1000, Reaitsu Cost:none<br>
			<br><p><b>Reflect, You will be able to reflect projectiles for 15 secs with a 30 sec cooldown. Do you want to buy this for 1000 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(41)
			var/popup = {"SkillPoint Cost: 1500, Reaitsu Cost: 2000<br>
			<br><p><b>Bull Arm, You will be able to deliver 4 very strong blows that will send your enemy flying. Do you want to buy this for 1000 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(42)
			var/popup = {"SkillPoint Cost: 800, Reaitsu Cost:500<br>
			<br><p><b>Relic Shock, You will be able to push someone away from you while dealing reiatsu damage. Do you want to buy this for 800 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(43)
			var/popup = {"SkillPoint Cost: 800, Reaitsu Cost:none<br>
			<br><p><b>Particle Crippler, When you flash step behind someone they will be slowed down. Do you want to buy this for 800 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(44)
			var/popup = {"SkillPoint Cost: 1200, Reaitsu Cost:none<br>
			<br><p><b>Chronicle Explosion, Sacrifices the rest of your health to deal damage to anyone within a 3 tile radius. Do you want to buy this for 1200 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(45)
			var/popup = {"SkillPoint Cost: 1600, Reaitsu Cost:none<br>
			<br><p><b>Carnage, Allows you to regenerate rei 3x faster. Do you want to buy this for 1600 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(46)
			var/popup = {"SkillPoint Cost: 800, Reaitsu Cost:2000<br>
			<br><p><b>Extravagant Emotions, allows you to regenerate rei 3x faster. Do you want to buy this for 800 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(47)
			var/popup = {"SkillPoint Cost: 1600, Reaitsu Cost:none<br>
			<br><p><b>Kamikaze, Allows you to take half damage in return for taking twice as much wounds. Do you want to buy this for 1600 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(48)
			var/popup = {"SkillPoint Cost: 1600, Reaitsu Cost:none<br>
			<br><p><b>Trip, allows you to instantly teleport and trip someone, stunning them for 1.5 secs. Do you want to buy this for 1600 skillpoints?(Skillpoints: [usr.skillpoints])</b>"}// {"<IMG SRC='X.jpg'</IMG>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
		if(49)
			var/popup = {"SkillPoint Cost: 69, Reiatsu Cost: 500<br>
			<br><p><b>Utsusemi, Allows you to instantly teleport to the area you used the skill on when hit. it lasts 15seconds and has a 20second cd after succesfully used. Do you want to buy this for 69 skillpoints? (Skillpoints: [usr.skillpoints])</b>"}
			src<<browse(popup,"window=Announcement,size=300x300,can_close=1,can_resize=1,titlebar=1")
turf/skilltree
	plane=2
	Carnage
		name = "Carnage"
		icon = 'gui.dmi'
		icon_state = "Carnage"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(45)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Fullbringer")
							usr<<"Only Fullbringers can learn this"
							return
						if(!usr.HasSkill("Chronicle Explosion"))
							usr<<"You need Chronicle Explosion first"
							return
						if(usr.HasSkill("Carnage"))
							usr<<"You already have this skill"
							return
						if(usr.skillpoints>=1600)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Carnage."
							usr.skillpoints-=1600
							usr.contents+=new/obj/skillcard/Carnage
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Chronicle_Explosion
		name = "Chronicle Explosion"
		icon = 'gui.dmi'
		icon_state = "Chronicle Explosion"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(44)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Fullbringer")
							usr<<"Only Fullbringers can learn this"
							return
						if(!usr.HasSkill("Particle Crippler"))
							usr<<"You need Particle Crippler first"
							return
						if(usr.HasSkill("Chronicle Explosion"))
							usr<<"You already have this skill"
							return
						if(usr.skillpoints>=1200)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Chronicle Explosion."
							usr.skillpoints-=1200
							usr.contents+=new/obj/skillcard/Chronicle_Explosion
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Particle_Crippler
		name = "Particle Crippler"
		icon = 'gui.dmi'
		icon_state = "Particle Crippler"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(43)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Fullbringer")
							usr<<"Only Fullbringers can learn this"
							return
						if(!usr.HasSkill("Relic Shock"))
							usr<<"You need Relic Shock first"
							return
						if(usr.HasSkill("Particle Crippler"))
							usr<<"You already have this skill"
							return
						if(usr.skillpoints>=800)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Particle Crippler."
							usr.skillpoints-=800
							usr.contents+=new/obj/skillcard/Particle_Crippler
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Relic_Shock
		name = "Relic Shock"
		icon = 'gui.dmi'
		icon_state = "Relic Shock"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(42)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Fullbringer")
							usr<<"Only Fullbringers can learn this"
							return
						if(!usr.HasSkill("Flash Step"))
							usr<<"You need Flash Step first"
							return
						if(usr.HasSkill("Relic Shock"))
							usr<<"You already have this skill"
							return
						if(usr.skillpoints>=800)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Relic Shock."
							usr.skillpoints-=800
							usr.contents+=new/obj/skillcard/Relic_Shock
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Secret_Skill
		name = "Secret Skill"
		icon = 'gui.dmi'
		icon_state = "secret skill"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(37)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Shinigami"&&usr.race!="Vaizard"&&usr.race!="Arrancar")
							usr<<"You need to have a zanpaktou"
							return
						if(usr.race=="Shinigami"&&usr.level<=150)
							usr<<"You need Shikai first"
							return
						if(usr.race=="Arrancar"&&usr.level<350)
							usr<<"You need Ressurection first"
							return
						if(usr.HasSkill("Secret Skill"))
							usr<<"You already have this skill"
							return
						if(usr.skillpoints>=400)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr.skillpoints-=400
							var/obj/skillcard/s=new/obj/skillcard/Secret_Skill
							if(usr.HasSkill("bankai"))
								if(usr.stype=="Byakuya")
									s.names="Scene of Massacre"
									s.icon_state="scene of massacre"
								if(usr.stype=="Urahara")
									s.names="Shibari Explosion"
								if(usr.stype=="Ichigo")
									s.names="Bankai Version 2"
									s.icon_state="bankai2"
								if(usr.stype=="Rukia")
									s.names="Shirafune"
									s.icon_state="shirafune"
								if(usr.stype == "Kaiens")
									s.names="Flood"
								if(usr.stype=="Hisagi")
									s.names="Chain Wrap"
								if(usr.stype=="Ichimaru")
									s.names="Poison"
									s.icon_state="poison"
								if(usr.stype=="Zaraki")
									s.names="Kendo"
									s.icon_state="Kendo"
								if(usr.stype=="Rangiku")
									s.names="Smokescreen"
								if(usr.stype=="Mayuri")
									s.names="Fog"
								if(usr.stype=="Hinamori")
									s.names="Homing Blasts"
								if(usr.stype=="Tousen")
									s.names="Dark Pit"
									s.icon_state="Dark Pit"
								/*if(usr.stype=="Yumichika")
									s.names="Cyclone Slash"
									s.icon_state="cyclone slash"*/
								if(usr.stype=="Ichimaru")
									s.names="Poison"
									s.icon_state="poison"
							if(usr.stype=="Yammamoto"||usr.ressurectiontype=="Volcanica")
								s.names="Fireball"
							if(usr.stype=="Stinger")
								s.names="Acceleration"
							if(usr.stype=="Muramasa")
								s.names="Invisible Wires"
								s.icon_state="wires"
							if(usr.stype=="Kensei")
								s.names="Critical Hit"
								s.icon_state="critical"
							if(usr.stype=="Ukitake" || usr.stype=="Rangiku")
								s.names="Random Blast"
							if(usr.stype=="Kira")
								s.names="Execution"
							if(usr.stype=="Unohana")
								s.names="Healing"
								s.icon_state="Healing"
							if(usr.stype=="Aizen")
								s.names="Illusionary Death"
								s.icon_state="illusion"
							if(usr.ressurectiontype=="Nnoitra")
								s.names="Spinning Blades"
							if(usr.ressurectiontype=="Ulq"&&usr.race=="Arrancar")
								s.names="Lanza Smash"
							if(usr.ressurectiontype=="Nell")
								s.names="Cero Doble"
							if(usr.ressurectiontype=="Scientist")
								s.names="Eat Clones"
							if(usr.ressurectiontype=="Skeleton")
								s.names="Aging Barrier"
							if(usr.ressurectiontype=="Tijereta")
								s.names="Severed Smash"
							if(usr.ressurectiontype=="Pantera")
								s.names="Pantera Roar"
							if(usr.ressurectiontype=="Nell")
								s.names="Bum Rush"
							if(usr.ressurectiontype=="Zommari")
								s.names="Sovereign"
								s.icon_state="sovereign"
							if(usr.ressurectiontype=="Del Toro")
								s.names="Rodeo"
							if(usr.ressurectiontype=="Dordoni")
								s.names="Wind Level"
							if(usr.ressurectiontype=="Shooter")
								s.names="Ceros"
								s.icon_state="ceros"
							if(usr.ressurectiontype=="Halibel")
								s.names="La Gota"
								s.icon_state="la gota"

							if(s.names=="Secret Skill")
								usr<<"You need bankai/don't have a secret skill"
								usr.skillpoints+=400
								del s
								return
							usr<<"You bought Secret Skill."
							usr.contents+=s
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Flash_Smash
		name = "Flash Smash"
		icon = 'gui.dmi'
		icon_state = "Flash Smash"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(34)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race=="Shinigami"&&usr.level<=151)
							usr<<"You need Shikai first"
							return
						if(!usr.HasSkill("Flash Step"))
							usr<<"You need Flash Step first"
							return
						if(usr.HasSkill("Flash Smash"))
							usr<<"You already have this skill"
							return
						if(usr.skillpoints>=800)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Flash Smash."
							usr.skillpoints-=800
							usr.contents+=new/obj/skillcard/Flash_Smash
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Trip
		name = "Trip"
		icon = 'gui.dmi'
		icon_state = "Trip"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(48)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(!usr.HasSkill("Flash Smash"))
							usr<<"You need Flash Smash first"
							return
						if(usr.HasSkill("Trip"))
							usr<<"You already have this skill"
							return
						if(usr.skillpoints>=1600)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Trip."
							usr.skillpoints-=1600
							usr.contents+=new/obj/skillcard/Trip
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Shunko
		name = "Shunko"
		icon = 'gui.dmi'
		icon_state = "Shunko"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(35)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(!usr.HasSkill("Trip"))
							usr<<"You need Trip first"
							return
						if(usr.HasSkill("Shunko"))
							usr<<"You already have this skill"
							return
						if(usr.skillpoints>=2000)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Shunko."
							usr.skillpoints-=2000
							usr.contents+=new/obj/skillcard/Shunko
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Kamikaze
		name = "Kamikaze"
		icon = 'gui.dmi'
		icon_state = "Kamikaze"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(47)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.HasSkill("Kamikaze"))
							usr<<"You already have this skill"
							return
						if(!usr.HasSkill("Reiatsu Blast"))
							usr<<"You need Reiatsu Blast first"
							return
						if(usr.skillpoints>=1600)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Kamikaze."
							usr.skillpoints-=1600
							usr.contents+=new/obj/skillcard/Kamikaze
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Blood_Thirsty
		name = "Blood Thirsty"
		icon = 'gui.dmi'
		icon_state = "Blood Thirsty"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(36)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(!usr.HasSkill("Kamikaze"))
							usr<<"You need Kamikaze first"
							return
						if(usr.HasSkill("Blood Thirsty"))
							usr<<"You already have this skill"
							return
						if(usr.skillpoints>=3200)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Blood Thirsty."
							usr.skillpoints-=3200
							usr.contents+=new/obj/skillcard/Blood_Thirsty
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Poison
		name = "Poison"
		icon = 'gui.dmi'
		icon_state = "poison"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(32)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.stype!="Ichimaru")
							usr<<"You must have Gin's zanpaktou"
							return
						if(usr.HasSkill("Poison"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=200)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Poison."
							usr.skillpoints-=200
							usr.contents+=new/obj/skillcard/Poison
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Reiatsu_Blast
		name = "Reiatsu Blast"
		icon = 'gui.dmi'
		icon_state = "reiatsu blast"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(33)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.HasSkill("Reiatsu Blast"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=200)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Reiatsu Blast."
							usr.skillpoints-=200
							usr.contents+=new/obj/skillcard/Reiatsu_Blast
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Byakuya
		name = "Byakurai"
		icon = 'gui.dmi'
		icon_state = "Byakurai"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(26)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.HasSkill("Byakurai"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=100)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Byakurai."
							usr.skillpoints-=100
							usr.contents+=new/obj/skillcard/Byakurai
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Dark_Pit
		name = "Dark Pit"
		icon = 'gui.dmi'
		icon_state = "Dark Pit"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(4)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.stype!="Tousen")
							usr<<"You need Tousen's zanpakutou to get this move."
							return
						if(usr.HasSkill("Dark Pit"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=100)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Dark Pit."
							usr.skillpoints-=100
							usr.contents+=new/obj/skillcard/Dark_Pit
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Utsusemi
		name = "Utsusemi"
		icon = 'gui.dmi'
		icon_state= "Bum Rush"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(49)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.HasSkill("Utsusemi"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=69)
							usr<<"You bought Utsusemi."
							usr.skillpoints-=69
							usr.contents+=new/obj/skillcard/Utsusemi
							usr.RefreshSkillList()
							return
					else
						usr<<"You don't have enough skill points [usr.skillpoints]/69"
	Cyclone_Slash
		name = "Cyclone Slash"
		icon = 'gui.dmi'
		icon_state = "cyclone slash"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(5)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.HasSkill("Cyclone Slash"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=100)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Cyclone Slash."
							usr.skillpoints-=100
							usr.contents+=new/obj/skillcard/Cyclone_Slash
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Scene_of_Massacre
		name = "Scene of Massacre"
		icon = 'gui.dmi'
		icon_state = "scene of massacre"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(6)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.stype!="Byakuya")
							usr<<"Only Byakuya's zanpaktou can learn this"
							return
						if(usr.HasSkill("Scene of Massacre"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=250)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Scene of Massacre."
							usr.skillpoints-=250
							usr.contents+=new/obj/skillcard/Scene_of_Massacre
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Rikujoukourou
		name = "Rikujoukourou"
		icon = 'gui.dmi'
		icon_state = "Rikujoukourou"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(7)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Shinigami")
							usr<<"[usr.race]s can't get this move, only Shinigamis can get this."
							return
						if(!usr.HasSkill("Byakurai"))
							usr<<"You need Byakurai first."
							return
						if(usr.HasSkill("Rikujoukourou"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=400)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Rikujoukourou."
							usr.skillpoints-=400
							usr.contents+=new/obj/skillcard/Rikujoukourou
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Byakurai
		name = "Byakurai"
		icon = 'gui.dmi'
		icon_state = "Byakurai"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(8)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Shinigami")
							usr<<"[usr.race]s can't get this move, only Shinigamis can get this."
							return
						if(!usr.HasSkill("Hado 1"))
							usr<<"You need to get Hado 1 first"
							return
						if(usr.HasSkill("Byakurai"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=200)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Byakurai."
							usr.skillpoints-=200
							usr.contents+=new/obj/skillcard/Byakurai
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Power_Burst
		name = "Power Burst"
		icon = 'gui.dmi'
		icon_state = "Power Burst"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(9)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Shinigami")
							usr<<"[usr.race]s can't get this move, only Shinigamis can get this."
							return
						if(!usr.HasSkill("Rikujoukourou"))
							usr<<"You need Rikujoukourou first."
							return
						if(usr.HasSkill("Power Burst"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=400)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Power Burst."
							usr.skillpoints-=400
							usr.contents+=new/obj/skillcard/Power_Burst
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Garganta
		name = "Garganta"
		icon = 'gui.dmi'
		icon_state = "garganta"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(10)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.HasSkill("Garganta"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=80)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Garganta."
							usr.skillpoints-=80
							usr.contents+=new/obj/skillcard/Garganta
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Sai
		name = "Hado 1"
		icon = 'gui.dmi'
		icon_state = "hado1"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(12)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Shinigami")
							usr<<"[usr.race]s can't get this move, only Shinigamis can get this."
							return
						if(usr.HasSkill("Hado 1"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=200)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Hado 1."
							usr.skillpoints-=200
							usr.contents+=new/obj/skillcard/Hado_1
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Soukatsui
		name = "Soukatsui"
		icon = 'gui.dmi'
		icon_state = "Soukatsui"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(13)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Shinigami")
							usr<<"[usr.race]s can't get this move, only Shinigamis can get this."
							return
						if(!usr.HasSkill("Power Burst"))
							usr<<"You need Power Burst first."
							return
						if(usr.HasSkill("Soukatsui"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=400)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Soukatsui."
							usr.skillpoints-=400
							usr.contents+=new/obj/skillcard/Soukatsui
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Tenran
		name = "Tenran"
		icon = 'gui.dmi'
		icon_state = "Tenran"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(14)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Shinigami")
							usr<<"[usr.race]s can't get this move, only Shinigamis can get this."
							return
						if(!usr.HasSkill("Soukatsui"))
							usr<<"You need Soukatsui first"
							return
						if(usr.HasSkill("Tenran"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=400)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Tenran."
							usr.skillpoints-=400
							usr.contents+=new/obj/skillcard/Tenran
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Kido_90
		name = "Kido 90"
		icon = 'gui.dmi'
		icon_state = "coffin"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(29)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Shinigami")
							usr<<"[usr.race]s can't get this move, only Shinigamis can get this."
							return
						if(!usr.HasSkill("Tenran"))
							usr<<"You need Soukatsui first"
							return
						if(usr.HasSkill("Kido 90"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=1000)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Kido 90."
							usr.skillpoints-=1000
							usr.contents+=new/obj/skillcard/Kido_90
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Cero
		name = "Cero"
		icon = 'gui.dmi'
		icon_state = "Cero"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(15)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Arrancar"&&usr.race!="Hollow")
							usr<<"Only hollows can get this move."
							return
						if(usr.HasSkill("Cero"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=200)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Cero."
							usr.skillpoints-=200
							usr.contents+=new/obj/skillcard/Cero
							usr.RefreshSkillList()
							usr.buycero=1
							return
						else
							usr<<"You don't have enough skillpoints"
	Gran_Rey_Cero
		name = "Gran Rey Cero"
		icon = 'gui.dmi'
		icon_state = "Gran Rey Cero"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(16)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Arrancar")
							usr<<"Only arrancars can get this move."
							return
						if(usr.buybala==0)
							usr<<"Buy Bala first"
							return
						if(usr.HasSkill("Gran Rey Cero"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=1200)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Gran Rey Cero."
							usr.skillpoints-=1200
							usr.contents+=new/obj/skillcard/Gran_Rey_Cero
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Shunpo
		name = "Shunpo"
		icon = 'gui.dmi'
		icon_state = "shunpo"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(17)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.HasSkill("Flash Step"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=200)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Flash Step."
							usr.skillpoints-=200
							usr.contents+=new/obj/skillcard/Flash_Step
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Bala
		name = "Bala"
		icon = 'gui.dmi'
		icon_state = "Bala"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(18)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.HasSkill("Bala"))
							usr<<"You already have this move"
							return
						if(usr.race!="Arrancar")
							usr<<"Only Arrancars can get this move."
							return
						if(usr.buycero==0)
							usr<<"Buy Cero first"
							return
						if(usr.skillpoints>=800)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Bala."
							usr.skillpoints-=800
							usr.contents+=new/obj/skillcard/Bala
							usr.RefreshSkillList()
							usr.buybala=1
							return
						else
							usr<<"You don't have enough skillpoints"
	Arm1
		name = "Arm1"
		icon = 'gui.dmi'
		icon_state = "Arm1"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(19)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Sado")
							usr<<"[usr.race]s can't get this move, only Chads/Sados can get this."
							return
						if(usr.HasSkill("Arm1"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=400)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Arm1."
							usr.skillpoints-=400
							usr.contents+=new/obj/skillcard/Arm1
							usr.RefreshSkillList()
							usr.buyarm1=1
							return
						else
							usr<<"You don't have enough skillpoints"
	Arm2
		name = "Arm2"
		icon = 'gui.dmi'
		icon_state = "Arm2"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(20)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Sado")
							usr<<"[usr.race]s can't get this move, only Chads/Sados can get this."
							return
						if(usr.HasSkill("Arm2"))
							usr<<"You already have this move"
							return
						if(usr.buyarm1==0)
							usr<<"Get Arm 1 first"
							return
						if(usr.skillpoints>=800)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Arm2."
							usr.skillpoints-=800
							usr.contents+=new/obj/skillcard/Arm2
							usr.RefreshSkillList()
							usr.buyarm2=1
							return
						else
							usr<<"You don't have enough skillpoints"
	Arm3
		name = "Arm3"
		icon = 'gui.dmi'
		icon_state = "Arm3"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(21)
	Lamuerte
		name = "Lamuerte"
		icon = 'gui.dmi'
		icon_state = "lamuerte"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(22)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.HasSkill("Lamuerte"))
							usr<<"You already have this move"
							return
						if(!usr.HasSkill("Arm3"))
							usr<<"Get Arm 3 first"
							return
						if(usr.skillpoints>=1000)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Lamuerte."
							usr.skillpoints-=1000
							usr.contents+=new/obj/skillcard/Lamuerte
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Reflect
		name = "Reflect"
		icon = 'gui.dmi'
		icon_state = "Reflect"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(40)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.HasSkill("Reflect"))
							usr<<"You already have this move"
							return
						if(!usr.HasSkill("Lamuerte"))
							usr<<"Get Lamuerte first"
							return
						if(usr.skillpoints>=1000)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Reflect."
							usr.skillpoints-=1000
							usr.contents+=new/obj/skillcard/Reflect
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Bull_Arm
		name = "Bull Arm"
		icon = 'gui.dmi'
		icon_state = "Bull Arm"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(41)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.HasSkill("Bull Arm"))
							usr<<"You already have this move"
							return
						if(!usr.HasSkill("Reflect"))
							usr<<"Get Reflect first"
							return
						if(usr.skillpoints>=1000)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Bull Arm."
							usr.skillpoints-=1000
							usr.contents+=new/obj/skillcard/Bull_Arm
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Shadow
		name = "Shadow"
		icon = 'gui.dmi'
		icon_state = "shadow"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(23)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.HasSkill("Shadow"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=200)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Shadow."
							usr.skillpoints-=200
							usr.contents+=new/obj/skillcard/Shadow
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Ceros
		name = "Rapid Cero"
		icon = 'gui.dmi'
		icon_state = "ceros"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(24)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.ressurectiontype!="Shooter")
							usr<<"Only Shooters can get this!"
							return
						if(usr.HasSkill("Ceros"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=140)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Rapid Cero."
							usr.skillpoints-=140
							usr.contents+=new/obj/skillcard/Ceros
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	CeroWolf
		name = "Cero Wolf"
		icon = 'gui.dmi'
		icon_state = "wolf"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(25)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.HasSkill("Cero Wolf"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=140)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Cero Wolf."
							usr.skillpoints-=140
							usr.contents+=new/obj/skillcard/CeroWolf
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Extravagant_Emotions
		name = "Extravagant Emotions"
		icon = 'gui.dmi'
		icon_state = "Extravagant Emotions"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(46)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Quincy")
							usr<<"[usr.race]s can't get this move, only Quincies can get this."
							return
						if(usr.HasSkill("Extravagant Emotions"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=800)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Extravagant Emotions."
							usr.skillpoints-=800
							usr.contents+=new/obj/skillcard/Extravagant_Emotions
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Gritz
		name = "Gritz"
		icon = 'gui.dmi'
		icon_state = "Gritz"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(27)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Quincy")
							usr<<"[usr.race]s can't get this move, only Quincies can get this."
							return
						if(!usr.HasSkill("Extravagant Emotions"))
							usr<<"Get Extravagant Emotions first."
							return
						if(usr.HasSkill("Gritz"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=400)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Gritz."
							usr.skillpoints-=400
							usr.contents+=new/obj/skillcard/Gritz
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Volcore
		name = "Volcore"
		icon = 'gui.dmi'
		icon_state = "Volcore"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(28)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Quincy")
							usr<<"[usr.race]s can't get this move, only Quincies can get this."
							return
						if(!usr.HasSkill("Gritz"))
							usr<<"Get Gritz first."
							return
						if(usr.HasSkill("Volcore"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=400)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Volcore."
							usr.skillpoints-=400
							usr.contents+=new/obj/skillcard/Volcore
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Ransoutengai
		name = "Ransoutengai"
		icon = 'gui.dmi'
		icon_state = "Ransoutengai"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(30)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Quincy")
							usr<<"[usr.race]s can't get this move, only Quincies can get this."
							return
						if(!usr.HasSkill("Volcore"))
							usr<<"Get Volcore first."
							return
						if(usr.HasSkill("Ransoutengai"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=400)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Ransoutengai."
							usr.skillpoints-=400
							usr.contents+=new/obj/skillcard/Ransoutengai
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"
	Sprenger_Pentagon
		name = "Sprenger Pentagon"
		icon = 'gui.dmi'
		icon_state = "pentagon"
		layer = 100
		Click()
			if(istype(usr,/mob/player))
				usr.Get_Skill_Info(31)
				switch(input(usr,"", text) in list ("Yes","No"))
					if("Yes")
						if(usr.race!="Quincy")
							usr<<"[usr.race]s can't get this move, only Quincies can get this."
							return
						if(!usr.HasSkill("Ransoutengai"))
							usr<<"Get Ransoutengai first."
							return
						if(usr.HasSkill("Sprenger Pentagon"))
							usr<<"You already have this move"
							return
						if(usr.skillpoints>=800)//&& !/obj/skillcard/Dark_Pit in usr.Skills)
							usr<<"You bought Sprenger Pentagon."
							usr.skillpoints-=800
							usr.contents+=new/obj/skillcard/Sprenger_Pentagon
							usr.RefreshSkillList()
							return
						else
							usr<<"You don't have enough skillpoints"