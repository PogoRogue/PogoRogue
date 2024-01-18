function scr_Death_Screen(win){
	draw_sprite(spr_deathscreen,win,x,y);
	
	//weapons
	for(i = 0; i < array_length(global.all_weapons_used); i++) {
		if (i < 12) {
			draw_sprite(global.all_weapons_used[i],0,x+25+(36*(i%4)),y-74+(floor(i/4)*17));
		}
	}
	
	//actives
	for(i = 0; i < array_length(global.all_actives_used); i++) {
		if (i < 21) {
			draw_sprite(global.all_actives_used[i],2,x+18+(20*(i%7)),y+1+(floor(i/7)*17));
		}
	}
	
	//passives
	for(i = 0; i < array_length(global.all_passives_used); i++) {
		if (i < 21) {
			draw_sprite(global.all_passives_used[i],0,x+18+(20*(i%7)),y+75+(floor(i/7)*17));
		}
	}
	
	draw_set_font(fnt_combo2);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	
	scr_Draw_Text_Outlined(x-128,y-75,"Best Combo:  " + string(global.current_best_combo),c_white);
	scr_Draw_Text_Outlined(x-128,y-38,"Enemies Killed:  " + string(global.current_enemies_killed),c_white);
	scr_Draw_Text_Outlined(x-128,y-1,"Coins Collected:  " + string(global.current_total_coins),c_white);
	scr_Draw_Text_Outlined(x-128,y+36,"Area Reached:  " + string(global.current_area_reached),c_white);
	scr_Draw_Text_Outlined(x-128,y+73,"Time Elapsed:  " + scr_Convert_Frames_To_Time(global.current_time_elapsed),c_white);
}