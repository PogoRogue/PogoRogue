function scr_Death_Screen(win){
	draw_sprite(spr_deathscreen_new,win,x,y);
	
	//weapons
	for(i = 0; i < array_length(global.all_weapons_used); i++) {
		if (i < 12) {
			draw_sprite(global.all_weapons_used[i],0,x+25+(36*(i%4)),y-74+(floor(i/4)*17));
		}
	}
	
	//actives
	for(i = 0; i < array_length(global.all_actives_used); i++) {
		if (i < 10) {
			draw_sprite(global.all_actives_used[i],3,x+22+(28*(i%5)),y+5+(floor(i/5)*25));
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
			if i < array_length(global.all_buff_numbers) {
				if global.all_buff_numbers[i] > 1 {
					scr_Draw_Text_Outlined(x+18+(20*(i%7))-6,y+75+4+(floor(i/7)*17),global.all_buff_numbers[i],c_white);
				}
			}
		}
	}
	
	
	
	draw_set_font(fnt_combo2);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	
	scr_Draw_Text_Outlined(x-78-52,y-75,"Best Combo:  ",c_white);
	scr_Draw_Text_Outlined(x-78-52,y-37,"Enemies Killed:  ",c_white);
	scr_Draw_Text_Outlined(x-78-52,y,"Coins:  ",c_white);
	scr_Draw_Text_Outlined(x-78-52,y+37,"Time:  ",c_white);
	scr_Draw_Text_Outlined(x-78-52,y+74,"Area:  ",c_white);
	scr_Draw_Text_Outlined(x-78-52,y+110,"Seed:  ",c_white);
	
	draw_set_halign(fa_right);
	
	scr_Draw_Text_Outlined(x-78+52,y-75, string(global.current_best_combo),c_white);
	scr_Draw_Text_Outlined(x-78+52,y-37,string(global.current_enemies_killed),c_white);
	scr_Draw_Text_Outlined(x-78+52,y,string(global.current_total_coins),c_white);
	scr_Draw_Text_Outlined(x-78+52,y+37,scr_Convert_Frames_To_Time(global.current_time_elapsed),c_white);
	if room = room_proc_gen_test {
		scr_Draw_Text_Outlined(x-78+52,y+74," " + string(global.current_area_reached),c_white);
	}else if room = room_boss_1 {
		scr_Draw_Text_Outlined(x-78+52,y+74," Boss 1",c_white);
	}else if room = room_boss_2 {
		scr_Draw_Text_Outlined(x-78+52,y+74," Boss 2",c_white);
	}else if room = room_boss_3 {
		scr_Draw_Text_Outlined(x-78+52,y+74," Boss 3",c_white);
	} 
	scr_Draw_Text_Outlined(x-78+52,y+110,string(current_seed),c_white);
	
	draw_set_halign(fa_center);
	
	
	//new best
	if (global.current_best_combo > global.init_combo_highscore) { //combo
		draw_set_font(fnt_itemdescription2);
		scr_Draw_Text_Outlined(x-78,y-60,"(New Best!)",make_color_rgb(237,225,158));//+15
	}
	
	if (global.current_enemies_killed > global.init_enemies_highscore) { //enemies
		draw_set_font(fnt_itemdescription2);
		scr_Draw_Text_Outlined(x-78,y-22,"(New Best!)",make_color_rgb(237,225,158));
	}
	
	if (global.current_total_coins > global.init_coins_highscore) { //coins
		draw_set_font(fnt_itemdescription2);
		scr_Draw_Text_Outlined(x-78,y+15,"(New Best!)",make_color_rgb(237,225,158));
	}
	
	if best_time = true { //time
		draw_set_font(fnt_itemdescription2);
		scr_Draw_Text_Outlined(x-78,y+52,"(New Best!)",make_color_rgb(237,225,158));
	}
	
	if global.area_2_reached = 1 or global.area_3_reached = 1 { //area
		draw_set_font(fnt_itemdescription2);
		//scr_Draw_Text_Outlined(x-78,y+89,"(New Best!)",make_color_rgb(237,225,158));
	}
}

draw_set_color(c_white);