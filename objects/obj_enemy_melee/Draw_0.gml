/// @description Insert description here
// You can write your code in this editor

//LD Montello
//We have to override this event
//from the parent tank
//to be able to draw
//our sprite.
draw_self()

//LD Montello,
//Draw enemy debug UI
if (obj_temp_gui.debug_gui)
{

//LD Montello
//Draw health on enemy for debug purposes.
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

//LD Montello
//Draw a green rectangle with the amount of health on it.
draw_rectangle_color(x - 16, y + 16, x + 16,  y - 16, global.neon_lime, global.neon_lime, global.neon_lime, global.neon_lime, false)
draw_text_transformed_color(x,y, _health, 2, 2, 0, c_black, c_black, c_black, c_black, 1);

}