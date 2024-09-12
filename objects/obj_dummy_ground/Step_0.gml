/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if instance_exists(obj_player_flames_upward) or obj_player.state = obj_player.state_firedash {
	mask_index = spr_nothing;
}else {
	mask_index = sprite_index;
}