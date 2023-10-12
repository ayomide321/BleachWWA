mob
	var
		relapseAutographReq=300
		relapseAutographs=0
		hellArmorReq=15
		hellArmors=0
		karukaHeroReq=150
		karakuraHeroKills=0
		playerEssenceReq=100
		currentPlayerEssence=0
		playerEssence=""
		hiddenQuest="???"
		eventsWon=0
		eventsWonReq=100
		timesRebirthedReq=5
		completionPercentage=0
		fuseCountReq=3
		yammaSwordReq=1
		dualSwordReq=1
		SKHatReq=1
		leaderKillReq=4
		leaderKills=0


		canBeGODOFBWWA=0
		GODOFBWWA=0

	proc
		GiveGodReqs(mob/M)
			M.relapseAutographs=M.relapseAutographReq+1
			M.hellArmors=M.hellArmorReq+1
			M.timesRebirthed=M.timesRebirthedReq+1
			M.eventsWon=M.eventsWonReq+1
			M.currentPlayerEssence=M.playerEssenceReq+1
			M.karakuraHeroKills=M.karukaHeroReq+1
			M.fuseCount=M.fuseCountReq+1

	proc
		GetCompletionPercentage()
			completionPercentage = ((min(relapseAutographs,relapseAutographReq)/relapseAutographReq)*15) + ((min(hellArmors,hellArmorReq)/hellArmorReq)*15) + ((min(karakuraHeroKills,karakuraHeroKills)/karukaHeroReq)*15) + ((min(currentPlayerEssence,playerEssenceReq)/playerEssenceReq)*15) + ((min(eventsWon,eventsWonReq)/eventsWonReq)*15) + ((min(timesRebirthed,timesRebirthedReq)/timesRebirthedReq)*25)
			completionPercentage = min(100, completionPercentage)
			completionPercentage = (completionPercentage * 0.95) + ((min(fuseCount, fuseCountReq)/fuseCountReq)*5)

