/*

Much thanks to Zaltron for a small snippet of his Text Library, and the text font!

*/


mob/proc
	textlist(var/textlist)
		writing=list();for(var/t=1,t<=length(textlist),t++)writing+=copytext(textlist,t,t+1)
	Text(mob/m,var/x,var/y,var/offx,var/offy,var/t)
		if(m.key!=null)
			textlist(t)
			for(var/w in writing)
				var/obj/HUD/Text/s=new(m.client)
				s.screen_loc="[x]:[offx],[y]:[offy]"
				s.icon_state=w
				s.layer=999999
				s.name="\proper[w]"
				offx+=8
				if(offx >= 32) {/*sleep(0.1);*/offx-=32 ; x++}
var/writing
