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
#region xp bar fill animation

//LD Montello
//Start the xp bar fill animation
if (should_play_xp_lerp)
{	
	//LD Montello.
	//If we were already lerping xp,
	//don't change the starting
	//value as that could make our
	//animation look like it jumps
	//Just continue lerping as normal
	//and we'll just adjust the end value after.
	if (!is_lerping_xp)
	{
		//LD Montello
		//Reset to default start values for the animation.
		//This will reset the animation if it plays back to back.
		cur_xp_anim_time = 0;
	
		//LD Montello
		//Set the last xp fill value so we start lerping from there
		last_xp_fill = xp_fill
	}
	
	//LD Montello
	//Set the new target xp fill
	xp_fill = obj_player.xp / obj_player.get_xp_to_reach_level(obj_player.level + 1) * 100;
	
	//LD Montello
	//Set the new total time for the lerp
	//so that it moves at the same speed
	//regardless of how large the lerp is.
	cur_total_xp_anim_time = abs(total_xp_anim_time * (xp_fill / 100 - last_xp_fill / 100));
	
	//LD Montello
	//Say we are playing the animation.
	is_lerping_xp = true;
	
	//LD Montello
	//Say we shouldn't restart the animation.
	should_play_xp_lerp = false;
}

if (is_lerping_xp)
{
	
	cur_xp_anim_time++;
	
	//LD Montello
	//Set the fill value to lerp
	//based on our animation.
	cur_xp_fill = lerp(last_xp_fill, xp_fill, cur_xp_anim_time / cur_total_xp_anim_time);
	
	//LD Montello
	//if we've reached the end of our lerp
	if (cur_xp_anim_time > cur_total_xp_anim_time)
	{
		//LD Montello
		//stop lerping
		is_lerping_xp = false;
		//LD Montello
		//set the current xp fill
		//to be our target fill value
		cur_xp_fill = xp_fill;
	}
	
	
}

#endregion

#region LVL. text bounce animation

//LD Montello
//Play text bounce if P is hit.
if (keyboard_check_pressed(ord("P")))
{
	should_play_text_bounce = true;
}

//LD Montello
//Start the text bounce animation
if (should_play_text_bounce)
{
	//Reset to default start values for the animation.
	//This will reset the animation if it plays back to back.
	cur_lvl_up_anim_time = 0;
	reverse_anim = false;
	
	//Say we are playing the animation.
	is_playing_text_bounce = true;
	
	//Say we shouldn't reset and play the animation.
	should_play_text_bounce = false;
}

if (is_playing_text_bounce)
{
	//LD Montello
	//Animate LVL GUI text
	//when the player levels up.
	if (not reverse_anim)
	cur_lvl_up_anim_time++;
	else
	//We want to reverse faster
	//than we were going forward.
	cur_lvl_up_anim_time-=2;

	//LD Montello
	//Lerp the values based on our time.
	lvl_text_rot = lerp(0, 25, cur_lvl_up_anim_time / total_lvl_up_anim_time);
    lvl_text_scale = lerp(24/72, 48/72, cur_lvl_up_anim_time / total_lvl_up_anim_time);
	lvl_text_color = lerp(global.neon_cyan, global.neon_lime, cur_lvl_up_anim_time / total_lvl_up_anim_time)

	if (cur_lvl_up_anim_time > total_lvl_up_anim_time and not reverse_anim)
	{
	
		reverse_anim = true;
	}
	if (cur_lvl_up_anim_time < 0 and reverse_anim)
	{
		reverse_anim = false;
		
		//LD Montello
		//stop playing animation
		//and reset values to default.
		is_playing_text_bounce = false;
		lvl_text_scale = 24 / 72;
		lvl_text_rot = 0
		lvl_text_color = global.neon_cyan
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