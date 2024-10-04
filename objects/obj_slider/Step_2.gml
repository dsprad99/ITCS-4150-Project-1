/// @description Insert description here
// You can write your code in this editor

//LD Montello
//Recalculate center values.
center_x = camera_get_view_x(cam) + camera_get_view_width(cam) / 2
center_y = camera_get_view_y(cam) + screen_y/* camera_get_view_height(cam) / 2*/

//Set Bar position
x = center_x
y = center_y

//LD Montello
//Recalculate slider position
//to be the min x + cur_offset
cur_x = (center_x - (slider_width / 2)) + cur_offset;