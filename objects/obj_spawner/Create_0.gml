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
//Where I learned how to do this:
//https://www.reddit.com/r/gamemaker/comments/ppts1l/make_enemies_spawn_randomly_around_edges/
spawn_wave_on_edge = function(wave_size)
{
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

//Alarm 0 is our wave alarm.
alarm_set(0, time_between_waves);