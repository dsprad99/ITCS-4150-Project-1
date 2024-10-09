/// @description Insert description here
// You can write your code in this editor

//James reneo
//Drawing text
draw_self()

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_white);

//LD Montello
//I changed this to use our font
draw_set_font(fnt_gamecuben);


//I also changed the scale of the text to match
//our font size.
draw_text_ext_transformed(x,y,selected_upgrade,-1, 125, 24 / 72, 24 / 72,0)