/// @description Insert description here
// You can write your code in this editor

//DO NOT CALL draw_self()
//we don't want to draw the square
//sprite we are using for the collider.
//we want to draw the sprites so that 
//their rotation can be set seperately
//from the colliders rotation.
//I did this because the collider rotating
//made enemies get stuck when using the built
//in mp_potential_step function.
//This was the simplest fix.

//We're going to draw the tank
//at the same angle as the gun
//because that's the easiest
//way to make it look like tank 
//movement.
draw_sprite_ext(spr_TankWalkCycle, tread_anim_index, x, y, 5, 5, gun_angle, c_white, 1);

//we draw the turret separately as it will be animated separately.
draw_sprite_ext(spr_TankTurret, 0, x, y, 5, 5, gun_angle, c_white, 1);

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
draw_rectangle_color(x - 16, y + 16, x + 16,  y - 16, global.neon_magenta, global.neon_magenta, global.neon_magenta, global.neon_magenta, false)
draw_text_transformed_color(x,y, _health, 2, 2, 0, c_black, c_black, c_black, c_black, 1);

}