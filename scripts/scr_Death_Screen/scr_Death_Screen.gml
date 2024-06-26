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
			
			//numbers of each passive
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_set_font(fnt_itemdescription2);
			if global.all_buff_numbers[i] > 1 {
				scr_Draw_Text_Outlined(x+18+(20*(i%7))-6,y+75+4+(floor(i/7)*17),global.all_buff_numbers[i],c_white);
			}
		}
	}
	
	
	
	draw_set_font(fnt_combo2);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	scr_Draw_Text_Outlined(x-78,y-74,"Best Combo:  " + string(global.current_best_combo),c_white);
	scr_Draw_Text_Outlined(x-78,y-36,"Enemies Killed:  " + string(global.current_enemies_killed),c_white);
	scr_Draw_Text_Outlined(x-78,y-2,"Coins Collected:  " + string(global.current_total_coins),c_white);
	scr_Draw_Text_Outlined(x-78,y+34,"Time:  " + scr_Convert_Frames_To_Time(global.current_time_elapsed),c_white);
	scr_Draw_Text_Outlined(x-78,y+70,"Area Reached:  " + string(global.current_area_reached),c_white);
	scr_Draw_Text_Outlined(x-78,y+106,"Seed:  " + string(current_seed),c_white);
	
	
	//new best
	if (global.current_best_combo > global.init_combo_highscore) { //combo
		draw_set_font(fnt_itemdescription2);
		scr_Draw_Text_Outlined(x-78,y-59,"(New Best!)",make_color_rgb(237,225,158));//+15
	}
	
	if (global.current_enemies_killed > global.init_enemies_highscore) { //enemies
		draw_set_font(fnt_itemdescription2);
		scr_Draw_Text_Outlined(x-78,y-21,"(New Best!)",make_color_rgb(237,225,158));
	}
	
	if (global.current_total_coins > global.init_coins_highscore) { //coins
		draw_set_font(fnt_itemdescription2);
		scr_Draw_Text_Outlined(x-78,y+13,"(New Best!)",make_color_rgb(237,225,158));
	}
	
	if best_time = true { //time
		draw_set_font(fnt_itemdescription2);
		scr_Draw_Text_Outlined(x-78,y+49,"(New Best!)",make_color_rgb(237,225,158));
	}
	
	if global.area_2_reached = 1 or global.area_3_reached = 1 { //area
		draw_set_font(fnt_itemdescription2);
		scr_Draw_Text_Outlined(x-78,y+85,"(New Best!)",make_color_rgb(237,225,158));
	}
}

draw_set_color(c_white);