/// @description Hit by enemy bullet
// You can write your code in this editor

//LD Montello
//recieve the damage from the enemy bullet
decrement_main_players_health(other.damage);

//Destroy enemy bullet.
instance_destroy(other.id);