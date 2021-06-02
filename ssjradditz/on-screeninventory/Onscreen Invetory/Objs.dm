obj
	Items
		icon = 'Objs.dmi'
		Food
			Potato
				icon_state = "potato"
			Fruit
				icon_state = "fruit"
			Egg
				icon_state = "egg"
			Fish
				icon_state = "fish"
			Corn
				icon_state = "corn"
		verb
			Get()
				set src in oview(0)
				Move(usr)
				if(usr.InventoryUp)
					usr.CreateInventory()
			Drop()
				set src in usr
				if(usr.InventoryUp)
					Move(usr.loc)
					usr.CreateInventory()
				else
					Move(usr.loc)
			Use()
				set src in usr
				usr << "You eat [src]."
				Move(usr.loc)
				if(usr.InventoryUp)
					usr.CreateInventory()
				del(src)
