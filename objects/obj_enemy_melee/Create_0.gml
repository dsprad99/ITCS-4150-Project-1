/// @description Create function for enemies
// You can write your code in this editor


//LD Montello
//the fps of the tread animation.
tread_anim_fps = 10;

//LD Montello
//The speed the tank treads will move at in FPS
tread_anim_speed = tread_anim_fps / 60;

//LD Montello
//The current index of the tank tread animatino
tread_anim_index = 0;


//LD Montello
//Is the enemy moving?
is_moving = function()
{
	//if the previous x and y 
	//are the same as the current x and y
	//then we are not moving.
	if (xprevious != x or yprevious != y)
	{
		return true;
	}
	else
	{
		return false;
	}
}


//LD Montello
//How close the enemy
//must be to the player
//to start firing at them.
enemy_fire_range = 600;

//LD Montello
//the distance to stop
//moving towards the player
target_stop_distance = 100;

//LD Montello
//the angle of the enemies gun.
gun_angle = direction;

//LD Montello
//how much xp this enemy
//gives when it dies.
//set xp value based on wave.
xp = 5

//LD Montello
//Health Scaling
//lerp from our start to our end
//using our cur_wave / global.waves
//to get a 0-1 value for progress in the lerp.
health = floor(lerp(start_health, end_health, global.cur_wave / global.waves_to_win))


//LD Montello
//Only modify health
//using this method.
decrement_health = function(damage)
{
	health -= damage;
	
	
	//LD Montello
	//Create particle effect for taking damage
	var flare = instance_create_layer(x, y, "FX", obj_melee_flare, {parent : id})
	flare.image_xscale = 5;
	flare.image_yscale = 5;
	
	//LD Montello
	//Play hit SFX
	//when hit, 
	//play death SFX
	//when Dying.
	if (health > 0)
	{
		//LD Montello
		//Play SFX for getting hit.		
		audio_play_sound_on(global.sfx_emitter, snd_hit, false, 1)
	}
	else
	{
		//LD Montello
		//Play SFX for dying.		
		audio_play_sound_on(global.sfx_emitter, snd_explosion_hit2, false, 1)
	}
	
	if (health <= 0)
	{
		health = 0;
		kill();
	}
	
}


//LD Montello
//Speed enemies move.
start_speed = 3;
end_speed = 5
//lerp from our start to our end
//using our cur_wave / global.waves
//to get a 0-1 value for progress in the lerp.
pathing_speed = lerp(start_speed, end_speed, global.cur_wave / global.waves_to_win)


//LD Copied Davis's stuff.
//Davis Spradling
//Initalize timer for shooting
attack_timer = 0; 


//LD Copied Davis's stuff.
//Davis Spradling
//Initialize how fast bullet will travel
bullet_speed = 7;

//LD Copied Davis's stuff.
//Davis Spradling
//Initalize number of bullets fired
bullets_fired = 1


kill = function()
{
		//LD Montello
		//Create particle effect to show
		//we were killed. 
		if (instance_exists(obj_particle_sys_controller))
			obj_particle_sys_controller.play_particle_system(ps_melee_death, x, y);
		
		//LD Montello
		//find the player instance
		//and give them our xp value
		obj_player.add_xp(xp);
		
		//Destroy ourselves
		instance_destroy()
}


#region underglow

//LD Montello
//https://manual.gamemaker.io/beta/en/GameMaker_Language/GML_Reference/Asset_Management/Rooms/Background_Layers/layer_background_xscale.htm#:~:text=This%20function%20can%20be%20used,then%20set%20the%20scale%20value.
//This changes 
//the size of the grid background
//to the size I want.
grid_id = layer_get_id("Grid");
grid_background_id = layer_background_get_id(grid_id);
layer_background_xscale(grid_background_id, 2.5);
layer_background_yscale(grid_background_id, 2.5);

//LD Montello
//The underglow effect
//that we place between
//the background and the grid
//to make it look like the lines are glowing
//because of the object's color.
ug1 = layer_sprite_create(grid_id, x, y, spr_lime_underglow);
layer_sprite_xscale(ug1, 5);
layer_sprite_yscale(ug1, 5);

#endregion