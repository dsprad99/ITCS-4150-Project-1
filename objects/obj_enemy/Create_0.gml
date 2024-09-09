/// @description Insert description here
// You can write your code in this editor

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
xp = 5;

//LD Montello
//Init vars
health = 1;

//LD Montello
//Only modify health
//using this method.
decrement_health = function(damage)
{
	health -= damage;
	if (health <= 0)
	{
		health = 0;
		kill();
	}
	
}


//LD Montello
//Speed enemies move.
pathing_speed = 3;


//LD Copied Davis's stuff.
//Davis Spradling
//Initalize timer for shooting
shoot_timer = 0; 
shoot_interval = 240;

//LD Copied Davis's stuff.
//Davis Spradling
//Initialize how fast bullet will travel
bullet_speed = 10;

//LD Copied Davis's stuff.
//Davis Spradling
//Initalize number of bullets fired
bullets_fired = 1


kill = function()
{
		//Create particle effect to show
		//we were killed. 
		//TODO:
		//Replace this in the future LD
		effect_create_above(ef_explosion, x, y, 1, c_red);
		
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
ug1 = layer_sprite_create(grid_id, x, y, spr_magenta_underglow);
layer_sprite_xscale(ug1, 5);
layer_sprite_yscale(ug1, 5);

#endregion