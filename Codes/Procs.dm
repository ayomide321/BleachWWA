/*note to Zag from Dariuc-
When using spawn() there are 3 ways to use it.
spawn(-1)//means to do whatever the command is first.
spawn()//causes the instructions to be run,
spawn()
-----do instructions.

in the final instance, you need to indent over to make sure
the instruction occurs AFTER the spawn, otherwise
it will be treated as just another instruction to be
ran immediately after the spawn.
I fixed numerous procs in this file that had this
error. (Didn't do them all)

*/
mob/var
	immunetoflames=0
	tmp
		amated=0

mob/proc
	CheckAmat()
		if(src.immunetoflames)
			view<<"<b>[src] is immune to the black flames.</b>"
			return
		src.Load_Overlays()
		src.overlays+=/obj/amatover
		spawn(150)
			src.amated=0
			src.overlays-=/obj/amatover
		var/x=15
		while(x<=0)
			src<<"<b> You're burned by the black flames.</b>"
			view<<"<b>[src] is being burned by the black flames</b>."
			src.wound++
			x--
			sleep(10)
		return

	Jomoned()
		src.jomoned+=1
		spawn(400)
			src.jomoned-=1
	Sais()
		src.saied=1
		spawn(50)
			src.saied=0
	Tripped()
		src.tripped+=1
		spawn(15)
			src.tripped-=1
	Partner_Up(mob/M)
		if(M.pet)
			src<<"[M] belongs to someone already"
			return
		if(src.petcd)
			src<<"<font color=blue><b>You must wait [round(src.petcd/60,1)] minutes before getting another partner!"
			return
		for(var/mob/D in view(8,src))
			if(D.myclone==src)
				src<<"You already have a partner"
				return
		src.petcd=600
		M.Talks("Let's do this XD! Press 'U' to make me follow you and target someone to make me attack")
		M.pet=1
		M.owner=src
		M.myclone=src
	Cloaks()
		src.invisibility=99
		spawn(300)
			src.invisibility=0
	NegacionEffect()
		src.neged=1
		src.frozen=1
		src.protected=1
		src.lacerated=50
		src.overlays+=/obj/negacion
		src<<"<b>You have been induced with Negacion"
		sleep(200)
		src.neged=0
		src.wound+=25
		src.frozen=0
		src.protected=0
		src.lacerated=0
		src.overlays-=/obj/negacion
	Blindyou(time)
		src.sight=BLIND
		spawn(time)
			src.sight=0
	AllowMovement(time)
		src.allowmove=1
		spawn(time)
			src.allowmove=0
	Pick_AtkZan()
		if(src.chosezan)return
		var/list/Menu=list("Ichigo","Zaraki","Ichimaru","Hisagi","Ikkaku","Kira","Kommamaru","Renji","Shonshui","Stinger","Tousen","Unohana",/*this is repeated*/"Ichimaru","Hisagi","Ikkaku","Kira","Kommamaru","Ichigo","Zaraki")
		if(src.level>=400)
			Menu+="Aizen"
			Menu+="Muramasa"
		if(src.stype in Menu)
		//	Menu-=src.stype
			Menu.Remove(src.stype)
		src.stype=pick(Menu)
		spawn(20)
			src.skill()
		if(src.beatkenpachi)
			src.chosezan=1
	Pick_ReiZan()
		if(src.chosezan)return
		var/list/Menu=list("Yammamoto","Aizen","Shinji","Lightning","Fujimaru","Yammamoto","Byakuya","Hinamori","Kaiens","Mayuri","Rukia","Hitsugaya","Urahara",/*rep*/"Byakuya","Hinamori")
		if(src.stype in Menu)
	//		Menu-=src.stype
			Menu.Remove(src.stype)
		src.stype=pick(Menu)
		spawn(20)
			src.skill()
		if(src.beatkenpachi)
			src.chosezan=1
	Pick_BothZan()
		if(src.chosezan)return
		var/choose=stype
		src.stype=pick("Yumichika","Ukitake","Kensei","Ukitake","Kensei")
		if(src.stype==choose)
			if(choose=="Yumichika")
				src.stype=pick("Ukitake","Kensei")
			if(choose=="Ukitake")
				src.stype=pick("Yumichika","Kensei","Kensei")
			if(choose=="Kensei")
				src.stype=pick("Ukitake","Ukitake","Yumichika")
			spawn(20)
				src.skill()
		if(src.beatkenpachi)
			src.chosezan=1
	Pick_AtkRess()
		if(src.chosezan)return
		var/list/Menu=list("Del Toro","Dordoni","Nell","Nnoitra","Tijereta","Zommari","Luppi")
		if(src.ressurectiontype in Menu)
			Menu.Remove(src.ressurectiontype)
//			Menu-=src.ressurectiontype
		src.ressurectiontype=pick(Menu)
		src.chosezan=1
	Pick_ReiRess()
		if(src.chosezan)return
		var/list/Menu=list("Shooter","Skeleton","Ulq","Volcanica")
		if(src.ressurectiontype in Menu)
	//		Menu-=src.ressurectiontype
			Menu.Remove(src.ressurectiontype)
		src.ressurectiontype=pick(Menu)
		src.chosezan=1
	Pick_BothRess()
		if(src.chosezan)return
		var/list/Menu=list("Pantera","Scientist","Halibel")
		if(src.ressurectiontype in Menu)
	//		Menu-=src.ressurectiontype
			Menu.Remove(src.ressurectiontype)
		src.ressurectiontype=pick(Menu)
		src.chosezan=1
	Pick_AtkFB()
		if(src.chosezan)return
		var/list/Menu=list("Samurai","Jackie","Ginjo","Jackie","Tsukishima","Shishigawara")
		if(src.ftype in Menu)
			Menu.Remove(src.ftype)
//			Menu-=src.ftype
		src.ftype=pick(Menu)
		if(src.beatkenpachi)
			src.chosezan=1
	Pick_ReiDoll()
		if(src.chosezan)
			return
		var/list/Menu=list("Fire Doll","Water Doll")
		if(src.ftype in Menu)
			Menu.Remove(src.ftype)
//			Menu-=src.ftype
		src.ftype=pick(Menu)
		if(src.beatkenpachi)
			src.chosezan=1
	Pick_ReiFB()
		if(src.chosezan)
			return
		var/list/Menu=list("Ichigo","Yukio")
		if(src.ftype in Menu)
			Menu.Remove(src.ftype)
//			Menu-=src.ftype
		src.ftype=pick(Menu)
		if(src.beatkenpachi)
			src.chosezan=1
	LifeSpan(mob/O,time)
		sleep(time)
		if(O)
			O.clones-=src
		del src
	Reward()
		switch(input(src,"What prize do you want?",text) in list ("Event Points","Money","Level Points","50% Exp"))
			if("Event Points")
				src.eventpoints+=round(src.level/50,1)
				src<<"<font color=green><b>You gained [round(src.level/100,1)] event point(s)"
			if("Money")
				src.GainMoney(round(src.level*1200))
				src<<"<font color=green><b>You gained $[round(src.level*1200)]"
			if("Level Points")
				src.levelpoints+=round(src.level/2,1)
				src<<"<font color=green><b>You gained [round(src.level/2,1)] levelpoints"
			if("50% Exp")
				src.GainExp(src.mexp/2)
				src<<"<font color=green><b>You gained 50% exp"
	Generic()
		var/t=pick(1,2,3,6,7,8,9,10)
		if(t==1)
			src.rawbuff+=5
			src.mattack+=5
			src.attack+=5
			src.mdefence+=5
			src.defence+=5
			src.mreiatsu+=5
			src.reiatsu+=5
			src<<"You got a +5 boost in all stats"
		if(t==2)
			src.GainExp(20000)
			src<<"You have gained 20,000 exp"
		if(t==3)
			src.contents+=new/obj/items/usable/Max_Potion
			src<<"You find a max potion"
		if(t==10)
			src.GainMoney(10000)
			src<<"You have gained $10,000 money"
		if(t==7)
			src<<"You found your hologram"
			src.Angel()
		if(t==8)
			src.GainExp(35000)
			src<<"You have gained 35,000 exp"
		if(t==9)
			src.GainExp(15000)
			src<<"You have gained 15,000 exp"
		if(t==10)
			src.GainMoney(5000)
			src<<"You have gained $5,000 money"
	Random_num()
		var/r=rand(1,6)
		if(r==1)
			sleep(10)
		if(r==2)
			sleep(30)
		if(r==3)
			sleep(50)
		if(r==4)
			sleep(60)
		if(r==5)
			sleep(120)
		if(r==6)
			sleep(200)
	QuickSort(list/L, low = 1, high = -1)
		if(high == -1) high = L.len
		if(low >= high) return
		var/pivot = QSPartition(L, low, high)
		QuickSort(L, low, pivot-1)
		QuickSort(L, pivot+1, high)
	QSPartition(list/L, low, high)
		var/x = L[high]
		var/i = low -1
		for(var/j in low to high -1)
			if(Compare(L[j], x) == 1)
				i++
				Swap(L, i, j)
		Swap(L, i+1, high)
		return i + 1
	Medium()
		if(prob(10))
			world <<"<b><font size=2>[src] has found the autograph of the famous Relapse!!"
			src.relapseAutographs++
		var/t=pick(1,2,4,7)
		if(t==1)
			src.levelpoints+=100
			src<<"You have gained 100 level points"
		if(t==2)
			src.GainExp(src.mexp/2)
			src<<"Your required experience has been lowered by 50%"
		if(t==3)
			src.contents+=new/obj/items/usable/Max_Potion
			src.contents+=new/obj/items/usable/Max_Potion
			src.contents+=new/obj/items/usable/Max_Potion
			src.contents+=new/obj/items/usable/Max_Potion
			src.contents+=new/obj/items/usable/Max_Potion
			src.contents+=new/obj/items/usable/Max_Potion
			src.contents+=new/obj/items/usable/Max_Potion
			src.contents+=new/obj/items/usable/Max_Potion
			src.contents+=new/obj/items/usable/Max_Potion
			src.contents+=new/obj/items/usable/Max_Potion
			src<<"You find 10 max potions!"
		if(t==4)
			src.contents+=new/obj/items/usable/Events/Purple_Sprite
			src<<"You found Purple Sprite"
		if(t==7)
			src.GainExp(src.mexp/2)
			src<<"You gain 50% experience"
	Rare()
		if(prob(20))
			world <<"<b><font size=2>[src] has found the autograph of the famous Relapse!!"
			src.relapseAutographs++
		var/t=pick(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19)
		if(t==1)
			src.contents+=new/obj/skillcard/Sharingan
			src.gotsharingan = 1
			src<<"You have gained Sharingan"
		if(t==2)
			src.contents+=new/obj/skillcard/Pure_Atk
			src<<"You have gained Pure Atk"
		if(t==3)
			src.contents+=new/obj/skillcard/Pure_Def
			src<<"You have gained Pure Def"
		if(t==4)
			src.contents+=new/obj/skillcard/Pure_Rei
			src<<"You have gained Pure Rei"
		if(t==5)
			src.contents+=new/obj/skillcard/Life_Contract
			src<<"You have gained Life Contract"
		if(t==6)
			src.contents+=new/obj/skillcard/Ice_Field
			src<<"You have gained Ice Field"
		if(t==7)
			src.contents+=new/obj/skillcard/Death_Note
			src<<"You find a strange note book with the title, Death Note"
		if(t==8)
			src.GainExp(src.mexp*3)
			src<<"You found and consume an experience pill!"
		if(t==9)
			src.levelpoints+=800
			src<<"You have gained 800 level points"
		if(t==10)
			src.eventpoints+=25
			src<<"You have gained 25 event points"
		if(t==11)
			src.contents+=new/obj/items/equipable/Overshirt/Organization_XIII
			src<<"You have found a robe that belongs to Organization XIII"
		if(t==12)
			src.skillpoints+=2000
			src<<"You have gained 2000 skill points"
		if(t==13)
			src<<"You found an autographed picture of the famous Relapse!!"
			src.skillpoints+=10000
		if(t==14)
			src.skillspassive+=4
			src<<"You have gained 4 passive points"
		if(t==15)
			src.combos+=1
			src<<"You have gained a combo point"
		if(t==16)
			src.GainExp(src.mexp*4)
			src<<"You found and consume an experience pill!"
		if(t==17)
			src.GainExp(src.mexp*5)
			src<<"You found and consume an experience pill!"
		if(t==18)
			src.GainExp(src.mexp*6)
			src<<"You found and consume an experience pill!"
		if(t==19)
			src<<"You have found 1 Donor Points!"
			src.donor_points+=1
			src.total_bought+=1
	DungeonR1()
		if(prob(30))
			world <<"<b><font size=2>[src] has found the autograph of the famous Relapse!!"
			src.relapseAutographs++
		var/t=pick(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19)
		if(t==1)
			src.contents+=new/obj/skillcard/Sharingan
			src.gotsharingan = 1
			src<<"You have gained Sharingan"
		if(t==2)
			src.contents+=new/obj/skillcard/Pure_Atk
			src<<"You have gained Pure Atk"
		if(t==3)
			src.contents+=new/obj/skillcard/Pure_Def
			src<<"You have gained Pure Def"
		if(t==4)
			src.contents+=new/obj/skillcard/Pure_Rei
			src<<"You have gained Pure Rei"
		if(t==5)
			src.contents+=new/obj/skillcard/Life_Contract
			src<<"You have gained Life Contract"
		if(t==6)
			src.contents+=new/obj/skillcard/Ice_Field
			src<<"You have gained ice field"
		if(t==7)
			src.contents+=new/obj/skillcard/Death_Note
			src<<"You find a strange note book with the title, Death Note"
		if(t==8)
			src.GainExp(src.mexp*4)
			src<<"You found and consume an experience pill! You got [src.mexp*4] exp!"
		if(t==9)
			src.levelpoints+=1000
			src<<"You have gained 1000 level points"
		if(t==10)
			src.eventpoints+=30
			src<<"You have gained 25 event points"
		if(t==11)
			src.contents+=new/obj/items/equipable/Overshirt/Organization_XIII
			src<<"You have found a robe that belongs to Organization XIII"
		if(t==12)
			src.levelpoints+=2000
			src<<"You have gained 2000 Level points"
		if(t==13)
			if(prob(20))
				src<<"You found an autographed picture of the famous Banjo Player Akumazoku!!!!!!You are now the luckiest player in the game, here take these 5000 level points and 2 million zen!"
				src.levelpoints+=5000
				src.GainMoney(2000000)
			else
				src<<"You found a dirty shoe, better luck next time."
		if(t==14)
			src.skillspassive+=6
			src<<"You have gained 6 passive points"
		if(t==15)
			src.combos+=3
			src<<"You have gained 3 combo points"
		if(t==16)
			src.GainExp(src.mexp*5)
			src<<"You found and consume an Aeverage experience pill! You got [src.mexp*5] exp!"
		if(t==17)
			src.GainExp(src.mexp*6)
			src<<"You found and consume an Strong experience pill! You got [src.mexp*6] exp!"
		if(t==18)
			src.GainExp(src.mexp*7)
			src<<"You found and consume an Ultra experience pill! You got [src.mexp*7] exp!"
		if(t==19)
			src<<"You have found 3 Donor Points!"
			src.donor_points+=3
			src.total_bought+=3

	DungeonR2()
		if(prob(30))
			world <<"<b><font size=2>[src] has found the autograph of the famous Relapse!!"
			src.relapseAutographs++
		var/t=pick(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19)
		if(t==1)
			src.contents+=new/obj/skillcard/Sharingan
			src.gotsharingan = 1
			src<<"You have gained Sharingan"
		if(t==2)
			src.contents+=new/obj/skillcard/Pure_Atk
			src<<"You have gained Pure Atk"
		if(t==3)
			src.contents+=new/obj/skillcard/Pure_Def
			src<<"You have gained Pure Def"
		if(t==4)
			src.contents+=new/obj/skillcard/Pure_Rei
			src<<"You have gained Pure Rei"
		if(t==5)
			src.contents+=new/obj/skillcard/Life_Contract
			src<<"You have gained Life Contract"
		if(t==6)
			src.contents+=new/obj/skillcard/Ice_Field
			src<<"You have gained ice field"
		if(t==7)
			src.contents+=new/obj/skillcard/Death_Note
			src<<"You find a strange note book with the title, Death Note"
		if(t==8)
			src.GainExp(src.mexp*4)
			src<<"You found and consume an experience pill! You got [src.mexp*4] exp!"
		if(t==9)
			src.levelpoints+=1000
			src<<"You have gained 1000 level points"
		if(t==10)
			src.eventpoints+=30
			src<<"You have gained 25 event points"
		if(t==11)
			src.contents+=new/obj/items/equipable/Overshirt/Organization_XIII
			src<<"You have found a robe that belongs to Organization XIII"
		if(t==12)
			src.levelpoints+=2000
			src<<"You have gained 2000 Level points"
		if(t==13)
			if(prob(10))
				src<<"You found an autographed picture of the famous Banjo Player Akumazoku!!!!!!You are now the luckiest player in the game, here take these 10000 skill points and 2 million zen!"
				src.skillpoints+=10000
				src.GainMoney(2000000)
			else
				src<<"You found a dirty shoe, better luck next time."
		if(t==14)
			src.skillspassive+=6
			src<<"You have gained 6 passive points"
		if(t==15)
			src.combos+=3
			src<<"You have gained 3 combo points"
		if(t==16)
			src.GainExp(src.mexp*5)
			src<<"You found and consume an Average experience pill! You got [src.mexp*5] exp!"
		if(t==17)
			src.GainExp(src.mexp*6)
			src<<"You found and consume an Strong experience pill! You got [src.mexp*6] exp!"
		if(t==18)
			src.GainExp(src.mexp*7)
			src<<"You found and consume an Ultra experience pill! You got [src.mexp*7] exp!"
		if(t==19)
			src<<"You have found 3 Donor Points!"
			src.donor_points+=3
			src.total_bought+=3

	DungeonR3()
		if(prob(30))
			world <<"<b><font size=2>[src] has found the autograph of the famous Relapse!!"
			src.relapseAutographs++
		var/t=pick(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19)
		if(t==1)
			src.contents+=new/obj/skillcard/Sharingan
			src.gotsharingan = 1
			src<<"You have gained Sharingan"
		if(t==2)
			src.contents+=new/obj/skillcard/Pure_Atk
			src<<"You have gained Pure Atk"
		if(t==3)
			src.contents+=new/obj/skillcard/Pure_Def
			src<<"You have gained Pure Def"
		if(t==4)
			src.contents+=new/obj/skillcard/Pure_Rei
			src<<"You have gained Pure Rei"
		if(t==5)
			src.contents+=new/obj/skillcard/Life_Contract
			src<<"You have gained Life Contract"
		if(t==6)
			src.contents+=new/obj/skillcard/Ice_Field
			src<<"You have gained ice field"
		if(t==7)
			src.contents+=new/obj/skillcard/Death_Note
			src<<"You find a strange note book with the title, Death Note"
		if(t==8)
			src.GainExp(src.mexp*4)
			src<<"You found and consume an experience pill! You got [src.mexp*4] exp!"
		if(t==9)
			src.levelpoints+=1000
			src<<"You have gained 1000 level points"
		if(t==10)
			src.eventpoints+=30
			src<<"You have gained 25 event points"
		if(t==11)
			src.contents+=new/obj/items/equipable/Overshirt/Organization_XIII
			src<<"You have found a robe that belongs to Organization XIII"
		if(t==12)
			src.levelpoints+=2000
			src<<"You have gained 2000 level points"
		if(t==13)
			if(prob(20))
				src<<"You found an autographed picture of the famous Banjo Player Akumazoku!!!!!!You are now the luckiest player in the game, here take these 10000 skill points and 2 million zen!"
				src.skillpoints+=10000
				src.GainMoney(2000000)
			else
				src<<"You found a dirty shoe, better luck next time."
		if(t==14)
			src.skillspassive+=6
			src<<"You have gained 6 passive points"
		if(t==15)
			src.combos+=3
			src<<"You have gained 3 combo points"
		if(t==16)
			src.GainExp(src.mexp*5)
			src<<"You found and consume an Average experience pill! You got [src.mexp*5] exp!"
		if(t==17)
			src.GainExp(src.mexp*6)
			src<<"You found and consume an Strong experience pill! You got [src.mexp*6] exp!"
		if(t==18)
			src.GainExp(src.mexp*7)
			src<<"You found and consume an Ultra experience pill! You got [src.mexp*7] exp!"
		if(t==19)
			src<<"You have found 4 Donor Points!"
			src.donor_points+=4
			src.total_bought+=4

	Crownrare()
		var/t=pick(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21)
		if(t==1)
			src.contents+=new/obj/skillcard/Sharingan
			src.gotsharingan = 1
			src<<"You have gained Sharingan"
		if(t==2)
			src.contents+=new/obj/skillcard/Pure_Atk
			src<<"You have gained Pure Atk"
		if(t==3)
			src.contents+=new/obj/skillcard/Pure_Def
			src<<"You have gained Pure Def"
		if(t==4)
			src.contents+=new/obj/skillcard/Pure_Rei
			src<<"You have gained Pure Rei"
		if(t==5)
			src.contents+=new/obj/skillcard/Life_Contract
			src<<"You have gained Life Contract"
		if(t==6)
			src.contents+=new/obj/skillcard/Ice_Field
			src<<"You have gained ice field"
		if(t==7)
			src.contents+=new/obj/skillcard/Death_Note
			src<<"You find a strange note book with the title, Death Note"
		if(t==8)
			src.GainExp(src.mexp*3)
			src<<"You found and consume an experience pill!"
		if(t==9)
			src.levelpoints+=800
			src<<"You have gained 800 level points"
		if(t==10)
			src.eventpoints+=25
			src<<"You have gained 25 event points"
		if(t==11)
			src.contents+=new/obj/items/equipable/Overshirt/Organization_XIII
			src<<"You have found a robe that belongs to Organization XIII"
		if(t==12)
			src.skillpoints+=2000
			src<<"You have gained 2000 skill points"
		if(t==13)
			src<<"You found an autographed picture of the famous Relapse!!"
			src.skillpoints+=10000
		if(t==14)
			src.skillspassive+=4
			src<<"You have gained 4 passive points"
		if(t==15)
			src.combos+=1
			src<<"You have gained a combo point"
		if(t==16)
			src.GainExp(src.mexp*4)
			src<<"You found and consume an experience pill!"
		if(t==17)
			src.GainExp(src.mexp*5)
			src<<"You found and consume an experience pill!"
		if(t==18)
			src.GainExp(src.mexp*6)
			src<<"You found and consume an experience pill!"
		if(t==19)
			src.contents+=new/obj/skillcard/PrinceRewardShot
			src<<"<b><font color=yellow>You have found a scroll containing a skill the prince taught to his underlings</font></b>"
		if(t==20)
			src.contents+=new/obj/skillcard/Hyosuke_Stun
			src<<"<b><font color=yellow>You have found a scroll containing the second skill the prince taught to his underlings</font></b>"
		if(t==21)
			src.donor_points += 5
			src.total_bought += 5
			src<<"You have earned 5 DP, you now have [src.donor_points]!"


	RelapseChest()
		if(prob(50))
			world <<"<b><font size=2>[src] has found the autograph of the famous Relapse!!"
			src.relapseAutographs+=5
		var/t=pick(1,2,3,4)
		if(t==1)
			src.GainExp(src.mexp*4)
			src<<"You found and consume an experience pill!"
		if(t==2)
			src.GainExp(src.mexp*5)
			src<<"You found and consume an experience pill!"
		if(t==3)
			src.GainExp(src.mexp*6)
			src<<"You found and consume an experience pill!"
		if(t==4)
			src.donor_points += 5
			src.total_bought += 5
			src.GainExp(src.mexp*3)
			src<<"You have earned 5 DP and consumed an experience pill, you now have [src.donor_points]!"

	Respawn(time=600)
		src.noboost=0
		src.noslow=0
		src.nostun=0
		src.noskill=0
		src.nomelee=0
		src.nomove=0
		if(src.flags=="red")
			src.flags=null
			var/obj/k=new/obj/Flags/Red(src.loc)
			k.opened=1
		if(src.flags=="blue")
			src.flags=null
			var/obj/k=new/obj/Flags/Blue(src.loc)
			k.opened=1
		if(src.shinip||src.earth)src.safe=1
		if(src.hollow)src.safe=0
		src.inghouse=0
		src.loc=locate(src.rx,src.ry,src.rz)
		src.GiveDonorStats()
	//	src.aftereventbuffs()
		if(src.raid)
			world<< "<b><font color = lime>Raider [src] has died"
			src.raid=0
		spawn()RaidStill()
		if(src.ingwar==1)
			src.ingwar=2
			if(src.guildname==H1name)
				H1ally-=1
				H1Winner()
			if(src.guildname==E1name)
				H1enemy-=1
				H1Winner()
			if(src.guildname==H2name)
				H2ally-=1
				H2Winner()
			if(src.guildname==E2name)
				H2enemy-=1
				H2Winner()
			if(src.guildname==H3name)
				H3ally-=1
				H3Winner()
			if(src.guildname==E3name)
				H3enemy-=1
				H3Winner()
			if(src.guildname==H4name)
				H4ally-=1
				H4Winner()
			if(src.guildname==E4name)
				H4enemy-=1
				H4Winner()
			if(src.guildname==H5name)
				H5ally-=1
				H5Winner()
			if(src.guildname==E5name)
				H5enemy-=1
				H5Winner()
		if(src.ctf&&src.lost&&eventon==1)
			src.frozen=1
			src.safe=1
			if(src.colorr=="Red")
				var/list/spawnpoints=new
				for(var/obj/redspawn/Xx in world)
					var/turf/L=Xx.loc

					spawnpoints+=L
				var/obj/ey=pick(spawnpoints)
				src.loc=locate(ey.x,ey.y,ey.z)
			if(src.colorr=="Blue")
				var/list/spawnpoints=new
				for(var/obj/bluespawn/Xx in world)
					var/turf/L=Xx.loc

					spawnpoints+=L
				var/obj/ey=pick(spawnpoints)
				src.loc=locate(ey.x,ey.y,ey.z)
			spawn(time)
				src<<"You can now play"
				src.frozen=0
				src.safe=0
	Angel()
		src.angeled=1
		src.Load_Overlays()
		spawn(20)
			src.angeled=0
			src.Load_Overlays()
	HRecoil()
		spawn(600)
		src.hrecoilcool=0
	Coiled(mob/M)
		src.coiled=M
		src<<"You would sacrifice yourself for [M]"
		spawn(100)
			src.coiled=0
			src<<"Your feelings are normal again"
	Stunnage()
		if(src.frozen)return
		if(src.nostun)return
		src.frozen=1
		spawn(8)
			src.frozen=0
	BrokenArm()
		if(src.protected)
			src<<"<font color=red>Your limbs can't break in this state"
			return
		if(src.lorelei>1 || src.name == "Yammy" || src.name == "Fire Demon" || src.name == "Dark Pheonix")
			return
		if(src.arm)return
		if(prob(src.boneharden*7.5))
			src<<"<font color=red>Your bones are too hard to feel it"
			return
		src.arm=1
		src.canattacks=1
		spawn(50)
			src.canattacks=0
			src.arm=0
	BrokenCore()
		if(src.protected)
			src<<"<font color=red>Your limbs can't break in this state"
			return
		if(src.lorelei>1|| src.name == "Yammy" || src.name == "Fire Demon" || src.name == "Dark Pheonix")
			return
		if(src.core)return
		if(prob(src.boneharden*7.5))
			src<<"<font color=red>Your bones are too hard to feel it"
			return
		src.fireback=1
		src.core=1
		spawn(50)
			src.fireback=0
			src.core=0
	BrokenLeg()
		if(src.protected)
			src<<"<font color=red>Your limbs can't break in this state"
			return
		if(src.lorelei>1|| src.name == "Yammy" || src.name == "Fire Demon" || src.name == "Dark Pheonix")
			return
		if(src.leg)return
		if(prob(src.boneharden*7.5))
			src<<"<font color=red>Your bones are too hard to feel it"
			return
		src.leg=1
		var/d=src.rundelay
		src.rundelay+=2
		spawn(50)
			src.leg=0
			if(src.rundelay>d)
				src.rundelay=2
	BrokenHead()
		if(src.protected)
			src<<"<font color=red>Your limbs can't break in this state"
			return
		if(src.lorelei>1|| src.name == "Yammy" || src.name == "Fire Demon" || src.name == "Dark Pheonix")
			return
		if(src.confused)return
		if(prob(src.boneharden*7.5))
			src<<"<font color=red>Your skull is too hard to feel it"
			return
		src.confused=1
		spawn(50)
			src.confused=0
proc
/*
	Replace proc
	This replaces word in text with replace
	All three arguments are expected to be text
*/
	Replace(text,word,replace)
		var/pos = findtext(text,word)
		while(pos)
			text = copytext(text,1,pos) + replace + copytext(text,pos+length(word))
			pos = findtext(text,word)
		return text

/*
	Replace All proc
	replace_list: list in the format word = replace
	replaces each word with it's replace entry
*/
	Replace_All(text,replace_list)
		for(var/word in replace_list)
			var/pos = findtext(text,word)
			while(pos)
				text = copytext(text,1,pos) + replace_list[word] + copytext(text,pos+length(word))
				pos = findtext(text,word)
		return text
mob
	proc
		Where()
			if(z==5)
				return "Inside a Soul Society building"
			if(z==8)
				return "Inner Self"
			if(z==10)
				return "Yukio: WWA"
			if(z==1&&x<100&&y>120)
				return "Inside an Earth building"
			if(z==13)
				return "Event Area"
			if(z==14)
				return "Boss Fight"
			if(z==16)
				return "Kepachi Barracks"
			if(z==19)
				return "Haunted House/Lab/Gotei Event"
			if(z==9)
				return "Vandereich/Guild Base"
			var/d=""
			var/s=""
			if(y<66&&x<66)
				d="Bottomleft corner of"
			if(y<66&&x>=66&&x<132)
				d="Lower part of"
			if(y<66&&x>=132)
				d="Bottomright corner of"
			if(y>=66&&y<132&&x<66)
				d="Left part of"
			if(y>=66&&y<132&&x>=66&&x<132)
				d="Middle of"
			if(y>=66&&y<132&&x>=132)
				d="Right part of"
			if(y>=132&&x<66)
				d="Topleft corner of"
			if(y>=132&&x>=66&&x<132)
				d="Upper part of"
			if(y>=132&&x>=132)
				d="Topright corner of"
			if(z==1)
				s="Cross Roads or Purple Portal"
			if(z==2)
				s="Earth"
			if(z==3)
				s="Hueco Mundo"
			if(z==4)
				s="Soul Society"
			if(z==7)
				s="Rukongai"
			if(z==6)
				s="Bankai Training Facility"
			if(z==11)
				s="Las Noches"
			if(z==12)
				s="Lost Vaizard Forest"
			if(z==15)
				s="Menos Forest"
			if(z==17)
				s="Southern Karakura Town"
			if(z==18)
				s="Ultimate Forest"
			if(z==21)
				s="Hell"
			if(z==22)
				s="UnderWorld"
			if(!src.client)
				d="[x],[y]"
			return "[d] [s]"
mob/proc
	SenkeiCool()
		src.senkeicool=1
		spawn(7)
		src.senkeicool=0
	Hard_Hit(hit)
		src.attack-=hit
		src.reiatsu-=hit
		src.defence-=hit
		src.rundelay+=5
		src.hardhitted=1
		spawn(80)
			src.attack+=hit
			src.reiatsu+=hit
			src.defence+=hit
			src.rundelay-=5
			src.hardhitted=0
	Spins()
		src.dir=NORTH
		spawn(2)
		src.dir=EAST
		spawn(4)
		src.dir=SOUTH
		spawn(6)
		src.dir=WEST
		spawn(7)
		src.dir=NORTH
		spawn(8)
		src.dir=EAST
		spawn(9)
		src.dir=SOUTH
	FGTTime()
		src.fgttime=src.fgtmax
		gf
		if(src.fgttime==1)
			src<<"<b>You have lost your powers!"
			src.rei=0
			src.attack=src.mattack
			src.defence=src.mdefence
			src.reiatsu=src.mreiatsu
			src.infinal=0
			src.firing=1
			usr.rundelay+=3
			src.canattacks=1
			src.lostpowers=1
			src.wound+=20
			src.Load_Overlays()
			sleep(300)
			src<<"<b>You got your powers back!"
			src.lostpowers=0
			src.rundelay=2
			src.firing=0
			src.canattacks=0
			if(src.race=="Shinigami")
				src<<"<b>You can now use Final Bankai"
			if(src.race=="Fullbringer")
				src<<"<b>You can now use Finalbring"
			return
		src.fgttime-=1
		src<<"<b>[src.fgttime] Seconds Left!"
		sleep(10)
		if(src.fgttime)goto gf
mob/proc
	Make_Coffin(atom/M)
		var/dista=get_dist(usr,M)
		if(dista>8)return
		var/obj/D=new/obj/Coffin/k1(locate(M.x,M.y,M.z))
		new/obj/Coffin/k2(locate(M.x,M.y,M.z))
		new/obj/Coffin/k21(locate(M.x,M.y,M.z))
		new/obj/Coffin/k211(locate(M.x,M.y,M.z))
		new/obj/Coffin/k2111(locate(M.x,M.y,M.z))
		new/obj/Coffin/k21111(locate(M.x,M.y,M.z))
		new/obj/Coffin/k3(locate(M.x,M.y,M.z))
		new/obj/Coffin/k31(locate(M.x,M.y,M.z))
		new/obj/Coffin/k311(locate(M.x,M.y,M.z))
		new/obj/Coffin/k3111(locate(M.x,M.y,M.z))
		new/obj/Coffin/k31111(locate(M.x,M.y,M.z))
		new/obj/Coffin/k4(locate(M.x,M.y,M.z))
		new/obj/Coffin/k41(locate(M.x,M.y,M.z))
		new/obj/Coffin/k411(locate(M.x,M.y,M.z))
		new/obj/Coffin/k4111(locate(M.x,M.y,M.z))
		new/obj/Coffin/k41111(locate(M.x,M.y,M.z))
		new/obj/Coffin/k5(locate(M.x,M.y,M.z))
		new/obj/Coffin/k51(locate(M.x,M.y,M.z))
		new/obj/Coffin/k511(locate(M.x,M.y,M.z))
		new/obj/Coffin/k5111(locate(M.x,M.y,M.z))
		new/obj/Coffin/k51111(locate(M.x,M.y,M.z))
		new/obj/Coffin/k11(locate(M.x,M.y,M.z))
		new/obj/Coffin/k111(locate(M.x,M.y,M.z))
		new/obj/Coffin/k1111(locate(M.x,M.y,M.z))
		new/obj/Coffin/k11111(locate(M.x,M.y,M.z))
		D.Gowner=usr
		usr.coffin=0
	Make_Danku(atom/M)
		var/dista=get_dist(usr,M)
		if(dista>8)return
		var/obj/D=new/obj/Danku/side/a1(locate(M.x,M.y,M.z))
		new/obj/Danku/side/a1(locate(M.x-2,M.y-1,M.z))
		new/obj/Danku/side/a2(locate(M.x-2,M.y,M.z))
		new/obj/Danku/side/a3(locate(M.x-2,M.y+1,M.z))
		new/obj/Danku/side/a1(locate(M.x+2,M.y-1,M.z))
		new/obj/Danku/side/a2(locate(M.x+2,M.y,M.z))
		new/obj/Danku/side/a3(locate(M.x+2,M.y+1,M.z))
		new/obj/Danku/a1(locate(M.x-1,M.y+2,M.z))
		new/obj/Danku/a2(locate(M.x,M.y+2,M.z))
		new/obj/Danku/a3(locate(M.x+1,M.y+2,M.z))
		new/obj/Danku/a1(locate(M.x-1,M.y-2,M.z))
		new/obj/Danku/a2(locate(M.x,M.y-2,M.z))
		new/obj/Danku/a3(locate(M.x+1,M.y-2,M.z))
		D.Gowner=usr
		usr.fulldanku=0
	Speedy()
		usr.speedy=1
		spawn(200)
		usr.speedy=0
	aware()
		usr.aware=1
		usr.instinct+=5
		usr.quickflash+=5
		spawn(200)
			usr.aware=0
			usr.instinct-=5
			usr.quickflash-=5
	invisiblepill()
		usr.invisibility=50
		usr.sight|= SEE_SELF
		spawn(600)
		usr.invisibility=0
	Purple_Drank(mob/M)
		M.client.DE_SFL_purp()
		M.protected=1
		spawn(100)
		M.protected=0
		spawn(1)
			//var/oldeye=M.client.eye
			var/x
			for(x=0;x<50,x++)
				if(M)
					if(M.trippy==4)
						M.trippy=0
					if(M.trippy==3)
						M.client.eye = M
						M.trippy=4
					if(M.trippy==2)
						M.client.eye = get_steps(M,WEST,1)
						M.trippy=3
					if(M.trippy==1)
						M.client.eye = M
						M.trippy=2
					if(!M.trippy)
						M.client.eye = get_steps(M,EAST,1)
						M.trippy=1
					sleep(2)
			M.client.eye=M
	Use_Petals(d,atom/M)
		if(usr.ko)
			usr<<"You're koed!"
			return
		if(usr.frozen)
			usr<<"You're stunned!"
			return
		if(usr.spectate)
			usr<<"Not while sensing"
			return
		if(M)
			for(var/turf/T in view(0,M))
				M=T
		if(usr.stype=="Byakuya")
			if(d==0)
				var/di=usr.dir
				var/obj/T2 = new/obj/pedals(usr.loc)
				T2.Gowner = usr
				step(T2,di)
				spawn(1)
					if(!T2)return
					var/obj/T3 = new/obj/pedals(T2.loc)
					T3.Gowner = usr
					step(T3,di)
					spawn(1)
						if(!T3)return
						var/obj/T4 = new/obj/pedals(T3.loc)
						T4.Gowner = usr
						step(T4,di)
						spawn(1)
							if(!T4)return
							var/obj/T5 = new/obj/pedals(T4.loc)
							T5.Gowner = usr
							step(T5,di)
			if(d>0)
				var/obj/T2 = new/obj/pedals(usr.loc)
				T2.Gowner = usr
				step_to(T2,M)
				spawn(1)
				if(d>1)
					if(!T2)return
					var/obj/T3 = new/obj/pedals(T2.loc)
					T3.Gowner = usr
					step_to(T3,M)
					spawn(1)
					if(d>2)
						if(!T3)return
						var/obj/T4 = new/obj/pedals(T3.loc)
						T4.Gowner = usr
						step_to(T4,M)
						spawn(1)
						if(d>3)
							if(!T4)return
							var/obj/T5 = new/obj/pedals(T4.loc)
							T5.Gowner = usr
							step_to(T5,M)
							spawn(1)
							if(d>4)
								if(!T5)return
								var/obj/T6 = new/obj/pedals(T5.loc)
								T6.Gowner = usr
								step_to(T6,M)
								spawn(1)
								if(d>5)
									if(!T6)return
									var/obj/T7 = new/obj/pedals(T6.loc)
									T7.Gowner = usr
									step_to(T7,M)
									spawn(1)
									if(d>6)
										if(!T7)return
										var/obj/T8 = new/obj/pedals(T7.loc)
										T8.Gowner = usr
										step_to(T8,M)
		if(usr.stype=="Rangiku")
			if(d==0)
				var/di=usr.dir
				var/obj/T2 = new/obj/smoke(usr.loc)
				T2.Gowner = usr
				step(T2,di)
				spawn(1)
					var/obj/T3 = new/obj/smoke(T2.loc)
					T3.Gowner = usr
					step(T3,di)
					spawn(1)
						var/obj/T4 = new/obj/smoke(T3.loc)
						T4.Gowner = usr
						step(T4,di)
						spawn(1)
							var/obj/T5 = new/obj/smoke(T4.loc)
							T5.Gowner = usr
							step(T5,di)
			if(d>0)
				var/obj/T2 = new/obj/smoke(usr.loc)
				T2.Gowner = usr
				step_to(T2,M)
				spawn(1)
				if(d>1)
					var/obj/T3 = new/obj/smoke(T2.loc)
					T3.Gowner = usr
					step_to(T3,M)
					spawn(1)
					if(d>2)
						var/obj/T4 = new/obj/smoke(T3.loc)
						T4.Gowner = usr
						step_to(T4,M)
						spawn(1)
						if(d>3)
							var/obj/T5 = new/obj/smoke(T4.loc)
							T5.Gowner = usr
							step_to(T5,M)
							spawn(1)
							if(d>4)
								var/obj/T6 = new/obj/smoke(T5.loc)
								T6.Gowner = usr
								step_to(T6,M)
								spawn(1)
								if(d>5)
									var/obj/T7 = new/obj/smoke(T6.loc)
									T7.Gowner = usr
									step_to(T7,M)
									spawn(1)
									if(d>6)
										var/obj/T8 = new/obj/smoke(T7.loc)
										T8.Gowner = usr
										step_to(T8,M)
	RageCheck()
		if(src.rage<40)src.rage=40
		var/s=src.rage
		var/g=s-src.steadyrage
		src.attack += src.mattack * g/8
		src.steadyrage=src.rage
		src.Load_Overlays()
	Burst()
		var/obj/K = new/obj/hina2(src.loc)
		K:Gowner = src
		K.dir=src.dir
		walk(K,src.dir)
		spawn(1)
			if(K)
				var/obj/Ka = new/obj/hina2(K.loc)
				Ka:Gowner = src
				Ka.dir = turn(K.dir, 45)
				walk(Ka,Ka.dir)
				var/obj/Ks = new/obj/hina2(K.loc)
				Ks:Gowner = src
				Ks.dir = turn(K.dir, -45)
				walk(Ks,Ks.dir)
				spawn(1)
					if(Ka)
						var/obj/Kaa = new/obj/hina2(Ka.loc)
						Kaa:Gowner = src
						Kaa.dir = turn(Ka.dir, -45)
						walk(Kaa,Kaa.dir)
					if(Ks)
						var/obj/Kss = new/obj/hina2(Ks.loc)
						Kss:Gowner = src
						Kss.dir = turn(Ks.dir, 45)
						walk(Kss,Kss.dir)
	MPoisoned(mob/hitter)
		hitter<<"<font color=purple>You have lethaly poisoned [src]"
		src<<"<font color=purple>You have been lethaly poisoned by [hitter]"
		fg
		src.lacerated+=1
		src.Death(hitter,round(hitter.mhealth/regenrate,2)*4,0)
		if(src.lacerated>=20)
			lacerated=0
			return
		spawn(10)
		goto fg
	Smashed(mob/M)
		src.moving=0
		step(src,src.dir)
		src.dir= turn(src.dir, 180)
		flick("punch",src)
		if(M.flags)
			var/damage = round(src.attack)
			if(src.ressurectiontype=="Ulq")damage=round(src.reiatsu*3)
			damage+=rand(damage/2,damage/1.5)
			damage=rand(damage*0.8,damage*1.2)
			if(damage<1)damage=1
			view(src,8) << "<b><font color = red>[src] Threw [M]!"
			M.Death(src,damage,rand(2,5))
			return
		src.frozen=1
		spawn(2)
		src.frozen=0
		var/d=src.dir
		spawn(1)
			M.moving=0;step(M,d);M.moving=0;step(M,d);M.moving=1
			spawn(1)
				M.moving=0;step(M,d);M.moving=0;step(M,d);M.moving=1
				spawn(1)
					M.moving=0;step(M,d);M.moving=0;step(M,d);M.moving=1
					spawn(1)
						M.moving=0;step(M,d);M.moving=0;step(M,d);M.moving=0
						var/damage = round(src.attack)
						if(src.ressurectiontype=="Ulq")damage=round(src.reiatsu*1.5)
						damage+=rand(damage/2,damage/1.5)
						damage-=M.defence/2
						damage=rand(damage*0.8,damage*1.2)
						if(damage<1)damage=1
						view(src,8) << "<b><font color = red>[src] Threw [M]!"
						M.Death(src,damage,rand(2,5))
	ESmashed(mob/M)
		src.moving=0
		step(src,src.dir)
		src.dir= turn(src.dir, 180)
		flick("punch",src)
		if(M.flags)
			var/damage = round(src.attack)
			damage+=rand(damage/2,damage/1.5)
			damage-=M.defence/1.5
			damage=rand(damage*0.8,damage*1.2)
			if(damage<1)damage=1
			view(src,8) << "<b><font color = red>[src] Threw [M]!"
			M.Death(src,damage,rand(5,10))
			return
		src.frozen=1
		spawn(2)
		src.frozen=0
		var/d=src.dir
		spawn(1)
			M.moving=0;step(M,d);M.moving=0;step(M,d);M.moving=1
			spawn(1)
				M.moving=0;step(M,d);M.moving=0;step(M,d);M.moving=1
				spawn(1)
					M.moving=0;step(M,d);M.moving=0;step(M,d);M.moving=1
					spawn(1)
						M.moving=0;step(M,d);M.moving=0;step(M,d);M.moving=0
						var/damage = round(src.attack)
						damage+=rand(damage/2,damage/1.5)
						damage-=M.defence/1.5
						damage=rand(damage*0.8,damage*1.2)
						if(damage<1)damage=1
						view(src,8) << "<b><font color = red>[src] Threw [M]!"
						M.Death(src,damage,rand(5,10))

proc
	Hollow_Spawn()
		gf
		if(gamehollowsalive<50)
			gamehollowsalive+=1
			var/list/Menu = list()
			for(var/obj/hollowspawn/M in world)
				Menu.Add(M)
			var/obj/id=pick(Menu)
			var/mob/D=new/mob/hollow(locate(id.x,id.y,id.z))
			D.gamehollow=1
			D.mhealth=1
			D.health=1
			D.hostile=1
			D.agrange=8
			spawn(1)
			if(gamehollowsalive<50)
				goto gf
	M_Machine()
		if(!mugetmachine)
			mugetmachine=1
			var/list/Menu = list()
			for(var/mob/M in world)
				if(M.mmachine)
					Menu.Add(M)
			gf
			var/mob/D=pick(Menu)
			D.rei+=6000
			D.mugetsucd=0
			var/alset=0
			for(var/mob/P in oview(13))
				if(P.client)
					alset=1
			if(alset)
				D.Mugetsu()
			spawn(10)
			goto gf
obj/vastospawn
var/mugetmachine=0
var/gamehollowsalive=0
var/vastosalive=0
mob/proc
	Fire_Petals()
		if(usr.petalsfired)return
		usr.petalsfired=1
		if(usr.inshikai)
			spawn(12)
			usr.petalsfired=0
		if(usr.inbankai)
			spawn(9)
			usr.petalsfired=0
	Smoking(mob/M)
		M.smoked+=src
		src.smoking=1
		src.Load_Overlays()
		spawn(20)
			src.smoking=0
			M.smoked-=src
			src.Load_Overlays()
	MakeReigai(mob/M)
		var/mob/R = new/mob(M.loc)
		R.legit=1
		R.level=M.level*2
		R.icon=M.icon
		R.armon=M.armon
		R.finalb=M.finalb
		R.bowon=M.bowon
		if(!M.bowon&&!M.seelsword)
			if(M.race=="Quincy")
				R.bowon=1
		R.sanrei=M.sanrei
		if(M.level>=100&&M.level<300)
			if(M.race=="Sado")R.sadostrong=1
			if(M.race=="Quincy")R.quincystrong=1
		if(M.level>=300)
			if(M.race=="Sado")R.ultimatesado=1
			if(M.race=="Quincy")R.ultimatequincy=1
		if(M.race=="Vaizard")R.vasto=1
		if(M.stype=="Unohana")R.regenmode=1
		R.seelsword=M.seelsword
		R.renjibankai=M.renjibankai
		R.renjishikai=M.renjishikai
		R.ikkakushikai=M.ikkakushikai
		R.hasashikai=M.shikai
		R.hasabankai=M.bankai
		R.iszan=M.iszan
		R.cerored=M.cerored
		R.cerogreen=M.cerogreen
		R.ceroblue=M.ceroblue
		R.icon_name=M.icon_name
		R.hollowtype=M.hollowtype
		R.health=M.mhealth*2.5
		R.attack=M.attack*2.5
		R.defence=M.defence*2.5
		R.mhealth=M.mhealth*2.5
		R.mattack=M.mattack*2.5
		R.mdefence=M.mdefence*2.5
		R.mrei=M.mrei*2.5
		R.rei=M.mrei*2.5
		R.reiatsu=M.reiatsu*2.5
		R.mreiatsu=M.mreiatsu*2.5
		R.race=M.race
		R.swordon=1
		R.stype=M.stype
		R.wound=0
		R.ressurectiontype=M.ressurectiontype
		R.ftype=M.ftype
		R.inafull=M.inafull
		R.infull=M.infull
		R.getsugaring=M.getsugaring
		R.bringerblast=M.bringerblast
		R.thits=M.thits
		R.undershirt=M.undershirt
		R.overshirt=M.overshirt
		R.armor=M.armor
		R.pants=M.pants
		R.legarmor=M.legarmor
		R.armarmor=M.armarmor
		R.facearmor=M.facearmor
		R.glasses=M.glasses
		R.cloak=M.cloak
		R.back=M.back
		R.shoes=M.shoes
		R.special=M.special
		R.etarget=M
		R.hair_type=M.hair_type
		R.hair_red=M.hair_red
		R.hair_green=M.hair_green
		R.hair_blue=M.hair_blue
		R.jacket=M.jacket
		R.jacket_red=M.jacket_red
		R.jacket_green=M.jacket_green
		R.jacket_blue=M.jacket_blue
		R.shirt=M.shirt
		R.shirt_red=M.shirt_red
		R.shirt_green=M.shirt_green
		R.shirt_blue=M.shirt_blue
		R.pants_red=M.pants_red
		R.pants_green=M.pants_green
		R.pants_blue=M.pants_blue
		R.arrancarmask=M.arrancarmask
		R.inshikai=M.inshikai
		R.inbankai=M.inbankai
		R.ressurection=M.ressurection
		R.name="{Reigai}[M.name]"
		R.killable=1
		R.boss=1
		R.reigai=1
		R.dead=0
		R.enemy=1
		R.Load_Overlays()
		R.Affirm_Icon()
		step_away(R,M,5)
		R.Facedir(M)
		R.Aggro(M)
	StartShikCool()
		src.goingress+=1
		spawn(100)
		src.goingress-=1
	Freeze(time)
		if(src.nostun)return
		src.frozen=1
		spawn(time)
		src.frozen=0
		src.exception=0
		src.shadowing=0
	Time()
		src.time=rand(1,999999)
		var/k=src.time
		spawn(600)
		if(src.time==k)
			if(src.z==10)
				src.loc=locate(67,133,1)
				src.GainExp(100000)
				src<<"<font color=purple>You have gained 100,000 exp and $20,000!"
				src.GainMoney(20000)
				src.gamemish=3
	Rikuspeed()//mob/G)
		var/mob/M=src
		M.overlays += /obj/bakudou
		M.frozen=1
		/*var/d=G.level-M.level
		if(d>=40)d=40
		if(d<=20)d=20*/
		sleep(35)
		M.overlays -= /obj/bakudou
		M.frozen=0
	Memstrikes()
		src.memstrikecool=1
		spawn(800)
		src.memstrikecool=0
	Cantsee()
		src.sight &= ~(SEE_MOBS|SEE_OBJS|SEE_TURFS)
		src.sight |= BLIND
		src.sight |= SEE_SELF
		spawn(100)
			src.sight =0
			src<<"<b>You have gained the will to open your eyes!"
	Cantmove()
		if(src.lorelei>0)
			return
		src.frozen=1
		spawn(100)
			src.frozen=0
			src<<"<b>You have realized that standing still isn't helping!"
	Canthit()
		if(src.lorelei>0)
			return
		src.canattacks=1
		src.firing=1
		spawn(100)
			src.canattacks=0
			src.firing=0
			src<<"<b>You have gotten over your feelings and will fight back!"
	SaveFreeze()
		src.frozen=1
		src.firing=1
		if(!src.lacerated)
			src.lacerated=1
		spawn(30)
			src.frozen=0
			src.firing=0
			src.lacerated=0
	DelPro(mob/hitter)
		src.frozen=1
		src.firing=1
		fg
		src.lacerated+=1
		src.Death(hitter,round(hitter.reiatsu/2),pick(0,0,1))
		if(src.lacerated>=8)
			src.lacerated=0
			src.frozen=0
			src.firing=0
			return
		spawn(4)
		goto fg
	Poisoned(mob/hitter)
		src<<"<font color=purple>You have been poisoned from [hitter]!"
		fg
		src.lacerated+=1
		Blood(src.x,src.y,src.z)
		src.Death(hitter,round(hitter.attack/2),rand(0,1))
		if(src.lacerated>=20)
			lacerated=0
			return
		spawn(2)
		sleep(8 SECONDS)
		goto fg
	Bleeding(mob/hitter)
		src<<"<font color=purple>You've been severely wounded and have begun to bleed from [hitter]'s blade!"
		var/x=0
		while(x<=10)
			x++
			Blood(src.x,src.y,src.z)
			src.Death(hitter,round(hitter.attack),rand(0,3))
			x++
			sleep(5)
		return

/*		fg
		src.lacerated+=1
		Blood(src.x,src.y,src.z)
		src.Death(hitter,round(hitter.attack/3),rand(0,2))
		if(src.lacerated>=20)
			lacerated=0
			return
		spawn(2)
		goto fg*/
	Lacerated()
		fg
		src.lacerated+=1
		src.wound+=1
		Blood(src.x,src.y,src.z)
		if(src.lacerated>=20)
			lacerated=0
			return
		spawn(2)
		goto fg
	Aged()
		src.attack-=round(src.attack/10)
		src.defence-=round(src.defence/10)
		src.reiatsu-=round(src.reiatsu/10)
		view(10)<< "<b>[src] begins to feel the affects of Respira"
		src<<"<b>Your body has Aged and have become weaker due to Barragans ability!"
		spawn(100)
			if(src.attack!=src.mattack)
				src.attack+=round(src.attack/10)
			if(src.defence!=src.mdefence)
				src.defence+=round(src.defence/10)
			if(src.reiatsu!=src.mreiatsu)
				src.reiatsu+=round(src.reiatsu/10)
			src<<"<b>Barragan's Aging effect wore off and you now feel normal!"
	BeerBoost()
		src.beerboost=1
		src.attack+=round(src.mattack/2)
		src.defence+=round(src.mdefence/2)
		src.reiatsu+=round(src.mreiatsu/2)
		spawn(200)
			src.beerboost=0
			src.attack-=round(src.mattack/2)
			src.defence-=round(src.mdefence/2)
			src.reiatsu-=round(src.mreiatsu/2)
			src<<"<b>Your drunken boost has ended"
	drunkrage()
		src.inberserk=1
		spawn(100)
		src.inberserk=0
	firetech()
		src.firing=1
		spawn(100)
		src.firing=0
	beer3()
		src.beer3=1
		spawn(100)
		src.beer3=0
	beer1()
		src.rundelay+=3
		src.beer1=1
		spawn(100)
			if(src.rundelay<3)return
			src.rundelay-=3
			src.beer1=0
	Rewalk()
		src.restep=0
		spawn(100)
			src.restepping=0
		var/obj/afterImage = new /obj()
		afterImage.layer = MOB_LAYER
		afterImage.icon=src.icon
		afterImage.icon_state=src.icon_state
		afterImage.overlays=src.overlays
		afterImage.underlays = src.underlays
		afterImage.dir=src.dir
		afterImage.loc = src.loc
		afterImage.zer = 1
		flick("shun",afterImage)
		spawn(4)	del(afterImage)
		var/obj/JK=new/obj(src.steploc)
		for(var/mob/m in view(8,src))
			if(m.etarget==src)
				m.Untarget()
				var/image/I=image('Icons/tgt.dmi',JK,"",30)
				I.name="TargetUnder";src.client<<I
		JK.icon=src.icon
		JK.icon_state=src.icon_state
		JK.overlays=src.overlays
		JK.underlays = src.underlays
		JK.dir=src.dir
		flick("shun",JK)
		step(JK,src.step1)
		spawn(2)
			step(JK,src.step2)
			spawn(2)
				step(JK,src.step3)
				spawn(2)
					step(JK,src.step4)
					spawn(2)
						step(JK,src.step5)
						spawn(2)
							step(JK,src.step6)
							spawn(2)
								step(JK,src.step7)
								spawn(2)
									step(JK,src.step8)
									spawn(2)
										step(JK,src.step9)
										spawn(2)
											step(JK,src.step10)
											spawn(2)
												step(JK,src.step11)
												spawn(2)
													step(JK,src.step12)
													src.step1=0
													src.step2=0
													src.step3=0
													src.step4=0
													src.step5=0
													src.step6=0
													src.step7=0
													src.step8=0
													src.step9=0
													src.step10=0
													src.step11=0
													src.step12=0
													src.steploc=0
													del JK
													src.invisibility=0
													src.see_invisible=2
mob/proc
	Start_Zan_Restore()
		sleep(100)
		src.materializedcool=0
	Lost_Zan()
		if(src.inshikai)src.Shikai()
		if(src.inbankai)src.Bankai()
		if(src.ressurection)src.Ressurection()
		src.hedidit+=1
		sleep(200)
		src.hedidit-=1
	Wired()
		src.frozen=1
		spawn(50)
		src.frozen=0
mob/proc
	CeroGen()
		var/t=pick(1,2,3,4,5)
		if(t==2)src.cerocolor="Red"
		if(t==3)src.cerocolor="Blue"
		if(t==4)src.cerocolor="Green"
		if(t==5)src.cerocolor="Yellow"
mob/proc
	Berserks(mob/M)
		fig
		walk_towards(src,M)
		if(M in oview(1,src))
			src.Attack()
		spawn(2)
		if(src.etarget==M)
			goto fig
		else
			return
area/dojo
turf/proc
	Break(obj/s)
		for(var/turf/t in view(0,src))
			if(t.density)
				var/j=t.icon_state
				t.layer=22
				t.dir=s.dir
				t.icon_state="[t.icon_state]brold"
				t.density=0
				t.underlays +=/turf/Soul_Society/Floor
				for(var/turf/Soul_Society2/Roof1/l in view(0,t))
					var/d=t.icon_state
					l.layer=22
					l.dir=s.dir
					l.icon_state="[l.icon_state]brold"
					l.density=0
					l.underlays +=/turf/Soul_Society/Floor
					spawn(100)
						l.dir=SOUTH
						l.icon_state="[d]"
						l.density=1
						l.underlays-=/turf/Soul_Society/Floor
				spawn(100)
					t.dir=SOUTH
					t.icon_state="[j]"
					t.density=1
					t.underlays-=/turf/Soul_Society/Floor
mob/proc
	Blinding()
		src.sight |= BLIND
		src.sight |= SEE_SELF
		spawn(100)
		src.sight = 0
	Blinded()
		src.sight |= BLIND
		src.sight |= SEE_SELF
		spawn(20)
		src.sight =0
	Slowed(speed=5,time=20)
		if(src.noslow)return
		src.rundelay+=speed
		spawn(time)
		if(src.rundelay>=speed)
			src.rundelay-=speed
	Sovereign(mob/M)
		M<<"<b>Click anywhere to move [src]"
		src.controller=M
		src.controlled=1
		src.canattacks=1
		src.fireback=1
		M.controlbug=1
		spawn(70)
			M<<"<b>You stop controlling [src]"
			src.controller=null
			src.controlled=0
			src.fireback=0
			M.controlbug=0
			src.canattacks=0
atom/proc
	MakeBombs()
		new/obj/explode/k5(locate(src.x-2,src.y-1,src.z))
		new/obj/explode/k5(locate(src.x-1,src.y-1,src.z))
		new/obj/explode/k5(locate(src.x,src.y-1,src.z))
		new/obj/explode/k5(locate(src.x+1,src.y-1,src.z))
		new/obj/explode/k5(locate(src.x+2,src.y-1,src.z))
		new/obj/explode/k5(locate(src.x-2,src.y-2,src.z))
		new/obj/explode/k5(locate(src.x-1,src.y-2,src.z))
		new/obj/explode/k5(locate(src.x,src.y-2,src.z))
		new/obj/explode/k5(locate(src.x+1,src.y-2,src.z))
		new/obj/explode/k5(locate(src.x+2,src.y-2,src.z))
		new/obj/explode/k5(locate(src.x-2,src.y,src.z))
		new/obj/explode/k5(locate(src.x-1,src.y,src.z))
		new/obj/explode/k5(locate(src.x,src.y,src.z))
		new/obj/explode/k5(locate(src.x+1,src.y,src.z))
		new/obj/explode/k5(locate(src.x+2,src.y,src.z))
		new/obj/explode/k5(locate(src.x-1,src.y+1,src.z))
		new/obj/explode/k5(locate(src.x,src.y+1,src.z))
		new/obj/explode/k5(locate(src.x+1,src.y+1,src.z))
		new/obj/explode/k5(locate(src.x-2,src.y-3,src.z))
		new/obj/explode/k5(locate(src.x-1,src.y-3,src.z))
		new/obj/explode/k5(locate(src.x,src.y-3,src.z))
		new/obj/explode/k5(locate(src.x+1,src.y-3,src.z))
		new/obj/explode/k5(locate(src.x+2,src.y-3,src.z))
		spawn(4)
			new/obj/explode/k5(locate(src.x-2,src.y-1,src.z))
			new/obj/explode/k5(locate(src.x-1,src.y-1,src.z))
			new/obj/explode/k5(locate(src.x,src.y-1,src.z))
			new/obj/explode/k5(locate(src.x+1,src.y-1,src.z))
			new/obj/explode/k5(locate(src.x+2,src.y-1,src.z))
			new/obj/explode/k5(locate(src.x-2,src.y-2,src.z))
			new/obj/explode/k5(locate(src.x-1,src.y-2,src.z))
			new/obj/explode/k5(locate(src.x,src.y-2,src.z))
			new/obj/explode/k5(locate(src.x+1,src.y-2,src.z))
			new/obj/explode/k5(locate(src.x+2,src.y-2,src.z))
			new/obj/explode/k5(locate(src.x-2,src.y,src.z))
			new/obj/explode/k5(locate(src.x-1,src.y,src.z))
			new/obj/explode/k5(locate(src.x,src.y,src.z))
			new/obj/explode/k5(locate(src.x+1,src.y,src.z))
			new/obj/explode/k5(locate(src.x+2,src.y,src.z))
			new/obj/explode/k5(locate(src.x-1,src.y+1,src.z))
			new/obj/explode/k5(locate(src.x,src.y+1,src.z))
			new/obj/explode/k5(locate(src.x+1,src.y+1,src.z))
			new/obj/explode/k5(locate(src.x-2,src.y-3,src.z))
			new/obj/explode/k5(locate(src.x-1,src.y-3,src.z))
			new/obj/explode/k5(locate(src.x,src.y-3,src.z))
			new/obj/explode/k5(locate(src.x+1,src.y-3,src.z))
			new/obj/explode/k5(locate(src.x+2,src.y-3,src.z))
			spawn(4)
				new/obj/explode/k5(locate(src.x-2,src.y-1,src.z))
				new/obj/explode/k5(locate(src.x-1,src.y-1,src.z))
				new/obj/explode/k5(locate(src.x,src.y-1,src.z))
				new/obj/explode/k5(locate(src.x+1,src.y-1,src.z))
				new/obj/explode/k5(locate(src.x+2,src.y-1,src.z))
				new/obj/explode/k5(locate(src.x-2,src.y-2,src.z))
				new/obj/explode/k5(locate(src.x-1,src.y-2,src.z))
				new/obj/explode/k5(locate(src.x,src.y-2,src.z))
				new/obj/explode/k5(locate(src.x+1,src.y-2,src.z))
				new/obj/explode/k5(locate(src.x+2,src.y-2,src.z))
				new/obj/explode/k5(locate(src.x-2,src.y,src.z))
				new/obj/explode/k5(locate(src.x-1,src.y,src.z))
				new/obj/explode/k5(locate(src.x,src.y,src.z))
				new/obj/explode/k5(locate(src.x+1,src.y,src.z))
				new/obj/explode/k5(locate(src.x+2,src.y,src.z))
				new/obj/explode/k5(locate(src.x-1,src.y+1,src.z))
				new/obj/explode/k5(locate(src.x,src.y+1,src.z))
				new/obj/explode/k5(locate(src.x+1,src.y+1,src.z))
				new/obj/explode/k5(locate(src.x-2,src.y-3,src.z))
				new/obj/explode/k5(locate(src.x-1,src.y-3,src.z))
				new/obj/explode/k5(locate(src.x,src.y-3,src.z))
				new/obj/explode/k5(locate(src.x+1,src.y-3,src.z))
				new/obj/explode/k5(locate(src.x+2,src.y-3,src.z))
obj/proc
	ZigZag()
		walk(src,0)
		var/k=pick(1,2)
		if(k==1)
			src.dir = turn(src.dir, 45)    // dir = northwest
		if(k==2)
			src.dir = turn(src.dir, -45)
		step(src,src.dir)
		zig
		spawn(2)
			if(k==1)
				src.dir=turn(src.dir,-90)
			if(k==2)
				src.dir=turn(src.dir,90)
			step(src,src.dir)
			spawn(1)
			step(src,src.dir)
			spawn(2)
				if(k==2)
					src.dir=turn(src.dir,-90)
				if(k==1)
					src.dir=turn(src.dir,90)
				step(src,src.dir)
				spawn(1)
				step(src,src.dir)
				goto zig
	Speedy()
		zig
		spawn(1)
			step(src,src.dir)
			goto zig
mob/proc/ShieldCool()
	src.frozen=1
	src.protected=1
	spawn(10)
		src.frozen=0
		src.protected=0
		for(var/obj/bloodshield/s in world)
			if(s.owner==src)
				del s
	spawn(200)
	src.inouecool=0
mob/proc/Volcano(mob/M)
	if(M.protected)return
	if(src.ressurectiontype=="Volcanica"||src.stype=="Shusuke")
		src.overlays+=/obj/fire/spark
		M.overlays+=/obj/fire/flash
		var/damage = src.reiatsu*1.2
		damage-=M.defence/2
		if(damage<1)damage=1
		view(8) << "<font color = red><b>[src] has burned [M]!"
		spawn(6)
			M.Death(src,damage,rand(0,1))
			src.overlays-=/obj/fire/spark
		spawn(11)
		M.overlays-=/obj/fire/flash
	else
		src.Slowed(2,12)
mob/proc/Deathtouch(mob/M)
	if(M.protected)return
	if(src.ressurectiontype=="Skeleton")
		var/damage = src.reiatsu*1.2
		damage-=M.defence/2
		if(damage<1)damage=1
		view(8) << "<font color = red><b>[src] has been decayed [M]!"
		spawn(6)
			M.Death(src,damage,rand(1,5))
		sleep(11)
var/const/FILTER_LAYER = 100

client
	var
		obj/DE_SFL_hud/h_locator/DE_SFA = null
	proc
		DE_SFL_U(var/SFD = 0)//DE_STATIC_FILTER UPDATE
			if(src.DE_SFA)
				del(src.DE_SFA)
				if(SFD) return
			var/vcheck = ((src.view * 2) + 1)
			var/obj/DE_SFL_hud/h_locator/H = new/obj/DE_SFL_hud/h_locator
			for(var/x = 0, x <= vcheck, x++)
				for(var/y = 0, y <= vcheck, y++)
					var/image/I = image('Icons/whiteness.dmi',H,"",FILTER_LAYER)
					flick("go",I)
					I.name = "----"
					I.pixel_x += (32 * x)
					I.pixel_y += (32 * y)
					src << I
			src.DE_SFA = H
			src.screen += H
		DE_SFL_AR()//DE STATIC FILTER ADD OR REMOVE
			var/uc = 0
			if(src.DE_SFA) uc = 1
			src.DE_SFL_U(uc)
		DE_SFL_Ua(var/SFD = 0)//DE_STATIC_FILTER UPDATE
			if(src.DE_SFA)
				del(src.DE_SFA)
				if(SFD) return
			var/vcheck = ((src.view * 2) + 1)
			var/obj/DE_SFL_hud/h_locator/H = new/obj/DE_SFL_hud/h_locator
			for(var/x = 0, x <= vcheck, x++)
				for(var/y = 0, y <= vcheck, y++)
					var/image/I = image('Icons/green.dmi',H,"",FILTER_LAYER)
					I.name = "----"
					I.pixel_x += (32 * x)
					I.pixel_y += (32 * y)
					src << I
					spawn(20)
						I=null
						src << I
			src.DE_SFA = H
			src.screen += H
		DE_SFL_ARa()//DE STATIC FILTER ADD OR REMOVE
			var/uc = 0
			if(src.DE_SFA) uc = 1
			src.DE_SFL_U(uc)
		DE_SFL_Uq(var/SFD = 0)//DE_STATIC_FILTER UPDATE
			if(src.DE_SFA)
				del(src.DE_SFA)
				if(SFD) return
			var/vcheck = ((src.view * 2) + 1)
			var/obj/DE_SFL_hud/h_locator/H = new/obj/DE_SFL_hud/h_locator
			for(var/x = 0, x <= vcheck, x++)
				for(var/y = 0, y <= vcheck, y++)
					var/image/I = image('Icons/green.dmi',H,"ulq",FILTER_LAYER)
					I.name = "----"
					I.pixel_x += (32 * x)
					I.pixel_y += (32 * y)
					src << I
			src.DE_SFA = H
			src.screen += H
		DE_SFL_ARq()//DE STATIC FILTER ADD OR REMOVE
			var/uc = 0
			if(src.DE_SFA) uc = 1
			src.DE_SFL_Uq(uc)
		DE_SFL_DUqexplode(var/SFD = 0)//DE_STATIC_FILTER UPDATE
			if(src.DE_SFA)
				del(src.DE_SFA)
				if(SFD) return
			var/vcheck = ((src.view * 2) + 1)
			var/obj/DE_SFL_hud/h_locator/H = new/obj/DE_SFL_hud/h_locator
			for(var/x = 0, x <= vcheck, x++)
				for(var/y = 0, y <= vcheck, y++)
					var/image/I = image('Icons/green.dmi',H,"dplode",FILTER_LAYER)
					I.name = "----"
					I.pixel_x += (32 * x)
					I.pixel_y += (32 * y)
					src << I
			src.DE_SFA = H
			src.screen += H
			spawn(20)
			del(src.DE_SFA)
		DE_SFL_Uqexplode(var/SFD = 0)//DE_STATIC_FILTER UPDATE
			if(src.DE_SFA)
				del(src.DE_SFA)
				if(SFD) return
			var/vcheck = ((src.view * 2) + 1)
			var/obj/DE_SFL_hud/h_locator/H = new/obj/DE_SFL_hud/h_locator
			for(var/x = 0, x <= vcheck, x++)
				for(var/y = 0, y <= vcheck, y++)
					var/image/I = image('Icons/green.dmi',H,"plode",FILTER_LAYER)
					I.name = "----"
					I.pixel_x += (32 * x)
					I.pixel_y += (32 * y)
					src << I
			src.DE_SFA = H
			src.screen += H
			spawn(20)
			del(src.DE_SFA)
		DE_SFL_ARqexplode()//DE STATIC FILTER ADD OR REMOVE
			var/uc = 0
			if(src.DE_SFA) uc = 1
			src.DE_SFL_Uq(uc)


		DE_SFL_Uqs(var/SFD = 0)//DE_STATIC_FILTER UPDATE
			if(src.DE_SFA)
				del(src.DE_SFA)
				if(SFD) return
			var/vcheck = ((src.view * 2) + 1)
			var/obj/DE_SFL_hud/h_locator/H = new/obj/DE_SFL_hud/h_locator
			for(var/x = 0, x <= vcheck, x++)
				for(var/y = 0, y <= vcheck, y++)
					var/image/I = image('Icons/pressure.dmi',H,"",FILTER_LAYER)
					I.name = "----"
					I.pixel_x += (32 * x)
					I.pixel_y += (32 * y)
					src << I
			src.DE_SFA = H
			src.screen += H
		DE_SFL_ARqs()//DE STATIC FILTER ADD OR REMOVE
			var/uc = 0
			if(src.DE_SFA) uc = 1
			src.DE_SFL_Uqs(uc)


		DE_SFL_b(var/SFD = 0)//DE_STATIC_FILTER UPDATE
			if(src.DE_SFA)
				del(src.DE_SFA)
				if(SFD) return
			var/vcheck = ((src.view * 2) + 1)
			var/obj/DE_SFL_hud/h_locator/H = new/obj/DE_SFL_hud/h_locator
			for(var/x = 0, x <= vcheck, x++)
				for(var/y = 0, y <= vcheck, y++)
					var/image/I = image('Icons/blues.dmi',H,"",FILTER_LAYER)
					I.name = "----"
					I.pixel_x += (32 * x)
					I.pixel_y += (32 * y)
					src << I
			src.DE_SFA = H
			src.screen += H
			spawn(30)
			src.screen-=H
		DE_SFL_bs()//DE STATIC FILTER ADD OR REMOVE
			var/uc = 0
			if(src.DE_SFA) uc = 1
			src.DE_SFL_Uqs(uc)

		DE_SFL_b2(var/SFD = 0)//DE_STATIC_FILTER UPDATE
			if(src.DE_SFA)
				del(src.DE_SFA)
				if(SFD) return
			var/vcheck = ((src.view * 2) + 1)
			var/obj/DE_SFL_hud/h_locator/H = new/obj/DE_SFL_hud/h_locator
			for(var/x = 0, x <= vcheck, x++)
				for(var/y = 0, y <= vcheck, y++)
					var/image/I = image('Icons/kaien.dmi',H,"Wave trail",FILTER_LAYER)
					I.name = "----"
					I.pixel_x += (32 * x)
					I.pixel_y += (32 * y)
					src << I
			src.DE_SFA = H
			src.screen += H
			spawn(30)
			src.screen-=H

		DE_SFL_smoke(var/SFD = 0)//DE_STATIC_FILTER UPDATE
			if(src.DE_SFA)
				del(src.DE_SFA)
				if(SFD) return
			var/vcheck = ((src.view * 2) + 1)
			var/obj/DE_SFL_hud/h_locator/H = new/obj/DE_SFL_hud/h_locator
			for(var/x = 0, x <= vcheck, x++)
				for(var/y = 0, y <= vcheck, y++)
					var/image/I = image('Icons/smoke.dmi',H,"",FILTER_LAYER)
					I.name = "----"
					I.pixel_x += (32 * x)
					I.pixel_y += (32 * y)
					src << I
			src.DE_SFA = H
			src.screen += H
			spawn(10)
			src.screen-=H

		DE_SFL_b1(var/SFD = 0)//DE_STATIC_FILTER UPDATE
			if(src.DE_SFA)
				del(src.DE_SFA)
				if(SFD) return
			var/vcheck = ((src.view * 2) + 1)
			var/obj/DE_SFL_hud/h_locator/H = new/obj/DE_SFL_hud/h_locator
			for(var/x = 0, x <= vcheck, x++)
				for(var/y = 0, y <= vcheck, y++)
					var/image/I = image('Icons/green.dmi',H,"volcanoalt",FILTER_LAYER)
					I.name = "----"
					I.pixel_x += (32 * x)
					I.pixel_y += (32 * y)
					src << I
			src.DE_SFA = H
			src.screen += H
			spawn(30)
			src.screen-=H
		DE_SFL_purp(var/SFD = 0)//DE_STATIC_FILTER UPDATE
			if(src.DE_SFA)
				del(src.DE_SFA)
				if(SFD) return
			var/vcheck = ((src.view * 2) + 1)
			var/obj/DE_SFL_hud/h_locator/H = new/obj/DE_SFL_hud/h_locator
			for(var/x = 0, x <= vcheck, x++)
				for(var/y = 0, y <= vcheck, y++)
					var/image/I = image('Icons/purple.dmi',H,"",FILTER_LAYER)
					I.name = "----"
					I.pixel_x += (32 * x)
					I.pixel_y += (32 * y)
					src << I
			src.DE_SFA = H
			src.screen += H
			spawn(100)
			src.screen-=H
obj/DE_SFL_hud
	mouse_opacity = 0
	layer = FILTER_LAYER
	h_locator
		screen_loc = "1:0,1:0"
mob/proc/Absorbtime()
	if(src.absorbtime==1)return
	if(src.inshikai)
		src.absorbtime=1
		spawn(200)
		src.absorbtime=0
	if(src.inbankai)
		src.absorbtime=1
		spawn(100)
		src.absorbtime=0
	if(src.race=="Fullbringer")
		src.absorbtime=1
//		src.defence+=round(src.mreiatsu/3)
//		if(src.defence>src.mdefence*3)src.defence=src.mdefence*3
		spawn(100)
		src.absorbtime=0
mob/proc/Clash(var/mob/m)
	usr.frozen=1
	usr.protected=1
	usr.Facedir(m)
	m.Facedir(usr)
	usr.icon_state="shun"
	m.frozen=1
	m.protected=1
	m.icon_state="shun"
	m.pixel_x=-32
	usr.pixel_x=-32
	sleep(4)
	m.pixel_x=-32
	m.pixel_y=64
	usr.pixel_x=-32
	usr.pixel_y=64
	sleep(4)
	m.pixel_y=-32
	usr.pixel_y=-32
	m.pixel_x=0
	usr.pixel_x=0
	sleep(4)
	m.pixel_y=32
	usr.pixel_y=32
	m.pixel_x=0
	usr.pixel_x=0
	sleep(4)
	m.pixel_x=-32
	m.pixel_y=0
	usr.pixel_x=-32
	usr.pixel_y=0
	sleep(4)
	m.pixel_x=-32
	usr.pixel_x=-32
	m.pixel_y=32
	usr.pixel_y=32
	sleep(4)
	m.pixel_x=0
	usr.pixel_x=0
	m.pixel_y=0
	usr.pixel_y=0
	usr.frozen=0
	usr.protected=0
	usr.icon_state=""
	usr.clash=0
	usr.canattack=1
	m.frozen=0
	m.protected=0
	m.icon_state=""
	m.clash=0
	m.canattack=1
	var/usrd=rand(usr.attack,usr.attack*3)
	var/md=rand(m.attack,usr.attack*3)
	if(usrd>md)
		step(m,m.OppositeDirection())
		m.moving=0
		step(m,m.OppositeDirection())
	if(md>usrd)
		step(usr,usr.OppositeDirection())
		m.moving=0
		step(usr,usr.OppositeDirection())
	if(usr.kenpachi||m.kenpachi)
		return
	m.Death(usr,0,0)
	usr.Death(m,0,0)
obj/F
	icon='Icons/Fs.dmi'
	layer=MOB_LAYER+20
	New()
		icon_state=pick("F1","F2","F3","F4","F5","F6","F7")
		..()
mob/proc
	Pk_Check()
		if(src.loc.loc)
			if(src.loc.loc:safe==1)
				src.pk=0
			else
				src.pk=1
proc
	AwardMedal(medal, mob/player)
		spawn(5)
		if(world.SetMedal(medal, player))
			player << "<b>You have been awarded the \"[medal]\" medal!</b>"
			if(player.rudecomment)player.Talks("Hell yea, I got a medal")
turf/leave
	layer=100
	Click()
		if(usr.nextpart==2)
			usr.Story_Talk("Before you stands a purple mysterious portal you have no choice but to advance into it and begin training to protect yourself.")
			usr.nextpart=3
			return
		usr.GoCust()
		if(istype(usr,/mob/player))
			if(usr.race=="Fullbringer")
				if(usr.gotshik)
					if(!usr.gotitem)
						usr.gotitem=1
						if(usr.ftype=="Tsukishima")
							usr.contents+=new/obj/items/equipable/Weapon/Bookmark
						if(usr.ftype=="Ginjo")
							usr.contents+=new/obj/items/equipable/Weapon/Necklace
						if(usr.ftype=="Jackie")
							usr.contents+=new/obj/items/equipable/Weapon/Boots
						if(usr.ftype=="Yukio")
							usr.contents+=new/obj/items/equipable/Weapon/Psp
						if(usr.ftype=="Ichigo")
							usr.contents+=new/obj/items/equipable/Weapon/Combat_Pass
						if(usr.ftype=="Inoue")
							usr.contents+=new/obj/items/equipable/Weapon/Hairpins
						if(usr.ftype=="Shishigawara")
							usr.contents+=new/obj/items/equipable/Weapon/Knuckles
						usr.skill()
image/target
	layer=MOB_LAYER+1
obj
	effect
		layer= MOB_LAYER+2
		density=0
		zer=1
	undereffect
		layer= MOB_LAYER-1
		density=0
		zer=1
proc/Blood(dx,dy,dz)
	var/t=pick(1,2,3,4)
	if(t==1)
		spawn()
			var/obj/o=new/obj/effect(locate(dx,dy,dz))
			o.icon='Icons/bloods.dmi'
			var/r=rand(1,5)
			flick("[r]",o)
			var/obj/x=new/obj/undereffect(locate(dx,dy,dz))
			spawn(9)
				del(o)
				if(!x)return
				x.icon='Icons/bloods.dmi'
				var/v=rand(1,7)
				x.icon_state="l[v]"
				spawn(600)
					x.loc=null
			//		del(x)
mob/proc/Spin()
	fg
	usr.dir=NORTH
	usr.spiritsword+=1
	for(var/mob/m in oview(1,usr))
		Blood(m.x,m.y,m.z)
		var/def=m.defence/3.5
		var/damage = round(src.attack-def)
		if(damage<=0)
			damage=1
		m.Death(src,damage,0)
	if(usr.spiritsword==15)
		usr.icon_state=""
		src.canattack=1
		usr.spiritsword=0
		sleep(50)
		src.firing=0
		return
	spawn(1)
		usr.spiritsword+=1
		for(var/mob/m in oview(1,usr))
			Blood(m.x,m.y,m.z)
			var/def=m.defence/4
			var/damage = round(src.attack-def)
			if(damage<=0)
				damage=1
			m.Death(src,damage,0)
		if(usr.spiritsword==15)
			usr.icon_state=""
			src.canattack=1
			usr.spiritsword=0
			sleep(50)
			src.firing=0
			return
		usr.dir=WEST
		spawn(1)
			usr.dir=SOUTH
			usr.spiritsword+=1
			for(var/mob/m in oview(1,usr))
				Blood(m.x,m.y,m.z)
				var/def=m.defence/4
				var/damage = round(src.attack-def)
				if(damage<=0)
					damage=1
				m.Death(src,damage,0)
			if(usr.spiritsword==15)
				usr.icon_state=""
				src.canattack=1
				usr.spiritsword=0
				sleep(50)
				src.firing=0
				return
			spawn(1)
				usr.dir=EAST
				usr.spiritsword+=1
				for(var/mob/m in oview(1,usr))
					Blood(m.x,m.y,m.z)
					var/def=m.defence/4
					var/damage = round(src.attack-def)
					if(damage<=0)
						damage=1
					m.Death(src,damage,0)
				if(usr.spiritsword==15)
					usr.icon_state=""
					src.canattack=1
					usr.spiritsword=0
					sleep(50)
					src.firing=0
					return
				spawn(1)
				if(usr.spiritsword)goto fg
mob
	proc
		GoCust()
			if(src.spectate==1)
				client.eye=client.mob
				spectate=0
				return
			client.perspective=EYE_PERSPECTIVE
			client.eye=locate(192,192,1)
			src.spectate=1
			src.Refresh_Stat_Screen()
mob
	proc
		GoCust1()
			client.perspective=EYE_PERSPECTIVE
			client.eye=locate(192,175,1)
mob
	proc
		GoCust2()
			client.perspective=EYE_PERSPECTIVE
			client.eye=locate(192,158,1)
		GoCust3()
			client.mob.spectate=1
			client.perspective=EYE_PERSPECTIVE
			client.eye=locate(192,82,1)
			src<<browse_link("http://soulwarz.forumotion.com/",usr)
		GoCust4()
			client.perspective=EYE_PERSPECTIVE
			client.eye=locate(192,65,1)
		GoCust5()
			client.perspective=EYE_PERSPECTIVE
			client.eye=locate(192,48,1)
		GoCust6()
			client.perspective=EYE_PERSPECTIVE
			client.eye=locate(175,175,1)
		GoCust7()
			client.perspective=EYE_PERSPECTIVE
			client.eye=locate(175,192,1)
		GoCust8()
			client.perspective=EYE_PERSPECTIVE
			client.eye=locate(175,158,1)
		ViewVaiMasks()
			client.perspective=EYE_PERSPECTIVE
			client.eye=locate(191,29,1)
mob
	proc
		GoCust10()
			client.perspective=EYE_PERSPECTIVE
			client.eye=locate(192,192,8)
		GoCust11()
			client.perspective=EYE_PERSPECTIVE
			client.eye=locate(192,175,8)
		GoCust12()
			client.perspective=EYE_PERSPECTIVE
			client.eye=locate(192,158,8)
		GoCust13()
			client.perspective=EYE_PERSPECTIVE
			client.eye=locate(192,141,8)
		GoCust14()
			client.perspective=EYE_PERSPECTIVE
			client.eye=locate(192,124,8)
		GoCust15()
			if(usr.z==5)//arena
				client.perspective=EYE_PERSPECTIVE
				client.eye=locate(192,107,8)
			if(usr.z==6)//bankai
				client.perspective=EYE_PERSPECTIVE
				client.eye=locate(192,90,8)
			if(usr.z==12)//dark
				client.perspective=EYE_PERSPECTIVE
				client.eye=locate(192,73,8)
			if(usr.z==15)
				client.perspective=EYE_PERSPECTIVE//24
				client.eye=locate(192,22,8)
			else
				usr<<"<b>There isn't a map for this area."
		GoCust16()
			client.perspective=EYE_PERSPECTIVE
			client.eye=client.mob
		GoCust17()
			client.perspective=EYE_PERSPECTIVE
			client.eye=locate(192,56,8)
		GoCust18()
			client.perspective=EYE_PERSPECTIVE
			client.eye=locate(192,39,8)
turf/tut1
	Click()
		if(istype(usr,/mob/player))
			usr.GoCust3()
turf/tut2
	Click()
		if(istype(usr,/mob/player))
			usr.GoCust4()
turf/tut3
	Click()
		if(istype(usr,/mob/player))
			usr.GoCust5()
mob
	proc
		Follow(mob/M)
			src.sight |= SEE_MOBS
			gigafdsafds
			if(M.escort==src)
				walk_to(src,M)
				spawn(20)
				goto gigafdsafds
mob
	proc
		FtypeGen()
			src.ftype=pick("Ginjo","Tsukishima","Jackie","Yukio","Ichigo")
			src.swordname=pick("Fatality","Bob","Cat Daddy","Scorpion","Sub-Zero","Zankillmaru","Kazumi","Soulja","Inferno","Reaper","Based God","ASAP","Kobra","Rack City")
		StypeGen()
			if(src.race!="Arrancar")
				src.stype=pick("Tousen","Renji","Rukia","Ukitake","Shonshui","Ichigo","Zaraki","Ikkaku","Hitsugaya","Urahara","Yammamoto","Unohana","Hinamori","Mayuri","Kira","Kaiens","Kommamaru","Aizen","Hisagi","Yumichika","Stinger")
			src.swordcall=pick("Finish Him","YMCMB","Skeet Skeet","Show no Mercy","Oh Let's Do It","Stab to Death","Stay Shocked","Blast Em to Bits","Let's Get Lucky","Slice and Dice","Swag and Tag","Let's get Heated")
			src.swordname=pick("Fatality","Wakka Flacka","Tunechi","Bob","Cat Daddy","Scorpion","Sub-Zero","Zankillmaru","Kazumi","Soulja","Inferno","Reaper","Based God","ASAP","Kobra","Rack City")
		StypeGenFixed()
			src.stype=pick("Tousen","Rukia","Ukitake","Shonshui","Ichigo","Urahara","Yammamoto","Ichimaru","Hinamori","Kira","Kaiens","Jiroubou","Aizen","Hisagi","Yumichika","Stinger")
mob
	proc
		HairGen()
			if(prob(80))
				var/list/L=new
				L+=typesof(/obj/hair)
				for(var/y in L)
					if(length(typesof(y))>1)
						L.Remove(y)
				var/x1=pick(L)
				src.hair_type=x1
				src.overlays+=x1
			var/list/La=new
			La+=typesof(/obj/Vaimask/v1)
			for(var/y in La)
				if(length(typesof(y))>1)
					La.Remove(y)
			var/x2=pick(La)
			src.vstripe=x2
			var/list/Lad=new
			Lad+=typesof(/obj/Vaimask/v2)
			for(var/y in Lad)
				if(length(typesof(y))>1)
					Lad.Remove(y)
			var/x3=pick(Lad)
			src.vmask=x3
			var/list/Lade=new
			Lade+=typesof(/obj/Vaimask/v3)
			for(var/y in Lade)
				if(length(typesof(y))>1)
					Lade.Remove(y)
			var/x4=pick(Lade)
			src.veye=x4
		ClothesGen()
			if(prob(80))
				var/list/La=new
				La+=typesof(/obj/Shirt)
				for(var/y in La)
					if(length(typesof(y))>1)
						La.Remove(y)
				var/x2=pick(La)
				src.shirt=x2
			var/list/Lad=new
			Lad+=typesof(/obj/Pants)
			for(var/y in Lad)
				if(length(typesof(y))>1)
					Lad.Remove(y)
			var/x3=pick(Lad)
			src.pants=x3
			var/list/Lade=new
			Lade+=typesof(/obj/Shoes)
			for(var/y in Lade)
				if(length(typesof(y))>1)
					Lade.Remove(y)
			var/x4=pick(Lade)
			src.shoes=x4
			if(prob(20))
				var/list/Las=new
				Las+=typesof(/obj/Jacket)
				for(var/y in Las)
					if(length(typesof(y))>1)
						Las.Remove(y)
				var/xx2=pick(Las)
				src.jacket=xx2
mob
	var
		zab = 0
obj/level
	layer=99
mob
 var
		strgain
		defgain
		reigain
		reipgain
		healthgain
		healthwas
		expgain
		spawntime
mob/proc
	DrainRei(mob/M,drainamount)
		if(!src)
			return
		if(!M)
			return
		if(src.angeled)
			return
		if(src.safe)
			return
		if(src.npccaptain&&M.npccaptain&&!src.pet&&!M.pet)return
		if(src.npcespada&&M.npcespada&&!src.pet&&!M.pet)return
		if(src.client&&M.client)
			if(eventon==1)
				if(lastevent==7||lastevent==4||lastevent==3||lastevent==2||lastevent==1)
					if(src.lost)
						if(src.rudecomment)src.Talks("[M] stop hitting me before I smack yo mama")
						return
				if(lastevent==0)
					if(src.lost)
						var/shini=src.shinip
						var/hollo=src.hollow
						var/eart=src.earth
						//if(src.shinip==M.shinip&&src.hollow==M.hollow||src.earth==M.earth&&src.race=="Vaizard"&&M.race=="Vaizard"||src.earth==M.earth&&src.race!="Vaizard"&&M.race!="Vaizard")
						if(shini==1&&M.shinip==1||hollo==1&&M.hollow==1||eart==1&&src.race=="Vaizard"&&M.race=="Vaizard"||eart==1&&src.race!="Vaizard"&&M.race!="Vaizard"&&M.earth==1)
							if(src.rudecomment)src.Talks("[M], I'm on your team")
							return
		if(src.in_team&&src.teamid==M.teamid&&M.in_team)
			return
		if(M.gotthecharge)return
		var/dist=get_dist(src,M)
		if(!src.client)
			M.combatmode=10
		if(src.ageshielding&&dist>1)
			return
		if(src.inoueshield)
			src.inoueshield=0
			view(8) << "<b>[src]: Blood Mist Shield!"
			var/obj/Maf = new/obj/bloodshield(src.loc)
			Maf:owner = src
			src.ShieldCool()
			flick("new",Maf)
			Maf.dir=get_dir(Maf,src)
		if(src.shelda)
			var/obj/K = new/obj/inouepow(src.loc)
			K.Gowner = src
			K.FaceTowards(M)
			//K:dir = M.OppositeDirection()
			walk(K,K.dir)//M.OppositeDirection())
		if(src.protected)
			return
		if(prob(src.invincibility*2))
			return
		if(src.issmoke)
			return
		if(M.partner==src||src.partner==M)
			return
		if(src.enemy)
			M.hollowprotection = 1
		if(src.utsemi)
			flick("shun",src)
			src.utsemi=0
			if(src.z==src.uz)
				src.x=src.ux
				src.y=src.uy
				src.z=src.uz
			return
		src.rei-=drainamount
		if(M.rei<0)M.rei=0
		view(10)<< "<b>[M] drains [src]'s reiatsu with his Zanpakutou"
mob
	proc
		Death(mob/M,damage=0,wounds=0,kidobased=0)//main damage proc
			if(!src)
				return
			if(!M)
				return
			if(src.angeled)
				return
			if(M.inindeath)
				damage=0
				damage=damage
				wounds=0
			if(src.shopping)
				src.frozen=0
				for(var/obj/Buy/b in src.client.screen)
					del b
			if(M.shopping)
				M.frozen=0
				for(var/obj/Buy/d in M.client.screen)
					del d
			if(src.safe)
				src.health = src.mhealth
				src.wound=0
				if(src.rudecomment)src.Talks("I'm in a safe zone you hacker")
				return
			if(src.npccaptain&&M.npccaptain&&!src.pet&&!M.pet)return
			if(src.npcespada&&M.npcespada&&!src.pet&&!M.pet)return
			if(src.killable==1&&M.in_team&&M.dteamid&&M.z == 27 || src.killable==1&&M.in_team&&M.dteamid&&M.z == 28)
				if(src.is_dnpc==M.is_dnpc)return
				var/tmp/dh=pick(1,1,1,1,1,1,1,1,1.5,1.75,2,2.5,2.75,3)
				var/tmp/d=pick(1,1,1,1,1,1,1,1.5,1.75,2,2.5,2.75,3)
				if(M.dungeon_tank==1)
					damage = src.mhealth*(0.004*dh)
					if(is_dnpc==0)
						damage = damage*0.85
						if(src.race=="Yammy Boss"||src.race=="Yammy Boss2" || src.race == "Yammy Boss3")
							damage = damage*0.80
					if(is_dnpc>0)
						damage=damage*2
					src.ShowDmg(damage)
					src.health-=damage
					wounds = 0
					if(dh>2)
						view(M,8) << "<b><font color = red>[M] Critted [src] for [damage] damage!"
					else
						view(M,8) << "<b><font color = red>[M] attacked [src] for [damage] damage!"
					if(src.health <= 0)
						if(src.is_dnpc >0)
							for(var/mob/player/Dk in world)
								if(Dk.dteamid==M.dteamid)
									if(src.is_dnpc == 1 || src.is_dnpc==2)
										Dk.bossR1kills+=1
									if(src.is_dnpc == 3 || src.is_dnpc==4)
										Dk.bossR2kills+=1
									if(src.is_dnpc == 5 || src.is_dnpc==6)
										Dk.bossR3kills+=1

						if(src.wound>=100&&src.is_dnpc==0)
							for(var/mob/player/Kd in world)
								if(M.dteamid == Kd.dteamid && Kd.dteam_leader)
									Kd.bosskill+=1
									for(var/mob/player/p in world)
										if(p.dteamid==Kd.dteamid)
											if(Kd.bosskill<3)
												p << "<font color = yellow><b>You have killed [Kd.bosskill]/3 bosses!"
											else
												p << "<font color = yellow><b>You have killed [Kd.bosskill]/3 bosses, make your way towards the exit!"


						src.Deathd(M)
					if(prob(80)	)
						src.Aggro(M)
					return
				if(M.dungeon_healer==1)
					damage = src.mhealth*(0.004*dh)
					if(is_dnpc==0)
						damage = damage*0.85
						if(src.race=="Yammy Boss"||src.race=="Yammy Boss2" || src.race == "Yammy Boss3")
							damage = damage*0.80
					if(is_dnpc>0)
						damage=damage*2
					src.ShowDmg(damage)
					src.health-=damage
					wounds = 0
					if(dh>2)
						view(M,8) << "<b><font color = red>[M] Critted [src] for [damage] damage!"
					else
						view(M,8) << "<b><font color = red>[M] attacked [src] for [damage] damage!"
					if(src.health <= 0)
						if(src.is_dnpc >0)
							for(var/mob/player/Dk in world)
								if(Dk.dteamid==M.dteamid)
									if(src.is_dnpc == 1 || src.is_dnpc==2)
										Dk.bossR1kills+=1
									if(src.is_dnpc == 3 || src.is_dnpc==4)
										Dk.bossR2kills+=1
									if(src.is_dnpc == 5 || src.is_dnpc==6)
										Dk.bossR3kills+=1
						if(src.wound>=100&&src.is_dnpc==0)
							for(var/mob/player/Kd in world)
								if(M.dteamid == Kd.dteamid && Kd.dteam_leader)
									Kd.bosskill+=1
									for(var/mob/player/p in world)
										if(p.dteamid==Kd.dteamid)
											if(Kd.bosskill<3)
												p << "<font color = yellow><b>You have killed [Kd.bosskill]/3 bosses!"
											else
												p << "<font color = yellow><b>You have killed [Kd.bosskill]/3 bosses, make your way towards the exit!"
						src.Deathd(M)
					if(prob(60)	)
						src.Aggro(M)
					return
				if(M.dungeon_atck==1)
					damage = src.mhealth*(0.0055*d)
					if(is_dnpc==0)
						damage = damage*0.85
						if(src.race=="Yammy Boss"||src.race=="Yammy Boss2" || src.race == "Yammy Boss3")
							damage = damage*0.80
					if(is_dnpc>0)
						damage=damage*2
					src.ShowDmg(damage)
					src.health-=damage
					wounds = 0
					if(d>2)
						view(M,8) << "<b><font color = red>[M] Critted [src] for [damage] damage!"
					else
						view(M,8) << "<b><font color = red>[M] attacked [src] for [damage] damage!"
					if(src.health <= 0)
						if(src.is_dnpc >0)
							for(var/mob/player/Dk in world)
								if(Dk.dteamid==M.dteamid)
									if(src.is_dnpc == 1 || src.is_dnpc==2)
										Dk.bossR1kills+=1
									if(src.is_dnpc == 3 || src.is_dnpc==4)
										Dk.bossR2kills+=1
									if(src.is_dnpc == 5 || src.is_dnpc==6)
										Dk.bossR3kills+=1
						if(src.wound>=100&&src.is_dnpc==0)
							for(var/mob/player/Kd in world)
								if(M.dteamid == Kd.dteamid && Kd.dteam_leader)
									Kd.bosskill+=1
									for(var/mob/player/p in world)
										if(p.dteamid==Kd.dteamid)
											if(Kd.bosskill<3)
												p << "<font color = yellow><b>You have killed [Kd.bosskill]/3 bosses!"
											else
												p << "<font color = yellow><b>You have killed [Kd.bosskill]/3 bosses, make your way towards the exit!"

						src.Deathd(M)
					if(prob(20)	)
						src.Aggro(M)
					return





			if(src.in_team&&src.dteamid&&src.z==27|| src.in_team&&src.dteamid&&src.z==28)
				if(src.in_team&&src.dteamid==M.dteamid&&M.in_team)return
				if(src.is_dnpc==M.is_dnpc&&src.npc==0)return
				else
					if(src.dungeon_tank==1)
						if(src.is_dnpc==0)
							damage = src.mhealth*0.065
						else
							damage = src.mhealth*0.04
						src.ShowDmg(damage)
						src.health-=damage
						wounds=round(rand(0,0.7))
						view(M,8) << "<b><font color = red>[M] attacked [src] for [damage] damage! [wounds] Wounds"
						if(src.health <= 0)
							src.Deathd(M)
						src.Aggro(M)
						return
					if(src.dungeon_healer==1)
						if(src.is_dnpc==0)
							damage = src.mhealth*0.085
						else
							damage = src.mhealth*0.07
						src.ShowDmg(damage)
						src.health-=damage
						wounds=round(rand(0,0.7))
						view(M,8) << "<b><font color = red>[M] attacked [src] for [damage] damage! [wounds] Wounds"
						if(src.health <= 0)
							src.Deathd(M)
						src.Aggro(M)
						return
					if(src.dungeon_atck==1)
						if(src.is_dnpc==0)
							damage = src.mhealth*0.085
						else
							damage = src.mhealth*0.07
						src.ShowDmg(damage)
						src.health-=damage
						wounds=round(rand(0,0.7))
						view(M,8) << "<b><font color = red>[M] attacked [src] for [damage] damage! [wounds] Wounds"
						if(src.health <= 0)
							src.Deathd(M)
						src.Aggro(M)
						return
			if(src.client&&M.client)
				if(eventon==1)
					if(lastevent==7||lastevent==4||lastevent==3||lastevent==2||lastevent==1||lastevent==8)
						if(src.lost)
							if(src.rudecomment)src.Talks("[M] stop hitting me before I smack yo mama")
							return
					if(lastevent==0)
						if(src.lost)
							var/shini=src.shinip
							var/hollo=src.hollow
							var/eart=src.earth
							//if(src.shinip==M.shinip&&src.hollow==M.hollow||src.earth==M.earth&&src.race=="Vaizard"&&M.race=="Vaizard"||src.earth==M.earth&&src.race!="Vaizard"&&M.race!="Vaizard")
							if(shini==1&&M.shinip==1||hollo==1&&M.hollow==1||eart==1&&src.race=="Vaizard"&&M.race=="Vaizard"||eart==1&&src.race!="Vaizard"&&M.race!="Vaizard"&&M.earth==1)
								if(src.rudecomment)src.Talks("[M], I'm on your team")
								return
			if(src.in_team&&src.teamid==M.teamid&&M.in_team)
				//if(src.in_team&&M.in_team&&src.dteamid&&M.dteamid)
				//else
				return
			if(src.dteamid && M.dteamid)
				if(src.in_team&&src.dteamid==M.dteamid&&M.in_team)
					return
			if(src.colorr=="Red"&&M.colorr=="Red")
				return
			if(src.colorr=="Blue"&&M.colorr=="Blue")
				return
			if(M.gotthecharge)return

			if(src.race=="Sado"||src.race=="Chad")
				damage=damage*0.7
			if(src.stype == "Mayuri")
				if(prob(50))
					damage=damage*0.75
					src<<"You're body regenerates part of the blow."
			var/dist=get_dist(src,M)
			if(!src.client)
				M.combatmode=10
			if(src.ageshielding&&dist>1)
				return
			if(src.inoueshield)
				src.inoueshield=0
				view(8) << "<b>[src]: Blood Mist Shield!"
				var/obj/Maf = new/obj/bloodshield(src.loc)
				Maf:owner = src
				src.ShieldCool()
				flick("new",Maf)
				Maf.dir=get_dir(Maf,src)
			if(src.shelda)
				var/obj/K = new/obj/inouepow(src.loc)
				K.Gowner = src
				K.FaceTowards(M)
				//K:dir = M.OppositeDirection()
				walk(K,K.dir)//M.OppositeDirection())
			if(src.protected)
				return
			if(prob(src.invincibility*2))
				return
			if(src.issmoke)
				return
			if(M.partner==src||src.partner==M)
				return
			if(src.enemy)
				M.hollowprotection = 1
			if(src.utsemi)
				flick("shun",src)
				src.utsemi=0
				if(src.z==src.uz)
					src.x=src.ux
					src.y=src.uy
					src.z=src.uz
				return
			var/mdamage=damage
			var/mwound=wounds
			if(M.marksman>=1)
				damage+=M.level*13.2
			if(prob(M.piercepassive*5))
				wounds+=mwound
			if(prob(M.piercepassive*5))
				wounds+=mwound
			if(M.GedonKido)
				damage+=round(mdamage*(M.level/250))
			if(M.squad=="Kido Corps"||M.status== "<font color = #f0f217>Captain Commander</font>"||M.statusold== "<font color = #f0f217>Captain Commander</font>"||M.squad==0||M.karakuraheroplayer==1||M.humanleader==1||M.issternrleader==1||M.newquincyking==1 || M.newsadoking || M.newhollowking || M.isEspadaLeader)
				kidobased=1
			if(kidobased)
				if(M.squad=="Kido Corps"||M.status== "<font color = #f0f217>Captain Commander</font>"||M.statusold== "<font color = #f0f217>Captain Commander</font>"||M.squad==0||M.karakuraheroplayer==1||M.humanleader==1||M.issternrleader==1||M.newquincyking==1 || M.newsadoking || M.newhollowking || M.isEspadaLeader)
					if(M.squad=="Kido Corps")
						if(M.status=="<font color = #FF5600>Captain</font>")
							damage+=round(mdamage*(M.level/250))
						else
							damage+=round(mdamage*(M.level/350))
					else
						damage+=round(mdamage*(M.level/600))
			if(M.toughguy)
				if(M.level<src.level)
					damage+=round(mdamage/10)
			if(M.ruthless)
				if(M.level>src.level)
					damage+=round(mdamage/10)
			if(M.etarget==src||M.aggro==src)
				damage-=round(mdamage/20)*src.glare
			if(M.survival&&M.wound>=120)
				damage+=round(mdamage)
			if(M.survival&&M.wound>=180)
				damage+=round(mdamage/2)
			if(src.canattack==0)
				damage+=round(mdamage/20)*M.openstrike
			if(M.treason)
				if(src.race==M.race)
					damage+=round(mdamage/5)
			if(M.loyalty)
				if(src.race==M.race)
					damage-=round(mdamage/5)
				if(src.race!=M.race)
					damage+=round(mdamage/5)
			if(M.racist)
				if(M.icon_name!=src.icon_name)
					damage+=round(mdamage/20)
			if(src.whoareyou)
				if(src.status||src.espadas)
					damage-=round(mdamage/20)
			if(M.whoareyou)
				if(!src.status&&!src.espadas)
					damage+=round(mdamage/20)
			if(src.face)
				if(dist>=5)
					damage-=round(mdamage/2)
			if(wounds>=5)
				if(prob(src.armorpassive*5))
					wounds=round(mwound/2)
			if(prob(M.criticalhits*2))
				damage+=round(mdamage/2)
				wounds+=round(mwound/2)
			if(src.rodeo)
				damage+=round(mdamage/2)
			if(M.rodeo)
				damage+=round(mdamage/2)
			if(src.squad==7||src.squad==0||src.karakuraheroplayer==1||src.humanleader==1||src.newquincyking==1||src.issternrleader==1 || src.newsadoking || src.newhollowking || src.isEspadaLeader)
				damage-=round(mdamage/3)
			damage-=round(src.defence*0.5)
			if(src.stype=="Byakuya"&&src.inshikai||src.stype=="Byakuya"&&src.inbankai)
				if(dist==1)
					damage+=round(mdamage/4)
			if(src.segunda||src.limitrelease)
				damage-=round(mdamage/3)
			if(M.segunda||M.limitrelease)
				damage+=round(mdamage/3)
			if(src.kamikaze)
				damage=damage/2
				wounds=wounds*2
			if(src.trans3)
				wounds=wounds/2
			if(src.twilightboost&&prob(40))
				//if(src.inbankai)
				twigotwnd=wounds*1.2
				wounds=wounds
				M.wound+=twigotwnd
				if(M.health <=0 && M.wound>100)
					spawn()M.Death(src)
				/*if(src.inshikai)
					twigotwnd=wounds*1.2
					wounds=wounds
					twigotwnd=wounds
					M.wound+=twigotwnd
					if(M.health <=0 && M.wound>100)
						M.Respawn()
				if(!src.inbankai && !src.inshikai)
					twigotwnd=wounds*1.2
					wounds=wounds
					M.wound+=twigotwnd
					if(M.health <=0 && M.wound>100)
						M.Respawn()*/
			if(src.rinneg)
				wounds=wounds/2
			if(src.wings==2)
				wounds=wounds/2
			if(src.saied)
				damage=damage*2
				wounds=wounds*2
				src.saied=0
				src<<"You have been knocked out"
			damage=round(damage,1)
			if(damage<1)damage=1
			if(gothoug=="[src.name]")
				gothoug=null
				world<<"<b>The hougyoku has been returned to the valley of screams"
				captureprotection=0
			if(M.level==150)
				if(damage<100)
					damage=100
			if(src.negacionon&&damage>src.mhealth/10)
				new/obj/negacion(src.loc)
				return
			if(M.kenpachi && src.kenpachigotu==0)
				damage=round(src.mhealth/3)
			if(M.pet)damage+=damage
			if(src.rinneg||src.wings==2)
				damage-=round(damage/4)
			if(src.twilightboost&&prob(40))
				if(src.inshikai||src.infull)
					if(damage>M.health)
						twigotdmg=round(damage/2)
						M.health-=round(damage/2)
						damage-=round(damage/2)
						spawn()M.Death(src,twigotdmg)
					else
						M.health-=round(damage/2)
						twigotdmg=round(damage/2)
						damage-=round(damage/2)
				if(src.inbankai||src.inafull)
					if(damage>M.health)
						twigotdmg=round(damage/2)*2
						M.health-=round(damage/2)*2
						damage-=round(damage/2)*2
						spawn()M.Death(src,twigotdmg)
					else
						M.health-=round(damage/2)*2
						twigotdmg=round(damage/2)*2
						damage-=round(damage/2)
				if(!inshikai && !inbankai || !src.infull&&!src.inafull)
					if(damage>M.health)
						twigotdmg=(damage/2)
						M.health-=round(damage/2)
						damage-=round(damage/2)
						spawn()M.Death(src,twigotdmg)
					else
						M.health-=round(damage/2)
						twigotdmg=round(damage/2)
						damage-=round(damage/2)
				if(M.key=="Kwilson2" || M.key=="Kwilson3")
					damage*=0.1
					wound*=0.1
					twigotdmg=0
					twigotwnd=0
					M << "<b><font color = blue>Can't touch dis, Da na nah, na nah, na nah, Can't touch dis!"
				if(M.key in specialverbs)
					damage*=0.2
					wound*=0.2
					twigotdmg=0
					twigotwnd=0
				M << "<b><font color = blue>[M] attacked [src], [twigotdmg] damage and [twigotwnd] wounds were reflected back!"
				src << "<b><font color = blue>[M] attacked [src], [twigotdmg] damage and [twigotwnd] wounds were reflected back!"
				twigotdmg=0
				twigotwnd=0
			view(M,8) << "<b><font color = red>[M] attacked [src] for [damage] damage! [wounds] Wounds"
			src.ShowDmg(damage)
			src.health-=damage
			src.wound+=wounds
			if(src.legit&&M.client)
				if(M.lost)
					if(eventon==1)
						if(lastevent==7||lastevent==4||lastevent==2||lastevent==3||lastevent==8)
							M.dmgdone+=damage
							M.wnddone+=wounds
			if(src.squad==5||src.squad==0||src.karakuraheroplayer==1||src.humanleader==1||src.newquincyking==1||src.issternrleader==1 || src.newsadoking || src.newhollowking)
				if(prob(2))
					M.Death(src,round(damage/4),0)
			if(damage>round(src.mhealth*0.5,1))
				if(prob(src.secondchance*5))
					if(src.health<=0)
						src.health=1
			if(prob(M.reidrainage*2))
				src.rei-=round(src.mrei*0.15)
				if(src.rei<0)src.rei=0
			if(src.shadowing)src.health-=round(src.mhealth*0.5)
			if(src.story)
				src.health = src.mhealth
				src.wound=0
			if(src.npc)
				src.health = src.mhealth
				src.wound=0
				return
			if(src.ispedal)
				src.health = src.mhealth
				src.wound=0
			if(src.zab)
				if(src.health<=0)
					var/mob/G=src.owner
					view(src)<<"[M] destroyed [G.swordname]!"
					del src
			if(src.enemy)
				M.hollowprotection = 0
			if(M.myclone)
				M=M.myclone
			if(src.kawa)
				M.Untarget()
				var/obj/afterImage = new /obj()
				afterImage.layer = MOB_LAYER
				afterImage.icon=src.icon
				afterImage.icon_state=src.icon_state
				afterImage.overlays=src.overlays
				afterImage.underlays = src.underlays
				afterImage.dir=src.dir
				afterImage.loc = src.loc
				afterImage.zer = 1
				afterImage.density=1
				afterImage.overlays+=/obj/ko
				for(var/mob/m in world)
					if(m.etarget==src)
						m.Untarget()
						var/image/I=image('Icons/tgt.dmi',afterImage,"",30)
						I.name="TargetUnder";src.client<<I
				spawn(30)	del(afterImage)
				sleep(1)
				if(src.z==src.kz)
					src.x=src.kx
					src.y=src.ky
					src.z=src.kz
				src.invisibility=30
				src.see_invisible=30
				spawn(30)
					src.invisibility=0
					src.see_invisible=2
			if(src.protective)src.health+=round(src.mhealth/5,1)
			//if(src.health <= 0&&!src.ko||src.wound >= 200&&!src.ko)
			//	M.cheapstuff=1
			//	M.canattack=1
			spawn()src.Aggro(M)

			for(var/mob/Dr in view(8,M))
				if(Dr.myclone==M)
					spawn()Dr.Aggro(src)
			for(var/mob/Dra in view(8,src))
				if(Dra.myclone==src)
					spawn()Dra.Aggro(M)
			if(src.ressurectiontype=="Nnoitra"&&src.ressurection&&src.wound>=75)
				src.Load_Overlays()
			if(!src.overwound&&src.wound>=75)
				if(src.rudecomment)src.Talks("Dangit [M] you got my arm bloody, now I need to kill you")
				src.overwound=1
				src.Load_Overlays()
			if(src.overwound&&src.wound<75)
				src.overwound=0
				src.Load_Overlays()
			if(M.flashmelee)
				if(src.loc!=null)
					if(!src.safe)
						if(src.z==M.z)
							var/list/Menu = list()
							for(var/turf/T in oview(1,src))
								if(!T.density)
									Menu.Add(T)
							if(Menu&&Menu.len)
								var/turf/D=pick(Menu)
								M.loc=locate(D.x,D.y,D.z)
								M.Facedir(src)
							else
								M.loc=locate(src.x,src.y,src.z)
			src.gothit=1
			if(M.owner)
				M=M.owner
			if(src.mission==7&&M.missiontarget==src)
				src.FailMish(view(20))
			if(M.mission==12&&M.missiontarget==src)
				M.timed=30
				M<<"You got the item now hold onto it for 30 seconds without getting damaged"
			if(src.mission==12&&src.timed)
				src.FailMish(view(20))
			if(M.inbankai&&M.stype=="Ikkaku")
				M.rage+=2
				if(M.rage>90)M.rage=90
			if(src.inbankai&&src.stype=="Ikkaku")
				src.rage+=2
				if(src.rage>20)src.rage=20
			if(M.inbankai&&M.stype=="Unohana"||M.ressurection&&M.ressurectiontype=="Del Toro")
				if(src.health<0)
					M.moving=0
			if(M.ressurection)
				M.ressmastery(1)
			if(M.maskon)
				if(M.maskuses<1500)
					var/t=pick(1,2)
					if(t==1)
						M.maskuses+=0.80
						M<<"<b><font color=lime green>You can maintain your mask longer"
			if(M.limitrelease)
				if(M.lreleaseuses<1000)
					var/t=pick(1,2)
					if(t==1)
						M.lreleaseuses+=1
						M<<"<b><font color=lime green>You can maintain your release longer"
			if(src.squad==9)
				if(prob(10))
					M.Untarget()
					M.aggro=0
					M.aggrod=0
			if(src.aizentag)
				if(M.z==10)
					M.loc=locate(67,133,1)
					M.GainExp(100000)
					M<<"<font color=purple>You have gained 100,000 exp and $1,000!"
					M.GainMoney(1000)
					M.gamemish=4
					del src
					return
				else
					src.health=src.mhealth
					return
			if(src.health<=0||src.wound>=200||src.toochep)
				if(src.lacerated && !src.hostile)src.lacerated=20
				if(src.raid==src.z)
					for(var/mob/player/Ma in world)
						if(Ma.teamid == src.teamid&&Ma.in_team)
							if(Ma.raid)
								Ma.eventpoints-=0.5
								world<<"<font color=aqua>[Ma] has lost 0.5 event points because [src] got koed ([src.x],[src.y])during there raid"
					M.eventpoints+=0.5
					world<<"<font color=aqua>[M] and his party have gained 0.5 event points for koing [src] in there ruthless raid"
				if(M.raid==M.z&&src.client)
					for(var/mob/player/Ma in world)
						if(Ma.teamid == M.teamid&&Ma.in_team)
							if(Ma.raid)
								Ma.eventpoints+=0.5
								Ma<<"<font color=aqua>You gained 0.5 event points"
				src.Deathd(M)
		Deathd(mob/M)
			if(isnull(M))
				return
			M.Level_Up()
			if(M.spiritsword)
				M.spiritsword=14
			if(M.dungeon_healer==1)
				var obj/skillcard/Dungeon_Heal/y = locate() in M.contents
				var obj/skillcard/Dungeon_AOE_Heal/z = locate() in M.contents
				if(!isnull(z))
					M.contents-=z
				if(!isnull(y))
					M.contents-=y
			if(M.maskon)
				if(M.maskuses<1500)
					var/t=pick(1,2)
					if(t==1)
						M.maskuses+=0.80
						M<<"<b><font color=lime green>You can maintain your mask longer"
			if(M.aizen && src.health <= 0&& src.wound<100)
				src <<"<b>You must try your hardest to win!"
				spawn(30)
					view(src) << "<b>You should just stay there and rest!"
					var/sound/d = sound('Sounds/Aizen/WAVE_VO_AIZE_023_000.wav',volume=50)
					view(src) << d
			if(src.iswandevent && src.health <=0)
				for(var/mob/player/Kd in world)
					if(Kd.lost==1)
						Kd.Respawn()
						Kd.GiveDonorStats()
						Kd.attack=Kd.mattack
						Kd.reiatsu=Kd.mreiatsu
						Kd.defence=Kd.mdefence
						Kd.aftereventbuffs()
						Kd.lost=0
						if(Kd.dmgdone>Kd.mhealth||Kd.wnddone>=1)
							Kd <<"<b>You have defeated the Wandenreich Prince!"
							Kd.eventpoints+=20
							Kd.donor_points+=5
							Kd.total_bought+=5
							Kd.eventsWon++
							Kd<<"<b><font color=lime green>You have gained 20 event points and a Chest (check your inventory)!"
							Kd.contents+=new/obj/items/usable/Chests/Rare_Chest
							Kd.aftereventbuffs()
							Kd.skill()
							if(Kd.level<1000)
								Kd.exp += Kd.expgain*2
								Kd << "<b>You gained [Kd.expgain*2] experience!"
								Kd.Level_Up()
							if(Kd.level>=1000 && Kd.level<1500)
								Kd.GainExp(Kd.mexp)
								Kd.Level_Up()
								Kd.GainExp(Kd.mexp)
								Kd.Level_Up()
								Kd.GainExp(Kd.mexp)
								Kd.Level_Up()
								Kd.GainExp(Kd.mexp)
								Kd.Level_Up()
								Kd << "<b>You have gained 4 levels for your help!"
							if(Kd.level>=1500)
								Kd.GainExp(Kd.mexp)
								Kd.Level_Up()
								Kd.GainExp(Kd.mexp)
								Kd.Level_Up()
								Kd.GainExp(Kd.mexp)
								Kd.Level_Up()
								Kd.GainExp(Kd.mexp)
								Kd.Level_Up()
								Kd.GainExp(Kd.mexp)
								Kd.Level_Up()
								Kd << "<b>You have gained 5 levels for your help!"
							eventon=0
						else
							if(Kd.level>=500 &&Kd.level<1000)
								Kd.GainExp(Kd.mexp)
								Kd.Level_Up()
								Kd.GainExp(Kd.mexp)
								Kd.Level_Up()
								Kd.GainExp(Kd.mexp)
								Kd.Level_Up()
								Kd.aftereventbuffs()
								Kd<<"<b>You didn't help enough, but tried and thats what counts. You have gained 3 Levels!"
							else
								Kd<<"<b>You didn't help"
				del src
				return


			if(team_deathmatch)
				if(src in team_deathmatch.white_team)
					if(src.health <=0 && src.wound>=100)
						src << "You have been eliminated from Team Deathmatch!"

						world<<"<b><font color=red>[src] from the white team has been knocked out of Team Deathmatch!</font></b>"
						if(src in team_deathmatch.white_team) team_deathmatch.white_team -= src
						team_deathmatch.healPlayer(src)
						team_deathmatch.Respawn(src)
						src.lost=0
						src.intdm=0
						src.Load_Overlays()
						return

			if(team_deathmatch)
				if(src in team_deathmatch.black_team)
					if(src.health <=0 && src.wound>=100)
						src << "You have been eliminated from Team Deathmatch!"

						world<<"<b><font color=red>[src] from the black team has been knocked out of Team Deathmatch!</font></b>"
						if(src in team_deathmatch.black_team) team_deathmatch.black_team -= src
						team_deathmatch.healPlayer(src)
						team_deathmatch.Respawn(src)
						src.Load_Overlays()
						src.lost=0
						src.intdm=0
						return

			if(free_for_all)
				if(src in free_for_all.participants)
					if(src.health <=0 && src.wound>=100)
						src << "You have been eliminated from the FFA!"

						world<<"<b><font color=red>[src] has been eliminated from the free for all!</font></b>"
						free_for_all.participants -= src
						free_for_all.healPlayer(src)
						free_for_all.Respawn(src)
						src.GiveDonorStats()
						src.aftereventbuffs()
						src.lost=0
						src.inffa=0
						return


			if(M.iswandevent && src.health <= 0 && src.wound >= 100 || M.iswandevent && src.wound>=200)
				M.aggrod=0
				src.health=src.mhealth
				src.exp -= (src.level/2)*1000
				src <<"<b>You have been defeated by the Wndenreich Prince and you lost [(src.level/2)*1000] experience!"
				src.wound=0
				src.lost=0
				src.Respawn()
				src.GiveDonorStats()
				src.aftereventbuffs()
				var/kkk=0
				for(var/mob/Kd in world)
					if(Kd.lost)
						kkk++
						Kd <<"<b>[src] has been killed theres only [kkk] of you guys left!"
				if(!kkk)
//					src.Respawn()
					world <<"<b>Everyone has been killed by the Wandenreich Prince!"
					eventon=0
					del M
					return
			if(src.legit && src.health <= 0&&src.wound<100)
				if(src.ko==1)return
				if(src.isfgt)
					src.wound+=20
					src.health=0
					src.health+=round(mhealth*0.7,1)
					if(src.rei<=round(mrei*0.3,1))
						src.rei=round(mrei*0.3,1)
					return
				if(src.kenpachi)
					view(src) << "<b>I have to fight more..."
					var/sound/d = sound('Sounds/Kenpachi/WAVE_VO_KENP_066_P1_000.wav',volume=50)
					view(src) << d
				src.protected=1
				src.ko=1
				src.overlays+=/obj/ko
				sleep(80)
				if(src.kenpachi)
					view(src) << "<b>TO GET STRONGER!!!"
					var/sound/da = sound('Sounds/Kenpachi/WAVE_VO_KENP_066_P2_000.wav',volume=50)
					view(src) << da
				src.overlays-=/obj/ko
				src.wound+=20
				src.health=0
				src.health+=round(mhealth*0.7,1)
				if(src.rei<=round(mrei*0.3,1))
					src.rei=round(mrei*0.3,1)
				src.protected=0
				src.ko=0
				return
			if(src.FGT && src.health <=0 && src.wound>=100||src.FGT && src.wound>=200)
				M.frozen=1
				src.npc=1
				src.frozen=1
				src.Talks("You've put up a good fight")
				sleep(10)
				src.Talks("But Now...")
				sleep(10)
				src.inbankai=1
				src.infinal=0
				src.frozen=0
				src.FinalBankai()
				src.frozen=1
				sleep(20)
				src.Talks("I must end this")
				sleep(30)
				new/obj/afterimage(src.loc)
				src.loc=locate(M.x+5,M.y,M.z)
				src.dir=WEST
				M.dir=EAST
				sleep(10)
				M.frozen=0
				var/kl=M.instinct
				M.instinct=20
				src.frozen=0
				src.firing=0
				src.rei=3001
				src.Mugetsu()
				src.Talks("MUGETSU")
				M.instinct=kl
				sleep(1)
				M.frozen=1
				src.frozen=1
				src.firing=1
				sleep(50)
				src.Talks("NOOO...I FAILED!")
				M.frozen=0
				sleep(10)
				M.Talks("HAHA. Now we'll rule the world")
				new/obj/afterimage(M.loc)
				M.loc=locate(src.x+1,src.y,src.z)
				M.dir=WEST
				flick("Sword Slash1",M)
				sleep(4)
				M <<"<b>You have defeated Ichigo and your Instant Regenerative and Arrancar Release effects have dramatically increased!"
				world << "<b><font color = blue>[M] has defeated Ichigo!"
				M.beatfgts = 1
				M.frozen=0
				M.exp += 100000
				M.Level_Up()
				M.skill()
				M << "<b>You gained 100,000 experience!"
				M.protected=0
				M.loc=locate(12,62,3)
				del src
				return
			if(src.aizen && src.health <=0 && src.wound>=100 && !src.beatashell||src.aizen && src.wound>=200 && !src.beatashell)
				M.frozen=1
				src.frozen=1
				view(src) << "<b>Come to your senses you're wounded!"
				var/sound/ds = sound('Sounds/Aizen/WAVE_VO_AIZE_059_000.wav',volume=50)
				view(src) << ds
				sleep(10)
				var/sound/dsa = sound('Sounds/Aizen/WAVE_VO_AIZE_060_000.wav',volume=50)
				view(src) << dsa
				sleep(10)
				M.inbankai=1
				M.frozen=0
				M.FinalBankai()
				M.frozen=1
				M << "<b>([M]): Use the rest of your strength to win this battle!"
				sleep(20)
				var/sound/d = sound('Sounds/Aizen/WAVE_VO_AIZE_092_000.wav',volume=50)
				view(src) << d
				view(src) << "<b>So this is it!"
				sleep(30)
				var/sound/da = sound('Sounds/Aizen/WAVE_VO_AIZE_024_000.wav',volume=50)
				view(src) << da
				new/obj/afterimage(src.loc)
				src.loc=locate(M.x+5,M.y,M.z)
				sleep(30)
				M.frozen=0
				M.Mugetsu()
				sleep(10)
				src.frozen=0
				M <<"<b>You have defeated Aizen and can now utulize Final Bankai!"
				world << "<b><font color = blue>[M] has defeated Aizen!"
				M.beatashell = 1
				M.frozen=0
				M.exp += 1000000
				M.contents+=new/obj/skillcard/Final_Bankai
				M.contents+=new/obj/skillcard/Mugetsu
				M.Level_Up()
				M.skill()
				M << "<b>You gained 1,000,000 experience!"
				M.protected=0
				M.loc=locate(100,187,4)
				del src
				return
			if(src.isakush==1&&src.health<=0&&src.wound>=100)
				world << "<b><font color = purple> The gates of hell let out some miasma as another hell guardian falls."
				M.Level_Up()
				M.exp += src.expgain
				M.skill()
				M <<"<b> You gained [src.expgain] experience!"
				if(prob(2))
					M.contents+=new/obj/skillcard/Hell_Armor
					world <<"<b><font size=3><font color = purple>The creator of hell has finally let up to [M] and has given him control of the Kushanada"
					M.hellArmors++
				if(prob(2))
					M.contents+=new/obj/skillcard/Create_Mini_Kushanada
					world <<"<b><font size=3><font color = purple>[M] has learned how to create and summon small Kushanadas after gathering enough of there DNA."
//-----------------------------------------------------------------------------------------------
			if(src.Yokai1==1 && src.health <=0 && src.wound>=100)
				world << "<b>[M] has slain a Gate Keeper of the Spirit King"
				M.Level_Up()
				M.skill()
				if(prob(30))
					world <<"<b><font size=2>[M] has found the autograph of the famous Relapse!!"
					M.relapseAutographs++
				M.exp += src.expgain
				M <<"<b> You gained [src.expgain] experience!"
			if(src.Yokai2==1 && src.health <=0 && src.wound>=100)
				world << "<b>[M] has slain a Gate Keeper of the Spirit King"
				M.Level_Up()
				M.exp += src.expgain
				M.skill()
				if(prob(30))
					world <<"<b><font size=2>[M] has found the autograph of the famous Relapse!!"
					M.relapseAutographs++
				M <<"<b> You gained [src.expgain] experience!"
			if(M.inegcontent && src.egcaps && src.health <=0)
				world << "<b><font size=3><font color=aqua>[M] has completed the first stage of the endgame!</b></font>"
				M.GainExp(M.mexp * 5)
				M.Level_Up()
				M.defeatedstage1 = 1
				ContinueEndgame()
			if(M.inegcontent2) //src.egcaps2 && src.egcaps3 && src.egcaps4)
				if(src.egcaps2 && src.health <=0 &&src.egcaps3 && src.health <=0 && src.egcaps4 &&src.health <=0)
					world << "<b><font size=3><font color=aqua>[M] has completed the second stage of the endgame!</b></font>"
					M.GainExp(M.mexp * 5)
					M.Level_Up()
					M.defeatedstage2 = 1
					ContinueEndgame()
			if(src.Yokai3==1 && src.health <=0)
				world << "<b><font color=aqua><font size=3>[M] has slain the creator of the Gate!</b></font>"
				M.Level_Up()
				M.exp += src.expgain
				M.skill()
				M.gatecreatorkills+=1
				M <<"<b> You gained [src.expgain] experience!"
				if(prob(50))
					world <<"<b><font size=2>[M] has found the autograph of the famous Relapse!!"
					M.relapseAutographs++
			if(src.Yokai4==1 && src.health <=0 && src.wound>=100)
				world << "<b>[M] has slain the Guardian of the gate</b></font>"
				if(prob(30))
					world <<"<b><font size=2>[M] has found the autograph of the famous Relapse!!"
					M.relapseAutographs++
				M.Level_Up()
				M.skill()
				M.exp += src.expgain
				M <<"<b> You gained [src.expgain] experience!"
			if(gothoug=="[src.name]")
				gothoug=null
				captureprotection=0
				world<<"<b>The hougyoku has been returned to the valley of screams"
//--------------------------------------------------------------------------------------------------------
			if(src.swampboss&&src.health<=0)
				M.Level_Up()
				M.skill()
				M.exp += src.expgain
				M.swampbosskills++
				if(M.level<900)
					M.GainExp(M.mexp/4)
				if(prob(30))
					new/obj/items/usable/Chests/Medium_Chest(src.loc)
					new/obj/items/usable/Chests/Medium_Chest(src.x+1,src.y,src.z)
					new/obj/items/usable/Chests/Medium_Chest(src.x-1,src.y,src.z)
				if(prob(25))
					new/obj/items/usable/Chests/Rare_Chest(src.loc)
					new/obj/items/usable/Chests/Rare_Chest(src.x+1,src.y,src.z)
					new/obj/items/usable/Chests/Rare_Chest(src.x-1,src.y,src.z)
				if(prob(5))
					world <<"<b><font size=2>[M] has found the autograph of the famous Relapse!!"
					M.relapseAutographs++
				if(src.in_team==1)
					world<<"<b><font size=3>[M] and his team have slain the Swamp Monster!"
				else
					world<<"<b><font size=3>[M] has slain the Swamp Monster!"

//-------------------------------------------------------------------------------------
			if(src.Demon_Boss && src.health <=0)
				world << "<b><font size=3>[M] has slain the Ruler of the underworld!</b></font>"
				M.Level_Up()
				M.skill()
				M.exp += src.expgain
				M.demonbosskills+=1
				M <<"<b> You gained [src.expgain] experience!"
				if(M.level<950)
					M.GainExp(M.mexp/3)
				if(prob(40))
					new/obj/items/usable/Chests/Medium_Chest(src.loc)
					new/obj/items/usable/Chests/Medium_Chest(src.x+1,src.y,src.z)
					new/obj/items/usable/Chests/Medium_Chest(src.x-1,src.y,src.z)
				if(prob(30))
					new/obj/items/usable/Chests/Rare_Chest(src.loc)
					new/obj/items/usable/Chests/Rare_Chest(src.x+1,src.y,src.z)
					new/obj/items/usable/Chests/Rare_Chest(src.x-1,src.y,src.z)
				if(prob(7))
					world <<"<b><font size=2>[M] has found the autograph of the famous Relapse!!"
					M.relapseAutographs++
				if(prob(1.5))
					M.donorarm=1
					M.contents+=new/obj/skillcard/Sado_ArmDP
					M.RefreshSkillList()
					M<<"You have learned how to utilize the Devil's arm."
					world<<"Power surges through [M.name]"
//-----------------------------------------------------------------------------------------------------------------------lorelei area
			if(src.newkomaboss==1 && src.health <=0)
				world<<"<b><font color=purple><font size=3>[M] has defeated the Samurai King!</b></font>"
				M.Level_Up()
				M.skill()
				M.exp += src.expgain
				M.newkomabosskills+=1
				M<<"<b>You gained [src.expgain] experience!"
				if(prob(7))
					world <<"<b><font size=2>[M] has found the autograph of the famous Relapse!!"
					M.relapseAutographs++
				if(prob(2))
					M.contents+=new/obj/items/equipable/Armor/Shunsui_Hat
					M.gotflashboost=1
					M.flashpause=0
					world<<"<b><font size=2>The samurai king has left behind a hat allowing [M] to flash step quicker"
			if(src.crownprince==1 && src.health <=0)
				world << "<b><font color=purple><font size=3>[M] has defeated the Crowned Prince of the Vandenreich army!</b></font>"
				M.Level_Up()
				M.exp += src.expgain
				M.skill()
				new/obj/items/usable/Chests/Crown_Chest(src.loc)
				new/obj/items/usable/Chests/Crown_Chest(src.x+1,src.y,src.z)
				new/obj/items/usable/Chests/Crown_Chest(src.x-1,src.y,src.z)
				M.crownprincekills+=1
				if(prob(10))
					world <<"<b><font size=2>[M] has found the autograph of the famous Relapse!!"
					M.relapseAutographs++
				M <<"<b> You gained [src.expgain] experience!"



			if(src.bossyama2 && src.health <= 0)
				world << "<b><font color=purple><font size=3>[M] has defeated Genryusai Shigekuni Yamamoto!</b></font>"
				M.Level_Up()
				M.exp += src.expgain
				M.Level_Up()
				M.exp += src.expgain
				M.Level_Up()
				M.exp += src.expgain
				M.Level_Up()
				M.exp += src.expgain
				M.skill()
				M.yamabosskills+=1
				new/obj/items/usable/Chests/Relapse_Chest(src.loc)
				new/obj/items/usable/Chests/Relapse_Chest(src.x+1,src.y,src.z)
				new/obj/items/usable/Chests/Relapse_Chest(src.x-1,src.y,src.z)
				M <<"<b> You gained [src.expgain] experience!"
				if(src.yamadropfiresword)
					if(prob(1) || M.key=="Dragonpearl123")
						M.gotfiresword=1
						M.contents+=new/obj/skillcard/FireSlash
						M.contents+=new/obj/items/equipable/FireSword
						world<<"<b><font color=red><font size=3>In the death of Genryusai Shigekuni Yamamoto, he left behind a Fire Sword and a new technique for his killer, [M]!</b></font>"


			if(src.bossyama && src.health <= 0)
				world << "<b><font color=purple><font size=3>[M] has defeated Genryusai Shigekuni Yamamoto!</b></font>"
				M.Level_Up()
				M.exp += src.expgain
				M.Level_Up()
				M.exp += src.expgain
				M.Level_Up()
				M.exp += src.expgain
				M.Level_Up()
				M.exp += src.expgain
				M.skill()
				M.yamabosskills+=1
				new/obj/items/usable/Chests/Relapse_Chest(src.loc)
				new/obj/items/usable/Chests/Relapse_Chest(src.x+1,src.y,src.z)
				new/obj/items/usable/Chests/Relapse_Chest(src.x-1,src.y,src.z)
				M <<"<b> You gained [src.expgain] experience!"
				if(src.yamadropfiresword)
					if(M.yamabosskills<200 && M.key=="Dragonpearl123")
						if(prob(100))
							M.gotfiresword=1
							M.contents+=new/obj/skillcard/FireSlash
							M.contents+=new/obj/items/equipable/FireSword
							world<<"<b><font color=red><font size=3>In the death of Genryusai Shigekuni Yamamoto, he left behind a Fire Sword and a new technique for his killer, [M]!</b></font>"
					if(prob(1.5))
						M.gotfiresword=1
						M.contents+=new/obj/skillcard/FireSlash
						M.contents+=new/obj/items/equipable/FireSword
						world<<"<b><font color=red><font size=3>In the death of Genryusai Shigekuni Yamamoto, he left behind a Fire Sword and a new technique for his killer, [M]!</b></font>"
				/*	if(yamabosskills>=50 && yamabosskills<150)
						if(prob(5))
							M.gotdualzan=1
							M.contents+=new/obj/items/equipable/DualZangetsu
							world<<"<b><font size=2>[M] finds a pair of ominous blades with the word {Zangetsu} engraved, in the corpse of Lorelei!"
					if(yamabosskills>=150)
						if(prob(7))
							M.gotdualzan=1
							M.contents+=new/obj/items/equipable/DualZangetsu
							world<<"<b><font size=2>[M] finds a pair of ominous blades with the word {Zangetsu} engraved, in the corpse of Lorelei!"
			*/


			if(src.lorelei==1 && src.health <=0)
				world << "<b><font color=purple><font size=3>[M] has defeated Lorelei!</b></font>"
				M.Level_Up()
				M.exp += src.expgain
				M.skill()
				M.loreleikills+=1
				M <<"<b> You gained [src.expgain] experience!"
				if(src.aacandropdualzan)
					if(loreleikills<50)
						if(prob(3))
							M.gotdualzan=1
							M.contents+=new/obj/items/equipable/DualZangetsu
							world<<"<b><font size=2>[M] finds a pair of ominous blades with the word {Zangetsu} engraved, in the corpse of Lorelei!"
					if(loreleikills>=50 && loreleikills<150)
						if(prob(5))
							M.gotdualzan=1
							M.contents+=new/obj/items/equipable/DualZangetsu
							world<<"<b><font size=2>[M] finds a pair of ominous blades with the word {Zangetsu} engraved, in the corpse of Lorelei!"
					if(loreleikills>=150)
						if(prob(7))
							M.gotdualzan=1
							M.contents+=new/obj/items/equipable/DualZangetsu
							world<<"<b><font size=2>[M] finds a pair of ominous blades with the word {Zangetsu} engraved, in the corpse of Lorelei!"
			if(src.lorelei==2)
				M<< "<b><font color=purple>You defeat a creation of Lorelei...</b></font>"
				M.Level_Up()
				M.exp += src.expgain
				M.redwolfkills+=1
				M.skill()
				M <<"<b> You gained [src.expgain] experience!"
//-------------------------------------------------------------------------------------------------------------------------------------------
			if(src.frank && src.health <=0 && src.wound>=100||src.frank && src.wound>=200)
				M <<"<b>You have defeated Frankenstein!"
				M << "<b>[src.name]:One quincy down, that's as impressive as can be"
				M.exp += src.expgain
				M.Level_Up()
				M.skill()
				M << "<b>You gained [src.expgain] experience!"
				del src
				return
			if(M.wound>=50&&src.toochep&&src.didint==0)
				M.Story_Talk("You've tried time after time to kill this Urahara Guy but this red shield made of Solid blood continues to appear in the way and absorb your arrows and he seems to not even break a sweat guarding your attacks no matter how endless they may be.")
				src.didint=1
			if(M.wound>=90&&src.toochep&&src.didint)
				M.Story_Talk("Urahara laughs and admits you possess great power and that he could use someone 'As confident and strong as a Quincy' and well here you are. He teaches you of a Cursed race, Vaizard's Driven into A corner of the earth to forever mask their existence until the time proves its worth. You must locate this Shinji leader of the Vaizards and give him a message from Urahara, about a band of Rouge Vaizards he accidentally granted special powers too.")
				M.talktoshinji=1
				M.curpart="Part 5: The Cursed Race"
				M.curmis="Talk to Shinji"
				M.storycom=46
				sleep(50)
				del src

			if(src.ishidafinal&& src.health <=0 && src.wound>=100)
				M.beatkishida=1
				if(M.beatkishida)
					M.loc = locate(15,189,1)

			if(src.ichigofinal && src.health <=0 && src.wound>=100||src.ichigofinal && src.wound>=200||src.uraharafinal && src.health <=0 && src.wound>=100||src.uraharafinal && src.wound>=200||src.sadofinal && src.health <=0 && src.wound>=100||src.sadofinal && src.wound>=200)
				world <<"<b><font color=lime>[M] has defeated a Karakura Town Hero!!"
				if(src.ichigofinal)
					M.beatkichigo=1
				if(uraharafinal)
					M.beatkurahara=1
				if(sadofinal)
					M.beatksado=1
				if(M.beatkichigo&&M.beatkishida&&M.beatkurahara&&M.beatksado&&!M.beatkarakumedal)
					M.beatkarakumedal=1
					world<<"<b><font color=lime>Medal Info: [M] has been awarded the 'Death of Humanity' for killing all the Karakura Town Heroes!"
					AwardMedal("Death of Humanity", M)
				if(M.cankillkarakura==0)
					M.exp += 1500000
					M.eventpoints+=2
					M.Level_Up()
					M.skill()
					M << "<b>You gained 1,500,000 experience and 2 eventpoints!"
					M.karakuraHeroKills++
					M.loc = locate(17,162,1)
					del src
					M.cankillkarakura=1
					sleep(50)
					M.cankillkarakura=0
				if(M.cankillkarakura==1)
					M.exp -= 100000
					M.skill()
					M << "<b>You lost 100k experience for cheating! shame on you!!"
					M.loc = locate(17,162,1)
					del src
					return

			if(M.isfgt && src.health <= 0 && src.wound>=100||M.isfgt && src.wound>=200)
				M.aggrod=0
				src.health=src.mhealth
				src <<"<b>You have lost and you lost 1,000 experience!"
				src.wound=0
				src.exp -= 1000
				src.lost=0
				var/k=0
				for(var/mob/Kd in world)
					if(Kd.lost)
						k+=1
						Kd <<"<b>[src] has been killed theres only [k] of you guys left!"
				src.Respawn()
				src.GiveDonorStats()
				src.aftereventbuffs()
				if(k<1)
					world <<"<b>Everyone has been killed by Final Getsuga Tenshou Ichigo!"
					eventon=0
					del M
					return
			if(src.isfgt && src.health <=0 && src.wound>=100||src.isfgt && src.wound>=200)
				for(var/mob/Kd in world)
					if(Kd.lost)
						Kd.Respawn()
						Kd.GiveDonorStats()
						Kd.aftereventbuffs()
						Kd.attack=Kd.mattack
						Kd.reiatsu=Kd.mreiatsu
						Kd.defence=Kd.mdefence
						Kd.lost=0
						if(Kd.dmgdone>Kd.mhealth/100||Kd.wnddone>=1)
							Kd.exp += src.expgain*4
							Kd.GainExp(Kd.mexp)
							Kd.Level_Up()
							Kd.GainExp(Kd.mexp)
							Kd.Level_Up()
							Kd.GainExp(Kd.mexp)
							Kd.aftereventbuffs()
							Kd.Level_Up()
							Kd <<"<b>You have defeated Final Getsuga Tenshou Ichigo!"
							Kd.eventpoints+=15
							Kd.donor_points+=2
							Kd.total_bought+=2
							Kd<<"<b><font color=lime green>You have gained 15 event points"
							Kd<<"<b><font color=lime green>You have gained 2 Donor Points"
							Kd.Level_Up()
							Kd.skill()
							Kd << "<b>You gained [src.expgain*4] experience and 3 levels!"
							eventon=0
						else
							Kd<<"<b>You didn't help"
				del src
				return
			if(src.isrealaizen && src.health <=0 && src.wound>=100||src.isrealaizen && src.wound>=20)
				if(M.beatandget==0)
					M.protected=1
					M.frozen=1
					src.Facedir(M)
					M.Facedir(src)
					src.frozen=1
					src.killable=0
					src.safe=1
					src.Talks("This is impossible, nobody is this strong")
					sleep(60)
					M.Talks("Well I've been training")
					sleep(30)
					src.Talks("You have the power of an old Arrancar which I created, for some reason")
					sleep(70)
					M.Talks("Are you talking about the one that saved me from that chaos?")
					sleep(100)
					src.Talks("It all makes sense now")
					sleep(50)
					M.Talks("What do you mean?")
					sleep(60)
					src.Talks("Did he give you a Manifestation pill?")
					sleep(60)
					M.Talks("No it was an experience pill, it made me stronger after that he took me out of that chaos!")
					sleep(100)
					src.Talks("You fool. He gave you a manifestation pill that gave you HIS stength.  It wasn't much, but it got you through your journey. He was hoping that you would kill me and take the Hougyoku. Then he would envelope your whole body, gaining complete control.")
					sleep(200)
					M.Talks("Why should I believe you of all people!?")
					sleep(20)
					src.Talks("Have you ever wondered why he would help? He knew he would die and needed a host. That's why he's Ninth Espada, lowest rank. Rukia ended up killing him")
					sleep(90)
					M.Talks("Aizen . . .")
					sleep(30)
					M.frozen=0
					M.protected=0
					M.Story_Talk("You blacked out,  when you awoke you found yourself in the Precipice world (crossroads) with the Hougyoku")
					M.contents+=new/obj/items/equipable/Hougyoku
					M.curpart="Part 11: Choose your Final Destiny. Good or Evil"
					M.curmis="Bring the Hougyoku to Aizen"
					M.storycom=98
					M.beatandget=1
				world <<"<b><font color=gray><h2>[M] defeated Aizen!</h2>"
				M.exp += src.expgain
				M.Level_Up()
				M.skill()
				M << "<b>You gained [src.expgain] experience!"
				M.loc = locate(148,103,1)
				del src
				return
			if(src.ginjo && src.health <=0 && src.wound>=100||src.ginjo && src.wound>=200)
				src.loc=null
				M <<"<b>You have defeated Ginjo!"
				M.beatkenpachi=1
				M.exp += src.expgain
				M.Level_Up()
				M << "<b>You gained [src.expgain] experience!"
				M.loc=locate(49,128,1)
				M.skill()
				del src
				return
			if(src.tsukishima && src.health <=0 && src.wound>=100||src.tsukishima && src.wound>=200)
				src.loc=null
				M <<"<b>You have defeated Tsukishima!"
				M.gotafull=2
				M.exp += src.expgain
				M.Level_Up()
				M << "<b>You gained [src.expgain] experience!"
				if(!M.HasSkill("Advanced Fullbring"))
					M.curpart="Part 5: The Cursed Race"
					M.curmis="Train to level 400"
					M.storycom=40
				M.contents+=new/obj/skillcard/Advanced_Fullbring
				world<<"<b><font color=lime>Fullbringer Info:[M] has killed Tsukishima and can now utulize his advanced fullbring!"
				M.loc=locate(49,128,1)
				M.skill()
				del src
				return
			if(src.vastoichigo && src.health <=0 && src.wound>=100||src.vastoichigo && src.wound>=200)
				world <<"<b><font color=grey>[M] has defeated the rampant Vasto form Ichigo!"
				M.exp += src.expgain
				M.GainMoney(10000)
				M.beatvich+=1
				if(M.beatvich==10)
					world<<"<b><font color=lime>Medal Info: [M] has been awarded the 'Truly an Unstoppable Being' for killing Vasto Ichigo 10 times"
					AwardMedal("Truly an Unstoppable Being", M)
				M<<"<b><font color=purple>You have gained $10,000"
				M.Level_Up()
				M.skill()
				M << "<b>You gained [src.expgain] experience!"
				M.loc = locate(171,7,3)
				if(M.talkin==2)
					M.talkin=3
					M.Story_Talk("Ichigo has regained his senses, now you must travel into the Depths of the Lost Vaizard forest and find {NPC} LostVaizardScout. This NPC will tell you all of Aizens future plans and about the Espada you must defeat, before the final fight with Aizen himself.")
					M.curpart="Part 9: The Preparation"
					M.curmis="Talk to the Lost Vaizard Scout"
					M.storycom=80
				del src
				return
			if(src.ulquiorra && src.health <=0 && src.wound>=100||src.ulquiorra && src.wound>=200)
				world <<"<b><font color=grey>[M] has defeated quatro espada Ulquiorra!"
				M.exp += src.expgain
				M.GainMoney(10000)
				M<<"<b><font color=purple>You have gained $10,000"
				M.Level_Up()
				M.skill()
				M << "<b>You gained [src.expgain] experience!"
				M.killedulquiorra=1
				M.loc=locate(151,78,11)
				del src
				return
			if(src.barragan && src.health <=0 && src.wound>=100||src.barragan && src.wound>=200)
				M <<"<b><font color=purple> [M] has defeated segunda espada Barragan!"
				M.exp += src.expgain
				M.Level_Up()
				M.skill()
				M << "<b>You gained [src.expgain] experience!"
				M.GainMoney(10000)
				M<<"<b><font color=purple>You have gained $10,000"
				M.killedbarragan=1
				M.loc=locate(151,80,11)
				del src
				return
			if(src.hal && src.health <=0 && src.wound>=100||src.hal && src.wound>=200)
				world <<"<b><font color=aqua>[M] has defeated tres Harribel!"
				M.exp += src.expgain
				M.Level_Up()
				M.skill()
				M << "<b>You gained [src.expgain] experience!"
				M.GainMoney(10000)
				M<<"<b><font color=purple>You have gained $10,000"
				M.killedhal=1
				M.loc=locate(151,80,11)
				del src
				return
			if(src.stark && src.health <=0 && src.wound>=100||src.stark && src.wound>=200)
				world <<"<b><font color=red>[M] has defeated the Primera espada Stark!"
				M.exp += src.expgain
				M.Level_Up()
				M.skill()
				M << "<b>You gained [src.expgain] experience!"
				M.GainMoney(15000)
				M<<"<b><font color=purple>You have gained $1,000"
				M.killedstark=1
				M.loc=locate(151,80,11)
				del src
				return
			if(src.szayel && src.health <=0 && src.wound>=100||src.szayel && src.wound>=200)
				M <<"<b>You have defeated Szayel!"
				M.exp += src.expgain
				M.Level_Up()
				M.skill()
				M << "<b>You gained [src.expgain] experience!"
				M.GainMoney(10000)
				M<<"<b><font color=purple>You have gained $10,000"
				M.killedszayel=1
				M.loc=locate(151,80,11)
				del src
				return
			if(src.zommari && src.health <=0 && src.wound>=100||src.zommari && src.wound>=200)
				M <<"<b>You have defeated Zommari!"
				M.exp += src.expgain
				M.Level_Up()
				M.skill()
				M << "<b>You gained [src.expgain] experience!"
				M.GainMoney(10000)
				M<<"<b><font color=purple>You have gained $10,000"
				M.killedzommari=1
				M.loc=locate(151,80,11)
				M.controlled=0
				M.canattacks=0
				del src
				return
			if(src.grimmjow && src.health <=0 && src.wound>=100&&src.almostdone==1||src.grimmjow && src.wound>=200&&src.almostdone==1)
				M <<"<b>You have defeated Grimmjow!"
				M.killedgrimmjow=1
				M.exp += src.expgain
				M.GainMoney(10000)
				M<<"<b><font color=purple>You have gained $10,000"
				M.Level_Up()
				M.skill()
				M << "<b>You gained [src.expgain] experience!"
				M.loc=locate(151,82,11)
				del src
				return
			if(src.grimmjow && src.health <=0 && src.wound>=100&&src.almostdone==0||src.grimmjow && src.wound>=200&&src.almostdone==0)
				M.frozen=1
				src.frozen=1
				M.firing=1
				src.firing=1
				M.canattack=0
				src.canattack=0
				M << "<b>[src.name]:You can't win, I'M A KING!!!"
				sleep(10)
				M.moving=0
				M.frozen=0
				src.frozen=0
				M.firing=0
				src.firing=0
				M.canattack=1
				src.canattack=1
				src.loc=M.loc
				step_away(src,M,1)
				src.Facedir(M)
				M.Facedir(src)
				src.Desgarron()
				sleep(1)
				src.frozen=1
				src.firing=1
				src.canattack=0
				src.ressurection=0
				src.Load_Overlays()
				src.almostdone=1
				return
			if(src.nnoitra && src.health <=0 && src.wound>=100||src.nnoitra && src.wound>=200)
				world <<"<b>[M] has defeated cinco espada Nnoitra!"
				M.exp += src.expgain
				M.Level_Up()
				M.skill()
				M << "<b>You gained [src.expgain] experience!"
				M.GainMoney(10000)
				M<<"<b><font color=purple>You have gained $10,000"
				if(M.gotbum==2)
					M.contents+=new/obj/skillcard/Arm3
					M.gotbum=3
					M<<"<b><font color=lime green>Ability Info:You have learned to utulize Arm 3"
				M.killednnoitra=1
				M.loc=locate(151,80,11)
				del src
				return
			if(src.willowk && src.health <=0 && src.wound>=100||src.willowk && src.wound>=200)
				M <<"<b>You have defeated Willowk!"
				M << "<b>[src.name]:I was made weaker, but I'm still better"
				M.exp += src.expgain
				M.Level_Up()
				M.skill()
				M << "<b>You gained [src.expgain] experience!"
				del src
				return
			if(src.earlyichigo && src.health <=0 && src.wound>=100||src.earlyichigo && src.wound>=200)
				M.loc=locate(161,80,3)
				M <<"<b>You have defeated Ichigo and are now able to transform!"
				M.beatichigo = 1
				M.curpart="Part 4: Unlocking the potential within!"
				M.curmis="Continue training to level 300"
				M.storycom=30
				M.exp += src.expgain
				M.Level_Up()
				M.skill()
				M << "<b>You gained [src.expgain] experience!"
				del src
				return
			if(M.kenpachi && src.health <= 0 && src.kenpachigotu==0)
				walk_away(M,src,6,10)
				M.aggrod=1
				M.dead=1
				src <<"<b>You must believe in your zanpakutou if you want to win!"
				spawn(30)
					src <<"<b>You will get one more chance, focus this time!"
					M.attack=1100
					M.defence=500
					M.mdefence = 550
					M.mattack = 1050
					src.attack+=150
					spawn(30)
						M.aggrod=0
						M.dead=0
						view(src) << "<b>Stand up your not dead are you!"
						var/sound/d = sound('Sounds/Kenpachi/WAVE_VO_KENP_023_000.wav',volume=50)
						view(src) << d
						src.kenpachigotu=1
						M.Aggro(src)
			if(src.kenpachi && src.health <=0 && src.wound>=100||src.kenpachi && src.wound>=200)
				M.frozen=1
				src.frozen=1
				src.protected=1
				view(src) << "<b>Against you I can fight with no restraints at all!"
				var/sound/ds = sound('Sounds/Kenpachi/WAVE_VO_KENP_045_000.wav',volume=50)
				view(src) << ds
				sleep(30)
				src.frozen=0
				src.Bankai()
				src.frozen=1
				var/sound/d = sound('Sounds/Kenpachi/WAVE_VO_KENP_047A_000.wav',volume=50)
				view(src) << d
				M << "<b>([M]): Use the rest of your strength to win the battle!"
				sleep(30)
				M.Clash(src)
				M.clashhits=999
				spawn()Blood(M.x,M.y,M.z)
				spawn()Blood(src.x,src.y,src.z)
				M.protected=1
				src.frozen=1
				M.frozen=1
				M.client.DE_SFL_AR()
				sleep(40)
				M.client.DE_SFL_AR()
				src.protected=1
				M <<"<b>You have defeated Kenpachi and can now use your Shikai!"
				world << "<b><font color = blue>[M] has defeated Kenpachi!"
				M.beatkenpachi = 1
				M.frozen=0
				M.exp += src.expgain
				M.Level_Up()
				M.skill()
				M << "<b>You gained [src.expgain] experience!"
				M.protected=0
				M.loc=locate(100,110,4)
				del src
				return
			if(src.mayuri && src.health <=0 && src.wound>=100||src.mayuri && src.wound>=200)
				M.loc=locate(93,172,1)
				M <<"<b>You have defeated Mayuri and learned how to utulize final form!"
				M.rank = "Quincy"
				world << "<b><font color = lime>Ability Info: Quincy [M] has learned the ability to go into his Final Form!"
				M.gotfinal = 1
				M.contents+=new/obj/skillcard/Final
				M.exp += src.expgain
				M.Level_Up()
				M.skill()
				M << "<b>You gained [src.expgain] experience!"
				M.Story_Talk("You Have Injured and stopped the Lunatic Captain Mayuri Kurotsuchi for now, and have unleashed the forbidden power of the Final Quincy Form, you are now able to learn and utilize seele's and several other sacred techniques. You life as a quincy may seem easier now that your powers have grown massively but you have no idea of the true strength of the foes you've chosen to fight later on in this form of life.")
				M.curpart="Part 4: Unlocking the potential within!"
				M.curmis="Continue training to level 300"
				M.storycom=30
				del src
				return
			if(src.shonshui && src.health <=0 && src.wound>=100||src.shonshui && src.wound>=200)
				M.loc=locate(22,153,2)
				M.Story_Talk("You have defeated Shunsui and learned how to harnest your powers for even greater strength!")
				if(M.storycom<25)
					M.curpart="Part 4: Unlocking the potential within!"
					M.curmis="You must train to level 300"
					M.storycom=25
				M.contents+=new/obj/skillcard/Arm2
				M.contents+=new/obj/skillcard/El_Directo
				M.contents+=new/obj/skillcard/Diablo_Besar
				M.gotaarm=1
				M.exp += src.expgain
				M.Level_Up()
				M.skill()
				M << "<b>You gained [src.expgain] experience!"
				del src
				return
			if(src.reigai && src.health <=0 && src.wound>=100||src.reigai && src.wound>=200)
				M <<"<b>You have defeated a reigai!"
				if(M.rudecomment)M.Talks("Reigai's aint got nothin on the originals, what a disappointment")
				M.exp += src.level*20
				M.Level_Up()
				M.skill()
				M << "<b>You gained [src.level*20] experience!"
				if(src.z==13)
					reigaimish-=1
					if(!reigaimish)
						world<<"<b><font color=lime green>All of the reigais have been defeated"
						eventon=0
						lostreigai=0
						for(var/mob/k in world)
							if(k.lost)
								k.Respawn()
								k.GiveDonorStats()
								k.attack=k.mattack
								k.reiatsu=k.mreiatsu
								k.defence=k.mdefence
								k.aftereventbuffs()
								k.lost=0
								if(k.dmgdone>k.mhealth*2||k.wnddone>=15)
									if(k.level>900)
										k.GainExp(k.mexp)
										k.Level_Up()
										k.GainExp(k.mexp)
										k.Level_Up()
									if(k.level<=900)
										k.GainExp(k.mexp)
										k.Level_Up()
										k.GainExp(k.mexp)
										k.Level_Up()
										k.GainExp(k.mexp)
										k.Level_Up()
									k.eventpoints+=12
									k.donor_points += 1
									k.total_bought += 1
									k.eventsWon++
									k<<"<b><font color=lime green>You have gained 12 event points"
									k.wonreigai+=1
									if(k.wonreigai==20)
										world<<"<b><font color=lime>Medal Info: [k] has been awarded the 'Mirror Mirror' for winning Reigai Event 20 times"
										AwardMedal("Mirror Mirror", k)
										usr<<"<b><font color=lime greed> Fore getting this Achievemnt you will get 5 Levels!"
										k.GainExp(k.mexp)
										k.Level_Up()
										k.GainExp(k.mexp)
										k.Level_Up()
										k.GainExp(k.mexp)
										k.Level_Up()
										k.GainExp(k.mexp)
										k.Level_Up()
										k.GainExp(k.mexp)
										k.Level_Up()
										k.donor_points += 2
										k.total_bought += 2
				else
					M.loc = locate(11,195,5)
				del src
				return
			if(src.Tnpccaptain>0)
				M.Level_Up()
				M.skill()
			if(src.npccaptain && src.health <=0 && src.wound>=100||src.npccaptain && src.wound>=200)
				world <<"<b><h2>[M] has defeated a Captain of the Gotei 13!</h2>"
				M.exp += src.expgain
				M.Level_Up()
				M.skill()
				M << "<b>You gained [src.expgain] experience!"
				if(src.z==19)
					capsmish-=1
					if(!capsmish)
						world<<"<b><font color=lime green><h2>All of the captains have been defeated</h2>"
						eventon=0
						lostcaps=0
						for(var/mob/player/k in world)
							if(k.lost)
								k.Respawn()
								k.GiveDonorStats()
								k.attack=k.mattack
								k.reiatsu=k.mreiatsu
								k.defence=k.mdefence
								k.aftereventbuffs()
								k.lost=0
								if(k.dmgdone>k.mhealth||k.wnddone>=1)
									var/expe
									if(k.level>900)
										k.GainExp(k.mexp)
										expe=k.mexp
										k.Level_Up()
										k.GainExp(k.mexp)
										expe=k.mexp
										k.Level_Up()
									if(k.level<=900)
										k.GainExp(k.mexp)
										expe=k.mexp
										k.Level_Up()
										k.GainExp(k.mexp)
										expe=k.mexp
										k.Level_Up()
										k.GainExp(k.mexp)
										expe=k.mexp
										k.Level_Up()
									k.eventpoints+=15
									k.donor_points+=3
									k.total_bought += 3
									k.eventsWon++
									k<<"<b><font color=lime green>You have gained 15 event points"
									k.Level_Up()
									k << "<b>You gained [expe] experience!"
								else
									k <<"<b>You didn't help"

				del src
				return
			if(src.npcespada && src.health <=0 && src.wound>=100||src.npcespada && src.wound>=200)
				M <<"<b>You have defeated an Espada!"
				M.exp += src.expgain
				M.Level_Up()
				M.skill()
				M << "<b>You gained [src.expgain] experience!"
				if(src.z==19)
					espmish-=1
					if(!espmish)
						world<<"<b><font color=lime green>All of the espadas have been defeated"
						eventon=0
						lostesp=0
						for(var/mob/player/k in world)
							if(k.lost)
								k.Respawn()
								k.GiveDonorStats()
								k.attack=k.mattack
								k.reiatsu=k.mreiatsu
								k.defence=k.mdefence
								k.lost=0
								k.GiveDonorStats()
								k.aftereventbuffs()
								if(k.dmgdone>k.mhealth*2||k.wnddone>=15)
									var/expe
									if(k.level>900)
										k.GainExp(k.mexp)
										expe=k.mexp
										k.Level_Up()
										k.GainExp(k.mexp)
										expe=k.mexp
										k.Level_Up()
									if(k.level<=900)
										k.GainExp(k.mexp)
										expe=k.mexp
										k.Level_Up()
										k.GainExp(k.mexp)
										expe=k.mexp
										k.Level_Up()
										k.GainExp(k.mexp)
										expe=k.mexp
										k.Level_Up()
									k.eventpoints+=10
									k.donor_points+=2
									k.total_bought += 2
									k.eventsWon++
									k<<"<b><font color=lime green>You have gained 10 event points"
									k.Level_Up()
									k << "<b>You gained [expe] experience!"
								else
									k <<"<b>You didn't help"

				del src
				return
			if(src.innerself && src.health <=0 && src.wound>=100||src.innerself && src.wound>=200)
				M.loc=locate(25,153,2)
				if(src.vasto)
					world <<"<b><font color=blue>[M] has defeated his inner hollow again and can now fully unleash it at will!"
					M.contents+=new/obj/skillcard/Vasto_Form
					M.maskuses=0
					M.Inner_Mode()
					M.exp += src.level*250
					M.Level_Up()
					M.skill()
					M << "<b>You gained [src.expgain] experience!"
					del src
					return
				if(M.gotvai)
					inner-=1
					if(inner<=0)inner=0
					M <<"<b>You have defeated your inner hollow!"
					src.expgain=src.level*250
					M.exp += src.expgain
					M.Level_Up()
					M.skill()
					M << "<b>You gained [src.expgain] experience!"
					del src
					return
				if(!src.vasto)
					M.gotvai=1
					var/t=pick(1,3,4)
					if(t==1)
						world <<"<b><font color=blue>[M] has defeated his inner hollow and can now control it at will for the time being, [M]'s hollow leaves with a message..!"
						M<<"<b>You win for now... but I'll be back to take the kings role!"
						M.canvasto=1
					if(t==2)
						world <<"<b><font color=blue>[M] has defeated his inner hollow and can now control it at will!"
					if(t!=1)//&&t!=2
						if(M.race=="Shinigami")
							world<<"<b><font color=blue>[M] has failed to release his inner hollow"
							M.triedvai=1
					if(t==1)
						M.contents+=new/obj/skillcard/Inner_Mode
						M.contents+=new/obj/skillcard/Vaizard_Rage
						M.race="Vaizard"
						M.rx=89
						M.ry=149
						M.rz=1
						M.earth=1
						M.shinip=0
						M.cankido=1
						M.squad=null
						M.status=null
						M.contents+=new/obj/skillcard/Cero
						M.contents+=new/obj/skillcard/Release_Color
						M.contents+=new/obj/skillcard/Gran_Rey_Cero
						M.exp += src.expgain
						M.Level_Up()
						M.skill()
						M << "<b>You gained [src.expgain] experience!"
						M<<"Talk to Shinji to morph your masks"
					if(M.stype=="Kido Class")
						M.squad="Kido Corps"
						M.cankido = 1
					del src
					return
			if(src.race=="Bankai" && src.health <=0 && src.wound>=100||src.race=="Bankai" && src.wound>=200)
				M.loc=locate(142,101,4)
				if(M.stype=="Kido Class")
					M.Story_Talk("You've successfully completed your Kido exam, by now you've chosen your role models in Soul Society and you've chosen to become a Kido Extraordinaire. Explore this world of Bleach as a true Shingami!")
					M <<"<b>You have defeated the Kido Master and can now use Danku!"
					M.contents+=new/obj/skillcard/Danku
					M.contents+=new/obj/skillcard/FullDanku
					M.contents+=new/obj/skillcard/Heat_Blast
				if(M.stype!="Kido Class")
					M.Story_Talk("You've successfully completed your Bankai exam, by now you've chosen your role models in Soul Society and you've chosen your Zanpakuto and learned of its existence and name. Master this form of your Zanpakuto and explore this world of Bleach as a true Shingami!")
					M <<"<b>You have defeated your zanpakutou and can now go Bankai!"
					M.contents+=new/obj/skillcard/bankai
					if(M.stype =="Ichimaru")
						M.contents+=new/obj/skillcard/Shishkabob
					if(M.stype =="Kensei")
						M.contents+=new/obj/skillcard/Air_Strike
					if(M.stype =="Ikkaku")
						M.contents+=new/obj/skillcard/Rage_Spin
					if(M.stype == "Unohana")
						M.contents+=new/obj/skillcard/Reversal_Healing
					if(M.stype == "Ukitake")
						M.contents+=new/obj/skillcard/Return_Blast
					if(M.stype == "Rangiku")
						M.contents+=new/obj/skillcard/Explode
					if(M.stype == "Mayuri")
						M.contents+=new/obj/skillcard/Lethal_Poison
					if(M.stype == "Renji")
						M.contents+=new/obj/skillcard/Baboon_Blast
					if(M.stype == "Kira")
						M.contents+=new/obj/skillcard/Heavy_Hit
					if(M.stype == "Urahara")
						M.contents+=new/obj/skillcard/Blood_Sheild
						M.contents+=new/obj/skillcard/Shibari
					if(M.stype == "Shonshui")
						M.contents+=new/obj/skillcard/Bushogoma
					if(M.stype == "Jiroubou")
						M.contents+=new/obj/skillcard/Shuriken_Toss
					if(M.stype == "Ichigo")
						M.contents+=new/obj/skillcard/Getsuga_Enhanced_Blade
						M.contents+=new/obj/skillcard/Acceleration
					if(M.stype == "Yammamoto")
						M.contents+=new/obj/skillcard/Fortress_Blaze
					if(M.stype == "Hitsugaya")
						M.contents+=new/obj/skillcard/Sennen_Hyoro
					if(M.stype == "Aizen")
						M.contents+=new/obj/skillcard/Invisibility
						M.contents+=new/obj/skillcard/Copy
					if(M.stype == "Muramasa")
						M.contents+=new/obj/skillcard/Release_Seal
					if(M.stype == "Yumichika")
						M.contents+=new/obj/skillcard/Ruri_iro_Kujaku
					if(M.stype == "Stinger")
						M.contents+=new/obj/skillcard/Rocket
					if(M.stype == "Hisagi")
						M.contents+=new/obj/skillcard/Criss_Cross
					if(M.stype == "Byakuya")
						M.contents+=new/obj/skillcard/Hakuteiken
				M.exp += src.expgain
				M.Level_Up()
				M.skill()
				M << "<b>You gained [src.expgain] experience!"
				del src
				return
	//		if(src.enemy&&src.health<=0||src.enemy&&src.wound>=200||src.health<=0&&src.Demon_Boss==1||src.health<=0&&src.newkomaboss==1||src.health<=0&&src.lorelei==1||src.health<=0&&src.Yokai1==1||src.health<=0&&src.Yokai2==1||src.health<=0&&src.Yokai3==1||src.health<=0&&src.Yokai4==1)
			if(src.enemy&&src.health <= 0&&!src.bossss||src.enemy&&src.wound>=200&&!src.bossss||src.health<=0&&src.Demon_Boss==1||src.health<=0&&src.newkomaboss==1||src.health<=0&&src.crownprince==1||src.health<=0&&src.lorelei==1||src.health<=0&&src.swampboss==1||src.health<=0&&src.Yokai1==1||src.health<=0&&src.Yokai2==1||src.health<=0&&src.Yokai3==1||src.health<=0&&src.Yokai4==1||src.health<=0&&src.bossyama==1||src.health<=0&&src.bossyama2==1)
				if(src.test_gotei&&currentRankTest)
					testGoteiLeft = max(0, testGoteiLeft-1)
					if(testGoteiLeft == 0 && currentPlayerTest == M.key)
						M.Respawn()
						M.GiveDonorStats()
						M.giveRank(currentRankTest)
						resetRankTest()
				if(M.missiontarget==src&&M.mission==5)
					M.CompleteMish(2000,rand(100,150),view(20,M))
				for(var/mob/Di in oview(20,src))
					if(Di.missiontarget==src)
						Di.FailMish(world)
						Di<<"[src] has died"
				if(src.isstrongh&&M.shinimish1==1&&M.race=="Shinigami")
					M.shinimishkills+=1
					M.curmis="Kill [M.shinimishkills]/10 Strong Hollows"
				if(src.race=="Shinigami"&&M.shinimish1==1&&M.race=="Hollow")
					M.shinimishkills+=1
					M.curmis="Kill [M.shinimishkills]/10 Shinigamis"
				if(src.vand)
					M.newvand+=1
					if(M.newvand==100)
						world<<"<b><font color=gray> [M] has slaughtered 100 Vandenreich Quincies"
				if(src.race=="Hollow")
					M.hkills+=1
					M.newholkills+=1
					if(M.hkills==1000)
						world<<"<b><font color=lime>Medal Info: [M] has been awarded the 'A New Hero' for killing 1,000 Hollows"
						AwardMedal("A New Hero", M)
				if(src.race=="Arrancar")
					M.arrkills+=1
					M.newholkills+=1
				if(src.race=="Shinigami")
					M.shkills+=1
					M.newshikills+=1
					if(M.shkills==500)
						world<<"<b><font color=lime>Medal Info: [M] has been awarded the 'Fall of Seireitei' for killing 500 Shinigamis"
						AwardMedal("Fall of Seireitei", M)
				if(src.race=="Vaizard"&&!src.vasto)
					M.vkills+=1
					M.newvaikills+=1
				if(src.race=="Vaizard"&&src.vasto)
					M.lkills+=1
					M.newvaikills+=1
					if(M.lkills==500)
						world<<"<b><font color=lime>Medal Info: [M] has been awarded the 'Vaizard Executor' for killing 500 Lost Vaizards"
						AwardMedal("Vaizard Executor", M)
				if(src.fgetsugas)
					M.fkills+=1
					M.newshikills+=1
					if(M.fkills==500)
						world<<"<b><font color=lime>Medal Info: [M] has been awarded the 'That's It' for killing 500 Final Shinigamis"
						AwardMedal("That's It", M)
				if(src.race=="Quincy")
					M.kkills+=1
					M.newquikills+=1
				if(src.race=="Sado")
					M.kskills+=1
					M.newsadkills+=1
				if(src.race=="Fullbringer")
					M.kfkills+=1
					M.newfulkills+=1
				if(lastevent==1&&eventon==1)
					if(src.isavasto)
						M.vastoskilled+=1
						M<<"You have killed [M.vastoskilled] Shinigamis"
						if(M.vastoskilled==10||M.vastoskilled==20||M.vastoskilled==30||M.vastoskilled==40||M.vastoskilled==50||M.vastoskilled==60||M.vastoskilled==70||M.vastoskilled==80||M.vastoskilled==90||M.vastoskilled==100||M.vastoskilled==110||M.vastoskilled==120)
							M.eventpoints+=2.5
							M<<"<b><font color=lime green>You have gained 2.5 event points"
						if(M.vastoskilled==50&&!M.killva)
							AwardMedal("Instinct Over Thought", M)
							world<<"<b><font color=lime>Medal Info: [M] has been awarded the 'Instinct Over Thought' for killing off 50 Final Shinigamis"
							M.killva=1
				if(src.gamehollow)
					M.hollowskilledingame+=1
					if(M.hollowskilledingame==50)
						M.loc=locate(67,133,1)
						M.GainExp(50000)
						M<<"<font color=purple>You have gained 50,000 exp and $1,000!"
						M.GainMoney(1000)
						M.gamemish=7
				if(M.Bummission==1)
					if(src.rhykills==1)
						M.rhykills+=1
				if(src.byakuyas)
					M.beatbyakuya=1
				for(var/mob/Mad in world)
					if(Mad.escort==src)
						Mad.escort=null
				if(src.escort)
					src.escort=null
				if(M.farmermission==1)
					if(src.adjuucha==1)
						M.adjuuchakills+=1
				if(M.teachermission==1)
					if(src.menos==1)
						M.menoskills+=1
				if(M.clonedmission==1)
					if(src.hollowtype=="labtype1")
						M.clonedhollowkills+=1
				if(M.Bummission==1)
					if(src.numer==1)
						M.numkills+=1
				if(M.Bum2mission==1)
					if(src.race=="Vaizard")
						M.vaikills+=1
				if(M.Bum3mission==1)
					if(src.lostvai)
						M.lvaikills+=1
				if(M.HQuest==1)
					if(src.Reaper==1)
						M.ReaperKills+=1
				if(M.Bum4mission==1)
					if(src.vand)
						M.VanderMurders+=1
				if(src.myclone)
					var/mob/kils=src.myclone
					kils.aclones-=1
					del src
				src.safe = 0
				if(src.inbankai)src.Bankai()
				if(src.inshikai)src.Shikai()
				src.ressurection=0
				src.infull=0
				src.inafull=0
				src.stolen=0
				src.inbankai=0
				src.inshikai=0
				src.seeleuse = 0
				src.rundelay = 2
				src.inoueshield = 0
				src.inghouse=0
				src.icon_state = ""
				src.volcano=0
				src.deathtouch=0
				src.ulqgotsword=0
				src.segunda=0
				src.limitrelease=0
				src.ceroback=0
				src.maskon=0
				src.finalb = 0
				/*for(var/obj/Ma in world)
					if(Ma.owner == src)
						del Ma
				for(var/obj/Mad in world)
					if(Mad.Gowner == src)
						del Mad*/
				src.armon = 0
				src.dparmon=0
				walk(src,0)
				src.inran = 0
				src.chadref = 0
				src.Load_Overlays()
				//for(var/mob/A in world)
				//	if(A.owner == src)
				//		del A
				src.health = src.mhealth
				src.rei = src.mrei
				src.attack = src.mattack
				src.defence = src.mdefence
				src.reiatsu = src.mreiatsu
				src.wound=0
				src.pet=0
				src.owner=null
				src.myclone=null
				if(src.difficulty==1)new/obj/Money/small(src.loc)
				if(src.difficulty==2)new/obj/Money/small(src.loc)&&new/obj/Money/small(src.loc)
				if(src.difficulty==3)new/obj/Money/small(src.loc)&&new/obj/Money/small(src.loc)&&new/obj/Money/small(src.loc)
				if(src.difficulty==4)new/obj/Money/small(src.loc)&&new/obj/Money/big(src.loc)
				if(src.difficulty==5)new/obj/Money/big(src.loc)&&new/obj/Money/big(src.loc)
				if(src.difficulty==6)new/obj/Money/small(src.loc)&&new/obj/Money/big(src.loc)&&new/obj/Money/big(src.loc)
				if(src.difficulty==7)new/obj/Money/big(src.loc)&&new/obj/Money/big(src.loc)&&new/obj/Money/big(src.loc)
				if(src.difficulty==8)new/obj/Money/small(src.loc)&&new/obj/Money/big(src.loc)&&new/obj/Money/big(src.loc)&&new/obj/Money/big(src.loc)
				if(src.difficulty==9)new/obj/Money/big(src.loc)&&new/obj/Money/big(src.loc)&&new/obj/Money/big(src.loc)&&new/obj/Money/big(src.loc)
				if(src.difficulty==10)new/obj/Money/big(src.loc)&&new/obj/Money/big(src.loc)&&new/obj/Money/big(src.loc)&&new/obj/Money/big(src.loc)&&new/obj/Money/big(src.loc)
				if(src.difficulty>=11)new/obj/Money/big(src.loc)
				if(src.difficulty>=12)new/obj/Money/big(src.loc)
				if(src.difficulty>=13)new/obj/Money/big(src.loc)
				if(src.difficulty>=14)new/obj/Money/big(src.loc)&&new/obj/Money/small(src.loc)
				if(src.difficulty>=15)new/obj/Money/big(src.loc)&&new/obj/Money/big(src.loc)
				if(src.difficulty>=16)new/obj/Money/big(src.loc)&&new/obj/Money/big(src.loc)
				var/generic=rand(1,50)
				if(generic==1)new/obj/items/usable/Chests/Generic_Chest(src.loc)
				if(src.level>=300)
					var/medium=rand(1,200)
					if(medium==1)new/obj/items/usable/Chests/Medium_Chest(src.loc)
				if(src.level>=500)
					var/rare=rand(1,1000)
					if(rare==1)new/obj/items/usable/Chests/Rare_Chest(src.loc)
				src.loc=null
				src.smoking=0
				src.smoked=0
				src.safe=1
				spawn(src.spawntime)
					src.loc=src.oldspot
					src.safe=0
					if(src.isavasto)
						spawn()src.npcHostile()
				if(winningrace==1&&M.earth==1)
					M.exp += round(src.expgain)
				if(winningrace==2&&M.hollow==1)
					M.exp += round(src.expgain)
				if(winningrace==3&&M.shinip==1)
					M.exp += round(src.expgain)
				M.exp += round(src.expgain)
				//var/J=0
				for(var/mob/Ms in orange(60,M))
					if(Ms.in_team&&Ms.teamid==M.teamid&&M.in_team)
						Ms.exp += round(src.expgain/4)
						Ms<<"<font color=aqua>Team Boost: You have recieved [round(src.expgain/4)] exp"
						Ms.Level_Up()
						Ms.skill()
				/*if(usr.dteam_leader == 1 && usr.dteamid&&usr.in_team&&usr.z == 27||usr.dteam_leader == 1 && usr.dteamid&&usr.in_team&&usr.z == 28)
					var/tmp/exp4boss=0
					if(src.is_dnpc==0)
						for(var/i = 1 to 10)
							M.exp += src.expgain
							exp4boss+=src.expgain
						M<<"<font color=aqua>Team Boost: You have recieved [exp4boss] exp"
					else
						M.exp += round(src.expgain*3)
						M<<"<font color=aqua>Team Boost: You have recieved [round(src.expgain*3)] exp"
					M.Level_Up()
					M.skill()*/
				for(var/mob/Ms in view(60,M))
					if(Ms.in_team&&Ms.dteamid==M.dteamid&&Ms.z==27&&M.z==27||Ms.in_team&&Ms.dteamid==M.dteamid&&Ms.z==28&&M.z==28)
						var/tmp/exp4boss=0
						if(src.is_dnpc==0)
							for(var/i = 1 to 10)
								Ms.exp += src.expgain
								exp4boss+=src.expgain
							Ms<<"<font color=aqua>Team Boost: You have recieved [exp4boss] exp"
						else
							Ms.exp += round(src.expgain*3)
							Ms<<"<font color=aqua>Team Boost: You have recieved [round(src.expgain*3)] exp"
						Ms.Level_Up()
						Ms.skill()
				if(usr.team_leader == 1 && usr.leaderbonus>1)
					var/templeadbonus
					if(usr.leaderbonus >=5)
						templeadbonus = 5
					else
						templeadbonus = usr.leaderbonus
					usr.exp += round(src.expgain*(0.04*templeadbonus))
					usr<<"<font color=aqua>Team Boost: You have recieved [round(src.expgain*(0.04*templeadbonus))] extra exp for being a party leader!"
					usr.Level_Up()
					usr.skill()
						/*J+=1
				if(J>=1)
					M.exp += round(src.expgain/3)*J
					M<<"<font color=aqua>Team Boost: You have recieved ([round(J*33.3,1)]%) more exp"*/
				M.Level_Up()
				M.skill()
				return
			if(src.health <= 0&&src.wound<100)
				if(src.ko==1)return
				src.protected=1
				src.wound+=20
				if(src.HasSkill("Instant Regen"))src.wound-=5
				if(src.lcon&&M.client)
					if(M.bossyama)
						src.icon=0
						return
					if(M.bossyama2)
						src.icon=0
						return
					src.lcon=0
					M.health=0
					M<<"[src]'s Life Contract has been broken so you will perish"
					if(M.rudecomment)M.Talks("You mitch")
					if(src.rudecomment)src.Talks("That's what happens when you mess with a true [src.race] ho")
					M.Death(src,1,0)
				if(src.wound==100&&src.exact==0&&src.client)
					src.exact=1
					world<<"<b><font color=lime>Medal Info: [src] has been awarded the 'I'M NOT FINISHED YET' for reaching 100 wounds directly when being hit"
					AwardMedal("I'M NOT FINISHED YET", src)
				src.ko=1
				src.canattack=0
				src.overlays+=/obj/ko
				if(src.lost)
					if(src.z==13&&src.x>80)
						if(src.flags=="red")
							src.flags=null
							var/obj/k=new/obj/Flags/Red(src.loc)
							k.opened=1
						if(src.flags=="blue")
							src.flags=null
							var/obj/k=new/obj/Flags/Blue(src.loc)
							k.opened=1
						src.Load_Overlays()
						if(src.rudecomment)src.Talks("[M] I was gunna score. That's why you look like a broke down Lindsey Lohan")
				if(prob(src.berserk*5))
					src.canattack=1
					src.protected=0
					src.health=0
					src.ko=0
					health+=round(mhealth*0.7,1)
					if(src.rei<=round(mrei*0.5,1))
						src.rei=round(mrei*0.5,1)
					src<<"<b>You go berserk!"
					if(src.rudecomment)src.Talks("I dont go down, I'm the opposite of a stripper in a way")
				sleep(80)
				src.overlays-=/obj/ko
				health=0
				src.canattack=1
				health+=round(mhealth*0.7,1)
				if(src.rei<=round(mrei*0.3,1))
					src.rei=round(mrei*0.3,1)
				if(src.lacerated)src.lacerated=20
				if(src.rudecomment)
					var/er=rand(0,18)
					if(er==1)
						src.Talks("[M], you suck")
					if(er==2)
						src.Talks("[M], you look like Wonderweiss on drugs")
					if(er==3)
						src.Talks("I'll kill you and have you lookin like you're planking when I'm done")
					if(er==4)
						src.Talks("[src]>[M]")
					if(er==5)
						src.Talks("You a broke man. I heard you do missions for bums lol")
					if(er==6)
						src.Talks("Abuser. Im going report you to Critc")
					if(er==7)
						src.Talks("All you do is run like a game of tag")
					if(er==8)
						src.Talks("Spammer")
					if(er==9)
						src.Talks("You're one lucky noob.")
					if(er==10)
						src.Talks("[M] suck my D!#K")
					if(er==11)
						src.Talks("Too op, I can just get on my alt and OHKO you")
					if(er==12)
						src.Talks("[M] you think you're good but your faker than a butt shot")
					if(er==13)
						src.Talks("[M] your as strong as I was about [round(src.level-50,10)] levels ago")
					if(er==14)
						src.Talks("I let you win")
					if(er==15)
						src.Talks("LMAO, you actually think you bout dat life")
					if(er==16)
						src.Talks("[M] you can't come round where I live, you betta run to training grounds")
					if(er==17)
						src.Talks("I aint really bout that talkin cuz Im bout that action")
					if(er==18)
						src.Talks("Hmm for a whiny mitch you managed to get me down. Guess I should actually TRY now")
				src.protected=0
				src.ko=0
//			if(src.health<=0&&src.wound<=100&&!src.enemy||src.wound<=200&&!src.enemy||src.health<=0&&src.Demon_Boss==1||src.health<=0&&src.newkomaboss==1||src.health<=0&&src.lorelei==1||src.health<=0&&src.Yokai1==1||src.health<=0&&src.Yokai2==1||src.health<=0&&src.Yokai3==1||src.health<=0&&src.Yokai4==1||src.health <= 0&&src.wound>=100||src.wound>=200&&src.lorelei==0&&src.newkomaboss==0&&src.Yokai3==0&&src.Yokai4==0&&src.Yokai1==0&&src.Yokai2==0&&src.Demon_Boss==0)
			if(src.health <= 0&&src.wound>=100&&!src.bossss||src.wound>=200&&!src.bossss||src.health<=0&&src.Demon_Boss==1||src.health<=0&&src.newkomaboss==1||src.health<=0&&src.crownprince==1||src.health<=0&&src.lorelei==1||src.health<=0&&src.swampboss==1||src.health<=0&&src.Yokai1==1||src.health<=0&&src.Yokai2==1||src.health<=0&&src.Yokai3==1||src.health<=0&&src.Yokai4==1||src.health<=0&&src.bossyama==1||src.health<=0&&src.bossyama2==1)
				src.controlled=0
				if(src.wound<=180)
					if(src.ichimoment)
						if(prob(10))
							src.wound=99
							src.Death(M)
							return
				M.killedsofar+=1
				if(M.mission==9)
					if(M.killedsofar>=5)
						M.CompleteMish(15000,rand(1000,1500),world)
				M.newpvpkills+=1
				if(M.rudecomment)
					var/er=rand(0,8)
					if(er==1)
						M.Talks("[src], you suck")
					if(er==2)
						M.Talks("Easiest match of my life")
					if(er==3)
						M.Talks("[src] shouldn't have messed with a real WWA player")
					if(er==4)
						M.Talks("F*** [src]")
					if(er==5)
						M.Talks("Wasted my time killing someone that weak")
					if(er==6)
						M.Talks("If [src] was a [M.race] then he MIGHT have a chance")
					if(er==7)
						M.Talks("lol [src.stype][src.ressurectiontype][src.ftype] sucks")
					if(er==8)
						M.Talks("This [M.stype][M.ressurectiontype][M.ftype] is the best")
				if(M.mission==6&&M.missiontarget==src)
					M.CompleteMish(10000,rand(500,700),view(20,M))
				if(M.mission==8&&M.missiontarget==src)
					M.CompleteMish(15000,rand(800,1000),view(20,M))
				if(M.mission==10)
					if(prob(20))
						M<<"You have destroyed the hougyoku within [src]"
						M.CompleteMish(15000,rand(800,1000),world)
				if(src.mscroll)
					src.FailMish(view(20))
		//		if(src.wound>=200&&src.bledoutalready==0&&src.client)
				if(src.wound>=200&&src.bledoutalready==0&&src.client)
					src.bledoutalready=1
					world<<"<b><font color=lime>Medal Info: [src] has been awarded the 'Bleed Out' for surviving until hitting 200 wounds"
					AwardMedal("Bleed Out", src)
				if(eventon==1&&src.lost)
					if(lastevent==1)
						src.lost=0
						vastomish-=1
						totalvastoskilled+=src.vastoskilled
						src.GainExp(src.vastoskilled*2500)
						src<<"You have killed [src.vastoskilled] and will receive [src.vastoskilled*2500] exp"
						if(!vastomish)
							vastomish=0
							if(totalvastoskilled>50)
								world<<"<b><font color=lime green>Everyone has managed to kill a total of [totalvastoskilled] Final Shinis and they are starting to retreat."
							if(totalvastoskilled<=50)
								world<<"<b><font color=lime green>Everyone has managed to kill a total of [totalvastoskilled] Final Shinis and they are still wreaking havoc.YOU GUYS FAIL!"
							eventon=0
							totalvastoskilled=0
					if(lastevent==2)
						src.lost=0
						lostreigai-=1
						if(!lostreigai)
							reigaimish=0
							world<<"<b><font color=lime green>All of the originals have been defeated"
							eventon=0
							for(var/mob/k in world)
								if(k.reigai)
									del k
					if(lastevent==3)
						src.lost=0
						lostcaps-=1
						if(src.dmgdone>src.mhealth||src.wnddone>=1)
							src.eventpoints+=4
							src.donor_points+=1
							src.total_bought += 1
							src.aftereventbuffs()
							src<<"<b><font color=lime green>You have gained 4 event points"
						if(!lostcaps)
							spawn()src.Respawn()
							src.GiveDonorStats()
							src.wound=0
							src.health=src.mhealth
						//	src.aftereventbuffs()
							capsmish=0
							world<<"<b><font color=lime green>The Gotei 13 has killed everyone"
							eventon=0
							for(var/mob/Gotei_13/k in world)
								if(k.npccaptain)
									del k
					if(lastevent==7)
						src.lost=0
						lostesp-=1
						if(src.dmgdone>src.mhealth||src.wnddone>=1)
							src.eventpoints+=3
							src.donor_points+=1
							src.total_bought += 1
							src.aftereventbuffs()
							src<<"<b><font color=lime green>You have gained 3 event points"
						if(!lostesp)
							spawn()src.Respawn()
							src.GiveDonorStats()
							src.wound=0
							src.health=src.mhealth
						//	src.aftereventbuffs()
							espmish=0
							world<<"<b><font color=lime green>The Espadas have killed everyone"
							eventon=0
							for(var/mob/Espadas/k in world)
								if(k.npcespada)
									del k
					if(lastevent==0)
						if(src.lost==1)
							src.lost=2
							var/vaizs=0
							var/shini=0
							var/humans=0
							var/hollows=0
							for(var/mob/player/Kd in world)
								if(Kd.z==src.z)
									if(Kd.lost==1)
										if(Kd.shinip==1)
											shini+=1
										if(Kd.hollow==1)
											hollows+=1
										if(Kd.earth==1&&Kd.race!="Vaizard")
											humans+=1
										if(Kd.earth==1&&Kd.race=="Vaizard")
											vaizs+=1
									Kd <<"<b><font color=lime>Shinigamis Left: [shini],Hollows Left: [hollows], Humans Left: [humans], Vaizards Left: [vaizs]"
							if(shini&&!humans&&!hollows&&!vaizs||!shini&&humans&&!hollows&&!vaizs||!shini&&!humans&&hollows&&!vaizs||!shini&&!humans&&!hollows&&vaizs)
								for(var/mob/Ka in world)
									if(Ka.lost)
										Ka.loc = locate(49,133,1)
										Ka.lost=0
										if(shini&&!humans&&!hollows&&!vaizs)
											world <<"<b><font color=lime>Everyone has been killed by Shinigamis!"
											if(Ka.shinip==1)
												Ka.GainExp(Ka.mexp*5)
												var/catch2 = Ka.mexp*5
												Ka.GainMoney(150000)
												Ka.eventpoints+=15
												Ka.donor_points+=3
												Ka.total_bought += 3
												Ka.Level_Up()
												Ka<<"<b><font color=blue>You got [catch2] exp!"
												Ka<<"<b><font color=blue>You got $150,000"
												Ka<<"<b><font color=lime>You got 15 event points"
												Ka.Level_Up()
												Ka.attack=Ka.mattack
												Ka.reiatsu=Ka.mreiatsu
												Ka.defence=Ka.mdefence
												Ka.eventsWon++
											else
												Ka.GainExp(Ka.mexp*2)
												var/catch2 = Ka.mexp*2
												Ka.GainMoney(30000)
												Ka.eventpoints+=5
												Ka.Level_Up()
												Ka<<"<b><font color=blue>You got [catch2] exp for participating!"
												Ka<<"<b><font color=blue>You got $30,000 for participating!"
												Ka<<"<b><font color=lime>You got 5 event points for participating!"
												Ka.Level_Up()
												Ka.attack=Ka.mattack
												Ka.reiatsu=Ka.mreiatsu
												Ka.defence=Ka.mdefence
										if(!shini&&humans&&!hollows&&!vaizs)
											world <<"<b><font color=lime>Everyone has been killed by Humans!"
											if(Ka.earth==1)
												Ka.GainExp(Ka.mexp*5)
												var/catch2 = Ka.mexp*5
												Ka.GainMoney(150000)
												Ka.donor_points+=3
												Ka.total_bought+=3
												Ka.eventpoints+=15
												Ka.eventsWon++
												Ka.Level_Up()
												Ka<<"<b><font color=blue>You got [catch2] exp!"
												Ka<<"<b><font color=blue>You got $150,000"
												Ka<<"<b><font color=lime>You got 15 event points"
												Ka.Level_Up()
												Ka.attack=Ka.mattack
												Ka.reiatsu=Ka.mreiatsu
												Ka.defence=Ka.mdefence
											else
												Ka.GainExp(Ka.mexp*2)
												var/catch2 = Ka.mexp*2
												Ka.GainMoney(30000)
												Ka.eventpoints+=5
												Ka.Level_Up()
												Ka<<"<b><font color=blue>You got [catch2] exp for participating!"
												Ka<<"<b><font color=blue>You got $30,000 for participating!"
												Ka<<"<b><font color=lime>You got 5 event points for participating!"
												Ka.Level_Up()
												Ka.attack=Ka.mattack
												Ka.reiatsu=Ka.mreiatsu
												Ka.defence=Ka.mdefence
										if(!shini&&!humans&&hollows&&!vaizs)
											world <<"<b><font color=lime>Everyone has been killed by Hollows!"
											if(Ka.hollow==1)
												Ka.GainExp(Ka.mexp*5)
												var/catch2 = Ka.mexp*5
												Ka.GainMoney(150000)
												Ka.eventpoints+=15
												Ka.donor_points+=3
												Ka.total_bought+=3
												Ka.Level_Up()
												Ka<<"<b><font color=blue>You got [catch2] exp!"
												Ka<<"<b><font color=blue>You got $150,000"
												Ka<<"<b><font color=lime>You got 15 event points"
												Ka.Level_Up()
												Ka.attack=Ka.mattack
												Ka.reiatsu=Ka.mreiatsu
												Ka.eventsWon++
												Ka.defence=Ka.mdefence
											else
												Ka.GainExp(Ka.mexp*2)
												var/catch2 = Ka.mexp*2
												Ka.GainMoney(30000)
												Ka.eventpoints+=5
												Ka.Level_Up()
												Ka<<"<b><font color=blue>You got [catch2] exp for participating!"
												Ka<<"<b><font color=blue>You got $30,000 for participating!"
												Ka<<"<b><font color=lime>You got 5 event points for participating!"
												Ka.Level_Up()
												Ka.attack=Ka.mattack
												Ka.reiatsu=Ka.mreiatsu
												Ka.defence=Ka.mdefence
										if(!shini&&!humans&&!hollows&&vaizs)
											world <<"<b><font color=lime>Everyone has been killed by Vaizards!"
											if(Ka.earth==1&&Ka.race=="Vaizard")
												Ka.GainExp(Ka.mexp*5)
												var/catch2 = Ka.mexp*5
												Ka.GainMoney(150000)
												Ka.eventpoints+=15
												Ka.donor_points+=3
												Ka.total_bought+=3
												Ka.Level_Up()
												Ka<<"<b><font color=blue>You got [catch2] exp!"
												Ka<<"<b><font color=blue>You got $150,000"
												Ka<<"<b><font color=lime>You got 15 event points"
												Ka.Level_Up()
												Ka.attack=Ka.mattack
												Ka.reiatsu=Ka.mreiatsu
												Ka.eventsWon++
												Ka.defence=Ka.mdefence
											else
												Ka.GainExp(Ka.mexp*2)
												var/catch2 = Ka.mexp*2
												Ka.GainMoney(30000)
												Ka.eventpoints+=5
												Ka.Level_Up()
												Ka<<"<b><font color=blue>You got [catch2] exp for participating!"
												Ka<<"<b><font color=blue>You got $30,000 for participating!"
												Ka<<"<b><font color=lime>You got 5 event points for participating!"
												Ka.Level_Up()
												Ka.attack=Ka.mattack
												Ka.reiatsu=Ka.mreiatsu
												Ka.defence=Ka.mdefence
										eventon=0
				src.beatshinis=0
				src.beatbyakuya=0
				src.hollowskilledingame=0
				src.time=0
				src.arelease=0
				src.ressurection=0
				src.volcano=0
				src.deathtouch=0
				src.ulqgotsword=0
				src.limitrelease=0
				src.segunda=0
				src.ceroback=0
				if(currentPlayerTest == src.key)
					src.Respawn()
					src.GiveDonorStats()
					world<<"<b><font color=red>[src] has failed the test for [currentRankTest], he only needed [testGoteiLeft] more kill(s) to go :("
					resetRankTest()
					src.GiveDonorStats()
				if(src.rudecomment)src.Talks("[M], you suck")
				if(M.z==5)
					M.Respawn()
					M.GiveDonorStats()
					M.aftereventbuffs()
				src.inbankai = 0
				src.inshikai = 0
				src.infull = 0
				src.inafull =0
				src.stolen=0
				src.seeleuse = 0
				src.finalb = 0
				src.bowon = 0
				src.rundelay = 2
				src.renjishikai = 0
				src.retract = 0
				src.controlbug = 0
				src.kirashi = 0
				src.renjibankai = 0
				src.hitsugayabankai = 0
				src.ikkakushikai = 0
				src.inoueshield = 0
				src.inberserk=0
				src.ikkakubankai = 0
				src.attack = src.mattack
				src.defence = src.mdefence
				src.reiatsu = src.mreiatsu
				src.icon_state = ""
				for(var/obj/byakublade/Ma in world)
					if(Ma.owner == src)
						del Ma
				src.hollowprotection = 1
				src.armon = 0
				src.dparmon=0
				walk(src,0)
				src.inran = 0
				src.rundelay = 2
				src.chadref = 0
				for(var/obj/K in world)
					if(K.owner == usr||K.Gowner == usr)
						del K
				for(var/mob/A in world)
					if(A.owner == src)
						del A
				src.ulqgotsword=0
				src.health = src.mhealth
				src.rei = src.mrei
				src.wound=0
				if(M.stype == "Zaraki")
					if(M.inshikai&&M.shikaidrain > 0)
						M.random = rand(1,10)
						if(M.random <= 8)
							M << "<b><font color = green>You have gotten better at maintaining your shikai!"
							M.shikaidrain -= 0.1
					if(M.inbankai&&M.bankaidrain > 0)
						M.random = rand(1,100)
						if(M.random <= 50)
							M << "<b><font color = green>You have gotten better at maintaining your bankai!"
							M.bankaidrain -= 0.1
				if(src.level<=150)
					world << "<b><font color = red>[M] has killed [src], who is below level 150!"
					M.expgain-=M.mexp*0.7
					M << "<b>You have defeated [src](noob)! You lost 70% experience!"
				else
					world << "<b><font color = red>[M] has killed [src]!"
				var/ranged=abs(src.level-M.level)
				if(ranged<=300&&M.level>150||M.level>1000)
					src.expgain=rand(src.level*80,src.level*110)
					if(M==src)src.expgain=0-src.expgain
					if(src.son)src.expgain=0
					/*if(M.client.address == src.client.address)src.expgain=0;M.exp-=6000000;M << "<b><font color = red>You just killed an alt and tried to abuse so you lost 6mil experience"
					if(src.client.address == M.client.address)src.exp-=6000000;usr << "<b><font color = red>You just killed an alt and tried to abuse so you lost 6mil experience"*/
					if(src.client&&M.client)
						if(src.client.address != M.client.address && M.playerEssence != src.key)
							if(prob(50))
								world << "<b><i><font color = purple>[M] has taken [src]'s Player Essence!</b>"
								M.playerEssence = src.key
								M.currentPlayerEssence++
					M.exp += src.expgain
					src.exp-=(src.exp*0.15)
					M << "<b>You have defeated [src]! You gained [src.expgain] experience!"
				M.Level_Up()
				M.skill()
				src.deaths += 1
				src.safe=0
				M.kills += 1
				if(src.deaths==50)
					AwardMedal("Lost Soul", src)
				if(src.GM&&M.beatgm==0&&M.client)
					M.beatgm=1
					world<<"<b><font color=lime>Medal Info: [M] has been awarded the 'Little Rebellion' for killing a GM"
					AwardMedal("Little Rebellion", M)
				if(M.GM&&src.beatbygm==0&&src.client)
					src.beatbygm=1
					world<<"<b><font color=lime>Medal Info: [src] has been awarded the 'Pimp Slapped' for getting killed by a GM"
					AwardMedal("Pimp Slapped", src)
				if(src.minutemade)
					M.minutemadekill+=1
					if(M.minutemadekill==10&&M.client)
						world<<"<b><font color=lime>Medal Info: [M] has been awarded the 'Dog of Authority' for killing 10 Minute-Made Assassins"
						AwardMedal("Dog of Authority", M)
				if(M.kills>=100&&M.minutemade==0&&M.client)
					M.minutemade=1
					world<<"<b><font color=lime>Medal Info: [M] has been awarded the 'Minute-Made Assassin' for killing 100 players"
					AwardMedal("Minute-Made Assassin", M)
				Kills_Ranking(M)
				if(copytext("[src.name]",1,2)=="{")
					src.loc = null
					spawn(src.spawntime*10)
					src.loc = src.oldspot

				src.tourny=0
				src.kenpachigotu=0
				src.Respawn()
				src.GiveDonorStats()
				src.Load_Overlays()
				src.aftereventbuffs()
				if(src.cpursuit==5)
					src.CArena()
					src.cpursuit=3
				if(src.teambattle==5)
					var/mob/x=src.partner
					x.partner=null
					src.partner=null
					src.CArena()
					src.teambattle=3
				if(gotcharge=="[src.name]")
					gotcharge=null
					world<<"<font color=lime><b>Labs have been restored due to [src] dying with the charge"
					if(portaltime==0)
						if(!src.diedwithcharge)
							src.diedwithcharge=1
							AwardMedal("Almost There... ", src)
					ResetLabs()
				gotthecharge=0
				src.incr=0
				if(M.legit&&!M.reigai&&!M.isfgt&&!M.npccaptain&&!M.npcespada&&!M.legit2)del M
				//if(src.tutorial==1)
				//	src.loc=locate(96,190,7)
mob/var
	legit2=0
	legit3=0

mob
	proc
		skill()
			if(!src.client)return
			if(src.Rebirthedpart2==1)src.curmis="Kill [src.newshikills]/100 shinigamis, [src.newfulkills]/100 fullbringers, [src.newholkills]/100 hollows, [src.newquikills]/100 quincies, [src.newsadkills]/100 sados, [src.newvaikills]/100 vaizards, [src.newvand]/100 vanders"
			if(src.Rebirthedpart2==1 && src.newshikills >= 100 && src.newfulkills >= 100 && src.newholkills >=100 && src.newquikills >= 100 && src.newsadkills>=100 && src.newvaikills >=100 && src.newvand >= 100)
				src.curpart="Rebirth Final Part"
				src.curmis="You have completed the rebirthing mission, speak with Rebirth man in the bar to rebirth"
				src.Rebirthedpart2=2
			if(src.race == "Sado")
				if(!src.gotbum)
					if(src.level >=100)
						src.gotbum=1
						src << "<b><font color = lime>Ability Info:You learned Arm 1!"
						src.contents+=new/obj/skillcard/Arm1
						src.contents+=new/obj/skillcard/Power_Blast
						src.contents+=new/obj/skillcard/Quake_Quake_Punch
						src <<"<b><font color = lime>Ability Info: You have learned the Sado's favourite technique, Quake Quake Punch!"
				if(src.gotbum==1)
					if(src.level >=200)
						src.gotbum=2
						src << "<b><font color = lime>Ability Info:You learned Bum Rush!"
						src.contents+=new/obj/skillcard/Bum_Rush
				if(src.level==300)
					src.storycom=30
				if(src.gotbum==3)
					if(src.level >=600)
						src.gotbum=4
						src << "<b><font color = lime>Ability Info:You have learned how to fully utulize your 4th arm!"
			if(src.level>=450&&src.storycom<=55/* && src.Rebirthed != 1*/)
				if(src.level==450)
					if(!src.gotstoryrw)
						src.Story_Talk("After meeting Shinji, and fighting the Rogue Vaizards you also long for Incredible power and the ability to be able to fight and kill your enemies without rules and chains holding you back. Your inner desire creates a deep hate for all the other races our forced to accept as allies, why should i have to obey them?? their inferior to my race!!!!! During this state of rage You must defeat 50 NPCS of each race, and Player kill 10 other players.")
						src.gotstoryrw=1
					src.newshikills=0
					src.newfulkills=0
					src.newholkills=0
					src.newquikills=0
					src.newsadkills=0
					src.newvaikills=0
				//	src.newpvpkills=0
				src.curpart="Part 6: The Race Wars"
				src.curmis="Kill [src.newshikills]/50 shinigamis, [src.newfulkills]/50 fullbringers, [src.newholkills]/50 hollows, [src.newquikills]/50 quincies, [src.newsadkills]/50 sados, [src.newvaikills]/50 vaizards"
				src.storycom=55
			if(src.race == "Hollow")
				if(src.gotHollowRage == 1)
					return
				if(src.level ==350)
					src << "<b><font color = lime>Ability Info: You have learned Hollow Rage!"
					src.contents+=new/obj/skillcard/HollowRage
					src.gotHollowRage=1
			if(src.race == "Quincy")
				if(!src.silver1)
					if(src.level >= 55)
						src.silver1 = 1
						src << "<b><font color = lime>Ability Info:You learned how to perform Haizen!"
						src.contents+=new/obj/skillcard/Haizen
				if(!src.silver2)
					if(src.level >= 220)
						src.silver2 = 1
						src << "<b><font color = lime>Ability Info:You learned how to perform Splitting Arrow!"
						src.contents+=new/obj/skillcard/Splitting_Arrow
				if(!src.silver3)
					if(src.level >= 300)
						src.silver3 = 1
						src << "<b><font color = lime>Ability Info:You learned how to perform Rapid Shot!"
						src.contents+=new/obj/skillcard/RapidShot
				if(src.chosebex==2)
					if(!src.gotruth)
						if(src.level>=850)
							src.contents+=new/obj/skillcard/Blut_Veine
							src.gotruth=1
			if(!src.gotsense)
				if(src.level>=100)
					src.gotsense=1
					src.contents+=new/obj/skillcard/Sense
					src.contents+=new/obj/skillcard/Hide_Presence
			if(src.race == "Hollow")
				if(src.level >= 120&&src.hollowtype == "Normal")
					src.overlays = 0
					src.icon = 'BlankBase.dmi'
					src.hollowtype = "strong"
					src.overlays += /obj/nstrong1
					src.overlays += /obj/nstrong2
					src.overlays += /obj/nstrong3
					src.overlays += /obj/nstrong4
					src.Affirm_Icon()
					//src.overlays += /obj/strong5
					src.rank = "Strong Hollow"
					world << "<b><font color = lime>Ability Info: [src] has transformed into a Strong Hollow!"
					src << "<b><font color = lime>Ability Info: You can now send a menacing roar towards your opponents!"
					src.contents+=new/obj/skillcard/Roar
					src << "<b>Your health got boosted by 1000!"
					src.mhealth += 1000
					src << "<b>Your reiatsu got boosted by 100!"
					src.mrei += 100
					src << "<b>Your attack got boosted by 130!"
					src.mattack += 130
					src.rawbuff+=130
					src << "<b>Your defence got boosted by 130!"
					src.mdefence += 130
					src << "<b>Your reiatsu power got boosted by 130!"
					src.mreiatsu += 130
					src.attack+=130
					src.defence+=130
					src.reiatsu+=130
					src.wasstrong=1
				if(src.level >= 220&&src.hollowtype == "strong")
					src.overlays = 0
					src.icon='Icons/BlankBase.dmi'
					src.hollowtype="meno"
					src.overlays += /obj/Menos/m1
					src.overlays += /obj/Menos/m2
					src.overlays += /obj/Menos/m3
					src.overlays += /obj/Menos/m4
					src.overlays += /obj/Menos/m5
					src.overlays += /obj/Menos/m6
					src.overlays += /obj/Menos/m7
					src.overlays += /obj/Menos/m8
					src.rank = "Meno Grande"
					world << "<b><font color = lime>Ability Info: [src] has transformed into a Menos Grande!"
					src << "<b>Your health got boosted by 1000!"
					src.mhealth += 1000
					src << "<b>Your rei got boosted by 100!"
					src.mrei += 100
					src << "<b>Your attack got boosted by 200!"
					src.mattack += 200
					src << "<b>Your defence got boosted by 200!"
					src.mdefence += 200
					src << "<b>Your reiatsu power got boosted by 200!"
					src.mreiatsu += 200
					src.rawbuff+=200
					src.attack+=200
					src.defence+=200
					src.reiatsu+=200
					src.wasmenos=1
				if(src.level >= 300&&src.hollowtype == "meno")
					src.hollowtype = "adjucha"
					src.rank = "Adjucha"
					world << "<b><font color = lime>Ability Info: [src] has transformed into an Adjuchas!"
					src << "<b>Your health increased by 500!"
					src.mhealth += 500
					src << "<b>Your rei increased by 1000!"
					src.mrei += 1000
					src << "<b>Your attack increased by 600!"
					src.mattack += 600
					src.rawbuff+=600
					src << "<b>Your defence increased by 600!"
					src.mdefence += 600
					src << "<b>Your reiatsu increased by 600!"
					src.mreiatsu += 600
					src.attack+=600
					src.defence+=600
					src.adjhollowtype=rand(1,3)
					src.reiatsu+=600
					src.wasadjucha=1
					spawn(10)
						if(src.adjhollowtype==1)
							src.contents+=new/obj/skillcard/AdjWolf
							src<<"<b><font color=lime>Abilitiy Info:You've learned how to summon wolves using your reiatsu!"
						if(src.adjhollowtype==2)
							src.contents+=new/obj/skillcard/Pushadj
							src.contents+=new/obj/skillcard/Windadj
							src << "<b><font color = lime>Ability Info:You've learned Push!"
							src << "<b><font color = lime>Ability Info:You've learned Tornadoe!"
						if(src.adjhollowtype==3)
							src.contents +=new/obj/skillcard/Desgadj
							src << "<b><font color = lime>Ability Info:You learned Paw Slash!"
							src << "<b><font color = lime>Ability Info:You learned Bum Rush!"
							src.contents+=new/obj/skillcard/Bum_Rush
					if(!src.gotflash)
						src.gotflash = 1
						world << "<b><font color = lime>Ability Info: [src] has learned Sonido!"
						src.contents+=new/obj/skillcard/Flash_Step
					spawn(12)
						src.Load_Overlays()
						src.Affirm_Icon()
				if(src.level >= 500&&src.hollowtype == "adjucha")
					src.rank = "Vasto Lorde"
					src.hollowtype = "vasto"
					src << "<b><font color = lime>Ability Info: You have learned Segunda Ress!"
					src.contents+=new/obj/skillcard/Segunda_Ress
					world << "<b><font color = lime>Ability Info: [src] has transformed into a Vasto Lorde!"
					src << "<b>Your health got boosted by 25000!"
					src.mhealth += 25000
					src.mattack+=1500
					src.mdefence+=1500
					src.mreiatsu+=1500
					src.attack+=1500
					src.defence+=1500
					src.reiatsu+=1500
					src.rawbuff+=1500
					src << "<b>Your Attack increased by 1500!"
					src << "<b>Your Defence increased by 1500!"
					src << "<b>Your Reiatsu increased by 1500!"
					src << "<b>Your rei got boosted by 1500!"
					src.mrei += 1500
					src.wasvasto=1
					src.Load_Overlays()
					src.Affirm_Icon()

			if(src.race != "Hollow")
				if(src.level >= 45)
					if(!src.gotflash)
						src.contents+=new/obj/skillcard/Flash_Step
						if(src.race == "Shinigami"||src.race == "Vaizard"||src.race == "Bounto")
							world << "<b><font color = lime>Ability Info: [src] has learned Shunpo!"
							src.gotflash=1
						if(src.race == "Arrancar"||src.race == "Sado")
							src.gotflash = 1
							world << "<b><font color = lime>Ability Info: [src] has learned Sonido!"
						if(src.race == "Fullbringer")
							src.gotflash = 1
							world << "<b><font color = lime>Ability Info: [src] has learned Bringer Light!"
						if(src.race == "Quincy"||src.race == "Inoue")
							src.gotflash = 1
							world << "<b><font color = lime>Ability Info: [src] has learned Hirenhyaku!"
			if(src.race != "Hollow")
				if(src.level >= 250)
					if(src.gotflash!=2&&src.gotflash==1)
						src.contents+=new/obj/skillcard/Spiritual_Pressure
						world << "<b><font color = lime>Ability Info: [src] has learned Spiritual Pressure!"
						src.gotflash=2
			if(src.race == "Quincy")
				if(!src.gotsanrei)
					if(src.level >= 100)
						src.gotsanrei = 1
						src.contents+=new/obj/items/equipable/Weapon/Sanrei
						world << "<b><font color = lime>Ability Info: Quincy [src] has attained the Sanrei Glove and will be much more powerful while it's equipped!"
				if(!src.gotfinal2)
					if(src.level >= 400)
						src.gotfinal2 = 1
						world << "<b><font color = lime>Ability Info: Quincy [src] has learned the ability to go into his Final Form Type Two!"
			if(src.race == "Fullbringer")
				if(src.full == 0)
					if(src.level >= 150)
						if(src.beatkenpachi==0)
							src.Story_Talk("Talk to Ginjo in the bar to fight him and get Fullbring")
							return
						src<<"<b><font color = lime>Ability Info:You have [src.ftype]'s Fullbring"
						var/sdgs = input(src,"Please select a name for your Item.") as text
						src.swordname=sdgs
						if(length(sdgs) >= 500)
							src.swordname="too long"
						src.contents+=new/obj/skillcard/Fullbring
						src.full = 1
						world << "<b><font color = lime>Ability Info: [src] has learned his Fullbring and calls it [src.swordname]!"
						src.curpart="Part 4: Unlocking the potential within!"
						src.curmis="Continue training to level 300"
						src.storycom=30
				if(!src.gotafull)
					if(src.level>=400)
						world << "<b><font color = lime>Ability Info: [src] has awakened his Fullbring and can now fully upgrade it by talking to Tsukishima!"
						src.gotafull=1
				if(src.gotafull==1)
					if(src.level>600)
						src.gotafull=2
						world << "<b><font color = lime>Ability Info: [src] can expand his power through Power Transfer"
						src.contents|=new/obj/skillcard/Power_Transfer
				if(!src.gotfinalfb)
					if(src.level>=750)
						src.gotfinalfb=1
						world << "<b><font color = lime>Ability Info: [src] can learn Finalbring by talking to Ginjo"
			if(src.race == "Shinigami"||src.race == "Vaizard")
				if(src.shikai == 0)
					if(src.level >= 150)
						if(src.beatkenpachi==0)
							return
						if(src.stype=="Kido Class")
							src.shikai = 1
							src.contents+=new/obj/skillcard/Sai
							src<<"<b><font color = lime>Ability Info:You have learned Sai"
						if(src.stype!="Kido Class")
							src<<"<b><font color = lime>Ability Info:You have [src.stype]'s Zanpaktou"
					/*		var/sdgs = input(src,"Please select a name for your Zanpakuto.") as text
							src.swordname=sdgs
							if(length(sdgs) >= 500)
								src.swordname="too long"
							var/sdgss = input(src,"Please select a call for your Zanpakuto.") as text
							src.swordcall=sdgss
							if(length(sdgss) >= 500)
								src.swordcall="too long"*/
							src.SwordCallfix()
							src.contents+=new/obj/skillcard/shikai
							src.shikai = 1
							world << "<b><font color = lime>Ability Info: [src] has learned his Shikai and learned his sword's name, [src.swordname]!"
							if(src.stype == "Ichigo")
								src.contents+=new/obj/skillcard/Getsuga_Tenshou
							if(src.stype == "Urahara")
								src.contents+=new/obj/skillcard/Nake
							if(src.stype == "Hinamori")
								src.contents+=new/obj/skillcard/Scatter_Shot
							if(src.stype == "Unohana")
								src.contents+=new/obj/skillcard/Regeneration_Mode
							if(src.stype == "Tousen")
								src.contents+=new/obj/skillcard/Benihikou
							if(src.stype == "Zaraki")
								src.contents+=new/obj/skillcard/Berserk
							if(src.stype == "Yumichika")
								src.contents+=new/obj/skillcard/Cyclone_Slash
							if(src.stype == "Rukia")
								src.contents+=new/obj/skillcard/Hakuren
							if(src.stype == "Hitsugaya")
								src.contents+=new/obj/skillcard/Shoot_Dragon
								src.contents+=new/obj/skillcard/Frozen_Heavens
							if(src.stype == "Kaiens")
								src.contents+=new/obj/skillcard/Wave
							if(src.stype == "Hisagi")
								src.contents+=new/obj/skillcard/Reap
							if(src.stype == "Ichimaru")
								src.contents+=new/obj/skillcard/Stretch
							if(src.stype == "Aizen")
								src.contents+=new/obj/skillcard/Restep
							if(src.stype == "Ikkaku")
								src.contents+=new/obj/skillcard/Extend
							if(src.stype == "Muramasa")
								src.contents+=new/obj/skillcard/Boost_Negation
							if(src.stype == "Ukitake")
								src.contents+=new/obj/skillcard/Raikouhou
							if(src.stype == "Yammamoto")
								src.contents+=new/obj/skillcard/Shoen
							if(src.stype == "Shonshui")
								src.contents+=new/obj/skillcard/Shadow
							if(src.stype == "Kensei")
								src.contents+=new/obj/skillcard/Air_Bullet
						if(src.storycom<=30)
							if(src.stype=="Kido Class")
								src.Story_Talk("You have now obtained your first Class Kido after surviving an almost impossible battle with the deadly Zaraki Kenpachi. Along this path you've chosen you are starting to realize Shinigami's are sort of like the police of the undead, but will you choose to follow this traditional path or will your desire for power guide you to a whole new set of allies.")
							else
								src.Story_Talk("You have now obtained Shikai after surviving an almost impossible battle with the deadly Zaraki Kenpachi. Now that you are able to hear the call of your chosen Zanpaktou you must now become one with it by mastering it, and learning its name. Along this path you've chosen you are starting to realize Shinigami's are sort of like the police of the undead, but will you choose to follow this traditional path or will your desire for power guide you to a whole new set of allies.")
							src.curpart="Part 4: Unlocking the potential within!"
							src.curmis="You must train to level 300"
							src.storycom=30
				if(src.bankai == 0)
					if(src.level >= 400)
						src.bankai = 1
						if(src.stype=="Kido Class")
							world << "<b><font color = lime>Ability Info: [src] can learn a new kido by talking to Yoruichi!"
						else
							world << "<b><font color = lime>Ability Info: [src] can learn his Bankai by talking to Yoruichi!"
			if(src.race == "Shinigami")
				if(src.level>=700)
					if(!src.gotfgt)
						src.gotfgt=1
						if(src.stype!="Kido Class")
							world << "<b><font color = lime>Ability Info: [src] can learn his Final Bankai Form by finding Final GetsugaTenshou Ichigo!"
				if(!src.gotlimitrelease)
					if(src.stype=="Kido Class"&&src.level>=800||src.level>=800&&src.status=="<font color = #FF5600>Captain</font>"||src.level>=850&&src.status=="Lieutenant"||src.level>=900)
						src.gotlimitrelease=1
						world << "<b><font color = lime>Ability Info: [src] can now unleash full power"
						src.contents+=new/obj/skillcard/Limit_Release
			if(src.stype=="Kido Class")
				if(src.level>=200&&src.gotkido==0)
					world << "<b><font color = lime>Ability Info: [src] has learned Shakkahou"
					src.contents+=new/obj/skillcard/Shakkahou
					src.gotkido=1
				if(src.level>=300&&src.gotkido==1)
					world << "<b><font color = lime>Ability Info: [src] has learned Shitotsu Sansen"
					src.contents+=new/obj/skillcard/Shitotsu_Sansen
					src.gotkido=2
				if(src.level>=500&&src.gotkido==2)
					world << "<b><font color = lime>Ability Info: [src] has learned Jomon"
					src.contents+=new/obj/skillcard/Jomon
					src.gotkido=3
				if(src.level>=600&&src.gotkido==3)
					world << "<b><font color = lime>Ability Info: [src] has learned Raihou"
					src.contents+=new/obj/skillcard/Raihou
					src.gotkido=4
				if(src.level>=700&&src.gotkido==4)
					world << "<b><font color = lime>Ability Info: [src] has learned Itto Kasu"
					src.contents+=new/obj/skillcard/Itto_Kasu
					src.gotkido=5
			if(src.maskuses >200&&!src.gotvasto&&src.canvasto)
				if(src.level >= 700)
					src.gotvasto = 1
					world << "<b><font color = lime>Ability Info: [src] can learn how to fully unleash his inner hollow by talking to Shinji!"
			if(src.race=="Vaizard")
				if(!src.gotscreech)
					if(src.level>=750)
						src.contents+=new/obj/skillcard/Hollow_Screech
						src.gotscreech=1
				if(!src.gotruth)
					if(src.level>=850)
						src.contents+=new/obj/skillcard/Ruthlessness
						src.gotruth=1
			if(src.race == "Arrancar")
				if(src.shikai == 0)
					if(src.level >= 350)
						src<<"<b><font color = lime>Ability Info: You have [ressurectiontype]'s Ressurection"
						var/sdgs = input(src,"Please select a name for your Zanpakuto.") as text
						src.swordname=sdgs
						var/sdgss = input(src,"Please select a call for your Zanpakuto.") as text
						src.swordcall=sdgss
						src.shikai = 1
						world << "<b><font color = lime>Ability Info: [src] has learned Ressurection!"
						src.contents+=new/obj/skillcard/Ressurection
				if(src.level>=600)
					if(!src.gotaizen)
						src.gotaizen=1
						world << "<b><font color = lime>Ability Info: [src] can improve their Releasing/Regenerative capabilities by finding Hougyoku Aizen!"
				if(src.level>=800)
					if(!gotneg)
						gotneg=1
						world << "<b><font color = lime>Ability Info: [src] has learned to use Negacion"
						src.contents+=new/obj/skillcard/Negacion
			if(src.guildname)
				if(!src.petmsg)
					if(src.guildpoints>=15)
						src<<"<b><font color = lime>Ability Info:You have enough Guild Points to start befriending NPCs of your own kind by talking to them"
						src.petmsg=1
				if(!src.gotorgcloak)
					if(src.guildpoints>=30)
						src<<"<b><font color = lime>Ability Info:You have enough Guild Points to equip the Organization Cloak"
						src.contents+=new/obj/items/equipable/Overshirt/Organization_XIII
						src.gotorgcloak=1
				if(src.guildpassive>=1&&src.guildpassiveboost==0)
					src.rundelay=rundelay/2
					src.guildpassiveboost=1
world/proc
	AutoRepop()
		set background=1
		world.Repop()
		spawn(600)
			world.AutoRepop()
world
	proc
		ShunDrain()
			set background =1
			vara
				for(var/mob/M in world)
					if(M.shunko&&M.client)
						var/f=rand(1,15)
						if(f==15)
							if(M.shundrain>1)
								M.shundrain-=1
								M<<"<b><font color = green>You have gotten better at maintaining Shunko!"
						M.wound += M.shundrain
						if(M.squad==2)
							var/t=rand(1,2)
							if(t==1)
								M.wound-=1
						if(M.wound>=200)
							M.shunko=0
							M<<"<b><font color = green>You have exhausted your Shunko!"
							M.Load_Overlays()
				spawn(20)
				goto vara
		tShunDrain()
			set background =1
			vara
				for(var/mob/M in world)
					if(M.tshunko&&M.client)
						M.wound += 0.25
						if(M.wound>=200)
							M.tshunko=0
							M.tshunkoed=0
							M<<"<b><font color = green>You have exhausted your Shunko!"
							M.Load_Overlays()
				spawn(20)
				goto vara
		AFK_Checker()
			set background=1
			vara
				for(var/mob/M in world)
					if(!M.key in specialverbs)
						if(M.client)
							if(M.client.inactivity/10>=1800)
								world<<output("<b>[M] was booted with [round(M.client.inactivity/600)] minutes since last command!","output")
								del M.client
				spawn(20)
				goto vara
		ADrain()
			set background =1
			vara
				for(var/mob/M in world)
					if(M.arelease&&M.client)
						var/f=rand(1,20)
						if(f==20)
							if(M.adrain>0)
								M.adrain-=1
								M<<"<b><font color = green>You have gotten better at maintaining your Arrancar Releasing powers!"
						M.wound += M.adrain
						if(M.wound>=200)
							M.attack=M.mattack
							M.defence=M.mdefence
							M.reiatsu=M.mreiatsu
							M.arelease=0
							M.ressurection=0
							M.segunda=0
							M.volcano=0
							M.deathtouch=0
							M.ulqgotsword=0
							M.ceroback=0
							M.Load_Overlays()
				spawn(20)
				goto vara
		MaskDrain()
			set background =1
			vara
				for(var/mob/M in world)
					if(M.maskon&&M.client)
						M.rei -= (M.mrei/M.maskuses)*2//2
						if(M.vasto)M.rei -= (M.mrei/M.maskuses)*18//18
						if(M.rei<=0)
							M.rei=0
							M.arm=0
							M.leg=0
							M.core=0
							M.maskon=0
							M.vasto=0
							M.hardhitted=0
							M.rundelay=2
							M.attack=M.mattack
							M.defence=M.mdefence
							M.reiatsu=M.mreiatsu
							M.Load_Overlays()
							M.Affirm_Icon()
				spawn(20)
				goto vara
		LimitDrain()
			set background =1
			vara
				for(var/mob/player/M in world)
					if(M.limitrelease&&M.client)
						M.rei -= (M.mrei/M.lreleaseuses)*6
						if(M.rei<=0)
							M.rei=0
							M.limitrelease=0
							M.StartShikCool()
							if(M.charging)
								M.charging=0
								M.reiatsu-=round(round(M.mreiatsu/50)*M.charge)
								M.attack-=round(round(M.mattack/50)*M.charge)
							//	M.defence-=round(round(M.mdefence/50)*M.charge)
								M.charge=0
							M.limitrelease=0
							M.maskon=0
							M.trans=0
							M.arm=0
							M.hardhitted=0
							M.leg=0
							M.core=0
							M.inbankai = 0
							M.hs=0
							M.inberserk=0
							M.controlbug = 0
							M.firing = 0
							M.zabitimes = 0
							M.hitsugayabankai = 0
							M.kommamarubankai = 0
							M.ikkakubankai = 0
							M.reiatsu = M.mreiatsu
							M.attack = M.mattack
							M.renjibankai = 0
							M.rundelay = 2
							for(var/obj/byakublade/Ma in world)
								if(Ma.owner == M)
									del Ma
							for(var/obj/Fire/f in world)
								if(f.Gowner==M)
									del f
							M.senkei = 0
							M.defence = M.mdefence
							if(M.beerboost)
								M.attack+=round(M.mattack/2)
								M.defence+=round(M.mdefence/2)
								M.reiatsu+=round(M.mreiatsu/2)
							walk(M,0)
							for(var/mob/zabimaru/Ma in view(10,M))
								if(Ma.owner == M)
									del Ma
							for(var/obj/zabtrail/k in view(10,M))
								if(k.owner == M)
									del k
							M.tensat=0
							M.Load_Overlays()
				spawn(20)
				goto vara
		bootboosts()
			set background =1
			vara
				for(var/mob/M in world)
					if(M.infull&&M.client)
						if(M.ftype=="Jackie")
							var/s=M.bootboost
							M.bootboost=M.wound
							M.bootboost-=s
							M.attack+=M.bootboost*(M.mattack/75)
							if(M.kicks>=150&&M.infull)
								M.attack+=round(M.bootboost*(M.mattack/75))/2
							M.bootboost=M.wound
					if(M.inafull&&M.client)
						if(M.ftype=="Jackie")
							var/s=M.bootboost
							M.bootboost=M.wound*1.5
							M.bootboost-=s
							M.attack+=M.bootboost*(M.mattack/50)
							if(M.kicks>=150&&M.inafull)
								M.attack+=M.bootboost*(M.mattack/50)
							M.bootboost=M.wound*1.5
							if(M.attack >=150000)
								M.attack=150000
				spawn(20)
				goto vara
		shiban()
			set background = 1
			vara
				for(var/mob/M in world)
					if(M.race == "Arrancar")
						if(M.ressurectiontype != ""&&M.ressurection)
							if(M.ressdrain > 0&&M.client)
								M.rei -= round(((M.mrei * M.ressdrain) / 100))
								if(M.rei <= 0)
									M.rei = 0
									M.hs=0
									M << "<b>You have ran out of reiatsu energy to maintain your Ressurection!"
									M.arm=0
									M.hardhitted=0
									M.leg=0
									M.core=0
									M.swordon=1
									M.ressurection=0
									for(var/mob/x1 in M.clones)
										del x1
									M.volcano=0
									M.deathtouch=0
									M.ulqgotsword=0
									M.segunda=0
									M.big=0
									M.ceroback=0
									M.layer=4
									M.attack=M.mattack
									M.defence=M.mdefence
									M.reiatsu=M.mreiatsu
									if(M.beerboost)
										M.attack+=round(M.mattack/2)
										M.defence+=round(M.mdefence/2)
										M.reiatsu+=round(M.mreiatsu/2)
									M.Load_Overlays()
					if(M.race == "Shinigami"||M.race == "Vaizard")
						if(M.stype != ""&&M.inshikai)
							if(M.shikaidrain > 0&&M.client)
								M.rei -= round(((M.mrei * M.shikaidrain) / 300))
								if(M.rei <= 0)
									M.rei = 0
									M.hs=0
									M << "<b>You have ran out of rei to maintain your Shikai!"
									M.inshikai = 0
									if(M.materialized)
										for(var/mob/Ma in world)
											if(Ma.ismura)
												if(Ma.owner==M)
													del Ma
													M.materializedcool=1
													M.materialized=0
													M.Start_Zan_Restore()
									M.attack = M.mattack
									M.defence = M.mdefence
									M.hardhitted=0
									M.ikkakushikai = 0
									M.renjishikai = 0
									M.rundelay = 2
									M.Load_Overlays()
									for(var/obj/pedals/A in world)
										if(A.Gowner == M)
											del A
									for(var/mob/shuriken/A in world)
										if(A.owner == M)
											del A
									M.controlbug = 0
						if(M.hs)
							M.rei -= 0
							if(M.key=="Fatboy12")
								M.rei += round(M.mrei/15)
							if(M.rei <= 0)
								M.hs=0
								M.Load_Overlays()
								M.rei=0
								M << "<b>You ran out of rei to maintain the Homing Ability!"
						if(M.inbankai)
							if(M.stype=="Ikkaku")
								M.rage-=0.5
								M.RageCheck()
							if(M.bankaidrain > 0&&M.client)
								M.rei -= round(((M.mrei * M.bankaidrain) / 200))
								if(M.bankaidrain==0)
									M.rei -= round(((M.rei *2)/100))
								if(M.rei <= 0)
									if(M.materialized)
										for(var/mob/Ma in world)
											if(Ma.ismura)
												if(Ma.owner==M)
													del Ma
													M.materializedcool=1
													M.materialized=0
													M.Start_Zan_Restore()
									M.inbankai = 0
									M.rei = 0
									M << "<b>You ran out of rei to maintain your Bankai!"
									for(var/obj/pedals/A in world)
										if(A.Gowner == M)
											del A
									for(var/mob/shuriken/A in world)
										if(A.owner == M)
											del A
									M.controlbug = 0
									M.hs=0
									M.hardhitted=0
									M.inberserk=0
									M.firing = 0
									M.zabitimes = 0
									M.hitsugayabankai = 0
									M.ikkakubankai = 0
									M.underlays = 0
									M.attack = M.mattack
									M.renjibankai = 0
									M.rundelay = 2
									M.defence = M.mdefence
									M.renjishikai = 0
									walk(M,0)
									M.Load_Overlays()
									for(var/mob/zabimaru/A in world)
										if(A.owner == M)
											del A
				spawn(20)
				goto vara

mob
 var
		shikaidrain = 10
		bankaidrain = 15
//mob
//	proc
//		bootboostcheck()
//			if(src.bootboost>150)
//				src.bootboost = 150
//				spawn(50)
//				src.bootboostcheck()
//			if(src.wound>200&&src.bootboost>150)
//				src.bootboost=150
//				spawn(50)
//				src.bootboostcheck()
mob
	proc
		saveproc()
			if(src.cansave)
				if(src.contents.len>=1)
					var/keys=src.key
					var/savefile/save
					save = new("playerswwa/[keys]/[src.name]")
					save["mob"] << src
					save["x"] << src.x
					save["y"] << src.y
					save["z"] << src.z
					save["type"] << src.type
					Write(save)
proc
	Quake_Effect(mob/M,duration,strength=1)
		if(!M.client)return
		spawn(1)
			var/x
			for(x=0;x<duration,x++)
				if(M)
					M.client.eye = get_steps(M,pick(NORTH,SOUTH,EAST,WEST),strength)
					sleep(1)
			M.client.eye=M
proc/get_steps(atom/ref,dir,num)
	var/x
	var/turf/T=ref:loc
	if(isturf(ref))
		T=ref
	for(x=0;x<num;x++)
		ref=get_step(ref,dir)
		if(!ref)break
		T=ref
	return T
mob
	proc
		shatter(mob/M)
			spawn(25)
			if(src)
				src.overlays -= /obj/icicle2
				src.overlays -= /obj/icicle
				var/obj/iceshard/Q = new/obj/iceshard(src.loc)
				var/obj/iceshard/W = new/obj/iceshard(src.loc)
				var/obj/iceshard/E = new/obj/iceshard(src.loc)
				var/obj/iceshard/R = new/obj/iceshard(src.loc)
				var/obj/iceshard/T = new/obj/iceshard(src.loc)
				var/obj/iceshard/Y = new/obj/iceshard(src.loc)
				var/obj/iceshard/U = new/obj/iceshard(src.loc)
				var/obj/iceshard/I = new/obj/iceshard(src.loc)
				walk(Q,EAST)
				walk(W,SOUTHEAST)
				walk(E,SOUTH)
				walk(R,SOUTHWEST)
				walk(T,WEST)
				walk(Y,NORTHWEST)
				walk(U,NORTH)
				walk(I,NORTHEAST)
				src.frozen = 0
				src.canattack = 1
				src.firing = 0
				var/damage = round(M.reiatsu * 2.5 - src.defence / 2)
				if(src.marksman>=1)
					damage+=level*11
				if(damage < 1)damage=1
				src.Death(M,damage,rand(0,6))
mob
	proc
		DarkShatter(mob/M)
			spawn(35)
			if(src)
				src.overlays -= /obj/BlackFlame
				var/obj/darkshard/Q = new/obj/darkshard(src.loc)
				var/obj/darkshard/W = new/obj/darkshard(src.loc)
				var/obj/darkshard/E = new/obj/darkshard(src.loc)
				var/obj/darkshard/R = new/obj/darkshard(src.loc)
				var/obj/darkshard/T = new/obj/darkshard(src.loc)
				var/obj/darkshard/Y = new/obj/darkshard(src.loc)
				var/obj/darkshard/U = new/obj/darkshard(src.loc)
				var/obj/darkshard/I = new/obj/darkshard(src.loc)
				walk(Q,EAST)
				walk(W,SOUTHEAST)
				walk(E,SOUTH)
				walk(R,SOUTHWEST)
				walk(T,WEST)
				walk(Y,NORTHWEST)
				walk(U,NORTH)
				walk(I,NORTHEAST)
				src.frozen = 0
				src.canattack = 1
				src.firing = 0
				var/damage = round(M.reiatsu * 2 - src.defence / 2)
				if(src.marksman>=1)
					damage+=level*11
				if(damage < 1)damage=1
				src.Death(M,damage,rand(0,5))
		shatter2(mob/M)
			spawn(35)
			if(src)
				src.overlays -= /obj/icicle2
				src.overlays -= /obj/icicle
				var/obj/iceshard/Q = new/obj/iceshard(src.loc)
				var/obj/iceshard/W = new/obj/iceshard(src.loc)
				var/obj/iceshard/E = new/obj/iceshard(src.loc)
				var/obj/iceshard/R = new/obj/iceshard(src.loc)
				var/obj/iceshard/T = new/obj/iceshard(src.loc)
				var/obj/iceshard/Y = new/obj/iceshard(src.loc)
				var/obj/iceshard/U = new/obj/iceshard(src.loc)
				var/obj/iceshard/I = new/obj/iceshard(src.loc)
				walk(Q,EAST)
				walk(W,SOUTHEAST)
				walk(E,SOUTH)
				walk(R,SOUTHWEST)
				walk(T,WEST)
				walk(Y,NORTHWEST)
				walk(U,NORTH)
				walk(I,NORTHEAST)
				src.frozen = 0
				src.canattack = 1
				src.firing = 0
				var/damage = round(M.reiatsu * 2 - src.defence / 2)
				if(src.marksman>=1)
					damage+=level*11
				if(damage < 1)damage=1
				src.Death(M,damage,rand(0,5))
		blackFlame()
			set background=1
			if(src.encircle)
				if(!src.npccaptain)
					for(var/mob/M in oview(src))
						var/damage=src.reiatsu*2
					//	view(src,8) << "<b><font color = purple>[src] burned [M]"
						if(!M.protected)
							spawn()M.Death(src,damage,rand(0,1))
				if(src.npccaptain&&!src.pet)
					for(var/mob/player/M in world)
						if(M.lost)
							var/damage=src.reiatsu/2
					//		view(src,8) << "<b><font color = purple>[src] burned [M]"
							if(!M.protected)
								spawn()M.Death(src,damage,rand(0,1))
				if(!src.pet)
					src.rei-=src.mrei/30
				if(src.rei<=0)
					src.encircle=0
					for(var/obj/Fire/f in world) //gota change
						if(f.Gowner==src)
							del f
				sleep(10)
				src.blackFlame()
		purpleFlame()
			set background=1
			if(src.encircle)
				if(!src.npccaptain)
					for(var/mob/M in oview(src))
						var/damage=src.reiatsu*2
					//	view(src,8) << "<b><font color = purple>[src] burned [M]"
						if(!M.protected && !M.inindeath)
							spawn()M.Death(src,damage,rand(0,1))
						if(M.inindeath) spawn()M.Death(src,0,0)
				if(src.npccaptain&&!src.pet)
					for(var/mob/player/M in world)
						if(M.lost)
							var/damage=src.reiatsu/2
						//	view(src,8) << "<b><font color = purple>[src] burned [M]"
							if(!M.protected && !M.inindeath)
								spawn()M.Death(src,damage,rand(0,1))
							if(M.inindeath) spawn()M.Death(src,0,0)
				//if(!src.pet)
				//	src.rei-=src.mrei/30
				if(src.rei<=0)
					src.encircle=0
					for(var/obj/Fire/f in world) //gota change
						if(f.Gowner==src)
							del f
				sleep(10)
				src.purpleFlame()
		thromFlame()
			set background=1
			if(src.encircle)
				if(!src.npccaptain)
					for(var/mob/M in oview(src))
						var/damage=src.attack*10
					//	view(src,8) << "<b><font color = purple>[src] burned [M]"
						if(!M.protected && !M.inindeath)
							spawn()M.Death(src,damage,rand(20,100))
						if(M.inindeath) spawn()M.Death(src,20,100)
				if(src.npccaptain&&!src.pet)
					for(var/mob/player/M in world)
						if(M.lost)
							var/damage=src.attack/2
						//	view(src,8) << "<b><font color = purple>[src] burned [M]"
							if(!M.protected && !M.inindeath)
								spawn()M.Death(src,damage,rand(0,1))
							if(M.inindeath) spawn()M.Death(src,0,0)
				//if(!src.pet)
				//	src.rei-=src.mrei/30
				if(src.rei<=0)
					src.encircle=0
					for(var/obj/Fire/f in world) //gota change
						if(f.Gowner==src)
							del f
				sleep(10)
				src.thromFlame()
		Flame()
			set background=1
			if(src.encircle)
				if(!src.npccaptain)
					for(var/mob/M in oview(src))
						var/damage=src.reiatsu*1.2
					//	view(src,8) << "<b><font color = red>[src] burned [M]"
						if(!M.protected)
							spawn()M.Death(src,damage,rand(0,1))
				if(src.npccaptain&&!src.pet)
					for(var/mob/player/M in world)
						if(M.lost)
							var/damage=src.reiatsu/2
						//	view(src,8) << "<b><font color = red>[src] burned [M]"
							if(!M.protected)
								spawn()M.Death(src,damage,rand(0,1))
				if(!src.pet)
					src.rei-=src.mrei/30
				if(src.rei<=0)
					src.encircle=0
					for(var/obj/Fire/f in world)
						if(f.Gowner==src)
							del f
				if(src.inshikai)
					src.shimastery(1)
				if(src.inbankai)
					src.banmastery(1)
				sleep(10)
				if(src.inbankai||src.key=="Zarama Nograd" || src.key=="Awesome93")
					src.Flame()
		Cremate(mob/M)
			var/damage=src.reiatsu
			var/ox=M.x
			var/oy=M.y
			var/oz=M.z
			M.rundelay+=5
			if(!M.protected&&M.x==ox&&M.y==oy&&M.z==oz)
				view(src,8) << "<b><font color = red>[src] is being cremating [M]!"
				spawn()M.Death(src,damage,3)
			sleep(5)
			if(M.rundelay>=3)M.rundelay-=5
			if(!M.protected&&M.x==ox&&M.y==oy&&M.z==oz)
				view(src,8) << "<b><font color = red>[src] is being cremating [M]!"
				spawn()M.Death(src,damage,3)
			sleep(5)
			if(!M.protected&&M.x==ox&&M.y==oy&&M.z==oz)
				view(src,8) << "<b><font color = red>[src] is being cremating [M]!"
				spawn()M.Death(src,damage,3)
			sleep(5)
			if(!M.protected&&M.x==ox&&M.y==oy&&M.z==oz)
				view(src,8) << "<b><font color = red>[src] is being cremating [M]!"
				spawn()M.Death(src,damage,3)
			sleep(5)
			if(!M.protected&&M.x==ox&&M.y==oy&&M.z==oz)
				view(src,8) << "<b><font color = red>[src] is being cremating [M]!"
				spawn()M.Death(src,damage,3)
			M.trapped=0
			for(var/obj/Fire/f in world)
				if(f.Gowner==src)
					del f

mob
	proc/updateInventory()
		set waitfor = 0
		var/i = 0
	//	var/obj/items/e

		src << output("Money: [money]\nEvent Points: [eventpoints]", "inventory_grid: [++i]")


		var/list/T=new

		for(var/obj/items/O in src.contents)
			if(!T.Find(O.type))
				T+=O.type
				var/count=0
				for(var/obj/items/o in src.contents)
					if(o.type==O.type)
						count+=o.stacked
						if(o!=O)del(o)
				O.stacked=count
				O.suffix="[count]"
				if(O.suffix=="1"||O.suffix=="0")
					O.suffix=""

		//for(O in contents)
			src << output(O, "inventory_grid: [++i]")


		if(!client) return
		winset(src, "inventory_grid", "cells = [i]")


mob
	proc

		RefreshSkillList()
			if(client)
				var/grid_item = 0
				var/list/T=new
				for(var/obj/skillcard/O in src.contents)
					if(!T.Find(O.type))
						T+=O.type
						var/count=0
						for(var/obj/skillcard/o in src.contents)
							if(o.type==O.type)
								count+=o.stacked

								if(o!=O)del(o)
						O.stacked=count
						O.suffix="[count]"
						if(O.suffix=="1"||O.suffix=="0")
							O.suffix=""
					if(client) src<<output(O, "skills_grid:[++grid_item]")
				if(client) winset(src, "skills_grid", "cells=[grid_item]")
mob/var/isadmin=null