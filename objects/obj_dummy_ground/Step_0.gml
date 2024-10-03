/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(obj_player_flames_upward) or obj_player.state = obj_player.state_firedash 
or instance_exists(obj_blink_box_strike)) {
	mask_index = spr_nothing;
}else if !place_meeting(x,y,obj_volleyball_small_2) {
	mask_index = sprite_index;
}