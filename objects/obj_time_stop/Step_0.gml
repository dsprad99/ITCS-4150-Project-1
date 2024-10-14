/// @description Insert description here
// You can write your code in this editor
global.soundSpeed = game_get_speed(gamespeed_fps)/60


for (var i = 0; i < array_length(soundlist);i++){
	if (audio_is_playing(soundlist[i])){
		audio_sound_pitch(soundlist[i],global.soundSpeed)
	}
}


