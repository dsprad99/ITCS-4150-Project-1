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
//Move towards player.
//LD Montello
	//If we're going to calculate every step
	//we should only calculate the next step in 
	//the pathfinding, instead of finding the
	//entire path.
	//this is much more efficient.
	
	//Path and avoid other tanks.
	mp_potential_step_object(obj_player.x, obj_player.y, pathing_speed, obj_enemy_tank);	








#endregion


#region Attacking


//LD Montello
//Only attack if you
//are colliding with the player
if (place_meeting(x, y, obj_player))
{

	//LD Montello
	//If we are ready to attack
	if (attack_timer <= 0) {
		//LD Montello
		//Reset attack timer
		attack_timer = attack_interval;
	
		obj_player.decrement_main_players_health(damage);
	}

}


//LD Montello
//Decrement attack timer
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