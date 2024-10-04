/// @description Insert description here
// You can write your code in this editor


//LD Montello
//Because james sets the
//GUI alignment it was breaking
//formatting here.
//setting the halign to default
//fixes that problem.
draw_set_halign(-1)
draw_set_valign(-1)

//LD Montello
//Set the font
//Make the text pivot be the center of the text.
draw_set_font(fnt_gamecuben)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

//Davis Spradling
//Draw players current level
draw_text_transformed_color(200, 870, "Wave: " + string(global.cur_wave),  24 / 72, 24 / 72, 0, c_white, c_white, c_white, c_white, 1);

//Davis Spradling
//James Reneo
//Draw Health Bar
draw_text_transformed_color(210, 970, "Health",  24 / 72, 24 / 72, 0, c_white, c_white, c_white, c_white, 1);
//LD Montello
//the fill value
//is expressed as a ratio
//of the current health / max_health
//and multiplied by the value for the size
//of the "full" bar in the gui
//to show how far from full health
//the player currently is.
//health bar is always "full" at 100.
draw_healthbar(50, 1010, 500, 1040, cur_health_fill, c_black, global.neon_cyan, global.neon_cyan, 0, true, false);

//Davis Spradling 
//Bar to show progress player has made through the wave
bar_width = 1000;    
bar_height = 20;    
bar_x = 670;  
bar_y = 995;  

//LD Montello
//Draw the xp bar to it's filled amount.
//draw_healthbar's fill amount should always
//be a 0-100 value, we just divide current xp
//by the amount of xp we need to reach the next
//level and that gives us a 0-1 value,
//we multiply that by 100 and we have our
//fill amount for the xp bar.
//fill_amount = obj_player.xp / obj_player.get_xp_to_reach_level(obj_player.level + 1) * 100
//This was how it was calculated,
//but we animate it now so it's calculated in step.


draw_healthbar(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, cur_xp_fill, c_black, c_white, c_white, 0, false, false);

//LD Montello
//Draw current level on the level up bar.
//We divide the bar_height by 4 because
//the vertical alignment is middle.
draw_text_transformed_color(bar_x + 140, bar_y - bar_height, "LVL." + string(obj_player.level), lvl_text_scale, lvl_text_scale, lvl_text_rot, lvl_text_color, lvl_text_color, lvl_text_color, lvl_text_color, 1)

//Go back to default alignment.
draw_set_valign(-1)
draw_set_halign(-1)
//Go back to default font
draw_set_font(-1)

//TODO
//LD Montello
//I want to add color blending
//to the bar when you level up
//so that it does a small blending animation before resetting.



if (debug_gui)
{

//LD Montello
//Temporary,
//Just draw the level in the top left.
//Draw max health
draw_text_transformed_color(10, 0, "Max Health: " + string(obj_player.max_health), 2, 2, 0, c_white, c_white, c_white, c_white, 1);
//Draw level
draw_text_transformed_color(10, 40, "Level: " + string(obj_player.level), 2, 2, 0, c_white, c_white, c_white, c_white, 1);
//Draw xp
draw_text_transformed_color(10, 80, "XP: " + string(obj_player.xp), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 120, "Debug Controls:", 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 160, "Press 1 to upgrade bullets fired per burst: " + string(obj_player.player_bullets_fired), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 200, "Press 2 to upgrade individual bullet speed: " + string(obj_player.bullet_speed), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 240, "Press 3 to upgrade fire interval: " + string(obj_player.shoot_interval), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 280, "Press 4 to upgrade piercing: " + string(obj_player.piercing_count), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 320, "Press 5 to upgrade burst count: " + string(obj_player.bursts_per_interval), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 360, "Press 6 to upgrade movement: " + string(obj_player.speed), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 400, "Press 7 to refill health: " + string(obj_player.mainPlayerHealth), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 440, "Press 8 to increase wave size: " + string(obj_spawner.cur_wave_size), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 480, "Kills Required for next wave: " + string(obj_spawner.kills_to_spawn_next_wave), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 520, "Kills: " + string(global.enemies_killed), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

}