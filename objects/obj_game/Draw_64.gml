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