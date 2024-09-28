/// @description Draw Kills & Wave to screen
// You can write your code in this editor

//LD Montello
//Delete this object and replace it with
//something that draws where the kills and 
//Waves should be drawn in your UI ryan,


draw_text_transformed(10, 100, "Kills: " + string(global.enemies_killed), 2, 2, 0)

draw_text_transformed(10, 140, "Waves: " + string(global.cur_wave), 2, 2, 0)