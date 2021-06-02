var/smiley/S=new
/*
	SmileyPlus version 1.0 by Lummox JR

	Create your own custom smileys or use a default set for easy inclusion
	in your games or chats.


	Parsing text for smileys:

		- Create a new /smiley datum, like var/smiley/SMILE = new.
		- Use text = SMILE.Parse(text, 1) to replace all smileys with <img> tags.
		  OR use text = SMILE.ParseHTML(text) to do the same but run all regular
		  text through html_encode().

	Parsing one smiley at a time:

		- Call SMILE.Parse(txt). It will return a true value if a smiley was found.
		- If a smiley was found, then the following vars will be set in the SMILE datum:

			before:	The text position where the regular text ends and the smiley begins.
			after: The text position where the smiley ends.
			smilestate: The icon_state in the smilefile icon that should be displayed.

		- Use ReplacementImg() to get the <img> tag for this smiley. The default is
		  ReplacementImg(smileystate, smilefile), but you can override those arguments
		  to show any smiley at any time.

	Creating custom smileys:

		You can override this datum or create subtypes like /smiley/MyChat.

		In your basefile ('base.dmi' by default) you will have a list of segments.
		Each segment is something like eyes, mouth, nose, decorations, etc. The last
		segment in a smiley type is the one used as the "bottom" of the icon, and all
		previous segments are layered onto it. I.e., if the order is eyes nose mouth,
		eyes go on top of mouth. Each icon_state in your basefile will have a name
		corresponding to its segment and value, like eyes:: for the : style of eyes,
		or mouth:D for the D style of mouth.

		- Set up rule lists for your smileys as follows:

			legalsegments
				The segments that are valid for each smiley type. This is a nested list.
				The main list represents each type of smiley, e.g. :) or ^_^.
				The second level of lists holds the segments for each smiley type.
				The third level of lists holds the legal values for each segment.
				Example:

				list(		// 1st level
					list(	// 2nd level-- :) smiley type
						list(":",";"),	// 3rd level; eyes
						list(")","(")   // 3rd level; mouth
						)
					)

				If one of the legal values for a segment is null, the segment is optional.

			subsegments
				These are susbtitutions for individual characters in any given segment.
				Like legalsegments this is a nested list.
				Example:

				list(		// 1st level
					list(	// 2nd level-- :) smiley type
						list("="=":"),	         // eyes: = becomes :
						list("]"=")","\["="(")   // mouth: ] becomes ) and [ becomes (
						)
					)

			segmentnames
				This is a nested list, but only goes 2 levels deep.
				Level 1 is the smiley type.
				Level 2 is the list of segment names:

				Example:
					list(list("eyes",null,"mouth"),list("eyes2","mouth2","eyes2"))

				If a segment's name is null it will not be part of the icon, and is optional.
				If two segments have the same name, they will be combined to form the actual
				icon_state found in basefile. E.g., if type 2 is ^_^, then you might have
				base icon states eyes2:^^ and mouth:_

			rules
				This is just a regular associative list. It says what other segments are
				legal alongside a particular segment. If the mouth D can only go with eyes :
				or eyes ; then an entry in this list might be "mouth:D"="eyes:: eyes:;".

			defaults
				This associative list tells what default segment, if any, replaces one that
				is illegal in conjunction with another. If in the example above you had
				eyes:8 with mouth:D, then a default entry of "mouth:D"="eyes::" would replace
				eyes 8 with eyes : instead. If no default value was found, the smiley would
				be considered invalid.

			replacements
				This simple associative list converts one end-state smiley into another.
				For example if the smiley o_O becomes eyes2:oO and mouth2:_ and combine to
				a final smileystate="oO_", and you have an entry in replacements that says
				"oO_"="%|", then any smiley typed as o_O would display as if %| was typed
				instead.

		Once you've set up the rules for your smileys, call GenerateSmileys() to build the
		file. Replace smilefile with the result, and you now have custom smileys.
 */

smiley
	var
		tmp/before
		tmp/after
		tmp/smileystate

		basefile = 'base.dmi'
		smilefile = 'smileys.dmi'

		list/leadchars

		list/legalsegments=list(\
			list( /* smiley type :) */ \
				list(":",";",">:","<:","/:",":,","<:,",">;","<;","%"),
				list("-","o"),
				list(")","(","D","o","|","/","S","P","p","d","v")),
			list( /* smiley type ^_^ */\
				list("^","o","O","-","<",">"),
				list("_","."),
				list("^","o","O","-","<",">")))
		list/subsegments=list(\
			list( /* smiley type :) */\
				list("="=":","\\"="/","'"=",","}"=">"),
				list("^"="-","O"="o","0"="o"),
				list("]"=")","\["="(",">"=")","<"="(","\\"="/","O"="o","0"="o","*"="o","s"="S","b"="p","þ"="p","q"="d","V"="v")),
			list( /* smiley type ^_^ */\
				list("0"="O"),
				list("*"="."),
				list("0"="O")))
		list/segmentnames=list(list("eyes",null,"mouth"),list("weyes","wmouth","weyes"))

		list/rules=list(\
			"eyes::,"="mouth:( mouth:o mouth:S",
			"eyes:<:,"="mouth:( mouth:o mouth:S",
			"eyes:;"="mouth:) mouth:D mouth:p",
			"eyes:>;"="mouth:) mouth:( mouth:D mouth:P mouth:p mouth:d",
			"eyes:<;"="mouth:) mouth:( mouth:D mouth:P mouth:p",
			"eyes:/:"="mouth:| mouth:/ mouth:S",
			"mouth:v"="eyes:: eyes:>: eyes:%",
			"mouth:D"="eyes:: eyes:>: eyes:<: eyes:; eyes:>; eyes:<; eyes:%",
			"mouth:p"="eyes:: eyes:>: eyes:<: eyes:; eyes:>; eyes:<; eyes:%",
			"mouth:d"="eyes:: eyes:>: eyes:<: eyes:; eyes:>; eyes:%",
			"wmouth:."="weyes:^^",
			"weyes:^^"="wmouth:) wmouth:.",
			"weyes:<<"="wmouth:_",
			"weyes:>>"="wmouth:_",
			"wmouth:)"="weyes:^^")
		list/defaults=list(\
			"eyes::,"="mouth:(",
			"eyes:<:,"="mouth:(",
			"eyes:;"="mouth:)",
			"eyes:>;"="mouth:)",
			"eyes:<;"="mouth:(",
			"eyes:/:"="mouth:|",
			"mouth:v"="eyes:>:",
			"mouth:D"="eyes::",
			"mouth:p"="eyes::",
			"mouth:d"="eyes::",
			"wmouth:."="wmouth:_",
			"weyes:^^"="wmouth:)",
			"weyes:<<"="wmouth:_",
			"weyes:>>"="wmouth:_",
			"wmouth:)"="weyes:^^")

		list/replacements=list("oo_"=":|","OO_"="<:o","-o_"=";)","Oo_"="%|")

		list/basesmileys
		list/legalsmileys

		// this is a working value
		tmp/list/segments

	New()
		if(!basesmileys) basesmileys=icon_states(basefile)
		if(!leadchars)
			leadchars = new
			var/i,j
			for(i in legalsegments)
				for(j in i[1])
					if(j) leadchars[copytext(j,1,2)]=1
			for(i in subsegments)
				for(j in i[1])
					if(j) leadchars[j]=1

	proc/GenerateSmileys(client/C)
		legalsmileys=new
		var/list/stack=new
		var/list/tsegs=new
		var/i=0,j,k=1,s=""
		var/icon/I = new(basefile, pick(icon_states(basefile)))
		var/list/done=new
		for(var/tp=1,tp<=legalsegments.len,++tp)
			i=0; k=1; stack.Cut()
			while(1)
				if(++i>length(legalsegments[tp][k]))
					if(--k<=0) break
					i=stack[stack.len]
					--tsegs.len
					--stack.len
					continue
				if(k==length(legalsegments[tp]))
					if(!segmentnames[tp][k])
						if(--k<=0) break
						i=stack[stack.len]
						--tsegs.len
						--stack.len
						continue
					sleep()
					tsegs+=legalsegments[tp][k][i]
					segments=GetSegmentList(tp,tsegs)
					--tsegs.len
					if(!segments) continue
					s=""
					for(j in segments) s+=segments[j]
					if(done[s]) continue
					done[s]=1
					var/icon/J = new(basefile,segments[segments.len]+":"+segments[segments[segments.len]])
					for(j=segments.len-1,j>0,--j)
						if(!segments[segments[j]]) continue
						J.Blend(new/icon(basefile,segments[j]+":"+segments[segments[j]]),ICON_OVERLAY)
					I.Insert(J,s)
					if(done.len==1) I.Insert(J,"")
					continue
				tsegs+=legalsegments[tp][k][i]
				if(!segmentnames[tp][k])
					i=length(legalsegments[tp][k])
				stack+=i
				sleep()
				i=0; ++k; continue
		C << ftp(fcopy_rsc(I),"output.dmi")

	proc/IsFinished(tp,segment)
		if(segment<1 || segment>length(legalsegments[tp])) return 0
		if(!segments) segments=new
		if(segment>segments.len)
			if(!segments) segments=new
			var/j=segments.len
			for(var/i=segments.len+1,i<=segment,++i)
				segments+=null
				// required segment
				if(segmentnames[tp][i] && !(null in legalsegments[tp][i]))
					segments.len=j
					return 0
		if(!segments[segment] && !segmentnames[tp][segment]) return 1
		if(segments[segment] in legalsegments[tp][segment]) return 1

	proc/SplitHere(tp,segment,ch)
		if(segment>segments.len) return 1
		var/oldseg = segments[segment]
		var/ach = ascii2text(ch)
		if(subsegments[tp][segment][ach]) ach = subsegments[tp][segment][ach]
		var/newseg = oldseg + ach
		for(var/anyseg in legalsegments[tp][segment])
			if(anyseg!=oldseg && findtextEx(anyseg,newseg)==1) return 0
		return 1

	proc/FirstSegment(tp,ch)
		if(!segments) segments=new
		.=segments.len||1
		while(.<=length(legalsegments[tp]))
			if(.>segments.len)
				segments+=null
				if(!IsFinished(tp,segments.len) && SplitHere(tp,segments.len,ch)) return 0
				continue
			if(!SplitHere(tp,.,ch)) return
			else if(!IsFinished(tp,.)) return 0
			++.
		if(.>length(legalsegments[tp])) return 0

	proc/SmileyType(txt,i=1)
		.=1
		var/ch,ach,j,k,m
		var/seg,subtxt
		segments=null
		if(!legalsmileys) legalsmileys=icon_states(smilefile)
		while(.<=legalsegments.len)
			ch=text2ascii(txt,i)
			seg=FirstSegment(.,ch)
			if(!seg)
				++.; continue
			j=i
			while(seg)
				while(seg>segments.len) segments+=null
				ach=ascii2text(ch)
				if(subsegments[.][seg][ach]) ach=subsegments[.][seg][ach]
				if(!segments[seg]) segments[seg]=ach
				else segments[seg]+=ach
				if(++j>length(txt)) break
				ch=text2ascii(txt,j)
				seg=FirstSegment(.,ch)
			k=length(legalsegments[.])
			if((segments.len<k || !segments[k]) && segmentnames[.][k] && !(null in legalsegments[.][k]))
				// move nose to mouth if no mouth specified (or what have you)
				if(segments.len>=k-1 && (!segmentnames[.][k-1] || (null in legalsegments[.][k-1])))
					if(segments.len>=k) segments.Cut(k)
					segments+=segments[k-1]
					segments[k-1]=null
				else
					segments.Cut()
					++.; continue
			subtxt=""
			for(m=1,m<=k,++m)
				subtxt+=segments[m]
			subtxt = RedoSegments(.)
			if(!subtxt)
				segments.Cut()
				++.; continue
			if(subtxt in legalsmileys)
				segments.Cut()
				smileystate = subtxt
				before = i
				after = j
				return
			segments.Cut()
			++.
		segments.Cut()
		if(.>legalsegments.len) return 0

	proc/GetSegmentList(tp,list/segs)
		var/i,j,k,s1,s2
		var/list/seglist=new
		segs=segs.Copy()
		// first find any segments with the same name, and arrange them
		for(i=1,i<segs.len,++i)
			if(segs[i] && segmentnames[tp][i])
				for(j=i+1,j<=segs.len,++j)
					if(segs[j] && segmentnames[tp][j]==segmentnames[tp][i])
						if(segs[i]>segs[j])
							segs.Swap(i,j)
		// now combine them
		for(i=1,i<=segs.len,++i)
			s1=segmentnames[tp][i]
			if(segs[i] && s1)
				if(seglist[s1]) seglist[s1]+=segs[i]
				else seglist[s1]=segs[i]
		// look for rules forcing substitutions
		for(i in seglist)
			s1=i+":"+seglist[i]
			if(rules[s1])
				for(j in seglist)
					if(j==i) continue
					s2=j+":"+seglist[j]
					k=findtextEx(rules[s1],s2)
					while(k)
						if(k>1 && text2ascii(rules[s1],k-1)>32)
							k=findtextEx(rules[s1],s2,k+1)
							continue
						if(k+length(s2)<=length(rules[s1]) && text2ascii(rules[s1],k+length(s2))>32)
							k=findtextEx(rules[s1],s2,k+1)
							continue
						break
					if(!k)
						// rule violation found; substitute a default or bail
						s2=defaults[s1]
						if(!s2) return
						k=findtextEx(s2,":")
						seglist[copytext(s2,1,k)]=copytext(s2,k+1)
		s1=""
		for(i in seglist)
			s1+=seglist[i]
		// don't count smileys with replacements
		if(s1 in replacements) return
		// if this smiley can't actually be built, then it doesn't count!
		for(i in seglist)
			s2=i+":"+seglist[i]
			if(!(s2 in basesmileys)) return
		return seglist

	proc/RedoSegments(tp,parsing)
		var/i,j,k,s1,s2
		var/list/seglist=new
		// first find any segments with the same name, and arrange them
		for(i=1,i<segments.len,++i)
			if(segments[i] && segmentnames[tp][i])
				for(j=i+1,j<=segments.len,++j)
					if(segments[j] && segmentnames[tp][j]==segmentnames[tp][i])
						if(segments[i]>segments[j])
							segments.Swap(i,j)
		// now combine them
		for(i=1,i<=segments.len,++i)
			s1=segmentnames[tp][i]
			if(segments[i] && s1)
				if(seglist[s1]) seglist[s1]+=segments[i]
				else seglist[s1]=segments[i]
		// look for rules forcing substitutions
		for(i in seglist)
			s1=i+":"+seglist[i]
			if(rules[s1])
				for(j in seglist)
					if(j==i) continue
					s2=j+":"+seglist[j]
					k=findtextEx(rules[s1],s2)
					while(k)
						if(k>1 && text2ascii(rules[s1],k-1)>32)
							k=findtextEx(rules[s1],s2,k+1)
							continue
						if(k+length(s2)<=length(rules[s1]) && text2ascii(rules[s1],k+length(s2))>32)
							k=findtextEx(rules[s1],s2,k+1)
							continue
						break
					if(!k)
						// rule violation found; substitute a default or bail
						s2=defaults[s1]
						if(!s2) return 0
						k=findtextEx(s2,":")
						seglist[copytext(s2,1,k)]=copytext(s2,k+1)
		s1=""
		for(i in seglist) s1+=seglist[i]
		if(s1 in replacements)
			// if the parsing flag is set, we need to remake this smiley
			// otherwise, we just need to confirm it's valid
			if(parsing) Parse(replacements[s1])
			return replacements[s1]
		// if this smiley can't actually be built, then it doesn't count!
		for(i in seglist)
			s2=i+":"+seglist[i]
			if(!(s2 in basesmileys)) return 0
		return s1

	proc/Parse(txt,start=1,replace)
		var/ch,i=start,tp
		var/subtxt
		segments=null
		if(!legalsmileys) legalsmileys=icon_states(smilefile)
		before=0; after=0; smileystate=null
		while(i<=length(txt))
			ch=text2ascii(txt,i)
			if(ch>32)
				if(leadchars[ascii2text(ch)])
					tp=SmileyType(txt,i)
					if(tp)
						segments=null
						if(!replace) return smileystate
						subtxt=ReplacementImg()
						txt=copytext(txt,1,before)+subtxt+copytext(txt,after)
						after=before+length(subtxt)
						segments=null
						continue
					segments=null
			++i
		if(!replace) return 0
		return txt

	proc/ReplacementImg(s=smileystate,f=smilefile)
		return "<IMG SRC=\ref[f] CLASS=icon ICONSTATE='[s]'>"

	proc/ParseHTML(txt)
		.=""
		var/i=1
		while(txt)
			if(Parse(txt,i))
				if(before>1) .+=html_encode(copytext(txt,1,before))
				.+=ReplacementImg()
				txt=copytext(txt,after)
				continue
			else
				.+=html_encode(txt)
				break
