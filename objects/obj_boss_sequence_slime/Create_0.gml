/// @description Instantiate variables

controller = instance_nearest(x, y, obj_boss_sequence);
current_sprite = spr_boss2_slime_full;

if instance_exists(obj_player) {
	depth = obj_player.depth - 5;	
}