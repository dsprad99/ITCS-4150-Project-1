/// @description Insert description here
// You can write your code in this editor

//Davis Spradling
//Create variables to control player movement through keys.
//LD Montello
//Added WASD to the inputs.
var right_ = keyboard_check(vk_right) || keyboard_check(ord("D"));
var left_ = keyboard_check(vk_left) || keyboard_check(ord("A"));
var up_ = keyboard_check(vk_up) || keyboard_check(ord("W"));
var down_ = keyboard_check(vk_down) || keyboard_check(ord("S"));


//Davis Spradling
//Axis of player
var yValue = down_-up_;
var xValue = right_-left_;




//LD Montello
//Use left and right for movement.
//with hspeed so we can clamp diagonal
//speed later.
if (left_) {
    hspeed = -moveSpeed;  
}
if (right_) {
    hspeed = moveSpeed;  
}

//LD Montello
//if user is not inputting
//left or right horizontal speed is zero.
if (not left_ && not right_)
{
	hspeed = 0;
}

//Davis Spradling
//Go forwards/backwards based on up/down keys being pressed.
//LD Montello
//Removed the x incrementation from these inputs.
if (up_) {
    vspeed = -moveSpeed;  
}
if (down_) {
    vspeed = moveSpeed;  
}

//LD Montello
//if user is not inputting
//up or down vertical speed is zero.
if (not up_ && not down_)
{
	vspeed = 0;
}

//clamp speed so that you
//can't move faster in diagonal 
//directions. 
speed = min(speed, moveSpeed);


//Davis Spradling
//Allow for player movement not exceeding the room height/width.
//Thus, once a player goes past the half way origin of the screen
//on the x/y axis it will clamp the x and y value not allowing it to go
//beyond the boundaries.
var half_sprite_width = sprite_width/2;
var half_sprite_height = sprite_height/2;
x = clamp(x, half_sprite_width, room_width - half_sprite_width);
y = clamp(y, half_sprite_height, room_height - half_sprite_height);



//LD Montello
//if we've
//done all our
//bursts then 
//we can start counting
//our timer again.
if (cur_burst_count == 0)
{
//David Spradling
shoot_timer++;
}

#region animating gun

//LD Montello
//if we are the exact amount of time
//it takes our fire animation to play
//away from firing
//then play the fire animation once
//so that it lines up.
//we calculate the speed it takes
//to play the animation 

//first we need to divide the 
//desired fps and the actual
//number of frames, and
//we do 60 divided by that
//value to get the exact
//number of frames it'll take
//to play the animation.
var time_to_start_anim = floor(shoot_interval - (60 / (gun_sprite_fps / gun_sprite_number)));
//We need to also add
//the amount of time it takes
//until the first burst
//occurs.
time_to_start_anim += burst_interval;
//We only want to play the fire animation once
//which is why we have the did_play_fire_animation
if (shoot_timer >= time_to_start_anim && did_play_fire_animation == false)
{
	do_fire_animation = true;
}



//LD Montello
//Calculate the angle from
//the player to the mouse
//and store that in gun_angle
gun_angle = point_direction(x, y, mouse_x, mouse_y);

//do fire animation.
if (do_fire_animation == true)
{

//LD Montello
//increment index by speed.
gun_sprite_index += gun_sprite_speed;

	//go back to zero
	if (gun_sprite_index >= gun_sprite_number)
	{
		gun_sprite_index = 0;
		do_fire_animation = false;
		did_play_fire_animation = true;
	}
}

#endregion

//Davis Spradling
//Time management of shooting mechanism as well as creating bullet instances
//of the object bullet_obj.
if (shoot_timer >= shoot_interval) {
    shoot_timer = 0;
	
	//LD Montello
	//let the fire animation
	//play again.
	did_play_fire_animation = false;
	
	//LD Montello
	//I moved Davis's stuff
	//to the alarm 0 event
	//so we can have a burst 
	//upgrade.
    //Set the cur burst count
	//so that the alarm 0
	//knows how many times to run.
	//we can't do this as a loop
	//because there's an amount 
	//of time between bursts.
	cur_burst_count = bursts_per_interval;
	alarm_set(0, burst_interval);
}


#region underglow

//LD Montello
//Draw underglow
layer_sprite_x(ug1, x);
layer_sprite_y(ug1, y);

#endregion

