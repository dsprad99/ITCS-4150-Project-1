/// @description Draw Kills & Wave to screen
// You can write your code in this editor

//LD Montello
//Delete this object and replace it with
//something that draws where the kills and 
//Waves should be drawn in your UI ryan,

//LD Montello
//Set the font
//Make the text pivot be the center of the text.
draw_set_font(fnt_gamecuben)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_text_transformed(100, 100, "Kills: " + string(global.enemies_killed), 22 / 72, 22 / 72, 0)

draw_text_transformed(100, 140, "Waves: " + string(global.cur_wave), 22 / 72, 22 / 72, 0)

//Go back to default alignment.
draw_set_valign(-1)
draw_set_halign(-1)
//Go back to default font
draw_set_font(-1)