#define DEBUG

#ifdef DEBUG

// DEFINE.dm
#define ADMIN_BROWSER_SIZE "size=500x400;"			//	Define the size of the popup of the browser. WIDTH x HEIGHT (no spaces)

#define CREATE_PATH		list(/mob,/obj,/area)					//	change the path to what you want to create, if you wish

#define DENY_VAR_EDIT 	list("ckey", "key","parent_type","type", "state", "infect", "dead") //  Shows these variables in the edit list BUT it is uneditable.

#define HIDE_EDIT_VAR 	list("client", "images", "overlays", "transform", "underlays", "vars", "verbs")	//  Does not appear in the edit list.

#define VIEW_ENTRY_ONLY list("locs")				//	Used for /list. View the entries but make it so the entries cannot be diretly edited.

													//  Show specific options for the defined variables. list(Var = list(Choice = Value))
#define SPECIFIC_VALUES list(\
							"density"		= list("TRUE (1)"=1, "FALSE (0)"=0),\
							"dir"			= list("NORTH"=NORTH,"SOUTH"=SOUTH,"EAST"=EAST,"WEST" = WEST, "NORTHEAST" = NORTH|EAST, "NORTHWEST" = NORTH|WEST, "SOUTHEAST" = SOUTH|EAST, "SOUTHWEST" = SOUTH|WEST),\
							"gender"		= list("Male" = "male", "Female" = "female", "Neutral" = "neuter", "Plural" = "plural"),\
							"mouse_opacity"	= list("Ignore/Transparent (0)" = 0, "Translucent / sees opaque area (1, default)" = 1, "Completely opaque/visible (2)" = 2),\
							"opacity"		= list("Transparent (0, default)"=0, "Opaque (1, blocks light)"=1)\
							)



//	Define the CSS style for the browser, if you wish to make it more fancy.
var/_CSS = {"
<style type='text/css'>

/*
If you do not want the links underlined, add the following below: text-decoration: none;
If you want it bold, add: font-weight:bold;
*/
	a:link, a:visited {color: #43F887;}		/*	Links will appear as a green tone colour  */
	.unsavable a {color: #FFA500;}			/*	Unsavable variables (defined as global, cnst or tmp) links will be coloured orange instead */
	.viewonly a {color: red !important;}	/*  View-only contents variables are coloured red  */


	html {
		color: red;							/*  Default font colour is red  */
		background-color: black;			/*  Default background colour is black */
		}

</style>
"}


//  Other important defines that do not need editing

#define islist(X) istype(X,/list)					//	Do not change this line


//// Essential dm
// AbyssDragon's Library

proc/BubbleSort(list/L)
	for(var/i = L.len; i >= 1; i--)
		for(var/j = 1; j < i; j++)
			if(Compare(L[j], L[j+1]) == -1)
				Swap(L, j, j+1)
	//return L
proc/CountingSort(list/L, max_element=100)
	var/LCopy[] = L.Copy()
	var/TempList[max_element+1]
	for(var/j in 1 to LCopy.len)
		TempList[LCopy[j]+1]++
	for(var/i in 2 to max_element+1)
		TempList[i] = TempList[i] + TempList[i-1]
	for(var/j = L.len; j > 0; j--)
		L[TempList[LCopy[j]+1]] = LCopy[j]
		TempList[LCopy[j]+1]--
	//return LCopy

proc/Compare(item1, item2)
	if(isnum(item1))
		return item2<item1?-1:(item1==item2?0:1)
	else
		return sorttextEx("[item1]", "[item2]")

proc/Swap(list/L, position1, position2)
	var/temp = L[position1]
	L[position1] = L[position2]
	L[position2] = temp

//	Deadron's TextProcs
proc
	dd_text2list(text, separator)
		var/textlength      = length(text)
		var/separatorlength = length(separator)
		var/list/textList   = new /list()
		var/searchPosition  = 1
		var/findPosition    = 1
		var/buggyText
		while (1)															// Loop forever.
			findPosition = findtext(text, separator, searchPosition, 0)
			buggyText = copytext(text, searchPosition, findPosition)		// Everything from searchPosition to findPosition goes into a list element.
			textList += "[buggyText]"										// Working around weird problem where "text" != "text" after this copytext().

			searchPosition = findPosition + separatorlength					// Skip over separator.
			if (findPosition == 0)											// Didn't find anything at end of string so stop here.
				return textList
			if (searchPosition > textlength)								// Found separator at very end of string.
				textList += ""												// So add empty element.
				return textList

	dd_list2text(list/the_list, separator)
		var/total = the_list.len
		if (total == 0)														// Nothing to work with.
			return

		var/newText = "[the_list[1]]"										// Treats any object/number as text also.
		var/count
		for (count = 2, count <= total, count++)
			if (separator) newText += separator
			newText += "[the_list[count]]"
		return newText

////  GA HTML ver 1.11
//  Warning: for your mental health, I advise you to not go through this. Continue at your own risk :P
//  Most items are not commented... so, yeah, good luck :)

client
	Topic(hr,h[],hs)		//	Called when a link is invoked (either by clicking or link() to "byond://?..." or just "?..."
//		world.log << list2params(h)
		var{html=_CSS;extra="clear=1;window=[h["window"]?h["window"]:"popup"];"+ADMIN_BROWSER_SIZE}

		switch(h["command"])	//	Sees what command was passed via ?command=X

			if("create")		//  Creating an object - Create HTML function

////  You should verify if the person using the command is an admin:
////  if(!(ckey in Admin)){mob<<"\red You cannot access this command. This attempted breech of security has been recorded!";world.log<<"[mob.name] ([mob.key]) attempted to use edit!";return..()}

				if(h["type"])	//  When a /path is chosen to be created
					if((alert(mob,"Are you sure you want to create [h["type"]]?","Create","Yes","No"))=="Yes")
						var/atom/A = h["type"]
						A=new A(get_step(mob,SOUTH)?get_step(mob,SOUTH):get_step(mob,NORTH))
					return..()

				//	If an object is not yet chosen, display the HTML file
				html+={"<script type="text/javascript">
	var OV="";
	function Show(L){
	if(OV){
		var YY = document.getElementsByTagName("a");
		for(var xi=1;xi<=YY.length;xi++) if(YY\[xi]&&YY\[xi].name)if(OV=="*"||YY\[xi].name==OV) YY\[xi].style.display='none';
		}

	var YY = document.getElementsByTagName("a");
	for(var xi=1;xi<=YY.length;xi++) if(YY\[xi]&&YY\[xi].name)if(YY\[xi].name==L||L=="HideAll") YY\[xi].style.display=(L=="HideAll"?'none':'');
	OV = L;
	}

	function Search(){
	Show("HideAll");
	var T = document.getElementById("search").value.toLowerCase();
	var YY = document.getElementsByTagName("a");
	for(var xi=1;xi<=YY.length;xi++) if(YY\[xi]&&YY\[xi].id)if((YY\[xi].id.toLowerCase().search(T))>=0) YY\[xi].style.display='';
	OV="*";
	}

	</script>
	<h3 align=center>Create</h3>

	<form method="GET" action="javascript:Search()">
	<input type="text" id="search" name="value">
	<input type="submit" value="Search for variable" >
	</form>"}
				for(var/A in CREATE_PATH) html+={"<a href="javascript:Show('[A]')">[A]</a> &nbsp; "}
				html+="<hr>"
				for(var/X in CREATE_PATH)for(var/A in typesof(X)-X)
					//if(copytext("[A]",1,length("[X]")+1)!="[X]")continue
					html+={"<a name="[X]" style="display: 'none';" href="byond://?command=create;type=[A]" id="[A]">[A]<br></a>"}
				html+="<hr>"





			//  The Edit HTML command
			if("edit")

////  You should verify if the person using the command is an admin:
////	if(!(ckey in Admin)){mob<<"\red You cannot access this command. This attempted breech of security has been recorded!";world.log<<"[mob.name] ([mob.key]) attempted to use edit!";return..()}

				var/atom/O = locate(h["target"])	//  Looks for the target you are editing
				if(!O) return..()					//  If not found, do not proceed

				var/list/varz[0]
				html+={"<script type="text/javascript">
var OV="";
function Show(L){
	if(OV){
		var YY = document.getElementsByTagName("tr");
		for(var xi=1;xi<=YY.length;xi++) if(YY\[xi]&&YY\[xi].name)if(OV=="*"||YY\[xi].name.charAt(0).toUpperCase()==OV) YY\[xi].style.display='none';
		}

	document.getElementById("tid").style.display='';
	var ZZ = document.getElementById("fmr");
	if(ZZ)ZZ.style.display='none';
	var YY = document.getElementsByTagName("tr");
	for(var xi=1;xi<=YY.length;xi++) if(YY\[xi]&&YY\[xi].name)if(YY\[xi].name.charAt(0).toUpperCase()==L||L=="HideAll") YY\[xi].style.display=(L=="HideAll"?'none':'');
	OV = L;
}

function Search(){
	Show("HideAll");
	var T = document.getElementById("search").value.toLowerCase();
	var YY = document.getElementsByTagName("tr");
	for(var xi=1;xi<=YY.length;xi++) if(YY\[xi]&&YY\[xi].name)if((YY\[xi].name.toLowerCase().search(T))>=0) YY\[xi].style.display='';
	OV="*";
}

function Retrieve(){window.open("byond://?command=edit;target=[h["target"]];type=[h["type"]];category="+OV,"_self");}

</script>
<h3 align=center>[O.name] ([O.type])</h3>"}
				for(var/X in (O.vars - HIDE_EDIT_VAR))
					var/AA = uppertext(copytext(X,1,2))
					//if(isnum(AA))AA="#"
					if(!(AA in varz))
						var/pos=1
						for(var/XR in varz) if(sorttext(AA, XR) != 1){pos++}else break
						varz.Insert(pos,AA)
						varz[AA]=list()
					varz[AA]+=X
				html+="<hr><center>"

				for(var/R in varz)			//	Display the letters of each variable
					html+={"<a href=""}
					if(h["nvalue"])
						html+="?command=edit;target=[h["target"]];type=edit;category=[R]"
					else html +="javascript:Show('[R]')"
					html += {"">[R]</a> &nbsp; "}
				html+={"<form method="GET" action="javascript:Search()"><input type="text" id="search" name="value"><input type="submit" value="Search for variable" ></form><form method="get"><input type="hidden" name="command" value="edit" ><input type="hidden" name="target" value="[h["target"]]" ><input type="hidden" name="type" value="search" ></form></center><hr>"}
				html += {"<table id="tid" style="display: 'none';" width=100%>
				<tr>"}
				html += {"<td colspan="3" style="text-align:center;"><a href="javascript:Retrieve();">UPDATE VARIABLES</a></td></tr>"}
				html+={"<tr style="font-weight:bold;"><td>VARIABLE NAME</td><td>CURRENT VALUE</td><td>PROBABLE TYPE</td></tr>
				<tr><td colspan="3">&nbsp;</td></tr>"}
				for(var/Y in varz)			//	Organize alphabetically the variables in eah lettered category
					BubbleSort(varz[Y])
					for(var/X in varz[Y])
						var/AA=X
						if(!(X in DENY_VAR_EDIT+((isarea(O)||isturf(O))?list("x","y","z","loc"):null)))AA={"<a href=byond://?command=edit;target=[h["target"]];type=edit;var=[X]>[X]</a>"}
						html += {"<tr name="[X]" class="[(X in VIEW_ENTRY_ONLY)?"viewonly ":""][issaved(O.vars[X])?"savable":"unsavable"]" style="display: 'none';"><td>[AA]"}
						if(!issaved(O.vars[X])) html += " <font color=red>(*)</font></td>"
						else html += "</td>"
						html += "<td>[DetermineVarValue(O.vars[X])]</td><td>[DetermineVarType(O.vars[X])]</td></tr>"
				html += "</table>[h["category"]&&h["category"]!="*"?{"<body onLoad="Show('[h["category"]]');">"}:""]"

				switch(h["type"])	//	The type of view undergoing
					if("view")
						html += "<br><font color=red>(*)</font> A warning is given when a variable \
						may potentially cause an error if modified.  If you ignore that warning and \
						continue to modify the variable, you alone are responsible for whatever \
						mayhem results!<br/>These variables is defined as either global, nst or tmp.</body></html>"

					if("edit")
						var/X,Y=h["nval"],W=h["var"],P=h["nvalue"],L[0],pre="<a href=byond://?command=edit;target=[h["target"]];type=edit;"
						if(h["list"])
							L=dd_text2list(h["list"],"`")
							X=O.vars
							for(var/a in L)
								X=X[a]
							if(W in X)X=X[W]
						else
							if(h["var"])
								if(L.len)
									X = O.vars
									for(var/a in L)X=X[a]
									if(W in X) X = X[W]
								else X=O.vars[h["var"]]
						html+={"<form name="input" id="fmr" action="byond://?" method="get"><center><h2>[W]</h2></center>"}
						if(Y)
							html+="<h3>"
							if((ckey(W) in list("client","type","parent_type"))||((isarea(O)||isturf(O))&&ckey(W)=="loc")) html+="This variable is not allowed to be edited"
							else if(("nvalue" in h)||Y=="file"||Y=="icon"||Y=="color")
								var/I
								if(Y=="file"||Y=="icon"||Y=="color")
									switch(Y)
										if("file")I = input(src,"Please select the file you wish to upload.","File Upload") as file|null
										if("icon")I = input(src,"Please select the icon you wish to upload.","Icon Upload") as icon|null
										if("color")I = input(src,"Please select the color you want.","Color change") as color|null
									if(!I)return..()
								html+="[W]: [X] ([DetermineVarType(X)]) has been changed to "

								X =(Y=="num")?text2num(P) :(Y=="type")?text2path(P) :(Y=="ref")? locate(P) :I?I :P //text
								html+="[X] ([DetermineVarType(X)])." // html+="[O.vars[W]] ([DetermineVarType(O.vars[W])])."
								if(!L.len)
									O.vars[W] = X
								else
									var/list/V = O.vars
									L.Remove(L[L.len])
									for(var/a in L)
										var/nA = text2num(a)
										if(isnum(nA))V = V[V[nA]]
										else V=V[a]
									if(h["listpos"])
										var/VV = text2num(h["listpos"])
										if(Y=="assiolist" || isnum(V[VV])) V[V[VV]] = X
										else V[VV] = X
									else V[W] = X
									//alert("V = [V] // W = [W]")
									//O.vars[L[1]] = V
								if(I&&Y=="icon")
									src<<browse_rsc(I,"\ref[I].png")
									html+={"<img src="\ref[I].png" alt="[copytext("[I]",1,length("[I]")-3)]">"}
							else
								html+={"<input type="hidden" name="command" value="edit">
<input type="hidden" name="target" value="[h["target"]]">
<input type="hidden" name="type" value="edit">
<input type="hidden" name="var" value="[W]">
<input type="hidden" name="nval" value="[Y]">"}
								if(h["listpos"])
									if(Y == "assiolist")
										h["list"] += "`[W]"
										h["listpos"] = 0
									else html += {"<input type="hidden" name="listpos" value="[h["listpos"]]">"}
								if(h["list"]) html += {"<input type="hidden" name="list" value="[h["list"]]">"}

								switch(Y)
									if("remove") //Remove value from list
										if((alert(src,"Are you sure you want to remove this value from its' list?","Remove list value","Yes","No"))!="Yes")return..()
										L-=W
										X=O.vars
										for(var/a in L)X=X[a]
										X-=W
										alert(src,"The value has been removed from its' list.","List value removed")
										html+="VARIABLE/VALUE REMOVED!"
									if("default")
										if((alert(src,"Are you sure you want to restore this variable to its' default value: [initial(O.vars[W])]?","Restore initial value","Yes","No"))!="Yes")return..()
										html+="[W]: [X] ([DetermineVarType(X)]) has been changed to "
										if(L.len)
											L-=W
											X=O.vars
											for(var/a in L)X=X[a]
											X=initial(X)
										else
											O.vars[W]=initial(O.vars[W])
											X = O.vars[W]

										html+="[X] ([DetermineVarType(X)])."
									if("text") html += {"<input type="text" name="nvalue" value="[X]"><input type="submit" value="Change Data">"}
									if("num") html += {"<input type="text" name="nvalue" value="[X]"><input type="submit" value="Change Data">"}
									if("type")
										if(!h["parent"])
											html+={"Please select the parent path you want:</h3><select name="parent" size="4">"}
											for(var/a in list(/mob,/obj,/turf,/area,/atom,/atom/movable))html+="<option>[a]</opion>"
											html+={"</select><br><input type="submit" value="View parent type">"}
										else
											html+={"Please select the path you want:</h3><select name="nvalue" size="10">"}
											for(var/a in typesof(h["parent"]))html+="<option>[a]</opion>"
											html+={"</select><br><input type="submit" value="Change Type">"}
									if("ref")
										if(!h["parent"])
											html+={"Please select the parent path you want:</h3><select name="parent" size="4">"}
											for(var/a in list(/mob,/obj,/turf,/area))html+="<option>[a]</opion>"
											html+={"</select><br><input type="submit" value="View parent type">"}
										else
											html+={"Please select the path you want:<input type="hidden" name="parent" value="[h["parent"]]" ></h3><select name="nvalue" size="10">"}
											var/lisss[0]
											for(var/atom/a)if(!(a.type in lisss))if(istype(a,text2path(h["parent"]))){lisss+=a.type;html+={"<option value="\ref[a]">[a.type][(h["parent"]=="/mob"&&a:client)?" ([a:key])" : ""]</opion>"}}
											html+={"</select><br><input type="submit" value="Change Type" >"}
									if("null")
										if(W=="gender")
											html+="This is not allowed!"
										else
											if((alert(src,"Are you sure you want to turn this variable to null?","Nullify value","Cancel","Yes","No"))!="Yes")return..()
											html+="[W]: [X] ([DetermineVarType(X)]) has been changed to "
											X = O.vars
											if(L.len)
												var/V = X
												for(var/a in L)
													X=V
													V=V[a]
												V = null
											else X[W]=null
											html+="[X[W]] ([DetermineVarType(X[W])])."

									if("list")html+="Edit to \"List\" has been denied!"
							html+="</h3><p>"
						if(Y!="remove")
							html +="<table width=100%>\n<tr><td>CURRENT VALUE</td><td>PROBABLE TYPE</td></tr>\n"
							html +="<td>[DetermineVarValue(X)]</td><td>[DetermineVarType(X)]</td></tr></table>\n"

							if(L.len||islist(X))
								var/LW = L
								if(!(W in L))LW += W
								pre += "list=[dd_list2text(LW,"`")];"

							if(!islist(X) || h["listpos"])
								pre += "var=[W];"
								if(L.len)
									html +="<hr><h4>What do your wish to do?</h4>[pre]nval=remove>Remove [W] from the list</a>"

								if(W)
									if(text2num(h["listpos"]))
										pre += "listpos=[h["listpos"]];"
										html += "<br/>[pre]nval=assiolist>Add/change associate value"
									pre += "nval="
									html +="<hr><h4>Change variable to:</h4>"
									if(W in SPECIFIC_VALUES)
										for(var/v in SPECIFIC_VALUES[W])
											var/vv = SPECIFIC_VALUES[W][v]
											html+="[pre][istext(vv)?"text":"num"];nvalue=[vv]>[v]</a><br>"
									else
										if(!L.len && !h["listpos"]) html += "[pre]default>Default [DetermineVarType(initial(O.vars[W]))]</a><br>"
										html+="[pre]text>Text</a><br>"
										html+="[pre]num>Number</a><br>"
										html+="[pre]type>Type</a><br>"
										html+="[pre]ref>Reference</a><br>"
										html+="[pre]file>File</a><br>"
										html+="[pre]icon>Icon</a><br>"
										html+="[pre]color>Color</a><br>"
										html+="[pre]null>Null</a>"
							else
								html +="<hr><h4>The following variables are in the list:</h4><br>"
								if(length(X))
									L+=W
									for(var/a in X)
										var/pre2 = pre
										var/addpar
										if(istype(a,/datum)) //  If a is an object
											addpar = " ([a:type])"
											// var/tar = findtext(pre,"target=")
											//alert(pre)
											pre2 = copytext(pre,1,findtext(pre,"target=")) \
												  +"target=\ref[a];type=view"
												  //+ copytext(pre,findtext(pre,";",tar)) // Change the target
											//alert(pre)
										else
											pre2 += "var=[a];"

										if(W in VIEW_ENTRY_ONLY)
											html += "[a][addpar]"
										else
											if(!addpar)
												var
													list/V = X
													lpos = V.Find(a)
												if(lpos)
													if(isnum(V[lpos]) || !islist(V[V[lpos]])) pre2 += "listpos=[lpos];"
											html += "[pre2]>[a][addpar]</a>"

										html += "<br>"
								else
									html+="<b>There's nothing in the list!</b><p/>"
									if(!(W in VIEW_ENTRY_ONLY+"contents")) html += "Would you like to [pre];var=[W];nval=remove>remove this entry</a>?"
						html+="</form>"

					if("view")
						html +="<center><h3>Letter <u>[h["letter"]]</u> Index</h3></center><table width=100%>\n<tr><td>VARIABLE NAME</td><td>CURRENT VALUE</td><td>PROBABLE TYPE</td></tr>\n"
						for(var/Y in varz)for(var/X in varz[Y])
							html += {"<tr name="[Y]" class="[(X in VIEW_ENTRY_ONLY)?"viewonly ":""][issaved(O.vars[X])?"savable":"unsavable"]" style="display: 'none';"><td>"}
							if(Y in VIEW_ENTRY_ONLY) html += X
							else html += {"<a href=byond://?command=edit;target=[h["target"]];type=edit;var=[X]>[X]</a>"}

							if(!issaved(O.vars[X])) html += " <font color=red>(*)</font></td>"
							else html += "</td>"
							html += "<td>[DetermineVarValue(O.vars[X])]</td><td>[DetermineVarType(O.vars[X])]</td></tr>"
						html += "</table>"
						html += "<br><br><font color=red>(*)</font> A warning is given when a variable \
						may potentially cause an error if modified.  If you ignore that warning and \
						continue to modify the variable, you alone are responsible for whatever \
						mayhem results!<br/>These variables is defined as either global, nst or tmp.</body></html>"

		if(html!=_CSS)mob<<browse(html,extra)

		return..()


proc
	DetermineVarType(X)return "[islist(X)? "List" : istext(X)? "Text" : isloc(X)? "Atom" : isnum(X)? "Num" : isicon(X)? "Icon" : istype(X,/datum)? "Type (or datum)" : isnull(X)? X==0?"Num" : "(Null)" : "(Unknown)"]"
	DetermineVarValue(variable)
		if(istext(variable))return "\"[variable]\""
		if(isloc(variable))return "<i>[variable:name]</i> ([variable:type])"
		if(isnum(variable))
			var/return_val = num2text(variable,13)+" <font size=1>"
			switch(variable)
				if(0)return_val  += "(FALSE)"
				if(1)return_val  += "(TRUE, NORTH, or AREA_LAYER)"
				if(2)return_val  += "(SOUTH or TURF_LAYER)"
				if(3)return_val  += "(OBJ_LAYER)"
				if(4)return_val  += "(EAST or MOB_LAYER)"
				if(5)return_val  += "(NORTHEAST or FLOAT_LAYER)"
				if(6)return_val  += "(SOUTHEAST)"
				if(8)return_val  += "(WEST)"
				if(9)return_val  += "(NORTHWEST)"
				if(10)return_val += "(SOUTHWEST)"
			return return_val+"</font>"
		if(isnull(variable))return "null"

		return "- [variable] -"


#endif


proc

	All_Clients()
		var/list/L=new
		for(var/mob/Lp in world)
			if(Lp.client)L+=Lp
		return L