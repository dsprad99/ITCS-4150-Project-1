/// @description Insert description here
// You can write your code in this editor


//LD Montello
//if the game is currently frozen because
//the player is in the level_up_menu
//don't unfreeze the game.
//Otherwise, let's unfreeze the game.
if (!instance_exists(obj_level_up_menu))
{
	obj_time_stop.pause_game();
}


//close the pause menu.
obj_time_stop.close_pause_menu();