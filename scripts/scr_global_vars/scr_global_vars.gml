//LD Montello
//Set all global variables here.

#region constants

//LD Montello
//Declare global color variables
//use # because these are Hex colors.
global.neon_cyan = #5fffe4;
global.neon_magenta = #ff1493;
global.neon_lime = #a6fd29;

//LD Montello
//number of waves required to win.
global.waves_to_win = 50;

#endregion

#region mutables

//LD Montello
//used to store how many enemies we've
//killed. This will tell us when to spawn the
//next wave.
global.enemies_killed = 0;


//LD Montello
//enemies_killed Setter.
global.set_enemies_killed = function(_enemies){
	global.enemies_killed = _enemies;
	
	//We always calculate if we should
	//spawn another wave
	//based on number of enemies killed.
	if (instance_exists(obj_spawner))
	{
		obj_spawner.calc_should_spawn_wave(_enemies);	
	}
}

//Current wave the player 
//has reached. 
global.cur_wave = 0;

//LD Montello
//Reset global vars when the main_room starts.
global.reset_global_vars = function()
{
	global.enemies_killed = 0;
	global.cur_wave = 0;
}


#endregion