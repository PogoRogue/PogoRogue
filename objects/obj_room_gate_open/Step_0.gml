/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if closed = false and (obj_player.y < y - 1 or obj_player.x < x and obj_player.y < y or obj_player.x > x + sprite_width and obj_player.y < y) {
	closed = true;	
	image_speed = -1;
	audio_play_sound(snd_gate_sliding,0,false);
	mask_index = spr_gate_close_new;
	
	if room = room_tutorial {
		switch (tutorial_num) {
			case 1: obj_drone_tutorial.end_x = 208; obj_drone_tutorial.end_y = 4608; obj_drone_tutorial.still = false; obj_drone_tutorial.retract_current_bubble = true; obj_drone_tutorial.y_up = true; obj_drone_tutorial.y_add = 0; break;
			case 2: obj_drone_tutorial.end_x = 608-32; obj_drone_tutorial.end_y = 2624; obj_drone_tutorial.still = false; obj_drone_tutorial.retract_current_bubble = true; obj_drone_tutorial.y_up = true; obj_drone_tutorial.y_add = 0; break;
		}
	}
}

if floor(image_index) <= 1 and image_speed != 0 {
	image_index = 0;
	image_speed = 0;
	audio_play_sound(snd_gate_closed,0,false);
}

if remove_index = true and image_speed = 0 and floor(image_index) > 2 {
	mask_index = spr_nothing;
}else if mask_index != spr_gate_close_new {
	mask_index = sprite_index	
}