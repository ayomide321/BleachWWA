client
	North()
		if(mob.InventoryUp)
			for(var/obj/HUD/AU/A in usr.client.screen)
				A.Click()
	South()
		if(mob.InventoryUp)
			for(var/obj/HUD/AD/A in usr.client.screen)
				A.Click()

mob
	proc
		CreateInventory()//This is the proc that creates the OSI
			var/ox = 3 //The X position of the item
			var/oy = 16// The Y Position of the item
			var/count = 0
			var/number = 1 //Var that helps to list the numbers on-screen

			for(var/obj/items/O in usr.client.screen)//Gets rid of any items on-screen
				O.layer = OBJ_LAYER
				usr.client.screen-=O

			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)

			usr.MenuBack()//Creates the OSI Background

			for(var/obj/items/O in usr.contents)//Checking your contents....
				if(count < 15) //If count is still under 10...
					count++
					O.layer = MOB_LAYER+100
					usr.client.screen += O//Add the item to your screen
					O.screen_loc = "[ox],[oy]" //Set its screen_loc
					usr.Text(usr,ox+1,oy,0,14,copytext(O.name,1,21)) //Displays its name
					usr.Text(usr,3,oy,0,10,O.suffix)
					oy-- //Makes it so the next item is directly under the current
				if(count >= 15 && count <30) //If count is still under 10...
					count++
					O.layer = MOB_LAYER+100
					usr.client.screen += O//Add the item to your screen
					O.screen_loc = "[ox+5],[oy+15]" //Set its screen_loc
					usr.Text(usr,ox+6,oy+15,0,14,copytext(O.name,1,21)) //Displays its name
					usr.Text(usr,8,oy+15,0,10,O.suffix)
					oy--
				if(count >= 30) //If count is still under 10...
					count++
					O.layer = MOB_LAYER+100
					usr.client.screen += O//Add the item to your screen
					O.screen_loc = "[ox+10],[oy+30]" //Set its screen_loc
					usr.Text(usr,ox+11,oy+30,0,14,copytext(O.name,1,21)) //Displays its name
					usr.Text(usr,13,oy+30,0,10,O.suffix)
					oy--

			for(var/i = 16,i > 1, i--)//Simple loop that displays 1-10 on-screen
				usr.Text(usr,2,i,2,15,"[number].")
				number++

		MenuBack()//Proc that creates the OSI Background
			var/obj/H = new/obj/HUD/Middle(usr.client)
			var/obj/O = new/obj/HUD/TopLeft(usr.client)
			var/obj/A = new/obj/HUD/TopRight(usr.client)
			var/obj/B = new/obj/HUD/BottomLeft(usr.client)
			var/obj/C = new/obj/HUD/BottomRight(usr.client)
			var/obj/D = new/obj/HUD/TopMiddle(usr.client)
			var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
			var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
			var/obj/G = new/obj/HUD/RightMiddle(usr.client)
			H.screen_loc = "2,17 to 16,2"
			O.screen_loc = "2,17"
			A.screen_loc = "16,17"
			B.screen_loc = "2,2"
			C.screen_loc = "16,2"
			D.screen_loc = "2,17 to 16,17"
			E.screen_loc = "2,2 to 16,2"
			F.screen_loc = "2,2 to 2,17"
			G.screen_loc = "16,2 to 16,17"
			usr.Text(usr,2,17,2,10,"--Inventory--")
		CreateSkill()//This is the proc that creates the OSI
			var/ox = 3 //The X position of the item
			var/oy = 16 //The Y Position of the item
			var/count = 0
			var/number = 1 //Var that helps to list the numbers on-screen

			for(var/obj/skillcard/O in usr.client.screen)//Gets rid of any items on-screen
				O.layer = OBJ_LAYER
				usr.client.screen-=O

			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)

			usr.SkillBack()//Creates the OSI Background

			for(var/obj/skillcard/O in usr.contents)//Checking your contents....
				if(count < 15)// If count is still under 10...
					count++
					O.layer = MOB_LAYER+100
					usr.client.screen += O//Add the item to your screen
					O.screen_loc = "3,[oy]" //Set its screen_loc
					usr.Text(usr,ox+1,oy,0,14,copytext(O.name,1,21)) //Displays its name
					usr.Text(usr,3,oy,0,10,O.suffix)
					oy--// Makes it so the next item is directly under the current
				if(count >= 15 && count <30)// If count is still under 10...
					count++
					O.layer = MOB_LAYER+100
					usr.client.screen += O//Add the item to your screen
					O.screen_loc = "8,[oy+15]"// Set its screen_loc
					usr.Text(usr,9,oy+15,0,14,copytext(O.name,1,21))// Displays its name
					usr.Text(usr,8,oy+15,0,10,O.suffix)
					oy--
				if(count >= 30)// If count is still under 10...
					count++
					O.layer = MOB_LAYER+100
					usr.client.screen += O//Add the item to your screen
					O.screen_loc = "13,[oy+30]"// Set its screen_loc
					usr.Text(usr,14,oy+30,0,14,copytext(O.name,1,21))// Displays its name
					usr.Text(usr,13,oy+30,0,10,O.suffix)
					oy--

			for(var/i = 16,i > 1, i--)//Simple loop that displays 1-10 on-screen
				usr.Text(usr,2,i,2,15,"[number].")
				number++

		SkillBack()//Proc that creates the OSI Background
			var/obj/H = new/obj/HUD/Middle(usr.client)
			var/obj/O = new/obj/HUD/TopLeft(usr.client)
			var/obj/A = new/obj/HUD/TopRight(usr.client)
			var/obj/B = new/obj/HUD/BottomLeft(usr.client)
			var/obj/C = new/obj/HUD/BottomRight(usr.client)
			var/obj/D = new/obj/HUD/TopMiddle(usr.client)
			var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
			var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
			var/obj/G = new/obj/HUD/RightMiddle(usr.client)
			H.screen_loc = "2,17 to 16,2"
			O.screen_loc = "2,17"
			A.screen_loc = "16,17"
			B.screen_loc = "2,2"
			C.screen_loc = "16,2"
			D.screen_loc = "2,17 to 16,17"
			E.screen_loc = "2,2 to 16,2"
			F.screen_loc = "2,2 to 2,17"
			G.screen_loc = "16,2 to 16,17"
			usr.Text(usr,2,17,2,10,"--Skills--")


