/*if instance_exists(obj_ground) {
	if place_meeting(x,y,obj_ground) {
		if room = room_proc_gen_test {
			depth = instance_nearest(x,y,obj_ground).depth + 1;	
		}else if room = room_boss_1 {
			depth = 300;	
		}else {
			depth = 450;	
		}
	}else {
		depth = obj_player.depth + 1;	
	}
}else {
	depth = obj_player.depth + 1;	
}

if place_meeting(x,y,obj_chest) {
	depth = instance_nearest(x,y,obj_chest).depth - 1;
}

if place_meeting(x,y,obj_weapons_station) {
	depth = instance_place(x,y,obj_weapons_station).depth - 1;
}

if place_meeting(x,y,obj_seeding_station) {
	depth = instance_place(x,y,obj_seeding_station).depth - 1;
}

if place_meeting(x,y,obj_spring) {
	depth = instance_nearest(x,y,obj_spring).depth - 1;
}

if place_meeting(x,y,obj_ground_oneway) {
	depth = instance_nearest(x,y,obj_ground_oneway).depth - 1;
}*/

if fade_out = true {
	image_alpha -= 0.025;
	
	if image_alpha <= 0 {
		instance_destroy();
	}
}