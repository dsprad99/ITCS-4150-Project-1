/// @description Create function for enemies
// You can write your code in this editor

//LD Montello
//Our sprite needs to be
//a scale of 5x5 so that
//it is the same size as the other
//32x32 sprites.
//Currently it's 3x3 because
//they wanted the size to be changed.
//I need to make a 16x16 px sprite
//to replace this if I have time.
image_xscale = 3;
image_yscale = 3;

//LD Montello
//Scale enemy damage with wave
//For now, we won't scale enemy damage with wave.
damage = start_damage * floor(power(2, global.cur_wave / 5))


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
//the angle of the enemies gun.
gun_angle = direction;

//LD Montello
//how much xp this enemy
//gives when it dies.
//set xp value based on wave.
//Scaling is too complex for our time restraint,
//so it is not included.
xp = start_xp //* floor(power(2, global.cur_wave / 10))


//LD Montello
//Health Scaling
//Use a similar formula to player's
//health scaling but increase health
//exponentially as the waves increase.
//Scaling is too complex for our time restraint,
//so it is not included.
_health = start_health //* floor(power(2, global.cur_wave / 2))


//LD Montello
//Only modify health
//using this method.
decrement_health = function(damage)
{
	_health -= damage;
	
	
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
	if (_health > 0)
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
	
	if (_health <= 0)
	{
		_health = 0;
		kill();
	}
	
}


//LD Montello
//Speed enemies move.
start_speed = 3;
end_speed = 5;
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
layer_sprite_xscale(ug1, image_xscale);
layer_sprite_yscale(ug1, image_yscale);

#endregion

//Create an array
//to store bullets that have already
//hit this enemy.
//We need this so we don't double
//count when colliding with bullets.
ignored_bullets = array_create(20)