var
	chat_filter = list(//Anti-spam filters
	                   "http:" = "spam:", "byond:" = "spam:", "\n\n" = "\n", "\n" = " ... ", "  " = " ", "\t\t"  = "\t", "<f" = "ERROR 401", //instead of <
	                   "< f" = "ERROR 401","aaa" = "aa", "bbb" = "bb", "ccc" = "cc", "ddd" = "dd", "eee" = "ee", "fff" = "ff", "ggg" = "gg",  //   No word in english ever uses more than
	                   "hhh" = "hh", "iii" = "ii", "jjj" = "jj", "kkk" = "kk", "lll" = "ll", "mmm" = "mm", "nnn" = "nn",  // two of the same letter in a row. Some of
	                   "ooo" = "oo", "ppp" = "pp", "qqq" = "qq", "rrr" = "rr", "sss" = "ss", "ttt" = "tt", "uuu" = "uu",  // these could probably even be set to prevent
	                   "vvv" = "vv", "www" = "ww", "xxx" = "xx", "yyy" = "yy", "zzz" = "zz",                              // two letters, but this is consistent.
	                   "...." = "...",
	                   //Anti-bypass filers (anti-idiot messes these up)
	                   "p u s s y" = "pussy", "f u c k" = "fuck", "f u ck" = "fuck",
	                   //Anti-idiot filters
	                   " u " = " you ", " ur " = " your ", " r " = " are ") //, "zagros" = " Zagros is shredded ", "zag" = "cool cat zagros") crashed game
	                   // set up to basic racist terms -_-
	               /*    "n igga" = "nigga","ni gga" = "nigga","nig ga" = "nigga","nigg a" = "nigga","n i gga" = "nigga","n i g ga" = "nigga","n i g g a" = "nigga", "n-igga" = "nigga","ni-gga" = "nigga","nig-ga" = "nigga","nigg-a" = "nigga","n-i-gga" = "nigga","n-i-g-ga" = "nigga","n-i-g-g-a" = "nigga",
	                   "n iqqa" = "nigga","ni qqa" = "nigga","niq qa" = "nigga","niqq a" = "nigga","n i qqa" = "nigga","n i q qa" = "nigga","n i q q a" = "nigga", "n-iqqa" = "nigga","ni-qqa" = "nigga","niq-qa" = "nigga","niqq-a" = "nigga","n-i-qqa" = "nigga","n-i-q-qa" = "nigga","n-i-q-q-a" = "nigga",
	                   "n igger" = "nigger","ni gger" = "nigger","nig ger" = "nigger", "nigg er" = "nigger","nigge r" = "nigger", "n i gger" = "nigger" ,"n i g ger" = "nigger" ,"n i g g er" = "nigger" ,"n i g g e r" = "nigger" , "n-igger" = "nigger","ni-gger" = "nigger","nig-ger" = "nigger","nigg-er" = "nigger","nigge-r" = "nigger","n-i-gger" = "nigger" ,"n-i-g-ger" = "nigger" ,"n-i-g-g-er" = "nigger", "n-i-g-g-e-r"="nigger",
	                   "n iqqer" = "nigger","ni qqer" = "nigger","niq qer" = "nigger", "niqq er" = "nigger","niqqe r" = "nigger", "n i qqer" = "nigger" ,"n i q qer" = "nigger" ,"n i q q er" = "nigger" ,"n i q q e r" = "nigger" , "n-iqqer" = "nigger","ni-qqer" = "nigger","niq-qer" = "nigger","niqq-er" = "nigger","niqqe-r" = "nigger","n-i-qqer" = "nigger" ,"n-i-q-qer" = "nigger" ,"n-i-q-q-er" = "nigger", "n-i-q-q-e-r"="nigger",
	                   "n ig" = "nig ", "ni g" = "nig ", "n-ig" = "nig ", "ni-g" = "nig ",
	                   "niq" = "nig ", "n iq" = "nig ", "ni q" = "nig ", "n-iq" = "nig ", "ni-q" = "nig ",
	                   "n iga" = "niga ", "ni ga" = "niga ", "nig a" = "niga ", "n i ga" = "niga ", "n i g a" = "niga ","n-iga" = "niga ", "ni-ga" = "niga ", "nig-a" = "niga ", "n-i-ga" = "niga ", "n-i-g-a" = "niga ",
	                   "n iqa" = "niga", "ni qa" = "niga", "niq a" = "niga", "n i qa" = "niga", "n i q a" = "niga","n-iqa" = "niga", "ni-qa" = "niga", "niq-a" = "niga", "n-i-qa" = "niga", "n-i-q-a" = "niga",
	                    // getting tired of the over use of nigga
	                   "nigga" = "fully functioning member of society", "nigger" = "fully functioning black member of society", "negro" = "functioning member of society",
	                   "niga " = "fully functioning member of society"," niga" = "fully functioning member of society","niger" = "fully functioning black member of society", "nig " = "functioning member of society"," nig" = "functioning member of society"*/
turf
	var
		sscheck=0
		well=0
mob
	var/tmp
		enemy = 0

mob
	var
		chargedalready = 0
		Rebirthed = 0
		Rebirthedpart3 =0
		Lvl1000Boost = 0
		Lvl1000BoostRB = 0
var
 AFKcheckin = 0
mob
	var
		tmp/cankillkarakura=0
mob
	var
		tmp/checking = 0
mob
	icon='Icons/BaseTannew.dmi'
	var
		canphase=0
		statusold=null
		squad1old
		tmp/origexp=null
		psp=0
		pink=0
		tmp/cheated=0
		tmp/inoueshield = 0
		tmp/inouezip = 0
		inouehealhave = 0
		inoueziphave = 0
obj/Money
	icon='Icons/money.dmi'
	small
		icon_state="small"
		New()
			src.mvalue=rand(20,40)
			..()
	big
		icon_state="big"
		New()
			src.mvalue=rand(100,200)
			..()
	New()
		..()
		src.pixel_y=rand(0,26)
		src.pixel_x=rand(0,26)
		spawn(300)
		del src
atom/movable/var
	view=8
	random
	tmp/cansave = 0
mob/var/Size=0

var/Sizeup_Compat=0
mob/var/list
	iSizeup1=new
	iSizeup2=new
obj
	var
		beenout=0
		tousb=0
		list/trails=new
		garganta=0
		head=0
		chainwrap=0
		tmp/justused=0
		gamer=0
		tmp/ispedals=0
		ccerored=150
		ccerogreen=0
		cceroblue=0
		crissing=0
		sp=0
		tmp/split=0
		mvalue=0
		stacked=1
		tmp/owner
		equipped
		armor
		straight=0
		hitting=0
		single=0
		strong=0
		tmp/training=0
mob/var
	tmp
		//no boost, no slowdowns, no stuns, no skills, no melee, and no moving(flash step only)
		noboost=0
		noslow=0
		nostun=0
		noskill=0
		nomelee=0
		nomove=0
	nextrespec=0
	gotkido=0
	waitForRankTest=0
	boughtlevelpoints=0
	Rebirthedpart2 = 0
	newhollowking=0
	isEspadaLeader=0
	newsadoking=0
	newquincyking=0
	tmp/jomoned=0
	tmp/saied=0
	tmp/guildpassiveboost=0
	chosespirit=0
	spiritweapon=0
	learnshoen=0
	learncream=0
	learnfort=0
	requiresdonorcheck=0
	tmp/raid=0
	tmp/kamikaze=0
	tmp/tripped=0
	npcespada=0
	tmp/neged=0
	dualon=0
	iscaptain=0
	iscaptaincommander=0
	gotdualswords=0
	chargewins=0
	failcharge=0
	diedwithcharge=0
	lreleaseuses=0
	tmp/limitreleasecool=0
	gotlimitrelease=0
	tmp/limitrelease=0
	gotorgcloak=0
	petcd=0
	guildcolor="#87cefa"
	petmsg=0
	changed=0
	tmp/playingchess=0
	tmp/controlinchess=0
	gotneg=0
	tmp/negacionon=0
	npccaptain=0
	tmp/allowmove=0
	tmp/chosezan=0
	guildpoints=0
	quincyhuntersixtynine=0
	quincyhuntersixtyninemission=0
	rhykills=0
	inghouse=0//which house ur in
	tmp/ingwar=0//1=u were in it,2=u died/left the house
	tmp/wnddone=0
	tmp/dmgdone=0
	tmp/twigotdmg=0
	tmp/twigotwnd=0
	tmp/combatactivated=0
	tmp/segunda=0
	vand=0
	tmp/combatmode=0
	needrespec=0
	tmp/justress=0
	tmp/shibaring=0
	tmp/gritzed=0
	tmp/outraging=0
	ooctoggle=0
	rstoggle=0
	tmp/coffincool=0
//	traveltime=0
	tmp/absorbcero=0
	tmp/bull=0
	tmp/bullcool=0
	tmp/extravagant=0
	tmp/extravagantcool=0
	tmp/carnage=0
	tmp/carnagecool=0
	tmp/explocool=0
	tmp/particlecrip=0
	tmp/particlecripcool=0
	ux=0
	uy=0
	uz=0
	tmp/utsemi=0
	tmp/utsemicool=0
	rx=0
	ry=0
	rz=0
	tmp/gotthecharge=0
	tmp/shibari=0
	ressdrain=15
	almighty=1
	var/rodeo=0
	var/justate=0
	tmp/ageshield=0
	tmp/ageshielding=0
	tmp/esmashed=0
	tmp/esmashing=0
	earth=0
	shinip=0
	hollow=0
	shini=0
	tmp/gotcharge=0
	tmp/angeled=0
	tmp/dlc=0
	tmp/exception=0
	triedvai=0
	tmp/bankaied=0
	tmp/graved=0
	lcon=0
	tmp/lconcool=0
	gotfinalfb=0
	coiled=0
	hrecoil=0
	tmp/hrecoilcool=0
	tmp/critburst=0
	tmp/critstun=0
	canvasto=0
	tmp/fireback=0
	shielduses=0
	gotsheild=0
	gottsubaki=0
	tmp/shelda=0
	tmp/inosh=0
	tmp/inocool=0
	tmp/hellon=0
	legit=0
	tmp/desd=0
	tmp/myperson=null
	tmp/stolena=0
	tmp/stolenr=0
	tmp/stolend=0
	tmp/stolen=0
	tmp/stolencool=0
	tmp/muertecool=0
	hougboost=0
	tmp/gotonhoug=0
	evilgood=""
	beatandget=0
	talkin=0
	onlyone=0
	arrkills=0
	newshikills=0
	newfulkills=0
	newholkills=0
	newquikills=0
	newsadkills=0
	newvaikills=0
	newpvpkills=0
	didint=0
	toochep=0
	talktoshinji=0
	isrealaizen=0
	gottatalk=0
	isstrongh=0
	missioncount=0
	missionspassed=0
	missionsfailed=0
	shinimish1=0
	shinimishkills=0
	shinimish2=0
	gotsanrei=0
	nextpart=0
	tmp/senkeicool=0
	tmp/protective=0
	tmp/protectivecool=0
	missioncool=0
	tmp/gothit=0
	follow=0
	village=""
	clan="Clanless"
	tmp/mlocation=""
	tmp/missiontarget=null
	tmp/missionclass=""
	tmp/mission=0
	tmp/dmission=0
	tmp/scan=0
	tmp/mscroll=""
	tmp/spy=0
	tmp/spy2=0
	tmp/timed=0
	tmp/invil=0
	tmp/killedsofar=0
	lasthitby=null
	tmp/hardhitted=0
	tmp/sharinganreversalcool=0
	tmp/threecool=0
	tmp/hellsummon=0
	gotsharingan = 0
	hiding=0
	fgtcool=0
	fgtmax=10
	fgttime=10
	rep=1
	gotsense=0
	releasered=0
	releasegreen=0
	releaseblue=0
	tmp/inbankai2=0
	FGT=0
	beatfgts=0
	gotfgt=0
	gotaizen=0
	tmp/seelsword=0
	skiller=0
	srunner=0
	gotrandom=0
	story=0
	gotscreech=0
	gotruth=0
	cheapstuff=0
	beatvich=0
	beatbygm=0
	beatgm=0
	minutemadekill=0
	minutemade=0
	lamuertesurvivor=0
	beatlzan=0
	beatroyale=0
	exact=0
	wonreigai=0
	bledoutalready=0
	kskills=0
	kfkills=0
	vkills=0
	kkills=0
	fkills=0
	lkills=0
	shkills=0
	hkills=0
	tmp/regenmode=0
	tmp/regenmoded=0
	tmp/unohana1=0
	wasstrong=0
	wasmenos=0
	wasadjucha=0
	wasvasto=0
	waspurevasto=0
	respectimes=0
	tmp/pure=0
	tmp/trippy=0
	tmp/aware=0
	tmp/speedful=0
	gotvai2
	gotvasto=0
	beatkarakumedal=0
	beatkichigo=0
	beatkishida=0
	beatkurahara=0
	beatksado=0
	passedafkcheck=0
	eventpoints=0
	eventswon=0
	overwound=0
	shundrain=5
	tmp/shunko=0
	tmp/shunkoed=0
	tmp/tshunko=0
	tmp/tshunkoed=0
	tmp/gotheat=0
	tmp/screech=0
	tmp/ruth=0
	tmp/toofull=0
	tmp/steadyrage=0
	tmp/rage=0
	tmp/bursted=0
	tmp/burst=0
	tmp/lethaled=0
	tmp/lethal=0
	tmp/smashing=0
	tmp/smashed=0
	tmp/dblfire=0
	picking=0
	tmp/petalsfired=0
	killva=0
	isavasto=0
	vastoskilled=0
	boss=0
	fstyle=0
	didityet=0
	saveuse=0
	chosebex
	hollowskilledingame=0
	gamehollow=0
	irace=0
	aizentag=0
	tmp/time=0
	mmachine=0
	gamemish=0
	uraharafinal=0
	sadofinal=0
	ishidafinal=0
	tmp/renjifire=0
	hal=0
	killedhal=0
	tmp/trans=0
	gotcascada=0
	fgetsugas=0
	tmp/hedidit=0
	lostvai=0
	lvaikills=0
	Bum3mission=0
	vaikills=0
	Bum4mission=0
	VanderMurders=0
	newvand=0
	Bum2mission=0
	numkills=0
	numer=0
	Bummission=0
	tmp/sov=0
	zommari=0
	nnoitra=0
	barragan=0
	vastoshini=0
	mastered=2
	gotrev=0
	vastoichigo=0
	tmp/aclones=0
	tmp/killclones=0
	tmp/canattacks=0
	tmp/poison=0
	tmp/poisoncool=0
	tsukishima=0
	test_gotei=0
	kicks=0
	tmp/senkad=0
	tmp/senkacool=0
	tmp/memstrike=0
	tmp/memstrikecool=0
	thits=0
	gothits=0
	gotring=0
	gotbringerb=0
	gotgame=0
	gotkick=0
	tmp/firsthit=0
	tmp/secondhit=0
	tmp/thirdhit=0
	tmp/forthhit=0
	tmp/firsthitcool=0
	tmp/secondhitcool=1
	tmp/thirdhitcool=1
	tmp/forthhitcool=1
	tmp/bootboost=0
	getsugaring=0
	bringerblast=0
	tmp/gaming=0
	tmp/gotitem=0
	ginjo=0
	tmp/infull=0
	full=0
	ftype=0
	tmp/inafull=0
	gotafull=0
	tmp/beerboost=0
	gotlacerate=0
	tmp/lacerated=0
	gotoutrage=0
	tmp/vastocool=0
	tmp/goingress=0
	tmp/restep=0
	tmp/restepping=0
	tmp/step1=0
	tmp/step2=0
	tmp/step3=0
	tmp/step4=0
	tmp/step5=0
	tmp/step6=0
	tmp/step7=0
	tmp/step8=0
	tmp/step9=0
	tmp/step10=0
	tmp/step11=0
	tmp/step12=0
	tmp/steploc=0
	illusion=0
	isfgt=0
	tmp/kx=0
	tmp/ky=0
	tmp/kz=0
	tmp/kawa=0
	tmp/kawacool=0
	tmp/beer3=0
	tmp/beer1=0
	iszan=0
	tmp/myzan=0
	tmp/bringout=0
	tmp/wired=0
	tmp/lost=0
	tmp/sealed=0
	tmp/materialized=0
	tmp/materializedcool=0
	ismura=0
	tmp/sealing=0
	tmp/heaven=0
	choseboost=0
	stark=0
	gotvai=0
	tmp/flashmelee=0
	tmp/flashcool=0
	byakuyas=0
	tmp/beatshinis=0
	tmp/beatbyakuya=0
	tmp/list/smoked=new
	tmp/smoking=0
	choseyet=0
	killedulquiorra=0
	ulquiorra=0
	szayel=0
	killedespadas=0
	killedgrimmjow=0
	killedszayel=0
	killedstark=0
	killedbarragan=0
	killednnoitra=0
	killedzommari=0
	tmp/almostdone=0
	grimmjow=0
	hasarrancarrelease=0
	cerored=150
	cerogreen=0
	ceroblue=0
	tmp/caughtpetal=0
	tmp/crissed=0
	tmp/safezone=0
	releasecolor="Red"
	tmp/iregen=0
	adrain=5
	tmp/arelease=0
	isdisplay=0
	isfrac=0
	squadid=null
	espadasold=null
	tmp/charge=0
	tmp/charging=0
	pet=0
	frank=0
	willowk=0
	tmp/maskcool=0
	hasaseele=0
	canbuyseele=0
	tmp/inberserk=0
	tmp/hs=0
	tmp/saved=0
	tmp/arm=0
	tmp/leg=0
	tmp/core=0
	tmp/smooth=0
	tmp/controller=null
	tmp/controlled=0
	gotbum=0
	gotquake=0
	gotage=0
	gotsovereign=0
	issmoke=0
	son=0
	tmp/escort=0
	parentmission=0
	arrancar=0
	IsPureH=0
	teachermission=0
	menoskills=0
	menos=0
	adjuucha=0
	getwater=0
	farmermission=0
	adjuuchakills=0
	tmp/aizenaffected=0
	tmp/confused=0
	tmp/crit=0
	tmp/spren=0
	tmp/splita=0
	speedy=0
	zigzag=0
	homing=0
	slow=0
	blinding=0
	tmp/shunning=0
	tmp/shun=0
	flashpause=110
	tmp/roared=0
	tmp/roaring=0
	tmp/rushed=0
	tmp/rushing=0
	skill1=0
	skill2=0
	skill3=0
	skill4=0
	skill5=0
	skill6=0
	skill7=0
	skill8=0
	skill9=0
	skill0=0
	skillsub=0
	skillequ=0
	skillq=0
	skille=0
	skillo=0
	skillp=0
	skillpar=0
	skilly=0
	skillw=0
	tmp/trapping=0
	tmp/trapped=0
	tmp/alreadyhealed=0
	gottentacle=0
	gottentacle2=0
	tmp/extending=0
	tmp/shopping=0
	tmp/difficulty=1
	tmp/big=0
	tmp/runningcool=0
	tmp/running=0
	tmp/stung=0
	tmp/encircle=0
	beatashell=0
	aizen=0
	tmp/infinal=0
	tmp/lostpowers=0
	tmp/tensat=0
	tmp/spiritsword=0
	tmp/coffin=0
	tmp/list/clones=new
	tmp/teambattle
	tmp/partner
	tmp/hougonu=0
	shonshui
	gotaarm=0
	tmp/besar=0
	tmp/directo=0
	tmp/lamuerte=0
	tmp/won=0
	tmp/cpursuit=0
	tmp/inarena=0
	tmp/slashed=0
	winner=0
	hashougyokuwatch
	tmp/myclone
	reigai=0
	follower
	gotspear=0
	learnedtogglehina=0
	hashoug = 0
	ichigofinal=0
	gotwolf=0
	gotyoyo=0
	gotdesgarron=0
	gotdragon=0
	gotthrow=0
	quincystrong=0
	ultimatequincy=0
	sadostrong=0
	ultimatesado=0
	tmp/volcano=0
	tmp/deathtouch=0
	tmp/ulqgotsword=0
	beatichigo=0
	tmp/inouecool
	tmp/kenpachigotu=0
	ichigo=0
	earlyichigo=0
	kenpachi=0
	beatkenpachi=0
	mayuri=0
	worthiness=0
	finaltraining=0
	innerself=0
	clash=0
	M0
	senbon=0
	goalie=0
	tmp/shurikened=0
	tmp/soccergoal
	tmp/soccer
	list/skillcardhud
	tmp/cloned=0
	buycero=0
	buybala=0
	buyarm1=0
	buyarm2=0
	buyarm3=0
	gotress
	gotshik
	tmp/absorbtime=0
	tmp/kommamarubankai=0
	tmp/kommamarushikai=0
	clashup=0
	attacking=0
	tmp/absorb
	tmp/shadowing=0
	maskuses=0
	clashhits=0
	ressurectiontype=""
	tmp/ressurection=0
	tmp/vasto=0
	luck=0
	wound=0
	health=10000
	mattack=100
	mdefence=100
	mhealth=10000
	attackbuff=0
	tmp/attack = 100
	tmp/defence=100
	tmp/reiatsu=100
	mreiatsu=100
	pants_red=100
	pants_blue=0
	pants_green=0
	arrancarmask=0
	tutorial=1
	hasabankai=0
	hasashikai=0
	attacked=1
	tmp/rammed=0
	tmp/tousened=0
	rei = 50
	tmp/ko=0
	mrei = 50
	race = "Human"
	tmp/protected=0
	gotburial
	gotdevour
	icon_name="BaseTan"
	initialized=0
	list/player_gui=new
	vaizardmask
	tmp/ceroback = 0
	tmp/wings = 0
	bowtype
	money = 1000
	gotbara
	tmp/firing=0
	Gtitle=""
	captain=0
	exp=0
	tmp/target=0
	tmp/ikkakubankai = 0
	tmp/kirashi = 0
	bantype = 0
	flashstep = 0
	gotflash = 0
	mexp=100
	tmp/rundelay = 2
	tmp/canattack =1
	invai = 0
	basic= 1
	tmp/hitsugayabankai = 0
	tmp/bowon = 0
	tmp/hollowprotection = 1
	tmp/finalb = 0
	tmp/armon = 0
	tmp/dparmon=0
	tmp/inindeath=0
	tmp/shaked = 0
	gotrelease1
	gotrelease2
	gotrelease3
	fatigue = 0
	muted = 0
	pk=0
	gotfinal = 0
	gotfinal2 = 0
	weapon= 0
	shikai= 0
	swordon = 0
	npc = 0
	tmp/owner
	sanrei = 0
	olddir
	espadas = ""
	tmp/spectate=0
	tmp/renjibankai = 0
	tmp/ikkakushikai = 0
	bankai= 0
	zisanespada=0
	espadaboost=0
	tmp/retract= 0
	tmp/resting=0
	level=1
	tmp/zabitimes = 0
	tmp/chadref = 0
 lock = 0
 tmp/controlbug = 0
	kills=0
	gotarm = 0
	flashuse = 0
 stype=""
 letter=""
 oldspot
 hollowtype = ""
	deaths=0
	swordcall = ""
	swordname = ""
	tmp/inshikai = 0
	tmp/inbankai = 0
	tmp/move=1
	tmp/maskon = 0
	tmp/renjishikai
	tmp/safe = 0
	gotcero = 0
	hair
	Realplayer = 1
	swordD = 0
	tmp/spamcheck = 0
	dead = 0
	tmp/moving = 0
	tmp/frozen = 0
 cankido = 0
 kido1 = 0
 kido2 = 0
 kido3 = 0
 kido4 = 0
 kido5 = 0
 kido6 = 0
 gotcero2 = 0
 silver1 = 0
 silver2 = 0
 silver3 = 0
 silver4 = 0
 silver5 = 0
 status = ""
 squad = ""
 tmp/senkei = 0
 tmp/tousen = 0
 tmp/ispedal = 0
 fname
 lname
 bala
 challenged
 challenge
 rank=""
 strong
 estrong
 strong2
 estrong2
 strong3
 estrong3
 strong4
 estrong4
 strong5
 strong6
 summon
var
	announce

var
	captain1 = ""
	captain2 = ""
	captain3 = ""
	captain4 = ""
	captain5 = ""
	captain6 = ""
	captain7 = ""
	captain8 = ""
	captain9 = ""
	captain10 = ""
	captain11 = ""
	captain12 = ""
	captain13 = ""
	espadaL = ""
	espada1 = ""
	espada2 = ""
	espada3 = ""
	espada4 = ""
	espada5 = ""
	espada6 = ""
	espada7 = ""
	espada8 = ""
	espada9 = ""
	espada10 = ""
	vaizard1 = ""
	vaizard2 = ""
	vaizard3 = ""
	vaizard4 = ""
	vaizard5 = ""
	vaizard6 = ""
	vaizard7 = ""
	vaizard8 = ""
	vaizard9 = ""
	vaizard10 = ""
	vaizard11 = ""
	espadaleader = ""
	espadaco1 = ""
	espadaco2 = ""
	Lieutenant1 = ""
	Lieutenant2 = ""
	Lieutenant3 = ""
	Lieutenant4 = ""
	Lieutenant5 = ""
	Lieutenant6 = ""
	Lieutenant7 = ""
	Lieutenant8 = ""
	Lieutenant9 = ""
	Lieutenant10 = ""
	Lieutenant11 = ""
	Lieutenant12 = ""
	Lieutenant13 = ""
