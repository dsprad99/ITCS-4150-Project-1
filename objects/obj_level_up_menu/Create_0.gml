/// @description Insert description here
// You can write your code in this editor

//James Reneo
//Creating the menu
var button_size = 200; // Size of the square buttons
var button_gap = 100;  // Space between buttons
var num_buttons = 3;

var spr_height = sprite_get_width(spr_level_up_bg);
var spr_width = sprite_get_height(spr_level_up_bg);


var total_buttons_width = button_size * num_buttons + button_gap * (num_buttons - 1);


for (var j = 0; j < num_buttons; j++) {
	var button_x = 80 +  x - total_buttons_width / 2 + (button_size + button_gap) * j;
	var button_y = y + 80;
    // Create button instance
	//LD Montello
	//set button category to be the index
	//of j in this loop by passing a struct
	//containing j.
	//I learned how to do this here: https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Asset_Management/Instances/instance_create_layer.htm
    var button = instance_create_layer(button_x, button_y , "UpgradeUI", obj_level_button, {upgrade_category : j});
	//make sure the button is drawn above
	//this object.
	button.depth = depth - 1;
 
	show_debug_message("ARE U KIDDING")
    // Set button properties
	
}

