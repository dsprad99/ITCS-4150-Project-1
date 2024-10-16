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


//Davis Spradling
//Draw the Jump Regen text 
draw_text_transformed_color(190, 90, "Jump Regen",  24 / 72, 24 / 72, 0, c_white, c_white, c_white, c_white, 1);

//Davis Spradling
//Draw the regen bar that calculates regen time left
var x_regen=340;       
var y_regen=75;        
var width_regen = 200;  
var height_regen = 30;  
draw_set_color(c_black); 
//This will act as a constant background the bar that moves 
draw_rectangle(x_regen, y_regen, x_regen + width_regen, y_regen+height_regen, false);
var cooldown_ratio = obj_player.dash_cooldown/120; 
draw_set_color(c_green); 
//This is the part that will move according to cool down value which is generated through a ratio
draw_rectangle(x_regen, y_regen, x_regen+(1-cooldown_ratio)*width_regen, y_regen+height_regen, false);

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



//draw_healthbar(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, cur_xp_fill, c_black, c_white, c_white, 0, false, false);

//Go back to default alignment.
draw_set_valign(-1)
draw_set_halign(-1)
//Go back to default font
draw_set_font(-1)




if (debug_gui)
{

//LD Montello
//We recreate this every frame because
//we must get the values of each
//stat before drawing them.
var debug_lines = [

//Draw max health
"Max Health: " + string(obj_player.max_health),
//Draw level
"Level: " + string(obj_player.level),
//Draw xp
"XP: " + string(obj_player.xp),

//Draw current damage
"Damage: " + string(obj_player.damage),

//Draw required kills
"Kills Required for next wave: " + string(obj_spawner.kills_to_spawn_next_wave), 

//Draw current kills
"Kills: " + string(global.enemies_killed), 

//The various debug controls.
"Debug Controls:",

"Press 1 to upgrade bullets fired per burst: " + string(obj_player.player_bullets_fired),

"Press 2 to upgrade individual bullet speed: " + string(obj_player.bullet_speed),

"Press 3 to upgrade fire interval: " + string(obj_player.shoot_interval),

"Press 4 to upgrade piercing: " + string(obj_player.piercing_count), 

"Press 5 to upgrade burst count: " + string(obj_player.bursts_per_interval),

"Press 6 to upgrade movement: " + string(obj_player.moveSpeed), 

"Press 7 to refill health: " + string(obj_player.mainPlayerHealth),

"Press 8 to increase wave size: " + string(obj_spawner.cur_wave_size), 

"Press 9 to decrease game speed fps: " + string(game_get_speed(gamespeed_fps)),

"Press 0 to increase game speed fps: " + string(game_get_speed(gamespeed_fps)),

"Hold x to increase xp: " + string(obj_player.xp)

]

for (i = 0; i < array_length(debug_lines); i++)
{
	draw_text_transformed_color(10, 40 * i, debug_lines[i], 2, 2, 0, c_white, c_white, c_white, c_white, 1);
}


////LD Montello
////Temporary,
////Just draw the level in the top left.
////Draw max health
//draw_text_transformed_color(10, 0, "Max Health: " + string(obj_player.max_health), 2, 2, 0, c_white, c_white, c_white, c_white, 1);
////Draw level
//draw_text_transformed_color(10, 40, "Level: " + string(obj_player.level), 2, 2, 0, c_white, c_white, c_white, c_white, 1);
////Draw xp
//draw_text_transformed_color(10, 80, "XP: " + string(obj_player.xp), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

//draw_text_transformed_color(10, 120, "Debug Controls:", 2, 2, 0, c_white, c_white, c_white, c_white, 1);

//draw_text_transformed_color(10, 160, "Press 1 to upgrade bullets fired per burst: " + string(obj_player.player_bullets_fired), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

//draw_text_transformed_color(10, 200, "Press 2 to upgrade individual bullet speed: " + string(obj_player.bullet_speed), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

//draw_text_transformed_color(10, 240, "Press 3 to upgrade fire interval: " + string(obj_player.shoot_interval), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

//draw_text_transformed_color(10, 280, "Press 4 to upgrade piercing: " + string(obj_player.piercing_count), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

//draw_text_transformed_color(10, 320, "Press 5 to upgrade burst count: " + string(obj_player.bursts_per_interval), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

//draw_text_transformed_color(10, 360, "Press 6 to upgrade movement: " + string(obj_player.speed), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

//draw_text_transformed_color(10, 400, "Press 7 to refill health: " + string(obj_player.mainPlayerHealth), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

//draw_text_transformed_color(10, 440, "Press 8 to increase wave size: " + string(obj_spawner.cur_wave_size), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

//draw_text_transformed_color(10, 480, "Kills Required for next wave: " + string(obj_spawner.kills_to_spawn_next_wave), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

//draw_text_transformed_color(10, 520, "Kills: " + string(global.enemies_killed), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

//draw_text_transformed_color(10, 560, "Damage: " + string(obj_player.damage), )

}