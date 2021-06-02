/*
	The infamous talking not-so-smileys demo.

	This contains some code to give a rough idea how to use this with the
	map_format and icon_size features found in BYOND 455. The default is:

	#define TILED
	#define ISO

	#define ICON_WIDTH 32
	#define ICON_HEIGHT 32
	world/icon_size = 32
 */

#define TILED
#define ISO

#define ICON_WIDTH 32
#define ICON_HEIGHT 32
world/icon_size = 32

obj/bub
	icon='Icons/bubble.dmi'
	icon_state="bub"
	layer=12
	pixel_y=32
mob
	var/talkbubble/bubble

	verb/Say(msg as text)
		set hidden=1
		if(src.GM<4)
			if(length(msg) >= 300)
				alert("Your message is too long.")
				return
			if(src.muted)
				alert("You are muted!")
				return
	//	if(!worldC)
//			alert("The world is muted!")
//			return
		if(!msg) return
		msg = Replace_All(msg,chat_filter)
		msg=S.ParseHTML(msg)
		if(!src.lost)


			view(src,8) << output("<B><font color=#02B3FF>[name]:</font color></B> [msg]","output")
		if(src.ctf==2&&src.lost)
			for(var/mob/player/D in world)
				if(D.colorr==src.colorr&&D.lost)


					D << output("<B><font color=#02B3FF>(Team Member)[name]:</font color></B> [msg]","output")
			return
		if(src.lost)
			for(var/mob/player/D in world)
				if(D.lost)


					D << output("<B><font color=#02B3FF>(Event Say)[name]:</font color></B> [msg]","output")
		src.overlays+=/obj/bub
		spawn(20)
		src.overlays-=/obj/bub
	proc/Story_Talk(msg as text)
		set hidden=1
		if(!msg) return
		src << output("<B><font color=purple>Story:</B> <font color=purple>[msg]","output")



///////////for new skin
/*mob
	var/talkbubble/bubble

	verb/Say(var/msg as text)
		set hidden=1
		winset(usr, "map", "focus=true")
		if(src.GM<4)
			if(length(msg) >= 300)
				alert("Your message is too long.")
				return
			if(src.muted)
				alert("You are muted!")
				return
	//	if(!worldC)
//			alert("The world is muted!")
//			return
		if(!msg) return
		msg = Replace_All(msg,chat_filter)
		msg=S.ParseHTML(msg)
		if(!src.lost)


			view(src,8) << output("<B><font color=#02B3FF>[name]:</font color></B> [msg]","output")
		if(src.ctf==2&&src.lost)
			for(var/mob/player/D in world)
				if(D.colorr==src.colorr&&D.lost)


					D << output("<B><font color=#02B3FF>(Team Member)[name]:</font color></B> [msg]","output")
			return
		if(src.lost)
			for(var/mob/player/D in world)
				if(D.lost)


					D << output("<B><font color=#02B3FF>(Event Say)[name]:</font color></B> [msg]","output")
		src.overlays+=/obj/bub
		spawn(20)
		src.overlays-=/obj/bub
	proc/Story_Talk(msg as text)
		set hidden=1
		if(!msg) return
		src << output("<B><font color=purple>Story:</B> <font color=purple>[msg]","output")

*/