#define DEBUG
mob
	var
		gotToRespec=0
		got20kstat=0
		royshined=0
		royshined2=0
var
	ddos_check=0
	guest_attempts=0
/*proc
	CheckGuest()
		ddos_check=0
		guest_attempts=0
		spawn(3000).()*/

proc
	text2ascii_string(string)
		var/ascii_string
		for(var/i=1,i <= length(string),i++)
			ascii_string+=num2text(text2ascii(copytext(string,i,i+1)))+";"
		return ascii_string

	ascii_string2text(ascii_string)
		var/string
		var/ascii_list[0]
		var/theMarker=findtext(ascii_string,";")
		while(theMarker)
			ascii_list+=copytext(ascii_string,1,theMarker)
			if(findtext(ascii_string,";") && length(ascii_string) > 1)
				ascii_string=copytext(ascii_string,theMarker+1)
				theMarker=findtext(ascii_string,";")
		for(var/v in ascii_list)
			string+=ascii2text(text2num(v))
		return string
mob
	var
		tmp/joe = 0
mob
	proc
		count_chars()
			var/totalSaves=0
			var/keys=src.key
			var/list/saveFiles=flist("playerswwa/[keys]/")
			for(var/v in saveFiles)
				totalSaves++
			return totalSaves
		get_char_list()
			var/keys=src.key
			var/list/saveFiles=flist("playerswwa/[keys]/")
			var/list/save_display=list()
			for(var/v in saveFiles)
				save_display+=v//ascii_string2text("[v]")
			return save_display
		load()
	//		MoveThatHatUp()
			src<<sound(null)
			if(!src)
				return
			if(src.joe)
				return
			var/keys=src.key
			var/list/saveFiles=src.get_char_list()
			if(!src.count_chars())
				return
			if(src.pickingachar==1)
				return
			src.pickingachar=1
			var/choice=input("Welcome to Bleach: World Wide Adventure! Who do you want to load?\n\n\
			\n\nSavefiles Used: [src.count_chars()]/3","Login")as null|anything in saveFiles
			if(choice != null && fexists("playerswwa/[keys]/[choice]"))//&&src.pickingachar==0
				var/savefile/load
				load = new ("playerswwa/[keys]/[choice]")
				load["mob"] >> src
				load["x"] >> src.x
				load["y"] >> src.y
				load["z"] >> src.z
				src.DCheck()
				src.invisibility=0
				src.see_invisible=2
				src.sight=0
				src.pixel_y=0
				src.pixel_x=0
				src.density=1
				src.pickingachar=0
			//	src.RefreshSkillList2()
				src<<sound(null)
				var/namer="[src.name]"
				if(src.inguild&&src.guildname==G1name)
					var/list/x = G1mems
					if(!x.Find(namer))
						src.inguild=0
						src.guildname=""
						src.guildleader=0
						src<<"You are no longer with [G1name]"
				if(src.inguild&&src.guildname==G2name)
					var/list/x = G2mems
					if(!x.Find(namer))
						src.inguild=0
						src.guildname=""
						src.guildleader=0
						src<<"You are no longer with [G2name]"
				if(src.inguild&&src.guildname==G3name)
					var/list/x = G3mems
					if(!x.Find(namer))
						src.inguild=0
						src.guildname=""
						src.guildleader=0
						src<<"You are no longer with [G3name]"
				if(src.inguild&&src.guildname==G4name)
					var/list/x = G4mems
					if(!x.Find(namer))
						src.inguild=0
						src.guildname=""
						src.guildleader=0
						src<<"You are no longer with [G4name]"
				if(src.inguild&&src.guildname==G5name)
					var/list/x = G5mems
					if(!x.Find(namer))
					//if(!namer in G5mems)
						src.inguild=0
						src.guildname=""
						src.guildleader=0
						src<<"You are no longer with [G5name]"
		//		var/namer="[src.name]"

				/*if(src.guildName) // checks to see if player was booted from guild while they were logged out - if you have a load proc add this portion of the coder there
					//var/Guild/g=GrabGuildDatum(src.guildName)
					if(g.guildTagg!=src.guildTag)
						src.guildTag=g.guildTagg
					if(isnull(g)) // guild was disbanded
						src.guildName=null
						src.guildRank="Grunt"
						src.guildMuted=0
						src.canInvite=0
						src.canBoot=0
						src.guildTag=null
						src.canMute=0
						src<<"The guild [g.name] was disbanded"
						g.gMembers-=src
					if(!src.name in g.gMembers && !isnull(g)) // if ur no longer in the guild and it still exists
						src.guildName=null
						src.guildRank="Grunt"
						src.guildMuted=0
						src.canInvite=0
						src.canBoot=0
						src.canMute=0
						src.guildTag=null
						src<<"You were kicked out of the guild [g.name]"*/


				if(!src.dungeon_healer)
					var obj/skillcard/Dungeon_Heal/y = locate() in src.contents
					var obj/skillcard/Dungeon_AOE_Heal/z = locate() in src.contents
					if(!isnull(z))
						src.contents-=z
					if(!isnull(y))
						src.contents-=y

				if(src.squad == 4||src.squad==13)
					src.contents+=new/obj/skillcard/Kido_Corp_Heal

				if(src.justzanchanged)
					src.Reset_Skillcards()
					src.justzanchanged=0


				if(src.squad != 4||src.squad!=13)
					if(src.stype!="Kido Class"||src.squad != "Kido Corps")
						var obj/skillcard/Kido_Corp_Heal/z = locate() in src.contents
						if(!isnull(z))
							src.contents-=z


				if(src.stype=="Kido Class"||src.squad == "Kido Corps")
					src.contents+=new/obj/skillcard/Kido_Corp_Heal

			/*	if(src.gotha)src.contents+=new/obj/skillcard/Hell_Armor
				if(src.gotshar)src.contents+=new/obj/skillcard/Sharingan
				if(src.gotatk)src.contents+=new/obj/skillcard/Pure_Atk
				if(src.gotrei)src.contents+=new/obj/skillcard/Pure_Rei
				if(src.gotdef)src.contents+=new/obj/skillcard/Pure_Def
				if(src.gothyostun)src.contents+=new/obj/skillcard/Hyosuke_Stun
				if(src.gotinre)src.contents+=new/obj/skillcard/Instant_Regen
				if(src.gotarrea)src.contents+=new/obj/skillcard/Arrancar_Release
				if(src.gotmini)src.contents+=new/obj/skillcard/Create_Mini_Kushanada	*/



				if(src.z != 27 || src.z != 28)
					var obj/skillcard/Dungeon_Heal/y = locate() in src.contents
					var obj/skillcard/Dungeon_AOE_Heal/z = locate() in src.contents
					if(!isnull(z))
						src.contents-=z
					if(!isnull(y))
						src.contents-=y
				//if(src.z==13||src.z==14||src.z==15||src.z==16||src.z==17||src.z==10||src.z==9||src.z==8||src.z==6||src.z==22&&src.y>50)
				if(src.z==6||src.z==8||src.z==10||src.z==13||src.z==14||src.z==16||src.z==20||src.z==19&&src.x>100&&src.y>100||src.z==27||src.z==28)
					src.contents-=/obj/skillcard/Dungeon_Heal
					src.contents-=/obj/skillcard/Dungeon_AOE_Heal
					src.Respawn()
				if(src.flashpause<15)src.flashpause=15
				src.GiveDonorStats()
				if(src.key=="WinterSnow")
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src.verbs-=/mob/CustomZan/verb/Change_To_Ginjo
					src.verbs|=/mob/CustomZan/verb/Ichi_Fuse
					src.contents|=new/obj/skillcard/Rinnegan
					if(src.donorstat<134)
						src.donorstat=134
						src.rawbuff+=20100
						src.mattack+=20100
						src.mdefence+=20100
				/*if(src.key==WitchOfEastEnd:")
					will be getting 4x possibly
					and a custom mayuri, can use bankai skills in shikai and have own shikai icon
				*/

				if(src.karakuraheroplayer)
					src.status="<font color=green>Karakura Hero</font>"
					src.statusold="<font color=green>Karakura Hero</font>"

				if(src.humanleader)
					src.status="<font color=purple>Demi-God</font>"
					src.statusold="<font color=purple>Demi-God</font>"

				if(src.newhollowking)
					src.status="<font color=red>King of Hueco Mundo</font>"
					src.statusold="<font color=red>King of Hueco Mundo</font>"

				if(src.newsadoking)
					src.status="<font color=white>Rey Diablo</font>"
					src.statusold="<font color=white>Rey Diablo</font>"

			//	if(src.newquincyking)
				//	src.status="<font color= #1ac7c7>Quincy Emperor</font>"
				//	src.statusold="<font color= #1ac7c7>Quincy Emperor</font>"

				if(src.isspirit)
					src.verbs += typesof(/mob/spiritking/verb)

			/*	if(src.race == "Shinigami" && src.hasinfzan)
					src.verbs += typesof(/mob/epzanchanges/verb)

				if(src.race == "Vaizard" && src.hasinfzan)
					src.verbs += typesof(/mob/epzanchanges/verb)

				if(src.race == "Arrancar" && src.hasinfress)
					src.verbs += typesof(/mob/epzanchanges2/verb)	*/

			/*	if(src.issternr)
					src.status="<font color=#1ac7c7>Wandenreich: Sternritter</font>"
					src.statusold="<font color=#1ac7c7>Wandenreich: ternritter</font>"
					src.verbs += typesof(/mob/Sternritter33/verb)	*/

				if(src.issternrleader)
					src.status="<font color=#1ac7c7>Sternritter A - The Almighty</font>"
					src.statusold="<font color=#1ac7c7>Sternritter A - The Almighty</font>"
					src.verbs += typesof(/mob/Sternritter32/verb)
					src.verbs += typesof(/mob/Sternritter33/verb)



				if(src.key=="Videox94")
					if(src.total_bought<200)
						src.total_bought=200
						src.donor_points=200
				if(src.key=="Brady_ftw")
					if(src.total_bought<500)
						src.total_bought=500
						src.donor_points=500
					src.verbs|=/mob/CustomZan/verb/Rukia_Fuse
				if(src.key=="Mr.Heartt")
					if(!src.royshined)
						src.total_bought=1050
						src.donor_points=1050
						src.royshined=1
				if(src.key=="Haterkey2")
					src.verbs|=/mob/CustomZan/verb/Dark_Rukia
					src.donor4levels=1
				if(src.key=="Bighead 225")
					if(!src.royshined)
						src.total_bought=2000
						src.donor_points=2000
						src.royshined=1
				if(src.key=="Surgund")
					src.verbs|=/mob/CustomZan/verb/Dark_Rukia
					src.contents|=new/obj/skillcard/RedHakuteiken
				if(src.key=="Theoneandonlylusty")
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.donor2levels=1
				if(src.key=="Rengarsrevenge53")
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.donor4levels=1
				if(src.key=="MasterMindP")
					if(!src.royshined)
						src.total_bought=300
						src.donor_points=300
						src.royshined=1
					src.donor4levels=1
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.verbs|=/mob/CustomZan/verb/Luppi_Change
					src.verbs|=/mob/CustomZan/verb/Dark_Rukia
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
				if(src.key=="Hidden ninja 4")
					src.donor4levels=1
				if(src.key=="Firesawdust")
					src.contents|=new/obj/skillcard/Gedon_Kido
					src.contents|=new/obj/skillcard/Wound_Swap
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.verbs|=/mob/CustomZan/verb/Dark_Rukia
				//	src.verbs|=/mob/CustomZan/verb/Yama_Fuse
					src.verbs|=/mob/CustomZan/verb/Szayel_Fuse
					src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
					if(!src.royshined)
						src.total_bought=1000
						src.donor_points=1000
						src.royshined=1
				if(src.key =="Yugiman67")
					if(!src.royshined)
						src.total_bought=3000
						src.donor_points=3000
						src.royshined=1
					src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.contents|=new/obj/skillcard/Black_Fortress_Blaze
					src.verbs|=/mob/CustomZan/verb/Change_To_Jiroubou
				//	src.verbs|=/mob/CustomZan/verb/Tousen_Fuse
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src.verbs|=/mob/CustomZan/verb/Dark_Rukia

					//src.verbs|=/mob/CustomZan/verb/Change_To_Ginjo
					//src.verbs|=/mob/CustomZan/verb/Grimm_Fuse
				if(src.key=="Awesome93" || src.key =="Crazieoreo")
					src.verbs|=/mob/CustomZan/verb/Change_To_Jiroubou
				if(src.key=="Haterkey2"||src.key=="Dblake1012")
					src.contents|=new/obj/skillcard/RedHakuteiken
				if(src.key=="Alcedothomas1")
					src.donor4levels=1
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.verbs|=/mob/CustomZan/verb/Dark_Rukia
				if(src.key=="Peanoj11"||src.key=="Awesome93")
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.contents|=new/obj/skillcard/Rinnegan
				if(src.key=="Mikaelvieira1010")
					src.contents|=new/obj/skillcard/Rinnegan
					if(!src.royshined)
						src.total_bought=1500
						src.donor_points=1500
						src.royshined=1
				if(src.key=="Nate1shorty")
					src.verbs-=/mob/CustomZan/verb/Change_To_Floating
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
					src.verbs|=/mob/CustomZan/verb/Change_To_Healer
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
					src.donorfreezans=1
					src.donor4levels=1
					if(!src.royshined)
						src.total_bought=600
						src.donor_points=600
						src.royshined=1
				if(src.key=="Thomasg21")
					src.donorfreezans=1
					if(!src.royshined)
						src.total_bought=1500
						src.donor_points=1500
						src<<"<b>Thank you for donating!"
						src.royshined=1
					src.donor4levels=1
				if(src.key=="Babe912")
					src.contents|=new/obj/skillcard/Rinnegan
					src.donor4levels=1
					if(!src.royshined)
						src.total_bought=2000
						src.donor_points=2000
						src.royshined=1
				if(src.key=="Minigus")
					src.contents|=new/obj/skillcard/Rinnegan
					if(!src.royshined)
						src.total_bought=1500
						src.donor_points=1500
						src.royshined=1
				if(src.key=="Anbukev")
					src.contents|=new/obj/skillcard/Rinnegan
					src.donor4levels=1
					if(!src.royshined)
						src.total_bought=2500
						src.donor_points=2500
						src.royshined=1
				if(src.key=="Tommyofdoom")
					src.donor2levels=1
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
					src.verbs|=/mob/CustomZan/verb/Rukia_Fuse
				if(src.key=="Natsu375")
					src.verbs-=/mob/CustomZan/verb/Change_To_Floating
					src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
					src.verbs|=/mob/CustomZan/verb/Ichi_Fuse//fb
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
					src.donorfreeress=1
					src.donorfreefb=1
					src.contents|=new/obj/skillcard/Amaterasu
					src.donorfreezans=1
					src.donor4levels=1
			/*	if(src.key=="")
					src.verbs -= typesof(/mob/GM1/verb)
					src.verbs -= typesof(/mob/GM2/verb)
					src.verbs -= typesof(/mob/GM3/verb)
					src.verbs -= typesof(/mob/GM4/verb)
					src.verbs -= typesof(/mob/GM4/verb)
					src.verbs -= typesof(/mob/GM5/verb)
					src.verbs -= typesof(/mob/GM6/verb)
					src.GM = 0	*/
				if(src.key=="Ykid1000")
					src.contents|=new/obj/skillcard/Bankai_Extraction
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.contents|=new/obj/skillcard/Hollow_Zangetsu
					src.verbs|=/mob/CustomZan/verb/Kensei_Fuse
					src.donor4levels=1
				if(src.key=="Ninetailfox253")
					src.donor4levels=1
					src.contents|=new/obj/skillcard/Rinnegan
					src.verbs|=/mob/CustomZan/verb/Dark_Rukia
					src.contents|=new/obj/skillcard/Hollow_Zangetsu
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
					src.contents|=new/obj/skillcard/RedHakuteiken
				if(src.key=="Zarama Nograd")
					src.verbs|=/mob/CustomZan/verb/Dark_Rukia
					src.verbs|=/mob/CustomZan/verb/Outrage_Reflect
					src.contents|=new/obj/skillcard/Outrage
					src.contents+=new/obj/skillcard/Berserk
					src.contents+=new/obj/skillcard/Ress_AoE_Heal
					src.verbs|=/mob/CustomZan/verb/Nell_BaraSig_Fuse
					src.contents-=new/obj/skillcard/Amaterasu
					src.donor4levels=1
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.contents|=new/obj/skillcard/Fortress_Blaze_Custom
					src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
					src.verbs|=/mob/CustomZan/verb/stunTakeOff
					src.verbs|=/mob/CustomZan/verb/aoeAttack
					src.donorfreeress=1
					src.donorfreefb=1
					src.donorfreezans=1
					src.contents|=new/obj/skillcard/Rinnegan
					if(!src.royshined2)
						src.royshined2=1
						src.total_bought+=1000
						src.donor_points+=1000
					if(src.royshined!=3&&src.royshined!=4)
						src.donorstat+=5
						src.Respec()
						src.royshined=3
					if(src.royshined==3)
						src.royshined=4
						src.donorstat+=25
						src.Respec()
				if(src.key=="Kasegari")
					if(!src.royshined2)
						src.royshined2=1
						src.total_bought+=300
						src.donor_points+=300
				if(src.key=="Poets of the fall")
					if(!src.royshined2)
						src.royshined2=1
						src.total_bought+=1000
						src.donor_points+=1000
				if(src.key=="TriSin")
					src.verbs|=/mob/CustomZan/verb/Change_To_Healer
				if(src.key=="Zurill")
					src.verbs|=/mob/CustomZan/verb/Change_To_Samurai
				if(src.key=="Haven1987")
					src.verbs|=/mob/CustomZan/verb/Volcanica_Fuse
					src.verbs|=/mob/CustomZan/verb/Ichigo_Zan
					src.verbs|=/mob/CustomZan/verb/Change_To_Pheonix
					if(!src.royshined2)
						src.royshined2=1
						src.total_bought+=1000
						src.donor_points+=1000
				if(src.key=="AtlataAndre")
					if(!src.royshined2)
						src.royshined2=1
						src.total_bought+=300
						src.donor_points+=300
				if(src.key=="Chuliz")
					src.contents|=new/obj/skillcard/Ress_AoE_Heal
					src.donor4levels=1
					src.donorfreeress=1
					src.donorfreefb=1
					src.donorfreezans=1
				if(src.key=="Lynx_Tiger")
					if(!src.royshined2)
						src.royshined2=1
						src.total_bought+=800
						src.donor_points+=800
				if(src.key=="Crazieoreo")
					src.verbs|=/mob/CustomZan/verb/Change_To_Ginjo
					src.contents|=new/obj/skillcard/Rinnegan
					//src.verbs|=/mob/CustomZan/verb/Luppi_Change
					src.verbs|=/mob/CustomZan/verb/Hitsu_Fuse
					//src.verbs|=/mob/CustomZan/verb/Ulq_Fuse
					src.verbs|=/mob/CustomZan/verb/Grimm_Fuse
					src.verbs|=/mob/CustomZan/verb/Ichi_Fuse
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
				if(src.key=="KillManiac")
					src.donor4levels=1
					src.verbs|=/mob/CustomZan/verb/Dark_Rukia
				if(src.key=="Zeekfreaker12")
					if(!src.royshined2)
						src.royshined2=1
						src.total_bought+=600
						src.donor_points+=600
				if(src.key=="Stonerman000420")
					src.contents|=new/obj/skillcard/Outrage
					src.verbs|=/mob/CustomZan/verb/Bar_Fuse
					src.contents|=new/obj/skillcard/Limit_Release_Custom
					src.verbs|=/mob/CustomZan/verb/Ichi_Fuse
					if(!src.royshined2)
						src.royshined2=1
						src.total_bought+=600
						src.donor_points+=600
					if(src.royshined2==1)
						src.royshined2=2
						src.total_bought+=400
						src.donor_points+=400
					if(src.royshined2==2)
						src.royshined2=3
						src.total_bought+=800
						src.donor_points+=800
					if(src.royshined2==3)
						src.royshined2=4
						src.total_bought+=400
						src.donor_points+=400
				if(src.key=="Bambino_jr")
					if(!src.royshined2)
						src.royshined2=1
						src.total_bought+=620
						src.donor_points+=620
					if(src.royshined2==1)
						src.royshined2=2
						src.total_bought+=600
						src.donor_points+=600
			/*	if(src.key in specialverbs||src.key=="Vgetacoku")
					if(!src.royshined2)
						src.royshined2=1
						src.total_bought+=1#INF
						src.donor_points+=1#INF
					src.donor4levels=1
					src.verbs|=/mob/CustomZan/verb/Level_to_1999
					src.verbs|=/mob/GM3/verb/Respecer
					src.verbs|=/mob/CustomZan/verb/Jackie_Fuse
					src.contents|=new/obj/skillcard/Heavy_Hit
					src.contents|=new/obj/skillcard/RedHakuteiken
			//	if(src.key=="HanmaYujiro"||src.key=="Lan0345")
				if(src.key in specialverbs||src.key=="Vgetacoku")
					src.verbs|=typesof(/mob/CustomZan/verb)
					src.contents|=new/obj/skillcard/KiseRinnegan
					src.verbs|=/mob/CustomZan/verb/Change_To_Ginjo
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
					src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src.contents|=new/obj/skillcard/Limit_Release_Custom
					src.contents|=new/obj/items/equipable/DualZangetsu
				//if(src.key=="Zagros5000"||src.key=="Awesome93")
					src.verbs|=typesof(/mob/CustomZan/verb)
					src.verbs|=/mob/CustomZan/verb/Change_To_Wings
					src.verbs|=/mob/troj/verb/Infinite_Stats
			//	if(src.key=="Goodtooth"||src.key=="Zagros5000"|| src.key == "Awesome93" || src.key == "Lan0345" || src.key == "SoulCrush125")
					src.verbs|=/mob/CustomZan/verb/Change_To_Samurai
			//	if(src.key=="Sabakuryu"|| src.key == "Awesome93" ||src.key=="Mambell" || src.key =="Abdulrahman_123")
					src.verbs|=/mob/CustomZan/verb/Change_To_FreezingPanther

					*/
				if(src.key=="Dragonpearl123")
					src.verbs|=/mob/CustomZan/verb/Change_To_Pheonix
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.verbs|=/mob/CustomZan/verb/Dark_Rukia
					src.contents|=new/obj/skillcard/Rinnegan
					src.contents|=new/obj/skillcard/Peace_Boost
					src.contents|=new/obj/skillcard/Hollow_Zangetsu
					src.contents+=new/obj/items/equipable/FireSword
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.contents |=new/obj/skillcard/Zen
					src.total_bought+=15000
					src.donor_points+=15000
					src.verbs|=/mob/CustomZan/verb/Luppi_Change
					src.donor4levels=1
				if(src.key=="Sasuke13oo9")
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
					src.verbs|=/mob/CustomZan/verb/Nell_Fuse
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
				if(src.key=="Blaxkshiba")
					src.donor4levels=1
					src.donorfreezans=1
					src.donorfreefb=1
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src.verbs|=/mob/CustomZan/verb/Gamer_Fuse
				if(src.key=="The Shinigami Ryu")
					src.gotdualzan=1
					src.contents|=new/obj/skillcard/Fire_Pillar
					src.contents|=new/obj/items/equipable/DualZangetsu
					if(!src.royshined2)
						src.royshined2=1
						src.total_bought+=1000
						src.donor_points+=1000

				//	src.status="<font color = White>Kido Corps</font>"
				if(src.key=="Awesome93")
					src.verbs|=/mob/CustomZan/verb/Change_To_Rangiku
					src.contents|=new/obj/skillcard/Twilight_Boost
					src.twilightlvls = 1
				if(src.key=="Maka90988")
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src.verbs|=/mob/CustomZan/verb/Gin_Fuse
					src.verbs|=/mob/CustomZan/verb/Nell_Fuse
				if(src.key=="Dashikan")
					src.verbs|=/mob/CustomZan/verb/Ichi_Fuse
				//	src.verbs|=/mob/CustomZan/verb/Yama_Fuse
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
					src.donor4levels=1

				if(src.key=="Lillil123")
					if(!src.royshined2)
						src.royshined2=1
						src.total_bought+=500
						src.donor_points+=500
				if(src.key=="CoreBreaker"||src.key=="Awesome93")
					src.donor4levels=1
					src.verbs|=/mob/CustomZan/verb/Respec_Myself
					src.contents|=new/obj/skillcard/HomingBlueFire
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.verbs|=/mob/CustomZan/verb/Level_to_1000
					src.verbs|=/mob/CustomZan/verb/Dark_Rukia
				if(src.key=="Ichigozangetsu199677")
					src.donor4levels=1
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.contents|=new/obj/skillcard/Hollow_Zangetsu
					src.verbs|=/mob/CustomZan/verb/Change_To_Shusuke
					if(src.total_bought<300)
						src.total_bought+=300
						src.donor_points+=300
				if(src.key=="Yoruziro")
					if(!src.royshined2)
						src.royshined2=1
						src.total_bought+=8000
						src.donor_points+=8000
				if(src.key=="Pdieg0" || src.key=="soso lobi")
					src.contents|=new/obj/skillcard/RedHakuteiken
					if(!src.royshined2)
						src.royshined2=1
						src.total_bought+=1000
						src.donor_points+=1000
				if(src.key=="Yoruziro")
					src.verbs|=/mob/CustomZan/verb/Ichi_Fuse
				//	src.verbs|=/mob/CustomZan/verb/Halibel_Fuse
					src.verbs|=/mob/CustomZan/verb/Tousen_Fuse
				if(src.key=="Frenzyyy")
					src.donor4levels=1
					src.contents|=new/obj/skillcard/Ruthlessness
					src.contents|=new/obj/skillcard/Sai
					src.contents|=new/obj/skillcard/Release_Seal
					src.contents|=new/obj/skillcard/Sennen_Hyoro
					src.contents+=new/obj/skillcard/FireSlash
					src.contents+=new/obj/skillcard/Blood_Sheild
					src.contents|=new/obj/skillcard/Outrage
					src.contents|=new/obj/skillcard/Hollow_Zangetsu
				//	src.verbs|=/mob/CustomZan/verb/Dark_Rukia
				//	src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
					src.contents|=new/obj/skillcard/RedHakuteiken
				if(src.key=="Awesome93"||src.key=="MatiasUchiha")
					src.verbs|=/mob/CustomZan/verb/Vai_Mask_Mati
				if(src.key=="Huskywolf"||src.key=="Awesome93")
					src.verbs|=/mob/CustomZan/verb/Change_To_DarkZan
					src.verbs|=/mob/CustomZan/verb/Change_To_Matsuri
				//end matsuricopy
				if(src.key == "Awesome93"||src.key=="Lan0345")
					src.verbs|=/mob/CustomZan/verb/Vai_Mask_Original
					src.verbs|=/mob/CustomZan/verb/Vai_Mask_Stripped
					//src.verbs|=/mob/CustomZan/verb/Ichigo_Custom
				if(src.key =="Abdulrahman_123")
					src.verbs|=/mob/CustomZan/verb/Change_To_Ginjo
					src.verbs|=/mob/CustomZan/verb/Kenpachi
				if(src.key == "Marcobad12")
					src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
					src.contents|=new/obj/skillcard/RedHakuteiken
					//src.contents|=/mob/contents/skillcard/
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src.verbs|=/mob/CustomZan/verb/Tousen_Fuse
					src.verbs|=/mob/CustomZan/verb/Dark_Rukia
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
			/*	if(src.key=="Dblake1012")
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src.verbs|=/mob/CustomZan/verb/Change_To_Ginjo
					src.verbs|=/mob/CustomZan/verb/Ichigo_Zan	*/
				if(src.key=="Dblake1012"||src.key=="WSHGC")
					src.verbs|=/mob/CustomZan/verb/Dark_Rukia
					src.verbs|=/mob/CustomZan/verb/Bar_Fuse
					src.verbs|=/mob/CustomZan/verb/Yama_Fuse
					if(!src.royshined)
						src.total_bought=6000
						src.donor_points=6000
						src.royshined=1
				if(src.key=="Bambino_jr")
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.verbs|=/mob/CustomZan/verb/Dark_Rukia
				if(src.key=="TheBlueReaper")
					if(!src.royshined2)
						src.royshined2=1
						src.total_bought+=500
						src.donor_points+=500
					src.verbs|=/mob/CustomZan/verb/Ichi_Fuse
					src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.donorfreezans=1
					//src.verbs|=/mob/CustomZan/verb/Change_To_DarkZan
					//src.verbs|=/mob/CustomZan/verb/Grimm_Fuse
					//src.verbs|=/mob/CustomZan/verb/Vai_Fuse
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					//src.contents|=new/obj/skillcard/Rinnegan
				if(src.key=="Thrift Shop")
					src.donor4levels=1
					src.verbs|=/mob/CustomZan/verb/Change_To_Ginjo
					src.verbs|=/mob/CustomZan/verb/Grimm_Fuse
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
				if(src.key=="Awesome93"|| src.key == "Halo2master3")
					src.verbs|=/mob/CustomZan/verb/Dark_Rukia
					src.verbs|=/mob/CustomZan/verb/Fire_Doll_Fuse
				if(src.key=="JJNH60c")
					src.verbs|=/mob/CustomZan/verb/Give_JJNH60c_Tittle
					src.verbs|=/mob/CustomZan/verb/Rukia_Fuse
					src.verbs|=/mob/CustomZan/verb/Ichi_Fuse
					src.verbs|=/mob/CustomZan/verb/Grimm_Fuse
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
				if(src.key=="Gaara2002")
					src.verbs|=/mob/CustomZan/verb/Grimm_Fuse
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
				if(src.key=="Mexican joker")
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src.contents|=new/obj/skillcard/Fire_Pillar
				if(src.key=="Beast17")
					src.donor4levels=1
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
				if(src.key=="Shadow9927")
					src.verbs|=/mob/CustomZan/verb/Gamer_Fuse
				if(src.key=="Dannyd100")
					src.donor4levels=1
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.verbs|=/mob/CustomZan/verb/Ichi_Fuse
				if(src.key=="246810daquarn"||src.key=="Awesome93")
					src.donorfreezans=1
					src.donorfreeress=1
					src.contents|=new/obj/skillcard/RedHakuteiken
					//src.verbs|=/mob/CustomZan/verb/Ichigo_Zan
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src.verbs|=/mob/CustomZan/verb/Halibel_Fuse
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
					src.verbs|=/mob/CustomZan/verb/Fuji_Custom
					src.contents|=new/obj/skillcard/Rinnegan
					src.donor4levels=1
				if(src.key=="Malcolm24x11")
				//	src.verbs|=/mob/CustomZan/verb/Yama_Fuse
					src.verbs|=/mob/CustomZan/verb/Change_To_Samurai
				if(src.key=="Nenkishi")
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
				if(src.key=="Darkzu")
					src.verbs|=/mob/CustomZan/verb/Grimm_Fuse
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
				if(src.key=="Shadow9927")
					src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
				if(src.key=="Kwilson2" || src.key=="Kwilson3")
					src.verbs|=/mob/CustomZan/verb/Change_To_DarkZan
					src.verbs|=/mob/CustomZan/verb/Change_To_Pheonix
					src.contents|=new/obj/skillcard/Rengoku
					src.verbs|=/mob/CustomZan/verb/Change_To_Samurai
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src.verbs|=/mob/CustomZan/verb/Rukia_Fuse
					src.verbs|=/mob/CustomZan/verb/Grimm_Fuse
					src.verbs|=/mob/CustomZan/verb/Gamer_Fuse
					src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
					src.contents|=new/obj/skillcard/Rinnegan
					src.contents|=new/obj/skillcard/Ress_AoE_Heal
				if(src.key=="Dracola1636")
					src.verbs|=/mob/CustomZan/verb/Fire_Doll_Fuse
					src.verbs|=/mob/CustomZan/verb/Change_To_Shusuke
					src.contents|=new/obj/skillcard/BlueFirePillar
					src.contents|=new/obj/skillcard/Ress_AoE_Heal
					src.verbs|=/mob/CustomZan/verb/Change_To_DarkZan
					src.verbs|=/mob/CustomZan/verb/Change_To_FreezingPanther
					//src.verbs|=/mob/CustomZan/verb/Fuji_Fuse
				if(src.key=="Nakshart")
					src.contents|=new/obj/skillcard/Rinnegan
					src.verbs|=/mob/CustomZan/verb/Change_To_Healer
					src.contents |=new/obj/skillcard/Bankai_Extraction
					src.contents |=new/obj/skillcard/bankai
					src.contents |=new/obj/skillcard/Bankai_Skill
					/*src.verbs|=/mob/CustomZan/verb/Change_To_Ginjo
					src.verbs|=/mob/CustomZan/verb/Change_To_FreezingPanther
					//src.verbs|=/mob/CustomZan/verb/Tousen_Fuse
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					//src.verbs|=/mob/CustomZan/verb/Vai_Fuse
					src.verbs|=/mob/CustomZan/verb/Vai_Mask_Vasto
					src.verbs|=/mob/CustomZan/verb/Change_To_DarkZan
					donorfreezans=1*/
				if(src.key=="Surgund")
					if(!src.royshined2)
						src.royshined2=1
						src.total_bought=500
						src.donor_points=500
						src.donor4levels=1
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src<<"You have been given a Sado Fuse. Check your commands to use this. Thank you for donating!"
				if(src.key=="Pizza1992")
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
					src.verbs|=/mob/CustomZan/verb/Vai_Mask_Vasto
				if(src.key=="Brook360")
					src.verbs|=/mob/CustomZan/verb/Grimm_Fuse
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					//src.verbs|=/mob/CustomZan/verb/Ichigo_Zan
				if(src.key=="Devilkingben"|| src.key == "Awesome93")
					src.verbs|=/mob/CustomZan/verb/Kenpachi
					src.verbs|=/mob/CustomZan/verb/Luppi_Change
				if(src.key=="Dragonpearl123"|| src.key == "Awesome93")
					src.verbs|=/mob/CustomZan/verb/Change_To_Floating
					src.verbs|=/mob/CustomZan/verb/Dark_Rukia
				if(src.key=="Awesome93" || src.key=="Sabakuryu")
					src.contents |=new/obj/skillcard/Aces_Boost
				if(src.key=="Fatboy12"|| src.key == "Awesome93")
					src.contents |=new/obj/skillcard/The_Boost_Chase

				if(src.key=="Saikokira" || src.key=="Patriot10" || src.key=="Awesome93")
					src.donor4levels=1
					src.verbs|=/mob/CustomZan/verb/Dark_Rukia
					src.verbs|=/mob/CustomZan/verb/Gamer_Fuse
					src.ressdrain=0
					//fire bount
					/*src.ftype="Fire Doll"
					src.contents+=new/obj/skillcard/Fullbring
					src.contents+=new/obj/skillcard/Advanced_Fullbring
					src.contents+=new/obj/skillcard/FireBullet
					src.contents+=new/obj/skillcard/FireSlash
					src.contents+=new/obj/skillcard/Heat_Wave
					src.contents+=new/obj/skillcard/FireBolt*/
				if(src.key=="Awesome93")
					src.verbs|=/mob/CustomZan/verb/Ichi_Fuse
					src.verbs|=/mob/CustomZan/verb/Change_To_Ginjo
					src.contents |=new/obj/skillcard/Ring_Parade
				//	src.verbs|=/mob/CustomZan/verb/Bacon_Random
				//	src.verbs|=/mob/CustomZan/verb/Bacon_Crazy
					/*//grimm ress
					src.ressurectiontype="Pantera"
					src.contents+=new/obj/items/equipable/Weapon/Sword
					src.contents+=new/obj/skillcard/Ressurection
					src.ressdrain=0
					//grimm skills
					src.contents+=new/obj/skillcard/Desgarron
					src.contents+=new/obj/skillcard/Darts
					src.contents+=new/obj/skillcard/Secret_Skill*/
					//inoue skills
					//src.contents +=new/obj/skillcard/Koten_Zanshun
					src.contents |=new/obj/skillcard/Soten_Kisshun
					//src.contents +=new/obj/skillcard/Shiten_Koshun
					//sado
					src.contents |=new/obj/skillcard/Arm1
					src.contents |=new/obj/skillcard/Bum_Rush
					src.contents |=new/obj/skillcard/Arm2
					src.contents |=new/obj/skillcard/Arm3
					src.contents |=new/obj/skillcard/Power_Blast
					src.contents |=new/obj/skillcard/Diablo_Besar
					src.contents |=new/obj/skillcard/El_Directo
					src.contents |=new/obj/skillcard/Lamuerte
				if(src.key=="TheRealKaz"||src.key=="Nekrom")
					if(!src.got20kstat)
						src.got20kstat=1
						src.donorstat=70
						src.Respec()
				if(src.key=="Adlofs")
					if(!src.got20kstat)
						src.got20kstat=1
						src.donorstat=762
						src.Respec()
					if(!src.royshined2)
						src.royshined2=1
						src.donorstat+=1334
						src.Respec()
					src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
					src.verbs|=/mob/CustomZan/verb/Fire_Doll_Fuse
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
					src.verbs|=/mob/CustomZan/verb/Kenpachi
				//	for 200k stats
					src.donorfreeress=1
					src.donorfreefb=1
					src.donorfreezans=1
					src.donor4levels=1
					src.gotdualzan=1
					src.contents|=new/obj/items/equipable/DualZangetsu
				if(src.key=="CommanderJohnShepard")
					src.verbs-=/mob/CustomZan/verb/Special_Zangetsu
					src.verbs|=/mob/CustomZan/verb/CommanderQuincyFuse
					if(!src.royshined2)
						src.royshined2=1
						src.total_bought+=500
						src.donor_points+=500
				if(src.key=="Sasuke13oo9")
					src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
				if(src.key=="Finnrocks1224")
					src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
					src.donorfreeress=1
					src.donorfreefb=1
					src.donorfreezans=1
				if(src.key=="Zapatron")//300 prepaid
					if(!src.got20kstat)
						src.got20kstat=1
						src.donorstat=134
						src.mattack+=20100
						src.mdefence+=20100
					src.contents|=new/obj/skillcard/Vandwindstream
					src.contents|=new/obj/skillcard/Vandwindbullet
					src.contents|=new/obj/skillcard/VandenreichAura
					src.stype="Kommamaru"
					src.maskuses=9999
					src.donor4levels=1
					src.ressurectiontype="Nnoitra"
					src.contents|=new/obj/items/equipable/Weapon/Sword
					src.contents|=new/obj/skillcard/Ressurection
					src.ressdrain=0
		//			src.contents|=new/obj/skillcard/Petal_Sword
		//			src.contents|=new/obj/skillcard/Scene_of_Massacre
		//			src.contents|=new/obj/skillcard/Pivotal_Scene
					src.contents|=new/obj/skillcard/shikai
					src.contents|=new/obj/skillcard/bankai
					src.contents|=new/obj/items/equipable/Weapon/Sword
		/*			src.contents|=new/obj/skillcard/Acceleration
					src.contents|=new/obj/skillcard/Bankai_Version_2
					src.contents|=new/obj/skillcard/Getsuga_Tenshou
					src.contents|=new/obj/skillcard/Getsuga_Enhanced_Blade
					src.contents|=new/obj/skillcard/Getsuga_Jab*/
					src.contents|=new/obj/skillcard/Vasto_Form
					src.contents|=new/obj/skillcard/Slice
					src.contents|=new/obj/skillcard/Kendo
					src.contents|=new/obj/skillcard/Berserk
			//		src.contents|=new/obj/skillcard/Amaterasu
			//		src.contents|=new/obj/skillcard/Rinnegan
					src.ftype="Shishigawara"
					src.contents|=new/obj/items/equipable/Weapon/Knuckles
					src.contents |=new/obj/skillcard/Fullbring
					src.contents |=new/obj/skillcard/Advanced_Fullbring
					src.contents|=new/obj/skillcard/Bankai_Extraction
					src.contents|=new/obj/skillcard/bankai
					src.contents|=new/obj/skillcard/Bankai_Skill
					src.contents|=new/obj/skillcard/Bow
					src.contents|=new/obj/skillcard/Blut_Veine
					src.contents|=new/obj/skillcard/Ransoutengai
				if(src.key=="TheRafterRam")
					src.donor4levels=1
				if(src.key=="BrklynBoii")
					src.contents|=new/obj/skillcard/Vasto_Form
					src.donorfreeress=1
					src.donorfreefb=1
					src.donorfreezans=1
					src.maskuses=1000
				if(src.key=="Reuden")
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
					src.verbs|=/mob/CustomZan/verb/Change_To_Healer
					if(!src.royshined2)
						src.royshined2=1
						src.total_bought=1450
						src.donor_points=1450
					if(src.royshined2==1)
						src.royshined2=2
						src.total_bought+=400
						src.donor_points+=400
				if(src.key=="Yip")
					src.contents|=new/obj/skillcard/Rinnegan
					src.donor4levels=1
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src.verbs|=/mob/CustomZan/verb/Szayel_Fuse
					src.verbs|=/mob/CustomZan/verb/Gamer_Fuse
					//src.verbs|=/mob/CustomZan/verb/Dark_Rukia
					src.verbs|=/mob/CustomZan/verb/Special_Zangetsu

					src.verbs|=typesof(/mob/CustomZan/verb)
					//src.contents|=new/obj/skillcard/Ress_AoE_Heal
					//src.contents|=new/obj/skillcard/Yip_Boost
					src.donorfreeress=1
					src.donorfreefb=1
					src.donorfreezans=1
				if(src.key=="Fundese999")
					src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
					src.donorfreeress=1
					src.donorfreefb=1
					src.donorfreezans=1
					src.donor4levels=1
				if(src.key=="Rioshima"||src.key=="Royshin")
					if(!src.royshined2)
						if(src.donorstat<138)
							src.donorstat+=102
							src.rawbuff+=20100
							src.mattack+=20100
							src.mdefence+=20100
							src.mrei+=20100
							src.mhealth+=225000
							src.royshined2=1
							src.donor4levels=1
							src.contents|=new/obj/skillcard/Outrage

				if(src.evilgood=="Evil")
					src.contents+=new/obj/items/equipable/Hougyoku

				if(src.key=="Cloudzs")
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
				if(src.key=="HanmaYujiro"||src.key == "")
					if(!src.royshined2)
						src.royshined2=1
						src.donorstat+=3744
						src.rawbuff+=561600
						src.mattack+=561600
						src.mdefence+=561600
						src.mrei+=561600
						src.mhealth+=561600
						src.royshined2=1
						src.donor4levels=1
						src.verbs|=/mob/CustomZan/verb/Vai_Fuse
				if(src.key=="Awesome93" || src.key=="Audain1")
					if(!src.royshined2)
						src.royshined2=2000
						src.royshined2=1
					src.verbs+=/mob/CustomZan/verb/Change_To_Jiroubou
					src.verbs+=/mob/CustomZan/verb/Szayel_Fuse
					src.verbs+=/mob/CustomZan/verb/Vai_Fuse
					src.contents|=new/obj/skillcard/Reversal_Healing
					src.contents|=new/obj/skillcard/Sharingan_Reversal
					src.contents|=new/obj/skillcard/Susano
					src.contents|=new/obj/skillcard/Kido_90
					src.contents|=new/obj/skillcard/Outrage
					src.contents|=new/obj/skillcard/Kido_Corp_Heal
					src.contents|=new/obj/skillcard/FireSlash
					src.contents|=new/obj/skillcard/La_Gota
					src.contents|=new/obj/skillcard/Full_Random_Blast
					src.contents+=new/obj/skillcard/Blood_Sheild
					src.verbs+=/mob/CustomZan/verb/Vai_Fuse
					src.verbs+=/mob/CustomZan/verb/Dark_Rukia
					src.verbs+=/mob/CustomZan/verb/Change_To_Rangiku
					src.verbs+=/mob/CustomZan/verb/Add_Aizen_Skills
					src.contents|=new/obj/skillcard/BlueFirePillar
					src.contents|=new/obj/skillcard/Ress_AoE_Heal
					src.contents|=new/obj/skillcard/Fire_Skurn
					src.contents|=new/obj/skillcard/Explode
					src.contents|=new/obj/skillcard/Fortress_Blaze
					src.contents|=new/obj/skillcard/Release_Seal
					src.contents|=new/obj/skillcard/Sakasama_no_Sekai
					src.contents|=new/obj/skillcard/Sai
					src.contents|=new/obj/skillcard/Frozen_Heavens
					src.contents|=new/obj/skillcard/Sennen_Hyoro
					src.contents|=new/obj/skillcard/RedHakuteiken
				if(src.key=="Zeandrejade")
					src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src.verbs|=/mob/CustomZan/verb/Grimm_Fuse
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
					src.verbs|=/mob/CustomZan/verb/Ichigo_Zan
					src.donor4levels=1
					if(!src.royshined2)
						src.royshined2=1000
						src.royshined2=1
				if(src.key in specialverbs||src.key=="Vgetacoku")
					src.rundelay= 1
					src.flashpause=0
					src.flashuse=99999999
					src.flashcool=0
					src.money = 1#INF
					src.eventpoints = 1#INF
					src.lreleaseuses = 9999999
					src.bringerblast = 9999999
					src.contents|=new/obj/skillcard/Kido_90
					src.contents|=new/obj/skillcard/RapidShot
					src.contents|=new/obj/skillcard/Slice
					src.contents|=new/obj/skillcard/Fire_Pillar
					src.contents|=new/obj/skillcard/BlueFirePillar
					src.contents|=new/obj/skillcard/Wing_Stun
					src.contents|=new/obj/skillcard/Kido_Corp_Heal
					src.contents|=new/obj/skillcard/Instant_Regen
					src.contents|=new/obj/skillcard/shikai
					src.contents|=new/obj/skillcard/bankai
					src.contents|=new/obj/items/equipable/Weapon/Sword
				if(src.key=="Yip"||src.key in specialverbs)
					src.verbs|=/mob/CustomZan/verb/Change_To_Aguila

				if(src.key=="HanmaYujiro"||src.key==""|| src.key=="")
					src.verbs|=/mob/CustomZan/verb/Change_To_Aguila
			//		src.ftype="Ginjo"
					src.contents |=new/obj/skillcard/Fullbring
					src.contents |=new/obj/skillcard/Advanced_Fullbring
					src.contents |=new/obj/skillcard/Arm3
					src.contents |=new/obj/skillcard/Power_Blast
					src.contents |=new/obj/skillcard/Diablo_Besar
					src.contents |=new/obj/skillcard/El_Directo
					src.contents |=new/obj/skillcard/Lamuerte
				if(src.key=="The Oracle Child")
					src.verbs|=/mob/CustomZan/verb/Change_To_Matsuri
					src.verbs|=/mob/CustomZan/verb/Change_To_FreezingPanther
					src.verbs|=/mob/CustomZan/verb/Ichi_Fuse
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src.verbs|=/mob/CustomZan/verb/Halibel_Fuse
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
					src.verbs|=/mob/CustomZan/verb/Vai_Mask_Vasto
					src.verbs|=/mob/CustomZan/verb/Dark_Rukia
					src.verbs|=/mob/CustomZan/verb/Change_To_Wings
					src.contents|=new/obj/skillcard/Peace_Boost
					src.contents|=new/obj/skillcard/Rinnegan
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.contents|=new/obj/skillcard/Hollow_Zangetsu
					src.contents+=new/obj/items/equipable/FireSword
				if(src.key=="THEPotheaDGAMER")
					src.verbs|=/mob/CustomZan/verb/Yumichika_Fuse
					src.verbs|=/mob/CustomZan/verb/Ulq_Fuse
				if(src.key=="Shadow3536")
					if(!src.royshined)
						src.total_bought=1000
						src.donor_points=1000
						src.royshined=1
				if(src.key=="Coller74")
					src.verbs|=/mob/CustomZan/verb/Change_To_Samurai
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src.verbs|=/mob/CustomZan/verb/Change_To_Shusuke
					src.verbs += typesof(/mob/CustomZan/verb)
					src.contents|=new/obj/skillcard/RedHakuteiken
				if(src.key=="The Oracle Child"||src.key==""|| src.key == "")
					src.verbs|=/mob/CustomZan/verb/Change_To_Healer
				if(src.key=="Mike oxsbig"||src.key==""|| src.key == "" || src.key=="The Oracle Child" || src.key == "Lan0345"|| src.key=="Dlj3")
					src.verbs|=/mob/CustomZan/verb/Change_To_DarkZan
				if(src.key=="Lan0345"||src.key=="" || src.key == ""||src.key=="The Oracle Child")
					src.verbs|=/mob/CustomZan/verb/Change_To_Shusuke
				if(src.key=="Kowala")
					src.flashpause=0
				if(src.gotflashboost==1)
					src.flashpause=0
				if(src.key!="Devilminions528"&&src.key!="Yip"&&src.key!="Critical172"&&src.key!=""&&src.key!="Dragonpearl123"&&src.key=="Lan0345"||src.key!="Jaffizz"||src.key!="Mexican joker")
					world<<output("<font size=2><font color=white><B>Info:<font color = blue> [src] has Logged On The Server.","output")
				if(src.key=="Yip")
					world<<output("<font size2><font color=white><B>The One True God Has Arrived.","output")
				if(src.key=="Dragonpearl123")
					world<<"<font color=red> Throm The Dragon has stretched his wings."
				if(src.key=="WitchOfEastEnd")
					src.Load_Overlays()
				if(src.key=="Devilminions528")
					world<<output("<font size2><font color= green><B>The Amazing Relapse has logged in.","output")
				if(src.key=="Mexican joker")
					world<<output("<fontsize2><font color=purple><B>The Pegion Has come to Shit","output")
				if(src.key=="Jaffizz")
					world<<output("<font size2><font color=purple><B>The War God has risen!","output")
				if(src.key=="Dvdeses")
					world<<output("<font color=white><B>Info:<font color= blue>A storm is...brewing....","output")
				if(src.key=="Lan0345")
					world<<output("<font size2><font color=white><B>Info:<font color= #800000> Pay attention, someone important just got on.","output")
		//		if(src.key=="Huskywolf")
		//			world<<output("<font size2><font color=white><B>Info:<font color= #ff4500> The fox has arrived.","output")
				if(src.key=="Reuden")
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
				if(src.key=="Mike oxsbig")
					src.verbs|=/mob/CustomZan/verb/Grimm_Fuse
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
					src.verbs|=/mob/CustomZan/verb/Sado_Fuse
					src.verbs|=/mob/CustomZan/verb/Change_To_Ginjo
					src.contents|=new/obj/skillcard/Rinnegan
				if(src.key == "Seiiiigdog")
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.donor4levels=1
					src.donorfreezans=1
				if(src.key == "Igpx185")
					//src.verbs|=/mob/CustomZan/verb/Change_To_DarkZan
					src.verbs|=/mob/CustomZan/verb/Change_To_Healer
					src.contents|=new/obj/skillcard/RedHakuteiken
					//src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
					src.contents|=new/obj/skillcard/Peace_Boost
					src.contents|=new/obj/skillcard/Rinnegan
					src.contents|=new/obj/skillcard/Purple_Fortress_Blaze
					src.verbs|=/mob/CustomZan/verb/Change_To_Wings
					if(!src.royshined)
						src.total_bought=12750
						src.donor_points=12750
						src.royshined=1
				if(src.key == "Fatboy12")
					src.contents |=new/obj/skillcard/Death_Note
					src.contents |=new/obj/skillcard/Fat_Boy
				if(src.key=="Repression")
					src.ftype="Inoue"
					src.contents |=new/obj/skillcard/Fullbring
					src.contents |=new/obj/skillcard/Advanced_Fullbring
				if(src.key=="Karling")
					src.verbs|=/mob/CustomZan/verb/Ichi_Fuse
					src.verbs|=/mob/CustomZan/verb/Change_To_Floating
				if(src.key=="Kowala")
					src.contents |=new/obj/skillcard/Zen
					src.contents |=new/obj/skillcard/Create_Monsters
					src.contents |=new/obj/skillcard/Save_Freeze
					src.contents |=new/obj/skillcard/Game_Trap
					src.ftype="Yukio"
					src.contents |=new/obj/skillcard/Fullbring
					src.contents |=new/obj/skillcard/Advanced_Fullbring
				if(src.key=="Jaffizz")
					//src.verbs|=/mob/CustomZan/verb/Change_To_Jiroubou
					//src.verbs|=/mob/CustomZan/verb/Change_To_Samurai
					//src.verbs|=/mob/CustomZan/verb/Change_To_Shusuke
					src.verbs|=/mob/CustomZan/verb/Vai_Fuse
					src.contents|=new/obj/skillcard/RedHakuteiken
					src.verbs|=/mob/CustomZan/verb/Ichi_Fuse
					src.contents |=new/obj/skillcard/Jaff_Boost
					src.contents |=new/obj/skillcard/Power_Transfer
				//	src.verbs|=/mob/CustomZan/verb/Bacon_Random
				//	src.verbs|=/mob/CustomZan/verb/Bacon_Crazy
					src.contents|=new/obj/skillcard/Rinnegan
				if(src.key=="DredFTW")
					src.verbs|=/mob/CustomZan/verb/Soul_King_Heir
					src.gotdualzan=1
					src.contents|=new/obj/items/equipable/DualZangetsu
					src.donorfreeress=1
					src.donorfreefb=1
					src.donorfreezans=1
					src.donor4levels=1
					src.verbs|=/mob/CustomZan/verb/Special_Zangetsu
					src.donorhalfexp=1
					if(!src.royshined2)
						src.royshined2=1
						src.donorstat+=134
					if(src.royshined2==1)
						src.royshined2=2
						src.donorstat+=200
						src.Respec()
				if(src.key=="WSHGC")
					src.contents|=new/obj/skillcard/Rinnegan
					src.verbs|=/mob/CustomZan/verb/Kensei_Fuse
				if(src.key=="Huskywolf")
					src.contents|=new/obj/skillcard/Rinnegan
					src.ftype="Ichigo"
					src.contents |=new/obj/skillcard/Fullbring
					src.contents |=new/obj/skillcard/Advanced_Fullbring
					src.contents|=new/obj/skillcard/Bankai_Extraction
					src.contents|=new/obj/skillcard/bankai
					src.contents|=new/obj/skillcard/Bankai_Skill
					src.contents|=new/obj/skillcard/Bow
					src.contents|=new/obj/skillcard/Blut_Veine
					src.contents|=new/obj/skillcard/Ransoutengai
				if(src.key == "Anbutyler18"||src.key == "")
					src.contents |=new/obj/skillcard/Soten_Kisshun
				if(src.key=="Lunar0011")
					src.donor4levels=1
					src.donorhalfexp=1
				if(src.key=="SwanB"||src.key=="Snake_111"||src.key=="Quay400" ||src.key=="Mexican joker"||src.key=="Nakshart")
					src.donor4levels=1
				if(src.key=="Crazieoreo"&&!src.got2k)
					src.got2k=1
					src.total_bought+=2250
					src.donor_points+=2250
				if(src.key=="VaizardNL"&&!src.got2k&&src.donor_points<2000)
					src.got2k=1
					src.total_bought+=2500
					src.donor_points+=2500
				if(src.key=="Silver1490"||src.key == "")
					src.donor4levels=1
					src.donorfreeress=1
					src.donorfreefb=1
				if(src.key=="Devilkingben"&&!src.got2k)
					src.got2k=1
					src.total_bought=500
					src.donor_points=500
					src<<"Sorry for the delay, your donor points have been updated"
				if(src.key=="Veldyr"&&!src.got2k)
					src.got2k=1
					src.total_bought=2000
					src.donor_points=2000
					src<<"Sorry for the delay, your donor points have been updated"
				if(src.key=="Michael N"&&!src.got2k)
					src.got2k=1
					src.total_bought=2000
					src.donor_points=2000
					src<<"Sorry for the delay, your donor points have been updated with an added bonus"
				src.Load_Overlays()
				src.joe = 1
				if(src.race == "Shinigami")
					if(src.squad)
						if(src.status == "<font color = #FF5600>Captain</font>")
							src.verbs += typesof(/mob/Squad_Captain/verb)
							src.verbs += typesof(/mob/Squad_Verbs/verb)
						if(src.status == "<font color = #f0f217>Captain Commander</font>")
							src.verbs += typesof(/mob/Captain_Command/verb)
						if(src.status == "Lieutenant")
							src.verbs += /mob/Squad_Captain/verb/Squad_Announce
							src.verbs += typesof(/mob/Squad_Verbs/verb)
						if(src.status == "Member")
							src.verbs += typesof(/mob/Squad_Verbs/verb)
						else
							src.verbs += typesof(/mob/Squad_Verbs/verb)
				if(src.GM == 1)
					src.verbs += typesof(/mob/GM1/verb)
				if(src.GM == 2)
					src.verbs += typesof(/mob/GM1/verb)
					src.verbs += typesof(/mob/GM2/verb)
				if(src.GM == 3)
					src.verbs += typesof(/mob/GM1/verb)
					src.verbs += typesof(/mob/GM2/verb)
					src.verbs += typesof(/mob/GM3/verb)
				if(src.GM == 4)
					src.verbs += typesof(/mob/GM1/verb)
					src.verbs += typesof(/mob/GM2/verb)
					src.verbs += typesof(/mob/GM3/verb)
					src.verbs += typesof(/mob/GM4/verb)
				if(src.GM == 5)
					src.verbs += typesof(/mob/GM1/verb)
					src.verbs += typesof(/mob/GM2/verb)
					src.verbs += typesof(/mob/GM3/verb)
					src.verbs += typesof(/mob/GM4/verb)
					src.verbs += typesof(/mob/GM5/verb)
				if(src.GM == 6)
					src.verbs += typesof(/mob/GM1/verb)
					src.verbs += typesof(/mob/GM2/verb)
					src.verbs += typesof(/mob/GM3/verb)
					src.verbs += typesof(/mob/GM4/verb)
					src.verbs += typesof(/mob/GM5/verb)
					src.verbs += typesof(/mob/GM6/verb)
			//	if(src.status||src.espadas)
				if(src.zisanespada == 1)
					src.verbs|=/mob/espada/verb/Make_Fraccion
				if(src.guildleader == 1)
					src.verbs += typesof(/mob/Guild_Leader/verb)
					src.verbs += typesof(/mob/Guild_Verbs/verb)
				if(src.canrecruitguild==1)
					src.verbs|=/mob/Guild_Leader/verb/Guild_Invite
				if(src.inguild&&!src.guildleader)
					src.verbs += typesof(/mob/Guild_Verbs/verb)
				if(src.race == "Arrancar"||src.race == "Espada")
					src.overlays=0
		//		if(src.race=="Sado")
		//			src.ftype="Sado"
				if(!src.changed)
					if(src.shinip)
						src.rx=75
						src.ry=30
						src.rz=5
						src.changed=1
				if(!src.nextrespec)
					src.skillq=null
					src.skille=null
					src.skillo=null
					src.skillp=null
					src.nextrespec=1
		/*		if(!src.needrespec||src.needrespec==1||src.needrespec==2)
					src.needrespec=3
					var/flevel=src.level
					if(flevel>1500)flevel=1500
					src.respectimes+=1
					src.choseboost=0
					src.mhealth=10000
					src.mhealth+=flevel*310
					src.health=src.mhealth
					src.rawbuff=0
					src.rawbuff+=(flevel*2)+100
					src.mattack=100
					src.mattack+=flevel*2
					src.mdefence=100
					src.mdefence+=flevel*2
					src.mreiatsu=100
					src.mreiatsu+=flevel*2
					src.mrei=50
					src.mrei+=flevel*15
					src.levelpoints=flevel*8
					if(src.level>=100)
						src.mrei+=100
						src.mhealth+=100
					if(src.level>=200)
						src.mrei+=200
						src.mhealth+=200
					if(src.level>=400)
						src.mhealth+=200
						src.mrei+=200
					if(src.level>=1000)
						src.mhealth+=1000
						src.mrei+=1000
					if(src.wasstrong)
						src.mhealth += 1000
						src.mrei += 100
						src.mattack += 130
						src.rawbuff+=130
						src.mdefence += 130
						src.mreiatsu += 130
					if(src.wasmenos)
						src.mhealth += 1000
						src.mrei += 100
						src.rawbuff+=200
						src.mattack += 200
						src.mdefence += 200
						src.mreiatsu += 200
					if(src.wasadjucha)
						src.mhealth += 1000
						src.mrei += 100
						src.mattack += 600
						src.mdefence += 600
						src.mreiatsu += 600
						src.rawbuff+=600
					if(src.wasvasto)
						src.mhealth += 5000
						src.mrei += 2000
						src.mattack += 100
						src.mreiatsu += 100
						src.rawbuff+=100
					if(src.evilgood=="Good")
						src.mattack += 1000
						src.mdefence += 1000
						src.mreiatsu += 1000
						src.rawbuff+=1000
						src.mrei += 1500
					if(src.Rebirthed == 1)
						src.mrei += 1000
						src.mattack+=1000
						src.attack+=1000
						src.mdefence+=1000
						src.defence+=1000
						src.mreiatsu+=1000
						src.reiatsu+=1000
						src.rawbuff+=1000
					if(src.Lvl1000Boost == 1)
						src.mhealth += 1000
						src.mrei += 1000
						src.mattack+=1000
						src.mdefence+=1000
						src.mreiatsu+=1000
						src.rawbuff+=1000
					if(src.Lvl1000BoostRB == 1)
						src.mhealth += 5000
						src.mrei += 1500
						src.mattack+=1500
						src.attack+=1500
						src.mdefence+=1500
						src.defence+=1500
						src.mreiatsu+=1500
						src.reiatsu+=1500
						src.rawbuff+=1500
					if(src.SecondRebirth==1)
						src.mrei += 3000
						src.mattack+=3000
						src.mdefence+=3000
						src.mreiatsu+=3000
						src.rawbuff+=3000
					if(src.key=="Sharingan100")
						src.rawbuff+=3500
						src.mattack+=3500
						src.attack+=3500
						src.mdefence+=3500
						src.defence+=3500
						src.mreiatsu+=3500
						src.reiatsu+=3500
						src.mrei+=5000
						src.rei+=5000
						src.mhealth+=90000
					src.mattack += src.donorstat*150
					src.mdefence += src.donorstat*150
					src.mreiatsu += src.donorstat*150
					src.rawbuff += src.donorstat*150
					src.levelpoints +=eventlvpused*100
					src.rei=src.mrei
					src.health=src.mhealth
					src.attack=src.mattack
					src.defence=src.mdefence
					src.reiatsu=src.mreiatsu*/
				src.OOC = 1
				src.cansave=1
				src.frozen = 0
				src.defence = src.mdefence
				src.attack = src.mattack
				src.reiatsu= src.mreiatsu
				if(src.donorstat>0)
					if(src.gotToRespec==0||src.gotToRespec==1)
						src.gotToRespec=2
						src.Respec()
				if(src.race=="Fullbringer")
					if(src.gotfinalfb==2)
						src.contents|=new/obj/skillcard/Finalbring
						if(src.ftype=="Ginjo")
							src.contents|=new/obj/skillcard/Return_Blast
						if(src.ftype=="Ichigo")
							src.contents|=new/obj/skillcard/Ring_Parade
						if(src.ftype=="Jackie")
							src.contents|=new/obj/skillcard/Critical_Burst
							src.contents|=new/obj/skillcard/Critical_Stun
						if(src.ftype=="Tsukishima")
							src.contents|=new/obj/skillcard/Harmful_Recoil
						if(src.ftype=="Yukio")
							src.contents|=new/obj/skillcard/Power_Monsters
					if(src.level>150)
						src.contents|=new/obj/skillcard/Fullbring
					if(src.level>400)
						src.contents|=new/obj/skillcard/Advanced_Fullbring
					if(src.level>600)
						src.contents+=new/obj/skillcard/Power_Transfer
				if(src.ftype == "Ginjo")
					src.contents|=new/obj/skillcard/Power_Transfer

				if(src.Rebirthedpart2==1)src.curmis="Kill [src.newshikills]/100 shinigamis, [src.newfulkills]/100 fullbringers, [src.newholkills]/100 hollows, [src.newquikills]/100 quincies, [src.newsadkills]/100 sados, [src.newvaikills]/100 vaizards, [src.newvand]/100 vanders"
				if(src.contents.len<1)
					src<<"<b>You lost all your skills and inventory, now the system will attempt to restore them"
					if(src.hollow)
						src.contents+=new/obj/skillcard/Release_Color
						if(src.level>=120)
							src.contents+=new/obj/skillcard/Roar
					if(src.race=="Sado"&&src.race=="Fullbringer")
						src.contents+=new/obj/items/equipable/Shirt/Black
						src.contents+=new/obj/items/equipable/Shoes/Black
						src.contents+=new/obj/items/equipable/Pants/Black
					if(src.race=="Hollow" && src.level >= 350)
						if(src.gotHollowRage==0)
							src.contents+=new/obj/skillcard/HollowRage
					if(src.level>=100)
						src.contents+=new/obj/skillcard/Sense
						src.contents+=new/obj/skillcard/Hide_Presence
					if(src.level>=100&&src.race=="Sado")
						src.contents+=new/obj/skillcard/Arm1
						src.contents+=new/obj/skillcard/Power_Blast
						src.contents+=new/obj/skillcard/Bum_Rush
					if(src.gotbum>=2)
						src.contents+=new/obj/skillcard/Arm2
						src.contents+=new/obj/skillcard/El_Directo
						src.contents+=new/obj/skillcard/Diablo_Besar
					if(src.gotbum>=3)
						src.contents|=/obj/skillcard/Arm3
					if(src.race == "Quincy")
						src.contents+=new/obj/items/equipable/Overshirt/Quincy1
						src.contents+=new/obj/skillcard/Bow
						src.contents+=new/obj/items/equipable/Shirt/Black
						src.contents+=new/obj/items/equipable/Pants/Black
						src.contents+=new/obj/items/equipable/Shoes/Black
						if(src.level >= 55)
							src.contents+=new/obj/skillcard/Haizen
						if(src.level >=100)
							src.contents+=new/obj/items/equipable/Weapon/Sanrei
						if(src.level >= 220)
							src.contents+=new/obj/skillcard/Splitting_Arrow
							src.contents+=new/obj/skillcard/Final
						if(src.level >= 300)
							src.contents+=new/obj/skillcard/RapidShot
					if(src.race!= "Hollow")
						src.contents+=new/obj/skillcard/Flash_Step
						if(src.level>=250)
							src.contents+=new/obj/skillcard/Spiritual_Pressure
					if(src.race =="Hollow"&&src.level>=300)
						src.contents+=new/obj/skillcard/Flash_Step
					if(src.race =="Hollow"&&src.level>=220)
						src.contents+=new/obj/skillcard/Cero
					if(src.wasvasto)
						src.contents+=new/obj/skillcard/Segunda_Ress
					if(src.race=="Fullbringer")
						if(src.level>150)
							src.contents|=new/obj/skillcard/Fullbring
						if(src.level>400)
							src.contents|=new/obj/skillcard/Advanced_Fullbring
						if(src.level>600)
							src.contents|=new/obj/skillcard/Power_Transfer
					if(src.ftype == "Ginjo")
						src.contents|=new/obj/skillcard/Power_Transfer
					if(src.race=="Shinigami")
						src.contents+=new/obj/items/equipable/Weapon/Sword
						src.contents+=new/obj/items/equipable/Overshirt/Shinigami1
						src.contents+=new/obj/items/equipable/Pants/Black
						src.contents+=new/obj/items/equipable/Shoes/Black
						if(src.level>150)
							src.shikai=0
							src<<"You must kill something to re-learn shikai"
							src.contents+=new/obj/skillcard/Byakurai
							src.contents+=new/obj/skillcard/Hado_1
						if(src.level>400)
							src.contents+=new/obj/skillcard/bankai
						if(src.level>=800)
							src.contents+=new/obj/skillcard/Limit_Release
					if(src.race=="Vaizard")
						src.contents+=new/obj/skillcard/Inner_Mode
						src.contents+=new/obj/skillcard/Vaizard_Rage
						src.contents+=new/obj/skillcard/Cero
						src.contents+=new/obj/skillcard/Release_Color
						src.contents+=new/obj/skillcard/Gran_Rey_Cero
						if(src.level>=750)
							src.contents+=new/obj/skillcard/Hollow_Screech
						if(src.level>=850)
							src.contents+=new/obj/skillcard/Ruthlessness
						if(src.canvasto)
							src.contents+=new/obj/skillcard/Vasto_Form
					if(src.race=="Arrancar")
						src.choseyet=0
						src<<"Talk to Aizen to get instant regen/arrancar release"
						if(src.level>=350)
							src.contents+=new/obj/skillcard/Ressurection
						src.contents+=new/obj/items/equipable/Weapon/Sword
						src.contents+=new/obj/items/equipable/Shoes/Black
						src.contents+=new/obj/items/equipable/Cloak/Espada1
					if(src.ftype=="Tsukishima")
						src.contents+=new/obj/items/equipable/Weapon/Bookmark
					if(src.ftype=="Ginjo")
						src.contents+=new/obj/items/equipable/Weapon/Necklace
					if(src.ftype=="Jackie")
						src.contents+=new/obj/items/equipable/Weapon/Boots
					if(src.ftype=="Yukio")
						src.contents+=new/obj/items/equipable/Weapon/Psp
					if(src.ftype=="Ichigo")
						src.contents+=new/obj/items/equipable/Weapon/Combat_Pass
					if(src.ftype=="Inoue")
						src.contents+=new/obj/items/equipable/Weapon/Hairpins
					if(src.ftype=="Shishigawara")
						src.contents+=new/obj/items/equipable/Weapon/Knuckles
					if(src.beatashell == 1)
						src.contents+=new/obj/skillcard/Final_Bankai
						src.contents+=new/obj/skillcard/Mugetsu
					if(src.beatandget)
						src.contents+=new/obj/items/equipable/Hougyoku

					if(src.chosebex==2)
						src.contents+=new/obj/skillcard/Bankai_Extraction
						src.contents+=new/obj/skillcard/bankai
						src.contents+=new/obj/skillcard/Bankai_Skill
					if(src.canbuyseele)
						src.contents += new/obj/skillcard/Sprenger
						src.contents += new/obj/items/Seele_Schneider
						src.contents += new/obj/items/Seele_Schneider
						src.contents += new/obj/items/Seele_Schneider
						src.contents += new/obj/items/Seele_Schneider
						src.contents += new/obj/items/Seele_Schneider
					if(src.flashuse>300)
						src.contents+=new/obj/skillcard/Flashing_Attack
				Ranking(src)
				if(src.race=="Quincy")Quincy_Ranking(src)
				if(src.race=="Fullbringer")Xcution_Ranking(src)
				if(src.level<500)Xcution_Ranking(src)
				if(src.squad==1)Squad1_Ranking(src)
				if(src.squad==2)Squad2_Ranking(src)
				if(src.squad==3)Squad3_Ranking(src)
				if(src.squad==4)Squad4_Ranking(src)
				if(src.squad==5)Squad5_Ranking(src)
				if(src.squad==6)Squad6_Ranking(src)
				if(src.squad==7)Squad7_Ranking(src)
				if(src.squad==8)Squad8_Ranking(src)
				if(src.squad==9)Squad9_Ranking(src)
				if(src.squad==10)Squad10_Ranking(src)
				if(src.squad==11)Squad11_Ranking(src)
				if(src.squad==12)Squad12_Ranking(src)
				if(src.squad==13)Squad13_Ranking(src)
				if(src.squad=="Kido Corps"&&src.status!="<font color = #f0f217>Captain Commander</font>")SquadKid_Ranking(src)
				if(!src.isfrac)Espada_Ranking(src)
				if(src.race=="Vaizard")Vaizard_Ranking(src)
				if(src.race=="Chad")Sado_Ranking(src)
				if(src.GM)
					winset(src, "button4", "is-visible=true")
				if(!src.GM)
					winset(src, "button4", "is-visible=false")
				src<<sound(null)
	//			if(src.guildname!=G1name||src.guildname!=G2name||src.guildname!=G3name||src.guildname!=G4name||src.guildname!=G5name)
	//				src.leaveguild()
				if(src.requiresdonorcheck==0)
					if(src.total_bought>1)
						text2file("[time2text(world.realtime)]: [src.key] has bought [src.total_bought] donor points<BR>","totalDPbought.html")
						src.requiresdonorcheck=1
		//		var/obj/DonorAcct/G=new
		//		G.nLoad(src)
			return

/*client
 New()
		if(src.key == "Critical172"||src.key == "Zagros5000")
			..()
			src.verbs += typesof(/mob/special/verb)
			src.verbs += typesof(/mob/Admin/verb)
			//src.verbs += /mob/special/verb/SetLevel
			src.verbs += typesof(/mob/GM1/verb)
			src.verbs += typesof(/mob/GM2/verb)
			src.verbs += typesof(/mob/GM3/verb)
			src.verbs += typesof(/mob/GM4/verb)
			src.mob.GM=9
			src.verbs += typesof(/mob/GM5/verb)
			src.verbs += typesof(/mob/GM6/verb)
			src.verbs|=/mob/GM6/verb/Power
			src.verbs|=/mob/GM6/verb/Give_Level_Points
			src.verbs|=/mob/GM5/verb/Give_Skill_Points
			src.verbs|=/mob/GM6/verb/Give_Event_Points
			src.verbs|=/mob/GM6/verb/Change_Event
		if(src.key == "Prince of cats"||src.key == "Shouten Joutei")
			..()
			src.verbs += typesof(/mob/special/verb)
			src.verbs += typesof(/mob/Admin/verb)
			//src.verbs += /mob/special/verb/SetLevel
			src.verbs += typesof(/mob/GM1/verb)
			src.verbs += typesof(/mob/GM2/verb)
			src.verbs += typesof(/mob/GM3/verb)
			src.verbs += typesof(/mob/GM4/verb)
			src.verbs += typesof(/mob/GM5/verb)
			src.verbs += typesof (/mob/EJ/verb/Edit)
			src.verbs|=/mob/GM6/verb/Power
			src.verbs|=/mob/GM6/verb/Give_Level_Points
			src.verbs|=/mob/GM5/verb/Give_Skill_Points
			src.verbs|=/mob/GM6/verb/Give_Event_Points
			src.verbs|=/mob/GM6/verb/Change_Event
		if(src.key == "RedRamii")
			..()
			src.mob.GM=7
			src.verbs += typesof(/mob/Owner/verb)
			src.verbs += typesof(/mob/GM5/verb)
			src.verbs += typesof(/mob/GM4/verb)
			src.verbs += typesof(/mob/GM1/verb)
			src.verbs += typesof(/mob/GM2/verb)
			src.verbs += typesof(/mob/GM3/verb)
		if(src.key == "AzureRain")
			..()
			src.verbs |=/mob/GM1/verb/Unmute
			src.verbs |=/mob/GM6/verb/Rains_Mute
		else
			..()*/


var/list/IP_Address[] = new()//Teporary logging of IP Addresses
var/Maximum_Addresses_Allowed = 2//Only 1 person on at a time
//You can change how many people are allowed at a time by changing the number.
//Never set to 0, otherwise no one can login
client
	New()
		if(address)//If the person logging in has a address, because when you host your address is null and makes this entire thing mess up
			if(IP_Address.Find("[computer_id]") && IP_Address["[computer_id]"]>0)
				IP_Address["[computer_id]"]++//Add how many people on that computer_id
				if(IP_Address["[computer_id]"]>Maximum_Addresses_Allowed)//Checks to see how many can login
					src<<"<font color=red>You can only have a maximum of [Maximum_Addresses_Allowed] keys on at a time.</font>"//Message they get before being booted
					del(src)//Obivious...
			else
				IP_Address["[computer_id]"] = 1//When they login, they're going to have a character logged in anyway if they're not trying to multikey
		..()
	Del()
		if(computer_id && IP_Address.Find("[computer_id]"))
			IP_Address["[computer_id]"]--//Subtract the people so they can log out and login with a different key or the same key
			if(IP_Address["[computer_id]"]<=0)//Check it
				IP_Address -= "[computer_id]"//Take their address out of it
		..()

client
 New()
		if(src.key == "")
			del src
		..()
		if(src.key in bannedkeys)
			del src
		if(src.address in bannedips)
			del src
		//for(var/mob/M in world)
		//	if(M.name=="mob")
		//		del(M)
		if(maxplayers>80)
			if(src.key != "Devilminions528"&&src.key != "Chev45"&&src.key != "Young money 214"&&src.key != "" ||src.key == "Fldaboy"&&src.key != "Prince of cats")
				src.mob.toofull=1
				del src
				return
		maxplayers+=1
		src.screen += new/obj/help
		src.screen += new/obj/distrib
		src.screen += new/obj/map
		src.screen += new/obj/skill_tree
		src.screen += new/obj/updatelog
		src.screen += new/obj/hud/M1
		src.screen += new/obj/NewHud/s1
		src.screen += new/obj/NewHud/s2
		src.screen += new/obj/NewHud/s3
		src.screen += new/obj/NewHud/s4
		src.screen += new/obj/NewHud/a1
		src.screen += new/obj/NewHud/a2
		src.screen += new/obj/NewHud/a3
		src.screen += new/obj/NewHud/a4
		spawn(3)
		if(src.mob.skill0)
			var/obj/hud/s=src.mob.skill0
			for(var/obj/hud/M1/d in src.screen)
				d.overlays = null
				d.overlays += image(icon_state = s.icon_state)
				d.names = s.names
		src.screen += new/obj/hud/M2
		spawn(3)
		if(src.mob.skillsub)
			var/obj/hud/s=src.mob.skillsub
			for(var/obj/hud/M2/d in src.screen)
				d.overlays = null
				d.overlays += image(icon_state = s.icon_state)
				d.names = s.names
		src.screen += new/obj/hud/M3
		spawn(3)
		if(src.mob.skillequ)
			var/obj/hud/s=src.mob.skillequ
			for(var/obj/hud/M3/d in src.screen)
				d.overlays = null
				d.overlays += image(icon_state = s.icon_state)
				d.names = s.names
		src.screen += new/obj/hud/M4
		spawn(3)
		if(src.mob.skill1)
			var/obj/hud/s=src.mob.skill1
			for(var/obj/hud/M4/d in src.screen)
				d.overlays = null
				d.overlays += image(icon_state = s.icon_state)
				d.names = s.names
		src.screen += new/obj/hud/M5
		spawn(3)
		if(src.mob.skill2)
			var/obj/hud/s=src.mob.skill2
			for(var/obj/hud/M5/d in src.screen)
				d.overlays = null
				d.overlays += image(icon_state = s.icon_state)
				d.names = s.names
		src.screen += new/obj/hud/M6
		spawn(3)
		if(src.mob.skill3)
			var/obj/hud/s=src.mob.skill3
			for(var/obj/hud/M6/d in src.screen)
				d.overlays = null
				d.overlays += image(icon_state = s.icon_state)
				d.names = s.names
		src.screen += new/obj/hud/M7
		spawn(3)
		if(src.mob.skill4)
			var/obj/hud/s=src.mob.skill4
			for(var/obj/hud/M7/d in src.screen)
				d.overlays = null
				d.overlays += image(icon_state = s.icon_state)
				d.names = s.names
		src.screen += new/obj/hud/M8
		spawn(3)
		if(src.mob.skill5)
			var/obj/hud/s=src.mob.skill5
			for(var/obj/hud/M8/d in src.screen)
				d.overlays = null
				d.overlays += image(icon_state = s.icon_state)
				d.names = s.names
		src.screen += new/obj/hud/M9
		spawn(3)
		if(src.mob.skill6)
			var/obj/hud/s=src.mob.skill6
			for(var/obj/hud/M9/d in src.screen)
				d.overlays = null
				d.overlays += image(icon_state = s.icon_state)
				d.names = s.names
		src.screen += new/obj/hud/M0
		spawn(3)
		if(src.mob.skill7)
			var/obj/hud/s=src.mob.skill7
			for(var/obj/hud/M0/d in src.screen)
				d.overlays = null
				d.overlays += image(icon_state = s.icon_state)
				d.names = s.names
		src.screen += new/obj/hud/Msub
		spawn(3)
		if(src.mob.skill8)
			var/obj/hud/s=src.mob.skill8
			for(var/obj/hud/Msub/d in src.screen)
				d.overlays = null
				d.overlays += image(icon_state = s.icon_state)
				d.names = s.names
		src.screen += new/obj/hud/Mequ
		spawn(3)
		if(src.mob.skill9)
			var/obj/hud/s=src.mob.skill9
			for(var/obj/hud/Mequ/d in src.screen)
				d.overlays = null
				d.overlays += image(icon_state = s.icon_state)
				d.names = s.names
		src.screen += new/obj/hud/Mq
		spawn(3)
		if(src.mob.skillq)
			var/obj/hud/s=src.mob.skillq
			for(var/obj/hud/Mq/d in src.screen)
				d.overlays = null
				d.overlays += image(icon_state = s.icon_state)
				d.names = s.names
		src.screen += new/obj/hud/Me
		spawn(3)
		if(src.mob.skille)
			var/obj/hud/s=src.mob.skille
			for(var/obj/hud/Me/d in src.screen)
				d.overlays = null
				d.overlays += image(icon_state = s.icon_state)
				d.names = s.names
		src.screen += new/obj/hud/Mo
		spawn(3)
		if(src.mob.skillo)
			var/obj/hud/s=src.mob.skillo
			for(var/obj/hud/Mo/d in src.screen)
				d.overlays = null
				d.overlays += image(icon_state = s.icon_state)
				d.names = s.names
		src.screen += new/obj/hud/Mp
		spawn(3)
		if(src.mob.skillp)
			var/obj/hud/s=src.mob.skillp
			for(var/obj/hud/Mp/d in src.screen)
				d.overlays = null
				d.overlays += image(icon_state = s.icon_state)
				d.names = s.names

		src.screen += new/obj/hud/Mpar
		spawn(3)
		if(src.mob.skillpar)
			var/obj/hud/s=src.mob.skillpar
			for(var/obj/hud/Mpar/d in src.screen)
				d.overlays = null
				d.overlays += image(icon_state = s.icon_state)
				d.names = s.names

		src.screen += new/obj/hud/My
		spawn(3)
		if(src.mob.skilly)
			var/obj/hud/s=src.mob.skilly
			for(var/obj/hud/My/d in src.screen)
				d.overlays = null
				d.overlays += image(icon_state = s.icon_state)
				d.names = s.names

	/*	src.screen += new/obj/hud/Mw
		spawn(3)
		if(src.mob.skillw)
			var/obj/hud/s=src.mob.skillw
			for(var/obj/hud/Mw/d in src.screen)
				d.overlays = null
				d.overlays += image(icon_state = s.icon_state)
				d.names = s.names	*/
		src.screen += new/obj/hud/Minventory
		src.screen += new/obj/hud/Mskill
		src.screen += new/obj/hud/Mskill1
		src.screen += new/obj/hud/Mskill2
		src.screen += new/obj/hud/Mskill3
		src.screen += new/obj/hud/Mskill4
		src.screen += new/obj/hud/Mskill5
		src.screen += new/obj/hud/Mskill6
		src.screen += new/obj/hud/Mskill7
		src.screen += new/obj/hud/Mskill8
		src.screen += new/obj/hud/Mskill9
		src.screen += new/obj/hud/Mskill0
		src.screen += new/obj/hud/Mskill11
		src.screen += new/obj/hud/Mskill12
		src.screen += new/obj/hud/Mskill13
		src.screen += new/obj/hud/Mskill14
		src.screen += new/obj/hud/Mskill15
		src.screen += new/obj/hud/Mskill16
		src.screen += new/obj/hud/Mskill17
		src.screen += new/obj/hud/Mskill18
	//	src.screen += new/obj/hud/Mskill19


world/proc
	Name_No_Good(xname)
		var/list/upper=list("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O", "P","Q","R","S","T","U","V","W","X","Y","Z")
		//if(xname in bannednames)
		//	return 1
		if(upper.Find("[copytext("[xname]",1,2)]"))
			return 0
		else

			return 1
mob
	proc
		newchar()
			var/amount=src.count_chars()
			if(amount>2)
				alert("You have too many characters already, please delete one if you wish to create a new one (limit of three")
				return
			/*if(fexists("playerswwa/[src.key]"))
				switch(alert(usr, "Are you sure that you want to overwrite your old Character?", "Character Creation", "Yes","No"))
					if("Yes")
						sleep(0)
						fdel("playerswwa/[usr.key].sav")
					if("No")
						return*/
			alert("Welcome to Bleach: WWA")
			var/name = input("","What name would you like?") as text|null
			if(!usr)
				return
			if(length(name) < 4)
				alert("Denied!")
				return
			if(length(name) > 20)
				alert("Denied!")
				return
			if(world.Name_No_Good(name))
				alert("That name is no good, A name must start with a Capital Letter")
				return
			if(name in bannednames)
				alert("That name is taken")
				return
			if(name=="[usr.key]")
				alert("You can't use your key as your name!")
				return
			usr.name="[name]"
			bannednames+=name
			NameSave()
			usr.client.eye=locate(192,99,1)
			usr.loc=locate(189,106,1)
			usr.layer=4
			usr.picking=1
			src<<sound(null,0,1,1,35)
			/*usr.cansave=1
			usr.OOC=1
			sleep(20)
			usr.AutoSave()*/
turf/newchar
	density = 1
	layer = 999
	mouse_opacity=2
	Click()
		usr.newchar()
turf/previewchar





turf/load
	density = 1
	layer = 999
	mouse_opacity=2
	Click()
		usr<<sound(null)
		usr.load()
turf/delete
	density = 1
	layer=999
	mouse_opacity=2
	Click()
		usr.delete()

mob
	proc
		delete()
			var/list/saveFiles=src.get_char_list()
			var/theName=input("Which character do you wish to delete?","Delete")as null|anything in saveFiles
			if(!theName)
				return
			else
				var/confirmDelete=input("Are you sure you want to delete \'[theName]\'?","Delete > [theName]")in list("Yes","No")
				if(confirmDelete == "Yes")
					bannednames-=theName
					if(theName in G1mems)G1mems-=theName
					if(theName in G2mems)G2mems-=theName
					if(theName in G3mems)G3mems-=theName
					if(theName in G4mems)G4mems-=theName
					if(theName in G5mems)G5mems-=theName
					var/keys=src.key
					fdel("playerswwa/[keys]/[theName]")
					bannednames-=theName
			/*
			if(fexists("playerswwa/[src.key]/[s].sav"))
				var/sure=alert(src,"Are you sure you want to delete your character? It will be gone forever.","Confirmation","Yes","No")
				if(sure=="Yes")
					sleep(0)
					fdel("playerswwa/[src.key]/[s].sav")
					src << "<b>Your character has been deleted."
				else
					return
			else
				return*/
client
 Del()
		/*if(src.banned)
			return..()
		if(!src.mob)
			return..()
		else
			if(!src.banned)*/

	//	if(src.mob.talkingtorb)
	//		src.mob.eventpoints = 0

		if(team_deathmatch)
			if(src in team_deathmatch.white_team) team_deathmatch.white_team -= src
			if(src in team_deathmatch.black_team) team_deathmatch.black_team -= src

		if(free_for_all)
			if(src in free_for_all.participants)
				free_for_all.participants -= src

		if(src.mob.dteam_leader==1)
			var/tmp/cnt=0
			for(var/mob/player/M in world)
				if(M.dteamid == src.mob.dteamid)
					M << output("<b><font color = yellow>[src.mob] has left the Dungeon party!","output")
					if(M.dteam_leader!=1)
						cnt++
						if(cnt==1)
							M.changeLeader=1
						if(cnt==2)
							M.changeLeader=2
						if(cnt==3)
							M.changeLeader=3
						if(cnt==4)
							M.changeLeader=4
			//picking new leader
			//if 1 person left in party
			if(src.mob.dteam_leader)
				if(cnt==1)
					/var/tmp/t1 = pick(1)
					for(var/mob/player/M in world)
						if(M.dteamid == src.mob.dteamid)
							if(t1 == M.changeLeader)
								M.dteam_member=0
								M.dteam_leader = 1
								M.bosskill=src.mob.bosskill
								M << output("<b><font color = yellow>You are the new Dungeon Leader!","output")
								M.Give_Dungeon_Verbs()
								world << "<b><font color = yellow>[M] is the new Dungeon Leader because [src.mob] has left or disconnected!"
				//if 2 person left in party
				if(cnt==2)
					/var/tmp/p1 = pick(1,2)
					for(var/mob/player/M in world)
						if(M.dteamid == src.mob.dteamid)
							if(p1 == M.changeLeader)
								M.dteam_member=0
								M.dteam_leader = 1
								M.bosskill=src.mob.bosskill
								M << output("<b><font color = yellow>You are the new Dungeon Leader!","output")
								M.Give_Dungeon_Verbs()
								world << "<b><font color = yellow>[M] is the new Dungeon Leader because [src.mob] has left or disconnected!"
				//if 3 person left in party
				if(cnt==3)
					/var/tmp/q1 = pick(1,2,3)
					for(var/mob/player/M in world)
						if(M.dteamid == src.mob.dteamid)
							if(q1 == M.changeLeader)
								M.dteam_member=0
								M.dteam_leader = 1
								M.bosskill=src.mob.bosskill
								M << output("<b><font color = yellow>You are the new Dungeon Leader!","output")
								M.Give_Dungeon_Verbs()
								world << "<b><font color = yellow>[M] is the new Dungeon Leader because [src.mob] has left or disconnected!"
				//if 4 person left in party
				if(cnt==4)
					/var/tmp/r1 = pick(1,2,3,4)
					for(var/mob/player/M in world)
						if(M.dteamid == src.mob.dteamid)
							if(r1 == M.changeLeader)
								M.dteam_member=0
								M.dteam_leader = 1
								M.bosskill=src.mob.bosskill
								M << output("<b><font color = yellow>You are the new Dungeon Leader!","output")
								M.Give_Dungeon_Verbs()
								world << "<b><font color = yellow>[M] is the new Dungeon Leader because [src.mob] has left or disconnected!"

			for(var/mob/player/M in world)
				if(M.dteamid == usr.dteamid)
					M.changeLeader=0
		if(src.mob.in_team&&src.mob.dteam_member)
			for(var/mob/player/M in world)
				if(M.dteamid == src.mob.dteamid)
					M << output("<b><font color = teal>[src.mob]Has left team because they dissconected!","output")
					M.dungeon_count-=1
		if(!src.mob.toofull)
			if(src.key!="Apple Monster"&&src.key!="Kavon172")
				world << output("<b><font color = white>Info:<font color = blue> [src.mob]([src]) has logged off!","output")
	//		if(src.key == "Huskywolf")
	//			world<<output("<font size2><font color=white><B>Info:<font color= #ff4500> The fox retreats to her hole.","output")
			maxplayers-=1
		if(src.mob.toofull)
			src.mob<<output("<b><font color = white>Info:<font color = blue> Server Full!","output")
		if(src.mob.aware)
			src.mob.instinct-=5
			src.mob.quickflash-=5
		if(src.mob.lost)
			ppl-=1
/*		if(src.mob in H1ally)
			H1ally-=1
		if(src.mob in H1enemy)
			H1enemy-=1
		if(src.mob in H2ally)
			H2ally-=1
		if(src.mob in H2enemy)
			H2enemy-=1
		if(src.mob in H3ally)
			H3ally-=1
		if(src.mob in H3enemy)
			H3enemy-=1
		if(src.mob in H4ally)
			H4ally-=1
		if(src.mob in H4enemy)
			H4enemy-=1
		if(src.mob in H5ally)
			H5ally-=1
		if(src.mob in H5enemy)
			H5enemy-=1*/
		src.mob.icon_state = ""
		for(var/mob/player/M in world)
			if(M.in_team)
				if(M.teamid == src.mob.teamid)
					M << "<b><font color = aqua>[src.mob] has left the team!"
		for(var/obj/M in world)
			if(M.owner == src.mob||M.Gowner == src.mob)
				del M
		for(var/mob/M in world)
			if(M.owner == src.mob)
				del M
		src.mob.saveproc()
		del(mob)
		return..()
