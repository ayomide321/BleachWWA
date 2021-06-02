mob
	proc
		Shuriken_Graveyard()
			if(src.safe||src.fireback)
				return
			if(src.rei <= 2000)
				src << "<b>Your rei is too low [src.rei]/2000!"
				return
			if(!src.inbankai&&!src.inshikai)
				src<<"You need to be in shikai or bankai"
				return
			if(src.firing == 0)
				src.firing = 1
				src.rei -= 2000
				var/mob/A = new/mob/Floatswordhome(locate(src.x-7,src.y-3,src.z))
				spawn(0)
					//flick("create",A)
					A.icon_state=""
				var/mob/A1 = new/mob/Floatswordhome(locate(src.x-7,src.y-2,src.z))
				spawn(2)
					//flick("create",A1)
					A1.icon_state=""
				var/mob/A2 = new/mob/Floatswordhome(locate(src.x-7,src.y-1,src.z))
				spawn(4)
					//flick("create",A2)
					A2.icon_state=""
				var/mob/A3 = new/mob/Floatswordhome(locate(src.x-7,src.y,src.z))
				spawn(6)
					//flick("create",A3)
					A3.icon_state=""
				var/mob/A4 = new/mob/Floatswordhome(locate(src.x-7,src.y+1,src.z))
				spawn(8)
					//flick("create",A4)
					A4.icon_state=""
				var/mob/A5 = new/mob/Floatswordhome(locate(src.x-7,src.y+2,src.z))
				spawn(10)
					//flick("create",A5)
					A5.icon_state=""
				var/mob/A6 = new/mob/Floatswordhome(locate(src.x-7,src.y+3,src.z))
				spawn(12)
					//flick("create",A6)
					A6.icon_state=""
				var/mob/A7 = new/mob/Floatswordhome(locate(src.x+7,src.y-3,src.z))
				spawn(44)
					//flick("create",A7)
					A7.icon_state=""
				var/mob/A8 = new/mob/Floatswordhome(locate(src.x+7,src.y-2,src.z))
				spawn(46)
					//flick("create",A8)
					A8.icon_state=""
				var/mob/A9 = new/mob/Floatswordhome(locate(src.x+7,src.y-1,src.z))
				spawn(48)
					//flick("create",A9)
					A9.icon_state=""
				var/mob/B = new/mob/Floatswordhome(locate(src.x+7,src.y,src.z))
				spawn(50)
					//flick("create",B)
					B.icon_state=""
				var/mob/B1 = new/mob/Floatswordhome(locate(src.x+7,src.y+1,src.z))
				spawn(52)
					//flick("create",B1)
					B1.icon_state=""
				var/mob/B2 = new/mob/Floatswordhome(locate(src.x+7,src.y+2,src.z))
				spawn(54)
					//flick("create",B2)
					B2.icon_state=""
				var/mob/B3 = new/mob/Floatswordhome(locate(src.x+7,src.y+3,src.z))
				spawn(56)
					//flick("create",B3)
					B3.icon_state=""
				var/mob/B4 = new/mob/Floatswordhome(locate(src.x-3,src.y+7,src.z))
				spawn(28)
					//flick("create",B4)
					B4.icon_state=""
				var/mob/B5 = new/mob/Floatswordhome(locate(src.x-2,src.y+7,src.z))
				spawn(30)
					//flick("create",B5)
					B5.icon_state=""
				var/mob/B6 = new/mob/Floatswordhome(locate(src.x-1,src.y+7,src.z))
				spawn(32)
					//flick("create",B6)
					B6.icon_state=""
				var/mob/B7 = new/mob/Floatswordhome(locate(src.x,src.y+7,src.z))
				spawn(34)
					//flick("create",B7)
					B7.icon_state=""
				var/mob/B8 = new/mob/Floatswordhome(locate(src.x+1,src.y+7,src.z))
				spawn(36)
					//flick("create",B8)
					B8.icon_state=""
				var/mob/B9 = new/mob/Floatswordhome(locate(src.x+2,src.y+7,src.z))
				spawn(38)
					//flick("create",B9)
					B9.icon_state=""
				var/mob/C = new/mob/Floatswordhome(locate(src.x+3,src.y+7,src.z))
				spawn(40)
					//flick("create",C)
					C.icon_state=""
				var/mob/C1 = new/mob/Floatswordhome(locate(src.x-3,src.y-7,src.z))
				spawn(16)
					//flick("create",C1)
					C1.icon_state=""
				var/mob/C2 = new/mob/Floatswordhome(locate(src.x-2,src.y-7,src.z))
				spawn(18)
					//flick("create",C2)
					C2.icon_state=""
				var/mob/C3 = new/mob/Floatswordhome(locate(src.x-1,src.y-7,src.z))
				spawn(20)
					//flick("create",C3)
					C3.icon_state=""
				var/mob/C4 = new/mob/Floatswordhome(locate(src.x,src.y-7,src.z))
				spawn(22)
					//flick("create",C4)
					C4.icon_state=""
				var/mob/C5 = new/mob/Floatswordhome(locate(src.x+1,src.y-7,src.z))
				spawn(24)
					//flick("create",C5)
					C5.icon_state=""
				var/mob/C6 = new/mob/Floatswordhome(locate(src.x+2,src.y-7,src.z))
				spawn(26)
					//flick("create",C6)
					C6.icon_state=""
				var/mob/C7 = new/mob/Floatswordhome(locate(src.x+3,src.y-7,src.z))
				spawn(28)
					//flick("create",C7)
					C7.icon_state=""
				var/mob/C8 = new/mob/Floatswordhome(locate(src.x-6,src.y-4,src.z))
				spawn(2)
					//flick("create",C8)
					C8.icon_state=""
				var/mob/C9 = new/mob/Floatswordhome(locate(src.x-5,src.y-5,src.z))
				spawn(4)
					//flick("create",C9)
					C9.icon_state=""
				var/mob/D1 = new/mob/Floatswordhome(locate(src.x-4,src.y-6,src.z))
				spawn(6)
					//flick("create",D1)
					D1.icon_state=""
				var/mob/D2 = new/mob/Floatswordhome(locate(src.x+4,src.y+6,src.z))
				spawn(50)
					//flick("create",D2)
					D2.icon_state=""
				var/mob/D3 = new/mob/Floatswordhome(locate(src.x+5,src.y+5,src.z))
				spawn(52)
					//flick("create",D3)
					D3.icon_state=""
				var/mob/D4 = new/mob/Floatswordhome(locate(src.x+6,src.y+4,src.z))
				spawn(54)
					//flick("create",D4)
					D4.icon_state=""
				var/mob/D5 = new/mob/Floatswordhome(locate(src.x+6,src.y+5,src.z))
				spawn(46)
					//flick("create",D5)
					D5.icon_state=""
				var/mob/D6 = new/mob/Floatswordhome(locate(src.x+5,src.y+6,src.z))
				spawn(44)
					//flick("create",D6)
					D6.icon_state=""
				var/mob/D7 = new/mob/Floatswordhome(locate(src.x+4,src.y+7,src.z))
				spawn(42)
					//flick("create",D7)
					D7.icon_state=""
				var/mob/D8 = new/mob/Floatswordhome(locate(src.x-4,src.y-7,src.z))
				spawn(14)
					//flick("create",D8)
					D8.icon_state=""
				var/mob/D9 = new/mob/Floatswordhome(locate(src.x-5,src.y-6,src.z))
				spawn(12)
					//flick("create",D9)
					D9.icon_state=""
				var/mob/D = new/mob/Floatswordhome(locate(src.x-6,src.y-5,src.z))
				spawn(10)
					//flick("create",D)
					D.icon_state=""
				var/mob/E1 = new/mob/Floatswordhome(locate(src.x-6,src.y+4,src.z))
				spawn(14)
					//flick("create",E1)
					E1.icon_state=""
				var/mob/E2 = new/mob/Floatswordhome(locate(src.x-5,src.y+5,src.z))
				spawn(16)
					//flick("create",E2)
					E2.icon_state=""
				var/mob/E3 = new/mob/Floatswordhome(locate(src.x-4,src.y+6,src.z))
				spawn(18)
					//flick("create",E3)
					E3.icon_state=""
				var/mob/E4 = new/mob/Floatswordhome(locate(src.x+4,src.y-6,src.z))
				spawn(38)
					//flick("create",E4)
					E4.icon_state=""
				var/mob/E5 = new/mob/Floatswordhome(locate(src.x+5,src.y-5,src.z))
				spawn(40)
					//flick("create",E5)
					E5.icon_state=""
				var/mob/E6 = new/mob/Floatswordhome(locate(src.x+6,src.y-4,src.z))
				spawn(42)
					//flick("create",E6)
					E6.icon_state=""
				var/mob/E7 = new/mob/Floatswordhome(locate(src.x-6,src.y+5,src.z))
				spawn(22)
					//flick("create",E7)
					E7.icon_state=""
				var/mob/E8 = new/mob/Floatswordhome(locate(src.x-5,src.y+6,src.z))
				spawn(24)
					//flick("create",E8)
					E8.icon_state=""
				var/mob/E9 = new/mob/Floatswordhome(locate(src.x-4,src.y+7,src.z))
				spawn(26)
					//flick("create",E9)
					E9.icon_state=""
				var/mob/E = new/mob/Floatswordhome(locate(src.x+4,src.y-7,src.z))
				spawn(30)
					//flick("create",E)
					E.icon_state=""
				var/mob/F = new/mob/Floatswordhome(locate(src.x+5,src.y-6,src.z))
				spawn(32)
					//flick("create",F)
					F.icon_state=""
				var/mob/F1 = new/mob/Floatswordhome(locate(src.x+6,src.y-5,src.z))
				spawn(34)
					//flick("create",F1)
					F1.icon_state=""
				var/mob/F2 = new/mob/Floatswordhome(locate(src.x-7,src.y+4,src.z))
				spawn(20)
					//flick("create",F2)
					F2.icon_state=""
				var/mob/F3 = new/mob/Floatswordhome(locate(src.x+7,src.y-4,src.z))
				spawn(36)
					//flick("create",F3)
					F3.icon_state=""
				var/mob/F4 = new/mob/Floatswordhome(locate(src.x-7,src.y-4,src.z))
				spawn(8)
					//flick("create",F4)
					F4.icon_state=""
				var/mob/F5 = new/mob/Floatswordhome(locate(src.x+7,src.y+4,src.z))
				spawn(48)
					//flick("create",F5)
					F5.icon_state=""
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
				for(var/mob/Floatswordhome/m)
					if(m.owner==src)
						walk_towards(m,src,1)
				sleep(95)
				src.firing=0