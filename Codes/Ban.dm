//This was a fun system to make, take good care of my ban system.
var/list/automatics = list()
automatic
	var
		key
		ip
		comp_id
		expire
		note=""
		perm=0
		list
			associated_keys=list()
			associated_ids=list()
	New(rkey,rip,rc_id,rtime,rnote,rperm)
		key = rkey
		ip = rip
		comp_id = rc_id
		expire = rtime
		note = rnote
		perm = rperm
		if(automatics&&istype(automatics,/list)) automatics += src
		else
			automatics = list()
			automatics += src

proc/bancheck(client/C)
	var/list/check[3]
	for(var/automatic/x in automatics)
		if(C.key==x.key||C.key in x.associated_keys)
			if(C.computer_id!=x.comp_id)
				if(!x.associated_ids.Find(C.computer_id)) x.associated_ids += C.computer_id
			check[1]="KEY"
		if(C.computer_id==x.comp_id||C.computer_id in x.associated_ids)
			if(C.key!=x.key)
				if(!x.associated_keys.Find(C.key)) x.associated_keys += C.key
			check[2]="ID"
		if(check[1]||check[2])
			check[3]="[x.perm?"1":"[x.expire]"]"
			break
	return check

proc
	NameSave()
		var/savefile/B = new("CaptainNames.sav")
		B["captainNames"] << captainNames
		var/savefile/Fs = new("BWWAPoints.sav")
		Fs["pointnames"] << pointnames
		var/savefile/F = new("BWWA.sav")
		F["bannednames"] << bannednames
		var/savefile/H = new("BWWAkeys.sav")
		H["bannedkeys"] << bannedkeys
		var/savefile/I = new("BWWAips.sav")
		I["bannedips"] << bannedips
proc
	NameLoad()
		if(fexists("CaptainNames.sav"))
			var/savefile/B = new("CaptainNames.sav")
			if(B["captainNames"]&&istype(B["captainNames"],/list)) B["captainNames"] >> captainNames
		if(fexists("BWWAPoints.sav"))
			var/savefile/S = new("BWWAPoints.sav")
			if(S["pointnames"]&&istype(S["pointnames"],/list)) S["pointnames"] >> pointnames
		if(fexists("BWWA.sav"))
			var/savefile/F = new("BWWA.sav")
			if(F["bannednames"]&&istype(F["bannednames"],/list)) F["bannednames"] >> bannednames
		if(fexists("BWWAkeys.sav"))
			var/savefile/H = new("BWWAkeys.sav")
			if(H["bannedkeys"]&&istype(H["bannedkeys"],/list)) H["bannedkeys"] >> bannedkeys
		if(fexists("BWWAips.sav"))
			var/savefile/I = new("BWWAips.sav")
			if(I["bannedips"]&&istype(I["bannedips"],/list)) I["bannedips"] >> bannedips