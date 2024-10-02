/// @description Insert description here
// You can write your code in this editor
min_value = 0
max_value = 1

cur_value = 0;

slider_width = 1000;

image_xscale = slider_width / 32

slider_x_scale = 2;
slider_y_scale = 2;

slider_color = c_blue	

is_hovering_slider = false;

is_holding_slider = false;




cam = view_get_camera(0);

center_x = camera_get_view_x(cam) + camera_get_view_width(cam) / 2
center_y = camera_get_view_y(cam) + camera_get_view_height(cam) / 2

cur_offset = 0

cur_x = 0

set_cur_value = function(_value)
{
	//LD Montello
	//clamp to min and max values
	cur_value = clamp(_value, min_value, max_value)
	
	//Recalculate center values.
	center_x = camera_get_view_x(cam) + camera_get_view_width(cam) / 2
	center_y = camera_get_view_y(cam) + camera_get_view_height(cam) / 2
	
	//Calculate offset from the leftmost
	//point to the desired point to calculate
	//where to draw the sprite.
	cur_offset = (slider_width * (cur_value / max_value));
}

left_bound = cur_x - slider_x_scale / 2
right_bound = cur_x + slider_x_scale / 2
up_bound = center_y - slider_y_scale / 2
lower_bound = center_y + slider_y_scale / 2 