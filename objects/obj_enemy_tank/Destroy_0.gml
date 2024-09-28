/// @description Cleanup
// You can write your code in this editor

#region underglow

//Destroy our underglow
layer_sprite_destroy(ug1)

//Increment enemies killed
//count
if (instance_exists(obj_player))
{
	//increment enemies killed.
	global.set_enemies_killed(global.enemies_killed+1);
}

#endregion