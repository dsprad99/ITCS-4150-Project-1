/// @description Insert description here
// You can write your code in this editor



#region pathfinding



//init a path.
path = path_add();

//other is this object,
//any reference made is assumed
//to be the bullet instance
//this loops through all bullet instances
//that are within the bullet avoidance range.

//I think what I'll do is make the bullet collider much larger
//
with (obj_bullet) if (distance_to_object(other) < other.bullet_avoidance_range)
{
	other.is_avoiding = true;
}
else
{
	other.is_avoiding = false;
}

//otherwise pathfind normally.
//LD
//if (other.is_avoiding == false)
//{
//	//Pathfind to the player, while "soft" avoiding 
//	//LD
//	mp_potential_path_object(path, obj_player.x, obj_player.y, pathing_speed, 4, obj_bullet);
	
//}

//LD Montello
//If we're going to calculate every step
//we should only calculate the next step in 
//the pathfinding, instead of finding the
//entire path.
//this is much more efficient.

mp_potential_step_object(obj_player.x, obj_player.y, pathing_speed, obj_bullet);



#endregion