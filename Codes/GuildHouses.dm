mob/proc
	GuildCheck(number)
		if(!src.inguild)
			return 0
		var/namer="[src.name]"
		if(src.inguild&&src.guildname==G1name)
			var/list/x = G1mems
			if(!x.Find(namer))
				src.inguild=0
				src.guildname=""
				src.guildleader=0
				src<<"You are no longer with [G1name]"
				return 0
		if(src.inguild&&src.guildname==G2name)
			var/list/x = G2mems
			if(!x.Find(namer))
				src.inguild=0
				src.guildname=""
				src.guildleader=0
				src<<"You are no longer with [G2name]"
				return 0
		if(src.inguild&&src.guildname==G3name)
			var/list/x = G3mems
			if(!x.Find(namer))
				src.inguild=0
				src.guildname=""
				src.guildleader=0
				src<<"You are no longer with [G3name]"
				return 0
		if(src.inguild&&src.guildname==G4name)
			var/list/x = G4mems
			if(!x.Find(namer))
				src.inguild=0
				src.guildname=""
				src.guildleader=0
				src<<"You are no longer with [G4name]"
				return 0
		if(src.inguild&&src.guildname==G5name)
			var/list/x = G5mems
			if(!x.Find(namer))
			//if(!namer in G5mems)
				src.inguild=0
				src.guildname=""
				src.guildleader=0
				src<<"You are no longer with [G5name]"
				return 0
		var/gnumber=""
		if(number==1)
			gnumber=H1name
		if(number==2)
			gnumber=H2name
		if(number==3)
			gnumber=H3name
		if(number==4)
			gnumber=H4name
		if(number==5)
			gnumber=H5name
		if(!gnumber)
			return 1
		if(gnumber==src.guildname)
			return 1
		if(gnumber==G1name)
			if(src.guildname in G1ally)
				return 1
			if(src.guildname in G1neut)
				if(number==1)
					if(H1guildwar)
						return 0
				if(number==2)
					if(H2guildwar)
						return 0
				if(number==3)
					if(H3guildwar)
						return 0
				if(number==4)
					if(H4guildwar)
						return 0
				if(number==5)
					if(H5guildwar)
						return 0
				return 1
			else
				if(number==1)
					if(H1guildwar)
						if(src.guildname==E1name)
							return 1
				if(number==2)
					if(H2guildwar)
						if(src.guildname==E2name)
							return 1
				if(number==3)
					if(H3guildwar)
						if(src.guildname==E3name)
							return 1
				if(number==4)
					if(H4guildwar)
						if(src.guildname==E4name)
							return 1
				if(number==5)
					if(H5guildwar)
						if(src.guildname==E5name)
							return 1
		if(gnumber==G2name)
			if(src.guildname in G2ally)
				return 1
			if(src.guildname in G2neut)
				if(number==1)
					if(H1guildwar)
						return 0
				if(number==2)
					if(H2guildwar)
						return 0
				if(number==3)
					if(H3guildwar)
						return 0
				if(number==4)
					if(H4guildwar)
						return 0
				if(number==5)
					if(H5guildwar)
						return 0
				return 1
			else
				if(number==1)
					if(H1guildwar)
						if(src.guildname==E1name)
							return 1
				if(number==2)
					if(H2guildwar)
						if(src.guildname==E2name)
							return 1
				if(number==3)
					if(H3guildwar)
						if(src.guildname==E3name)
							return 1
				if(number==4)
					if(H4guildwar)
						if(src.guildname==E4name)
							return 1
				if(number==5)
					if(H5guildwar)
						if(src.guildname==E5name)
							return 1
		if(gnumber==G3name)
			if(src.guildname in G3ally)
				return 1
			if(src.guildname in G3neut)
				if(number==1)
					if(H1guildwar)
						return 0
				if(number==2)
					if(H2guildwar)
						return 0
				if(number==3)
					if(H3guildwar)
						return 0
				if(number==4)
					if(H4guildwar)
						return 0
				if(number==5)
					if(H5guildwar)
						return 0
				return 1
			else
				if(number==1)
					if(H1guildwar)
						if(src.guildname==E1name)
							return 1
				if(number==2)
					if(H2guildwar)
						if(src.guildname==E2name)
							return 1
				if(number==3)
					if(H3guildwar)
						if(src.guildname==E3name)
							return 1
				if(number==4)
					if(H4guildwar)
						if(src.guildname==E4name)
							return 1
				if(number==5)
					if(H5guildwar)
						if(src.guildname==E5name)
							return 1
		if(gnumber==G4name)
			if(src.guildname in G4ally)
				return 1
			if(src.guildname in G4neut)
				if(number==1)
					if(H1guildwar)
						return 0
				if(number==2)
					if(H2guildwar)
						return 0
				if(number==3)
					if(H3guildwar)
						return 0
				if(number==4)
					if(H4guildwar)
						return 0
				if(number==5)
					if(H5guildwar)
						return 0
				return 1
			else
				if(number==1)
					if(H1guildwar)
						if(src.guildname==E1name)
							return 1
				if(number==2)
					if(H2guildwar)
						if(src.guildname==E2name)
							return 1
				if(number==3)
					if(H3guildwar)
						if(src.guildname==E3name)
							return 1
				if(number==4)
					if(H4guildwar)
						if(src.guildname==E4name)
							return 1
				if(number==5)
					if(H5guildwar)
						if(src.guildname==E5name)
							return 1
		if(gnumber==G5name)
			if(src.guildname in G5ally)
				return 1
			if(src.guildname in G5neut)
				if(number==1)
					if(H1guildwar)
						return 0
				if(number==2)
					if(H2guildwar)
						return 0
				if(number==3)
					if(H3guildwar)
						return 0
				if(number==4)
					if(H4guildwar)
						return 0
				if(number==5)
					if(H5guildwar)
						return 0
				return 1
			else
				if(number==1)
					if(H1guildwar)
						if(src.guildname==E1name)
							return 1
				if(number==2)
					if(H2guildwar)
						if(src.guildname==E2name)
							return 1
				if(number==3)
					if(H3guildwar)
						if(src.guildname==E3name)
							return 1
				if(number==4)
					if(H4guildwar)
						if(src.guildname==E4name)
							return 1
				if(number==5)
					if(H5guildwar)
						if(src.guildname==E5name)
							return 1
		if(gnumber!=G1name&&gnumber!=G2name&&gnumber!=G3name&&gnumber!=G4name&&gnumber!=G5name)
			return 1
		return 0
	GuildWarCheck(number)
		if(number==1)
			if(H1guildwar)
				if(src.ingwar==1)
					src.ingwar=2
					if(src.guildname==H1name)
						H1ally-=1
					if(src.guildname==E1name)
						H1enemy-=1
					H1Winner()
					//warcount()
					return 1
		if(number==2)
			if(H2guildwar)
				if(src.ingwar==1)
					src.ingwar=2
					if(src.guildname==H2name)
						H2ally-=1
					if(src.guildname==E2name)
						H2enemy-=1
					H2Winner()
					return 1
		if(number==3)
			if(H3guildwar)
				if(src.ingwar==1)
					src.ingwar=2
					if(src.guildname==H3name)
						H3ally-=1
					if(src.guildname==E3name)
						H3enemy-=1
					H3Winner()
					return 1
		if(number==4)
			if(H4guildwar)
				if(src.ingwar==1)
					src.ingwar=2
					if(src.guildname==H4name)
						H4ally-=1
					if(src.guildname==E4name)
						H4enemy-=1
					H4Winner()
					return 1
		if(number==5)
			if(H5guildwar)
				if(src.ingwar==1)
					src.ingwar=2
					if(src.guildname==H5name)
						H5ally-=1
					if(src.guildname==E5name)
						H5enemy-=1
					H5Winner()
					return 1
		return 1
proc
	HouseSave()
		var/savefile/F = new("HouseList.sav")

		F["H1name"] << H1name
		F["H2name"] << H2name
		F["H3name"] << H3name
		F["H4name"] << H4name
		F["H5name"] << H5name
proc
	HouseLoad()
		if(fexists("HouseList.sav"))
			var/savefile/F = new("HouseList.sav")
			if(F["H1name"]) F["H1name"] >> H1name
			if(F["H2name"]) F["H2name"] >> H2name
			if(F["H3name"]) F["H3name"] >> H3name
			if(F["H4name"]) F["H4name"] >> H4name
			if(F["H5name"]) F["H5name"] >> H5name
turf
	GuildTele
		inG1
			Enter(A)
				if(ismob(A))
					if(usr.GuildCheck(1))
						if(H1guildwar)
							if(usr.ingwar==0||usr.ingwar==2)return
						usr.loc = locate(74,2,9)
						usr.safe = 0
						usr.inghouse=1
					else
						if(!usr.inguild)
							usr<<"You must be in a guild"
							return
						usr<<"[H1name] owns this house"
				else
					if(istype(A,/obj/))return
		outG1
			Enter(A)
				if(ismob(A))
					if(usr.GuildWarCheck(1))
						usr.loc = locate(109,112,3)
						usr.safe = 0
						usr.inghouse=0
				else
					if(istype(A,/obj/))return
		inG2
			Enter(A)
				if(ismob(A))
					if(usr.GuildCheck(2))
						if(H2guildwar)
							if(usr.ingwar==0||usr.ingwar==2)return
						usr.loc = locate(128,77,9)
						usr.safe = 0
						usr.inghouse=2
					else
						if(!usr.inguild)
							usr<<"You must be in a guild"
							return
						usr<<"[H2name] owns this house"
				else
					if(istype(A,/obj/))return
		outG2
			Enter(A)
				if(ismob(A))
					if(usr.GuildWarCheck(2))
						usr.loc = locate(75,117,2)
						usr.safe = 0
						usr.inghouse=0
				else
					if(istype(A,/obj/))return
		inG3
			Enter(A)
				if(ismob(A))
					if(usr.GuildCheck(3))
						if(H3guildwar)
							if(usr.ingwar==0||usr.ingwar==2)return
						usr.loc = locate(123,2,9)
						usr.safe = 0
						usr.inghouse=3
					else
						if(!usr.inguild)
							usr<<"You must be in a guild"
							return
						usr<<"[H3name] owns this house"
				else
					if(istype(A,/obj/))return
		outG3
			Enter(A)
				if(ismob(A))
					if(usr.GuildWarCheck(3))
						usr.loc = locate(16,184,4)
						usr.safe = 0
						usr.inghouse=0
				else
					if(istype(A,/obj/))return
		inG4
			Enter(A)
				if(ismob(A))
					if(usr.GuildCheck(4))
						if(H4guildwar)
							if(usr.ingwar==0||usr.ingwar==2)return
						usr.loc = locate(23,2,9)
						usr.safe = 0
						usr.inghouse=4
					else
						if(!usr.inguild)
							usr<<"You must be in a guild"
							return
						usr<<"[H4name] owns this house"
				else
					if(istype(A,/obj/))return
		outG4
			Enter(A)
				if(ismob(A))
					if(usr.GuildWarCheck(4))
						usr.loc = locate(60,53,7)
						usr.safe = 0
						usr.inghouse=0
				else
					if(istype(A,/obj/))return
		inG5
			Enter(A)
				if(ismob(A))
					if(usr.GuildCheck(5))
						if(H5guildwar)
							if(usr.ingwar==0||usr.ingwar==2)return
						usr.loc = locate(178,2,9)
						usr.safe = 0
						usr.inghouse=5
					else
						if(!usr.inguild)
							usr<<"You must be in a guild"
							return
						usr<<"[H5name] owns this house"
				else
					if(istype(A,/obj/))return
		outG5
			Enter(A)
				if(ismob(A))
					if(usr.GuildWarCheck(5))
						usr.loc = locate(23,126,17)
						usr.safe = 0
						usr.inghouse=0
				else
					if(istype(A,/obj/))return