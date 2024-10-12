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
draw_set_halign(fa_left)
draw_set_valign(fa_middle)

//If the wave count is greater
//than the wave the player needed to win
//then let's display the actual
//wave they killed all the enemies at
//before the game ended, not the last one
//the were in the middle of fighting.
var waves_to_display = global.cur_wave;
if (waves_to_display > global.waves_to_win)
{
	waves_to_display = global.waves_to_win;
}

draw_text_transformed(150, 200, "Kills: " + string(global.enemies_killed), 22 / 72, 22 / 72, 0)

draw_text_transformed(150, 240, "Waves: " + string(waves_to_display), 22 / 72, 22 / 72, 0)

//Go back to default alignment.
draw_set_valign(-1)
draw_set_halign(-1)
//Go back to default font
draw_set_font(-1)