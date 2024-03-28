if obj_player.pickup_1 = obj_player.pickup_parachute {  
	key_select = global.key_pickup_1;
}else if obj_player.pickup_2 = obj_player.pickup_parachute {  
	key_select = global.key_pickup_2;
}else {
	key_select = 0;
}

x = obj_player.x+lengthdir_x(22,obj_player.angle+90);
y = obj_player.y+lengthdir_y(22,obj_player.angle+90);

image_angle = obj_player.angle + (angle_add*6);
	
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

if !key_select and retract = false and opened = true or obj_player.state != obj_player.state_parachute and retract = false and opened = true {
	retract = true;
	image_index = sprite_get_number(sprite_index)-1;
}

if retract = true {
	with obj_player {
		if state = state_parachute {
			state = state_free;	
		}
	}
	image_speed = -1;
	if floor(image_index) <= 1 {
		instance_destroy();	
	}
	
	if angle_add < 0 {
		angle_add += 0.25;
	}else if angle_add > 0 {
		angle_add -= 0.25;
	}
}

if decrease_arrows_alpha {
	arrows_alpha -= 0.05;
}