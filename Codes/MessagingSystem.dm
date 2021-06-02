mob/var/tmp/list/PlayerControl=list()
var/global/obj/DeliverySys/DS=new

obj/DeliverySys
	var
		list
			unsentone=list()
			unsenttwo=list()
	proc
		SaveMsgQue()
			var/savefile/F=new /savefile("QuedMsg/Q.sav")
			Write(F)

		LoadMsgQue()
			if(fexists("QuedMsg/Q.sav"))
				var/savefile/F=new /savefile("QuedMsg/Q.sav")
				Read(F)


proc
	FilterOldMessages()
		for(var/Message/b in DS.unsentone)
			if(world.time>=b.date)
				del(b)
		for(var/Message/bb in DS.unsenttwo)
			if(world.time>=bb.date)
				del(bb)


mob
	var
		list/friends=list("dariuc520","dariuc","Zagros5000")//,"b","bob","bitty","bilbo","basic","ben")
		list/inbox_messages=list()
		opencommunication=0
		tmp
			last_friend=0
			list
				friends_holder=list()
	verb
		SendMsg()
			var/a=input("Which player would you like to send a message to?")as null|anything in friends
			if(!isnull(a))
				var/Message/b=new()
				b.to_player=a
				b.from_player=src.ckey
				b.body=input(src,"Write the message.")as text
				var/list/f=GetOnlineKeys()
				if(f.Find(b))
					var/list/q=GetOnlines()
					for(var/mob/m in q)
						if(m.ckey==b)
							b.SendMail(m,src)
				else
					b.SendMail(null,src)
		Communication()
			if(opencommunication==0)
				winshow(src,"Communication",1)
				opencommunication=1
			else
				winshow(src,"Communication",0)
				opencommunication=0
		ShowFriends()
			//Open("Friends")
			winset(src,"messagechild","left=Friends")
			UpFriends()
		ShowInbox()
			//Open("Inbox")
			winset(src,"messagechild","left=Inbox")
			UpInbox()
	proc
		UpInbox()
			var/g=0
			friends_holder.Cut()
			for(var/Message/h in inbox_messages)
				g++
				var/obj/MsgHolder/b=new(h)
				friends_holder+=b
				src<<output(b,"InboxGrid:1,[g]")
			winset(src,"InboxGrid","cells=1x[g]")


		UpFriends()
			var/g=0
			friends_holder.Cut()
			var/list/em=GetOnlineFriends()
			for(var/mob/P in em)
				g++
				var/obj/FriendHolder/j=new(P.ckey,"Online")
				friends_holder+=j
				src<<output(j,"FriendsGrid:1,[g]")
			var/gg=g
			var/list/ef=GetOnlineKeys()
			for(var/f in friends)
				if(!ef.Find(f))
					gg++
					var/obj/FriendHolder/j=new(f)
					friends_holder+=j
					src<<output(j,"FriendsGrid:1,[gg]")
			winset(src,"FriendsGrid","cells=1x[gg]")
			if(gg==0)
				src<<output("<b>No friends online.</b>","FriendsGrid:1,1")
				winset(src,"FriendsGrid","cells=1x1")

		GetOnlines()//list of online players.
			var/list/players=list()
			for(var/mob/m in world)
				if(!isnull(m.client)&&src!=m)
					players+=m
			return players

		GetOnlineKeys()//list of online players.
			var/list/players=list()
			for(var/mob/m in world)
				if(!isnull(m.client)&&src!=m)
					players+=m.ckey
			return players

		GetOnlineFriends()//get online friends
			var/list/players=GetOnlines()
			for(var/mob/m in players)
				if(!friends.Find(m.ckey))
					players-=m
			return players

		GetOfflineFriends()//get offline friends.
			var/list/players=GetOnlineKeys()
			for(var/q in friends)
				if(players.Find(q))
					players-=q
			return players
	//			.
					//online+=m
					//players-=m.ckey
			//players are the offline
			//online are the online. show their rank and level.
			//return online
			//src<<output(,"")


		AddFriend()
			if(world.time>=last_friend)
				if(friends.len<200)
					last_friend=MinDate(1)
					var/mob/m=input("Who do you wish to add to your friends list?")as null|anything in GetOnlines()
					if(!isnull(m))
						if(!friends.Find(m.ckey))
							if(alert(m,"[src.key] wishes to add you as a friend. Do you accept?","Friend Add","Yes.","No.")=="Yes.")
								friends.Add(m.ckey)
								src<<"[m.key] added as a friend."
								if(!m.friends.Find(src.ckey))
									m.friends.Add(src.ckey)
									m<<"You added [src.key] as a friend."
							else
								src<<"[m.key] has declined your friend request."
						else
							src<<"[m.key] is already in your friend's list."
				else
					src<<"You can only have <b>200</b> friends."
			else
				src<<"You must wait atleast <b>60</b> seconds before adding another friend."



		RemoveFriend()
			var/mob/m=input("Who do you wish to remove from your friends list?")as null|anything in friends
			if(!isnull(m))
				if(friends.Find(m.ckey))
					friends.Remove(m.ckey)
					src<<"[m.key] has been removed as a friend."



		//---------
		EmptyInbox()
			inbox_messages.Cut()
			UpInbox()

		CheckMessages()
			var/list/newmail=list()
			for(var/Message/a in DS.unsentone)
				if(a.to_player==src.ckey)
					newmail+=a
					DS.unsentone-=a
			for(var/Message/a in DS.unsenttwo)
				if(a.to_player==src.ckey)
					newmail+=a
					DS.unsenttwo-=a
			if(newmail.len>0)
				src<<"You have new mail. Check your inbox."
				inbox_messages+=newmail//get the mail and deliver.
				DS.SaveMsgQue()
			else
				src<<"No new mail."


obj
	FriendHolder
		icon='Icons/Env.dmi'
		icon_state="closed"
		New(a=null,b="Offline")
			..()
			fh=a
			name="[b]-[fh]"
		Click()
			usr<<"Testing send message."
			if(!isnull(gh))
				usr<<"[gh.key] is a Level-[gh.level["Min"]] [gh.race]\n Is online right now.\n"
		var/fh="the key"
		var/tmp/mob/gh=null

proc

	DayDate(var/daysof)
		var/int
		var/testT=world.realtime
		for(int=daysof,int>0, int--)
			testT+=846000
		return testT
obj
	MsgHolder
		New(Message/a=null)
			..()
			G=a.CreateCopy()
			src.name="Subject-From [G.from_player]"
			if(G.read==1)
				src.icon_state="open"

		icon='Icons/Env.dmi'
		icon_state="closed"
		name="A message."
		var/Message/G=null
		Click()
			if(!isnull(G))
				if(G.read==0)
					G.read=1
					src.icon_state="open"
				G.DispMsg(usr)


Message
	var
		subject="None"
		read=0
		to_player//key of persont o be delivered to
		from_player//key of player sent from.
		body="Write here."//length of 300.
		sent_on
		date//date it expires, deleted after 7 days.
	proc
		DispMsg(mob/m)
			m<<output(null,"msgout")
			m<<output("[subject]\n<b>To:</b>[to_player] <b>From:</b>[from_player]\n\n<b>Message:</b>\n[body]\n\nSent on [sent_on]","msgout")
		CreateCopy()
			var/Message/a=new
			a.subject=subject
			a.to_player=to_player
			a.from_player=from_player
			a.body=body
			a.date=DayDate(7)
			a.sent_on=time2text(world.realtime,"DDD MM YYYY hh:mm")
			a.read=read
			return a

		GetOnlines()
			var/list/players=list()
			for(var/mob/m in world)
				if(!isnull(m.client))
					players+=m
			return players

		SendMail(var/mob/recer,var/mob/sender)
			var/list/playersonline=GetOnlines()
			if(isnull(recer))
				AddToQue(sender)
			else if(!playersonline.Find(recer))
				AddToQue(sender)
			else
				sender<<"Message sent."
				recer<<"You have a new message in your inbox."
				recer.inbox_messages+=CreateCopy()
				//sender.sent_messages+=src

		AddToQue(var/mob/b)
			if(DS.unsentone.len<200)
				DS.unsentone+=CreateCopy()
				//b.sent_messages+=src
				b<<"The message has been sent to que, recipient will receive it when they long on next."
			else
				if(DS.unsenttwo.len<200)
					DS.unsenttwo+=CreateCopy()
					//b.sent_messages+=src
					b<<"The message has been sent to que, recipient will receive it when they long on next."
				else
					b<<"All message ques are full-message cannot be sent."
					del(src)