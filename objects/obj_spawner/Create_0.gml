/// @description Insert description here
// You can write your code in this editor

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
//The maximum percentage of the wave
//that we allow to spawn in one burst.
//before we break and use our 
//spawn_burst_cooldown to wait
//and spawn enemies again. 
//it'll make the enemies spawn more staggered
//like we wanted, instead of one huge burst.
//0.1 = 10%
spawn_percent_before_cooldown = 0.1;

//count of enemies to spawn before cooldown,
//set at the start of every wave and calculated
//using the spawn_percent_before_cooldown
//and the size of the wave.
spawn_count_before_cooldown = 0;

//LD Montello
//the number of enemies spawned
//since the last cooldown, resets
//to zero every cooldown.
enemies_spawned_since_cooldown = 0;

//LD Montello
//Cooldown before we spawn
//another burst of enemies for
//this wave.
spawn_burst_cooldown = 50;

//LD Montello
//the current time since the last
//burst, used to track if we've 
//finished our cooldown.
time_since_burst = 0;


//LD Montello
//stores the number of enemies we have left to spawn
//to complete spawning all enemies for this wave.
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
		
		global.kills = _enemies;
		
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
	
		//Play SFX for getting to next wave
		audio_play_sound_on(global.sfx_emitter, snd_nextWave, false, 1)
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
	show_debug_message(global.cur_wave);
	
	//TODO:
	//Go to win screen.
	
	//Davis Spradling
	//Go to the win room
	room_goto(rm_win)
}

//LD Montello
//Adds a wave to our spawn queue.
//We aren't using a queue datastructure 
//I'm just referring to the enemies_left_to_spawn
//as that.
spawn_wave_on_edge = function(wave_size)
{
	global.cur_wave++;

	//LD Montello
	//when we reach
	//this wave we have won.
	if (global.cur_wave > global.waves_to_win)
	{
		win_condition_reached();
	}

	
	//add enemies to our queue of enemies
	//to spawn.
	enemies_left_to_spawn += cur_wave_size;
	
	//Calculate the current number of enemies
	//per spawn burst before cooling down
	spawn_count_before_cooldown = spawn_percent_before_cooldown * cur_wave_size;
}


//Start the loop on create.
spawn_wave_on_edge(cur_wave_size)