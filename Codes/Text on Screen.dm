/* MapText
	By: Shadowdarke (shadowdarke@hotmail.com)

Library Procs:
(arguments marked with * are optional)

MapText(To, Text as text, turf/Loc, Layer = FLY_LAYER, line = 0, offset = 0, charset = 'charset.dmi')
	MapText draws text as images on map turfs.
ARGS:
	To			person or list of people who will see the images
	Text		text to display
	Loc			turf to begin on. This turf will be the left border
				of the text line
	Layer *		graphics layer on which to display text
				default: Layer = FLY_LAYER
	line *		0  = bottom half of the turf
				!0 = top half of the turf
				Default: line = 0
	offset *	initial offset (0-3) within the turf.
				0 = far left	3 = far right
				Default: offset = 0
	charset *	dmi file that contains the character font. The icon
				must have icon_states from 0-7 for each character.
				Examine the included 'charset.dmi' for the format.
				Default: charset = 'charset.dmi'
RETURNS:
	list of the images created

OverlayText(Text as text, turf/Loc, Layer = FLY_LAYER, line = 0, offset = 0, charset = 'charset.dmi')
	OverlayText draws text as overlays on map turfs, this allows
	everyone to see the text.
ARGS:
	Text		text to display
	Loc			turf to begin on. This turf will be the left border
				of the text line
	Layer *		graphics layer on which to display text
				default: Layer = FLY_LAYER
	line *		0  = bottom half of the turf
				!0 = top half of the turf
				Default: line = 0
	offset *	initial offset (0-3) within the turf.
				0 = far left	3 = far right
				Default: offset = 0
	charset *	dmi file that contains the character font. The icon
				must have icon_states from 0-7 for each character.
				Examine the included 'charset.dmi' for the format.
				Default: charset = 'charset.dmi'


MapFrame(To, Left, Right, Top, Bottom, Z, Layer = FLY_LAYER, frame = 'balloon50.dmi')
	MapFrame draws a box  as images on map turfs.
ARGS:
	To			person or list of people who will see the images
	Left		x coordinate of the left side of the box.
	Right		x coordinate of the right side of the box.
	Top			y coordinate of the top of the box.
	Bottom		y coordinate of the bottom side of the box.
	Z			z coordinate of the box.
	Layer *		graphics layer on which to display text
				default: Layer = FLY_LAYER
	frame *		the icon that contains the box graphics. A frame
				icon should have the following icon_states:
				 tl   tm   tr	See the included 'frame.dmi' and
				 cl   cm   cr	'balloon50.dmi' files for examples.
				 bl   bm   br
				Default: frame = 'balloon50.dmi'
RETURNS:
	list of the images created


OverlayFrame(Left, Right, Top, Bottom, Z, Layer = FLY_LAYER, frame = 'balloon50.dmi')
	OverlayFrame draws a box as overlays on map turfs, this allows
	everyone to see the box.
ARGS:
	Left		x coordinate of the left side of the box.
	Right		x coordinate of the right side of the box.
	Top			y coordinate of the top of the box.
	Bottom		y coordinate of the bottom side of the box.
	Z			z coordinate of the box.
	Layer *		graphics layer on which to display text
				default: Layer = FLY_LAYER
	frame *		the icon that contains the box graphics. A frame
				icon should have the following icon_states:
				 tl   tm   tr	See the included 'frame.dmi' and
				 cl   cm   cr	'balloon50.dmi' files for examples.
				 bl   bm   br
				Default: frame = 'balloon50.dmi'


BalloonText(Text as text, turf/Loc, delay = 150, charset = 'charset.dmi', balloon = 'balloon50.dmi')
	BalloonText combines MapFrame and MapText to create word balloons
	visible to each mob within view().
ARGS:
	Text		text to display
	Loc			the turf the balloon should point to
	delay *		number of ticks to leave the balloon before
				removing it.
				Default: delay = 150 (15 seconds)
	charset *	icon file that contains the character font. See
				the MapText entry for details.
				Default: charset = 'charset.dmi'
	balloon *	icon that contains the balloon graphics. The balloon
				should have all the icon_states for frame icons
				used by MapFrame in addition to these two:
				"dtail" = a tail that point DOWN to between the
						balloon and the speaker.
				"utail" = a tail that point UP to between the
						balloon and the speaker.

*/

proc
	MapText(To, Text as text, turf/Loc, Layer = FLY_LAYER, line = 0, offset = 0, charset = 'icons/charset.dmi')
		if(!Loc || !Text) return
		if(offset > 3)
			world.log << "Invalid offset in MapText:\n\t\
				To:[To]   Text:[Text]   Loc:[Loc]\n\t\
				line:[line]   offset:[offset]"
			return
		var
			Image
			list/Images = list()
			len = lentext(Text)
			obj/O = new()
		if(line) line = 4
		O.icon = charset
		O.layer = Layer
		for(var/position = 1, position <= len,)	// no increment here because I do it in the next line
			O.icon_state = "[copytext(Text, position, ++position)][offset+line]"	// increment position here to avoid redundant math operations
			Image = image(O,Loc)
			Images += Image
			To << Image
			if(++offset > 3)
				offset = 0
				Loc = locate(Loc.x+1,Loc.y, Loc.z)
				if(!Loc) break
		return Images

	OverlayText(Text as text, turf/Loc, Layer = FLY_LAYER, line = 0, offset = 0, charset = 'icons/charset.dmi')
		if(!Loc || !Text) return
		if(offset > 3)
			world.log << "Invalid offset in MapText:\n\t\
				Text:[Text]   Loc:[Loc]\n\t\
				line:[line]   offset:[offset]"
			return 0
		var
			len = lentext(Text)
			obj/O = new()
		if(line) line = 4
		O.icon = charset
		O.layer = Layer
		for(var/position = 1, position <= len,)	// no increment here because I do it in the next line
			O.icon_state = "[copytext(Text, position, ++position)][offset+line]"	// increment position here to avoid redundant math operations
			Loc.overlays += O
			if(++offset > 3)
				offset = 0
				Loc = locate(Loc.x+1,Loc.y, Loc.z)
				if(!Loc) break
		return 1

	MapFrame(To,Left,Right,Top,Bottom,Z, Layer = FLY_LAYER, frame = 0)
		var
			obj/O = new()
			Image
			list/Images = list()

		O.icon = frame
		O.layer = Layer
		O.icon_state = "tl"
		Image = image(O,locate(Left,Top,Z))
		To << Image
		Images += Image

		O.icon_state = "tr"
		Image = image(O,locate(Right,Top,Z))
		To << Image
		Images += Image

		O.icon_state = "bl"
		Image = image(O,locate(Left,Bottom,Z))
		To << Image
		Images += Image

		O.icon_state = "br"
		Image = image(O,locate(Right,Bottom,Z))
		To << Image
		Images += Image

		for(var/X = Left + 1, X < Right, ++X)
			O.icon_state = "tm"
			Image = image(O,locate(X,Top,Z))
			To << Image
			Images += Image

			O.icon_state = "bm"
			Image = image(O,locate(X,Bottom,Z))
			To << Image
			Images += Image

			for(var/Y = Bottom+1, Y < Top, ++Y)
				O.icon_state = "cl"
				Image = image(O,locate(Left,Y,Z))
				To << Image
				Images += Image

				O.icon_state = "cr"
				Image = image(O,locate(Right,Y,Z))
				To << Image
				Images += Image

				O.icon_state = "cm"
				Image = image(O,locate(X, Y, Z))
				To << Image
				Images += Image

		return Images


	OverlayFrame(Left,Right,Top,Bottom,Z, Layer = FLY_LAYER, frame = 0)
		var
			obj/O = new()
			turf/T = locate(Left,Top,Z)

		O.icon = frame
		O.layer = Layer
		O.icon_state = "tl"
		T.overlays += O

		O.icon_state = "tr"
		T = locate(Right,Top,Z)
		T.overlays += O

		O.icon_state = "bl"
		T = locate(Left,Bottom,Z)
		T.overlays += O

		O.icon_state = "br"
		T = locate(Right,Bottom,Z)
		T.overlays += O

		for(var/X = Left + 1, X < Right, ++X)
			O.icon_state = "tm"
			T = locate(X,Top,Z)
			T.overlays += O

			O.icon_state = "bm"
			T = locate(X,Bottom,Z)
			T.overlays += O

			for(var/Y = Bottom+1, Y < Top, ++Y)
				O.icon_state = "cl"
				T = locate(Left,Y,Z)
				T.overlays += O

				O.icon_state = "cr"
				T = locate(Right,Y,Z)
				T.overlays += O

				O.icon_state = "cm"
				T = locate(X,Y,Z)
				T.overlays += O


	BalloonText(Text as text, turf/Loc, delay = 150, charset = 'icons/charset.dmi', balloon = 0)
		if(!Loc || !Text) return
		var
			Len = lentext(Text)
			width
			height
			Top
			Bottom
			Left
			Right
			Z = Loc.z
			obj/O = new()
			Image
			list/Images = list()

		// find height and width
		if(Len < 13)
			height = 0
			width = 0
		else if(Len < 21)
			height = 0
			width = 1
		else if(Len < 41)
			height = 1
			width = 1
		else if(Len < 57)
			height = 1
			width = 2
		else if(Len < 85)
			height = 2
			width = 2
		else
			height = 2
			width = 3
		// chop off excess
			if(Len > 108)
				Text = copytext(Text,1,106) + "..."
				Len = 108


		Top = Loc.y + height + 2
		if(Top > world.maxy) Top = Loc.y - 1
		Bottom = Top - height - 1

		Left = Loc.x - round((height/2),1) - 1
		if(Left < 1 ) Left = 1
		Right = Left + width + 1
		if(Right > world.maxx)
			Right = world.maxx
			Left = Right - width - 1

		// draw the balloon
		Images = MapFrame(view(Loc), Left, Right, Top, Bottom, Z,, balloon)

		// draw the tail
		O.icon = balloon
		O.layer = FLY_LAYER
		if(Top > Loc.y)
			O.icon_state = "dtail"
			Image = image(O,locate(Loc.x, Bottom, Z))
			view(Loc) << Image
			spawn(delay) del(Image)
		else
			O.icon_state = "utail"
			Image = image(O,locate(Loc.x, Top, Z))
			view(Loc) << Image
			spawn(delay) del(Image)

		// draw the text
		width = 6 + 4 * width	// width in characters
		var high = 0
		var turf/Turf = locate(Left,Top,Z)
		for(var/Y = 0, Y < ((height+1)*2), Y++)
			Images += MapText(view(Loc),copytext(Text,Y*width+1,(Y+1)*width+1),Turf,,high,1,charset)
			high = !high
			if(high)
				Turf = locate(Left,Turf.y-1,Z)

		spawn(delay)
			for(var/I in Images)
				del(I)
