mob
	proc
		Zanpaktou_Skill()
			if(src.materialized)
				for(var/mob/Ma in view(8,src))
					if(Ma.owner==src)
						if(Ma.ressurectiontype=="Nell")
							Ma.Spear()
						if(Ma.ressurectiontype=="Zommari")
							Ma.Sovereign_Wave()
						if(Ma.ressurectiontype=="Tijereta")
							Ma.Laceration()
						if(Ma.ressurectiontype=="Nnoitra")
							Ma.Outrage()
						if(Ma.ressurectiontype=="Volcanica")
							Ma.Heat_Wave()
						if(Ma.ressurectiontype=="Dragon")
							Ma.Dragon()
						if(Ma.ressurectiontype=="Pantera")
							Ma.Desgarron()
						if(Ma.ressurectiontype=="Halibel")
							Ma.Ola_Azul()
						if(Ma.ressurectiontype=="Luppi")
							Ma.Tentacle_Attack()
						if(Ma.ressurectiontype=="Skeleton")
							Ma.Universal_Aging()
						if(Ma.ressurectiontype=="Ulq")
							Ma.Throw()
						if(Ma.ressurectiontype=="Shooter")
							Ma.Cero_Pack()
						if(Ma.ressurectiontype=="Scientist")
							Ma.Clone_Spit()
						if(Ma.ressurectiontype=="Cirucci")
							Ma.YoYo()
						if(Ma.ressurectiontype=="Pantera")
							Ma.Desgarron()
							Ma.Darts()
						if(Ma.ressurectiontype=="Halibel")
							Ma.Ola_Azul()
						if(Ma.stype=="Aizen")
							Ma.Restep()
						if(Ma.stype=="Byakuya")
							Ma.Petal_Sword()
						if(Ma.stype=="Ichimaru")
							Ma.Poison()
						if(Ma.stype=="Hinamori")
							Ma.Rapid_Burst()
							Ma.Hinamori_Attack()
						if(Ma.stype=="Hisagi")
							Ma.Reap()
						if(Ma.stype=="Ichigo")
							Ma.Getsuga_Tenshou()
						if(Ma.stype=="Ikkaku"||Ma.stype=="Kommamaru")
							src<<"He has no skills"
						if(Ma.stype=="Jiroubou")
							Ma.Shuriken_Toss()
						if(Ma.stype=="Kaiens")
							Ma.Wave()
						if(Ma.stype=="Zaraki")
							Ma.Berserk()
						if(Ma.stype=="Kira")
							Ma.Heavy_Hit()
						if(Ma.stype=="Mayuri")
							Ma.Lethal_Poison()
						if(Ma.stype=="Muramasa")
							Ma.Release_Seal()
						if(Ma.stype=="Rangiku")
							Ma.Explode()
						if(Ma.stype=="Renji")
							Ma.Baboon_Blast()
						if(Ma.stype=="Rukia")
							Ma.Hakuren()
						if(Ma.stype=="Shonshui")
							Ma.Bushogoma()
						if(Ma.stype=="Stinger")
							Ma.Rocket()
						if(Ma.stype=="Tousen")
							Ma.Benihikou()
						if(Ma.stype=="Hitsugaya")
							Ma.Shoot_Dragon()
						if(Ma.stype=="Ukitake")
							Ma.Return_Blast()
						if(Ma.stype=="Unohana")
							Ma.Reversal_Healing()
						if(Ma.stype=="Urahara")
							Ma.Nake()
						if(Ma.stype=="Yammamoto")
							Ma.Shoen()
						if(Ma.stype=="Yumichika")
							Ma.Yumi()