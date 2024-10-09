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

//LD Montello
//I learned about this
//in the following forum post:
//https://forum.gamemaker.io/index.php?threads/draw_text_transformed-draws-blurry-text.77873/
//Turn of antialiasing as 
//it makes the text blurry
//and mishapen in some areas.
gpu_set_tex_filter(0)

//James reneo
//Drawing text
//LD Montello
//I also changed the scale of the text to match
//our font size.
draw_text_ext_transformed(x,y,selected_upgrade,-1, 125, 18 / 72, 18 / 72,0)

//LD Montello
//turn antiliasing back on
gpu_set_tex_filter(1)