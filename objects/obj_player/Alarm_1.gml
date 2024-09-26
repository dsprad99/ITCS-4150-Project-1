/// @Health Regen timer
// You can write your code in this editor

//LD Montello
//Add the regen value to the player's health
//if the game is paused don't regen.
if (global.game_state != GAME_STATE.PAUSED)
set_health(mainPlayerHealth + health_regen_amount)

//LD Montello
//calculates exact value to
//result in time_between_regens in seconds
//to set the alarm.
alarm_set(1, game_get_speed(gamespeed_fps) * time_between_regens)