/// @description Draw text to screen
// You can write your code in this editor

//LD Montello
//Make the alignment center
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_font(fnt_gamecuben)

//Draw the text using the
//Parameters provided by the designer.
//Modify the instance variables to change
//the text and it's size.
draw_text_transformed_color(x, y, text, font_size, font_size, 0, c_white, c_white, c_white, c_white, 1)

//Go back to default alignment.
draw_set_valign(-1)
draw_set_halign(-1)
//Go back to default font
draw_set_font(-1)