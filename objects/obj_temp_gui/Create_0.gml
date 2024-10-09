/// @description Insert description here
// You can write your code in this editor

//James Reneo
//Level up GUI implementation

show_gui = false;

// Define upgrade options

//LD Montello
//"Cheat" or debug menu

debug_gui = false;


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
//This is true on start so the health
//bar starts off filled.
should_play_health_lerp = true;

//LD Montello
//Are we currently animating the health bar?
is_lerping_health = false;


#endregion

