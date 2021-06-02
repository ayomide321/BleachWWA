mob/var/tmp
	tentaclefieldcd=0
	tentaclewheelcd=0
mob
	proc
		Tentacle_Wheel()
			if(src.safe||src.fireback)return
			if(src.rei <= 2000)
				src << "<b>Your rei is too low [src.rei]/3000!"
				return
			if(!src.tentaclewheelcd)
				src.tentaclewheelcd=1
				src.rei-=2000
				if(src.dir == NORTH||src.dir == SOUTH||src.dir == NORTHEAST||src.dir == NORTHWEST||src.dir == SOUTHEAST||src.dir == SOUTHWEST)
					var/obj/tentacle/A = new /obj/tentacle/
					var/obj/tentacle/B = new /obj/tentacle/
					var/obj/tentacle/C = new /obj/tentacle/
					A.loc = locate(src.x, src.y, src.z)
					C.loc = locate(src.x+1, src.y, src.z)
					B.loc = locate(src.x-1, src.y, src.z)
					A.dir = src.dir
					B.dir = src.dir
					C.dir = src.dir
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,src.dir)
					walk(C,src.dir)
					walk(B,src.dir)
					sleep(2)
					var/obj/tentacle/Ar = new /obj/tentacle/
					var/obj/tentacle/Ba = new /obj/tentacle/
					var/obj/tentacle/Ca = new /obj/tentacle/
					Ar.loc = locate(src.x, src.y, src.z)
					Ca.loc = locate(src.x+1, src.y, src.z)
					Ba.loc = locate(src.x-1, src.y, src.z)
					Ar.dir = src.dir
					Ba.dir = src.dir
					Ca.dir = src.dir
					Ar.Gowner = src
					Ba.Gowner = src
					Ca.Gowner = src
					walk(Ar,src.dir)
					walk(Ca,src.dir)
					walk(Ba,src.dir)
					sleep(2)
					var/obj/tentacle/Aa = new /obj/tentacle/
					var/obj/tentacle/Bs = new /obj/tentacle/
					var/obj/tentacle/Cs = new /obj/tentacle/
					Aa.loc = locate(src.x, src.y, src.z)
					Cs.loc = locate(src.x+1, src.y, src.z)
					Bs.loc = locate(src.x-1, src.y, src.z)
					Aa.dir = src.dir
					Bs.dir = src.dir
					Cs.dir = src.dir
					Aa.Gowner = src
					Bs.Gowner = src
					Cs.Gowner = src
					walk(Aa,src.dir)
					walk(Cs,src.dir)
					walk(Bs,src.dir)
					sleep(2)
					var/obj/tentacle/As = new /obj/tentacle/
					var/obj/tentacle/Bd = new /obj/tentacle/
					var/obj/tentacle/Cd = new /obj/tentacle/
					As.loc = locate(src.x, src.y, src.z)
					Cd.loc = locate(src.x+1, src.y, src.z)
					Bd.loc = locate(src.x-1, src.y, src.z)
					As.dir = src.dir
					Bd.dir = src.dir
					Cd.dir = src.dir
					As.Gowner = src
					Bd.Gowner = src
					Cd.Gowner = src
					walk(As,src.dir)
					walk(Cd,src.dir)
					walk(Bd,src.dir)
					sleep(2)
					var/obj/tentacle/Ad = new /obj/tentacle/
					var/obj/tentacle/Bf = new /obj/tentacle/
					var/obj/tentacle/Cf = new /obj/tentacle/
					Ad.loc = locate(src.x, src.y, src.z)
					Cf.loc = locate(src.x+1, src.y, src.z)
					Bf.loc = locate(src.x-1, src.y, src.z)
					Ad.dir = src.dir
					Bf.dir = src.dir
					Cf.dir = src.dir
					Ad.Gowner = src
					Bf.Gowner = src
					Cf.Gowner = src
					walk(Ad,src.dir)
					walk(Cf,src.dir)
					walk(Bf,src.dir)
					sleep(2)
					var/obj/tentacle/Ae = new /obj/tentacle/
					var/obj/tentacle/Bg = new /obj/tentacle/
					var/obj/tentacle/Cg = new /obj/tentacle/
					Ae.loc = locate(src.x, src.y, src.z)
					Cg.loc = locate(src.x+1, src.y, src.z)
					Bg.loc = locate(src.x-1, src.y, src.z)
					Ae.dir = src.dir
					Bg.dir = src.dir
					Cg.dir = src.dir
					Ae.Gowner = src
					Bg.Gowner = src
					Cg.Gowner = src
					walk(Ae,src.dir)
					walk(Cg,src.dir)
					walk(Bg,src.dir)
					sleep(350)
					src.tentaclewheelcd=0
					return
				if(src.dir == WEST||src.dir == EAST)
					var/obj/tentacle/A = new /obj/tentacle/
					var/obj/tentacle/B = new /obj/tentacle/
					var/obj/tentacle/C = new /obj/tentacle/
					A.loc = locate(src.x, src.y, src.z)
					C.loc = locate(src.x, src.y+1, src.z)
					B.loc = locate(src.x, src.y-1, src.z)
					A.dir = src.dir
					B.dir = src.dir
					C.dir = src.dir
					A.Gowner = src
					B.Gowner = src
					C.Gowner = src
					walk(A,src.dir)
					walk(C,src.dir)
					walk(B,src.dir)
					sleep(2)
					var/obj/tentacle/Ar = new /obj/tentacle/
					var/obj/tentacle/Ba = new /obj/tentacle/
					var/obj/tentacle/Ca = new /obj/tentacle/
					Ar.loc = locate(src.x, src.y, src.z)
					Ca.loc = locate(src.x, src.y+1, src.z)
					Ba.loc = locate(src.x, src.y-1, src.z)
					Ar.dir = src.dir
					Ba.dir = src.dir
					Ca.dir = src.dir
					Ar.Gowner = src
					Ba.Gowner = src
					Ca.Gowner = src
					walk(Ar,src.dir)
					walk(Ca,src.dir)
					walk(Ba,src.dir)
					sleep(2)
					var/obj/tentacle/Aa = new /obj/tentacle/
					var/obj/tentacle/Bs = new /obj/tentacle/
					var/obj/tentacle/Cs = new /obj/tentacle/
					Aa.loc = locate(src.x, src.y, src.z)
					Cs.loc = locate(src.x, src.y+1, src.z)
					Bs.loc = locate(src.x, src.y-1, src.z)
					Aa.dir = src.dir
					Bs.dir = src.dir
					Cs.dir = src.dir
					Aa.Gowner = src
					Bs.Gowner = src
					Cs.Gowner = src
					walk(Aa,src.dir)
					walk(Cs,src.dir)
					walk(Bs,src.dir)
					sleep(2)
					var/obj/tentacle/As = new /obj/tentacle/
					var/obj/tentacle/Bd = new /obj/tentacle/
					var/obj/tentacle/Cd = new /obj/tentacle/
					As.loc = locate(src.x, src.y, src.z)
					Cd.loc = locate(src.x, src.y+1, src.z)
					Bd.loc = locate(src.x, src.y-1, src.z)
					As.dir = src.dir
					Bd.dir = src.dir
					Cd.dir = src.dir
					As.Gowner = src
					Bd.Gowner = src
					Cd.Gowner = src
					walk(As,src.dir)
					walk(Cd,src.dir)
					walk(Bd,src.dir)
					sleep(2)
					var/obj/tentacle/Ad = new /obj/tentacle/
					var/obj/tentacle/Bf = new /obj/tentacle/
					var/obj/tentacle/Cf = new /obj/tentacle/
					Ad.loc = locate(src.x, src.y, src.z)
					Cf.loc = locate(src.x, src.y+1, src.z)
					Bf.loc = locate(src.x, src.y-1, src.z)
					Ad.dir = src.dir
					Bf.dir = src.dir
					Cf.dir = src.dir
					Ad.Gowner = src
					Bf.Gowner = src
					Cf.Gowner = src
					walk(Ad,src.dir)
					walk(Cf,src.dir)
					walk(Bf,src.dir)
					sleep(2)
					var/obj/tentacle/Ae = new /obj/tentacle/
					var/obj/tentacle/Bg = new /obj/tentacle/
					var/obj/tentacle/Cg = new /obj/tentacle/
					Ae.loc = locate(src.x, src.y, src.z)
					Cg.loc = locate(src.x, src.y+1, src.z)
					Bg.loc = locate(src.x, src.y-1, src.z)
					Ae.dir = src.dir
					Bg.dir = src.dir
					Cg.dir = src.dir
					Ae.Gowner = src
					Bg.Gowner = src
					Cg.Gowner = src
					walk(Ae,src.dir)
					walk(Cg,src.dir)
					walk(Bg,src.dir)
					sleep(200)
					src.tentaclewheelcd=0
					return