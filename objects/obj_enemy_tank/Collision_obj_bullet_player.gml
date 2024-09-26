/// @description Decrement health when shot.
// You can write your code in this editor


//LD Montello
//bullets have a damage
//variable and we'll grab that
//by referring to the keyword "other" which would be the bullet.
decrement_health(other.damage);

//LD Montello
//Decrement the bullet
//health, this is what
//makes piercing work later.
other.decrement_bullet_health();