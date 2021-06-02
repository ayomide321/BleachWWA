obj
	HUD
		icon = 'HUD.dmi'
		layer = MOB_LAYER+89
		name = ""
		New(client/C)
			C.screen += src
			..()
		BottomRight
			icon_state = "BR"
		BottomLeft
			icon_state = "BL"
		TopRight
			icon_state = "TR"
		TopLeft
			icon_state = "TL"
		TopMiddle
			icon_state = "TM"
		BottomMiddle
			icon_state = "BM"
		LeftMiddle
			icon_state = "LM"
		RightMiddle
			icon_state = "RM"
		Middle
			icon_state = "M"
		Text
			icon = 'txt.dmi'

		AU   //Arrow Up
			mouse_opacity=2
			icon_state = "AU"
			Click()
				var/list/I = list()//Just a list
				var/number//Var that helps to list the numbers on the OSI
				var/oy = 16 //The Y Position of the item

				if(usr.OSIPos == 15||usr.contents.len <= 15)//If you have under 10, or 10, items, stop!
					return

				usr.OSIPos--
				number = (usr.OSIPos+4)-15//Setting the top number

				for(var/obj/items/O in usr.client.screen)//Checking for obj/Items in your screen
					usr.client.screen -= O //Taking those items off your screen
					O.layer = OBJ_LAYER //Setting their layer back to default

				for(var/obj/HUD/Text/T in usr.client.screen)//Checking for Text on-screen...
					del(T) //Deleting text

				for(var/A = number, A < number+17, A++)//This loop adds items to the I list depending on their order in your contents
					for(var/obj/items/O in usr.contents)//Checking for any objects in your contents...
						if(usr.contents[A] == O) //If you don't understand list indexs, please look it up in Help
							I.Add(O)//Adding that item

				for(var/i = 16,i > 1, i--)//Loop that sets up the numbers on-screen
					usr.Text(usr,2,i,2,10,"[number].")
					number++

				usr.Text(usr,2,17,2,10,"--Inventory--")

				for(var/obj/O in I)//Loop that places every object in list I on-screen, and displays their name next to them
					usr.client.screen += O
					O.layer = MOB_LAYER+100
					O.screen_loc = "3,[oy]"
					usr.Text(usr,4,oy,0,10,copytext(O.name,1,21))
					usr.Text(usr,3,oy,0,10,O.suffix)
					oy--

		AD //Arrow Down
			icon_state = "AD"
			mouse_opacity=2
			Click()
				var/list/I = list()
				var/number
				var/oy = 16
				if(usr.contents.len <= 15||usr.OSIPos >= usr.contents.len)
					return
				usr.OSIPos++
				number = (usr.OSIPos+4)-15
				for(var/obj/items/O in usr.client.screen)
					usr.client.screen -= O
				for(var/obj/HUD/Text/T in usr.client.screen)
					del(T)
				for(var/A = number, A < number+17, A++)
					for(var/obj/items/O in usr.contents)//Checking for any objects in your contents...
						if(usr.contents[A] == O) //If you don't understand list indexs, please look it up in Help
							I.Add(O)//Adding that item
				for(var/i = 16,i > 1, i--)
					usr.Text(usr,2,i,2,10,"[number].")
					number++

				usr.Text(usr,2,17,2,10,"--Inventory--")

				for(var/obj/O in I)
					usr.client.screen += O
					O.layer = MOB_LAYER+100
					O.screen_loc = "3,[oy]"
					usr.Text(usr,4,oy,0,10,copytext(O.name,1,21))
					usr.Text(usr,3,oy,0,10,O.suffix)
					oy--
		SU   //Arrow Up
			icon_state = "AU"
			mouse_opacity=2
			Click()
				var/list/I = list()//Just a list
				var/number//Var that helps to list the numbers on the OSI
				var/oy = 16 //The Y Position of the item

				if(usr.OSIPos == 15||usr.contents.len <= 15)//If you have under 10, or 10, items, stop!
					return

				usr.OSIPos--
				number = (usr.OSIPos+4)-15//Setting the top number

				for(var/obj/skillcard/O in usr.client.screen)//Checking for obj/Items in your screen
					usr.client.screen -= O //Taking those items off your screen
					O.layer = OBJ_LAYER //Setting their layer back to default

				for(var/obj/HUD/Text/T in usr.client.screen)//Checking for Text on-screen...
					del(T) //Deleting text

				for(var/A = number, A < number+17, A++)//This loop adds items to the I list depending on their order in your contents
					for(var/obj/skillcard/O in usr.contents)//Checking for any objects in your contents...
						if(usr.contents[A] == O) //If you don't understand list indexs, please look it up in Help
							I.Add(O)//Adding that item

				for(var/i = 16,i > 1, i--)//Loop that sets up the numbers on-screen
					usr.Text(usr,2,i,2,10,"[number].")
					number++

				usr.Text(usr,2,17,2,10,"--Skills--")

				for(var/obj/O in I)//Loop that places every object in list I on-screen, and displays their name next to them
					usr.client.screen += O
					O.layer = MOB_LAYER+100
					O.screen_loc = "3,[oy]"
					usr.Text(usr,4,oy,0,10,copytext(O.name,1,21))
					usr.Text(usr,3,oy,0,10,O.suffix)
					oy--

		SD //Arrow Down
			icon_state = "AD"
			mouse_opacity=2
			Click()
				var/list/I = list()
				var/number
				var/oy = 16
				if(usr.contents.len <= 15||usr.OSIPos >= usr.contents.len)
					return
				usr.OSIPos++
				number = (usr.OSIPos+4)-15
				for(var/obj/skillcard/O in usr.client.screen)
					usr.client.screen -= O
				for(var/obj/HUD/Text/T in usr.client.screen)
					del(T)
				for(var/A = number, A < number+17, A++)
					for(var/obj/skillcard/O in usr.contents)//Checking for any objects in your contents...
						if(usr.contents[A] == O) //If you don't understand list indexs, please look it up in Help
							I.Add(O)//Adding that item
				for(var/i = 16,i > 1, i--)
					usr.Text(usr,2,i,2,10,"[number].")
					number++

				usr.Text(usr,2,17,2,10,"--Skills--")

				for(var/obj/O in I)
					usr.client.screen += O
					O.layer = MOB_LAYER+100
					O.screen_loc = "3,[oy]"
					usr.Text(usr,4,oy,0,10,copytext(O.name,1,21))
					usr.Text(usr,3,oy,0,10,O.suffix)
					oy--