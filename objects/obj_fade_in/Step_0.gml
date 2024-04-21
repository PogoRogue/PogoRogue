if alpha > 0 {
	alpha -= 0.05;	
}
	
if alpha < 1 {

	if x_offset < 384 {
		x_offset += spd;
	}else {
		instance_destroy();	
		if room = room_proc_gen_test and global.phase = 2 {
			global.door_color = "blue";	
		}else if room = room_proc_gen_test and global.phase = 3 {
			global.door_color = "grey";	
		}
	}

	if spd < 8 {
		spd += 0.25;	
	}
}