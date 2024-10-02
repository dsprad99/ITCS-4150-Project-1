/// @description Insert description here
// You can write your code in this editor


//Draw self (Slider bar)
draw_self()

//LD Montello
//Draw slider
draw_sprite_ext(game_sprite, 0, cur_x, center_y, slider_x_scale, slider_y_scale, 0, slider_color, 1)

//Draw mouse positino
//draw_text(mouse_x, mouse_y, string(mouse_x) + ", " + string(mouse_y))

//Draw slider hit box.
//draw_rectangle_color(left_bound, lower_bound, right_bound, up_bound, c_blue, c_blue, c_blue, c_blue, true)