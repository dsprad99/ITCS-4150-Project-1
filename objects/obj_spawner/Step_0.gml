/// @description Insert description here
// You can write your code in this editor


//LD Montello
//this produces waves that
//are more manageable for the player
//than spawning all enemies in a wave at once.
//Essentially it staggers the enemies spawned at once.
//So, if the enemies left to spawn is 20
//we'll spawn enemies until there isn't enough room
//to spawn them without overlapping. We then stop spawning.
//then, in the next step event we repeat until we have no
//more enemies to spawn.
if (enemies_left_to_spawn > 0)
{
	
	//Where I learned how to do the basic
	//spawn enemies outside room code:
	//https://www.reddit.com/r/gamemaker/comments/ppts1l/make_enemies_spawn_randomly_around_edges/

	var cam = view_get_camera(0);
	
	var centerx, centery, random_dir, radius;
	
	//centerx = room_width / 2;
	//centery = room_height / 2;
	
	//Use the camera width and height
	cam_half_width = camera_get_view_width(cam) / 2;
	cam_half_height = camera_get_view_height(cam) / 2;
	
	//Use the camera center position
	//to calculate where to spawn enemies.
    centerx = camera_get_view_x(cam) + cam_half_width;
	centery = camera_get_view_y(cam) + cam_half_height;
	
	
	
	//spawn enemies until there isn't 
	//any more room.
	repeat (enemies_left_to_spawn)
	{
		//choose random direction
		random_dir = irandom(360);
		
		//calculate spawn radius
		radius = ((cam_half_width ^ 2) + (cam_half_height ^ 2)) ^ (1/2);
		
		//Calculate random offset for spawn radius
		//32 pixels is the width and height of
		//an enemy, so we'll multiply the max number
		//of rows of enemies we can have by 32 to get
		//a nice spread
		radius += random_range(0, 20 * 32);
		
		spawn_x = centerx + lengthdir_x(radius, random_dir)
		spawn_y = centery + lengthdir_y(radius, random_dir)
		
		//LD Montello
		//check a rectangle the size of the enemy tank
		//extending out from the spawn position
		//we just selected to see if there is already
		//a tank there.
		//if we end up not being able to spawn an enemy,
		//lets stop trying to spawn for now.
		//We'll start spawning enemies again during the next step.
		//that way they're staggered no matter how many enemies
		//we need to spawn.
		var inst = collision_rectangle(spawn_x - (32 * 5 / 2), spawn_y - (32 * 5 / 2), spawn_x + (32 * 5 / 2), spawn_y + (32 * 5 / 2), obj_enemy_tank, false, true)
		if (inst != noone/*position_meeting(spawn_x, spawn_y, obj_enemy_tank)*/)
		{
			break;
		}
		
		//if the wave count is greater than or at 15
		//we have a chance to spawn 
		//a tank instead of a melee enemy.
		//basically, 1 in 10 chance to spawn a tank.
		if (global.cur_wave >= 15 and floor(random_range(0, 10)) == 0)
		{
			//spawn in the tank instance.
			instance_create_layer(spawn_x, spawn_y, "Instances", obj_enemy_tank);
		}
		//only spawn melee enemies
		else
		{
			//spawn in the melee instance.
			instance_create_layer(spawn_x, spawn_y, "Instances", obj_enemy_melee);
		}
		
		
		//LD Montello
		//Decrement the number of enemies we still need to spawn
		enemies_left_to_spawn--;
	}
}