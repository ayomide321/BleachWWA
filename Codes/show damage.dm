obj/Dmg
	layer=MOB_LAYER+5
	maptext_width=100
	New(a,b)
		..()
		if(!isnull(b))
			maptext="<font color='[b]'>[num2text(round(a))]</font>"
		else
			maptext=num2text(round(a))
		pixel_y=48
		animate(src,pixel_y=70,alpha=0,time=8)
		spawn(10)src.loc=null
mob
	proc
		ShowDNum(var/amount,var/color)
			var/obj/Dmg/D=new(a=amount,b=color)//later add color
			D.loc=src.loc

		ShowDmg(amt)
			ShowDNum(amt,"red")