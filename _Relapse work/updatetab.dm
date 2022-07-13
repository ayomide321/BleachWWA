mob/player
	verb
		Update()
			var/window = {"
<STYLE>BODY {background: black; color: white}</STYLE>
<html>
<body>
<left>
<font size=3>
<font face=cambria>
<br>
<br>
<br><font size=5>-Aw shit...here we go again.
<br>
<br>
<br>
<u>07/12/2022 Updates<font size=4></u>
<br><font size=2>-Added more ranks to take from Auto Ranker
<br><font size=2>-Fixed bug where not all events gave DP
<br><font size=2>-Added clothes to NPC
<br><font size=2>-Minor bug fixed and adjustments
<br><font size=2>-Fixed the abundance of unecessary admins
<br><font size=2>-Fixed some residual DP
<br><font size=2>-Lowered Labs EP reward from 200 to 75, but buffed DP reward from 0 to 20
<br><font size=2>-Squad 10 now gets 40 DP from complering labs
<br><font size=2>-Edited available skills to use for Auto Tests
<br>
<br>
<u>07/10/2022 Updates<font size=4></u>
<br><font size=2>-Made DP Shop Fuses only to shorten the list
<br><font size=2>-Added Captain Test fella, no need to wait on admin just talk to him and ask for the test
<br><font size=2>-Events now give DP. Gotei/Espada/CTF give 3, every other one gives 1
<br><font size=2>-Rare and above chests now give DP (Golden, Dungeon, Crown Prince, Boss Yama)
<br>
<br>
<u>07/07/2022 Updates<font size=4></u>
<br><font size=3>-Every update now and henceforth is the work of Throm your BWWA god.
<br><font size=2>-I never thought I'd be the one to do it, but yes DP is confirmedly revamped anybody can get it now :)
<br><font size=2>-There's an DP NPC somewhere around the map just talk to him and he will give you what you need if you can afford it
<br><font size=2>-Demon Boss of Hell, Mr. Brazo now drops DP Sado Arm again (0.5% drop rate)
<br><font size=2>-If you're wondering where your DP, customs, and stats are, I took it away <3. Work like the rest of us.
<br>
<br>
<u>Changes<font size=4></u>
<br><font size=2>-All updates and fixes listed below are the work of Relapse(Devilminion528). his efforts are highly appreciated!
<br><font size=2>-Captain test NPC will aggro against Shinigami now
<br><font size=2>-Squad 10 exp and money boost perk from missions changed to a boost from everything(Money * 1.5, EXP * 1.25)
<br><font size=2>-Fixed Garganta sometimes bugging out
<br><font size=2>-Added a verb to commands tab called "Track Leaders" that will display to you the GM Captain Tracker telling you the names of each captain and their squad and those that are kth, demigod, etc
<br><font size=2>-Fixed Aizen room portal not clearing your safe zone var
<br><font size=2>-Squad changing to 4 should now give Kido Corp heal as supposed to
<br><font size=2>-Squad changing from Kido Corps/Squad 4 will now remove your Kido Corp heal as supposed to
<br><font size=2>-Fixed EP ress/zan change bug
<br><font size=2>-Basement reward from killing a hero upped to 3 event points
<br><font size=2>-Fire bount fire burning set to last 6 secs/6 ticks and lowered the cooldown
<br><font size=2>-Added unlimited zan/ress selections(not random) to the store for 600 event points. Once bought you get a verb that brings up the zans or ress to select from
<br><font size=2>-Your boss kills are now shown to you at the bottom of the stats tab
<br><font size=2>-Jomon up time slightly lowered and cooldown decreased
<br><font size=2>-Added a message for when Hougyoku turns off/toggled off
<br><font size=2>-Squad 6 perks added: 20% boost in Reiatsu and 10% boost in defence when using Bankai
<br><font size=2>-Espada rank boost lowered to 20% boost in all stats after using Ressurection
<br><font size=2>-King of Huecho Mundo rank boost changed to 40% boost in all stats after using Ressurection
<br><font size=2>-Fixed squads 1, 8, and 11 giving bigger boosts than intended
<br><font size=2>-Portal added to Aizen rooms to easily leave the building without redoing maze/using stuck
<br><font size=2>-Fixed getting negative 1500 stats when turning vasto
<br><font size=2>-Fixed a bug where if you turned vasto then respec'd you didn't get your +1500 reiatsu back
<br><font size=2>-Zan selection in the store changed to Zan/Ress selection
<br><font size=2>-Espada rank given a boost of each stat*1.5 upon entering ressurection
<br><font size=2>-Added a store verb with items for x amount of event points(still adding to it)
<br><font size=2>-Mugetsu doesn't work on Yammamoto boss anymore
<br><font size=2>-Life contract shouldnt work on any npcs anymore
<br><font size=2>-Fixed Samurai skills not being given as they should be
<br><font size=2>-Samurai attack delay lowered
<br><font size=2>-NPC should no longer be able to attack when ko'd
<br><font size=2>-Garganta cooldown lowered to 10 seconds
<br><font size=2>-Samurai King hat saves after rebirthing
<br><font size=2>-To enter Yammamoto Boss room, you need level 800, 10 kills of Samurai King, Lorelei, Gate Creator, and Brazo each, and 30 Crown Prince kills
<br><font size=2>-Added another boss room next to the current with 3 Brazo and 3 Gate Creators
<br><font size=2>-Shinigami Squads with perks will be shown to you before joining such squad
<br><font size=2>-Swamp Monster given a 30% chance to drop a Medium chest and 25% chance to drop a Rare chest
<br><font size=2>-Players under level 900 who kill Swampy will gain an extra 25% of their required EXP to level on top of the EXP Swampy gives
<br><font size=2>-Players under level 950 who kill Brazo will gain an extra 33% of their required EXP to level on top of the EXP Brazo gives
<br><font size=2>-Increased EXP given for killing Brazo Izquierda Del Diablo
<br><font size=2>-Brazo Izquierda Del Diablo given a 40% chance to drop a Medium chest and 30% chance to drop a Rare chest
<br><font size=2>-Aura added to Quincys Vandenreich Power skill
<br><font size=2>-Dungeon timer increased to 50 minutes
<br><font size=2>-Dungeons set to give 10 levels for killing 1 boss, 15 levels for killing 2 bosses, and 20 levels for killing 3 bosses
<br><font size=2>-Diagonal attacking fixed
<br><font size=2>-Dungeon level requirement lowered to 600
<br><font size=2>-Buffed power transfer
<br><font size=2>-Unohana melee nerf
<br><font size=2>-Boost bug fixed
<br><font size=2>-Fail safe check added to vai retake purchase
<br><font size=2>-Certain attack zans made less 'rare'
<br><font size=2>-Ichimaru Secret Skill tweak
<br><font size=2>-Creating multiple dungeon parties bug fixed(clicking 1 time then again and fast clicking the verb)
<br><font size=2>-Sending multiple dungeon party invites bug fixed
<br><font size=2>-Slight Quincy nerf
<br><font size=2>-Captain and Captain Commander perks should be fixed
<br><font size=2>-Arena challenge no longer brings up all those questions and is simply accept or decline
<br><font size=2>-Sado DP Arm boost bug fixed
<br><font size=2>-The Hougyoku should now return to you after rebirthing after picking evil
<br><font size=2>-Every fullbring given a melee damage buff when in regular and advanced fullbring
<br><font size=2>-After death from/outside events or winning events, every(might be missing some) boosts should turn off so you can just turn them back on without having to double click the skill or logging off
<br><font size=2>-Removed all the spammy AI text when talking
<br><font size=2>-Events set to occur every 20 minutes
<br><font size=2>-Leveling exp requirement slightly lowered after level 800+
<br><font size=2>-Sado scoreboard should be fixed
<br><font size=2>-Fixed events not starting
<br><font size=2>-Fixed Fire Sword and Dual Zangetsu not using the Sword Slash animation without having a sword equipped
<br><font size=2>-Changed firesword icon and attacking with it equipped will shoot Fire Slashes
<br>
<br><font size=2>-(DarkyYuuya idea)Added a new boss: Genryusai Shigekuni Yamamoto
<br>A boss even stronger than the Crowned Prince!?
<br>Defeating this boss grants great level experience and he leaves behind a Fire Sword and a technique: Fire Slash after his death
<br>
<br><font size=2>-Fixed Quincy Bankai Extraction learning and keeping Yammamoto zan skills
<br><font size=2>-Zan and melee buffs I did will no longer count toward NPCs
<br><font size=2>-Added a verb under party tab to toggle party invites. When toggled on to no longer receive party invites that person will no longer show on the invite list
<br><font size=2>-Events being hosted font size increased
<br><font size=2>-Added a verb for party leaders to give someone else the leader position to avoid constant party remakes when having to leave
<br><font size=2>-Quincy Final fixed
<br><font size=2>-Ikkaku Bankai now gives a boost
<br><font size=2>-Fixed Kira Shikai typo which gave negative defence
<br><font size=2>-Fixed Ichigo event not giving 3 levels
<br><font size=2>-Fixed being stuck after beating Ishida
<br><font size=2>-Kensei secret skill damage buffed
<br><font size=2>-Dungeon level requirement lowered to 800
<br><font size=2>-Fixed Soi Fon Rocket skill damaging the user and nerfed the damage
<br><font size=2>-More Zan buffs
<br><font size=2>-Kensei melee damage buffed
<br><font size=2>-Yumichika Shikai and Bankai boost buffed
<br><font size=2>-Yumichika melee damage increased and when in Bankai has a chance to cause injury to someone when attacking
<br><font size=2>-Fixed inf EP bug(Thanks Throm)
<br><font size=2>-Samurai Fullbring added to Attack option
<br>
<br><font size=2>-Yammamoto Zan now available under "Rei" type Zan selection
<br>Cremation given upon activating Shikai
<br>Shoen given upon activating Bankai
<br>Fortress Blaze given at a certain level
<br>
<br><font size=2>-Jackie added to Attack Fullbring
<br><font size=2>-DZ buff boosted
<br><font size=2>-Fixed Vandenreich Aura and Quincys are now given Vandenreich Aura at level 600
<br><font size=2>-Boost buff given to Quincy Bow
<br><font size=2>-Quincy bow no longer gives negative Reiatsu when toggling it off
<br><font size=2>-Increased exp gained from NPC and lowered exp requirement at certain level points
<br><font size=2>-Fixed respec not giving levelpoints
<br><font size=2>-Quincy rei drain when attacking lowered
<br><font size=2>-Vaizard scoreboard increased to 10 ranking spots
<br><font size=2>-Gin zan given a melee buff in shikai and bankai
<br><font size=2>-Unohana given a melee damage buff when using Bankai
<br><font size=2>-Unohana "ramming" damage increased but given a 2.5 second cooldown each ram
<br><font size=2>-Unohana will now get Bum Rush when activating Shikai
<br><font size=2>-Kido 90 cooldown lowered to 30 seconds
<br><font size=2>-Unohana and Soi Fon given a melee damage buff in Shikai and Bankai
<br><font size=2>-Garganta and Kido 90 enabled for every Bankai that it was disabled for
<br><font size=2>-Renji run speed increased in Bankai
<br><font size=2>-Tousen melee damage buffed
<br><font size=2>-Reigai event player requirement to start lowered to 2
<br><font size=2>-CTF exp reward slightly increased and added a reward for the losing team
<br><font size=2>-Sado Arm1 nerfed
<br><font size=2>-Sado melee damage nerfed
<br><font size=2>-Zaraki, Ikkaku, Rangiku, Unohana, Shonshui, Ukitake, and Ichigo melee damage given a buff
<br><font size=2>-Fixed transforming into Vasto Lorde Reiatsu boost increasing your current Reiatsu rather than your max Reiatsu
<br><font size=2>-Hinamori attack blast toggle skill given upon activating shikai
<br><font size=2>-Kenpachi defence boost slightly increased
<br><font size=2>-Yukio Save will now show the amount of uses you have in your stats
<br><font size=2>-Fixed Sado Arm 2 boost being bigger than Arm 3
<br><font size=2>-Squad 11 attack boost buffed
<br><font size=2>-Non dp boss room bosses buffed
<br><font size=2>-Increased level points given after second rebirth
<br><font size=2>-Training Mask uses increased from 0.15 gains
<br><font size=2>-Mask and Vasto Mask drain lowered
<br><font size=2>-Shonshui melee damage given a slight buff
<br><font size=2>-Hinamori attack delay decreased
<br><font size=2>-Hinamori rei drain when attacking removed
<br><font size=2>-Hinamori given a skill that allows the user to toggle the Blast when attacking off for regular melee hits, damage based off your Reiatsu
<br><font size=2>-Soi Fon rocket damage increased by 5.5, cooldown lowered to 25 seconds, and rei cost lowered to 1500
<br><font size=2>-Nnoitra melee damage given a buff
<br><font size=2>-Mayuri Poison now has a chance to injure your arm, body, or stun you based on the passives multiplied by 3 for each one(max 15%  chance)
<br><font size=2>-Both Shonshui and Ukitake bankai will now double hit as their Shikai does, but the second hit in Bankai will be weaker than the first
<br><font size=2>-Inoue Heal cooldown lowered to 15 seconds
<br><font size=2>-Inoue shield uses for Santen Kesshun lowered from 200 to 100
<br>
<br><font size=2>-Quincy now have their own town filled with Quincy NPC protecting their home
<br>	-Removed Quincy area that was on earth
<br>	-To access the area, you have to go to where the old area was before and go to the left
<br>	-*Unfinished*
<br>
<br><font size=2>-Fixed 'Blank' NPCs icon incorrectly showing on other NPCs
<br><font size=2>-Removed having to leave party to join events
<br><font size=2>-Lowered Dual Zangetsu drop
<br>
<br><font size=2>-Added a boss room for those with no DP/Custom:
<br>	-Some players being allowed in that isn't too unfair
<br>	-Entrance is right next to the normal boss room entrance
<br>	-Boss NPCs in this boss room are nerfed but lowered the amount of Samurai King, Gate Creator, and Lorelei inside down to 1
<br>	-Respawn time lowered a tad bit for the Boss NPCs
<br>
<br><font size=2>-Sado Tekkai boost buffed and is now given at level 600 as it says
<br><font size=2>-Vaizard retake cost lowered to 300,000 money and 15 event points
<br><font size=2>-Being Evil and activating the Hougyoku no longer gives 50 wounds
<br><font size=2>-Kido Corp heal given upon joining the Kido Corp
<br><font size=2>-Arrancar Release, Vasto Form, and Inner Mode boosts buffed
<br><font size=2>-Dual Zangetsu boost changed to a static 35,000 and the drop rate from killing Lorelei increased based upon amount of Lorelei kills
<br><font size=2>-More Quincy NPCs added to map below Quincy building
<br><font size=2>-More Sado NPCs added toward the left side of Hell entrance and more Fullbring NPCs toward the right
<br><font size=2>-Enabling Flash Step won't disable when logging out
<br><font size=2>-Reitatsu blast damage increased a bit and rei requirement lowered to 50
<br><font size=2>-Sado Arms 1,2, and 3 boosts increased and each Sado technique rei cost lowered
<br><font size=2>-During the 'Rebirth' storyline, each NPC kill requirement lowered to 100 and player PVP kill requirement removed
<br><font size=2>-Hollow Vasto transformation lowered to level 500
<br><font size=2>-Removed underwear and fubu shoe prizes from chest
<br><font size=2>-Storyline Kenpachi health slightly decreased
<br><font size=2>-Experience gained from majority NPC increased
<br><font size=2>-Power Transfer now only works in Advaned Fullbring mode
<br><font size=2>-Sado blast nerfed a bit
<br><font size=2>-Removed update log and donor info popping up upon login
<br><font size=2>-When rebirthing you no longer lose your money and event points
<br><font size=2>-Swamp Monster respawn time lowered
<br><font size=2>-Sharingan saves after rebirthing


<br>
</b>
</font>
</center>
</body>
</html>
</b>
</font>
</center>
</body>
</html>
"}
			usr<<browse(window,"window=Game;size=650x500")
			..()




maptag
	icon = 'Icons/maptag_marker.dmi'
	layer = 100

	// Maptags are objs (So they show on the map)
	parent_type = /obj

	// Make maptags completely invisible.
	// Since their sole purpose is to mark a location,
	// players don't need to ever interact with them.
	invisibility = 101

proc
	// Find the turf a maptag is on
	locate_tag(tag as text)
		// Find the maptag object
		var/maptag/tag_obj = locate(tag)

		// If the tag isn't there, something is obviously wrong
		// So crash the proc to get debug info
		if(!tag_obj)
			//alternatively disabling of broken warps without crashing
			usr << "Maptag not found: [tag]"
			return 0
			CRASH("Maptag not found: \"[tag]\"")

		// Return the turf the maptag object is on
		return tag_obj.loc


/*mob/var/tmp/aurazaron =0
mob/player/verb
	ToggleZaraki()
		set category="Owner"
		if(usr.aurazaron)
			usr.aurazaron=0
			usr-=/obj/Zanpakutou/ZaShikai1
			usr-=/obj/Zanpakutou/ZaShikai2
			usr-=/obj/Zanpakutou/ZaShikai3
			usr-=/obj/Zanpakutou/ZaShikai4
			usr-=/obj/Zanpakutou/ZaShikai5
			usr-=/obj/Zanpakutou/ZaShikai6
			usr-=/obj/Zanpakutou/ZaShikai7
			usr-=/obj/Zanpakutou/ZaShikai8
			usr-=/obj/Zanpakutou/ZaShikai9
			usr -= /obj/rage
			usr -= /obj/rage1	*/
