/// @description Insert description here
// You can write your code in this editor

//Davis Spradling
//Create variables to control player movement through keys.
var right_ = keyboard_check(vk_right);
var left_ = keyboard_check(vk_left);
var up_ = keyboard_check(vk_up);
var down_ = keyboard_check(vk_down);

//Davis Spradling
//Axis of player
var yValue = down_-up_;
var xValue = right_-left_;

//Davis Spradling
//Get movement speed of player
var movementSpeed = moveSpeed;

//Davis Spradling
//Rotate angles based on left/right keys being pressed.
if (left_) {
    image_angle += 4; 
}
if (right_) {
    image_angle -= 4;  
}

//Davis Spradling
//Go forwards/backwards based on up/down keys being pressed.
if (up_) {
    x += lengthdir_x(movementSpeed, image_angle);  
    y += lengthdir_y(movementSpeed, image_angle);
}
if (down_) {
    x -= lengthdir_x(movementSpeed, image_angle); 
    y -= lengthdir_y(movementSpeed, image_angle);
}

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
        var bullet = instance_create_layer(x, y, "Instances", bullet_obj);
        
		//Davis Spradling
		//Adjust bullet angle so not all bullets are stacked on top of each other
		var angle_offset = (i*10) - ((player_bullets_fired-1) *5);
		
		//Davis Spradling
		//Assgin bullet direction and speed to bullet object
		//For the direction take the current main_player objects image
		//angle and then add the offset on to it so bullets won't stack
        bullet.direction = main_player.image_angle+angle_offset;
		bullet.speed = bullet_speed;
    }
}


