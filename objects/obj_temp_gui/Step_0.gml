/// @description Draw underglow
// You can write your code in this editor

//LD Montello
//TODO:
//Remove this 
//after Ryan implements UI.
#region upgrade testing

if (keyboard_check_pressed(ord("1")))
{
	obj_player.increment_bullets_fired();
}

if (keyboard_check_pressed(ord("2")))
{
	obj_player.increment_bullets_speed();
}

if (keyboard_check_pressed(ord("3")))
{
	obj_player.decrement_shoot_interval();
}

if (keyboard_check_pressed(ord("4")))
{
	obj_player.increment_piercing_count();
}

if (keyboard_check_pressed(ord("5")))
{
	obj_player.increment_burst_count();
}

if (keyboard_check_pressed(ord("6")))
{
	obj_player.increment_movement_speed();
}

if (keyboard_check_pressed(ord("7")))
{
	obj_player.increment_main_players_health();
}

//LD Montello
//JUST FOR DEBUG
//REMOVE AFTER IMPLEMENTING UI
if (keyboard_check_pressed(ord("8")))
{
	obj_spawner.increment_wave_size();
}

#endregion