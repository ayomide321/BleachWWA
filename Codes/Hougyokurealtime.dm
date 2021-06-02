/*HougLocations
	Earth=40,194,2
	SS=106,107,4
	HM=60,10,11
	valley of screams=138,112,21
*/

obj
	icon='Icons/hougevent.dmi'
	HougEvent
		var/Faction=""
		icon_state="houg"
		verb/TakeTheHoug()
			set src in oview(1)
			if(!usr.client)return
			if(captureprotection==1||gothoug!=""&&captureprotection==1)
				src<<"<b> The hougyoku cannot be taken at the momment.</b>"
				return
			gothoug="[usr.name]"
			world<<"<font size=3><b>[gothoug] has taken the hougyoku from [holdinghoug]!</b></font>"
			captureprotection=1
	HougEventEmpty
		var/Faction=""
		icon_state="nohoug"
		verb/PlaceTheHoug()
			set src in oview(1)
			if(!usr.client)return
			if(usr.name=="[gothoug]")
				if(usr.shinip==1)
					world<<"<b>[usr.name] has succesfully captured the hougyoku for Seiretei.Respecs are free for Seireitei, Zan changes are now half price</b>"
					holdinghoug="Seiretei"
				if(usr.earth==1)
					world<<"<b>[usr.name] has succesfully captured the hougyoku for Earth.Respecs are free for earth, Fullbring changes are now half price and zan changes for vaizard</b>"
					holdinghoug="Earth"
				if(usr.hollow==1)
					world<<"<b>[usr.name] has succesfully captured the hougyoku for Hueco Mundo.Respecs are free for Hueco Mundo, Zan changes are now half price</b>"
					holdinghoug="Hueco Mundo"
				holdinghoug="at the valley of screams"
				gothoug=null
				captureprotection=0
				HougCaptureTimer()
			else
				src<<"<b> You don't have the hougyoku!</b>"
mob/verb
	WhereIsTheRealHougyoku()
		if(gothoug==null)
			usr<<"<b>The hougyoku is currently [holdinghoug]."
		else
			usr<<"<b>[gothoug] currently has the hougyoku</b>"
var/global
	holdinghoug="at the valley of screams"//which faction has houg, valley of screams=no one
	captureprotection=0//you cant take houg unless its 0
	gothoug=null//players name
proc
	HougCaptureTimer()
		sleep(18000)
		world << "<b><font color = purple>The Hougyoku has now been reset and was previously [holdinghoug]'s.</b>"
		captureprotection=0
		gothoug=null
		HougCaptureTimer()
mob/proc
	TakeHoug()
		if(!src.client)return
		if(captureprotection==1||gothoug!=null&&captureprotection==1)
			src<<"<b> The hougyoku cannot be taken at the momment.</b>"
			return
		gothoug="[src.name]"
		world<<"<b>[gothoug] has taken the hougyoku from [holdinghoug]!</b>"
	PlaceHoug()
		if(!src.client)return
		if(src.name=="[gothoug]")
			if(src.shinip==1)
				world<<"<b>[src.name] has succesfully captured the hougyoku for Seiretei.</b>"
				holdinghoug="in Seiretei"
			if(src.earth==1)
				world<<"<b>[src.name] has succesfully captured the hougyoku for Earth.</b>"
				holdinghoug="in Earth"
			if(src.hollow==1)
				world<<"<b>[src.name] has succesfully captured the hougyoku for Hueco Mundo.</b>"
				holdinghoug="in Las Noches"
			world<<"<b>The hougyoku cannot be captured for 30 minutes.</b>"
			captureprotection=1
			HougCaptureTimer()
		else
			src<<"<b> You don't have the hougyoku!</b>"
