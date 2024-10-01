/// @description Insert description here
// You can write your code in this editor

//LD Montello
//Check if instance exists and then
//Set position to match parents position
//every frame
//NOTE: There is a red underline here
//because Game Maker's syntax
//doesn't allow for an instance to be
//a variable definition datatype.
//Referencing the id itself is how you
//usually referenece that sepcific 
//instance and so it allows us to
//pass it here and it never actually
//produces an error. It is simply
//one of the quirks of how GML works.
if (instance_exists(parent))
{
	x = parent.x;
	y = parent.y;
}
