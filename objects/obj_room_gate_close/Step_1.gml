/// @description Insert description here
// You can write your code in this editor
with obj_player_mask {
	if place_meeting(x,y+(parent_index.vspeed),other) {
		show_debug_message("place_meeting");
		if (obj_player.enemies_killed_in_room >= other.enemies_required) {
			obj_player.enemies_killed_in_room = 0;
			instance_destroy(other);
		}
	}
}