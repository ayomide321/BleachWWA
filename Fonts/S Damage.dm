#ifndef S_DAMAGE_ICON
#define S_DAMAGE_ICON 's_damage.dmi'
#endif

/***********************************************/

obj/s_damage_num
	layer = FLY_LAYER
	name = " "
	icon_state = ""


proc/s_damage(ref, num, colour)
	if(!findtext(colour,"#"))
		colour = colour2html(colour)

	Create a new icon copy and set its colour.
	var/icon = S_DAMAGE_ICON
	icon += colour

	num = round(num,1)

	if(num > 9999)
		num = 9999

	var/string = num2text(num)
	var/first_char
	var/second_char
	var/third_char
	var/fourth_char
	var/obj/s_damage_num/first
	var/obj/s_damage_num/second
	var/obj/s_damage_num/third
	var/obj/s_damage_num/fourth

	if(lentext(string) == 1)
		first_char = copytext(string,1,2)
		first = new

	if(lentext(string) == 2)
		second_char = copytext(string,1,2)
		second = new
		first_char = copytext(string,2,3)
		first = new

	if(lentext(string) == 3)
		third_char = copytext(string,1,2)
		third = new
		second_char = copytext(string,2,3)
		second = new
		first_char = copytext(string,3,4)
		first = new

	if(lentext(string) == 4)
		fourth_char = copytext(string,1,2)
		fourth = new
		third_char = copytext(string,2,3)
		third = new
		second_char = copytext(string,3,4)
		second = new
		first_char = copytext(string,4,5)
		first = new

	var/target = ref
	if(ismob(ref) || isobj(ref)) target = ref:loc

	if(first)		first.loc = target
	if(second) second.loc = target
	if(third)		third.loc = target
	if(fourth) fourth.loc = target

	if(first)
		first.icon = icon
		flick("---[first_char]",first)
	if(second)
		second.icon = icon
		flick("--[second_char]-",second)
	if(third)
		third.icon = icon
		flick("-[third_char]--",third)
	if(fourth)
		fourth.icon = icon
		flick("[fourth_char]---",fourth)

	spawn(10)
		if(first)		del(first)
		if(second) del(second)
		if(third)		del(third)
		if(fourth) del(fourth)