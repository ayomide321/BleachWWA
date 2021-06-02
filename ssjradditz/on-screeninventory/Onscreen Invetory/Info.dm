/* Date: November 18, 2004

This is a on-screen invetory system created by Justin Kogler(SSJ Radditz).

Compared to the original I created, this is much much more efficient, not to mention
much better programmed.

I hope you enjoy it, and please, don't be afraid to send me some input at SSJRad@hotmail.com.

Thanks

*/


mob
	var
		InventoryUp = 0//Variable telling whether your OSI is up, or not
		SkillUp=0
		OSIPos = 0 //Variable showing the last item you can see on the OSI
	verb
		Inventory()
			set hidden=1
			var/list/T=new

			for(var/obj/O in src.contents)
				if(!T.Find(O.type))
					T+=O.type
					var/count=0
					for(var/obj/o in src.contents)
						if(o.type==O.type)
							count+=o.stacked
							if(o!=O)del(o)
					O.stacked=count
					O.suffix="[count]"
					if(O.suffix=="1"||O.suffix=="0")
						O.suffix=""
			if(usr.SkillUp)
				usr.Close_Skills()
			if(usr.InventoryUp == 0)
				usr.InventoryUp = 1
				CreateInventory(usr)
			else
				usr.Close_Inventory()
		Close_Inventory()
			set hidden=1
			if(usr.InventoryUp)
				for(var/obj/items/O in usr.client.screen)
					usr.client.screen -= O
					O.layer = OBJ_LAYER
				for(var/obj/HUD/H in usr.client.screen)
					del(H)
				usr.InventoryUp = 0
		Skills()
			set hidden=1
			var/list/T=new

			for(var/obj/O in src.contents)
				if(!T.Find(O.type))
					T+=O.type
					var/count=0
					for(var/obj/o in src.contents)
						if(o.type==O.type)
							count+=o.stacked
							if(o!=O)del(o)
					O.stacked=count
					O.suffix="[count]"
					if(O.suffix=="1"||O.suffix=="0")
						O.suffix=""
			if(usr.InventoryUp)
				usr.Close_Inventory()
			if(usr.SkillUp == 0)
				usr.SkillUp = 1
				CreateSkill(usr)
			else
				usr.Close_Skills()
		Close_Skills()
			set hidden=1
			if(usr.SkillUp)
				for(var/obj/skillcard/O in usr.client.screen)
					usr.client.screen -= O
					O.layer = OBJ_LAYER
				for(var/obj/HUD/H in usr.client.screen)
					del(H)
				usr.SkillUp = 0