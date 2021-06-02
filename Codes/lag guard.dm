//Created by Vakir on October 7, 2003

//Please give me proper credit when using this library in your game!
//Thanks!

var/tmp/def = 50 //Default CPU Usage, this is when the CPU reaches a certain maxpowerlevel, and goes into affect.
var/tmp/lagset = 0 //Custom Variable, if it is 0, default will be in affect, if 1 you will need to set the clag variable.
var/tmp/clag = 0 //Custom CPU Usage, this is when you select during you game play at what maxpowerlevel you want to put the Lag Guard into affect.
var/tmp/tick_mem = world.tick_lag //Your default tick lag

world
	proc
		Lag_Guard()
			spawn while(1)
				if(lagset == 0)
					if(world.cpu >= def)
						world.tick_lag += 1
						world.tick_lag = round(world.tick_lag)
					if(world.cpu < def)
						if(world.tick_lag == tick_mem)
							..()
						else
							world.tick_lag -= 1
							world.tick_lag = round(world.tick_lag)
				else
					if(world.cpu >= clag)
						world.tick_lag += 1
						world.tick_lag = round(world.tick_lag)
					if(world.cpu < clag)
						if(world.tick_lag == tick_mem)
							..()
						else
							world.tick_lag -= 1
							world.tick_lag = round(world.tick_lag)
				sleep(30) //Checks every 3 seconds



//For using this in your game simply add this code

world
	New()
		..()
		Lag_Guard()

//Simply add that to your game and the code should have been activated


//This library is supported by me!
//Contact me at ruben0688@hotmail.com if you have any problems!

//-----zag -- this is fucking shit dunno why this is even fucking here.
