/// @description Insert description here
// You can write your code in this editor

//LD Montello
//I need the bullet image size to be
//this large so it's visible on screen.
image_xscale = 5;
image_yscale = 5;

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