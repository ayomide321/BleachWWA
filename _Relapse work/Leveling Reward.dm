


proc
	AnnounceBountyWinners()
		var/sleepTime = 10 SECONDS
		var/winners[] = list()
		spawn()
			while(TRUE)
				sleep(sleepTime)
				for(var/winning_amount in 1 to 4)
					for(var/mob/player/m in All_Clients())
						if(m in winners)
							continue
						if(winners.len < winning_amount)
							winners.Add(m)
						else
							var/mob/player/leading = winners[winning_amount]
							if(leading.level < m.level)
								winners[winning_amount] = m

				if(winners.len)
					for(var/index in 1 to winners.len)
						var/mob/player/m = winners[index]
						var/experience = (index) ? 600000 : (index == 2) ? 500000 : (index == 3) ? 300000 : 100000
						var/money = (index) ? 5000 : (index == 2) ? 3000 : (index == 3) ? 2000 : 500
						world<<"<font color =#FFA500>[m] earned [(index) ? "first place" : (index == 2) ? "second place" : (index == 3) ? "third place" : "fourth place"] in the Bounty Contest!"
						m<<"<font color =#FFA500>You gained [experience] Experience! \nYou gained [money] Dollars!"
						m.exp += experience
						m.money += money
				winners = new()