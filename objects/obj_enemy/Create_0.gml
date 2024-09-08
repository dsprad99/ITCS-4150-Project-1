/// @description Insert description here
// You can write your code in this editor


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