/// @description Wave spawn timer
// You can write your code in this editor


//Spawn enemies.
spawn_wave_on_edge(cur_wave_size);


//reset the alarm to go off in time between waves
alarm_set(0, time_between_waves);