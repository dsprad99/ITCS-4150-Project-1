/// @description Insert description here
// You can write your code in this editor

//if (global.game_state == GAME_STATE.PAUSED)
//{
//	return;
//}

//LD Montello
#region xp bar fill animation

//LD Montello
//Start the xp bar fill animation
if (should_play_xp_lerp)//array_length(arr_xpstructs) > 0 and !is_lerping_xp)
{	
	//pop one animation off of the queue.
	//cur_xpstruct = array_pop(arr_xpstructs);
	
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
	}
	
	//LD Montello
	//Set the last xp fill value so we start lerping from there
	//This always makes it look like the xp is "jumping"
	//forward so that it stays caught up with the actual
	//player's xp and doesn't fall behind.
	last_xp_fill = xp_fill
	
	//LD Montello
	//Set the new target xp fill
	xp_fill = (obj_player.xp - obj_player.get_xp_to_reach_level(obj_player.level)) / (obj_player.get_xp_to_reach_level(obj_player.level + 1) - obj_player.get_xp_to_reach_level(obj_player.level)) * 100;
	
	//LD Montello
	//Set the new total time for the lerp
	//so that it moves at the same speed
	//regardless of how large the lerp is.
	cur_total_xp_anim_time = abs(total_xp_anim_time * (xp_fill / 100 - last_xp_fill / 100));
	
	if (last_level != obj_player.level)
	{
		xp_fill = 100;
		cur_total_xp_anim_time = abs(total_xp_anim_time * (xp_fill / 100 - last_xp_fill / 100));
		should_rollover_fill = true;
	}
	 
	
	
	//LD Montello
	//Say we are playing the animation.
	is_lerping_xp = true;
	
	//LD Montello
	//Say we shouldn't restart the animation.
	should_play_xp_lerp = false;
	
	//if (should_rollover_fill = false)
	last_level = obj_player.level;
}

if (is_lerping_xp)
{
	
	
	cur_xp_anim_time++;
	
	//LD Montello
	//Set the fill value to lerp
	//based on our animation.
	cur_xp_fill = lerp(last_xp_fill, xp_fill, cur_xp_anim_time / cur_total_xp_anim_time);
	
	if (should_rollover_fill and cur_xp_anim_time >= cur_total_xp_anim_time)
	{
		//LD Montello
		//Make the LVL. text bounce when
		//we actually visually cross the threshold
		//for leveling up.
		should_play_text_bounce = true;
		should_rollover_fill = false;
		last_xp_fill = 0;
		//cur_xp_fill = 0;
		//xp_fill = 0;
		xp_fill = (obj_player.xp - obj_player.get_xp_to_reach_level(obj_player.level)) / (obj_player.get_xp_to_reach_level(obj_player.level + 1) - obj_player.get_xp_to_reach_level(obj_player.level)) * 100;
		cur_xp_anim_time = 0;
		cur_total_xp_anim_time = abs(total_xp_anim_time * (xp_fill / 100 - last_xp_fill / 100));
		is_lerping_xp = false;
		should_play_xp_lerp = true;
	}
	//LD Montello
	//if we've reached the end of our lerp
	else if (cur_xp_anim_time > cur_total_xp_anim_time)
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
	//Make sure to 
	//update the level to display
	//right when it bounces so it
	//changes when the bounce animation places
	lvl_to_display = obj_player.level;
	
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