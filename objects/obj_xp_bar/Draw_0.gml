/// @description Insert description here
// You can write your code in this editor

draw_self()


#region Draw XP bar.
//LD Montello
//Draw the xp bar to it's filled amount.
//draw_healthbar's fill amount should always
//be a 0-100 value, we just divide current xp
//by the amount of xp we need to reach the next
//level and that gives us a 0-1 value,
//we multiply that by 100 and we have our
//fill amount for the xp bar.
//fill_amount = obj_player.xp / obj_player.get_xp_to_reach_level(obj_player.level + 1) * 100
//This was how it was calculated,
//but we animate it now so it's calculated in step.


//Davis Spradling 
//Bar to show progress player has made through the wave
//LD Montello moved this and changed 
//it so that the health bar is animated after Davis set
//it up.
bar_width = 1000;    
bar_height = 20;    
bar_x = camera_get_view_x(cam) + 670;  
bar_y =  camera_get_view_y(cam) + 995;  

//LD Montello
//Draw the xp bar to it's filled amount.
//draw_healthbar's fill amount should always
//be a 0-100 value, we just divide current xp
//by the amount of xp we need to reach the next
//level and that gives us a 0-1 value,
//we multiply that by 100 and we have our
//fill amount for the xp bar.
//fill_amount = obj_player.xp / obj_player.get_xp_to_reach_level(obj_player.level + 1) * 100
//This was how it was calculated,
//but we animate it now so it's calculated in step.



draw_healthbar(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, cur_xp_fill, c_black, c_white, c_white, 0, true, false);
#endregion

#region draw LVL. Text

//LD Montello
//Set the font
//Make the text pivot be the center of the text.
draw_set_font(fnt_gamecuben)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

//LD Montello
//Draw current level on the level up bar.
//We divide the bar_height by 4 because
//the vertical alignment is middle.
draw_text_transformed_color(bar_x + 140, bar_y - bar_height, "LVL." + string(lvl_to_display), lvl_text_scale, lvl_text_scale, lvl_text_rot, lvl_text_color, lvl_text_color, lvl_text_color, lvl_text_color, 1)

//Go back to default alignment.
draw_set_valign(-1)
draw_set_halign(-1)
//Go back to default font
draw_set_font(-1)


#endregion

#region Draw dash regen


//LD Montello
//Set the font
//Make the text pivot be the center of the text.
draw_set_font(fnt_gamecuben)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

var dash_regen_x = camera_get_view_x(cam) + 800;
var dash_regen_y = camera_get_view_y(cam) + 890;

//Davis Spradling
//Draw the Jump Regen text 
draw_text_transformed_color(dash_regen_x, dash_regen_y, "Dash Regen",  24 / 72, 24 / 72, 0, c_white, c_white, c_white, c_white, 1);

//Davis Spradling
//Draw the regen bar that calculates regen time left
var x_regen=dash_regen_x+150;       
var y_regen=dash_regen_y-15;        
var width_regen = 200;  
var height_regen = 30;  
draw_set_color(c_black); 
//This will act as a constant background the bar that moves 
draw_rectangle(x_regen, y_regen, x_regen + width_regen, y_regen+height_regen, false);
var cooldown_ratio = obj_player.dash_cooldown/120; 
draw_set_color(c_green); 
//This is the part that will move according to cool down value which is generated through a ratio
draw_rectangle(x_regen, y_regen, x_regen+(1-cooldown_ratio)*width_regen, y_regen+height_regen, false);

//Go back to default alignment.
draw_set_valign(-1)
draw_set_halign(-1)
//Go back to default font
draw_set_font(-1)

#endregion