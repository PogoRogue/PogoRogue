x = obj_player.x;
y = obj_player.y;

image_angle = obj_player.angle + 180;
	
if floor(image_index) = 8 and ready_to_open = false {
	ready_to_open = true;
	image_speed = 0;
}

if ready_to_open = true and opening = false {
	opening = true;
	image_index = 8;
	image_speed = 1;
}

if scr_Animation_Complete() and opened = false {
	opened = true;
	image_speed = 0;
}

if obj_player.state != obj_player.state_dragster and retract = false and opened = true {
	retract = true;
	image_index = sprite_get_number(sprite_index)-1;
	audio_play_sound(snd_parachute_close,0,false);
}

if retract = true {
	image_speed = -2;
	if floor(image_index) <= 1 {
		instance_destroy();	
	}
	
	if angle_add < 0 {
		//angle_add += 0.25;
	}else if angle_add > 0 {
		//angle_add -= 0.25;
	}
}

if decrease_arrows_alpha {
	arrows_alpha -= 0.05;
}