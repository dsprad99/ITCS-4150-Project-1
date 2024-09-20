/// @description Insert description here
// You can write your code in this editor

//Davis Spradling
//Draw players current level
draw_text_transformed_color(200, 870, "Wave: " + string(obj_player.level), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

//Davis Spradling
//James Reneo
//Draw Health Bar
draw_text_transformed_color(210, 970, "Health", 2, 2, 0, c_white, c_white, c_white, c_white, 1);
draw_healthbar(50, 1010, 500, 1040, obj_player.mainPlayerHealth, -1, c_white, c_green, 0, false, false);

//Davis Spradling 
//Bar to show progress player has made through the wave
bar_width = 1000;    
bar_height = 20;    
bar_x = 670;  
bar_y = 995;  
roundness = 10

//To-Do
//Calculation for percentage of wave completed once balancing is done.
//Currently just check number of killed enemies and divides by 5
filled_width = (obj_player.enemies_killed / 5) * bar_width
draw_set_color(c_white); 
draw_roundrect(bar_x, bar_y, bar_x + filled_width, bar_y + bar_height, false);


//LD Montello
//Temporary,
//Just draw the level in the top left.
//Draw health
//draw_text_transformed_color(10, 80, "Health: " + string(obj_player.mainPlayerHealth), 2, 2, 0, c_white, c_white, c_white, c_white, 1);
//Draw xp
/*

draw_text_transformed_color(10, 120, "Debug Controls:", 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 160, "Press 1 to upgrade bullets fired per burst: " + string(obj_player.player_bullets_fired), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 200, "Press 2 to upgrade individual bullet speed: " + string(obj_player.bullet_speed), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 240, "Press 3 to upgrade fire interval: " + string(obj_player.shoot_interval), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 280, "Press 4 to upgrade piercing: " + string(obj_player.piercing_count), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 320, "Press 5 to upgrade burst count: " + string(obj_player.bursts_per_interval), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 360, "Press 6 to upgrade movement: " + string(obj_player.speed), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 400, "Press 7 to upgrade health: " + string(obj_player.mainPlayerHealth), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 440, "Press 8 to increase wave size: " + string(obj_spawner.cur_wave_size), 2, 2, 0, c_white, c_white, c_white, c_white, 1);
*/
