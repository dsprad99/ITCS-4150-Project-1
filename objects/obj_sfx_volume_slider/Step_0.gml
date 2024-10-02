/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//LD Montello
//Using the slider's current
//value set the global volume
//for the sfx channel
audio_emitter_gain(global.sfx_emitter, cur_value)