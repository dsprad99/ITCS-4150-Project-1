/// @description Destroy enemy bullets if we hit them
// You can write your code in this editor


//LD Montello
//Destroy enemy bullets if our bullet hits them.
instance_destroy(other.id);

//Decrement bullet health
decrement_bullet_health();

//TODO:
//Add a unique particle effect to the
//game for this.