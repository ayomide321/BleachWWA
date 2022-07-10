

DPP
	var
		name=""
		desc=""
		price=100
	VaiRetake
		name="Vaizard Retake"
		desc="Retake the vaizard test"
		price=60
	TwoX
		name="2x exp Gains"
		desc="Gain levels 2x faster."
		price=200
	FourX
		name="4x exp Gains"
		desc="Gain levels 4x faster."
		price=500
	FreeZans
		name="Free"
		desc="Change your anytime for free."
		price=100
	FreeRess
		name="Free"
		desc="Change your anytime for free."
		price=150
	FreeFull
		name="Free"
		desc="Change your anytime for free."
		price=150
	GodsEyes
		name="GodsEyes"
		desc="Implent DNA into your eyes to unlock the eyes of God. take 1/2 wounds, 25percent less damage double all base stats while active"
		price=1250
	Sado
		name="Sado Arm"
		desc="Unlock artificial sado arms!"
		price=500
	VastoMask
		name="Vasto Mask"
		desc="Unlock an artifical vasto mask!"
		price=500
	SquadChange
		name="Squad Change"
		desc="Change your squad, 1 time per use."
		price=75
/*	Evp
		name="Get Event Points"
		desc="+3 ep per 1 DP spent."
		price="Dependent"	*/

	Fortune
		name="Good Fortune"
		desc="Gain +50% money for 5 hours."
		price=100
	Exp
		name="Experience Burst"
		desc="Gain +25% experience for 2 hours!"
		price=100
	DonorStats
		name="Donor Stats"
		desc="Gain permanent boosts to your character per use!"
		price=50
	Amat
		name="Black Flames of God"
		desc="An aoe causing large wound damage and static damage to all who fall victim."
		price=400





var/global/list/perks=list(new /DPP/TwoX,new /DPP/FourX,new /DPP/FreeZans,new /DPP/FreeRess,
,new /DPP/FreeFull,new /DPP/Sado,new /DPP/SquadChange,,new /DPP/Exp,new /DPP/Fortune,//new /DPP/Evp,
,new /DPP/DonorStats,new /DPP/GodsEyes,new /DPP/Amat)

proc
	ExpiDate(var/daysof)
		var/int
		var/testT=world.realtime
		for(int=daysof,int>0, int--)
			testT+=864000
		return testT

	HrDate(var/daysof)
		var/int
		var/testT=world.realtime
		for(int=daysof,int>0, int--)
			testT+=36000
		return testT


	MinDate(var/daysof)
		var/int
		var/testT=world.realtime
		for(int=daysof,int>0, int--)
			testT+=600
		return testT




var/global
//DB stuff don't delete.
	my_database = "sql374258"//"sql322430"//
	server_port=3306
//	link="http://zaggames.x10host.com/donorpoints/BWWAGRBuy.php"
	link="http://subscription-points.com/BWWAGRBuy.php"
	my_server="sql3.freesqldatabase.com"//--do not delete
	DBI="dbi:mysql:[my_database]:[my_server]:[server_port]"
	username= "sql374258"//"sql322430"
	password= "eU4*bP9!"//"005679001"//"xC4%uK1*"//
	DBConnection/my_c=new
	connected=my_c.Connect(DBI,username,password)
	conversion_rate=0//can be 0,105,110,125,150. gains on the DP you get.
	conv_skip=0
	sales_on=0


obj/DonorHud
	icon='Icons.dmi'
	layer=96
	Buy
		icon_state="ulq"
	//	screen_loc="1:5,4:-5"
	//	Click()
		//	usr.Donation()
	Claim
		icon_state="hit"
	//	screen_loc="1:5,5:-5"
		Click()
			usr.RetrDP()
	Use
		icon_state="ura"
		screen_loc="1:5,6:-5"
		Click()
			usr.SpendDonorPoints()

	Res//resurrection on.

proc
	TriggerSale()
		if(sales_on)
			if(!conv_skip)
				conversion_rate=pick(prob(20);0,105,110,125,150)
				if(conversion_rate>0)
					world<<"There is now a sale on donor points going on. Any donor points retrieved during the sale will gain a [conversion_rate-100]% increase. Get them now, use them later!"
			else
				conv_skip=0
		spawn(72000).()

	CAcct(var/mob/m)//called for all people.
		m.AddDonorHuds()
		if(m.in_db==0)
			if(my_c.IsConnected())
				var/DBQuery/query=my_c.NewQuery({"INSERT INTO `bwwa_purchase` (`userid`,`donorpoints`) VALUES ('[m.ckey]','0');"})
				query.Execute()
				m<<"Account Created."
				m.in_db=1
				m.saveproc()
			else
				my_c=new
				connected=my_c.Connect(DBI,username,password)
				m<<"Attempting to connect to database."
				if(my_c.IsConnected())
					m<<"Connect success."
					var/DBQuery/query=my_c.NewQuery({"INSERT INTO `bwwa_purchase` (`userid`,`donorpoints`) VALUES ('[m.ckey]','0');"})
					query.Execute()
					m<<"Account Created."
					m.in_db=1
					m.saveproc()
				else
		//			m<<"Unable to create account."


mob
	var
		in_db=0
		retrieved=0
		donor2levels=0//2 levels everytime you level instead of 1					when set to 1
		donor4levels=0//4 levels/lvl instead of 1 does not stack with x2 levels
		donorhalfexp=0//half the required exp/level stacks with the multiple level boosts
		twilightlvls=0
		donorfreezans=0
		donorfreeress=0
		donorfreefb=0
		donor_points=0
		donormask=0
		donorarm=0
		eyesofgod=0
		blackflames=0
		redH=0
		donorboosted=0
		donorstat=0	//should go up by 1 everytime you purchase it (mattack,mdefence,mreiatsu,rawbuff, <---variable names,all go up by 250 aswell)
		total_spent=0
		total_bought=0
		//--new additions.
		active_exp=0
		exp_expire=null
		active_fortune=0
		fortune_expire=null
		teleport=0
		tele_expire=null
		boost_expire=null
		resurrect=0
		res_expire=null
	verb

		DonorInfo()
			set hidden=1
			winshow(src,"DonorExp",1)
			src<<output(null,"DEx")
			src<<output("Donor Points are a way to say thank you for investing in making BWWA a successful game\n They can be used to benefit any of your save files in various ways- below are a list of the perks you can get using donor points.","DEx")
			src<<output("There are some issues with the domain currently if you wish to purchase donor points, please send the money via paypal to: tanya.maroof@hotmail.com","DEx")
			src<<output("Please leave a note with your key and you will recieve your donor points","DEx")
	//		src<<output("Follow the link to visit Donate and get donor points. Once you transfer donor points to your key all sales are final and non-refundable.","DEx")
	//		src<<output("<a href='[link]?userid=[src.ckey]'> Click Here to continue.</a>","DEx")
			var/T
			for(var/DPP/i in perks)
				T+="[i.name]\nDesc.[i.desc]\nPrice[i.price] DP\n"
			src<<output(T,"DEx")
			src<<output("**Prices**\n2x-150 dp\n4x-350dp\n1/2 exp-150dp\nFree Zan/Ress/Full-125dp\nSquad Change-50 dp\nEyes of God-Sold Out dp\nBlack Flames of God-300 dp\nVasto Form Mask Fuse with 600 mask uses-350dp\nSado arm fuse-350dp\nStat Up-50dp per use.\nGain Event Points- +3 ep per 1 dp\n\nThe amount of money you donate determines the number of donor points you get. 1 USD is equal to 10 donor points.","DEx")
	//	RetrieveDonorPoints()
	//		src.RetrDP()

		UpdateLog()
			set hidden=1
			winshow(src,"UpdateLog",1)
			src<<output(null,"FEx")
			src<<output("<b>- Fixed slight bug with Gin and bosses.","FEx")
			src<<output("<b>- Finally Fixed text not displaying in skills and bags tab.","FEx")
			src<<output("<b>- Twilight damage reflection now only has a 40percent chance of happening.","FEx")
			src<<output("<b>- Ransotengai now lasts twice as long.","FEx")
			src<<output("<b>- Lowered reboot time from 4 hours to 3 hours, might help with rebooting issues where game would not come back up, only happened a few times but to try and fix this we are lowering reboot time.","FEx")
			src<<output("<b>- Icreased Sai Cooldown.","FEx")
			src<<output("<b>- Buffed Aizens Melee.","FEx")
			src<<output("<b>- Lowered cost of mob in mall that allows you to remove skills.","FEx")
			src<<output("- Fixed HUD problems.","FEx")
			src<<output("- Fixed party bug","FEx")
			src<<output("- Fixed finalbring bug","FEx")
			src<<output("- New mob in mall that allows you to remove skills.","FEx")
			src<<output("- Fixed a few bugs.","FEx")
			src<<output("- Espada now get a 100percent defence boost upon going into their release forms","FEx")
			src<<output("- Added Dungeons! Look for the dungeon house to teleport to one of the dungeons!","FEx")
			src<<output("- Guild systems replaced, you can now make your own guilds.","FEx")
			src<<output("- Healing skills have been nerfed for pvp events.","FEx")
			src<<output("- Fixed sado arm bug, can no longer use after shikai is put on.","FEx")
			src<<output("- Raised Reboto from 2 hours to 4 hours.","FEx")
			src<<output("- Buffed Ulq Ressurection.","FEx")
			src<<output("- You can level your guilds.","FEx")
			src<<output("- Guild war system almost done.","FEx")
			src<<output("- Buffed Inoue Fullbring.","FEx")
			src<<output("- Increased Final Shinigami exp to make them more viable for leveling.","FEx")
			src<<output("- Increased Substitue Shinigami exp to make them more viable for leveling.","FEx")
			src<<output("- Increased cooldown for Ruri-Roku-Jaku skill.","FEx")
			src<<output("- Fixed Kido Corps Captain boost.","FEx")
			src<<output("- Buff to Soi-Fon melee damage in shikai.","FEx")
			src<<output("- Buffed Quincy final form.","FEx")
			src<<output("- Buffed Quincy Bow.","FEx")
			src<<output("- Fixed Quincy stacking.","FEx")
			src<<output("- Reduced number of Fullbrings needed for rebirth mission, also added more to map.","FEx")
			src<<output("- Buffed Mayuri Zan.","FEx")
			src<<output("- Hell Armor now give a reiatsu boost.","FEx")
			src<<output("- Get 3 levels for attempting Wandenreich Event for certain levels.","FEx")
			src<<output("- Prince Chest is now a Gold Chest for the Wandenreich Event.","FEx")
			src<<output("- Buffed Race Wars win bonue to match Capture the Flags rewards","FEx")
			src<<output("- Buffed Reigai win bonus to match Espada and Gotei 13 rewards.","FEx")
			src<<output("- Buffed Aizens Melee.","FEx")
			src<<output("- Reduced the drain on momo's homing skill.","FEx")
			src<<output("- Increased Getsuga Jab cooldown.","FEx")
			src<<output("- Nerfed damage to Getsuga Tensho.","FEx")
			src<<output("- Nerfed damage to Fire slash.","FEx")
			src<<output("- Increased drop rate for Lorelei, the more kills the higher percentage for possible drop!","FEx")
			/*src<<output("- Fallen demoted back down to lvl 4 moderator","FEx")
			src<<output("- Fixed CTF Event, will no longer put everyone on the same team!","FEx")
			src<<output("- Fixed a save file issue with people getting multiples of the same skill","FEx")
			src<<output("- Changed the way rebirth stats work. You now get stats for the following;","FEx")
			src<<output("- 1000 base stats for reaching lvl 1k before reborning","FEx")
			src<<output("- 1000 base stats for reaching lvl 1k before second reborning","FEx")
			src<<output("- 1000 base stats for reaching lvl 1k as a second reborn","FEx")
			src<<output("- 1000 base stats for reborning","FEx")
			src<<output("- 2000 base stats for reborning a second time","FEx")
			src<<output("- Respeccing should now be fixed","FEx")
			src<<output("- Respeccing should now be fixed","FEx")
			src<<output("- Any level over 1000 is now registered as 1000 for capture the flag","FEx")
			src<<output("- Fixed stat issue","FEx")
			src<<output("-----------------------------------------------------------------------------","FEx")
			src<<output("- Buffed Yammamoto, damage was a little low.","FEx")
			src<<output("- Nerfed some bullshit custom, all customs must now be approved by zagros5000 any customs unapproved will be nerfed without any discussion.","FEx")
			src<<output("- Okay, NOW jackpot should work","FEx")
			src<<output("- Nerfed Ikkaku bankai base damage","FEx")
			src<<output("- Nerfed Zaraki base damage","FEx")
			src<<output("- Quincy vand bullet damage increased","FEx")
			src<<output("- Quincy scheele damage and vand sword boosted","FEx")
			src<<output("- Adjusted jackpot fullbring","FEx")
			src<<output("- Ginjo advanced fullbringer recieved a nerf","FEx")
			src<<output("- Reduced bala cooldown","FEx")
			src<<output("- Ulquiorra lance melee damage doubled","FEx")
			src<<output("- Fixed issue with power stats being regiven on death and new rounds during CTF","FEx")
			src<<output("- The gap boost between hitsugaya shikai and bankai lowered as his bankai is not supposed to be that much of a power up","FEx")
			src<<output("- Hitsugaya shikai boost increased, and bankai slightly adjusted","FEx")
			src<<output("- Gin's bankai boost has been increased","FEx")
			src<<output("- Soi fon shikai butterfly now does 2-10 wounds instead of 2-5","FEx")
			src<<output("- Unohana bankai now boosts defence greatly","FEx")
			src<<output("- Shunshui and Ukitakezan melee damage increased","FEx")
			src<<output("- Urahara zan melee damage increased","FEx")
			src<<output("- Power transfer now properly boosts all stats, however, the cap has been nerfed to a maximum of 18k","FEx")
			src<<output("- Every fullbring now gets power transfer at level 600, however, ginjo fullbringers get it right away","FEx")
			src<<output("- Sado arm 4 now boosts defence significantly more","FEx")
			src<<output("- Quincy thunder bolt cool down lowered to 7 seconds","FEx")
			src<<output("- Quincy thunder bolt cool down lowered to 7 seconds","FEx")
			src<<output("- Raiho bolt now does half the damage but the cooldown has been lowered to 1 second instead of 3","FEx")
			src<<output("- Rengoku cool downed moved from 15 seconds to 35 - fuji aoe skill","FEx")
			src<<output("- Jackpot and super jackpot now do more damage, a good amount more","FEx")
			src<<output("- Ginjo slightly nerfed","FEx")
			src<<output("- Nnoitra defence boost increased","FEx")
			src<<output("- Outrage cool down moved from 10 seconds to 40","FEx")
			src<<output("- shusuke shikai slightly buffed","FEx")
			src<<output("- Kira bankai greatly buffed, and shikai slightly","FEx")
			src<<output("- Starrk release slightly boosted","FEx")
			src<<output("- Grimmjow release slightly boosted","FEx")
			src<<output("- Volanica ressureccion reiatsu and attack boost increased to a significant degree","FEx")
			src<<output("- Dordoni base boost now increased","FEx")
			src<<output("- Nel ress now further increases your attack and reiatsu","FEx")
			src<<output("- Arrancar power boost has been changed, it now takes 33 percent of your highest stat and adds it to all of your other stats","FEx")
			src<<output("- Zommari ressureccion defence boost increased to a significant degree","FEx")
			src<<output("- Byakuya bankai reiatsu boost increased to a significant degree","FEx")
			src<<output("- Ikkkaku bankai base damage increased to a significant degree","FEx")
			src<<output("- Ikkkaku bankai base damage increased to a significant degree","FEx")
			src<<output("- Renji shikai and bankai greatly buffed","FEx")
			src<<output("- Vaizard mask stack should no longer be possible","FEx")
			src<<output("-Capture the flag reward now greatly scales with your level, supplying you with 5 levels in extreme cases.","FEx")
			src<<output("-You can now give people your event points.","FEx")
			src<<output("-Coded stat boosts are now disabled during events, raids, guild wars, arena challenges, and during rank tests/fights.","FEx")
			src<<output("-Party exp has been lowered for everyone except the killer, they now get bonus exp for having more member in there party.","FEx")
			src<<output("-Raised cap for Jackie Full Bring, should prevent capping your max stats, to an extent.","FEx")
			src<<output("-Respec should now be fixed so you do not lose the few stats from rebirthing.","FEx")
			src<<output("-Wandenreich Prince attack has been nerfed, making it easier to face, does not garantee a win. Also increased Reward for defeating him.","FEx")
			src<<output("-Gate Creator, Lorelei, and Samurai King now regen reiryoku regularly like players.","FEx")
			src<<output("-Gate Creator, Lorelei, and Samurai King can now use powers up properly between reboots","FEx")
			src<<output("-Wandenreich Prince Event has been fixed. His health has been buffed as he will die from low health and not wounds.","FEx")
			src<<output("-Lowered the EP cost for Pure attack to 90EP.","FEx")
			src<<output("-Vai Retake now costs 1.2 million and 50EP.","FEx")*/
	/*		src<<output("Fixed luppi.","FEx")
			src<<output("Talk to santa in urahara shops to get an invisible santa hat!.","FEx")
			src<<output("Vasto lorde can now be unlocked at level 600.","FEx")
			src<<output("Fixed shinji, shinji now inverts whoever he melees, along with his aoe invert","FEx")
			src<<output("Aizen can now normally be rolled when first obtaining your shikai as a rei zan.","FEx")
			src<<output("Shinji zan added","FEx")
			src<<output("True reiatsu is now harder to train","FEx")
			src<<output("Vasto Hollow boost is now 1.5k base stat increase, prior to this update it was 600","FEx")
			src<<output("<font size=4><center>Update Log</font></center>","FEx")
			src<<output("You now have 12seconds to lethally poison someone with mayuri's zan when using lethal poison- use to be 5seconds","FEx")
			src<<output("Mayrui zan users now have a 50percent chance to negate 25percent damage- regardless of whether or not they are using their zanpakuto","FEx")
			src<<output("Sennen Hyoro cooldown is now 10seconds - use to be 30","FEx")
			src<<output("Sado's now universally take 30percent less damage","FEx")
			src<<output("Fixed a glitch with getsuga enhanced blade","FEx")*/
//			src<<output("Vand event boss should be killable now","FEx")
//			src<<output("Luppi no longer abusable","DEx")
//			src<<output("Added a new way to raise maximum reiatsu, everytime a skill is used a probabilty of max reiatus increasing by 1 cappinga t 20k extra reiatsu, respecing will allow yo to keep the bonus reiatsu as well","DEx")
//			src<<output("More passive to come like the new way to raise max reiatsu","DEx")
/*			src<<output("Has been a very busy week for me, updates will resume the following week","FEx")
			src<<output("Soon to come: Team Death Match Event! Stop the invasion event! reworking of reiatsu energy and new passives becoming trainable","DEx")
			src<<output("Berserk now works differently for zaraki, when in berserk damagae is doubled however wounds cannot be healed","FEx")
			src<<output("<font size=4><center>Update Log</font></center>","FEx")
			src<<output("Sado arm now reached at level 700 instead of 600, however the boost is now significantly greater","FEx")
			src<<output("La Muerte now does more damage if enemy does not one hit","FEx")
			src<<output("Updates will resume tomorrow","FEx")
			src<<output("Bull arm does 20percent more damage","FEx")
			src<<output("El Directo does 25percent more damage","FEx")
			src<<output("Sado's quake punch now scales more to users level ","FEx")
			src<<output("Sado's quake punch cool down halfed, reiatsu cost increased to 3000","FEx")*/
	/*		src<<output("Vand Prince chest now drops two skills exclusive to this boss only","FEx")
			src<<output("----------March 21,2015----------","FEx")
			src<<output("--Szayel pills now do damage, head breaks do most damage,core second most, arm and leg the least, based off of users reiatsu","FEx")
			src<<output("--Szayel pill c/d reduced","FEx")
			src<<output("--Getsuga tenshou now uses attack and reiatsu in damage formula","FEx")
			src<<output("--Multiple fixes","FEx")
			src<<output("----------March 19,2015----------","FEx")
			src<<output("--Multiple fixes, added a 20k stat cap to power transfer","FEx")
			src<<output("----------March 8,2015----------","FEx")
			src<<output("--We've decided to wipe and have a fresh start, updates on the way this coming month, starting next week ill have the whole week off to work on update","FEx")
			src<<output("--Fixed some efficiency issues","FEx")
			src<<output("--Certain zans no longer do less damage than their shikai","FEx")
			src<<output("----------February 21,2015----------","FEx")
			src<<output("**Soul Strike (Nuno has been promoted)**","FEx")
			src<<output("--Attack proc has been edited","FEx")
			src<<output("--Tweaked damage of sados and fullbringers","FEx")
			src<<output("--Ginjo now has a base attack damage boost that takes into consideration of both attack and reiatsu","FEx")
			src<<output("--Fullbringers now use attack and reiatsu as a base damage stat, however this changes depending on which fullbring you have","FEx")
			src<<output("--Koma's bankai no longer weaker than its shikai","FEx")
			src<<output("--Testing a new safety for certain rei. based zans, if your attack is higher than your reiatsu then attack will slightly be factored in","FEx")
			src<<output("--Issues with not getting zarakis wide slash after zan changing resolved(thanks yamie)","FEx")*/
		/*	src<<output("----------February 1,2015----------","FEx")
			src<<output("--New boss added, accessible by entering portal inside vand area","FEx")
			src<<output("--New boss drops a special type of chest that has rewards from gold chest and boss exclusive rewards","FEx")
			src<<output("--Homing abilities nerfed slightly","FEx")
			src<<output("--Killing in rogue shini area no longer sends you to spawn","FEx")
			src<<output("--No longer keep getsuga jab upon changing zans","FEx")
			src<<output("--Hollow boosts fixed","FEx")
			src<<output("--Not able to shunpo out of gotei and espada event","FEx")
			src<<output("--No longer able to join events while holding charge","FEx")
			src<<output("--Luppi ress no longer resistant to stuns","FEx")
			src<<output("--Luppi tentacle nerfed","FEx")
			src<<output("--Lorelei has more rei now","FEx")
			src<<output("--Sados automatically gain a skil called tekai at level 700","FEx")
			src<<output("--Rogue shini exp nerfed","FEx")*/
	/*		src<<output("----------January 17,2015----------","FEx")
			src<<output("--Homing abilities nerfed slightly","FEx")
			src<<output("--New boss adjusted and ready to be tested again","FEx")
			src<<output("----------January 11,2015----------","FEx")
			src<<output("--Lava wound output nerfed","FEx")
			src<<output("--Boss added in for testing before release","FEx")
			src<<output("----------January 09,2015----------","FEx")
			src<<output("--Nnoitra can now cause bleed damage to enemies","FEx")
			src<<output("--New Boss area added in, boss is still in testing and cannot be accesed. Reward for killing boss will be a chest which has a chance to drop one of the new items and skills","FEx")
			src<<output("--Kira given defence boost in shikai and an upgraded attack boost, bankai boosts upgraded aswell","FEx")
			src<<output("--Hisagi chains now do more damage","FEx")
			src<<output("--Mayuri given defence boost in both shikai and bankai","FEx")
			src<<output("--Ikkaku slight bankai nerf","FEx")
			src<<output("--Luppi wound output nerfed","FEx")
			src<<output("--You now keep dual zangetsus when reborning","FEx")
			src<<output("--Grimmjow's melee attack is now attack based, desgarron will remain glass cannon","FEx")
			src<<output("--Nell melee buff","FEx")
			src<<output("--Small rebirth error fixed","FEx")
			src<<output("----------January 03,2015----------","FEx")
			src<<output("--Rebirth glitch fixed","FEx")
			src<<output("--Subscription site is running again, thanks for supporting. Message Zagros5000 if any issues occur","FEx")
			src<<output("----------January 02,2015----------","FEx")
			src<<output("--Tsukishima damage buff","FEx")
			src<<output("--Tsukishima boost buff","FEx")
			src<<output("--Yukio attack damage nerf","FEx")
			src<<output("--Ichigo slight damage buff in bankai","FEx")
			src<<output("----------January 01,2015----------","FEx")
			src<<output("<b><center>Happy New Years guys, hope you all have a great year. The vast majority of players wanted a wipe so we've decided to have one for the new year.</b></center>","FEx")
			src<<output("--Gotei 13 NPCs base stats buffed by 10,000","FEx")
			src<<output("--Gotei 13 minimum joining level raised to 550","FEx")
			src<<output("--Gotei 13 map modifications","FEx")
			src<<output("--Fixed issue with players not receiving the level 1k boost","FEx")
			src<<output("--Fixed reborning","FEx")
			src<<output("--Stat boost added for those who reach level 1k as a second reborn","FEx")
			src<<output("--Barragans ressurecion attack now damages all players within one tile","FEx")
			src<<output("--Barragans small drain attack now damages all players within a two tile range instead of one","FEx")
			src<<output("--Kiras area of effect doubled for his regular bankai attacks","FEx")
			src<<output("--Kiras bankai now increases attack slightly more (33%)","FEx")
			src<<output("--Ikkaku minimum rage boost increased","FEx")
			src<<output("--Ikkaku rage spin now increases your rage 75% more than before","FEx")
			src<<output("--Ikkaku can now use rush","FEx")
			src<<output("--Fujimaru slight damage nerf","FEx")
			src<<output("--Sui fengs rocket now ignores defence and does the users attack x10 in damage ","FEx")
			src<<output("--Sui fengs rocket cooldown now 40seconds and Rei drain increased to 2400 ","FEx")
			src<<output("--Sui fengs rocket now ignores defence and does the users attack x10 in damage ","FEx")
			src<<output("--Sui fengs shikai now attacks close to two times as fast ","FEx")
			src<<output("--Sui fengs banaki boost lowered to x2.5 ","FEx")
			src<<output("--Sui fengs shikai highered to x1.9 ","FEx")
			src<<output("--Inoues defence boost doubled in advanced fullbring","FEx")
			src<<output("--Jackie fullbring boost increased in advanced fullbring","FEx")
			src<<output("--Lightning zan's defence slightly increased","FEx")*/


/*			src<<output("----------Monday, November 10, 2014----------","FEx")
			src<<output("Fixed skillbar issues","FEx")
			src<<output("Fixed ranking issues","FEx")
			src<<output("Updated staff commands","FEx")
			src<<output("----------Sunday, November 9, 2014----------","FEx")
			src<<output("You can view all available smileys here: http://puu.sh/cKfPR/855daea3ae.png","FEx")
			src<<output("Can now use smileys in say,whisper and faction chat","FEx")
			src<<output("Numero arrancars and Espada Arrancars now give more experience","FEx")
			src<<output("Regular adjucha exp buffed","FEx")
			src<<output("Velocity of Fujimaru's melee attack in bankai decreased slightly","FEx")
			src<<output("Rogue shinigamis no longer required getting beaten to 100wounds before being killed","FEx")
			src<<output("Rogue shinigami exp increased 200-300%","FEx")
			src<<output("Rogue shinigami stat buff","FEx")
			src<<output("Vandenreich quincies give slightly more experience","FEx")
			src<<output("Sub-shinigamis no longer require to be koed","FEx")
			src<<output("Sub-shinigamis exp buff and stat buff","FEx")
			src<<output("Haizen given 80% damage boost","FEx")
			src<<output("Hinamori blasts buffed","FEx")
			src<<output("Hollows now do 400% melee damage untill they become arrancars","FEx")
			src<<output("Karakura main map updated","FEx")
			src<<output("Shonshui and Ukitake bankais now attack 50percent faster","FEx")
			src<<output("Komamura bankai defence boost increased drastically","FEx")
			src<<output("Hisagi boost in shikai and bankai increased","FEx")
			src<<output("Ulquiorra given a boost in defence","FEx")
			src<<output("Ulquiorra lanza del relampago buffed","FEx")
			src<<output("Nnoitra given a defence increase","FEx")
			src<<output("Vaizard scoreboards update upon login now","FEx")
			src<<output("Vaizard vasto mask no longer resets your boosts if you take it off","FEx")
			src<<output("Fullbring changer fixed","FEx")
			src<<output("Fujimaru icon fixed up and melee speed increased, melee attack does not go as far anymore","FEx")
			src<<output("--------------Saturday, November 2, 2014--------------","FEx")
			src<<output("Sados given a skill at level 800 which triples there defence","FEx")
			src<<output("New zans and resses in testing","FEx")
			src<<output("Vaizard can now use kidos","FEx")
			src<<output("Vaizard masks now boost significantly more","FEx")
			src<<output("Vaizard masks drain more","FEx")
			src<<output("Vaizard masks max mask uses(drain) moved to 1500","FEx")
			src<<output("Vaizard 33% success rate","FEx")
			src<<output("Vaizard requirement is now level 700","FEx")
			src<<output("Vaizard retake now purchasable in donor point shop","FEx")
			src<<output("Zaraki's shikai added in","FEx")
/*			src<<output("Zaraki melee buff","FEx")
			src<<output("Zarakis shikai given a new skill","FEx")
			src<<output("Added new zan (Chojiro Sasakibe) to Rei section.","FEx")
			src<<output("Fixed barragans aging balls.","FEx")
			src<<output("Added more screen resolutions.","FEx")
			src<<output("New area portal found in cross roads to enter, it is only 1/3 done and only 1/3 of the npcs and bosses have been added there the area will be finished at a later time.","FEx")
			src<<output("We've wiped due to all the bugs that have been going on, the community also seemed to want to wipe pretty badly-august 29 friday 2014.","FEx")
			src<<output("Bankai drain is now 2 times harder to master.","FEx")
			src<<output("Bankai now drains 2 times less rei.","FEx")
			src<<output("Shikai drain is now 5 times harder to master.","FEx")
			src<<output("Shikai drain drains three times less rei.","FEx")
			src<<output("Zommari ress boost boosted.","FEx")
			src<<output("Nnoitra ress boost boosted.","FEx")
			src<<output("Barragan ress boost boosted.","FEx")
			src<<output("Szayel ress boost boosted.","FEx")
			src<<output("Ulquiorra boost and regular melee attack boost.","FEx")
			src<<output("Starrk ress boost boosted.","FEx")
			src<<output("Dordoni (wind) ress boost boosted.","FEx")
			src<<output("Tijereta ress boost boosted.","FEx")
			src<<output("Three different adjucha type with there own benefeits.","FEx")
			src<<output("If your a small white wolf adjucha you recieve your own wolf, and if you further recieve the los lobos ressureccion(starrk) your wolfs have a lower cooldown.","FEx")
			src<<output("If your a panther type adjucha and get grimmjows ress later on desgarrons c/d is reduced to 12seconds instead of 23,you also recieve a small desgaron.","FEx")
			src<<output("If your a tall black adjucha your wind push cooldown is halfed and you recieve two new wind skills regardless of your ressureccion.","FEx")
			src<<output("<center>Some Quick Fixes</center>","FEx")
			src<<output("hollows can transform again--my bad sorry","FEx")
			src<<output("Yumichika draining allies fixed","FEx")
			src<<output("Fixed some spam bugs","FEx")
			src<<output("Censored some more offensive words</center>","FEx")
			src<<output("Added to shop","FEx")
			src<<output("<center>New mid level and low level boss coming","FEx")
			src<<output("<centerFirst official update log</center>","FEx")
			src<<output("-New Del Toro (bull) ressurecion","FEx")
			src<<output("-Fujimaru rasen higher c/d less blasts no longer spammable","FEx")
			src<<output("-Del Toro (bull) skill revamps underway...","FEx")
			src<<output("-Sado power blast visual change","FEx")
			src<<output("-Every sado arm recieves a buff","FEx")
			src<<output("-Del Toro ressurecion boost doubled","FEx")
			src<<output("-Volcanica boost increased","FEx")
			src<<output("-Barragan boost increased","FEx")
			src<<output("-Jackie fullbring boosted","FEx")
			src<<output("-Diablo besar and power blast damage boosted by a good amount","FEx")
			src<<output("-Sados passivly punch for more damagae","FEx")
			src<<output("-Can no longer damage teammates with Luppi","FEx")
			src<<output("-Can no longer drain a teammates reiatsu with Barragan or Yumichika","FEx")
			src<<output("-Muramasa release seal wound output lowered","FEx")
			src<<output("-Mayuri poison fog aoe slightly buffed and had a visual change","FEx")
			src<<output("-Mayuri poison fog has a cool down of 15 seconds instead of 23seconds","FEx")
			src<<output("-When shooting poison fog with mayuri's zanpakutou you are frozen for 1.5seconds instead of 4.8seconds","FEx")
			src<<output("-Fujimaru Zan added to reiatsu section","FEx")
			src<<output("-Fujimaru Zan now masterable","FEx")
			src<<output("-Rebirth mission and the Race wars story mode now updates your killcount more frequently (you dont have to relog or level up anymore)","FEx")
			src<<output("-New bankai release aura","FEx")
			src<<output("-Guilds are now fixed","FEx")
			src<<output("-Fujimaru Zan added","FEx")
			src<<output("-Fixed error with some skills not turning off","FEx")
			src<<output("-Revamped some turf icons","FEx")
			src<<output("-Ichigo bankai boosts attack stat by roughly 40% more","FEx")*/
			*/
	//	Donation()
	//		winshow(src,"DPBuy",1)
	//		src<<output(null,"DonorOut")
	//		src<<output("\n","DonorOut")
	//		src<<output("If you wish to purchase donor points, please send the money via paypal to: tanya.maroof@hotmail.com","DonorOut")
	//		src<<output("IMPORTANT: Please leave a note with your key and you will recieve your donor points","DonorOut")
	//		src<<output("Follow the link to visit Donate and get donor points. Once you transfer donor points to your key all sales are final and non-refundable.","DonorOut")
	//		src<<output("<a href='http://bwwa.twomini.com/BWWAGRBuy.php?userid=[src.ckey]'> Click Here to continue.</a>","DonorOut")
	//		src<<output("<a href='http://subscription-points.com/BWWAGRBuy.php?userid=[src.ckey]'> Click Here to continue.</a>","DonorOut")
		CloseDonor()
			set hidden=1
			winshow(src,"DPBuy",0)

		Use_Donor_Points()
			src.SpendDonorPoints()


/*		TestConnection()
			//set hidden=1
			if(!connected)
				world<<"Connection status: No connection to database -- [my_c.ErrorMsg()]"
				my_c=new
				connected=my_c.Connect(DBI,username,password)
			else
				world<<"Successful Connection to Databases. Donor points enabled."*/

	proc
		GetTeleport()
			if(teleport==0)
				teleport=1
				src<<"You have activated teleportation, this lasts for 48 hours real time and can only be used in safe areas."
			else
				src<<"You already have teleportation."

		GetFortune()
			if(fortune_expire<=world.time)
				active_fortune=0
			if(!active_fortune)
				active_fortune=1
				fortune_expire=HrDate(5)
				src<<"You've activated good fortune. Your money gains will increase by 50% for 5 hours."
			else
				src<<"You already have good fortune."


		GetExpBurst()
			if(exp_expire<=world.time)
				active_exp=0
			if(!active_exp)
				active_exp=1
				exp_expire=HrDate(2)
				src<<"You've activated exp burst. You will gain 25% more experience for 2 hours."
			else
				src<<"You already have exp burst active."

		CheckFortune()
			if(world.realtime>=fortune_expire&&active_fortune)
				src<<"Your good fortune has expired."
				fortune_expire=null
				active_fortune=0



		CheckBurst()
			if(!isnull(client))
				if(world.realtime>=exp_expire&&active_exp)
					src<<"Your exp. burst has expired."
					exp_expire=null
					active_exp=0

			/*	if(world.realtime>=exp_expire&&active_exp2)
					src<<"Your exp. burst has expired."
					exp_expire=null
					active_exp2=0
					src.gotxpburst=0	*/


		GainMoney(amt)
			if(active_fortune||src.squad==10)
				amt*=1.5
				src<<"<font color='red'>Money Bonus!</font>"
			money+=round(amt)
			src<<"You gained [round(amt)] money."
			CheckFortune()

		GainExp(amt)
			if(!isnull(client))
				if(active_exp||src.squad==10)
					amt*=1.25
					src<<"<font color='red'>EXP Bonus!</font>"
				exp+=round(amt)
				src<<"You gained [round(amt)] experience."
				CheckBurst()
				Level_Up()

			/*	if(active_exp2)
					amt*=1.5
					src<<"<font color='red'>Exp. burst Bonus!</font>"
				exp+=round(amt)
				src<<"You gained [round(amt)] experience."
				CheckBurst()
				Level_Up()	*/

		GainDP(amt)
			total_bought+=amt
			donor_points+=amt
			src<<"You were given [amt] Donor Points."

		ResetDonor()
			donor2levels=0	//2 levels everytime you level instead of 1					when set to 1
			donor4levels=0 //4 levels/lvl instead of 1 does not stack with x2 levels
			donorhalfexp=0 //half the required exp/level stacks with the multiple level boosts
			donorfreezans=0
			donorfreeress=0
			donorfreefb=0
			donor_points=0
			while(donorstat>0)
				rawbuff+=250
				mattack+=250
				mdefence+=250
				mreiatsu+=250
				donorstat--
			donorstat=0
			src<<"Your donor status has been reset."


		UseDP(var/amt)
			//if(donor_points>=5000)
			//	ResetDonor()
			//	return 0  dont need that anymore
			if(total_spent>=total_bought)//cheat check.
				donor_points=0
				total_spent=total_bought
				saveproc()
				return
				//
			if(donor_points>=amt)
				donor_points-=amt
				total_spent+=amt
				saveproc()
				qrx(key,amt,1)
				saveproc()
				return 1
			else
				src<<"You don't have [amt] donor points."
				return 0


		SpendDonorPoints()
			if(donor_points>0)
				DonorInfo()//"Eyes of God"
				var/i=input(src,"What would you like to purchase with your donor points?")as null|anything in list("2x Level Up","4x Level Up","Easier Leveling",
				"Free Zans","Vaizard Retake","Black Flames of God","Free Ress","Free Fullbring","Squad Change","Stat Up","Exp Burst","Good Fortune","Vasto Form Hollowification","Sado Arm","Boosted")
				switch(i)
					if("2x Level Up")
						if(donor2levels==0)
							if(UseDP(150))
								donor2levels=1
								src<<"You have unlocked 2x leveling, you now gain 2 levels/level."
						else
							src<<"You have already unlocked 2x Leveling."
					if("4x Level Up")
						if(donor4levels==0)
							if(UseDP(350))
								donor4levels=1
								src<<"You have unlocked 4x leveling."

						else
							src<<"You have already unlocked 4x Leveling."
					if("Easier Leveling")
						if(donorhalfexp==0)
							if(UseDP(150))
								donorhalfexp=1
								src<<"You have unlocked easier leveling (half the required exp to level up)."

						else
							src<<"You have already unlocked Easier Leveling."
					if("Free Zans")
						if(donorfreezans==0)
							if(UseDP(125))
								donorfreezans=1
								src<<"You have unlocked free zan changes."

						else
							src<<"You have already unlocked Free Zan changes."
					if("Free Ress")
						if(donorfreeress==0)
							if(UseDP(125))
								donorfreeress=1
								src<<"You have unlocked free ress changes."

						else
							src<<"You have already unlocked Free Ress changes."
					if("Free Fullbring")
						if(donorfreefb==0)
							if(UseDP(125))
								donorfreefb=1
								src<<"You have unlocked free fullbring changes."

						else
							src<<"You have already unlocked Free Fullbring changes."
					if("Vaizard Retake")
						if(UseDP(20))
							src.triedvai=0
							src.gotvai=0
							src<<"You may now attempt to retake your vaizard test."
					if("Squad Change")
						if(UseDP(30))
							src.status = ""
							src.statusold=""
							for(var/obj/items/equipable/Cloak/K in src)
								del K
								src.cloak=0
								src.Load_Overlays()
							usr.rep-=5000
							var/S=input(src,"Choose your squad.")in list(1,2,3,4,5,6,7,8,9,10,11,12,13,"Kido Corps")
							shiniCaptainList[S]=""
							src.squad=S
							src<<"Your squad has been set to squad : [squad]."
							if(squad == "Kido Corps"||squad==4)
								src.contents+=new/obj/skillcard/Kido_Corp_Heal
								src.RefreshSkillList()
							else
								var obj/skillcard/Kido_Corp_Heal/z = locate() in src.contents
								if(!isnull(z))
									src.contents-=z
							//	src.contents-=new/obj/skillcard/Kido_Corp_Heal
								src.RefreshSkillList()
					if("Vasto Form Hollowification")
						if(donormask==0)
							if(UseDP(350))
								donormask=1
								contents+=new/obj/skillcard/Vasto_FormDP
								src.RefreshSkillList()
								maskuses=1000
							//	world<<"Power surges through [src.name] as a syringe injects a monstrous DNA into him"
								src<<"Hollow genes have been added to your DNA and you can now transform into a Vasto rank Hollow.The hollow seems to be tamed and the mask is mastered"
						else
							src<<"You already have the vasto mask."
					if("Sado Arm")
						if(donorarm==0)
							if(UseDP(350))
								donorarm=1
								contents+=new/obj/skillcard/Sado_ArmDP
								src.RefreshSkillList()
								src<<"You have learned how to utilize the Devil's arm."
								world<<"Power surges through [src.name]"
						else
							src<<"You've already unlocked Sado Arm."
					if("Black Flames of God")
						if(src.blackflames==0)
							if(UseDP(300))
								src.blackflames=1
								contents+=new/obj/skillcard/Amaterasu
								src.RefreshSkillList()
								src<<"You've learned the skill used to slay the ONE"
						else
							src<<"You already have black flames."
/*					if("Eyes of God")
						if(src.eyesofgod==0)
							if(UseDP(1250))
								src.eyesofgod=1
								contents+=new/obj/skillcard/Rinnegan
								src<<"Your eyes feel different.."
								world<<"[src.name]'s eyes cause an earth quake as they awaken!"
						else
							src<<"You already have the eyes of god."*/
					if("Stat Up")
						if(UseDP(50))
							for(var/zzz=0;zzz<5;zzz++)
								donorstat++
								rawbuff+=150
								mattack+=150
								mdefence+=150
								mreiatsu+=150
							src<<"Attack,Reiatsu and Defence have all increased by <b>+900</b>,you've also gained a permanent stat CAP increase. This can be done multiple times."


				/*	if("Event Points")
						var/f=input(src,"How many donor points do you want to spend? The rate is 3 event points per 1 donor point. 10 donor points = 30 Event Points") as num
						var/h=min(f,donor_points)
						if(UseDP(h))
							eventpoints+=h*3
							src<<"You now have [eventpoints] event points."	*/

					if("Exp Burst")
						if(UseDP(50))
							GetExpBurst()

					if("Good Fortune")
						if(UseDP(50))
							GetFortune()

						else
							src<<"You are already have a fortune boost."

					else
						src<<"Feature coming soon."

				saveproc()
			else
				src<<"You don't have any donor points to spend."


		dClean(var/list/f)
			f-="donor2levels"
			f-="donor4levels"
			f-="donorhalfexp"
			f-="donorfreezans"
			f-="donorfreeress"
			f-="donorfreefb"
			f-="donor_points"
			f-="donorstat"
			f-="total_brought"
			f-="total_spent"
			return f

		AddDonorHuds()
			var/obj/DonorHud/Buy/A=new
			src.client.screen+=A
			var/obj/DonorHud/Claim/B=new
			src.client.screen+=B
			var/obj/DonorHud/Use/C=new
			src.client.screen+=C


		RetrDP()//query the database to get golden ryo.
			alert(src,"This will collect any Donor Points you have purchased via-paypal.By agreeing you confirm that your purchase of Donor points is  a donation towards the game and cannot in any way shape or form be refunded. Also please note that if your save is corrupted, the donor points *may* disappear along with it so please bear that in mind. It's not the owner ,coder or hosts obligation to restore lost or corrupted donor points!")
			var/confirm=input("Do you want to collect your Donor Points at this time?") as null|anything in list("Yes.","No.")
			if(isnull(confirm))
				return
			else
				if(confirm=="Yes.")
					alert( src, "Sorry Donor Point system is offline at the moment. Contact Devil for information regarding Donor Points.")
					/*var/DBQuery/query=my_c.NewQuery("SELECT `donorpoints` FROM `bwwa_purchase` WHERE `userid`='[src.ckey]' LIMIT 1")
					query.Execute()
					if(!isnull(query))
						if(query.RowCount()>0)
							query.NextRow()
							var/list/x=query.GetRowData()
							var/amount=text2num(x["donorpoints"])//must change it to a number to get it to work.
							if(conversion_rate>0)
								var/v=conversion_rate/100
								amount=v*text2num(amount)
								GainDP(amount)
								src<<"You got extra donor points due to the sales day!"
							else
								GainDP(amount)
							saveproc()
							var/DBQuery/query2=my_c.NewQuery("UPDATE `bwwa_purchase` SET  `donorpoints` =  '0' WHERE  `userid` =  '[src.ckey]';")
							query2.Execute()//
							alert(src,"You received [amount] Donor Points. Thank you. Come again!")*/
					//else
						//alert(src,"Error connecting to database, please notify Zagros5000 or Awesome93 citing database issues.")
				else
					alert(src,"Use Donor Points to give your character a competitive edge above all others, come again.")






