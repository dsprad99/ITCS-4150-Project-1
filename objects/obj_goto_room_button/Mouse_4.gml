/// @description Insert description here
// You can write your code in this editor

//LD Montello
//Reset the global vars
//before the player
//switches rooms
//so that if they quit
//early they don't carry
//over their stats from the
//previous game.
global.reset_global_vars()

//LD Montello
//I duplicated the button object they were 
//using and made a base so you can just modify
//the variable in the instance in the room
//to say which room you want it to go to.
room_goto(room_to_goto)