/// @description Insert description here
// You can write your code in this editor

//LD Montello
//You cannot select in upgrade
//if you are currently in the pause menu.
if (obj_time_stop.is_pause_menu_open)
{
	return;
}

//James Reneo
//logic for applying the upgrade
show_debug_message("CLICKED");

show_debug_message(upgrade_ind);

apply_upgrade(upgrade_ind);

obj_time_stop.pause_game()

instance_destroy(obj_level_up_menu);

with (obj_level_button) {
    instance_destroy();
}