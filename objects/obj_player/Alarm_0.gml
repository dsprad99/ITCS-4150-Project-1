/// @description Burst fire timer
// You can write your code in this editor

//LD Montello
//this alarm goes off
//to create an individual
//firing of the weapon
//so we can have a burst
//upgrade.

//Decrement cur_burst_count
cur_burst_count--;

//Davis Spradling
//LD - Davis coded this
//for firing and I moved
//it for the ability to 
//have bursts.
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
		bullet.image_angle = bullet.direction;
		bullet.speed = bullet_speed;
    }
	
	
//if we haven't
//done enough bursts
//then reset this alarm.
if (cur_burst_count > 0)
{
	alarm_set(0, burst_interval);
}