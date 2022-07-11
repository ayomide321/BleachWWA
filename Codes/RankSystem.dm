var
	list/shiniCaptainList = list(("1")="",("2")="",("3")="",("4")="",("5")="",("6")="",("7")="",("8")="",("9")="",("10")="",("11")="",("12")="",("13")="",("Kido Corps")="")
	list/activeRankList = list(("Spirit King")="",("DemiGod")="",("Karakura Hero")=0,("King of Hueco Mundo")="",("Rey Diablo")="",("Emperor of the Wandenreich")="",("Sternritter Grandmaster")="")
	tmp/currentRankTest=""
	tmp/currentPlayerTest=""
	tmp/testGoteiLeft=0



mob

	Rank_Guide
		name = "{NPC}Rank Tester"
		npc = 1
		New()
			..()
		verb
			Talk()
				set category = "NPC's"
				set src in oview(2)
				var/rankTest
				var/rankAdd
				var/npcName = "{NPC}Rank Tester: "
				if(usr.waitForRankTest&&(world.realtime-usr.waitForRankTest)/432000 < 1)
					usr<<"[npcName]You need to wait 12 hours before taking this test again"
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
				if(usr.race != "Shinigami" && usr.race != "Sado"&& usr.race != "Chad" && usr.race == "Quincy" && usr.race == "Fullbringer")
					usr<<"[npcName]There is no exam for hollows yet"
				if(usr.race == "Shinigami")
					if(!usr.iscaptain&&!usr.squad)
						usr<<"[npcName]You need to be in a Squad before you can take a test!"
						return
					if(!usr.iscaptain&&usr.squad!=1&&usr.squad!=0)
						if(shiniCaptainList["[usr.squad]"])
							usr<<"[npcName]Unfortunately, there already exists a Captain for your squad, and you must be a Captain before you can take any other test"
							return
						rankTest = "Captain"
						rankAdd = " of Squad: [usr.squad]"
					if(usr.iscaptain&&usr.squad!=1&&usr.squad!=0||usr.squad==1)
						if(shiniCaptainList["1"])
							usr<<"[npcName]Though you meet the reuqirements to take on the Captain Commander test, I cannot give you the test when one already exists."
							return
						rankTest = "Captain Commander"
				if(usr.race == "Sado"||usr.race == "Chad"||usr.race == "Quincy"||usr.race == "Fullbringer")
					var/list/availableRank= new
					if(usr.karakuraheroplayer&&!activeRankList["DemiGod"])
						availableRank += "DemiGod"
					if(!usr.karakuraheroplayer&&!usr.humanleader&&activeRankList["Karakura Hero"]<3)
						availableRank += "Karakura Hero"

					availableRank += "Cancel"
					var/U=input("Which test do you want to take?", text) in availableRank
					if(U=="Cancel")
						return
					currentRankTest=U
					startTest(usr)
					return
				switch(input("Do you wish to take the test to become the [rankTest][rankAdd]?", text) in list ("Yes","No"))
					if("Yes")
						giveCaptainTest(usr)
					else
						usr<<"[npcName]I understand, these tests are quite difficult."

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
				activeRankList["Karakura Hero"]=activeRankList["Karakura Hero"]-1
				M.karakuraheroplayer=0
			if(M.newhollowking)
				M.newhollowking=0
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
			M.verbs -= typesof(/mob/spiritking/verb)
	proc
		giveRank(rank)
			if(rank)
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
			M.loc=locate(31,165,21)
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
			currentPlayerTest=M.key
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
				else
					new/mob/Test_Gotei_13/C13(locate(31,168,21))

			if(currentRankTest=="Captain Commander"||currentRankTest=="Karakura Hero")
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
			if(currentRankTest=="DemiGod")
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
