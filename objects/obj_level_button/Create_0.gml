/// @description Insert description here
// You can write your code in this editor

//James Reneo
//Button handling
var upgrade_options = [
    "Upgrade bullets fired per burst: " + string(obj_player.player_bullets_fired),
    "Upgrade individual bullet speed: " + string(obj_player.bullet_speed),
    "Upgrade fire interval: " + string(obj_player.shoot_interval),
    "Upgrade piercing: " + string(obj_player.piercing_count),
    "Upgrade burst count: " + string(obj_player.bursts_per_interval),
    "Upgrade movement: " + string(obj_player.speed),
    "Upgrade health: " + string(obj_player.mainPlayerHealth),
    "Increase wave size: " + string(obj_spawner.cur_wave_size)
];

// Get the number of available upgrades
var num_upgrades = array_length(upgrade_options);

// Pick a random index from the list
upgrade_ind = irandom_range(1,num_upgrades-1);
// Select the random upgrade
selected_upgrade = upgrade_options[upgrade_ind];

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
		default: 
			show_debug_message("Not valid upgrade");
    }
}
