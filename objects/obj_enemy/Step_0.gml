/// @description Movement and attacking
// You can write your code in this editor



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

	mp_potential_step_object(obj_player.x, obj_player.y, pathing_speed, obj_enemy);	
}





#endregion


#region Attacking

//LD Montello
//I copied david's code 
//from the player to code firing
//here.

shoot_timer++;
if (shoot_timer >= shoot_interval) {
    shoot_timer = 0;
	
    for (var i = 0; i < bullets_fired; i++) {
        var bullet = instance_create_layer(x, y, "Instances", obj_bullet_enemy);
        
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
		bullet.speed = bullet_speed;
    }
}

#endregion