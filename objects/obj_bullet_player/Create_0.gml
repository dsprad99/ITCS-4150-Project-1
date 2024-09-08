/// @description Insert description here
// You can write your code in this editor

//LD Montello
//init damage inflicted by bullet
damage = 1;

//LD Montello
//The amount of health this bullet has.
//decremented by 1 when it hits something.
bullet_health = obj_player.piercing_count;


//LD Montello
//decrement bullet health,
//called whenever a bullet hits something.
//if it runs out of health it is destroyed.
decrement_bullet_health = function()
{
	bullet_health--;
	if (bullet_health <= 0)
	{
		instance_destroy();
	}
}