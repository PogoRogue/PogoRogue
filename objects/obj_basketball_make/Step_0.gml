if place_meeting(x,y,obj_volleyball_small_2) {
	with instance_place(x,y,obj_volleyball_small_2) {
		if vspeed <= 0 {
			other.touched_by_obj = self.id;
		}else if other.touched_by_obj != self.id {
			if x < other.bbox_right and x > other.bbox_left {
				other.make = true;
			}else {
				other.touched_by_obj = self.id;
			}
		}
	}
}

if instance_exists(touched_by_obj) {
	if touched_by_obj.bbox_top > bbox_bottom+16 or touched_by_obj.bbox_bottom < bbox_top-16 {
		touched_by_obj = noone;
	}
}

if make = true {
	if !audio_is_playing(snd_cheer) {
		audio_play_sound(snd_cheer,0,false);
	}
	make = false;
	touched_by_obj = noone;
	with instance_nearest(x,y,obj_basketball_hoop) {
		if image_xscale = 1 and !instance_exists(obj_confetti) {
			repeat(30) {
				instance_create_depth(x-58,y+38,depth-1,obj_confetti);
			}
		}else if image_xscale = -1 {
			repeat(30) {
				instance_create_depth(x+58,y+38,depth-1,obj_confetti);
			}
		}
	}
	
	//achievements
	if basket_num = 1 {
		if global.steam_api = true {//Free throw
			if !steam_get_achievement("ACHIEVEMENT_FREETHROW") {
				steam_set_achievement("ACHIEVEMENT_FREETHROW");
			}
		}
	}else if basket_num = 2 { //Ball is life
		if global.steam_api = true {
			if !steam_get_achievement("ACHIEVEMENT_BALLISLIFE") {
				steam_set_achievement("ACHIEVEMENT_BALLISLIFE");
			}
		}
	}
}