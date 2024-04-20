key_next = global.key_select;

if key_next {
	if splash_num <= max_splash_num {
		if splash_num < max_splash_num {
			alpha = 0;
			alpha_up = true;
		}
		splash_num += 1;
	}
}

if alpha < 3 and alpha_up = true {
	alpha += 0.025;
}else if alpha >= 3 and alpha_up = true {
	alpha_up = false;
	alpha = 3;
}

if alpha > 0 and alpha_up = false {
	alpha -= 0.025;
}else if alpha <= 0 and alpha_up = false {
	if splash_num < max_splash_num {
		alpha_up = true;
	}
	splash_num += 1;
}

if splash_num > max_splash_num {
	scr_Room_Transition(room_menu);
	
}