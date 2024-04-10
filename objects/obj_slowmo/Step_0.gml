if obj_player.pickup_1 = obj_player.pickup_slowmo {  
	key_select = global.key_pickup_1_pressed;
}else if obj_player.pickup_2 = obj_player.pickup_slowmo {  
	key_select = global.key_pickup_2_pressed;
}else {
	key_select = 0;
}

if !instance_exists(obj_sound_controller) {
	instance_create_depth(x,y,depth,obj_sound_controller);
}

if slow_time = true and room_speed > slow_mo_speed {
	room_speed -= 1;
}else if slow_time = true {
	slow_time = false;
	alarm[0] = time;
}

if speedup_time = true and room_speed < init_room_speed {
	room_speed += 1;
}else if speedup_time = true {
	instance_destroy();
}

if key_select and slow_time = false {
	speedup_time = true;
}

back_frames += 0.5;
front_frames += 1/3;

if time_left > 0 {
	time_left -= 1;	
}