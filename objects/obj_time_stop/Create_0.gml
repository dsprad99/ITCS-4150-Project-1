/// @description Insert description here
// You can write your code in this editor

//James Reneo
//Code for pausing the game

pause_game = function(){
	if (global.game_state == GAME_STATE.RUNNING){
		global.game_state = GAME_STATE.PAUSED;
		for (var i = 0; i < instance_count; i++){
		var instance = instance_id_get(i);
		
		//LD Montello,
		//make sure instance exists
		//as it could be destroyed by the time we get here.
		if (instance_exists(instance) and instance.speed > 0){ //loops through moving objects
			instance.image_speed = 0;
			add_speed(instance,instance.speed);
		}
		
	}
	} else if (global.game_state == GAME_STATE.PAUSED) {
		global.game_state = GAME_STATE.RUNNING;
		
		//LD montello
		//Turn off the Pause UI
		instance_deactivate_object(obj_sfx_volume_slider)
		
		for (var i = 0; i < array_length(arr_speed); i++){
			try { //Try catch is necessary because of 1 frame delay. Can crash without it
				var instance = arr_speed[i].instance;
				var value = arr_speed[i].value;
				instance.image_speed = 1;
				instance.speed = value;
			} catch (_exception){
				show_debug_message("Object was destroyed");
			}
		}
	}
}


//James Reneo
//Handles pausing bullets
arr_speed = []

add_speed = function(instance,value){
	//Stores the speed for that object before the pause
	array_push(arr_speed,{instance,value});
	
	//Sets speed to 0
	instance.speed = 0;
}

//LD Montello,
//is the pause menu currently open?
is_pause_menu_open = false;

//LD Montello
//Activates the pause menu
open_pause_menu = function()
{
	is_pause_menu_open = true;
	
	//LD montello
	//activate the sfx slider instance. 
	instance_activate_object(obj_sfx_volume_slider)
	
	//LD Montello
	//activate the music slider instance.
	instance_activate_object(obj_music_volume_slider)
	
	//LD Montello
	//activate the pause menu object
	instance_activate_object(obj_pause_menu)
}

//LD Montello
//Deactivates the pause menu
close_pause_menu = function()
{
	is_pause_menu_open = false;
	
	//LD montello
	//deactivate the sfx slider instance. 
	instance_deactivate_object(obj_sfx_volume_slider)
	
	//LD Montello
	//deactivate the music slider instance.
	instance_deactivate_object(obj_music_volume_slider)
	
	//LD Montello
	//deactivate the pause menu object
	instance_deactivate_object(obj_pause_menu)
}

//LD Montello
//Deactivate the pause menu when rm_main_game starts
close_pause_menu()