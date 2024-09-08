/// @description Insert description here
// You can write your code in this editor

//Davis Spradling
//main_player object controls the main player
//used throughout the game

//Davis Spradling
//Initalize player moveSpeed (how fast they are)
moveSpeed = 4;

//LD Montello
//this is a bullets health value
//and is decremented when it hits an enemy.
//this will be one of the random upgrades 
//you can choose. (Incrementing the piercing count).
piercing_count = 1;

//LD Montello
//Used to determine the rotation
//of the gun when drawn in the Draw call.
gun_angle = direction;

//Davis Spradling
//Initalize main players health
mainPlayerHealth = 100;

//Davis Spradling
//Initialize player level, start experience, and levelUpExperience
//LD Montello - changed the name to just be level.
level = 0;

//LD Montello
//Setup xp variable and functions for it
//NEVER SET XP USING xp = #; 
//You should always use the XP setter
//so that the setter calls the 
//function to check for leveling up.
xp = 0;

//LD Montello
//Xp Setter.
set_xp = function(_xp){
	xp = _xp;
	
	//We always calculate level
	//whenever xp is modified.
	calc_level(xp);
}


//LD Montello
//add xp, should be used
//whenever you kill an enemy.
add_xp = function(_xp_to_add){
	set_xp(xp + _xp_to_add);
}


//LD Montello
//This is where James 
//can tweak the Leveling algorithm
//I just setup the method for him.
calc_level = function(_xp){
	//currently the level is just
	//the cube root of xp
	//Regardless of your formula
	//you should always use floor
	//to round down to the nearest integer.
	//in this formula 1,000,000 xp = level 100
	//5 xp is level 1.
	level = floor(power(_xp, 1/3));
}

//Davis Spradling
//Initalize timer for shooting
shoot_timer = 0; 
shoot_interval = 120;

//Davis Spradling
//Initialize how fast bullet will travel
bullet_speed = 10;

//Davis Spradling
//Initalize number of bullets fired
player_bullets_fired = 1


//Davis Spradling 
//Functions

//LD Montello
//I removed the 
//increment level function and 
//replaced it with a getter
//because we don't modify level
//directly and instead just
//let the xp modify it every 
//time xp is changed.


//Davis Spradling
//Increment fire rate through decrementing interval of firing
decrement_shoot_interval = function(){
	shoot_interval -= 10;
};

//Davis Spradling
//Increment how fast main player is.
increment_movement_speed = function(){
	moveSpeed += 1
}

//Davis Spradling
//Increment main players health
increment_main_players_health = function(){
	mainPlayerHealth += 1
}

//Davis Spradling
//Decrement main players health 
decrement_main_players_health = function(damage){
	mainPlayerHealth -= damage
	
	//LD Montello
	//If the player has lost enough 
	//health, kill them.
	if (mainPlayerHealth <= 0)
	{
		kill();
	}
}

//Davis Spradling
//Increment bullets fired in shotgun spread
increment_bullets_fired = function(){
	player_bullets_fired += 1
}

increment_bullets_speed = function(){
	bullet_speed += 3
}

//LD Montello
//Use when choosing the upgrade
//for piercing.
set_piercing_count = function(count)
{
	piercing_count = count;
}


//LD Montello
//Called when the player is killed.
kill = function()
{
	//TODO:
	//Run some sort of code that kills
	//the player and displays some UI about it.
	//Also play a VFX for the explosion.
}

//LD Montello

#region gun animation parameters


//Where LD Learned this:
//https://www.reddit.com/r/gamemaker/comments/bl89xg/draw_sprite_ext_doesnt_animate_sprite/
gun_sprite_fps = 10;
gun_sprite_index = 0;

//get the speed we need to spread
//our frames over the game's frame rate.
gun_sprite_speed = gun_sprite_fps / 60;

//get the number of frames.
gun_sprite_number = sprite_get_number(spr_gun_fire);

do_fire_animation = false;

did_play_fire_animation = false;

#endregion