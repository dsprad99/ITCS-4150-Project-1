/// @description Draw underglow & Animate GUI
// You can write your code in this editor




//LD Montello
#region health bar fill animation

//LD Montello
//Start the health bar fill animation
if (should_play_health_lerp)
{	
	//LD Montello.
	//If we were already lerping health,
	//don't change the starting
	//value as that could make our
	//animation look like it jumps
	//Just continue lerping as normal
	//and we'll just adjust the end value after.
	if (!is_lerping_health)
	{
		//LD Montello
		//Reset to default start values for the animation.
		//This will reset the animation if it plays back to back.
		cur_health_anim_time = 0;
	
		//LD Montello
		//Set the last health fill value so we start lerping from there
		last_health_fill = health_fill
	}
	
	//Set the new target health fill
	health_fill = obj_player.mainPlayerHealth / obj_player.max_health * 100;
	
	//LD Montello
	//Set the new total time for the lerp
	//so that it moves at the same speed
	//regardless of how large the lerp is.
	cur_total_health_anim_time = abs(total_health_anim_time * (health_fill / 100 - last_health_fill / 100));
	
	//LD Montello
	//Say we are playing the animation.
	is_lerping_health = true;
	
	//LD Montello
	//Say we shouldn't restart the animation.
	should_play_health_lerp = false;
}

if (is_lerping_health)
{
	
	cur_health_anim_time++;
	
	//LD Montello
	//Set the fill value to lerp
	//based on our animation.
	cur_health_fill = lerp(last_health_fill, health_fill, cur_health_anim_time / cur_total_health_anim_time);
	
	//LD Montello
	//if we've reached the end of our lerp
	if (cur_health_anim_time > cur_total_health_anim_time)
	{
		//LD Montello
		//stop lerping
		is_lerping_health = false;
		//LD Montello
		//set the current health fill
		//to be our target fill value
		cur_health_fill = health_fill;
	}
	
	
}


#endregion

//LD Montello
//Press "O" to OPEN the debug menu.
if (keyboard_check_pressed(ord("O")))
{
	debug_gui = not debug_gui
}


//LD Montello
//debug UI ("Cheat Menu")
#region upgrade testing

if (debug_gui)
{

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

//Decrease game step speed
if (keyboard_check_pressed(ord("9")))
{
	//only decrease speed if we're greater
	//than 60 so that we can't set it to 0.
	if (game_get_speed(gamespeed_fps) > 60)
		game_set_speed(game_get_speed(gamespeed_fps) - 60, gamespeed_fps) 
}
//Increase game step speed
if (keyboard_check_pressed(ord("0")))
{
	//only increase speed if we're less
	//than 60 so that we can't set it to 0.
	if (game_get_speed(gamespeed_fps) < 60000)
		game_set_speed(game_get_speed(gamespeed_fps) + 60, gamespeed_fps) 
}

//LD Montello
//Increase xp by holding x
//Used to text the visuals of the xp bar.
if (keyboard_check(ord("X")))
{
	obj_player.add_xp(1);
}

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