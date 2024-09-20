/// @description Hit by enemy bullet
// You can write your code in this editor

//LD Montello
//recieve the damage from the enemy bullet
//decrement_main_players_health(other.damage);
decrement_main_players_health(10);

//Destroy enemy bullet.
instance_destroy(other.id);