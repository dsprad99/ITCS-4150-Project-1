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
	obj_player.set_health(obj_player.max_health);
}

//LD Montello
//JUST FOR DEBUG
//REMOVE AFTER IMPLEMENTING UI
if (keyboard_check_pressed(ord("8")))
{
	obj_spawner.increment_wave_size();
}

#endregion



// Clicking level up buttons:
if (show_gui) {
   
}

// Function to apply the upgrade based on index
apply_upgrade = function(upgrade_index) {
    switch (upgrade_index) {
        case 0: // Upgrade bullets fired per burst
            obj_player.increment_bullets_fired();
            break;
        case 1: // Upgrade bullet speed
            obj_player.increment_bullets_speed();
            break;
        case 2: // Upgrade fire interval
            obj_player.decrement_shoot_interval();
            break;
        case 3: // Upgrade piercing
            obj_player.increment_piercing_count();
            break;
        case 4: // Upgrade burst count
            obj_player.increment_burst_count();
            break;
        case 5: // Upgrade movement
            obj_player.increment_movement_speed();
            break;
        case 6: // Upgrade health
            obj_player.increment_main_players_health();
            break;
        case 7: // Increase wave size
            obj_spawner.increment_wave_size();
            break;
    }
}