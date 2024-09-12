if x_offset > 0 {
	x_offset -= spd;
}else if transitioned = false {
	alarm[0] = 10;
	transitioned = true;
}

if x_offset <= 124 {
	if spd > 0 {
		spd -= 0.25;	
	}
}

if next_room = room_proc_gen_test {
	global.show_tips_screen = true;	
}