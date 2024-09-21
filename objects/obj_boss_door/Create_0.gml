if room != room_proc_gen_test {
	sprite_index = spr_portal_new;
}

depth += 1;
colliding = false;

if room = room_boss_1 or room = room_boss_2 {
	image_xscale = 0;
	image_yscale = 0;
}