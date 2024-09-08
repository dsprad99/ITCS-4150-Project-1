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


//Davis Spradling
//Time management of shooting mechanism as well as creating bullet instances
//of the object bullet_obj.

shoot_timer++;
if (shoot_timer >= shoot_interval) {
    shoot_timer = 0;
	
    for (var i = 0; i < player_bullets_fired; i++) {
        var bullet = instance_create_layer(x, y, "Instances", obj_bullet_player);
        
		//Davis Spradling
		//Adjust bullet angle so not all bullets are stacked on top of each other
		var angle_offset = (i*10) - ((player_bullets_fired-1) *5);
		
		//Davis Spradling
		//Assgin bullet direction and speed to bullet object
		//For the direction take the current main_player objects image
		//angle and then add the offset on to it so bullets won't stack
		//LD Montello
		//Replace obj_player.direction
		//to be the gun angle so that the bullet
		//direction matches where the player aims.
        bullet.direction = obj_player.gun_angle+angle_offset;
		bullet.speed = bullet_speed;
    }
}


//LD Montello
//Calculate the angle from
//the player to the mouse
//and store that in gun_angle
gun_angle = point_direction(x, y, mouse_x, mouse_y);