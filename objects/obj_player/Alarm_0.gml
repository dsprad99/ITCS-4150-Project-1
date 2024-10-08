/// @description Burst fire timer
// You can write your code in this editor

//if we're paused don't do bursts until
//we've unpaused.
if (global.game_state == GAME_STATE.PAUSED)
{
	alarm_set(0, burst_interval);
	return;
}

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
		
		//LD Montello
		//I use the gun offsets
		//and the length_dir here
		//to offset the spawn position
		//for bullets so that it spawns
		//at the tip of the gun's sprite.
		//100 is the distance from the 
		//gun's origin that the bullet spawns at.
		//We also pass the player's current damage value
		//to the bullet.
        var bullet = instance_create_layer(x + lengthdir_x(100 + gun_x_offset, gun_angle), y + gun_y_offset + lengthdir_y(100, gun_angle), "Instances", obj_bullet_player, {damage : damage});
        
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
	

//LD Montello
//Play laser sfx
audio_play_sound_on(global.sfx_emitter, snd_laser_shoot, false, 1);


//LD Montello
//if we haven't
//done enough bursts
//then reset this alarm.
if (cur_burst_count > 0)
{
	alarm_set(0, burst_interval);
}