/// @description Insert description here
// You can write your code in this editor

//Davis Spradling
//main_player object controls the main player
//used throughout the game

//Davis Spradling
//Initalize player moveSpeed (how fast they are)
moveSpeed = 4;

//Davis Spradling
//Initialize players coordinate move spped
movementSpeedX = 0;
movementSpeedY = 0;

//Davis Spradling
//Initalize main players health
mainPlayerHealth = 100;

//Davis Spradling
//Initialize player level, start experience, and levelUpExperience
playerLevel = 1;
currentPlayerExp = 0;
levelUpPlayerExp = 100;

//Davis Spradling
//Initalize timer for shooting
shoot_timer = 0; 
shoot_interval = 120;

//Davis Spradling
//Initialize how fast bullet will travel
bullet_speed = 10;

//Davis Spradling
//Initalize number of bullets fired
player_bullets_fired = 3


//Davis Spradling 
//Functions

//Davis Spradling
//Upgrade player level
increment_level = function() {
    playerLevel += 1
};

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
decrement_main_players_health = function(){
	mainPlayerHealth += 1
}

//Davis Spradling
//Decrement main players health 
increment_bullets_fired = function(){
	player_bullets_fired += 1
}

increment_bullets_speed = function(){
	bullet_speed += 3
}



