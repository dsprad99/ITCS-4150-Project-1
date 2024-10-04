/// @description Insert description here
// You can write your code in this editor

//James Reneo
//Level up GUI implementation

show_gui = false;

// Define upgrade options

//LD Montello
//"Cheat" or debug menu

debug_gui = false;


#region xp bar fill

//LD Montello
//Fill percent of the xp bar
xp_fill = 0;

//LD Montello
//last fill percent of the xp bar,
//the one that we are lerping from.
//only reset when we aren't lerping
//xp bar and the xp just changed.
last_xp_fill = 0;

//LD Montello
//The actual value used to set
//the fill on the xp bar
//This is calculated in the Step event
cur_xp_fill = 0;

//LD Montello
//the total time of the xp bar fill animation
//This is the amount of time it would take 
//to go from 0 to 100 fill, as we want
//to fill at a speed relative to the amount we fill
//so that it isn't crazy fast for small amounts of xp
//and it isn't crazy slow for large amounts.
total_xp_anim_time = 100;
//This is the actual total time the lerp will be working
//off of.
cur_total_xp_anim_time = abs(total_xp_anim_time * (xp_fill / 100 - last_xp_fill / 100));

//LD Montello
//the current time in the animation for the xp bar
cur_xp_anim_time = 0;

//LD Montello
//Should we lerp the xp bar?
should_play_xp_lerp = false;

//LD Montello
//Are we currently animating the xp bar?
is_lerping_xp = false;

//LD Montello
//The last level the player was at when we animated
//This will help us to do a rollover lerp
//where we lerp to the max fill of the xp bar
//then continue lerping to the xp value when we rollover.
last_level = 0;

//LD Montello
//Do we need to fill the bar completely
//and then rollover the xp?
should_rollover_fill = false;

#endregion

#region health bar fill lerping

//LD Montello
//Fill percent of the health bar
health_fill = 100;

//LD Montello
//last fill percent of the health bar,
//the one that we are lerping from.
//only reset when we aren't lerping
//health bar and the health just changed.
last_health_fill = 0;

//LD Montello
//The actual value used to set
//the fill on the healthbar
//This is calculated in the Step event
cur_health_fill = 0;


//LD Montello
//the total time of the health bar fill animation
//This is the amount of time it would take 
//to go from 0 to 100 fill, as we want
//to fill at a speed relative to the amount we fill
//so that it isn't crazy fast for small amounts of health
//and it isn't crazy slow for large amounts.
total_health_anim_time = 200;
//This is the actual total time the lerp will be working
//off of.
cur_total_health_anim_time = abs(total_health_anim_time * (health_fill / 100 - last_health_fill / 100));

//LD Montello
//the current time in the animation for the health bar
cur_health_anim_time = 0;

//LD Montello
//Should we start lerping the health bar?
should_play_health_lerp = false;

//LD Montello
//Are we currently animating the health bar?
is_lerping_health = false;


#endregion

#region lvl up text animation
//LD Montello
//Should we play the level up animation for text?
should_play_text_bounce = false;

//Are we still playing the text bounce?
is_playing_text_bounce = false;

//LD Montello
//level up animation time
total_lvl_up_anim_time = 15;
cur_lvl_up_anim_time = 0;

//LD Montello
//Should we be reversing the 
//animation now?
reverse_anim = false;

//LD Montello
//the current rotation of the lvl text
lvl_text_rot = 0;
//LD Montello
//the current scale of the lvl text
lvl_text_scale = 24 / 72;
//LD Montello
//the current color of the lvl text
lvl_text_color = global.neon_cyan

#endregion

