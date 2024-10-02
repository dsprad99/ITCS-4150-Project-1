/// @description Set camera pos
// You can write your code in this editor

//LD Montello
//at the end of each step
//Set the camera position
//to be centered on the position.
//This fixes the jittering that
//the built in camera follow had.
camera_set_view_pos(cam, obj_player.x - camera_get_view_width(cam) / 2, obj_player.y - camera_get_view_height(cam) / 2)