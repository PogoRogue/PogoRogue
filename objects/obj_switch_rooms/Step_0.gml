/// @description switch rooms
if (instance_exists(obj_player)) {
	if (keyboard_check_pressed(vk_alt)) and obj_player.dead = false /*|| gamepad_button_check_pressed(0,gp_shoulderlb))*/ {
		if (room = room_proc_gen_test || room = room_sprite_level_test) {
			//game_restart(); Do nothing. This breaks proc gen shop since tab is also the shop switch button
		} else if(room == room_boss_1) {
		
		} else if (room = room_sam_movement) {
			room = room_gym_enemy;
		} else if (room = room_gym_enemy) {
			room = room_fight_1;
		} else if (room = room_fight_1) {
			room = room_proc_gen_test;
		} else if (room = room_shop) {
			//room = global.last_room;
		} 
		
		if (room = room_gameplay_video) {
			room = room_boss_1;
		} else if (room = room_proc_gen_test) {
			room = room_boss_2;
			global.phase = 2;
		}
	}
}