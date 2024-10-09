/// @description Insert description here
// You can write your code in this editor


//LD Montello
//The size we want this to be in pixels
//is 250, the art is 300 pixels,
//so we'll make the scale of the image
//250 / 300
//image_xscale = 275 / 300;
//image_yscale = 275 / 300;

//LD Montello
//the category of this button,
//this determines which of the upgrades
//can appear for this button.
//This is set byt the obj_level_up_menu
//when each button is created.
//upgrade_category
//This is declared in the variable definitions
//as it needs to be referenced in the instance_create_layer
//function.
//I learned how to do this here: https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Asset_Management/Instances/instance_create_layer.htm


//James Reneo
//Button handling
//LD Montello,
//I seperated the upgrades
//into 2 categories,
//Weapon and Other,
//there will always be 2 weapon
//upgrades and 1 "other" upgrade.
var weapon_upgrades = [
    "Upgrade bullets fired per burst: " + string(obj_player.player_bullets_fired),
    "Upgrade individual bullet speed: " + string(obj_player.bullet_speed),
    "Upgrade fire interval: " + string(obj_player.shoot_interval),
    "Upgrade piercing: " + string(obj_player.piercing_count),
    "Upgrade burst count: " + string(obj_player.bursts_per_interval),
];

var other_upgrades = [
	"Upgrade movement: " + string(obj_player.speed),
    "Refill health: " + string(obj_player.mainPlayerHealth),
    "Increase wave size: " + string(obj_spawner.cur_wave_size),
	"Upgrade Regen cooldown: " + string(obj_player.time_between_regens)
];



// Get the number of available upgrades
var num_upgrades = -1;
//LD Montello,
//the number of upgrades changes on category.
//Weapon upgrade
if (upgrade_category == 0 or upgrade_category == 1)
{
	num_upgrades = array_length(weapon_upgrades)
	// Pick a random index from the list
	upgrade_ind = irandom_range(0,num_upgrades-1);

	//LD Montello
	//This code is here to avoid duplicate
	//upgrades
	//for every upgrade button
	with (obj_level_button)
	{
		//LD Montello.
		//while this button
		//is a duplicate of another button
		//select a different upgrade type.
		//only do this for the weapon category.
		while (self != other and other.upgrade_ind == upgrade_ind)
		{
			other.upgrade_ind = irandom_range(0,num_upgrades-1);
		}
	}

	// Select the random upgrade from the weapon upgrades.
	selected_upgrade = weapon_upgrades[upgrade_ind];

}
//"Other" category.
else if (upgrade_category == 2)
{
	num_upgrades = array_length(other_upgrades)
	// Pick a random index from the list
	upgrade_ind = irandom_range(0,num_upgrades-1);
	// Select the random upgrade from the "other" upgrades
	selected_upgrade = other_upgrades[upgrade_ind];
}
//LD Montello
//if the -1 is not changed for num_upgrades
//it will cause an error when we level up.
//this is intended so we know if the above
//if statement is not evaluated.



apply_upgrade = function(upgrade_index) {
	//if weapon category
    if (upgrade_category == 0 or upgrade_category == 1)
	{
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
		default: 
			show_debug_message("Not valid upgrade");
		}
	}
	//if "other" category.
	else if (upgrade_category == 2)
	{
		switch (upgrade_index) {
        case 0: // Upgrade movement
            obj_player.increment_movement_speed();
            break;
        case 1: // Refill health
            obj_player.set_health(obj_player.max_health);
            break;
        case 2: // Increase wave size
            obj_spawner.increment_wave_size();
            break;
		case 3: // Decrease the cooldown of regen health.
			obj_player.set_time_between_regens(obj_player.time_between_regens - 0.1);
		default: 
			show_debug_message("Not valid upgrade");
		}
	}
	
	
}
