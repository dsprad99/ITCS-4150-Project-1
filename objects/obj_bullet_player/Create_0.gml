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
ug1 = layer_sprite_create(grid_id, x, y, spr_cyan_underglow);
layer_sprite_xscale(ug1, 2.5);
layer_sprite_yscale(ug1, 2.5);

#endregion