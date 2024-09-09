/// @description Insert description here
// You can write your code in this editor

//LD Montello
//Temporary,
//Just draw the level in the top left.

//Draw level
draw_text_transformed_color(10, 10, "Level: " + string(obj_player.level), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

//Draw xp
draw_text_transformed_color(10, 40, "xp: " + string(obj_player.xp), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

//Draw health
draw_text_transformed_color(10, 80, "Health: " + string(obj_player.mainPlayerHealth), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 120, "Debug Controls:", 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 160, "Press 1 to upgrade bullets fired per burst: " + string(obj_player.player_bullets_fired), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 200, "Press 2 to upgrade individual bullet speed: " + string(obj_player.bullet_speed), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 240, "Press 3 to upgrade fire interval: " + string(obj_player.shoot_interval), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 280, "Press 4 to upgrade piercing: " + string(obj_player.piercing_count), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 320, "Press 5 to upgrade burst count: " + string(obj_player.bursts_per_interval), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 360, "Press 6 to upgrade movement: " + string(obj_player.speed), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 400, "Press 7 to upgrade health: " + string(obj_player.mainPlayerHealth), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

draw_text_transformed_color(10, 440, "Press 8 to increase wave size: " + string(obj_spawner.cur_wave_size), 2, 2, 0, c_white, c_white, c_white, c_white, 1);