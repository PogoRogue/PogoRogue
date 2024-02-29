/// @description Player collision
if (place_meeting(x,y,obj_player) or place_meeting(x,y,obj_player_mask)) {
	
	if (room == room_proc_gen_test) {
		room_persistent = false;
		switch (global.phase) {
			case 1:
				room = room_boss_1;
				break;
			case 2:
				room = room_boss_2;
				break;
			case 3:
				global.phase = 1;
				room = obj_menu;
				break;
		}	
	}
	else {
		global.phase++;
		room_goto(room_proc_gen_test)
	}
}