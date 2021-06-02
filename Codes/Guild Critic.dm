var
	H1guildwar=0
	H2guildwar=0
	H3guildwar=0
	H4guildwar=0
	H5guildwar=0
	H1guildwarcool=0
	H2guildwarcool=0
	H3guildwarcool=0
	H4guildwarcool=0
	H5guildwarcool=0
	G1lvl=0
	G2lvl=0
	G3lvl=0
	G4lvl=0
	G5lvl=0
	G1name=""
	G2name=""
	G3name=""
	G4name=""
	G5name=""
	H1name=""
	H2name=""
	H3name=""
	H4name=""
	H5name=""
var
	list
		organizations=list("Kizikure","Jenikure","Katikure","Tekakure")
		G1ally=list("None")
		G1neut=list("None")
		G1mems=list("None")
		G2ally=list("None")
		G2neut=list("None")
		G2mems=list("None")
		G3ally=list("None")
		G3neut=list("None")
		G3mems=list("None")
		G4ally=list("None")
		G4neut=list("None")
		G4mems=list("None")
		G5ally=list("None")
		G5neut=list("None")
		G5mems=list("None")
mob/var
	inguild=0
	guildleader=0
	guildname=""
	canrecruitguild=0
	realguild=0//1,2,3,4
	Guild_Rank="Guild Member"
proc
	OrgSave()
		var/savefile/F = new("OrganizationList.sav")
		F["organizations"] << organizations
proc
	OrgLoad()
		if(fexists("OrganizationList.sav"))
			var/savefile/F = new("OrganizationList.sav")
			if(F["organizations"]&&istype(F["organizations"],/list)) F["organizations"] >> organizations
proc
	AllySave()
		var/savefile/F = new("AllyList.sav")
		for(var/O in G1neut)
			var/count=0
			for(var/o in G1neut)
				if(o==O)
					count+=1
					if(count>1)
						G1neut-=o
		for(var/O in G1ally)
			var/count=0
			for(var/o in G1ally)
				if(o==O)
					count+=1
					if(count>1)
						G1neut-=o

		for(var/O in G2neut)
			var/count=0
			for(var/o in G2neut)
				if(o==O)
					count+=1
					if(count>1)
						G2neut-=o
		for(var/O in G2ally)
			var/count=0
			for(var/o in G2ally)
				if(o==O)
					count+=1
					if(count>1)
						G2neut-=o

		for(var/O in G3neut)
			var/count=0
			for(var/o in G3neut)
				if(o==O)
					count+=1
					if(count>1)
						G3neut-=o
		for(var/O in G3ally)
			var/count=0
			for(var/o in G3ally)
				if(o==O)
					count+=1
					if(count>1)
						G3neut-=o

		for(var/O in G4neut)
			var/count=0
			for(var/o in G4neut)
				if(o==O)
					count+=1
					if(count>1)
						G4neut-=o
		for(var/O in G4ally)
			var/count=0
			for(var/o in G4ally)
				if(o==O)
					count+=1
					if(count>1)
						G4neut-=o

		for(var/O in G5neut)
			var/count=0
			for(var/o in G5neut)
				if(o==O)
					count+=1
					if(count>1)
						G5neut-=o
		for(var/O in G5ally)
			var/count=0
			for(var/o in G5ally)
				if(o==O)
					count+=1
					if(count>1)
						G5neut-=o

		F["G1lvl"] << G1lvl
		F["G2lvl"] << G2lvl
		F["G3lvl"] << G3lvl
		F["G4lvl"] << G4lvl
		F["G5lvl"] << G5lvl
		F["G1name"] << G1name
		F["G2name"] << G2name
		F["G3name"] << G3name
		F["G4name"] << G4name
		F["G5name"] << G5name
		F["G1ally"] << G1ally
		F["G1neut"] << G1neut
		F["G1mems"] << G1mems
		F["G2ally"] << G2ally
		F["G2neut"] << G2neut
		F["G2mems"] << G2mems
		F["G3ally"] << G3ally
		F["G3neut"] << G3neut
		F["G3mems"] << G3mems
		F["G4ally"] << G4ally
		F["G4neut"] << G4neut
		F["G4mems"] << G4mems
		F["G5ally"] << G5ally
		F["G5neut"] << G5neut
		F["G5mems"] << G5mems
proc
	AllyLoad()
		if(fexists("AllyList.sav"))
			var/savefile/F = new("AllyList.sav")
			if(F["G1lvl"]) F["G1lvl"] >> G1lvl
			if(F["G2lvl"]) F["G2lvl"] >> G2lvl
			if(F["G3lvl"]) F["G3lvl"] >> G3lvl
			if(F["G4lvl"]) F["G4lvl"] >> G4lvl
			if(F["G5lvl"]) F["G5lvl"] >> G5lvl
			if(F["G1name"]) F["G1name"] >> G1name
			if(F["G2name"]) F["G2name"] >> G2name
			if(F["G3name"]) F["G3name"] >> G3name
			if(F["G4name"]) F["G4name"] >> G4name
			if(F["G5name"]) F["G5name"] >> G5name
			if(F["G1ally"]&&istype(F["G1ally"],/list)) F["G1ally"] >> G1ally
			if(F["G1neut"]&&istype(F["G1neut"],/list)) F["G1neut"] >> G1neut
			if(F["G2ally"]&&istype(F["G2ally"],/list)) F["G2ally"] >> G2ally
			if(F["G2neut"]&&istype(F["G2neut"],/list)) F["G2neut"] >> G2neut
			if(F["G3ally"]&&istype(F["G3ally"],/list)) F["G3ally"] >> G3ally
			if(F["G3neut"]&&istype(F["G3neut"],/list)) F["G3neut"] >> G3neut
			if(F["G4ally"]&&istype(F["G4ally"],/list)) F["G4ally"] >> G4ally
			if(F["G4neut"]&&istype(F["G4neut"],/list)) F["G4neut"] >> G4neut
			if(F["G5ally"]&&istype(F["G5ally"],/list)) F["G5ally"] >> G5ally
			if(F["G5neut"]&&istype(F["G5neut"],/list)) F["G5neut"] >> G5neut
			if(F["G1mems"]&&istype(F["G1mems"],/list)) F["G1mems"] >> G1mems
			if(F["G2mems"]&&istype(F["G2mems"],/list)) F["G2mems"] >> G2mems
			if(F["G3mems"]&&istype(F["G3mems"],/list)) F["G3mems"] >> G3mems
			if(F["G4mems"]&&istype(F["G4mems"],/list)) F["G4mems"] >> G4mems
			if(F["G5mems"]&&istype(F["G5mems"],/list)) F["G5mems"] >> G5mems
mob/verb
	Check_Guild_Houses()
		src<<"<b>Guild Houses"
		if(H1name)
			src<<"<font color=aqua>Hueco Mundo: [H1name]"
		if(H2name)
			src<<"<font color=aqua>Karakura: [H2name]"
		if(H3name)
			src<<"<font color=aqua>Soul Society: [H3name]"
		if(H4name)
			src<<"<font color=aqua>Rukongai: [H4name]"
		if(H5name)
			src<<"<font color=aqua>Southern Karakura Town: [H5name]"
mob/verb
	Check_Alliances()
		src<<"<b>Guild Alliances"
		if(G1name)
			src<<"<font color=aqua>[G1name]:"
			for(var/a in G1ally)
				if(a!="None")
					src<<"<font color=aqua>    Allies:[a]"
				if(G1ally.len<=1)
					src<<"<font color=aqua>    Allies:None"
		if(G2name)
			src<<"<font color=aqua>[G2name]:"
			for(var/a in G2ally)
				if(a!="None")
					src<<"<font color=aqua>    Allies:[a]"
				if(G2ally.len<=1)
					src<<"<font color=aqua>    Allies:None"
		if(G3name)
			src<<"<font color=aqua>[G3name]:"
			for(var/a in G3ally)
				if(a!="None")
					src<<"<font color=aqua>    Allies:[a]"
				if(G3ally.len<=1)
					src<<"<font color=aqua>    Allies:None"
		if(G4name)
			src<<"<font color=aqua>[G4name]:"
			for(var/a in G4ally)
				if(a!="None")
					src<<"<font color=aqua>    Allies:[a]"
				if(G4ally.len<=1)
					src<<"<font color=aqua>    Allies:None"
		if(G5name)
			src<<"<font color=aqua>[G5name]:"
			for(var/a in G5ally)
				if(a!="None")
					src<<"<font color=aqua>    Allies:[a]"
				if(G5ally.len<=1)
					src<<"<font color=aqua>    Allies:None"
mob/Guild_Leader/verb
	Start_War()
		set category = "Guild"
		if(!src.guildleader)return
		switch(input(src,"Do you want to start a war?(30 minute cooldown verb)", text) in list ("Yes","No"))
			if("Yes")
				switch(input(src,"What Guild House will you war with?", text) in list ("Hueco Mundo","Soul Society","Rukongai","Karakura Town","Southern Karakura Town","Nevermind"))
					if("Hueco Mundo")
						if(!H1name)
							var/J=0
							for(var/mob/player/M in view(8,src))
								if(M.inghouse==1)
									if(M.inguild&&M.guildname==src.guildname)
										J+=1
							if(J<3)
								src<<"You need at least 3 guild members near you in the House"
								return
							world<<"[src.guildname] just captured Hueco Mundo Guild House"
							H1name=src.guildname
							HouseSave()
							return
						if(src.guildname==H1name)
							src<<"That's your guild"
							return
						if(src.guildname==G1name)
							if(H1name in G1ally)
								src<<"That's your ally"
								return
						if(src.guildname==G2name)
							if(H1name in G2ally)
								src<<"That's your ally"
								return
						if(src.guildname==G3name)
							if(H1name in G3ally)
								src<<"That's your ally"
								return
						if(src.guildname==G4name)
							if(H1name in G4ally)
								src<<"That's your ally"
								return
						if(src.guildname==G5name)
							if(H1name in G5ally)
								src<<"That's your ally"
								return
						/*if(H1name==G1name)
							if(src.guildname in G1neut)
								src<<"There neutral with you, you need to raid there Guild House to start war"
								return
						if(H1name==G2name)
							if(src.guildname in G2neut)
								src<<"There neutral with you, you need to raid there Guild House to start war"
								return
						if(H1name==G3name)
							if(src.guildname in G3neut)
								src<<"There neutral with you, you need to raid there Guild House to start war"
								return
						if(H1name==G4name)
							if(src.guildname in G4neut)
								src<<"There neutral with you, you need to raid there Guild House to start war"
								return
						if(H1name==G5name)
							if(src.guildname in G5neut)
								src<<"There neutral with you, you need to raid there Guild House to start war"
								return*/
						H1War(src.guildname)
					if("Karakura Town")
						if(!H2name)
							var/J=0
							for(var/mob/player/M in view(8,src))
								if(M.inghouse==2)
									if(M.inguild&&M.guildname==src.guildname)
										J+=1
							if(J<3)
								src<<"You need at least 3 guild members near you in the House"
								return
							world<<"[src.guildname] just captured Karakura Town Guild House"
							H2name=src.guildname
							HouseSave()
							return
						if(src.guildname==H2name)
							src<<"That's your guild"
							return
						if(src.guildname==G1name)
							if(H2name in G1ally)
								src<<"That's your ally"
								return
						if(src.guildname==G2name)
							if(H2name in G2ally)
								src<<"That's your ally"
								return
						if(src.guildname==G3name)
							if(H2name in G3ally)
								src<<"That's your ally"
								return
						if(src.guildname==G4name)
							if(H2name in G4ally)
								src<<"That's your ally"
								return
						if(src.guildname==G5name)
							if(H2name in G5ally)
								src<<"That's your ally"
								return
						H2War(src.guildname)
					if("Soul Society")
						if(!H3name)
							var/J=0
							for(var/mob/player/M in view(8,src))
								if(M.inghouse==3)
									if(M.inguild&&M.guildname==src.guildname)
										J+=1
							if(J<3)
								src<<"You need at least 3 guild members near you in the House"
								return
							world<<"[src.guildname] just captured Soul Society Guild House"
							H3name=src.guildname
							HouseSave()
							return
						if(src.guildname==H3name)
							src<<"That's your guild"
							return
						if(src.guildname==G1name)
							if(H3name in G1ally)
								src<<"That's your ally"
								return
						if(src.guildname==G2name)
							if(H3name in G2ally)
								src<<"That's your ally"
								return
						if(src.guildname==G3name)
							if(H3name in G3ally)
								src<<"That's your ally"
								return
						if(src.guildname==G4name)
							if(H3name in G4ally)
								src<<"That's your ally"
								return
						if(src.guildname==G5name)
							if(H3name in G5ally)
								src<<"That's your ally"
								return
						H3War(src.guildname)
					if("Rukongai")
						if(!H4name)
							var/J=0
							for(var/mob/player/M in view(8,src))
								if(M.inghouse==4)
									if(M.inguild&&M.guildname==src.guildname)
										J+=1
							if(J<3)
								src<<"You need at least 3 guild members near you in the House"
								return
							world<<"[src.guildname] just captured Rukongai House"
							H4name=src.guildname
							HouseSave()
							return
						if(src.guildname==H4name)
							src<<"That's your guild"
							return
						if(src.guildname==G1name)
							if(H4name in G1ally)
								src<<"That's your ally"
								return
						if(src.guildname==G2name)
							if(H4name in G2ally)
								src<<"That's your ally"
								return
						if(src.guildname==G3name)
							if(H4name in G3ally)
								src<<"That's your ally"
								return
						if(src.guildname==G4name)
							if(H4name in G4ally)
								src<<"That's your ally"
								return
						if(src.guildname==G5name)
							if(H4name in G5ally)
								src<<"That's your ally"
								return
						H4War(src.guildname)
					if("Southern Karakura Town")
						if(!H5name)
							var/J=0
							for(var/mob/player/M in view(8,src))
								if(M.inghouse==5)
									if(M.inguild&&M.guildname==src.guildname)
										J+=1
							if(J<3)
								src<<"You need at least 3 guild members near you in the House"
								return
							world<<"[src.guildname] just captured Southern Karakura House"
							H5name=src.guildname
							HouseSave()
							return
						if(src.guildname==H4name)
							src<<"That's your guild"
							return
						if(src.guildname==G1name)
							if(H5name in G1ally)
								src<<"That's your ally"
								return
						if(src.guildname==G2name)
							if(H5name in G2ally)
								src<<"That's your ally"
								return
						if(src.guildname==G3name)
							if(H5name in G3ally)
								src<<"That's your ally"
								return
						if(src.guildname==G4name)
							if(H5name in G4ally)
								src<<"That's your ally"
								return
						if(src.guildname==G5name)
							if(H5name in G5ally)
								src<<"That's your ally"
								return
						H5War(src.guildname)
	Alliances()
		set category = "Guild"
		if(!src.guildleader)return
		switch(input(src,"Do you want to change your alliances?", text) in list ("Yes","No"))
			if("Yes")
				var/list/Menu=new
				for(var/mob/player/M in world)
					if(M.client)
						if(M.name != src.name)
							if(M.inguild&&M.guildname!=src.guildname)
								Menu.Add(M.guildname)
				var/ally = input("Who do you want to change?","") as null | anything in Menu
				var/you=src.guildname
				//var/ally=M.village
				switch(input(src,"What will [ally] be?", text) in list ("Ally","Neutral","Enemy","Nevermind"))
					if("Ally")
						for(var/mob/player/D in world)
							if(D.guildleader&&D.guildname==ally)
								switch(input(D,"Do you want to ally with [you]?", text) in list ("No","Yes","Maybe Later"))
									if("No")
										src<<"<font face=Berlin Sans FB color=#CCFF00  size=1> <b>Alliance:</b></font>[ally] has declined the alliance"
										return
									if("Maybe Later")
										src<<"<font face=Berlin Sans FB color=#CCFF00  size=1> <b>Alliance:</b></font>[ally] will think it over"
										return
									if("Yes")
										if(src.guildname==G1name)
											if(ally in G1neut)
												if(ally==G2name)
													G2ally+=you
													G2neut-=you
												if(ally==G3name)
													G3ally+=you
													G3neut-=you
												if(ally==G4name)
													G4ally+=you
													G4neut-=you
												if(ally==G5name)
													G5ally+=you
													G5neut-=you
											else
												src<<"<font face=Berlin Sans FB color=#CCFF00  size=1> <b>Alliance:</b></font>[ally] must be in your neutral list first"
												return
											G1ally+=ally
											G1neut-=ally
											world<<"<b><font color=aqua>[G1name] and [ally] are now allies"
										if(src.guildname==G2name)
											if(ally in G2neut)
												if(ally==G1name)
													G1ally+=you
													G1neut-=you
												if(ally==G3name)
													G3ally+=you
													G3neut-=you
												if(ally==G4name)
													G4ally+=you
													G4neut-=you
												if(ally==G5name)
													G5ally+=you
													G5neut-=you
											else
												src<<"<font face=Berlin Sans FB color=#CCFF00  size=1> <b>Alliance:</b></font>[ally] must be in your neutral list first"
												return
											G2ally+=ally
											G2neut-=ally
											world<<"<b><font color=aqua>[G2name] and [ally] are now allies"
										if(src.guildname==G3name)
											if(ally in G3neut)
												if(ally==G1name)
													G1ally+=you
													G1neut-=you
												if(ally==G2name)
													G2ally+=you
													G2neut-=you
												if(ally==G4name)
													G4ally+=you
													G4neut-=you
												if(ally==G5name)
													G5ally+=you
													G5neut-=you
											else
												src<<"<font face=Berlin Sans FB color=#CCFF00  size=1> <b>Alliance:</b></font>[ally] must be in your neutral list first"
												return
											G3ally+=ally
											G3neut-=ally
											world<<"<b><font color=aqua>[G3name] and [ally] are now allies"
										if(src.guildname==G4name)
											if(ally in G4neut)
												if(ally==G1name)
													G1ally+=you
													G1neut-=you
												if(ally==G3name)
													G3ally+=you
													G3neut-=you
												if(ally==G2name)
													G2ally+=you
													G2neut-=you
												if(ally==G5name)
													G5ally+=you
													G5neut-=you
											else
												src<<"<font face=Berlin Sans FB color=#CCFF00  size=1> <b>Alliance:</b></font>[ally] must be in your neutral list first"
												return
											G4ally+=ally
											G4neut-=ally
											world<<"<b><font color=aqua>[G4name] and [ally] are now allies"
										if(src.guildname==G5name)
											if(ally in G5neut)
												if(ally==G1name)
													G1ally+=you
													G1neut-=you
												if(ally==G3name)
													G3ally+=you
													G3neut-=you
												if(ally==G4name)
													G4ally+=you
													G4neut-=you
												if(ally==G2name)
													G2ally+=you
													G2neut-=you
											else
												src<<"<font face=Berlin Sans FB color=#CCFF00  size=1> <b>Alliance:</b></font>[ally] must be in your neutral list first"
												return
											G5ally+=ally
											G5neut-=ally
											world<<"<b><font color=aqua>[G5name] and [ally] are now allies"
										AllySave()
					if("Enemy")
						if(src.guildname==G1name)
							if(ally in G1ally)
								if(ally==G2name)
									G2ally-=you
									G2neut+=you
								if(ally==G3name)
									G3ally-=you
									G3neut+=you
								if(ally==G4name)
									G4ally-=you
									G4neut+=you
								if(ally==G5name)
									G5ally-=you
									G5neut+=you
								G1ally-=ally
							G1neut-=ally
							world<<"<b><font color=aqua>[ally] are now enemies of [G1name]"
						if(src.guildname==G2name)
							if(ally in G2ally)
								if(ally==G1name)
									G1ally-=you
									G1neut+=you
								if(ally==G3name)
									G3ally-=you
									G3neut+=you
								if(ally==G4name)
									G4ally-=you
									G4neut+=you
								if(ally==G5name)
									G5ally-=you
									G5neut+=you
								G2ally-=ally
							G2neut-=ally
							world<<"<b><font color=aqua>[ally] are now enemies of [G2name]"
						if(src.guildname==G3name)
							if(ally in G3ally)
								if(ally==G1name)
									G1ally-=you
									G1neut+=you
								if(ally==G2name)
									G2ally-=you
									G2neut+=you
								if(ally==G4name)
									G4ally-=you
									G4neut+=you
								if(ally==G5name)
									G5ally-=you
									G5neut+=you
								G3ally-=ally
							G3neut-=ally
							world<<"<b><font color=aqua>[ally] are now enemies of [G3name]"
						if(src.guildname==G4name)
							if(ally in G4ally)
								if(ally==G1name)
									G1ally-=you
									G1neut+=you
								if(ally==G2name)
									G2ally-=you
									G2neut+=you
								if(ally==G3name)
									G3ally-=you
									G3neut+=you
								if(ally==G5name)
									G5ally-=you
									G5neut+=you
								G4ally-=ally
							G4neut-=ally
							world<<"<b><font color=aqua>[ally] are now enemies of [G4name]"
						if(src.guildname==G5name)
							if(ally in G5ally)
								if(ally==G1name)
									G1ally-=you
									G1neut+=you
								if(ally==G2name)
									G2ally-=you
									G2neut+=you
								if(ally==G4name)
									G4ally-=you
									G4neut+=you
								if(ally==G3name)
									G3ally-=you
									G3neut+=you
								G5ally-=ally
							G5neut-=ally
							world<<"<b><font color=aqua>[ally] are now enemies of [G5name]"
						AllySave()
					if("Neutral")
						if(src.guildname==G1name)
							if(ally in G1ally)
								if(ally==G2name)
									G2ally-=you
									G2neut+=you
								if(ally==G3name)
									G3ally-=you
									G3neut+=you
								if(ally==G4name)
									G4ally-=you
									G4neut+=you
								if(ally==G5name)
									G5ally-=you
									G5neut+=you
								G1ally-=ally
							G1neut+=ally
							world<<"<b><font color=aqua>[G1name] is neutral with [ally]"
						if(src.guildname==G2name)
							if(ally in G2ally)
								if(ally==G1name)
									G1ally-=you
									G1neut+=you
								if(ally==G3name)
									G3ally-=you
									G3neut+=you
								if(ally==G4name)
									G4ally-=you
									G4neut+=you
								if(ally==G5name)
									G5ally-=you
									G5neut+=you
								G2ally-=ally
							G2neut+=ally
							world<<"<b><font color=aqua>[G2name] is neutral with [ally]"
						if(src.guildname==G3name)
							if(ally in G3ally)
								if(ally==G1name)
									G1ally-=you
									G1neut+=you
								if(ally==G2name)
									G2ally-=you
									G2neut+=you
								if(ally==G4name)
									G4ally-=you
									G4neut+=you
								if(ally==G5name)
									G5ally-=you
									G5neut+=you
								G3ally-=ally
							G3neut+=ally
							world<<"<b><font color=aqua>[G3name] is neutral with [ally]"
						if(src.guildname==G4name)
							if(ally in G4ally)
								if(ally==G1name)
									G1ally-=you
									G1neut+=you
								if(ally==G2name)
									G2ally-=you
									G2neut+=you
								if(ally==G3name)
									G3ally-=you
									G3neut+=you
								if(ally==G5name)
									G5ally-=you
									G5neut+=you
								G4ally-=ally
							G4neut+=ally
							world<<"<b><font color=aqua>[G4name] is neutral with [ally]"
						if(src.guildname==G5name)
							if(ally in G5ally)
								if(ally==G1name)
									G1ally-=you
									G1neut+=you
								if(ally==G2name)
									G2ally-=you
									G2neut+=you
								if(ally==G3name)
									G3ally-=you
									G3neut+=you
								if(ally==G4name)
									G4ally-=you
									G4neut+=you
								G5ally-=ally
							G5neut+=ally
							world<<"<b><font color=aqua>[G5name] is neutral with [ally]"
						AllySave()

mob/proc
	Create_Guild(number)
		if(src.inguild)
			src<<"<font face=Berlin Sans FB color=#66CCCC  size=1> <b>Guild:</b></font>You are already in a guild"
			return
		if(src.level<100)
			src<<"<font face=Berlin Sans FB color=#66CCCC  size=1> <b>Guild:</b></font>You must be level 100 to create a guild"
			return
		switch(alert("Are you sure you want to create a guild?","","Yes","No"))
			if("Yes")
				var/orgname = input("What will be the name of your guild?(NOTE:DO NOT USE HTML OR FONT COLORS)","") as text
				if(orgname in organizations)
					src<<"<font face=Berlin Sans FB color=#66CCCC  size=1> <b>Guild:</b></font>That name is already taken"
					return
				src.guildname=orgname
				organizations+=orgname
				var/namer="[src.name]"
				if(number==1)
					G1name=guildname
					G1mems+=namer
					G1mems-="None"
					G1lvl=0
				if(number==2)
					G2name=guildname
					G2mems+=namer
					G2mems-="None"
					G2lvl=0
				if(number==3)
					G3name=guildname
					G3mems+=namer
					G3mems-="None"
					G3lvl=0
				if(number==4)
					G4name=guildname
					G4mems+=namer
					G4mems-="None"
					G4lvl=0
				if(number==5)
					G5name=guildname
					G5mems+=namer
					G5mems-="None"
					G5lvl=0
				OrgSave()
				src.guildleader=1
				src.Guild_Rank="Guild Leader"
				src.inguild=1
				src.Give_Guild_Verbs()
				src << "<b><font color = green>You have created a Guild!"
			if("No")
				return
var
	H1ally=0
	H1enemy=0
	H2ally=0
	H2enemy=0
	H3ally=0
	H3enemy=0
	H4ally=0
	H4enemy=0
	H5ally=0
	H5enemy=0
	E1name=""
	E2name=""
	E3name=""
	E4name=""
	E5name=""
proc
	H1War(gname)
		if(H1guildwar||H1guildwarcool)return
		H1guildwar=1
		world<<"<font color=aqua><b><font size=3>[gname] has started war with [H1name], the Hueco Mundo Guild House will be locked in 2 minutes"
		E1name=gname
		H1ally=0
		H1enemy=0
		for(var/mob/player/M in world)
			if(M.guildname==gname)
				H1enemy+=1
				M.ingwar=1
			if(M.guildname==H1name)
				M.ingwar=1
				H1ally+=1
		sleep(1200)
		if(H1guildwar)
			world<<"<font color=aqua><b>The Hueco Mundo Guild House is now locked"
			for(var/mob/player/M in world)
				if(M.ingwar==1&&M.inghouse!=1)
					M.ingwar=0
					if(M.guildname==H1name)
						H1ally-=1
					if(M.guildname==gname)
						H1enemy-=1
				if(M.ingwar==1&&M.inghouse==1)
					M<<"<font color=aqua><b>You have gained 0.5 guild points for participating"
					M.guildpoints+=0.5
			H1Winner()
proc
	H1Winner()
		if(H1guildwarcool)return
		if(!H1guildwar)return
		if(H1enemy<=0)
			var/gname=E1name
			world<<"<font color=aqua><b>The Hueco Mundo Guild House has been protected by [H1name]"
			for(var/mob/player/M in world)
				if(M.guildname==H1name&&M.ingwar==1)
					M<<"<font color=aqua>You gained 1.5 guild points for winning"
					M.guildpoints+=1.5
			if(H1name==G1name)
				G1lvl+=2
			if(H1name==G2name)
				G2lvl+=2
			if(H1name==G3name)
				G3lvl+=2
			if(H1name==G4name)
				G4lvl+=2
			if(H1name==G5name)
				G5lvl+=2
			if(gname==G1name)
				G1lvl-=1
				if(G1lvl<0)
					G1lvl=0
			if(gname==G2name)
				G2lvl-=1
				if(G2lvl<0)
					G2lvl=0
			if(gname==G3name)
				G3lvl-=1
				if(G3lvl<0)
					G3lvl=0
			if(gname==G4name)
				G4lvl-=1
				if(G4lvl<0)
					G4lvl=0
			if(gname==G5name)
				G5lvl-=1
				if(G5lvl<0)
					G5lvl=0
			H1name=gname
			H1guildwar=0
			H1guildwarcool=1
			HouseSave()
			sleep(18000)
			H1guildwarcool=0
			world<<"<font color=aqua><b>The Hueco Mundo Guild House is now vulnerable"
			return
		if(H1ally<=0)
			var/gname=E1name
			world<<"<font color=aqua><b>The Hueco Mundo Guild House has been captured by [gname]"
			for(var/mob/player/M in world)
				if(M.guildname==gname&&M.ingwar==1)
					M<<"<font color=aqua>You gained 1.5 guild points for winning"
					M.guildpoints+=1.5
			if(H1name==G1name)
				G1lvl-=1
			if(H1name==G2name)
				G2lvl-=1
			if(H1name==G3name)
				G3lvl-=1
			if(H1name==G4name)
				G4lvl-=1
			if(H1name==G5name)
				G5lvl-=1
			if(G1lvl<0)
				G1lvl=0
			if(G2lvl<0)
				G2lvl=0
			if(G3lvl<0)
				G3lvl=0
			if(G4lvl<0)
				G4lvl=0
			if(G5lvl<0)
				G5lvl=0
			if(gname==G1name)
				G1lvl+=2
			if(gname==G2name)
				G2lvl+=2
			if(gname==G3name)
				G3lvl+=2
			if(gname==G4name)
				G4lvl+=2
			if(gname==G5name)
				G5lvl+=2
			H1name=gname
			H1guildwar=0
			H1guildwarcool=1
			HouseSave()
			sleep(18000)
			H1guildwarcool=0
			world<<"<font color=aqua><b>The Hueco Mundo Guild House is now vulnerable"
proc
	H2War(gname)
		if(H2guildwar||H2guildwarcool)return
		H2guildwar=1
		world<<"<font color=aqua><b><font size=3>[gname] has started war with [H2name], the Karakura Town Guild House will be locked in 2 minutes"
		E2name=gname
		H2ally=0
		H2enemy=0
		for(var/mob/player/M in world)
			if(M.guildname==gname)
				H2enemy+=1
				M.ingwar=1
			if(M.guildname==H2name)
				M.ingwar=1
				H2ally+=1
		sleep(1200)
		if(H2guildwar)
			world<<"<font color=aqua><b>The Karakura Town Guild House is now locked"
			for(var/mob/player/M in world)
				if(M.ingwar==1&&M.inghouse!=2)
					M.ingwar=0
					if(M.guildname==H2name)
						H2ally-=1
					if(M.guildname==gname)
						H2enemy-=1
				if(M.ingwar==1&&M.inghouse==2)
					M<<"<font color=aqua><b>You have gained 0.5 guild points for participating"
					M.guildpoints+=0.5
			H2Winner()
proc
	H2Winner()
		if(H2guildwarcool)return
		if(!H2guildwar)return
		if(H2enemy<=0)
			var/gname=E2name
			world<<"<font color=aqua><b>The Karakura Guild House has been protected by [H2name]"
			for(var/mob/player/M in world)
				if(M.guildname==H2name&&M.ingwar==1)
					M<<"<font color=aqua>You gained 1.5 guild points for winning"
					M.guildpoints+=1.5
			if(H2name==G1name)
				G1lvl+=2
			if(H2name==G2name)
				G2lvl+=2
			if(H2name==G3name)
				G3lvl+=2
			if(H2name==G4name)
				G4lvl+=2
			if(H2name==G5name)
				G5lvl+=2
			if(gname==G1name)
				G1lvl-=1
				if(G1lvl<0)
					G1lvl=0
			if(gname==G2name)
				G2lvl-=1
				if(G2lvl<0)
					G2lvl=0
			if(gname==G3name)
				G3lvl-=1
				if(G3lvl<0)
					G3lvl=0
			if(gname==G4name)
				G4lvl-=1
				if(G4lvl<0)
					G4lvl=0
			if(gname==G5name)
				G5lvl-=1
				if(G5lvl<0)
					G5lvl=0
			H2name=gname
			H2guildwar=0
			H2guildwarcool=1
			HouseSave()
			sleep(18000)
			H2guildwarcool=0
			world<<"<font color=aqua><b>The Karakura Town Guild House is now vulnerable"
			return
		if(H2ally<=0)
			var/gname=E2name
			world<<"<font color=aqua><b>The Karakura Guild House has been captured by [gname]"
			for(var/mob/player/M in world)
				if(M.guildname==gname&&M.ingwar==1)
					M<<"<font color=aqua>You gained 1.5 guild points for winning"
					M.guildpoints+=1.5
			if(H2name==G1name)
				G1lvl-=1
			if(H2name==G2name)
				G2lvl-=1
			if(H2name==G3name)
				G3lvl-=1
			if(H2name==G4name)
				G4lvl-=1
			if(H2name==G5name)
				G5lvl-=1
			if(G1lvl<0)
				G1lvl=0
			if(G2lvl<0)
				G2lvl=0
			if(G3lvl<0)
				G3lvl=0
			if(G4lvl<0)
				G4lvl=0
			if(G5lvl<0)
				G5lvl=0
			if(gname==G1name)
				G1lvl+=2
			if(gname==G2name)
				G2lvl+=2
			if(gname==G3name)
				G3lvl+=2
			if(gname==G4name)
				G4lvl+=2
			if(gname==G5name)
				G5lvl+=2
			H2name=gname
			H2guildwar=0
			H2guildwarcool=1
			HouseSave()
			sleep(18000)
			H2guildwarcool=0
			world<<"<font color=aqua><b>The Karakura Town Guild House is now vulnerable"
proc
	H3War(gname)
		if(H3guildwar||H3guildwarcool)return
		H3guildwar=1
		world<<"<font color=aqua><b><font size=3>[gname] has started war with [H3name], the Soul Society Guild House will be locked in 2 minutes"
		E3name=gname
		H3ally=0
		H3enemy=0
		for(var/mob/player/M in world)
			if(M.guildname==gname)
				H3enemy+=1
				M.ingwar=1
			if(M.guildname==H3name)
				M.ingwar=1
				H3ally+=1
		sleep(1200)
		if(H3guildwar)
			world<<"<font color=aqua><b>The Soul Society Guild House is now locked"
			for(var/mob/player/M in world)
				if(M.ingwar==1&&M.inghouse!=3)
					M.ingwar=0
					if(M.guildname==H3name)
						H3ally-=1
					if(M.guildname==gname)
						H3enemy-=1
				if(M.ingwar==1&&M.inghouse==3)
					M<<"<font color=aqua><b>You have gained 0.5 guild points for participating"
					M.guildpoints+=0.5
			H3Winner()
proc
	H3Winner()
		if(H3guildwarcool)return
		if(!H3guildwar)return
		if(H3enemy<=0)
			var/gname=E3name
			world<<"<font color=aqua><b>The Soul Society Guild House has been protected by [H3name]"
			for(var/mob/player/M in world)
				if(M.guildname==H3name&&M.ingwar==1)
					M<<"<font color=aqua>You gained 1.5 guild points for winning"
					M.guildpoints+=1.5
			if(H3name==G1name)
				G1lvl+=2
			if(H3name==G2name)
				G2lvl+=2
			if(H3name==G3name)
				G3lvl+=2
			if(H3name==G4name)
				G4lvl+=2
			if(H3name==G5name)
				G5lvl+=2
			if(gname==G1name)
				G1lvl-=1
				if(G1lvl<0)
					G1lvl=0
			if(gname==G2name)
				G2lvl-=1
				if(G2lvl<0)
					G2lvl=0
			if(gname==G3name)
				G3lvl-=1
				if(G3lvl<0)
					G3lvl=0
			if(gname==G4name)
				G4lvl-=1
				if(G4lvl<0)
					G4lvl=0
			if(gname==G5name)
				G5lvl-=1
				if(G5lvl<0)
					G5lvl=0
			H3name=gname
			H3guildwar=0
			H3guildwarcool=1
			HouseSave()
			sleep(18000)
			H3guildwarcool=0
			world<<"<font color=aqua><b>The Soul Society Guild House is now vulnerable"
			return
		if(H3ally<=0)
			var/gname=E3name
			world<<"<font color=aqua><b>The Soul Society Guild House has been captured by [gname]"
			for(var/mob/player/M in world)
				if(M.guildname==gname&&M.ingwar==1)
					M<<"<font color=aqua>You gained 1.5 guild points for winning"
					M.guildpoints+=1.5
			if(H3name==G1name)
				G1lvl-=1
			if(H3name==G2name)
				G2lvl-=1
			if(H3name==G3name)
				G3lvl-=1
			if(H3name==G4name)
				G4lvl-=1
			if(H3name==G5name)
				G5lvl-=1
			if(G1lvl<0)
				G1lvl=0
			if(G2lvl<0)
				G2lvl=0
			if(G3lvl<0)
				G3lvl=0
			if(G4lvl<0)
				G4lvl=0
			if(G5lvl<0)
				G5lvl=0
			if(gname==G1name)
				G1lvl+=2
			if(gname==G2name)
				G2lvl+=2
			if(gname==G3name)
				G3lvl+=2
			if(gname==G4name)
				G4lvl+=2
			if(gname==G5name)
				G5lvl+=2
			H3name=gname
			H3guildwar=0
			H3guildwarcool=1
			HouseSave()
			sleep(18000)
			H3guildwarcool=0
			world<<"<font color=aqua><b>The Soul Society Guild House is now vulnerable"
proc
	H4War(gname)
		if(H4guildwar||H4guildwarcool)return
		H4guildwar=1
		world<<"<font color=aqua><b><font size=3>[gname] has started war with [H4name], the Rukongai Guild House will be locked in 2 minutes"
		E4name=gname
		H4ally=0
		H4enemy=0
		for(var/mob/player/M in world)
			if(M.guildname==gname)
				H4enemy+=1
				M.ingwar=1
			if(M.guildname==H4name)
				M.ingwar=1
				H4ally+=1
		sleep(1200)
		if(H4guildwar)
			world<<"<font color=aqua><b>The Rukongai Guild House is now locked"
			for(var/mob/player/M in world)
				if(M.ingwar==1&&M.inghouse!=4)
					M.ingwar=0
					if(M.guildname==H4name)
						H4ally-=1
					if(M.guildname==gname)
						H4enemy-=1
				if(M.ingwar==1&&M.inghouse==4)
					M<<"<font color=aqua><b>You have gained 0.5 guild points for participating"
					M.guildpoints+=0.5
			H4Winner()
proc
	H4Winner()
		if(H4guildwarcool)return
		if(!H4guildwar)return
		if(H4enemy<=0)
			var/gname=E4name
			world<<"<font color=aqua><b>The Rukongai Guild House has been protected by [H4name]"
			for(var/mob/player/M in world)
				if(M.guildname==H4name&&M.ingwar==1)
					M<<"<font color=aqua>You gained 1.5 guild points for winning"
					M.guildpoints+=1.5
			if(H4name==G1name)
				G1lvl+=2
			if(H4name==G2name)
				G2lvl+=2
			if(H4name==G3name)
				G3lvl+=2
			if(H4name==G4name)
				G4lvl+=2
			if(H4name==G5name)
				G5lvl+=2
			if(gname==G1name)
				G1lvl-=1
				if(G1lvl<0)
					G1lvl=0
			if(gname==G2name)
				G2lvl-=1
				if(G2lvl<0)
					G2lvl=0
			if(gname==G3name)
				G3lvl-=1
				if(G3lvl<0)
					G3lvl=0
			if(gname==G4name)
				G4lvl-=1
				if(G4lvl<0)
					G4lvl=0
			if(gname==G5name)
				G5lvl-=1
				if(G5lvl<0)
					G5lvl=0
			H4name=gname
			H4guildwarcool=1
			H4guildwar=0
			HouseSave()
			sleep(18000)
			H4guildwarcool=0
			world<<"<font color=aqua><b>The Rukongai Guild House is now vulnerable"
			return
		if(H4ally<=0)
			var/gname=E4name
			world<<"<font color=aqua><b>The Rukongai Guild House has been captured by [gname]"
			for(var/mob/player/M in world)
				if(M.guildname==gname&&M.ingwar==1)
					M<<"<font color=aqua>You gained 1.5 guild points for winning"
					M.guildpoints+=1.5
			if(H4name==G1name)
				G1lvl-=1
			if(H4name==G2name)
				G2lvl-=1
			if(H4name==G3name)
				G3lvl-=1
			if(H4name==G4name)
				G4lvl-=1
			if(H4name==G5name)
				G5lvl-=1
			if(G1lvl<0)
				G1lvl=0
			if(G2lvl<0)
				G2lvl=0
			if(G3lvl<0)
				G3lvl=0
			if(G4lvl<0)
				G4lvl=0
			if(G5lvl<0)
				G5lvl=0
			if(gname==G1name)
				G1lvl+=2
			if(gname==G2name)
				G2lvl+=2
			if(gname==G3name)
				G3lvl+=2
			if(gname==G4name)
				G4lvl+=2
			if(gname==G5name)
				G5lvl+=2
			H4name=gname
			H4guildwarcool=1
			H4guildwar=0
			HouseSave()
			sleep(18000)
			H4guildwarcool=0
			world<<"<font color=aqua><b>The Rukongai Guild House is now vulnerable"
proc
	H5War(gname)
		if(H5guildwar||H5guildwarcool)return
		H5guildwar=1
		world<<"<font color=aqua><b><font size=3>[gname] has started war with [H5name], the Southern Karakura Town Guild House will be locked in 2 minutes"
		E5name=gname
		H5ally=0
		H5enemy=0
		for(var/mob/player/M in world)
			if(M.guildname==gname)
				H5enemy+=1
				M.ingwar=1
			if(M.guildname==H5name)
				M.ingwar=1
				H5ally+=1
		sleep(1200)
		if(H5guildwar)
			world<<"<font color=aqua><b>The Southern Karakura Town Guild House is now locked"
			for(var/mob/player/M in world)
				if(M.ingwar==1&&M.inghouse!=5)
					M.ingwar=0
					if(M.guildname==H5name)
						H5ally-=1
					if(M.guildname==gname)
						H5enemy-=1
				if(M.ingwar==1&&M.inghouse==5)
					M<<"<font color=aqua><b>You have gained 0.5 guild points for participating"
					M.guildpoints+=0.5
			H5Winner()
proc
	H5Winner()
		if(H5guildwarcool)return
		if(!H5guildwar)return
		if(H5enemy<=0)
			var/gname=E5name
			world<<"<font color=aqua><b>The Southern Karakura Guild House has been protected by [H5name]"
			for(var/mob/player/M in world)
				if(M.guildname==H5name&&M.ingwar==1)
					M<<"<font color=aqua>You gained 1.5 guild points for winning"
					M.guildpoints+=1.5
			if(H5name==G1name)
				G1lvl+=2
			if(H5name==G2name)
				G2lvl+=2
			if(H5name==G3name)
				G3lvl+=2
			if(H5name==G4name)
				G4lvl+=2
			if(H5name==G5name)
				G5lvl+=2
			if(gname==G1name)
				G1lvl-=1
				if(G1lvl<0)
					G1lvl=0
			if(gname==G2name)
				G2lvl-=1
				if(G2lvl<0)
					G2lvl=0
			if(gname==G3name)
				G3lvl-=1
				if(G3lvl<0)
					G3lvl=0
			if(gname==G4name)
				G4lvl-=1
				if(G4lvl<0)
					G4lvl=0
			if(gname==G5name)
				G5lvl-=1
				if(G5lvl<0)
					G5lvl=0
			H5name=gname
			H5guildwarcool=1
			H5guildwar=0
			HouseSave()
			sleep(18000)
			H5guildwarcool=0
			world<<"<font color=aqua><b>The Southern Karakura Town Guild House is now vulnerable"
			return
		if(H5ally<=0)
			var/gname=E5name
			world<<"<font color=aqua><b>The Southern Karakura Guild House has been captured by [gname]"
			for(var/mob/player/M in world)
				if(M.guildname==gname&&M.ingwar==1)
					M<<"<font color=aqua>You gained 1.5 guild points for winning"
					M.guildpoints+=1.5
			if(H5name==G1name)
				G1lvl-=1
			if(H5name==G2name)
				G2lvl-=1
			if(H5name==G3name)
				G3lvl-=1
			if(H5name==G4name)
				G4lvl-=1
			if(H5name==G5name)
				G5lvl-=1
			if(G1lvl<0)
				G1lvl=0
			if(G2lvl<0)
				G2lvl=0
			if(G3lvl<0)
				G3lvl=0
			if(G4lvl<0)
				G4lvl=0
			if(G5lvl<0)
				G5lvl=0
			if(gname==G1name)
				G1lvl+=2
			if(gname==G2name)
				G2lvl+=2
			if(gname==G3name)
				G3lvl+=2
			if(gname==G4name)
				G4lvl+=2
			if(gname==G5name)
				G5lvl+=2
			H5name=gname
			H5guildwarcool=1
			H5guildwar=0
			HouseSave()
			sleep(18000)
			H5guildwarcool=0
			world<<"<font color=aqua><b>The Southern Karakura Town Guild House is now vulnerable"

mob/Guild_Leader
	verb
		Guild_Invite()
			set category = "Guild"
			if(!src.guildleader)
				src<<"<font face=Berlin Sans FB color=#CC9933  size=1> <b>Guild:</b></font>You must be the leader to invite"
				return
			else
				var/list/Menu = list()
				for(var/mob/player/M in world)
					if(M.client)
						if(M.name != src.name)
							if(!M.inguild)
								Menu.Add(M)
				var/mob/M = input("Who do you want to invite to [src.guildname]?","") as null | anything in Menu
				switch(alert(M,"Do you want to join the [src.guildname] Guild?","","Yes","No"))
					if("Yes")
						if(M.inguild)return
						var/namer="[M.name]"
						if(src.guildname==G1name)
							if(G1mems.len==30)
								src<<"<b><font color = green>Guild Info: The Guild is full"
								M<<"<b><font color = green>Guild Info: The Guild is full"
								return
							G1mems+=namer
						if(src.guildname==G2name)
							if(G2mems.len==30)
								src<<"<b><font color = green>Guild Info: The Guild is full"
								M<<"<b><font color = green>Guild Info: The Guild is full"
								return
							G2mems+=namer
						if(src.guildname==G3name)
							if(G3mems.len==30)
								src<<"<b><font color = green>Guild Info: The Guild is full"
								M<<"<b><font color = green>Guild Info: The Guild is full"
								return
							G3mems+=namer
						if(src.guildname==G4name)
							if(G4mems.len==30)
								src<<"<b><font color = green>Guild Info: The Guild is full"
								M<<"<b><font color = green>Guild Info: The Guild is full"
								return
							G4mems+=namer
						if(src.guildname==G5name)
							if(G5mems.len==30)
								src<<"<b><font color = green>Guild Info: The Guild is full"
								M<<"<b><font color = green>Guild Info: The Guild is full"
								return
							G5mems+=namer
						M.guildname=src.guildname
						M.inguild=1
						M.Give_Guild_Verbs()
						world << "<b><font color = green>Guild Info: [M] has joined [src.guildname]!"
						AllySave()
					if("No")
						src << "<font face=Berlin Sans FB color=#CC9933  size=1> <b>Guild:</b></font>[M] has declined your Guild Invite"
						return
		Guild_Exile()
			set category = "Guild"
			if(!src.guildleader)
				src<<"<font face=Berlin Sans FB color=#CC9933  size=1> <b>Guild:</b></font>You must be the leader to exile"
				return
			else
				var/list/Menu = list()
				Menu+="Cancel"
				if(src.guildname==G1name)
					Menu.Add(G1mems)
				if(src.guildname==G2name)
					Menu.Add(G2mems)
				if(src.guildname==G3name)
					Menu.Add(G3mems)
				if(src.guildname==G4name)
					Menu.Add(G4mems)
				if(src.guildname==G5name)
					Menu.Add(G5mems)
				var/M = input("Who do you want to kick from [src.guildname] that's offline?","") as null | anything in Menu
				if(!M||M=="Cancel")return
				switch(alert(src,"Are you sure you want to exile [M]?","","Yes","No"))
					if("Yes")
						if(src.guildname==G1name)
							G1mems-=M
						if(src.guildname==G2name)
							G2mems-=M
						if(src.guildname==G3name)
							G3mems-=M
						if(src.guildname==G4name)
							G4mems-=M
						if(src.guildname==G5name)
							G5mems-=M
						AllySave()
						world << "<b><font color = green>Guild Info: [M] has been exiled from [src.guildname]!"
					if("No")
						return
		Guild_Boot()
			set category = "Guild"
			if(!src.guildleader)
				src<<"<font face=Berlin Sans FB color=#CC9933  size=1> <b>Guild:</b></font>You must be the leader to kick"
				return
			else
				var/list/Menu = list()
				Menu+="Cancel"
				for(var/mob/player/M in world)
					if(M.client)
						if(M.name != src.name)
							if(M.guildname==src.guildname)
								Menu.Add(M)
				var/mob/M = input("Who do you want to kick from [src.guildname] that's online?","") as null | anything in Menu
				if(!M||M=="Cancel")return
				switch(alert(src,"Are you sure you want to kick [M]?","","Yes","No"))
					if("Yes")
						var/namer="[M.name]"
						if(M.guildname==G1name)
							G1mems-=namer
						if(M.guildname==G2name)
							G2mems-=namer
						if(M.guildname==G3name)
							G3mems-=namer
						if(M.guildname==G4name)
							G4mems-=namer
						if(M.guildname==G5name)
							G5mems-=namer
						M.guildname=""
						M.inguild=0
						M.leaveguild()
						AllySave()
						world << "<b><font color = green>Guild Info: [M] has been kicked out of [src.guildname]!"
					if("No")
						return
		Give_Co_Leader()
			set category = "Guild"
			if(!src.guildleader)
				src<<"<font face=Berlin Sans FB color=#660066  size=1> <b>Rank:</b></font>You must be the leader to kick"
				return
			else
				var/list/Menu = list()
				Menu+="Cancel"
				for(var/mob/player/M in world)
					if(M.client)
						if(M.name != src.name)
							if(M.guildname==src.guildname)
								Menu.Add(M)
				var/mob/M = input("Who do you want to be co-leader in [src.guildname]?","") as null | anything in Menu
				switch(alert(src,"Are you sure you want [M] to be the new co-leader?","","Yes","No"))
					if("Yes")
						M.guildleader=1
						M.Give_Guild_Verbs()
						M.Guild_Rank="Guild Co-Leader"
						M<<"You are now the Co leader of [src.guildname]"
						return
					if("No")
						return
		Give_Guild_Recruit()
			set category = "Guild"
			if(!src.guildleader)
				src<<"<font face=Berlin Sans FB color=#660066  size=1> <b>Rank:</b></font>You must be the leader to kick"
				return
			else
				var/list/Menu = list()
				Menu+="Cancel"
				for(var/mob/player/M in world)
					if(M.client)
						if(M.name != src.name)
							if(M.guildname==src.guildname)
								Menu.Add(M)
				var/mob/M = input("Who do you want to give guild recruit to in [src.guildname]?","") as null | anything in Menu
				switch(alert(src,"Are you sure you want [M] to be able to recruit members?","","Yes","No"))
					if("Yes")
						M.Give_Guilds_Verbs2()
						M.canrecruitguild=1
						var/x=input("What do you want [M]'s rank to be?")as text
						if(length(x) >= 100)
							src<<"<b><font color=yellow>Guild name must be restricted to 100 letters.</b></font>"
							return
						M.Guild_Rank=x
						return
					if("No")
						return
			return
		Guild_Announce(T as text)
			set category = "Guild"
			var/list/L
			L = list("font size")
			if(length(T) > 400)
				alert("Your message must be less than 400 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/player/X in world)
				if(X.guildname == usr.guildname)
					X << output("<font size=3><font color = yellow><font face=times new roman><b><center>[usr] would like to Announce to the Guild:<center><br>[T]","output")

mob/Guild_Verbs
	verb
		Alliance_Say(T as text)
			set category = "Guild"

			var/list/L
			L = list("font size")

			if(length(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			var/gname=src.guildname
			if(gname==G1name)
				for(var/mob/player/X in world)
					if(X.guildname == usr.guildname)
						X << output("<b><font color = aqua>(Alliance Say)[src.name]: [T]","output")
					if(X.guildname in G1ally)
						X << output("<b><font color = aqua>(Alliance Say)[src.name]: [T]","output")
			if(gname==G2name)
				for(var/mob/player/X in world)
					if(X.guildname == usr.guildname)
						X << output("<b><font color = aqua>(Alliance Say)[src.name]: [T]","output")
					if(X.guildname in G2ally)
						X << output("<b><font color = aqua>(Alliance Say)[src.name]: [T]","output")
			if(gname==G3name)
				for(var/mob/player/X in world)
					if(X.guildname == usr.guildname)
						X << output("<b><font color = aqua>(Alliance Say)[src.name]: [T]","output")
					if(X.guildname in G3ally)
						X << output("<b><font color = aqua>(Alliance Say)[src.name]: [T]","output")
			if(gname==G4name)
				for(var/mob/player/X in world)
					if(X.guildname == usr.guildname)
						X << output("<b><font color = aqua>(Alliance Say)[src.name]: [T]","output")
					if(X.guildname in G4ally)
						X << output("<b><font color = aqua>(Alliance Say)[src.name]: [T]","output")
			if(gname==G5name)
				for(var/mob/player/X in world)
					if(X.guildname == usr.guildname)
						X << output("<b><font color = aqua>(Alliance Say)[src.name]: [T]","output")
					if(X.guildname in G5ally)
						X << output("<b><font color = aqua>(Alliance Say)[src.name]: [T]","output")
		Guild_Say(T as text)
			set category = "Guild"

			var/list/L
			L = list("font size")

			if(length(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/player/X in world)
				if(X.guildname == usr.guildname)
					X << output("<b><font color = aqua><font size=2>([src.Guild_Rank])[src.name]: [T]","output")


		Guild_Who()
			set category = "Guild"
			var/tmp/C = 0
			var/list/Menu=list()
			if(usr.guildname==G1name)
				Menu+=G1mems
			if(usr.guildname==G2name)
				Menu+=G2mems
			if(usr.guildname==G3name)
				Menu+=G3mems
			if(usr.guildname==G4name)
				Menu+=G4mems
			if(usr.guildname==G5name)
				Menu+=G5mems
			usr << "<font size=1><b><font color=silver><center>---------------------GUILD WHO------------------------"
			for(var/mob/player/M in world)
				if(M.inguild)
					if(M.guildname == usr.guildname)
						Menu.Remove(M.name)
						usr << "<font size=1><b><font color=aqua>[M.name] - Online"
						C += 1
			for(var/a in Menu)
				usr << "<font size=1><b><font color=aqua>[a]"
			usr << "<b><font color = aqua>[C] Guild Members Online!"
			usr << "<font size=1><b><font color=silver><center>---------------------GUILD WHO------------------------"
		Guild_Leave()
			set category = "Guild"
			switch(input(src,"Do you want to leave the guild?(NOTE: You may not be able to return)", text) in list ("Yes","No"))
				if("Yes")
					var/mob/M=src
					var/namer="[M.name]"
					if(M.guildname==G1name)
						G1mems-=namer
						if(G1mems.len<=1)
							world << "<b><font color = aqua>Guild Info: [usr] has disbanded Guild [usr.guildname]!"
							G1name=""
							G1ally=list("None")
							G1neut=list("None")
					if(M.guildname==G2name)
						G2mems-=namer
						if(G2mems.len<=1)
							world << "<b><font color = aqua>Guild Info: [usr] has disbanded Guild [usr.guildname]!"
							G2name=""
							G2ally=list("None")
							G2neut=list("None")
					if(M.guildname==G3name)
						G3mems-=namer
						if(G3mems.len<=1)
							world << "<b><font color = aqua>Guild Info: [usr] has disbanded Guild [usr.guildname]!"
							G3name=""
							G3ally=list("None")
							G3neut=list("None")
					if(M.guildname==G4name)
						G4mems-=namer
						if(G4mems.len<=1)
							world << "<b><font color = aqua>Guild Info: [usr] has disbanded Guild [usr.guildname]!"
							G4name=""
							G4ally=list("None")
							G4neut=list("None")
					if(M.guildname==G5name)
						G5mems-=namer
						if(G5mems.len<=1)
							world << "<b><font color = aqua>Guild Info: [usr] has disbanded Guild [usr.guildname]!"
							G5name=""
							G5ally=list("None")
							G5neut=list("None")
					world << "<b><font color = aqua>Guild Info: [usr] has left the Guild [usr.guildname]!"
					src.guildleader=0
					src.guildname=""
					src.inguild=0
					AllySave()
					src.leaveguild()
				if("No")
					return

mob
	proc
		Give_Guild_Verbs()
			if(src.guildleader)
				src.verbs += typesof(/mob/Guild_Leader/verb)
				src.verbs += typesof(/mob/Guild_Verbs/verb)
			if(!src.guildleader&&src.inguild)
				src.verbs += typesof(/mob/Guild_Verbs/verb)
		Give_Guilds_Verbs2()
			src.verbs+=/mob/Guild_Leader/verb/Guild_Invite
		leaveguild()
			src.verbs -= typesof(/mob/Guild_Leader/verb)
			src.verbs -= typesof(/mob/Guild_Verbs/verb)
	//		src.Guild_Rank="Exiled Guild Member"
			src.guildleader=0
			src.guildname=""
			src.inguild=0
			src.canrecruitguild=0
			src.guildleader=0