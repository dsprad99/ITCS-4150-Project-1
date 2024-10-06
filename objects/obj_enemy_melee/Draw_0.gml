/// @description Insert description here
// You can write your code in this editor

//LD Montello
//We have to override this event
//from the parent tank
//to be able to draw
//our sprite.
draw_self()

draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_text_transformed(x,y, _health, 2, 2, 0);