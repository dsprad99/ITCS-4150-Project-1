/// @description Draw Player and Gun
// LD Montello

//LD Montello
//Just draw ourselves
draw_self();

//LD Montello
//Draws the players gun at current animation frame
//at a scale of 10
//at gun_angle angle.
draw_sprite_ext(spr_gun_fire, gun_sprite_index, x + gun_x_offset, y + gun_y_offset, 5.0, 5.0, gun_angle, c_white, image_alpha);


