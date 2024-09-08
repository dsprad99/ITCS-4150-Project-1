/// @description Insert description here
// You can write your code in this editor

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
	
}

path =  path_add();

bullet_avoidance_range = 100;

is_avoiding = false;

pathing_speed = 3;

kill = function()
{
	
}