alarm[0] = 10;
scale = 4;

if room = room_tutorial or room = room_proc_gen_test and global.phase <= 1 or room = room_starting_area  {
	instance_destroy();	
}

if room = room_boss_3 {
	scale = 2.5;	
}

angle = 0;