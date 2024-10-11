/// @description Movement and attacking
// You can write your code in this editor


//James Reneo
//Timestoping enemies
if(global.game_state == GAME_STATE.PAUSED){
	return;
}


#region gun orientation

//LD Montello
//Calculate the angle from
//the enemy to the player
//and store that in gun_angle
gun_angle = point_direction(x, y, obj_player.x, obj_player.y);

#endregion

#region pathfinding

//LD Montello
//Stop moving towards player
//at target_stop_distance distance.
//This is a ranged enemy so getting
//really close wouldn't make sense.
if (distance_to_object(obj_player) > target_stop_distance)
{
	//LD Montello
	//If we're going to calculate every step
	//we should only calculate the next step in 
	//the pathfinding, instead of finding the
	//entire path.
	//this is much more efficient.
	
	//Path and avoid other tanks.
	mp_potential_step_object(obj_player.x, obj_player.y, pathing_speed, obj_enemy_tank);	
	
}








#endregion


#region Attacking


//LD Montello
//Only fire if you're close
//enough to the player.
if (distance_to_object(obj_player) <= enemy_fire_range)
{

//LD Montello
//I copied david's code 
//from the player to code firing
//here.
//I changed it to decrement
//so that the enemy fires as soon as 
//they are allowed to and then their
//cooldown timer starts.

if (attack_timer <= 0) {
    attack_timer = attack_interval;
	
    for (var i = 0; i < bullets_fired; i++) {
		//LD Montello
		//Create bullet,
		//passing our damage into the 
		//created object's damage parameter.
		//The bullet will be in the bullets layer
		//so it can't be covered up by enemies.
        var bullet = instance_create_layer(x, y, "Bullets", obj_bullet_enemy, {damage : damage});
        
		//Davis Spradling
		//Adjust bullet angle so not all bullets are stacked on top of each other
		var angle_offset = (i*10) - ((bullets_fired-1) *5);
		
		//Davis Spradling
		//Assgin bullet direction and speed to bullet object
		//For the direction take the current main_player objects image
		//angle and then add the offset on to it so bullets won't stack
		//LD Montello
		//Replace obj_player.direction
		//to be the gun angle so that the bullet
		//direction matches where the player aims.
        bullet.direction = gun_angle+angle_offset;
		bullet.image_angle = bullet.direction;
		bullet.speed = bullet_speed;
    }
}

}


//LD Montello
//Decrement shoot timer
attack_timer--;
attack_timer = clamp(attack_timer, 0, attack_interval)

#endregion

//LD Montello
#region Movement Animations

//If we aren't moving
//we shouldn't animate
//the tank treads.
if (is_moving())
{
	tread_anim_index += tread_anim_speed;
	
	//We want to lerp the object
	//to slowly rotate to face
	//the direction it's going
	//in as that'll make it look more
	//tank like.
	//image_angle = lerp(start_angle, point_direction(x, y, obj_player.x, obj_player.y), target_stop_distance / distance_to_object(obj_player));

}
else
{
	image_speed = 0;
}


#endregion

#region underglow

//LD Montello
//Draw underglow
layer_sprite_x(ug1, x);
layer_sprite_y(ug1, y);

#endregion