mob/var/tmp
	_img_mattack_cache
	_img_mdefence_cache
	_img_reiatsu_cache
	_img_rei_cache
	_img_levelpoints_cache
	_img_skillpoints_cache
	_img_passive_cache
	_img_level_cache
	_img_skill_cache
	dgottekkai=0
mob/proc/Refresh_Stat_Screen()
	set background=1
	if(!src)
		return
	if(!client)
		return
	/*if(_img_skill_cache != round(skillpoints))
		del Screen_Num[4]
		for(var/turf/s1skill/d in world)
			Screen_Num[4]=DisplayNumberO(d.x,d.y,d.z,src.skillpoints)
			_img_passive_cache = round(skillpoints)
	if(_img_level_cache != round(skillpoints))
		del Screen_Num[6]
		for(var/turf/s1level/d in world)
			Screen_Num[6]=DisplayNumberO(d.x,d.y,d.z,src.levelpoints)
			_img_level_cache = round(levelpoints)
	if(_img_passive_cache != round(skillspassive))
		del Screen_Num[8]
		for(var/turf/s1passive/d in world)
			Screen_Num[8]=DisplayNumberO(d.x,d.y,d.z,src.skillspassive)
			_img_passive_cache = round(skillspassive)*/

turf/attack
	layer=99
turf/attrib
	layer=99
turf/s1passive
	layer=99
turf/s1level
	layer=99
turf/s1skill
	layer=99
image/var
	group=0
mob/var/jashinfix=0
mob/var
	skillpoints=0
	skillspassive=0
	combos=0
	levelpoints=0
	rawbuff=0
	Imgs
	gotskillssam=0
	gotskillssam1=0
	gotskillssam2=0
	gotexpboost4=0
	gotexpboost2=0
mob/proc/Level_Up()
	if(!src.client)return
	if(src.exp >= src.mexp)
		src.level ++
		//GainGuildXp(src.mexp/10)
		if(src.race=="Shinigami"&&src.level==150&&src.beatkenpachi==0)
			src<<"<b><font color=green>You must follow the story!"
			return
		if(src.race=="Fullbringer"&&src.level==150&&src.beatkenpachi==0)
			src<<"<b><font color=green>You must follow the story!"
			return
		if(src.race=="Holllow"&&src.level==220&&src.beatichigo==0)
			src<<"<b><font color=green>You must follow the story!"
			return
		if(src.race=="Quincy"&&src.level==220&&src.gotfinal==0)
			src<<"<b><font color=green>You must follow the story!"
			return
		if(src.level==400&&src.talktoshinji==0)
			src<<"<b><font color=green>Please Talk to urahara in his basement!!!!!"
		if(src.level==300&&src.gamemish<5)
			src<<"<b><font color=green>You must follow the story!"
			return
		if(src.spiritweapon==2&&src.level>600&&src.gotwindvtechs==0&&src.chosespirit==1)
			src.contents+=new/obj/skillcard/Vandwindstream
			src.contents+=new/obj/skillcard/Vandwindbullet
			src.contents+=new/obj/skillcard/VandenreichAura
			src.RefreshSkillList()
			src.gotwindvtechs=1
		if(src.spiritweapon==1&&src.level>600&&src.gotfirevtechs==0&&src.chosespirit==1)
			src.contents+=new/obj/skillcard/Vandfirestream
			src.contents+=new/obj/skillcard/Vandfirebullet
			src.contents+=new/obj/skillcard/VandenreichAura
			src.RefreshSkillList()
			src.gotfirevtechs=1
		if(src.spiritweapon==0&&src.level>600&&src.gotlightnvtechs==0&&src.chosespirit==1)
			src.contents+=new/obj/skillcard/Vandlightnbullet
			src.contents+=new/obj/skillcard/Vandlightnbolt
			src.contents+=new/obj/skillcard/VandenreichAura
			src.RefreshSkillList()
			src.gotlightnvtechs=1
		if(src.race=="Quincy" && src.level >= 600)
			src.contents+=new/obj/skillcard/VandenreichAura
			src.RefreshSkillList()
		if(src.stype=="Yammamoto" && src.level >= 700)
			src.contents+=new/obj/skillcard/Fortress_Blaze
			src.RefreshSkillList()
			if(!src.learnfort)src<<"You learned Fortress Blaze!"
			src.learnfort=1
		if(src.ftype=="Samurai")
			if(src.level >= 150 && !src.gotskillssam)
				src.contents+=new/obj/skillcard/Samurai_Barrage
				src.contents+=new/obj/skillcard/Power_Transfer
				src.RefreshSkillList()
				src<<"You learned Samurai Barrage and Power Transfer."
				src.gotskillssam=1
			if(src.level >= 300 && !src.gotskillssam1)
				src.contents+=new/obj/skillcard/Samurai_Jab
				src.RefreshSkillList()
				src<<"You learned Samurai Jab."
				src.gotskillssam1=1
			if(src.level >= 500 && !src.gotskillssam2)
				src.contents+=new/obj/skillcard/Samurai_Freeze
				src.RefreshSkillList()
				src<<"You learned Samurai Freeze."
				src.gotskillssam2=1
		src.exp = src.exp-src.mexp
		src<<"<b><font color=blue>You leveled up!"
	//	src.flicklevelup()
	//	src.level ++
		src.rep+=1
		if(src.level<99&&src.instinct>5)
			src.instinct=0
		if(src.twilightlvls == 1)
			for(var/i = 1 to 19)
				if(src.level%10==0)
					src.skillspassive+=1
				src.level ++
				src.levelpoints+=15
				if(src.stype=="Kido Class")
					src.levelpoints+=10
				src.rep+=1
				src.mrei +=15
				src.mhealth +=400
				src.mattack +=2
				src.mdefence +=2
				src.mreiatsu +=2
				src.attack +=2
				src.defence +=2
				src.reiatsu +=2
				src.rei +=15
				src.rawbuff+=2
				src.chargedalready=0
		if(src.donor4levels!=1&&src.donor2levels==1||src.key == "Not|Silver9014"||src.key == "Not|Oksim7"||src.key == "Not|Anbukev"||src.key == "Not|KillManiac"||src.key == "Not|Fatboy12"||src.key == "Not|Quay400"||src.key == "Not|Ilaero"||src.key == "Not|AzureRain"||src.key == "Not|Icedpali"||src.key == "Not|DevilKnightSparda"||src.key == "Not|Tarcioblazek"||src.key == "Not|Condemned pizz4"||src.key == "Not|Knives221"||src.key == "Not|Vash-Da-Trigun"||src.key == "Not|lunar0011"||src.key == "Not|Jackdriver123"||src.key == "Not|BlackUchiha777"||src.key == "Not|Dornamu"||src.key == "Not|Adlofs"||src.key == "Not|Dexter1"||src.key == "Not|GohantheKid"||src.key == "Not|Anbutyler18"||src.key == "Not|BlowItOutOfYourAss"||src.key == "Not|Goodtooth"||src.key == "Not|Stone186"||src.key == "Not|Xsinx3"||src.key == "Not|WinterSnow")//host funders and myself lol
			if(src.level==10||src.level==20||src.level==30||src.level==40||src.level==50||src.level==60||src.level==70||src.level==80||src.level==90||src.level==100||src.level==110||src.level==120||src.level==130||src.level==140||src.level==150||src.level==160||src.level==170||src.level==180||src.level==190||src.level==200||src.level==210||src.level==220||src.level==230||src.level==240||src.level==250||src.level==260||src.level==270||src.level==280||src.level==290||src.level==300||src.level==310||src.level==320||src.level==330||src.level==340||src.level==350||src.level==360||src.level==370||src.level==380||src.level==390||src.level==400||src.level==410||src.level==420||src.level==430||src.level==440||src.level==450||src.level==460||src.level==470||src.level==480||src.level==490||src.level==500||src.level==510||src.level==520||src.level==530||src.level==540||src.level==550||src.level==560||src.level==570||src.level==580||src.level==590||src.level==600||src.level==610||src.level==620||src.level==630||src.level==640||src.level==650||src.level==660||src.level==670||src.level==680||src.level==690||src.level==700||src.level==710||src.level==720||src.level==730||src.level==740||src.level==750||src.level==760||src.level==770||src.level==780||src.level==790||src.level==800||src.level==810||src.level==820||src.level==830||src.level==840||src.level==850||src.level==860||src.level==870||src.level==880||src.level==890||src.level==900||src.level==910||src.level==920||src.level==930||src.level==940||src.level==950||src.level==960||src.level==970||src.level==980||src.level==990||src.level==1000)
				src.skillspassive+=1
			src.level ++
			src.levelpoints+=15
			if(src.stype=="Kido Class")
				src.levelpoints+=10
			src.rep+=1
			src.mrei +=15
			src.mhealth +=400
			src.mattack +=2
			src.mdefence +=2
			src.mreiatsu +=2
			src.attack +=2
			src.defence +=2
			src.reiatsu +=2
			src.rei +=15
			src.rawbuff+=2
			src.chargedalready=0
		if(src.donor4levels==1)
			if(src.level==10||src.level==20||src.level==30||src.level==40||src.level==50||src.level==60||src.level==70||src.level==80||src.level==90||src.level==100||src.level==110||src.level==120||src.level==130||src.level==140||src.level==150||src.level==160||src.level==170||src.level==180||src.level==190||src.level==200||src.level==210||src.level==220||src.level==230||src.level==240||src.level==250||src.level==260||src.level==270||src.level==280||src.level==290||src.level==300||src.level==310||src.level==320||src.level==330||src.level==340||src.level==350||src.level==360||src.level==370||src.level==380||src.level==390||src.level==400||src.level==410||src.level==420||src.level==430||src.level==440||src.level==450||src.level==460||src.level==470||src.level==480||src.level==490||src.level==500||src.level==510||src.level==520||src.level==530||src.level==540||src.level==550||src.level==560||src.level==570||src.level==580||src.level==590||src.level==600||src.level==610||src.level==620||src.level==630||src.level==640||src.level==650||src.level==660||src.level==670||src.level==680||src.level==690||src.level==700||src.level==710||src.level==720||src.level==730||src.level==740||src.level==750||src.level==760||src.level==770||src.level==780||src.level==790||src.level==800||src.level==810||src.level==820||src.level==830||src.level==840||src.level==850||src.level==860||src.level==870||src.level==880||src.level==890||src.level==900||src.level==910||src.level==920||src.level==930||src.level==940||src.level==950||src.level==960||src.level==970||src.level==980||src.level==990||src.level==1000)
				src.skillspassive+=1
			src.level ++
			src.levelpoints+=15
			src.rep+=1
			src.mrei +=15
			src.mhealth +=400
			src.mattack +=2
			if(src.stype=="Kido Class")
				src.levelpoints+=10
			src.mdefence +=2
			src.mreiatsu +=2
			src.attack +=2
			src.defence +=2
			src.reiatsu +=2
			src.rei +=15
			src.rawbuff+=2
			src.chargedalready=0
			if(src.level==10||src.level==20||src.level==30||src.level==40||src.level==50||src.level==60||src.level==70||src.level==80||src.level==90||src.level==100||src.level==110||src.level==120||src.level==130||src.level==140||src.level==150||src.level==160||src.level==170||src.level==180||src.level==190||src.level==200||src.level==210||src.level==220||src.level==230||src.level==240||src.level==250||src.level==260||src.level==270||src.level==280||src.level==290||src.level==300||src.level==310||src.level==320||src.level==330||src.level==340||src.level==350||src.level==360||src.level==370||src.level==380||src.level==390||src.level==400||src.level==410||src.level==420||src.level==430||src.level==440||src.level==450||src.level==460||src.level==470||src.level==480||src.level==490||src.level==500||src.level==510||src.level==520||src.level==530||src.level==540||src.level==550||src.level==560||src.level==570||src.level==580||src.level==590||src.level==600||src.level==610||src.level==620||src.level==630||src.level==640||src.level==650||src.level==660||src.level==670||src.level==680||src.level==690||src.level==700||src.level==710||src.level==720||src.level==730||src.level==740||src.level==750||src.level==760||src.level==770||src.level==780||src.level==790||src.level==800||src.level==810||src.level==820||src.level==830||src.level==840||src.level==850||src.level==860||src.level==870||src.level==880||src.level==890||src.level==900||src.level==910||src.level==920||src.level==930||src.level==940||src.level==950||src.level==960||src.level==970||src.level==980||src.level==990||src.level==1000)
				src.skillspassive+=1
			src.level ++
			src.levelpoints+=15
			src.rep+=1
			src.mrei +=15
			src.mhealth +=400
			src.mattack +=2
			if(src.stype=="Kido Class")
				src.levelpoints+=10
			src.mdefence +=2
			src.mreiatsu +=2
			src.attack +=2
			src.defence +=2
			src.reiatsu +=2
			src.rei +=15
			src.rawbuff+=2
			src.chargedalready=0
			src.level ++
			if(src.level==10||src.level==20||src.level==30||src.level==40||src.level==50||src.level==60||src.level==70||src.level==80||src.level==90||src.level==100||src.level==110||src.level==120||src.level==130||src.level==140||src.level==150||src.level==160||src.level==170||src.level==180||src.level==190||src.level==200||src.level==210||src.level==220||src.level==230||src.level==240||src.level==250||src.level==260||src.level==270||src.level==280||src.level==290||src.level==300||src.level==310||src.level==320||src.level==330||src.level==340||src.level==350||src.level==360||src.level==370||src.level==380||src.level==390||src.level==400||src.level==410||src.level==420||src.level==430||src.level==440||src.level==450||src.level==460||src.level==470||src.level==480||src.level==490||src.level==500||src.level==510||src.level==520||src.level==530||src.level==540||src.level==550||src.level==560||src.level==570||src.level==580||src.level==590||src.level==600||src.level==610||src.level==620||src.level==630||src.level==640||src.level==650||src.level==660||src.level==670||src.level==680||src.level==690||src.level==700||src.level==710||src.level==720||src.level==730||src.level==740||src.level==750||src.level==760||src.level==770||src.level==780||src.level==790||src.level==800||src.level==810||src.level==820||src.level==830||src.level==840||src.level==850||src.level==860||src.level==870||src.level==880||src.level==890||src.level==900||src.level==910||src.level==920||src.level==930||src.level==940||src.level==950||src.level==960||src.level==970||src.level==980||src.level==990||src.level==1000)
				src.skillspassive+=1
			src.levelpoints+=15
			src.rep+=1
			src.mrei +=15
			src.mhealth +=400
			src.mattack +=2
			if(src.stype=="Kido Class")
				src.levelpoints+=10
			src.mdefence +=2
			src.mreiatsu +=2
			src.attack +=2
			src.defence +=2
			src.reiatsu +=2
			src.rei +=15
			src.rawbuff+=2
			src.chargedalready=0
			if(src.level==10||src.level==20||src.level==30||src.level==40||src.level==50||src.level==60||src.level==70||src.level==80||src.level==90||src.level==100||src.level==110||src.level==120||src.level==130||src.level==140||src.level==150||src.level==160||src.level==170||src.level==180||src.level==190||src.level==200||src.level==210||src.level==220||src.level==230||src.level==240||src.level==250||src.level==260||src.level==270||src.level==280||src.level==290||src.level==300||src.level==310||src.level==320||src.level==330||src.level==340||src.level==350||src.level==360||src.level==370||src.level==380||src.level==390||src.level==400||src.level==410||src.level==420||src.level==430||src.level==440||src.level==450||src.level==460||src.level==470||src.level==480||src.level==490||src.level==500||src.level==510||src.level==520||src.level==530||src.level==540||src.level==550||src.level==560||src.level==570||src.level==580||src.level==590||src.level==600||src.level==610||src.level==620||src.level==630||src.level==640||src.level==650||src.level==660||src.level==670||src.level==680||src.level==690||src.level==700||src.level==710||src.level==720||src.level==730||src.level==740||src.level==750||src.level==760||src.level==770||src.level==780||src.level==790||src.level==800||src.level==810||src.level==820||src.level==830||src.level==840||src.level==850||src.level==860||src.level==870||src.level==880||src.level==890||src.level==900||src.level==910||src.level==920||src.level==930||src.level==940||src.level==950||src.level==960||src.level==970||src.level==980||src.level==990||src.level==1000)
				src.skillspassive+=1
		if(src.killedgrimmjow&&src.killedhal&&src.killedszayel&&src.killedstark&&src.killedbarragan&&src.killednnoitra&&src.killedzommari&&src.killedulquiorra&&src.killedespadas==0)
			AwardMedal("Espada Killer", src)
			world<<"<b><font color=lime>Medal Info: [src] has been awarded the 'Espada Killer' for killing off the whole espada"
			killedespadas=1
			if(src.storycom<94)
				src.curpart="Part 10: The Final battle"
				src.curmis="Kill Aizen"
				src.storycom=94
		if(src.level>450&&src.onlyone==0&&src.newshikills>=50&&src.newfulkills>=50&&src.newholkills>=50&&src.newquikills>=50&&src.newsadkills>=50&&src.newvaikills>=50)//&&src.newpvpkills>=10)
			src.onlyone=1
			AwardMedal("There can only be one!", src)
			world<<"<b><font color=lime>Medal Info: [src] has been awarded 'There Can Only Be One' for killing off all races during his rage"
			src.money+=100000
			src<<"<font color=purple><b>You have recieved 2 million exp and $100,000"
			if(src.storycom<=70)
				src.Story_Talk("You have satisfied your rage, but at that very moment Urahara calls you back")
				src.curpart="Part 8: The Victory!!!"
				src.curmis="Talk to Urahara"
				src.storycom=70
		if(src.level>=1500)return
		src.mrei +=15
		src.mhealth +=400
		src.mattack +=2
		src.mdefence +=2
		src.mreiatsu +=2
		src.attack +=2
		src.defence +=2
		src.reiatsu +=2
		src.rei +=15
		src.rawbuff+=2
		src.chargedalready=0
		if(src.Rebirthed)
			src.mrei +=4
			src.mhealth +=100
			src.mattack +=4
			src.mdefence +=4
			src.mreiatsu +=4
			src.attack +=4
			src.defence +=4
			src.reiatsu +=4
			src.rei +=10
			src.rawbuff+=4
		if(src.Rebirthed >1)
			src.mrei +=7
			src.mhealth +=100
			src.mattack +=7
			src.mdefence +=7
			src.mreiatsu +=7
			src.attack +=7
			src.defence +=7
			src.reiatsu +=7
			src.rei +=5
			src.rawbuff+=7
		if(src.level<=1000)
			src.levelpoints+=15
			if(src.stype=="Kido Class")
				src.levelpoints+=10
			src.chargedalready = 0
		src.mexp=((src.level*src.level*1.5)+1200)
		if(src.Rebirthed == 1&&src.SecondRebirth!=1)
			src.mexp=((src.level*src.level*2.2)+1250)
		if(src.SecondRebirth==1)
			src.mexp=((src.level*src.level*3.5)+1250)
		if(src.level>=170)
			src.mexp=src.mexp*3
		if(src.level>=350)
			src.mexp=src.mexp*3
		if(src.level>=380)
			src.mexp=src.mexp*3
		if(src.level>=450)
			src.mexp=round(src.mexp*1.8,1)
		if(src.level>=500)
			src.mexp=round(src.mexp*1.8,1)
		if(src.level>=700)
			src.mexp=round(src.mexp*1.4,1)
			if(src.SecondRebirth==1)
				src.mexp=src.mexp*2.3
			if(src.Rebirthed == 1&&src.SecondRebirth!=1)
				src.mexp=src.mexp*1.6
		if(src.level>=800)
			src.mexp=round(src.mexp*1.5,1)
		if(src.level>=900)
			src.mexp=round(src.mexp*3.5,1)
		if(src.level>=950)
			src.mexp=round(src.mexp*4,1)
		if(src.level==999)
			src.mexp=round(src.mexp*13,1)
		if(src.level>=1000)
			src.mexp=round(src.mexp*2,1)
		if(src.level>=1500)
			src.mexp=round(src.mexp*3,1)
		if(src.level>=1850)
			src.mexp=round(src.mexp*4,1)
		//if(src.race=="Fullbringer")
		src.mexp=round(src.mexp/10,1)
		if(src.donorhalfexp==1||src.key=="Not|Fatboy12")
			src.mexp-=(src.mexp)/2
		if(src.level == 50)
			src<<"<font color = teal>You have now reached level 50! Distribute your stats then go to the Training Area to fight weak hollows!"
			src<< "You have gained a combo point"
			src.combos+=1
		if(src.level>=600&&!src.dgottekkai&&src.race=="Sado")
			src.contents+=new/obj/skillcard/Tekkai
			src.RefreshSkillList()
			src.dgottekkai=1
		if(src.level==300)
			src.Story_Talk("You will need to highten your skills and awareness and the best way to do that is by playing video games. Go see Yukio in the Bar on Earth.")
			src.curmis="Go to Yukio in the Bar located on Earth"
		if(src.race=="Shinigami")
			if(src.level==100)
				src.Story_Talk("You are now level 100 and you can feel your body becoming lighter more mask and powerful killing these hollows are actually making you stronger. A Sigh of relief fills your soul but you can't seem to allow the memory of that strange arrancar decay in your mind... 'Why did an Arrancar help me, I'm their enemy'")
				src.curpart="Part 2: My purpose and my curiosity"
				src.curmis="Train to level 150"
				src.storycom=12
			if(src.level==150)
				src.Story_Talk("You are now level 150 and cannot advance anymore in strength ( unless you are wearing equipment that enchance stats) your recieveing a message from a Hell agent telepathically... You may now go to the Sogyoku Hill Located in the central zone of Soul Society and find Byakuya to take the 3 tests of the shinigami before you can obtain Shikai.")
				src.curpart="Part 3: The challenge and purpose of life"
				src.curmis="Talk to Byakuya & Complete the Shikai Tests"
				src.storycom=20
			if(src.level==400)
				src.Story_Talk("You must visit Urahara in his basement located on Earth")
				src.curpart="Part 5: The Cursed Race"
				src.curmis="Talk to Urahara in his basement on Earth"
				src.storycom=43
		if(src.race=="Hollow"||src.race=="Arrancar")
			if(src.level==120)
				src.Story_Talk("You are now level 120 and you can feel your body becoming larger, heavier and stronger, you've learned new abilities to help vanquish weaker hollows who stand in your way. Somewhat along the lines of training you think to yourself what if i could devour that arrancar who helped me, your desire for power increases with your hunger for more hollows to feed upon.")
				src.curpart="Part 2: My purpose and my curiosity"
				src.curmis="Train to level 220"
				src.storycom=12
			if(src.level==220)
				src.Story_Talk("You are now level 220 and cannot advance in levels anymore, ( unless using or wearing a special equipment or using consumable boosts) you feel this strange dark voice inside of your head calling you to the depths of Las noches... ' Come we must meet face to face, I am Aizen Sosuke leader of the arrancar race. If you wish to seek a power greater than Comprehension than prove yourself worthy and find me and i will grant you the ultimate level of power.'")
				src.curpart="Part 3: The challenge and purpose of life"
				src.curmis="Talk to Aizen & Complete the Arrancar Tests"
				src.storycom=20
			if(src.level==400)
				src.Story_Talk("You have been training for years, and you keep hearing about a group of rouge Shinigami who posses amazing power and teaching that whole no boundaries, should you seek this one out and learn his teachings? Your existence as a hollow becomes slightly blurred as your urge to learn this rogue's powers overwhelms your hollowfied heart.")
				src.curpart="Part 5: The Cursed Race"
				src.curmis="Talk to Urahara in his basement on Earth"
				src.storycom=43
		if(src.race=="Fullbringer")
			if(src.level==100)
				src.Story_Talk("You are now level 100 and you can feel your body becoming more empowered, only 50 levels away from learning your ancient relic ability of the chosen Fullbringers, but will you use it to protect or to destroy? During the middle of your self-confrontations you remember that strange arrancar who helped you... what is his purpose and why does it involve me. Should you kill him when your stronger or demand his purpose when the time comes....")
				src.curpart="Part 2: My purpose and my curiosity"
				src.curmis="Train to level 150"
				src.storycom=12
			if(src.level==150)
				src.Story_Talk("You are now level 150 and cannot advance in level anymore ( unless you are wearing equipment with buffs), as a full bringer your destiny drives you to choose 1 of the ancient relics to empower yourself with. Something deep inside of you is pulling you towards the bar on earth, could this be the inner power of the full-bringer? All you know is that you must find this Ginjo for answers.")
				src.curpart="Part 3: The challenge and purpose of life"
				src.curmis="Talk to Ginjo & Attain Fullbring"
				src.storycom=20
			if(src.level==400)
				src.Story_Talk("You've been around all the other races and your slowly developing a sense of Inferior pity for them, although these are your allies you fear they will only get in your way and cripple your chosen destiny, upon an assassination attempt of 1 of the shinigami captains you over here the name Urahara Kisuke a rogue shinigami who possess unknown, unlimited, and forbidden powers. You decide to seek out and fight this opponent instead of betraying your weak allies, but what lies ahead is more than you can comprehend.")
				src.curpart="Part 5: The Cursed Race"
				src.curmis="Talk to Urahara in his basement on Earth"
				src.storycom=43
		if(src.race=="Quincy")
			if(src.level==100)
				src.Story_Talk("You are now level 100 and your Senrei Glove enhances your modern abilities... you can't knock off the fact you were helped by an enemy you despise more than Shinigamis. What is the meaning of this and why can't you let this memory elude you... there's only 1 way to find out and you must become stronger to find this friend or foe once more.")
				src.Story_Talk("You will put rei into your arrows now to add power")
				src.curpart="Part 2: My purpose and my curiosity"
				src.curmis="Train to level 220"
				src.storycom=12
			if(src.level==220)
				src.Story_Talk("You are now level 220 and cannot advance in level anymore ( unless you are wearing equipment with buffs), your quincy powers are quickly excelling in great power but this form seems almost too fragile for you so you seek the forbidden powers of the Quincy Elders the Final Form. You must seek out your Quincy veteran teacher somewhere on earth and hope that your powers are ripe enough to vanquish any tests brought before you.")
				src.curpart="Part 3: The challenge and purpose of life"
				src.curmis="Talk to Quincy Veteran & Attain Final Form"
				src.storycom=20
			if(src.level==400)
				src.Story_Talk("You are set to seek out your goals to hunt this Shinigami Captain whom threatened the Quincy Elders previously, but upon a Scouting of the Seireitei you encounter a group of Shinigamis whom you interrogate only to find out there's a rouge Shinigami who lives on earth... mistaken by this information you rush to this Shinigamis home and tend to strike him down 1 arrow after another if needed.You must kill Urahara in his basement located on Earth")
				src.curpart="Part 5: The Cursed Race"
				src.curmis="Talk to Urahara in his basement on Earth"
				src.storycom=43
		if(src.race=="Sado")
			if(src.level==100)
				src.Story_Talk("You are now level 100 and your arms are much more powerful and light than before, your movement and physical mass makes you feel proud and impressed with yourself, but you cannot forget the good willed Arrancar who assisted you when this deranged life of yours had began. You think to yourself... I should seek out this Ally once again and team up i could use all the help i could get until i achieve the final sado arm. The ultimate Shield!!!")
				src.curpart="Part 2: My purpose and my curiosity"
				src.curmis="Train to level 150"
				src.storycom=12
			if(src.level==150)
				src.gottatalk=1
				src.Story_Talk("You have now reached level 150 and  you realize you lack the proper teachings and abilities of the Sado so you must seek out a true veteran Sado (Chad) located near School(located west of city on Earth).")
				src.curpart="Part 3: The challenge and purpose of life"
				src.curmis="Talk to Chad near the school"
				src.storycom=20
			if(src.level==400)
				src.Story_Talk("Your teacher chad tells you to visit a Shinigami Rouge named Urahara Kisuke, he's the 1 who helped Chad learn to fight and use his Sado powers. So you seek out this Rouge hoping to learn more amazing powers and ways to utilize the arms of the devil.")
				src.curpart="Part 5: The Cursed Race"
				src.curmis="Talk to Urahara in his basement on Earth"
				src.storycom=43
		if(src.level==250)
			src.Story_Talk("You have now reached level 250 and the flashback of that mysterious arrancar continues to haunt you, ' Am i strong enough to defeat or confront that arrancar now? Should i ask them for more help or why i am involved in this war of races?' There's only 1 way to find out the answer but right now you must become stronger and seek the help of more superior leaders and teachers. Your new found abilities will come in handy while training but skills are only half your power, self-taught passive skills can help put a smaller dent into the crater limiting your powers.")
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
		if(src.level >= 900 && src.storycom>=98 && !src.Rebirthedpart2)
			src.Story_Talk("You have reached level 900 and are now on the mission for rebirthing.")
			src.curpart="Rebirth"
			src.storycom=100
			src.newshikills=0
			src.newfulkills=0
			src.newholkills=0
			src.newquikills=0
			src.newsadkills=0
			src.newvaikills=0
		//	src.newpvpkills=0
			src.newvand=0
			src.Rebirthedpart2=1
		if(src.Rebirthedpart2==1)src.curmis="Kill [src.newshikills]/100 shinigamis, [src.newfulkills]/100 fullbringers, [src.newholkills]/100 hollows, [src.newquikills]/100 quincies, [src.newsadkills]/100 sados, [src.newvaikills]/100 vaizards, [src.newvand]/100 vanders"
		if(src.Rebirthedpart2==1 && src.newshikills >= 100 && src.newfulkills >= 100 && src.newholkills >=100 && src.newquikills >= 100 && src.newsadkills>=100 && src.newvaikills >=100 && src.newvand >= 100)
			src.curpart="Rebirth Final Part"
			src.curmis="You have completed the rebirthing mission, speak with Rebirth man in the bar to rebirth"
			src.Rebirthedpart2=2
	/*	if(src.level >= 1000)
			src.rebirthedrelapse=1
			src.timesRebirthedRel=1
			world << "<b><font color = aqua><h2>Ability Info: [src] has reached level 1000! Because of his great experience it will be extremely hard to improve!"
			AwardMedal("Level Cap", src)
			world<<"<b><font color=lime>Medal Info: [src] has been awarded the 'Level Cap' for reaching . . . .. wait for it... Level 1000!"

		if(src.level >= 1000 && src.rebirthedrelapse && src.timesRebirthedRel && src.RebirthedRel)
			world << "<b><font color = aqua><h2>Ability Info: [src] has reached level 1000 as a first prestige! Because of his great experience it will be extremely hard to improve!"
			AwardMedal("Level Cap", src)
			src.rebirthedrelapse=2
			src.timesRebirthedRel=2

		if(src.level >= 1000 && src.rebirthedrelapse==2 && src.timesRebirthedRel==2)
			world << "<b><font color = aqua><h2>Ability Info: [src] has reached level 1000 as a second prestige! Because of his great experience it will be extremely hard to improve!"
			AwardMedal("Level Cap", src)
			src.rebirthedrelapse=3
			src.timesRebirthedRel=3	*/
		if(src.level >= 1000 && !src.Lvl1000Boost&&!src.Rebirthed)
			world << "<b><font color = aqua><h2>Ability Info: [src] has reached level 1000! Because of his great experience it will be extremely hard to improve!"
			AwardMedal("Level Cap", src)
			world<<"<b><font color=lime>Medal Info: [src] has been awarded the 'Level Cap' for reaching . . . .. wait for it... Level 1000!"
			src<< "Your Health goes up by 1000"
			src.mhealth += 2500
			src<< "Your Rei goes up by 1000"
			src<< "You have gained a combo point"
			src.combos+=2
			src.mrei += 2500
			src.mattack+=2500
			src.attack+=2500
			src.mdefence+=2500
			src.defence+=2500
			src.mreiatsu+=2500
			src.reiatsu+=2500
			src.rawbuff+=2500
			//src.curmis="Get all the WWA Medals"
			src.Lvl1000Boost = 1
		if(src.level >= 1000&&src.Lvl1000Boost&&src.Rebirthed&& !src.SecondRebirth && !src.Lvl1000BoostRB)
			world << "<b><font color = aqua><h2>Ability Info: [src] has reached level 1000 as a first rebirth! Because of his great experience it will be extremely hard to improve!"
			AwardMedal("Level Cap", src)
			world<<"<b><font color=lime>Medal Info: [src] has been awarded the 'Level Cap' for reaching . . . .. wait for it... Level 1000!"
			src<< "Your Health goes up by 1000"
			src.mhealth += 5000
			src<< "Your Rei goes up by 1000"
			src<< "You have gained a combo point"
			src.combos+=2
			src.Lvl1000BoostRB=1
			src.mrei += 3000
			src.mattack+=3000
			src.attack+=3000
			src.mdefence+=3000
			src.defence+=3000
			src.mreiatsu+=3000
			src.reiatsu+=3000
			src.rawbuff+=3000
			src.justhere=1
			//src.curmis="Get all the WWA Medals"
		if(src.level >= 1000&&src.Lvl1000BoostRB&&src.SecondRebirth1k==0&&!src.justhere)
			world << "<b><font color = aqua><h2>Ability Info: [src] has reached level 1000 as a second rebirth! Because of his great experience it will be extremely hard to improve!"
			AwardMedal("Level Cap", src)
			world<<"<b><font color=lime>Medal Info: [src] has been awarded the 'Level Cap' for reaching . . . .. wait for it... Level 1000!"
			src<< "Your Health goes up by 1000"
			src.mhealth += 2000
			src<< "Your Rei goes up by 1000"
			src<< "You have gained a combo point"
			src.combos+=2
			src.mrei += 5000
			src.mattack+=5000
			src.attack+=5000
			src.mdefence+=5000
			src.defence+=5000
			src.mreiatsu+=5000
			src.reiatsu+=5000
			src.rawbuff+=5000
			//src.curmis="Get all the WWA Medals"
			src.SecondRebirth1k = 1
		if(src.level==10||src.level==20||src.level==30||src.level==40||src.level==50||src.level==60||src.level==70||src.level==80||src.level==90||src.level==100||src.level==110||src.level==120||src.level==130||src.level==140||src.level==150||src.level==160||src.level==170||src.level==180||src.level==190||src.level==200||src.level==210||src.level==220||src.level==230||src.level==240||src.level==250||src.level==260||src.level==270||src.level==280||src.level==290||src.level==300||src.level==310||src.level==320||src.level==330||src.level==340||src.level==350||src.level==360||src.level==370||src.level==380||src.level==390||src.level==400||src.level==410||src.level==420||src.level==430||src.level==440||src.level==450||src.level==460||src.level==470||src.level==480||src.level==490||src.level==500||src.level==510||src.level==520||src.level==530||src.level==540||src.level==550||src.level==560||src.level==570||src.level==580||src.level==590||src.level==600||src.level==610||src.level==620||src.level==630||src.level==640||src.level==650||src.level==660||src.level==670||src.level==680||src.level==690||src.level==700||src.level==710||src.level==720||src.level==730||src.level==740||src.level==750||src.level==760||src.level==770||src.level==780||src.level==790||src.level==800||src.level==810||src.level==820||src.level==830||src.level==840||src.level==850||src.level==860||src.level==870||src.level==880||src.level==890||src.level==900||src.level==910||src.level==920||src.level==930||src.level==940||src.level==950||src.level==960||src.level==970||src.level==980||src.level==990||src.level==1000)
			src.skillspassive+=1
			if(src.Rebirthed == 1)
				src.skillspassive+=1
		if(src.level == 100)
			world << "<b><font color = green>Ability Info: [src] has reached level 100!"
			src<< "Your Health goes up by 100"
			src.mhealth += 100
			src<< "Your Rei goes up by 100"
			src<< "You have gained a combo point"
			src.mrei += 100
			src.combos+=1
		if(src.level == 200)
			world << "<b><font color = red>Ability Info: [src] has reached level 200!"
			src<< "Your Health goes up by 200"
			src.mhealth += 200
			src<< "Your Rei goes up by 200"
			src<< "You have gained a combo point"
			src.mrei += 200
			src.combos+=1
		if(src.level == 400)
			world << "<b><font color = green>Ability Info: [src] has reached level 400!"
			src<< "Your Health goes up by 200"
			src.mhealth += 200
			src<< "Your Rei goes up by 200"
			src<< "You have gained a combo point"
			src.mrei += 200
			src.combos+=1
		if(src.level==500)
			world<<"<b><font color=lime>Medal Info: [src] has been awarded the 'Highway to Heaven' for reaching level 500"
			AwardMedal("Highway to Heaven", src)
		src.skill()
		if(src.exp >= src.mexp)
			if(src.exp>src.mexp*10 && src.Rebirthed == 1)src.exp=src.mexp*10
			if(src.exp>src.mexp*10 && src.Rebirthed != 1)src.exp=src.mexp*10
			spawn(30)
				src.Level_Up()
				src.gotexpboost4=0
				src.gotexpboost2=0

	/*for(var/obj/gui/passives/gauge/Q in world)
		if(Q.pindex==25||Q.pindex==26||Q.pindex==27||Q.pindex==28)
			var/client/C=src.client
			if(C)C.Passive_Refresh(Q)*/
	//Refresh_Levelpoints()
	//Refresh_Skillpoints()

mob/var/list/Screen_Num[90]
mob/proc/DisplayNumber(dx,dy,dz,num,group)
	if(num>999999)
		num=999999
	var/string=num2text(round(num),7)

	var/image/d1


	if(length(string)>=1)
		d1=image('Icons/0numbers_small.dmi',locate(dx,dy,dz),icon_state="[copytext(string,length(string),length(string)+1)]",pixel_x=0)
		src<<d1
		//src.Imgs+=d1
		d1.group=group
	if(length(string)>=2)
		d1.overlays+=image('Icons/0numbers_small.dmi',locate(dx,dy,dz),icon_state="[copytext(string,(length(string)-1),(length(string)))]",pixel_x=-6)
	if(length(string)>=3)
		d1.overlays+=image('Icons/0numbers_small.dmi',locate(dx,dy,dz),icon_state="[copytext(string,(length(string)-2),(length(string)-1))]",pixel_x=-12)
	if(length(string)>=4)
		d1.overlays+=image('Icons/0numbers_small.dmi',locate(dx,dy,dz),icon_state="[copytext(string,(length(string)-3),(length(string)-2))]",pixel_x=-18)
	if(length(string)>=5)
		d1.overlays+=image('Icons/0numbers_small.dmi',locate(dx,dy,dz),icon_state="[copytext(string,(length(string)-4),(length(string)-3))]",pixel_x=-24)
	if(length(string)>=6)
		d1.overlays+=image('Icons/0numbers_small.dmi',locate(dx,dy,dz),icon_state="[copytext(string,(length(string)-5),(length(string)-4))]",pixel_x=-30)
	return d1
mob/proc/DisplayNumberO(dx,dy,dz,num,group)
	if(num>999999)
		num=999999
	var/string=num2text(round(num),7)

	var/image/d1


	if(length(string)>=1)
		d1=image('Icons/0numbers.dmi',locate(dx,dy,dz),icon_state="[copytext(string,length(string),length(string)+1)]")
		d1.layer = MOB_LAYER+99
		src<<d1
		//src.Imgs+=d1
		d1.group=group
	if(length(string)>=2)
		d1.overlays+=image('Icons/0numbers.dmi',locate(dx,dy,dz),icon_state="[copytext(string,(length(string)-1),(length(string)))]",pixel_x=-12)
	if(length(string)>=3)
		d1.overlays+=image('Icons/0numbers.dmi',locate(dx,dy,dz),icon_state="[copytext(string,(length(string)-2),(length(string)-1))]",pixel_x=-24)
	if(length(string)>=4)
		d1.overlays+=image('Icons/0numbers.dmi',locate(dx,dy,dz),icon_state="[copytext(string,(length(string)-3),(length(string)-2))]",pixel_x=-36)
	if(length(string)>=5)
		d1.overlays+=image('Icons/0numbers.dmi',locate(dx,dy,dz),icon_state="[copytext(string,(length(string)-4),(length(string)-3))]",pixel_x=-48)
	if(length(string)>=6)
		d1.overlays+=image('Icons/0numbers.dmi',locate(dx,dy,dz),icon_state="[copytext(string,(length(string)-5),(length(string)-4))]",pixel_x=-60)
	return d1

obj/digit
	icon='Icons/0numbers.dmi'