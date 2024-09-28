/// @description Insert description here
// You can write your code in this editor

//Current wave the player 
//has reached. 
curWave = 0;

//LD Montello
//the time between spawning waves.
//when modified will 
//reset the next time the alarm 0
//ends.
time_between_waves = 240;

//LD Montello
//the number of enemies
//we are currently spawning
//each wave.
cur_wave_size = 5;

//LD Montello
kills_to_spawn_next_wave = 5;

//LD Montello
//number of waves required to win.
waves_to_win = 50;

enemies_left_to_spawn = 0;

calc_should_spawn_wave = function(_enemies)
{
	//TODO
	//Change this to be an increasing
	//formula later. Like each wave 
	//kill X out of the total spawned
	//by the previous wave.
	if (_enemies >= kills_to_spawn_next_wave)
	{
		
		
		
		//LD Montello
		//Increase the enemies spawned
		//per wave here.
		//raise the required kills
		//to move to the next wave
		//to be some percent
		//of the total wave size.
		cur_wave_size += 5;
		//set the requirement to spawn the next wave here.
		kills_to_spawn_next_wave = kills_to_spawn_next_wave + cur_wave_size//floor(cur_wave_size * 0.9);
		
		//Spawn a wave
		spawn_wave_on_edge(cur_wave_size);
	
	}
}

//LD Montello
//Increase wave size
increment_wave_size = function()
{
	cur_wave_size += 5;
}

//LD Montello
//Called automatically when you reach the win condition.
win_condition_reached = function()
{
	//Print out what our wave is
	show_debug_message(curWave);
	
	//TODO:
	//Go to win screen.
	
	//Davis Spradling
	//Go to the win room
	room_goto(win)
}

//LD Montello
//Adds a wave to our spawn queue.
//We aren't using a queue datastructure 
//I'm just referring to the enemies_left_to_spawn
//as that.
spawn_wave_on_edge = function(wave_size)
{
	curWave++;
	
	//add enemies to our queue of enemies
	//to spawn.
	enemies_left_to_spawn += cur_wave_size;
	
	//LD Montello
	//when we reach
	//this wave we have won.
	if (curWave >= waves_to_win)
	{
		win_condition_reached();
	}
}


//Start the loop on create.
spawn_wave_on_edge(cur_wave_size)