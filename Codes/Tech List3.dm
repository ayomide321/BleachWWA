mob
	proc
		Fireball_Graveyard()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 2000)
				src << "<b>Your rei is too low [src.rei]/2000!"
				return
			if(src.firing == 0)
				src.firing = 1
				src.rei -= 2000
				var/mob/A = new/mob/WingBallHome(locate(src.x-7,src.y-3,src.z))
				var/mob/A1 = new/mob/WingBallHome(locate(src.x-7,src.y-2,src.z))
				var/mob/A2 = new/mob/WingBallHome(locate(src.x-7,src.y-1,src.z))
				var/mob/A3 = new/mob/WingBallHome(locate(src.x-7,src.y,src.z))
				var/mob/A4 = new/mob/WingBallHome(locate(src.x-7,src.y+1,src.z))
				var/mob/A5 = new/mob/WingBallHome(locate(src.x-7,src.y+2,src.z))
				var/mob/A6 = new/mob/WingBallHome(locate(src.x-7,src.y+3,src.z))
				var/mob/A7 = new/mob/WingBallHome(locate(src.x+7,src.y-3,src.z))
				var/mob/A8 = new/mob/WingBallHome(locate(src.x+7,src.y-2,src.z))
				var/mob/A9 = new/mob/WingBallHome(locate(src.x+7,src.y-1,src.z))
				var/mob/B = new/mob/WingBallHome(locate(src.x+7,src.y,src.z))
				var/mob/B1 = new/mob/WingBallHome(locate(src.x+7,src.y+1,src.z))
				var/mob/B2 = new/mob/WingBallHome(locate(src.x+7,src.y+2,src.z))
				var/mob/B3 = new/mob/WingBallHome(locate(src.x+7,src.y+3,src.z))
				var/mob/B4 = new/mob/WingBallHome(locate(src.x-3,src.y+7,src.z))
				var/mob/B5 = new/mob/WingBallHome(locate(src.x-2,src.y+7,src.z))
				var/mob/B6 = new/mob/WingBallHome(locate(src.x-1,src.y+7,src.z))
				var/mob/B7 = new/mob/WingBallHome(locate(src.x,src.y+7,src.z))
				var/mob/B8 = new/mob/WingBallHome(locate(src.x+1,src.y+7,src.z))
				var/mob/B9 = new/mob/WingBallHome(locate(src.x+2,src.y+7,src.z))
				var/mob/C = new/mob/WingBallHome(locate(src.x+3,src.y+7,src.z))
				var/mob/C1 = new/mob/WingBallHome(locate(src.x-3,src.y-7,src.z))
				var/mob/C2 = new/mob/WingBallHome(locate(src.x-2,src.y-7,src.z))
				var/mob/C3 = new/mob/WingBallHome(locate(src.x-1,src.y-7,src.z))
				var/mob/C4 = new/mob/WingBallHome(locate(src.x,src.y-7,src.z))
				var/mob/C5 = new/mob/WingBallHome(locate(src.x+1,src.y-7,src.z))
				var/mob/C6 = new/mob/WingBallHome(locate(src.x+2,src.y-7,src.z))
				var/mob/C7 = new/mob/WingBallHome(locate(src.x+3,src.y-7,src.z))
				var/mob/C8 = new/mob/WingBallHome(locate(src.x-6,src.y-4,src.z))
				var/mob/C9 = new/mob/WingBallHome(locate(src.x-5,src.y-5,src.z))
				var/mob/D1 = new/mob/WingBallHome(locate(src.x-4,src.y-6,src.z))
				var/mob/D2 = new/mob/WingBallHome(locate(src.x+4,src.y+6,src.z))
				var/mob/D3 = new/mob/WingBallHome(locate(src.x+5,src.y+5,src.z))
				var/mob/D4 = new/mob/WingBallHome(locate(src.x+6,src.y+4,src.z))
				var/mob/D5 = new/mob/WingBallHome(locate(src.x+6,src.y+5,src.z))
				var/mob/D6 = new/mob/WingBallHome(locate(src.x+5,src.y+6,src.z))
				var/mob/D7 = new/mob/WingBallHome(locate(src.x+4,src.y+7,src.z))
				var/mob/D8 = new/mob/WingBallHome(locate(src.x-4,src.y-7,src.z))
				var/mob/D9 = new/mob/WingBallHome(locate(src.x-5,src.y-6,src.z))
				var/mob/D = new/mob/WingBallHome(locate(src.x-6,src.y-5,src.z))
				var/mob/E1 = new/mob/WingBallHome(locate(src.x-6,src.y+4,src.z))
				var/mob/E2 = new/mob/WingBallHome(locate(src.x-5,src.y+5,src.z))
				var/mob/E3 = new/mob/WingBallHome(locate(src.x-4,src.y+6,src.z))
				var/mob/E4 = new/mob/WingBallHome(locate(src.x+4,src.y-6,src.z))
				var/mob/E5 = new/mob/WingBallHome(locate(src.x+5,src.y-5,src.z))
				var/mob/E6 = new/mob/WingBallHome(locate(src.x+6,src.y-4,src.z))
				var/mob/E7 = new/mob/WingBallHome(locate(src.x-6,src.y+5,src.z))
				var/mob/E8 = new/mob/WingBallHome(locate(src.x-5,src.y+6,src.z))
				var/mob/E9 = new/mob/WingBallHome(locate(src.x-4,src.y+7,src.z))
				var/mob/E = new/mob/WingBallHome(locate(src.x+4,src.y-7,src.z))
				var/mob/F = new/mob/WingBallHome(locate(src.x+5,src.y-6,src.z))
				var/mob/F1 = new/mob/WingBallHome(locate(src.x+6,src.y-5,src.z))
				var/mob/F2 = new/mob/WingBallHome(locate(src.x-7,src.y+4,src.z))
				var/mob/F3 = new/mob/WingBallHome(locate(src.x+7,src.y-4,src.z))
				var/mob/F4 = new/mob/WingBallHome(locate(src.x-7,src.y-4,src.z))
				var/mob/F5 = new/mob/WingBallHome(locate(src.x+7,src.y+4,src.z))
				A:owner = src
				A1:owner = src
				A2:owner = src
				A3:owner = src
				A4:owner = src
				A5:owner = src
				A6:owner = src
				A7:owner = src
				A8:owner = src
				A9:owner = src
				B:owner = src
				B1:owner = src
				B2:owner = src
				B3:owner = src
				B4:owner = src
				B5:owner = src
				B6:owner = src
				B7:owner = src
				B8:owner = src
				B9:owner = src
				C:owner = src
				C1:owner = src
				C2:owner = src
				C3:owner = src
				C4:owner = src
				C5:owner = src
				C6:owner = src
				C7:owner = src
				C8:owner = src
				C9:owner = src
				D:owner = src
				D1:owner = src
				D2:owner = src
				D3:owner = src
				D4:owner = src
				D5:owner = src
				D6:owner = src
				D7:owner = src
				D8:owner = src
				D9:owner = src
				E:owner = src
				E1:owner = src
				E2:owner = src
				E3:owner = src
				E4:owner = src
				E5:owner = src
				E6:owner = src
				E7:owner = src
				E8:owner = src
				E9:owner = src
				F:owner = src
				F1:owner = src
				F2:owner = src
				F3:owner = src
				F4:owner = src
				F5:owner = src
				sleep(5)
				for(var/mob/WingBallHome/m)
					if(m.owner==src)
						walk_towards(m,src,1)
				sleep(95)
				src.firing=0