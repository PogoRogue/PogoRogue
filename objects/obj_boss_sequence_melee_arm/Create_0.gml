/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

melee_end = instance_nearest(x, y, obj_boss_sequence_melee);
draw_hp = false;

if instance_exists(obj_player) {
	depth = obj_player.depth - 11;	
}
