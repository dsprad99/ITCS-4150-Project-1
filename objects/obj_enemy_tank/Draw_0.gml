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