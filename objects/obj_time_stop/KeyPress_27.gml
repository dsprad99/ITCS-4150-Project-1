/// @description Pause the game


//LD Montello,
//pressing escape opens the pause menu,
//but the function named pause_game()
//freezes the game but is also used
//in the obj_level_up_menu to 
//freeze game play when the upgrade
//selection is open.
//This means if the player is in the
//level up menu we shouldn't call
//pause_game() again.
//Instead, we'll just call our code to
//open/close the pause menu.

//if the user is currently
//in the upgrade UI
if (instance_exists(obj_level_up_menu))
{
	
	//close pause menu
	//if it's open,
	//open pause menu if it's closed.
	if (is_pause_menu_open)
	{
		close_pause_menu()	
	}
	else
	{
		open_pause_menu()
	}
	
	
	
	//we return so the player
	//can't unfreeze time while
	//in the upgrade menu.
	return;
}
else
{
	
	//James Reneo
	//Pauses the game

	pause_game()
	
	//if the game is paused,
	//open the pause menu.
	if (global.game_state == GAME_STATE.PAUSED)
	{
		open_pause_menu()
	}
	else
	{
		close_pause_menu()
	}
}






