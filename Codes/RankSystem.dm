var
	list/shiniCaptainList = list(()=0, ("1")="",("2")="",("3")="",("4")="",("5")="",("6")="",("7")="",("8")="",("9")="",("10")="",("11")="",("12")="",("13")="",("Kido Corps")="")
	list/activeRankList = list(("Spirit King")="",("DemiGod")="",("Karakura Hero")=0,("King of Hueco Mundo")="",("Rey Diablo")="",("Emperor of the Wandenreich")="",("Sternritter Grandmaster")="",("Espada Leader")="")
	var/maxKTH=10
	tmp/currentRankTest=""
	tmp/currentPlayerTest=""
	tmp/testGoteiLeft=0



mob

	Rank_Guide
		name = "{NPC}Rank Tester"
		npc = 1
		New()
			..()
			src.ClothesGen()
			src.HairGen()
			src.Load_Overlays()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				var/npcName = "{NPC}Rank Tester: "
				if(usr.waitForRankTest&&(world.realtime-usr.waitForRankTest)/432000 < 1)
					usr<<"[npcName]You need to wait 12 hours before taking this test again"
					return
				usr.waitForRankTest=0
				if(usr.level<500)
					usr<<"[npcName]You need to be atleast level 500 before you can take any test!"
					return
				if(currentRankTest||currentPlayerTest)
					usr<<"[npcName]Unfortunately, we cannot let you in at this time."
					for(var/mob/M in All_Clients())
						if(M.key == currentPlayerTest)
							usr<<"[npcName][M] is currently taking the [currentRankTest] test."
							return
					resetRankTest()
					usr<<"[npcName]It seems I was mistaken, contact Throm about this and please continue your test!"
				if(usr.race != "Shinigami" && usr.race != "Sado"&& usr.race != "Chad" && usr.race != "Quincy" && usr.race != "Fullbringer" && usr.race != "Vaizard" && usr.race != "Arrancar")
					usr<<"[npcName]There is no exam for hollows yet"
					return

				var/list/availableRank= new

				//Shinigami
				if(usr.race == "Shinigami")
					if(usr.squad==0)
						if(activeRankList["Spirit King"])
							usr<<"There is already a Spirit King"
							return
						availableRank += "Spirit King"
					if(!usr.iscaptain&&!usr.squad)
						usr<<"[npcName]You need to be in a Squad before you can take a test!"
						return
					if(!usr.iscaptain&&usr.squad!=1&&usr.squad!=0)
						if(shiniCaptainList["[usr.squad]"])
							usr<<"[npcName]Unfortunately, there already exists a Captain for your squad, and you must be a Captain before you can take any other test"
							return
						availableRank += "Captain"
					if(!usr.iscaptaincommander&&usr.iscaptain&&usr.squad!=1&&usr.squad!=0||usr.squad==1)
						if(shiniCaptainList["1"])
							usr<<"[npcName]Though you meet the reuqirements to take on the Captain Commander test, I cannot give you the test when one already exists."
							return
						availableRank += "Captain Commander"
					if(usr.iscaptain)
						availableRank += "Squad 0"
					if(usr.iscaptaincommander&&!activeRankList["Spirit King"])
						availableRank += "Spirit King"

				if(usr.race == "Arrancar")
					if(!activeRankList["King of Hueco Mundo"])
						availableRank += "King of Hueco Mundo"
					if(!activeRankList["Espada Leader"]&&!usr.isEspadaLeader)
						availableRank += "Espada Leader"

				if(usr.earth)
					if(usr.karakuraheroplayer&&!activeRankList["DemiGod"])
						availableRank += "DemiGod"
					if(!usr.karakuraheroplayer&&!usr.humanleader&&activeRankList["Karakura Hero"]<=3)
						availableRank += "Karakura Hero"
					if(usr.race == "Quincy")
						if(!usr.issternrleader&&!activeRankList["Sternritter Grandmaster"])
							availableRank += "Sternritter Grandmaster"
						if(usr.issternrleader&&!usr.newquincyking&&!activeRankList["Emperor of the Wandenreich"])
							availableRank += "Emperor of the Wandenreich"
					if(usr.race == "Sado"||usr.race == "Chad")
						if(!activeRankList["Rey Diablo"])
							availableRank += "Rey Diablo"

				availableRank += "Cancel"

				var/U=input("Which test do you want to take?", text) in availableRank
				if(U=="Cancel")
					return
				currentRankTest=U
				startTest(usr)
				return
	proc
		resetRankTest()
			currentRankTest=""
			currentPlayerTest=""
			testGoteiLeft=0
			for(var/mob/Test_Gotei_13/m in world)
				del(m)

	proc
		makeCaptainCommander(mob/M)
			if(usr.lock)
				return
			//Check to make sure non shinigamis don't abuse the system
			if(M.race == "Shinigami")
				world << "<b><font color = aqua>Upgrade Info: [M] is now a Captain Commander!"
				M.status = "<font color = #f0f217>Captain Commander</font>"
				M.statusold = "<font color = #f0f217>Captain Commander</font>"
				M.iscaptain=1
				M.iscaptaincommander=1
				M.squad=null
				M.verbs += typesof(/mob/Captain_Command/verb)
				M.contents+=new/obj/items/equipable/Cloak/Captain2
				M.contents+=new/obj/items/equipable/Cloak/Captain1
				M.updateInventory()
				shiniCaptainList["1"]=M.key

	proc
		makeCaptain(mob/M)
			if(M.race == "Shinigami")
				if(M.squad==1||M.iscaptain&&M.squad!=1&&M.squad)
					makeCaptainCommander(M)
				else
					if(!M.squad)
						M<<"You need to be in a squad to become the captain!"
					if(shiniCaptainList["[M.squad]"])
						M<<"A captain already exists for squad: [M.squad]"
						return
					world << "<b><font color = aqua>Upgrade Info: [M] is now a Captain"
					M.status = "<font color = #FF5600>Captain</font>"
					M.statusold="<font color = #FF5600>Captain</font>"
					shiniCaptainList["[M.squad]"] = M.key
					M.iscaptain=1
					M.rep+=1000
					M.contents+=new/obj/items/equipable/Cloak/Captain2
					M.contents+=new/obj/items/equipable/Cloak/Captain1
					M.verbs += typesof(/mob/Squad_Captain/verb)
					M.verbs += typesof(/mob/Squad_Verbs/verb)
	proc
		removeRank(mob/M)
			M.status = ""
			M.statusold=""
			var/rank
			for(rank in activeRankList)
				if(activeRankList[rank]==M.key)
					activeRankList[rank]=""
			for(rank in shiniCaptainList)
				if(shiniCaptainList[rank]==M.key)
					shiniCaptainList[rank]=""
			for(var/obj/items/equipable/Cloak/K in M)
				del K
				M.cloak=0
				M.Load_Overlays()
			M.rep-=5000
			if(M.humanleader)
				M.humanleader=0
				activeRankList["DemiGod"]=""
			if(M.karakuraheroplayer)
				M.karakuraheroplayer=0
				activeRankList["Karakura Hero"]--
			if(M.newhollowking)
				M.newhollowking=0
			if(M.isEspadaLeader)
				M.isEspadaLeader=0
			if(M.newsadoking)
				M.newsadoking=0
			if(M.newquincyking)
				M.newquincyking=0
			if(M.isspirit)
				M.isspirit=0
			if(M.issternr)
				M.issternr=0
			if(M.issternrleader)
				M.issternrleader=0
			if(M.iscaptain&&shiniCaptainList["[M.squad]"]==M.key)
				shiniCaptainList["[M.squad]"]=""
				M.iscaptain=0
			if(M.iscaptain&&shiniCaptainList["1"]==M.key)
				shiniCaptainList["1"]=""
				M.iscaptain=0
				M.iscaptaincommander=0
			M.verbs -= typesof(/mob/spiritking/verb)
	proc
		giveRank(rank)
			if(rank)
				src.waitForRankTest=0
				removeRank(src)
			if(rank == "Captain")
				makeCaptain(src)
				return
			if(rank == "Captain Commander")
				makeCaptain(src)
				return
			if(rank=="DemiGod")
				world << "<b><font color = red><font size=2>Earth News: [src] is now a Demi-God"
				src.humanleader=1
				activeRankList[rank] = src.key
				src.status="<font color=purple>Demi-God</font>"
				src.statusold="<font color=purple>Demi-God</font>"
				src.espadas=""
				src.espadasold=""
				src.contents+=new/obj/items/equipable/Cloak/Squad0
				return
			if(rank=="Karakura Hero")
				world << "<b><font color = red><font size=2>Earth News: [src] is now a Karakura Hero"
				src.karakuraheroplayer=1
				activeRankList[rank] = activeRankList[rank] + 1
				src.status="<font color=green>Karakura Hero</font>"
				src.statusold="<font color=green>Karakura Hero</font>"
				src.espadas=""
				src.espadasold=""
				src.contents+=new/obj/items/equipable/Cloak/Squad0
				return
			if(rank=="Spirit King")
				world << "<b><font color = red><font size=2>Soul Society News: [src] is now the king of Seireitei"
				src.squad=0
				activeRankList[rank] = src.key
				src.status="<font color= #e68a51>Spirit King</font>"
				src.statusold="<font color= #e68a51>Spirit King</font>"
				src.isspirit=1
				src.espadas=""
				src.espadasold=""
				src.contents+=new/obj/items/equipable/Cloak/Squad0
				src.verbs += typesof(/mob/spiritking/verb)
				return
			if(rank=="King of Hueco Mundo")
				world << "<b><font color = red><font size=2>[src] is now the King of Hueco Mundo"
				src.newhollowking=1
				activeRankList[rank] = src.key
				src.status="<font color=red>King of Hueco Mundo</font>"
				src.statusold="<font color=red>King of Hueco Mundo</font>"
				src.espadas=""
				src.espadasold=""
				return
			if(rank=="Espada Leader")
				world << "<b><font color = yellow><font size=2>[src] now leads the Espadas"
				src.isEspadaLeader=1
				activeRankList[rank] = src.key
				src.status="<font color=yellow>Espada Leader</font>"
				src.statusold="<font color=yellow>Espada Leader</font>"
				src.espadas=""
				src.espadasold=""
				return

			if(rank=="Rey Diablo")
				world << "<b><font color = red><font size=2>[src] is now the Sado King"
				src.newsadoking=1
				src.status="<font color= white>Rey Diablo</font>"
				src.statusold="<font color= white>Rey Diablo</font>"
				src.espadas=""
				src.espadasold=""
				activeRankList[rank] = src.key
				return
			if(rank=="Emperor of the Wandenreich")
				world << "<b><font color = red><font size=2>[src] is now the Emperor of the Wandenreich"
				src.newquincyking=1
				src.status="<font color= #1ac7c7>Quincy Emperor - The Almighty</font>"
				src.statusold="<font color= #1ac7c7>Quincy Emperor - The Almighty</font>"
				src.espadas=""
				src.espadasold=""
				activeRankList[rank] = src.key
				return
			if(rank=="Sternritter Grandmaster")
				world << "<b><font color = red><font size = 2> [src] is now the Sternritter Grandmaster"
				src.issternrleader=1
				src.status="<font color=#1ac7c7>Sternritter Grandmaster</font>"
				src.statusold="<font color=#1ac7c7>Sternritter Grandmaster</font>"
				src.espadas=""
				src.espadasold=""
				activeRankList[rank] = src.key
				return
			if(rank=="Squad 0")
				world << "<b><font color = red>Soul Society News: [src] is now a member of Squad Zero"
				src.squad=0
				src.iscaptain=1
				src.status="<font color=purple>Member of Squad Zero</font>"
				src.contents+=new/obj/items/equipable/Cloak/Squad0
				src.updateInventory()



	proc
		giveCaptainTest(mob/M)
			if(usr.lock)
				return
			if(M.race != "Shinigami")
				M<<"You cannot take the test for captains! Please contact Throm."
			if(shiniCaptainList["1"]==M.key)
				//Give Sq0 test
				M<<"Time for Squad 0 test "
			if(M.squad==1||M.iscaptain&&M.squad!=1&&M.squad)
				if(shiniCaptainList["1"])
					M<<"<b>There is already a Captain Commander!"
					return
				if(M.squad==1)
					M<<"<b>Because you have chosen the path of Squad 1, the test you will take is the Captain Commander test, brace yourself!"
				else
					M<<"<b>You have already attained the power of a captain, all that is left is for you to become the captain commander!"
				currentRankTest="Captain Commander"
				//Give CC test
			else
				if(!shiniCaptainList["[M.squad]"])
					M<<"<b>You will now be teleported to the testing arena."
					currentRankTest="Captain"
					//Give Captain test for squad
				else
					M<<"<b>A Captain already exists for squad [M.squad]."
					return
			startTest(M)


	proc
		startTest(mob/M)
			if(currentPlayerTest)
				usr<<"There seems to be technical difficulties with starting your test, please wait."
				for(var/mob/K in All_Clients())
					if(K.key == currentPlayerTest)
						usr<<"Unfortunately, [K] is currently taking the [currentRankTest] test."
						return
			M.loc=locate(31,165,21)
			currentPlayerTest=M.key
			M.RemoveDonorStats()
			M<<"Prepare yourself, your exam begins in 30 seconds. To truly test your abilities, we will be strpiping any extra stat boosts you may have earned."
			sleep(200)
			world<<"<b><font color=blue>[M] is about to take the test for [currentRankTest] which starts in 10 seconds"
			M.hiding=0
			M<<"The test will begin in 10 seconds."
			sleep(50)
			M<<"5"
			sleep(10)
			M<<"4"
			sleep(10)
			M<<"3"
			sleep(10)
			M<<"2"
			sleep(10)
			M<<"1"
			sleep(10)
			M<<"BEGIN!"
			M.waitForRankTest=world.realtime

			M.loc=locate(31,165,21)
			//Spawn the tests
			if(currentRankTest=="Captain")
				testGoteiLeft=1
				if(M.squad==1)
					M<<"Due to technical issues, your test has been postponed. Contact Throm for further assistance"
					return;
				if(M.squad==2)
					new/mob/Test_Gotei_13/C2(locate(31,168,21))
				if(M.squad==3)
					new/mob/Test_Gotei_13/C3(locate(31,168,21))
				if(M.squad==4)
					new/mob/Test_Gotei_13/C4(locate(31,168,21))
				if(M.squad==5)
					new/mob/Test_Gotei_13/C5(locate(31,168,21))
				if(M.squad==6)
					new/mob/Test_Gotei_13/C6(locate(31,168,21))
				if(M.squad==7)
					new/mob/Test_Gotei_13/C7(locate(31,168,21))
				if(M.squad==8)
					new/mob/Test_Gotei_13/C8(locate(31,168,21))
				if(M.squad==9)
					new/mob/Test_Gotei_13/C9(locate(31,168,21))
				if(M.squad==10)
					new/mob/Test_Gotei_13/C10(locate(31,168,21))
				if(M.squad==11)
					new/mob/Test_Gotei_13/C11(locate(31,168,21))
				if(M.squad==12)
					new/mob/Test_Gotei_13/C12(locate(31,168,21))
				if(M.squad==13)
					new/mob/Test_Gotei_13/C13(locate(31,168,21))
				if(M.squad=="Kido Corps")
					new/mob/Test_Gotei_13/C13(locate(31,168,21))

			if(currentRankTest=="Captain Commander"||currentRankTest=="Karakura Hero"||currentRankTest=="Sternritter Grandmaster"||currentRankTest=="Espada Leader")
				testGoteiLeft=12
				new/mob/Test_Gotei_13/C1(locate(31,168,21))
				new/mob/Test_Gotei_13/C2(locate(28,168,21))
				new/mob/Test_Gotei_13/C3(locate(27,168,21))
				new/mob/Test_Gotei_13/C4(locate(30,168,21))
				new/mob/Test_Gotei_13/C5(locate(26,168,21))
				new/mob/Test_Gotei_13/C6(locate(33,168,21))
				new/mob/Test_Gotei_13/C7(locate(25,168,21))
				new/mob/Test_Gotei_13/C8(locate(29,168,21))
				new/mob/Test_Gotei_13/C9(locate(24,168,21))
				new/mob/Test_Gotei_13/C10(locate(34,168,21))
				new/mob/Test_Gotei_13/C11(locate(35,168,21))
				new/mob/Test_Gotei_13/C12(locate(32,168,21))
			if(currentRankTest=="DemiGod"||currentRankTest=="Emperor of the Wandenreich"||currentRankTest=="Rey Diablo"||currentRankTest=="King of Hueco Mundo"||currentRankTest=="Squad 0")
				testGoteiLeft=18
				new/mob/Test_Gotei_13/C1(locate(31,168,21))
				new/mob/Test_Gotei_13/C2(locate(28,168,21))
				new/mob/Test_Gotei_13/C3(locate(27,168,21))
				new/mob/Test_Gotei_13/C4(locate(30,168,21))
				new/mob/Test_Gotei_13/C5(locate(26,168,21))
				new/mob/Test_Gotei_13/C6(locate(33,168,21))
				new/mob/Test_Gotei_13/C7(locate(25,168,21))
				new/mob/Test_Gotei_13/C8(locate(29,168,21))
				new/mob/Test_Gotei_13/C9(locate(24,168,21))
				new/mob/Test_Gotei_13/C10(locate(34,168,21))
				new/mob/Test_Gotei_13/C11(locate(35,168,21))
				new/mob/Test_Gotei_13/C12(locate(32,168,21))
				new/mob/Test_Gotei_13/C13(locate(36,168,21))
				new/mob/Test_Gotei_13/C1(locate(37,168,21))
				new/mob/Test_Gotei_13/C2(locate(38,168,21))
				new/mob/Test_Gotei_13/C3(locate(39,168,21))
				new/mob/Test_Gotei_13/C4(locate(31,169,21))
				new/mob/Test_Gotei_13/C5(locate(23,168,21))
			if(currentRankTest=="Spirit King")
				testGoteiLeft=26
				new/mob/Test_Gotei_13/C1(locate(31,168,21))
				new/mob/Test_Gotei_13/C2(locate(28,168,21))
				new/mob/Test_Gotei_13/C3(locate(27,168,21))
				new/mob/Test_Gotei_13/C4(locate(30,168,21))
				new/mob/Test_Gotei_13/C5(locate(26,168,21))
				new/mob/Test_Gotei_13/C6(locate(33,168,21))
				new/mob/Test_Gotei_13/C7(locate(25,168,21))
				new/mob/Test_Gotei_13/C8(locate(29,168,21))
				new/mob/Test_Gotei_13/C9(locate(24,168,21))
				new/mob/Test_Gotei_13/C10(locate(34,168,21))
				new/mob/Test_Gotei_13/C11(locate(35,168,21))
				new/mob/Test_Gotei_13/C12(locate(32,168,21))
				new/mob/Test_Gotei_13/C13(locate(36,168,21))
				new/mob/Test_Gotei_13/C1(locate(31,167,21))
				new/mob/Test_Gotei_13/C2(locate(28,167,21))
				new/mob/Test_Gotei_13/C3(locate(27,167,21))
				new/mob/Test_Gotei_13/C4(locate(30,167,21))
				new/mob/Test_Gotei_13/C5(locate(26,167,21))
				new/mob/Test_Gotei_13/C6(locate(33,167,21))
				new/mob/Test_Gotei_13/C7(locate(25,167,21))
				new/mob/Test_Gotei_13/C8(locate(29,167,21))
				new/mob/Test_Gotei_13/C9(locate(24,167,21))
				new/mob/Test_Gotei_13/C10(locate(34,167,21))
				new/mob/Test_Gotei_13/C11(locate(35,167,21))
				new/mob/Test_Gotei_13/C12(locate(32,167,21))
				new/mob/Test_Gotei_13/C13(locate(36,167,21))