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

calc_should_spawn_wave = function(_enemies)
{
	//TODO
	//Change this to be an increasing
	//formula later. Like each wave 
	//kill X out of the total spawned
	//by the previous wave.
	if (_enemies > kills_to_spawn_next_wave)
	{
		//Spawn a wave
		spawn_wave_on_edge(cur_wave_size);
		//Increase the enemies spawned
		//per wave exponentially.
		//raise the required kills
		//to move to the next wave
		//to be some percent
		//of the total wave size.
		cur_wave_size = power(curWave, 2);
		kills_to_spawn_next_wave = floor(cur_wave_size * 0.5);
	}
}

//LD Montello
//Increase wave size
increment_wave_size = function()
{
	cur_wave_size += 5;
}

//Called when you reach 
win_condition_reached = function()
{
	//TODO:
	//Go to win screen.
	
	//Davis Spradling
	//Go to the win room
	room_goto(win)
}

//LD Montello
//Where I learned how to do this:
//https://www.reddit.com/r/gamemaker/comments/ppts1l/make_enemies_spawn_randomly_around_edges/
spawn_wave_on_edge = function(wave_size)
{
	curWave++;
	
	//LD Montello
	//when we reach
	//this wave we have won.
	if (curWave >= waves_to_win)
	{
		win_condition_reached();
	}
	
	var centerx, centery, random_dir, radius;
	
	centerx = room_width / 2;
	centery = room_height / 2;
	
	
	//spawn enemies of count wave_size.
	for (i = 0; i < wave_size; i++)
	{
		//choose random direction
		random_dir = irandom(360);
		
		//calculate spawn radius
		radius = ((centerx ^ 2) + (centery ^ 2)) ^ (1/2);
	
		//spawn in the instance.
		//TODO:
		//in the future we may want to 
		//use a list so we know if the player
		//killed every wave.
		instance_create_layer(centerx + lengthdir_x(radius, random_dir), centery + lengthdir_y(radius, random_dir), "Instances", obj_enemy);		
	}
	
	
}