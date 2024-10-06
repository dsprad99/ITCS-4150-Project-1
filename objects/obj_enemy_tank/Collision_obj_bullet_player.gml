/// @description Decrement health when shot.
// You can write your code in this editor

//LD Montello
//Make sure we aren't taking damage
//more than once when we're only actually
//colliding once.
if (!array_contains(ignored_bullets, other))
{
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
	
	//LD Montello
	//Add this bullet to our list
	//of bullets that should be ignored.
	array_push(ignored_bullets, other);
	//As far as I can tell, game maker
	//has garbage collection completely
	//abstracted so we don't need to worry about
	//it. I tried researching this but I need
	//to remember to ask.
}

