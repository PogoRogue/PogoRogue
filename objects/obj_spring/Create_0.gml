sprung_time = 30;
init_sprung_time = sprung_time;

state_unsprung = function() {
	image_speed = 0;
	image_index = 0;
}

state_springing = function () {
	image_speed = 1;
	
	if scr_Animation_Complete() {
		state = state_sprung;	
		image_speed = 0;
	}
}

state_sprung = function() {
	image_index = sprite_get_number(sprite_index)-1;
	
	if sprung_time > 0 {
		sprung_time -= 1;
	}else {
		state = state_retract;
		sprung_time = init_sprung_time;
	}
}

state_retract = function() {
	image_speed = -1;
	
	if floor(image_index) = 0 {
		state = state_unsprung;	
	}
}

state = state_unsprung;

adjusted = false;