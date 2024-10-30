if room != room_proc_gen_test {
	if !scr_In_Array(global.boss_rooms,room) {
		sprite_index = spr_portal_new;
	}else {
		sprite_index = spr_portal_new2;
	}
}

depth += 1;
colliding = false;

if scr_In_Array(global.boss_rooms,room) {
	image_xscale = 0;
	image_yscale = 0;
	x += 48;
	y += 52;
}

angle = 0;