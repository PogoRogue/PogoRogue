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

if alpha > -0.5 and alpha_up = false {
	alpha -= 0.025;
}else if alpha <= -0.5 and alpha_up = false {
	if splash_num < max_splash_num {
		alpha_up = true;
	}
	splash_num += 1;
}

if splash_num > max_splash_num {
	if global.tutorial_completed = true {
		scr_Room_Transition(room_menu);
	}else {
		scr_Room_Transition(room_tutorial);
	}	
	//instance_create_depth(x,y,depth-10000,obj_darkscreen_transition);
}
//steam_clear_achievement("ACHIEVEMENT_REVOLUTION");
/*steam_clear_achievement("ACHIEVEMENT_10X");
steam_clear_achievement("ACHIEVEMENT_25X");
steam_clear_achievement("ACHIEVEMENT_100X");
steam_clear_achievement("ACHIEVEMENT_200X");
steam_clear_achievement("ACHIEVEMENT_FREETHROW");
steam_clear_achievement("ACHIEVEMENT_BALLISLIFE");
/*steam_clear_achievement("ACHIEVEMENT_3D");
steam_clear_achievement("ACHIEVEMENT_BANDIT");
steam_clear_achievement("ACHIEVEMENT_DOGO");
steam_clear_achievement("ACHIEVEMENT_ROBO");
steam_clear_achievement("ACHIEVEMENT_KUNKUN");
steam_clear_achievement("ACHIEVEMENT_NONA");