


#warn Come back and look at Sado scoreboard not updating as should like the other boards


/var/const/
	scoreboard={""}
	scoreboardtitle={"<STYLE>BODY {background: black;		color: white}</STYLE><head><title>Scoreboard</title></head></body>"}
/Rank_Entry/
	var{Name;Key;Level;Kills;Rep;Status;Date}
	New(mob/person)
		if(!person)return
		Name=(person.name)
		Key=(person.key)
		Level=(person.level)
		Kills=(person.kills)
		Rep=(person.rep)
		Status=(person.status)
		Date=(time2text(world.realtime))
/Rank_EntryRace/
	var{Name;Key;Level;Date;Race;Kills;Ftype}
	New(mob/person)
		if(!person)return
		Name=(person.name)
		Key=(person.key)
		Level=(person.level)
		Kills=(person.kills)
		Race=(person.race)
		Date=(time2text(world.realtime))
		Ftype=(person.ftype)
/proc/
	KillsRankingDisplay(var/mob/person)
		var/list/kills=new()
		var/savefile/F=new("kills.sav")
		F[("stuff")]>>(kills)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!kills)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Kills</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to kills.len)
				var{character=(kills[(number)]);Rank_Entry/player=(kills[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[num2text(round(player.Kills),100)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Kills_Ranking(var/mob/player)
		if(!player||!player.client)return
		var/savefile/F=new("kills.sav")
		var/list/kills=new()
		F[("stuff")]>>(kills)
		if(!kills)kills=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=kills.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(kills[(character)])
			if(old.Kills>=player.kills)return score
			while(score>1)
				last=kills[(kills[(score-1)])]
				if(last.Kills>=player.kills)break
				kills[(score)]=(kills[(score-1)])
				kills[(--score)]=(character)
				kills[(kills[(score+1)])]=(last)
			kills[(character)]=(newest)
			F[("stuff")]<<(kills)
			return score
		score=(kills.len)
		if(score>=20)
			last=(kills[(kills[(score)])])
			if(last.Kills>=player.kills)return 21
			kills[(score)]=(character)
		else score=(kills.len+1),kills+=(character)
		while(score>1)
			last=(kills[(kills[(score-1)])])
			if(last.Kills>=player.kills)break
			kills[(score)]=(kills[(score-1)])
			kills[(--score)]=(character)
			kills[(kills[(score+1)])]=(last)
		kills[(character)]=(newest)
		F[("stuff")]<<(kills)
		return score
	Quincy_RankingDisplay(var/mob/person)
		var/list/levels=new()
		var/savefile/F=new("quincys.sav")
		F[("stuff")]>>(levels)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!levels)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Race</th><th>Level</th></tr>\n<br>"
			for(var/number in 1 to levels.len)
				var{character=(levels[(number)]);Rank_EntryRace/player=(levels[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Race)]</td><td>[num2text(round(player.Level),100)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Quincy_Ranking(var/mob/player)
		if(!player||!player.client)return
		if(player.karakuraheroplayer)return
		if(player.humanleader)return
		if(player.issternr)return
		if(player.issternrleader)return
		if(player.newquincyking)return
		if(player.race!="Quincy")return
		var/savefile/F=new("quincys.sav")
		var/list/level=new()
		F[("stuff")]>>(level)
		if(!level)level=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=level.Find(character)
			Rank_EntryRace/newest=new(player)
			Rank_EntryRace/last}
		if(score)
			var/Rank_EntryRace/old=(level[(character)])
			if(old.Level>=player.level)return score
			while(score>1)
				last=level[(level[(score-1)])]
				if(last.Level>=player.level)break
				level[(score)]=(level[(score-1)])
				level[(--score)]=(character)
				level[(level[(score+1)])]=(last)
			level[(character)]=(newest)
			F[("stuff")]<<(level)
			if(score==1)
				player.status = "<font color = #78f0e7>Quincy Elder</font>"
			if(score>1)
				player.status = "<font color = #78f0e7>[score]th Elite Quincy</font>"
				if(score==2)
					player.status = "<font color = #78f0e7>[score]nd Elite Quincy</font>"
				if(score==3)
					player.status = "<font color = #78f0e7>[score]rd Elite Quincy</font>"
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
			return score
		score=(level.len)
		if(score>=5)
			last=(level[(level[(score)])])
			if(last.Level>=player.level)return 6
			level[(score)]=(character)
		else
			score=(level.len+1)
			level+=(character)
			if(score==1)
				player.status = "<font color = #78f0e7>Quincy Elder</font>"
			if(score>1)
				player.status = "<font color = #78f0e7>[score]th Elite Quincy</font>"
				if(score==2)
					player.status = "<font color = #78f0e7>[score]nd Elite Quincy</font>"
				if(score==3)
					player.status = "<font color = #78f0e7>[score]rd Elite Quincy</font>"
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
		while(score>1)
			last=(level[(level[(score-1)])])
			if(last.Level>=player.level)break
			level[(score)]=(level[(score-1)])
			level[(--score)]=(character)
			level[(level[(score+1)])]=(last)
		level[(character)]=(newest)
		F[("stuff")]<<(level)
		return score
	Xcution_RankingDisplay(var/mob/person)
		var/list/levels=new()
		var/savefile/F=new("xcutions.sav")
		F[("stuff")]>>(levels)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!levels)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Fullbring</th><th>Level</th></tr>\n<br>"
			for(var/number in 1 to levels.len)
				var{character=(levels[(number)]);Rank_EntryRace/player=(levels[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Ftype)]</td><td>[num2text(round(player.Level),100)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Xcution_Ranking(var/mob/player)
		if(!player||!player.client)return
		if(player.karakuraheroplayer)return
		if(player.humanleader)return
		if(player.race!="Fullbringer")return
	//	if(player.race=="Sado"||player.race=="Chad")return
		var/savefile/F=new("xcutions.sav")
		var/list/level=new()
		F[("stuff")]>>(level)
		if(!level)level=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=level.Find(character)
			Rank_EntryRace/newest=new(player)
			Rank_EntryRace/last}
		if(score)
			var/Rank_EntryRace/old=(level[(character)])
			if(old.Level>=player.level)return score
			while(score>1)
				last=level[(level[(score-1)])]
				if(last.Level>=player.level)break
				level[(score)]=(level[(score-1)])
				level[(--score)]=(character)
				level[(level[(score+1)])]=(last)
			level[(character)]=(newest)
			F[("stuff")]<<(level)
			if(score==1)
				player.status = "<font color = #db17db>Xcution Leader</font>"
			if(score>1)
				player.status = "<font color = #db17db>[score]th Ranked Xcutioner</font>"
				if(score==2)
					player.status = "<font color = #db17db>[score]nd Ranked Xcutioner</font>"
				if(score==3)
					player.status = "<font color = #db17db>[score]rd Ranked Xcutioner</font>"
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
			return score
		score=(level.len)
		if(score>=5)
			last=(level[(level[(score)])])
			if(last.Level>=player.level)return 6
			level[(score)]=(character)
		else
			score=(level.len+1)
			level+=(character)
			if(score==1)
				player.status = "<font color = #db17db>Xcution Leader</font>"
			if(score>1)
				player.status = "<font color = #db17db>[score]th Ranked Xcutioner</font>"
				if(score==2)
					player.status = "<font color = #db17db>[score]nd Ranked Xcutioner</font>"
				if(score==3)
					player.status = "<font color = #db17db>[score]rd Ranked Xcutioner</font>"
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
		while(score>1)
			last=(level[(level[(score-1)])])
			if(last.Level>=player.level)break
			level[(score)]=(level[(score-1)])
			level[(--score)]=(character)
			level[(level[(score+1)])]=(last)
		level[(character)]=(newest)
		F[("stuff")]<<(level)
		return score
	RankingDisplay(var/mob/person)
		var/list/levels=new()
		var/savefile/F=new("levels.sav")
		F[("stuff")]>>(levels)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!levels)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Level</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to levels.len)
				var{character=(levels[(number)]);Rank_Entry/player=(levels[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[num2text(round(player.Level),100)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Ranking(var/mob/player)
		if(!player||!player.client)return
		var/savefile/F=new("levels.sav")
		var/list/level=new()
		F[("stuff")]>>(level)
		if(!level)level=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=level.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(level[(character)])
			if(old.Level>=player.level)return score
			while(score>1)
				last=level[(level[(score-1)])]
				if(last.Level>=player.level)break
				level[(score)]=(level[(score-1)])
				level[(--score)]=(character)
				level[(level[(score+1)])]=(last)
			level[(character)]=(newest)
			F[("stuff")]<<(level)
			return score
		score=(level.len)
		if(score>=10)
			last=(level[(level[(score)])])
			if(last.Level>=player.level)return 11
			level[(score)]=(character)
		else score=(level.len+1),level+=(character)
		while(score>1)
			last=(level[(level[(score-1)])])
			if(last.Level>=player.level)break
			level[(score)]=(level[(score-1)])
			level[(--score)]=(character)
			level[(level[(score+1)])]=(last)
		level[(character)]=(newest)
		F[("stuff")]<<(level)
		return score
	Espada_Ranking(var/mob/player)
		if(!player||!player.client)return
		if(player.karakuraheroplayer)return
		if(player.humanleader)return
		if(player.newhollowking)return
		if(player.isEspadaLeader)return
		if(player.race!="Arrancar")return
		var/savefile/F=new("espadas.sav")
		var/list/level=new()
		F[("stuff")]>>(level)
		if(!level)level=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=level.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(level[(character)])
			if(old.Level>=player.level)return score
			while(score>1)
				last=level[(level[(score-1)])]
				if(last.Level>=player.level)break
				level[(score)]=(level[(score-1)])
				level[(--score)]=(character)
				level[(level[(score+1)])]=(last)
			level[(character)]=(newest)
			F[("stuff")]<<(level)
			player.espadas="<font color = #fb0505>Espada #[score]</font>"
			if(player.espadas!=player.espadasold)
				player.espadasold="<font color = #fb0505>Espada #[score]</font>"
				world << "<b><font color = lime>Espada Info: [player] is now [player.espadas]!"
				player.zisanespada=1
			return score
		score=(level.len)
		if(score>=10)
			last=(level[(level[(score)])])
			if(last.Level>=player.level)return 11
			level[(score)]=(character)
		else
			score=(level.len+1)
			level+=(character)
			player.espadas="<font color = #fb0505>Espada #[score]</font>"
			if(player.espadas!=player.espadasold)
				player.espadasold="<font color = #fb0505>Espada #[score]</font>"
				world << "<b><font color = lime>Espada Info: [player] is now [player.espadas]!"
				player.zisanespada=1
		while(score>1)
			last=(level[(level[(score-1)])])
			if(last.Level>=player.level)break
			level[(score)]=(level[(score-1)])
			level[(--score)]=(character)
			level[(level[(score+1)])]=(last)
		level[(character)]=(newest)
		F[("stuff")]<<(level)
		player.espadas="<font color = #fb0505>Espada #[score]</font>"
		if(player.espadas!=player.espadasold)
			player.espadasold="<font color = #fb0505>Espada #[score]</font>"
			world << "<b><font color = lime>Espada Info: [player] is now [player.espadas]!"
		if(score<=10)
			player.verbs+=/mob/espada/verb/Make_Fraccion
			if(!player.squadid)
				player.squadid=rand(1,9999999999999999999999999999999999999999999999999999999999999999999999999999999)
		return score
	EspadaRankingDisplay(var/mob/person)
		var/list/espadas=new()
		var/savefile/F=new("espadas.sav")
		F[("stuff")]>>(espadas)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!espadas)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Number</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to espadas.len)
				var{character=(espadas[(number)]);Rank_Entry/player=(espadas[(character)])}
				html+="<tr><td><u>Espada #[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	SquadsRankingDisplay(var/mob/person)
		var/list/squad1=new()
		var/savefile/F=new("squad1.sav")
		var/html="<center><TABLE BORDER=2><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		F[("stuff2")]>>(squad1)
		if(!squad1)html+="<TR><TD>Nobody in squad 1.</TD></TR>\n"
		else
			html+="<tr><th><B>Squad 1</th></tr>\n<br>"
			for(var/number in 1 to squad1.len)
				var{character=(squad1[(number)]);Rank_Entry/player=(squad1[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		var/list/squad2=new()
		var/savefile/Fd=new("squad2.sav")
		Fd[("stuff2")]>>(squad2)
		if(!squad2)html+="<TR><TD>Nobody in squad 2.</TD></TR>\n"
		else
			html+="<tr><th><B>Squad 2</th></tr>\n<br>"
			for(var/number in 1 to squad2.len)
				var{character=(squad2[(number)]);Rank_Entry/player=(squad2[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		var/list/squad3=new()
		var/savefile/Fs=new("squad3.sav")
		Fs[("stuff2")]>>(squad3)
		if(!squad3)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>Squad 3</th></tr>\n<br>"
			for(var/number in 1 to squad3.len)
				var{character=(squad3[(number)]);Rank_Entry/player=(squad3[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		var/list/squad4=new()
		var/savefile/Fdd=new("squad4.sav")
		Fdd[("stuff2")]>>(squad4)
		if(!squad4)html+="<TR><TD>Nobody in squad 4.</TD></TR>\n"
		else
			html+="<tr><th><B>Squad 4</th></tr>\n<br>"
			for(var/number in 1 to squad4.len)
				var{character=(squad4[(number)]);Rank_Entry/player=(squad4[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		var/list/squad5=new()
		var/savefile/Fdds=new("squad5.sav")
		Fdds[("stuff2")]>>(squad5)
		if(!squad5)html+="<TR><TD>Nobody in squad 5.</TD></TR>\n"
		else
			html+="<tr><th><B>Squad 5</th></tr>\n<br>"
			for(var/number in 1 to squad5.len)
				var{character=(squad5[(number)]);Rank_Entry/player=(squad5[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		var/list/squad6=new()
		var/savefile/Fddf=new("squad6.sav")
		Fddf[("stuff2")]>>(squad6)
		if(!squad6)html+="<TR><TD>Nobody in squad 6.</TD></TR>\n"
		else
			html+="<tr><th><B>Squad 6</th></tr>\n<br>"
			for(var/number in 1 to squad6.len)
				var{character=(squad6[(number)]);Rank_Entry/player=(squad6[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		var/list/squad7=new()
		var/savefile/G=new("squad7.sav")
		G[("stuff2")]>>(squad7)
		if(!squad7)html+="<TR><TD>Nobody in squad 7.</TD></TR>\n"
		else
			html+="<tr><th><B>Squad 7</th></tr>\n<br>"
			for(var/number in 1 to squad7.len)
				var{character=(squad7[(number)]);Rank_Entry/player=(squad7[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		var/list/squad8=new()
		var/savefile/H=new("squad8.sav")
		H[("stuff2")]>>(squad8)
		if(!squad8)html+="<TR><TD>Nobody in squad 8.</TD></TR>\n"
		else
			html+="<tr><th><B>Squad 8</th></tr>\n<br>"
			for(var/number in 1 to squad8.len)
				var{character=(squad8[(number)]);Rank_Entry/player=(squad8[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		var/list/squad9=new()
		var/savefile/I=new("squad9.sav")
		I[("stuff2")]>>(squad9)
		if(!squad9)html+="<TR><TD>Nobody in squad 9.</TD></TR>\n"
		else
			html+="<tr><th><B>Squad 9</th></tr>\n<br>"
			for(var/number in 1 to squad9.len)
				var{character=(squad9[(number)]);Rank_Entry/player=(squad9[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		var/list/squad10=new()
		var/savefile/J=new("squad10.sav")
		J[("stuff2")]>>(squad10)
		if(!squad10)html+="<TR><TD>Nobody in squad 10.</TD></TR>\n"
		else
			html+="<tr><th><B>Squad 10</th></tr>\n<br>"
			for(var/number in 1 to squad10.len)
				var{character=(squad10[(number)]);Rank_Entry/player=(squad10[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		var/list/squad11=new()
		var/savefile/K=new("squad11.sav")
		K[("stuff2")]>>(squad11)
		if(!squad11)html+="<TR><TD>Nobody in squad 11.</TD></TR>\n"
		else
			html+="<tr><th><B>Squad 11</th></tr>\n<br>"
			for(var/number in 1 to squad11.len)
				var{character=(squad11[(number)]);Rank_Entry/player=(squad11[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		var/list/squad12=new()
		var/savefile/L=new("squad12.sav")
		L[("stuff2")]>>(squad12)
		if(!squad12)html+="<TR><TD>Nobody in squad 12.</TD></TR>\n"
		else
			html+="<tr><th><B>Squad 12</th></tr>\n<br>"
			for(var/number in 1 to squad12.len)
				var{character=(squad12[(number)]);Rank_Entry/player=(squad12[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		var/list/squad13=new()
		var/savefile/M=new("squad13.sav")
		M[("stuff2")]>>(squad13)
		if(!squad13)html+="<TR><TD>Nobody in squad 13.</TD></TR>\n"
		else
			html+="<tr><th><B>Squad 13</th></tr>\n<br>"
			for(var/number in 1 to squad13.len)
				var{character=(squad13[(number)]);Rank_Entry/player=(squad13[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		var/list/squadkid=new()
		var/savefile/Fq=new("squadkid.sav")
		Fq[("stuff2")]>>(squadkid)
		if(!squadkid)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>Kido Corps</th></tr>\n<br>"
			for(var/number in 1 to squadkid.len)
				var{character=(squadkid[(number)]);Rank_Entry/player=(squadkid[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	SquadKid_Ranking(var/mob/player)
		if(!player||!player.client)return
		if(player.karakuraheroplayer)return
		if(player.humanleader)return
		if(player.squad!="Kido Corps")return
		var/savefile/F=new("squadkid.sav")
		var/list/rep=new()
		F[("stuff2")]>>(rep)
		if(!rep)rep=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=rep.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(rep[(character)])
			if(old.Rep>=player.rep)return score
			while(score>1)
				last=rep[(rep[(score-1)])]
				if(last.Rep>=player.rep)break
				rep[(score)]=(rep[(score-1)])
				rep[(--score)]=(character)
				rep[(rep[(score+1)])]=(last)
			rep[(character)]=(newest)
			F[("stuff2")]<<(rep)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "#[score]"
			if(score==2&&player.status!="Lieutenant")
				player.status = "#[score]"
			if(score>2)
				player.status = "#[score]"
				if(score==3)
					player.status = "#[score]"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
			return score
		score=(rep.len)
		if(score>=5)
			last=(rep[(rep[(score)])])
			if(last.Rep>=player.rep)return 6
			rep[(score)]=(character)
		else
			score=(rep.len+1)
			rep+=(character)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
		while(score>1)
			last=(rep[(rep[(score-1)])])
			if(last.Rep>=player.rep)break
			rep[(score)]=(rep[(score-1)])
			rep[(--score)]=(character)
			rep[(rep[(score+1)])]=(last)
		rep[(character)]=(newest)
		F[("stuff2")]<<(rep)
		return score
	Squad1_Ranking(var/mob/player)
		if(!player||!player.client)return
		if(player.islieu)return
		if(player.iscaptain)return
		if(player.squad!=1)return
		var/savefile/F=new("squad1.sav")
		var/list/rep=new()
		F[("stuff2")]>>(rep)
		if(!rep)rep=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=rep.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(rep[(character)])
			if(old.Rep>=player.rep)return score
			while(score>1)
				last=rep[(rep[(score-1)])]
				if(last.Rep>=player.rep)break
				rep[(score)]=(rep[(score-1)])
				rep[(--score)]=(character)
				rep[(rep[(score+1)])]=(last)
			rep[(character)]=(newest)
			F[("stuff2")]<<(rep)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
			return score
		score=(rep.len)
		if(score>=5)
			last=(rep[(rep[(score)])])
			if(last.Rep>=player.rep)return 6
			rep[(score)]=(character)
		else
			score=(rep.len+1)
			rep+=(character)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
		while(score>1)
			last=(rep[(rep[(score-1)])])
			if(last.Rep>=player.rep)break
			rep[(score)]=(rep[(score-1)])
			rep[(--score)]=(character)
			rep[(rep[(score+1)])]=(last)
		rep[(character)]=(newest)
		F[("stuff2")]<<(rep)
		return score
	Squad1RankingDisplay(var/mob/person)
		var/list/squadkid=new()
		var/savefile/F=new("squadkid.sav")
		F[("stuff2")]>>(squadkid)
		var/html="<center><TABLE BORDER=2><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!squadkid)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>Rank</th><th>Name <I>(key)</I></th><th>Level</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to squadkid.len)
				var{character=(squadkid[(number)]);Rank_Entry/player=(squadkid[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")

	Squad2_Ranking(var/mob/player)
		if(!player||!player.client)return
		if(player.islieu)return
		if(player.iscaptain)return
		if(player.squad!=2)return
		var/savefile/F=new("squad2.sav")
		var/list/rep=new()
		F[("stuff2")]>>(rep)
		if(!rep)rep=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=rep.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(rep[(character)])
			if(old.Rep>=player.rep)return score
			while(score>1)
				last=rep[(rep[(score-1)])]
				if(last.Rep>=player.rep)break
				rep[(score)]=(rep[(score-1)])
				rep[(--score)]=(character)
				rep[(rep[(score+1)])]=(last)
			rep[(character)]=(newest)
			F[("stuff2")]<<(rep)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
			return score
		score=(rep.len)
		if(score>=5)
			last=(rep[(rep[(score)])])
			if(last.Rep>=player.rep)return 6
			rep[(score)]=(character)
		else
			score=(rep.len+1)
			rep+=(character)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
		while(score>1)
			last=(rep[(rep[(score-1)])])
			if(last.Rep>=player.rep)break
			rep[(score)]=(rep[(score-1)])
			rep[(--score)]=(character)
			rep[(rep[(score+1)])]=(last)
		rep[(character)]=(newest)
		F[("stuff2")]<<(rep)
		return score
	Squad2RankingDisplay(var/mob/person)
		var/list/squad2=new()
		var/savefile/F=new("squad2.sav")
		F[("stuff2")]>>(squad2)
		var/html="<center><TABLE BORDER=2><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!squad2)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>Rank</th><th>Name <I>(key)</I></th><th>Level</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to squad2.len)
				var{character=(squad2[(number)]);Rank_Entry/player=(squad2[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")

	Squad3_Ranking(var/mob/player)
		if(!player||!player.client)return
		if(player.islieu)return
		if(player.iscaptain)return
		if(player.squad!=3)return
		var/savefile/F=new("squad3.sav")
		var/list/rep=new()
		F[("stuff2")]>>(rep)
		if(!rep)rep=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=rep.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(rep[(character)])
			if(old.Rep>=player.rep)return score
			while(score>1)
				last=rep[(rep[(score-1)])]
				if(last.Rep>=player.rep)break
				rep[(score)]=(rep[(score-1)])
				rep[(--score)]=(character)
				rep[(rep[(score+1)])]=(last)
			rep[(character)]=(newest)
			F[("stuff2")]<<(rep)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
			return score
		score=(rep.len)
		if(score>=5)
			last=(rep[(rep[(score)])])
			if(last.Rep>=player.rep)return 6
			rep[(score)]=(character)
		else
			score=(rep.len+1)
			rep+=(character)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
		while(score>1)
			last=(rep[(rep[(score-1)])])
			if(last.Rep>=player.rep)break
			rep[(score)]=(rep[(score-1)])
			rep[(--score)]=(character)
			rep[(rep[(score+1)])]=(last)
		rep[(character)]=(newest)
		F[("stuff2")]<<(rep)
		return score
	Squad3RankingDisplay(var/mob/person)
		var/list/squad3=new()
		var/savefile/F=new("squad3.sav")
		F[("stuff2")]>>(squad3)
		var/html="<center><TABLE BORDER=2><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!squad3)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>Rank</th><th>Name <I>(key)</I></th><th>Level</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to squad3.len)
				var{character=(squad3[(number)]);Rank_Entry/player=(squad3[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Squad4_Ranking(var/mob/player)
		if(!player||!player.client)return
		if(player.islieu)return
		if(player.iscaptain)return
		if(player.status== "<font color = #FF5600>Captain</font>")return
		if(player.squad!=4)return
		var/savefile/F=new("squad4.sav")
		var/list/rep=new()
		F[("stuff2")]>>(rep)
		if(!rep)rep=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=rep.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(rep[(character)])
			if(old.Rep>=player.rep)return score
			while(score>1)
				last=rep[(rep[(score-1)])]
				if(last.Rep>=player.rep)break
				rep[(score)]=(rep[(score-1)])
				rep[(--score)]=(character)
				rep[(rep[(score+1)])]=(last)
			rep[(character)]=(newest)
			F[("stuff2")]<<(rep)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
			return score
		score=(rep.len)
		if(score>=5)
			last=(rep[(rep[(score)])])
			if(last.Rep>=player.rep)return 6
			rep[(score)]=(character)
		else
			score=(rep.len+1)
			rep+=(character)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
		while(score>1)
			last=(rep[(rep[(score-1)])])
			if(last.Rep>=player.rep)break
			rep[(score)]=(rep[(score-1)])
			rep[(--score)]=(character)
			rep[(rep[(score+1)])]=(last)
		rep[(character)]=(newest)
		F[("stuff2")]<<(rep)
		return score
	Squad4RankingDisplay(var/mob/person)
		var/list/squad4=new()
		var/savefile/F=new("squad4.sav")
		F[("stuff2")]>>(squad4)
		var/html="<center><TABLE BORDER=2><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!squad4)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>Rank</th><th>Name <I>(key)</I></th><th>Level</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to squad4.len)
				var{character=(squad4[(number)]);Rank_Entry/player=(squad4[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Squad5_Ranking(var/mob/player)
		if(!player||!player.client)return
		if(player.islieu)return
		if(player.iscaptain)return
		if(player.squad!=5)return
		var/savefile/F=new("squad5.sav")
		var/list/rep=new()
		F[("stuff2")]>>(rep)
		if(!rep)rep=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=rep.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(rep[(character)])
			if(old.Rep>=player.rep)return score
			while(score>1)
				last=rep[(rep[(score-1)])]
				if(last.Rep>=player.rep)break
				rep[(score)]=(rep[(score-1)])
				rep[(--score)]=(character)
				rep[(rep[(score+1)])]=(last)
			rep[(character)]=(newest)
			F[("stuff2")]<<(rep)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
			return score
		score=(rep.len)
		if(score>=5)
			last=(rep[(rep[(score)])])
			if(last.Rep>=player.rep)return 6
			rep[(score)]=(character)
		else
			score=(rep.len+1)
			rep+=(character)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
		while(score>1)
			last=(rep[(rep[(score-1)])])
			if(last.Rep>=player.rep)break
			rep[(score)]=(rep[(score-1)])
			rep[(--score)]=(character)
			rep[(rep[(score+1)])]=(last)
		rep[(character)]=(newest)
		F[("stuff2")]<<(rep)
		return score
	Squad5RankingDisplay(var/mob/person)
		var/list/squad5=new()
		var/savefile/F=new("squad5.sav")
		F[("stuff2")]>>(squad5)
		var/html="<center><TABLE BORDER=2><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!squad5)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>Rank</th><th>Name <I>(key)</I></th><th>Level</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to squad5.len)
				var{character=(squad5[(number)]);Rank_Entry/player=(squad5[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Squad6_Ranking(var/mob/player)
		if(!player||!player.client)return
		if(player.islieu)return
		if(player.iscaptain)return
		if(player.squad!=6)return
		var/savefile/F=new("squad6.sav")
		var/list/rep=new()
		F[("stuff2")]>>(rep)
		if(!rep)rep=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=rep.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(rep[(character)])
			if(old.Rep>=player.rep)return score
			while(score>1)
				last=rep[(rep[(score-1)])]
				if(last.Rep>=player.rep)break
				rep[(score)]=(rep[(score-1)])
				rep[(--score)]=(character)
				rep[(rep[(score+1)])]=(last)
			rep[(character)]=(newest)
			F[("stuff2")]<<(rep)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
			return score
		score=(rep.len)
		if(score>=5)
			last=(rep[(rep[(score)])])
			if(last.Rep>=player.rep)return 6
			rep[(score)]=(character)
		else
			score=(rep.len+1)
			rep+=(character)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
		while(score>1)
			last=(rep[(rep[(score-1)])])
			if(last.Rep>=player.rep)break
			rep[(score)]=(rep[(score-1)])
			rep[(--score)]=(character)
			rep[(rep[(score+1)])]=(last)
		rep[(character)]=(newest)
		F[("stuff2")]<<(rep)
		return score
	Squad6RankingDisplay(var/mob/person)
		var/list/squad6=new()
		var/savefile/F=new("squad6.sav")
		F[("stuff2")]>>(squad6)
		var/html="<center><TABLE BORDER=2><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!squad6)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>Rank</th><th>Name <I>(key)</I></th><th>Level</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to squad6.len)
				var{character=(squad6[(number)]);Rank_Entry/player=(squad6[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Squad7_Ranking(var/mob/player)
		if(!player||!player.client)return
		if(player.islieu)return
		if(player.iscaptain)return
		if(player.squad!=7)return
		var/savefile/F=new("squad7.sav")
		var/list/rep=new()
		F[("stuff2")]>>(rep)
		if(!rep)rep=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=rep.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(rep[(character)])
			if(old.Rep>=player.rep)return score
			while(score>1)
				last=rep[(rep[(score-1)])]
				if(last.Rep>=player.rep)break
				rep[(score)]=(rep[(score-1)])
				rep[(--score)]=(character)
				rep[(rep[(score+1)])]=(last)
			rep[(character)]=(newest)
			F[("stuff2")]<<(rep)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
			return score
		score=(rep.len)
		if(score>=5)
			last=(rep[(rep[(score)])])
			if(last.Rep>=player.rep)return 6
			rep[(score)]=(character)
		else
			score=(rep.len+1)
			rep+=(character)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
		while(score>1)
			last=(rep[(rep[(score-1)])])
			if(last.Rep>=player.rep)break
			rep[(score)]=(rep[(score-1)])
			rep[(--score)]=(character)
			rep[(rep[(score+1)])]=(last)
		rep[(character)]=(newest)
		F[("stuff2")]<<(rep)
		return score
	Squad7RankingDisplay(var/mob/person)
		var/list/squad7=new()
		var/savefile/F=new("squad7.sav")
		F[("stuff2")]>>(squad7)
		var/html="<center><TABLE BORDER=2><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!squad7)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>Rank</th><th>Name <I>(key)</I></th><th>Level</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to squad7.len)
				var{character=(squad7[(number)]);Rank_Entry/player=(squad7[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Squad8_Ranking(var/mob/player)
		if(!player||!player.client)return
		if(player.islieu)return
		if(player.iscaptain)return
		if(player.squad!=8)return
		var/savefile/F=new("squad8.sav")
		var/list/rep=new()
		F[("stuff2")]>>(rep)
		if(!rep)rep=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=rep.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(rep[(character)])
			if(old.Rep>=player.rep)return score
			while(score>1)
				last=rep[(rep[(score-1)])]
				if(last.Rep>=player.rep)break
				rep[(score)]=(rep[(score-1)])
				rep[(--score)]=(character)
				rep[(rep[(score+1)])]=(last)
			rep[(character)]=(newest)
			F[("stuff2")]<<(rep)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
			return score
		score=(rep.len)
		if(score>=5)
			last=(rep[(rep[(score)])])
			if(last.Rep>=player.rep)return 6
			rep[(score)]=(character)
		else
			score=(rep.len+1)
			rep+=(character)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
		while(score>1)
			last=(rep[(rep[(score-1)])])
			if(last.Rep>=player.rep)break
			rep[(score)]=(rep[(score-1)])
			rep[(--score)]=(character)
			rep[(rep[(score+1)])]=(last)
		rep[(character)]=(newest)
		F[("stuff2")]<<(rep)
		return score
	Squad8RankingDisplay(var/mob/person)
		var/list/squad8=new()
		var/savefile/F=new("squad8.sav")
		F[("stuff2")]>>(squad8)
		var/html="<center><TABLE BORDER=2><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!squad8)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>Rank</th><th>Name <I>(key)</I></th><th>Level</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to squad8.len)
				var{character=(squad8[(number)]);Rank_Entry/player=(squad8[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Squad9_Ranking(var/mob/player)
		if(!player||!player.client)return
		if(player.islieu)return
		if(player.iscaptain)return
		if(player.squad!=9)return
		var/savefile/F=new("squad9.sav")
		var/list/rep=new()
		F[("stuff2")]>>(rep)
		if(!rep)rep=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=rep.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(rep[(character)])
			if(old.Rep>=player.rep)return score
			while(score>1)
				last=rep[(rep[(score-1)])]
				if(last.Rep>=player.rep)break
				rep[(score)]=(rep[(score-1)])
				rep[(--score)]=(character)
				rep[(rep[(score+1)])]=(last)
			rep[(character)]=(newest)
			F[("stuff2")]<<(rep)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
			return score
		score=(rep.len)
		if(score>=5)
			last=(rep[(rep[(score)])])
			if(last.Rep>=player.rep)return 6
			rep[(score)]=(character)
		else
			score=(rep.len+1)
			rep+=(character)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
		while(score>1)
			last=(rep[(rep[(score-1)])])
			if(last.Rep>=player.rep)break
			rep[(score)]=(rep[(score-1)])
			rep[(--score)]=(character)
			rep[(rep[(score+1)])]=(last)
		rep[(character)]=(newest)
		F[("stuff2")]<<(rep)
		return score
	Squad9RankingDisplay(var/mob/person)
		var/list/squad9=new()
		var/savefile/F=new("squad9.sav")
		F[("stuff2")]>>(squad9)
		var/html="<center><TABLE BORDER=2><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!squad9)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>Rank</th><th>Name <I>(key)</I></th><th>Level</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to squad9.len)
				var{character=(squad9[(number)]);Rank_Entry/player=(squad9[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Squad10_Ranking(var/mob/player)
		if(!player||!player.client)return
		if(player.islieu)return
		if(player.iscaptain)return
		if(player.squad!=10)return
		var/savefile/F=new("squad10.sav")
		var/list/rep=new()
		F[("stuff2")]>>(rep)
		if(!rep)rep=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=rep.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(rep[(character)])
			if(old.Rep>=player.rep)return score
			while(score>1)
				last=rep[(rep[(score-1)])]
				if(last.Rep>=player.rep)break
				rep[(score)]=(rep[(score-1)])
				rep[(--score)]=(character)
				rep[(rep[(score+1)])]=(last)
			rep[(character)]=(newest)
			F[("stuff2")]<<(rep)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
			return score
		score=(rep.len)
		if(score>=5)
			last=(rep[(rep[(score)])])
			if(last.Rep>=player.rep)return 6
			rep[(score)]=(character)
		else
			score=(rep.len+1)
			rep+=(character)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
		while(score>1)
			last=(rep[(rep[(score-1)])])
			if(last.Rep>=player.rep)break
			rep[(score)]=(rep[(score-1)])
			rep[(--score)]=(character)
			rep[(rep[(score+1)])]=(last)
		rep[(character)]=(newest)
		F[("stuff2")]<<(rep)
		return score
	Squad10RankingDisplay(var/mob/person)
		var/list/squad10=new()
		var/savefile/F=new("squad10.sav")
		F[("stuff2")]>>(squad10)
		var/html="<center><TABLE BORDER=2><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!squad10)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>Rank</th><th>Name <I>(key)</I></th><th>Level</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to squad10.len)
				var{character=(squad10[(number)]);Rank_Entry/player=(squad10[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Squad11_Ranking(var/mob/player)
		if(!player||!player.client)return
		if(player.islieu)return
		if(player.iscaptain)return
		if(player.squad!=11)return
		var/savefile/F=new("squad11.sav")
		var/list/rep=new()
		F[("stuff2")]>>(rep)
		if(!rep)rep=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=rep.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(rep[(character)])
			if(old.Rep>=player.rep)return score
			while(score>1)
				last=rep[(rep[(score-1)])]
				if(last.Rep>=player.rep)break
				rep[(score)]=(rep[(score-1)])
				rep[(--score)]=(character)
				rep[(rep[(score+1)])]=(last)
			rep[(character)]=(newest)
			F[("stuff2")]<<(rep)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
			return score
		score=(rep.len)
		if(score>=5)
			last=(rep[(rep[(score)])])
			if(last.Rep>=player.rep)return 6
			rep[(score)]=(character)
		else
			score=(rep.len+1)
			rep+=(character)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
		while(score>1)
			last=(rep[(rep[(score-1)])])
			if(last.Rep>=player.rep)break
			rep[(score)]=(rep[(score-1)])
			rep[(--score)]=(character)
			rep[(rep[(score+1)])]=(last)
		rep[(character)]=(newest)
		F[("stuff2")]<<(rep)
		return score
	Squad11RankingDisplay(var/mob/person)
		var/list/squad11=new()
		var/savefile/F=new("squad11.sav")
		F[("stuff2")]>>(squad11)
		var/html="<center><TABLE BORDER=2><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!squad11)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>Rank</th><th>Name <I>(key)</I></th><th>Level</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to squad11.len)
				var{character=(squad11[(number)]);Rank_Entry/player=(squad11[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Squad12_Ranking(var/mob/player)
		if(!player||!player.client)return
		if(player.islieu)return
		if(player.iscaptain)return
		if(player.squad!=12)return
		var/savefile/F=new("squad12.sav")
		var/list/rep=new()
		F[("stuff2")]>>(rep)
		if(!rep)rep=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=rep.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(rep[(character)])
			if(old.Rep>=player.rep)return score
			while(score>1)
				last=rep[(rep[(score-1)])]
				if(last.Rep>=player.rep)break
				rep[(score)]=(rep[(score-1)])
				rep[(--score)]=(character)
				rep[(rep[(score+1)])]=(last)
			rep[(character)]=(newest)
			F[("stuff2")]<<(rep)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
			return score
		score=(rep.len)
		if(score>=5)
			last=(rep[(rep[(score)])])
			if(last.Rep>=player.rep)return 6
			rep[(score)]=(character)
		else
			score=(rep.len+1)
			rep+=(character)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
		while(score>1)
			last=(rep[(rep[(score-1)])])
			if(last.Rep>=player.rep)break
			rep[(score)]=(rep[(score-1)])
			rep[(--score)]=(character)
			rep[(rep[(score+1)])]=(last)
		rep[(character)]=(newest)
		F[("stuff2")]<<(rep)
		return score
	Squad12RankingDisplay(var/mob/person)
		var/list/squad12=new()
		var/savefile/F=new("squad12.sav")
		F[("stuff2")]>>(squad12)
		var/html="<center><TABLE BORDER=2><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!squad12)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>Rank</th><th>Name <I>(key)</I></th><th>Level</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to squad12.len)
				var{character=(squad12[(number)]);Rank_Entry/player=(squad12[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Squad13_Ranking(var/mob/player)
		if(!player||!player.client)return
		if(player.islieu)return
		if(player.iscaptain)return
		if(player.squad!=13)return
		var/savefile/F=new("squad13.sav")
		var/list/rep=new()
		F[("stuff2")]>>(rep)
		if(!rep)rep=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=rep.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(rep[(character)])
			if(old.Rep>=player.rep)return score
			while(score>1)
				last=rep[(rep[(score-1)])]
				if(last.Rep>=player.rep)break
				rep[(score)]=(rep[(score-1)])
				rep[(--score)]=(character)
				rep[(rep[(score+1)])]=(last)
			rep[(character)]=(newest)
			F[("stuff2")]<<(rep)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
			return score
		score=(rep.len)
		if(score>=5)
			last=(rep[(rep[(score)])])
			if(last.Rep>=player.rep)return 6
			rep[(score)]=(character)
		else
			score=(rep.len+1)
			rep+=(character)
			if(score==1&&player.status!="<font color = #FF5600>Captain</font>")
				player.status = "[score]st Seat"
			if(score==2&&player.status!="Lieutenant")
				player.status = "[score]nd Seat"
			if(score>2)
				player.status = "[score]th Seat"
				if(score==3)
					player.status = "[score]rd Seat"
				player.verbs += typesof(/mob/Squad_Verbs/verb)
				player.verbs -= typesof(/mob/Squad_Captain/verb)
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
		while(score>1)
			last=(rep[(rep[(score-1)])])
			if(last.Rep>=player.rep)break
			rep[(score)]=(rep[(score-1)])
			rep[(--score)]=(character)
			rep[(rep[(score+1)])]=(last)
		rep[(character)]=(newest)
		F[("stuff2")]<<(rep)
		return score
	Squad13RankingDisplay(var/mob/person)
		var/list/squad13=new()
		var/savefile/F=new("squad13.sav")
		F[("stuff2")]>>(squad13)
		var/html="<center><TABLE BORDER=2><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!squad13)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>Rank</th><th>Name <I>(key)</I></th><th>Level</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to squad13.len)
				var{character=(squad13[(number)]);Rank_Entry/player=(squad13[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Vaizard_Ranking(var/mob/player)
		if(!player||!player.client)return
		if(player.karakuraheroplayer)return
		if(player.humanleader)return
		if(player.race!="Vaizard")return
		var/savefile/F=new("vaizards.sav")
		var/list/level=new()
		F[("stuff")]>>(level)
		if(!level)level=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=level.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(level[(character)])
			if(score==1)player.verbs+=/mob/vaizard/verb/Fight_Inner
			if(old.Level>=player.level)return score
			while(score>1)
				last=level[(level[(score-1)])]
				if(last.Level>=player.level)break
				level[(score)]=(level[(score-1)])
				level[(--score)]=(character)
				level[(level[(score+1)])]=(last)
			level[(character)]=(newest)
			F[("stuff")]<<(level)
			if(score==1)
				player.status = "<font color = #8B4513>Vaizard Leader</font>"
			if(score>1)
				player.status = "<font color = #8B4513>[score]th Vaizard Knight</font>"
				if(score==2)
					player.status = "<font color = #8B4513>[score]nd Vaizard Knight</font>"
				if(score==3)
					player.status = "<font color = #8B4513>[score]rd Vaizard Knight</font>"
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
			return score
		score=(level.len)
		if(score>=10)
			last=(level[(level[(score)])])
			if(last.Level>=player.level)return 11
			level[(score)]=(character)
		else
			score=(level.len+1)
			level+=(character)
			if(score==1)
				player.status = "<font color = #8B4513>Vaizard Leader</font>"
			if(score>1)
				player.status = "<font color = #8B4513>[score]th Vaizard Knight</font>"
				if(score==2)
					player.status = "<font color = #8B4513>[score]nd Vaizard Knight</font>"
				if(score==3)
					player.status = "<font color = #8B4513>[score]rd Vaizard Knight</font>"
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
		while(score>1)
			last=(level[(level[(score-1)])])
			if(last.Level>=player.level)break
			level[(score)]=(level[(score-1)])
			level[(--score)]=(character)
			level[(level[(score+1)])]=(last)
		level[(character)]=(newest)
		F[("stuff")]<<(level)
		if(score>1)
			player.verbs-=/mob/vaizard/verb/Fight_Inner
		if(score==1)
			player.verbs+=/mob/vaizard/verb/Fight_Inner
		return score
	VaizardRankingDisplay(var/mob/person)
		var/list/vaizards=new()
		var/savefile/F=new("vaizards.sav")
		F[("stuff")]>>(vaizards)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!vaizards)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Level</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to vaizards.len)
				var{character=(vaizards[(number)]);Rank_Entry/player=(vaizards[(character)])}
				html+="<tr><td><u>Rank:[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Sado_Ranking(var/mob/player)
		if(!player||!player.client)return
		if(player.karakuraheroplayer)return
		if(player.humanleader)return
		if(player.newsadoking)return
		if(player.race!="Sado")return
		var/savefile/F=new("sados.sav")
		var/list/level=new()
		F[("stuff")]>>(level)
		if(!level)level=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=level.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(level[(character)])
			if(old.Level>=player.level)return score
			while(score>1)
				last=level[(level[(score-1)])]
				if(last.Level>=player.level)break
				level[(score)]=(level[(score-1)])
				level[(--score)]=(character)
				level[(level[(score+1)])]=(last)
			level[(character)]=(newest)
			F[("stuff")]<<(level)
			if(score==1)
				player.status = "<font color = #808080>Devil - Sado Leader</font>"
			if(score>1)
				player.status = "<font color = #808080>Member of Sado</font>"
				if(score==2)
					player.status = "<font color = #808080>Demon - Sado Member</font>"
				if(score==3)
					player.status = "<font color = #808080>Cerberus - Sado Member</font>"
				if(score==4)
					player.status = "<font color = #808080>Orthrus - Sado Member</font>"
				if(score==5)
					player.status = "<font color = #808080>Ghoul - Sado Member</font>"
			if(score<=11)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
			return score
		score=(level.len)
		if(score>=10)
			last=(level[(level[(score)])])
			if(last.Level>=player.level)return 11
			level[(score)]=(character)
		else
			score=(level.len+1)
			level+=(character)
			if(score==1)
				player.status = "<font color = #808080>Devil - Sado Leader</font>"
			if(score>1)
				player.status = "<font color = #808080>Member of Sado</font>"
				if(score==2)
					player.status = "<font color = #808080>Demon - Sado Member</font>"
				if(score==3)
					player.status = "<font color = #808080>Cerberus - Sado Member</font>"
				if(score==4)
					player.status = "<font color = #808080>Orthrus - Sado Member</font>"
				if(score==5)
					player.status = "<font color = #808080>Ghoul - Sado Member</font>"
			if(score<=2)
				if(player.status!=player.statusold)
					player.statusold=player.status
					world << "<b><font color = lime>Squad Info: [player] is now [player.status]!"
		while(score>1)
			last=(level[(level[(score-1)])])
			if(last.Level>=player.level)break
			level[(score)]=(level[(score-1)])
			level[(--score)]=(character)
			level[(level[(score+1)])]=(last)
		level[(character)]=(newest)
		F[("stuff")]<<(level)
		return score
	SadoRankingDisplay(var/mob/person)
		var/list/sados=new()
		var/savefile/F=new("sados.sav")
		F[("stuff")]>>(sados)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!sados)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Level</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to sados.len)
				var{character=(sados[(number)]);Rank_Entry/player=(sados[(character)])}
				html+="<tr><td><u>Rank:[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(player.Level)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	GuildRankingDisplay(var/mob/person)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		html+="<tr><th>Guild </th><th>Level</th><th>Members</th></tr>\n<br>"
		if(G1name)
			html+="<tr><td></u>[G1name] </td><td>[G1lvl]</td><td>[G1mems.len]</td></tr>\n"
		if(G2name)
			html+="<tr><td></u>[G2name] </td><td>[G2lvl]</td><td>[G2mems.len]</td></tr>\n"
		if(G3name)
			html+="<tr><td></u>[G3name] </td><td>[G3lvl]</td><td>[G3mems.len]</td></tr>\n"
		if(G4name)
			html+="<tr><td></u>[G4name] </td><td>[G4lvl]</td><td>[G4mems.len]</td></tr>\n"
		if(G5name)
			html+="<tr><td></u>[G5name] </td><td>[G5lvl]</td><td>[G5mems.len]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")

mob/verb/Guilds()
	set category = "Scoreboards"

GuildRankingDisplay(src)
mob/verb/Scoreboard()
	set category = "Scoreboards"
	Ranking(src)
	RankingDisplay(src)
mob/verb/Xcution()
	set category = "Scoreboards"
	Xcution_Ranking(src)
	Xcution_RankingDisplay(src)
mob/verb/Quincys()
	set category = "Scoreboards"
	Quincy_Ranking(src)
	Quincy_RankingDisplay(src)
mob/verb/Espadas()
	set category = "Scoreboards"
	Espada_Ranking(src)
	EspadaRankingDisplay(src)
mob/verb/Squad_1()
	set category = "Scoreboards"
	SquadKid_Ranking(src)
	Squad1RankingDisplay(src)/*
mob/verb/Squad_2()
	set category = "Scoreboards"
	Squad2_Ranking(src)
	Squad2RankingDisplay(src)
mob/verb/Squad_3()
	set category = "Scoreboards"
	Squad3_Ranking(src)
	Squad3RankingDisplay(src)
mob/verb/Squad_4()
	set category = "Scoreboards"
	Squad4_Ranking(src)
	Squad4RankingDisplay(src)
mob/verb/Squad_5()
	set category = "Scoreboards"
	Squad5_Ranking(src)
	Squad5RankingDisplay(src)
mob/verb/Squad_6()
	set category = "Scoreboards"
	Squad6_Ranking(src)
	Squad6RankingDisplay(src)
mob/verb/Squad_7()
	set category = "Scoreboards"
	Squad7_Ranking(src)
	Squad7RankingDisplay(src)
mob/verb/Squad_8()
	set category = "Scoreboards"
	Squad8_Ranking(src)
	Squad8RankingDisplay(src)
mob/verb/Squad_9()
	set category = "Scoreboards"
	Squad9_Ranking(src)
	Squad9RankingDisplay(src)
mob/verb/Squad_10()
	set category = "Scoreboards"
	Squad10_Ranking(src)
	Squad10RankingDisplay(src)
mob/verb/Squad_11()
	set category = "Scoreboards"
	Squad11_Ranking(src)
	Squad11RankingDisplay(src)
mob/verb/Squad_12()
	set category = "Scoreboards"
	Squad12_Ranking(src)
	Squad12RankingDisplay(src)
mob/verb/Squad_13()
	set category = "Scoreboards"
	Squad13_Ranking(src)
	Squad13RankingDisplay(src)*/
mob/verb/Vaizards()
	set category = "Scoreboards"
	Vaizard_Ranking(src)
	VaizardRankingDisplay(src)
mob/verb/Sados()
	set category = "Scoreboards"
	Sado_Ranking(src)
	SadoRankingDisplay(src)
mob/verb/PVP()
	set category = "Scoreboards"
	Kills_Ranking(src)
	KillsRankingDisplay(src)
mob/verb/All_Squads()
	set category = "Scoreboards"
	//SquadsRanking(src)
	SquadsRankingDisplay(src)
