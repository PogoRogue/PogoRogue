center_x = 768/2;

//draw UI
if select_y = 0 {
	draw_sprite(spr_itemmenu_passives,select = 1,center_x-96,72);
	draw_sprite(spr_itemmenu_actives,select = 2,center_x,72);
	draw_sprite(spr_itemmenu_weapons,select = 3,center_x+96,72);
}else {
	draw_sprite(spr_itemmenu_passives,(select = 1)*2,center_x-96,72);
	draw_sprite(spr_itemmenu_actives,(select = 2)*2,center_x,72);
	draw_sprite(spr_itemmenu_weapons,(select = 3)*2,center_x+96,72);
}

//PASSIVES
if select = 1 {
	var item_selected = ((select_y-1)*4)+select_x;
	//grid
	for(xx = 0; xx < select_x_max; xx++) {
		for(yy = 0; yy < select_y_max; yy++) {
			var ii = (xx) + ((yy)*4);
			if page_num = 1 {
				draw_sprite(spr_item_slot_shop,(select_x-1 = xx and select_y-1 = yy)+(2*(ii<(array_length(global.all_buff_sprites)))),center_x-90+xx*60,128+yy*60);
			}else if page_num = 2 {
				draw_sprite(spr_item_slot_shop,(select_x-1 = xx and select_y-1 = yy)+(2*((ii+20)<(array_length(global.all_buff_sprites)))),center_x-90+xx*60,128+yy*60);
			}
		}
	}
	
	//draw arrows
	if page_num = 1 and array_length(global.all_buff_sprites) > 20 {
		draw_sprite(spr_settings_rightarrow_big,0,center_x+128,128+1.5*60);
	}else if page_num = 2 and array_length(global.all_buff_sprites) > 20 {
		draw_sprite(spr_settings_leftarrow_big,0,center_x-128,128+1.5*60);
	}
	
	//item sprites
	for (i = 0; i < array_length(global.all_buff_sprites); i++) {
		if page_num = 1 { 
			var xx = (center_x - 90) + (i % 4) * 60;
			var yy = 156 + floor(i / 4) * 60;
		}else if page_num = 2 { 
			var xx = (center_x - 90) + ((i-20) % 4) * 60;
			var yy = 156 + floor((i-20) / 4) * 60;
		}
		
		if page_num = 1 and i <= 19 
		or page_num = 2 and i > 19 {
			//name
			draw_set_font(global.lana);
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			
			scr_Draw_Text_Outlined(xx,yy-49,scr_Linebreak(global.all_buff_names[i],12,99),c_white);
			
			//sprite
			draw_sprite(global.all_buff_sprites[i],global.all_buff_sprites_index[i],xx,yy-27);
			
			//draw item description
			if i = item_selected-1 and page_num = 1 
			or (i-20) = item_selected-1 and page_num = 2 {
			
				var bubble_x = center_x-190;
				if select_x <= 2 {
					bubble_x = center_x-190;
				}else {
					var bubble_x = center_x+190;
				}
			
				if i > 15 and i < 20 or i > 35 {
					var y_offset = 0;//-60;
				}else {
					var y_offset  = 0;
				}
			
				if yy > 156 + (3 * 60) {
					yy -= 56;
				}
			
				scr_Draw_Passive_Description(bubble_x,yy+y_offset,global.all_buff_sprites[i],global.all_buff_sprites_index[i],global.all_buff_names[i],global.all_buff_descriptions[i],global.all_buff_stats[i],true,global.all_buff_costs[i]);
			}
	
			//numbers of each buff
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_set_font(global.lana);
			if global.all_buff_numbers[i] > 1 {
				scr_Draw_Text_Outlined(xx-8,yy-19,global.all_buff_numbers[i],c_white);
			}
		}
	}
	
	scr_Draw_Input_Prompt(center_x,(128+5*60)-18,19,"返回",make_color_rgb(180,82,82));
}

//ACTIVES
if select = 2 {
	var xx1 = center_x-86;
	var xx2 = center_x+86;
	var yy = 234;
	
	if num_of_pickups = 1 {
		scr_Draw_Pickup_Description(center_x,yy,pickup_1,1,true,global.all_pickup_costs[0]);
		draw_set_font(global.lana);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		if select_y = 1 {
			if synergy_slot_x = 1 {
				draw_sprite(spr_itemmenu_pickup_slot_synergy,4,center_x,yy);
				if global.synergy_slot_equipped1 = false {
					scr_Draw_Text_Outlined(center_x-32+2,yy+64,"Equip",c_white);
				}else {
					scr_Draw_Text_Outlined(center_x-32+2,yy+64,"Unequip",c_white);
					//draw_sprite_ext(spr_pickup_empty,2,center_x-32+2,yy+46,1,1,0,c_white,0.75);
				}
				scr_Draw_Input_UI(center_x-32+2,yy+76,18,0,global.lana,fa_center,fa_center);
			}else if synergy_slot_x = 2 {
				draw_sprite(spr_itemmenu_pickup_slot_synergy,5,center_x,yy);
				if global.synergy_slot_equipped2 = false {
					scr_Draw_Text_Outlined(center_x+32+2,yy+64,"Equip",c_white);
				}else {
					scr_Draw_Text_Outlined(center_x+32+2,yy+64,"Unequip",c_white);
					//draw_sprite_ext(spr_pickup_empty,2,center_x+32+2,yy+46,1,1,0,c_white,0.75);
				}
				scr_Draw_Input_UI(center_x+32+2,yy+76,18,0,global.lana,fa_center,fa_center);
			}
			if global.parent_synergy1.is_synergy = true {
				draw_sprite_ext(global.parent_synergy1.base_item_sprite_1,3,center_x-32+2,yy+46,1,1,0,c_white,1);
			}
			if global.parent_synergy1.is_synergy = true {
				draw_sprite_ext(global.parent_synergy1.base_item_sprite_2,3,center_x+32+2,yy+46,1,1,0,c_white,1);
			}
			
			if global.synergy_slot_equipped1 = true {
				draw_sprite_ext(spr_pickup_empty,2,center_x-32+2,yy+46,1,1,0,c_white,0.75);
			}
			if global.synergy_slot_equipped2 = true {
				draw_sprite_ext(spr_pickup_empty,2,center_x+32+2,yy+46,1,1,0,c_white,0.75);
			}
		}else  {
			if global.parent_synergy1.is_synergy = true {
				draw_sprite_ext(global.parent_synergy1.base_item_sprite_1,3,center_x-32+2,yy+46,1,1,0,c_white,1);
			}
			if global.parent_synergy1.is_synergy = true {
				draw_sprite_ext(global.parent_synergy1.base_item_sprite_2,3,center_x+32+2,yy+46,1,1,0,c_white,1);
			}
			
			if global.synergy_slot_equipped1 = true {
				draw_sprite_ext(spr_pickup_empty,2,center_x-32+2,yy+46,1,1,0,c_white,0.75);
			}
			if global.synergy_slot_equipped2 = true {
				draw_sprite_ext(spr_pickup_empty,2,center_x+32+2,yy+46,1,1,0,c_white,0.75);
			}
		}
	}else if num_of_pickups = 2 {
		scr_Draw_Pickup_Description(xx1-12,yy,pickup_1,1,true,global.all_pickup_costs[0]);
		scr_Draw_Pickup_Description(xx2+12,yy,pickup_2,2,true,global.all_pickup_costs[1]);
		
		draw_set_font(global.lana);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		if select_y = 2 {
			if synergy_slot_x = 1 {
				draw_sprite(spr_itemmenu_pickup_slot_synergy,4,xx1-12,yy);
				if !(global.item_1_pickup = pickup_2) {
					if global.synergy_slot_equipped1 = false {
						scr_Draw_Text_Outlined(xx1-12-32+2,yy+64,"Equip",c_white);
					}else {
						scr_Draw_Text_Outlined(xx1-12-32+2,yy+64,"Unequip",c_white);
						//draw_sprite_ext(spr_pickup_empty,2,xx1-12-32+2,yy+46,1,1,0,c_white,0.75);
					}
					scr_Draw_Input_UI(xx1-12-32+2,yy+76,18,0,global.lana,fa_center,fa_center);
				}
			}else if synergy_slot_x = 2 {
				draw_sprite(spr_itemmenu_pickup_slot_synergy,5,xx1-12,yy);
				if !(global.item_2_pickup = pickup_2) {
					if global.synergy_slot_equipped2 = false {
						scr_Draw_Text_Outlined(xx1-12+32+2,yy+64,"Equip",c_white);
					}else {
						scr_Draw_Text_Outlined(xx1-12+32+2,yy+64,"Unequip",c_white);
						//draw_sprite_ext(spr_pickup_empty,2,xx1-12+32+2,yy+46,1,1,0,c_white,0.75);
					}
					scr_Draw_Input_UI(xx1-12+32+2,yy+76,18,0,global.lana,fa_center,fa_center);
				}
			}else if synergy_slot_x = 3 {
				draw_sprite(spr_itemmenu_pickup_slot_synergy,4,xx2+12,yy);
				if !(global.item_3_pickup = pickup_1) {
					if global.synergy_slot_equipped3 = false {
						scr_Draw_Text_Outlined(xx2+12-32+2,yy+64,"Equip",c_white);
					}else {
						scr_Draw_Text_Outlined(xx2+12-32+2,yy+64,"Unequip",c_white);
						//draw_sprite_ext(spr_pickup_empty,2,xx2+12-32+2,yy+46,1,1,0,c_white,0.75);
					}
					scr_Draw_Input_UI(xx2+12-32+2,yy+76,18,0,global.lana,fa_center,fa_center);
				}
			}else if synergy_slot_x = 4 {
				draw_sprite(spr_itemmenu_pickup_slot_synergy,5,xx2+12,yy);
				if !(global.item_4_pickup = pickup_1) {
					if global.synergy_slot_equipped4 = false {
						scr_Draw_Text_Outlined(xx2+12+32+2,yy+64,"Equip",c_white);
					}else {
						scr_Draw_Text_Outlined(xx2+12+32+2,yy+64,"Unequip",c_white);
						//draw_sprite_ext(spr_pickup_empty,2,xx2+12+32+2,yy+46,1,1,0,c_white,0.75);
					}
					scr_Draw_Input_UI(xx2+12+32+2,yy+76,18,0,global.lana,fa_center,fa_center);
				}
			}
		}
		
		if num_of_pickups = 2 {
			if global.parent_synergy1.is_synergy = true {
				draw_sprite_ext(global.parent_synergy1.base_item_sprite_1,3,xx1-12-32+2,yy+46,1,1,0,c_white,1);
			}
			if global.parent_synergy1.is_synergy = true {
				draw_sprite_ext(global.parent_synergy1.base_item_sprite_2,3,xx1-12+32+2,yy+46,1,1,0,c_white,1);
			}
			if global.parent_synergy2.is_synergy = true {
				draw_sprite_ext(global.parent_synergy2.base_item_sprite_1,3,xx2+12-32+2,yy+46,1,1,0,c_white,1);
			}
			if global.parent_synergy2.is_synergy = true {
				draw_sprite_ext(global.parent_synergy2.base_item_sprite_2,3,xx2+12+32+2,yy+46,1,1,0,c_white,1);
			}
			
			if global.synergy_slot_equipped1 = true {
				draw_sprite_ext(spr_pickup_empty,2,xx1-12-32+2,yy+46,1,1,0,c_white,0.75);
			}
			if global.synergy_slot_equipped2 = true {
				draw_sprite_ext(spr_pickup_empty,2,xx1-12+32+2,yy+46,1,1,0,c_white,0.75);
			}
			if global.synergy_slot_equipped3 = true {
				draw_sprite_ext(spr_pickup_empty,2,xx2+12-32+2,yy+46,1,1,0,c_white,0.75);
			}
			if global.synergy_slot_equipped4 = true {
				draw_sprite_ext(spr_pickup_empty,2,xx2+12+32+2,yy+46,1,1,0,c_white,0.75);
			}
		}
		
		draw_sprite(spr_actives_swap,actives_swap,center_x+2,yy-53);
		if actives_swap = true {
			//draw select button
			draw_set_font(global.lana);
			draw_set_halign(fa_center);
			if global.use_controller = true {
				draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[18][0]),2,center_x+2,yy-34);
			}else {
				var keyboard_array_value = global.keyboard_array[18][0];
				var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
				if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
					if is_string(keyboard_text) {
						scr_Draw_Text_Outlined(center_x+2,yy-34,string(keyboard_text),c_white);
					}else {
						draw_sprite(keyboard_text,0,center_x+2,yy-34);
					}
				}else {
					var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
					draw_sprite(mouse_sprite,0,center_x+2,yy-34);
				}
			}
		}
	}
	if num_of_pickups > 1 {
		scr_Draw_Input_Prompt(center_x,yy+40,19,"返回",make_color_rgb(180,82,82));
	}else if num_of_pickups = 1 { 
		if pickup_1.synergy_equipped = false {
			scr_Draw_Input_Prompt(center_x,yy+40,19,"返回",make_color_rgb(180,82,82));
		}else {
			scr_Draw_Input_Prompt(center_x,yy+88,19,"返回",make_color_rgb(180,82,82));
		}
	}
}

//WEAPONS
if select = 3 {
	var xx1 = center_x-86;
	var xx2 = center_x+86;
	var xx3 = center_x+172;
	var yy = 234;
	
	if num_of_weapons = 1 {
		scr_Draw_Weapon_Description(center_x,yy,gun_1,1,true,global.all_weapon_costs[0]);
	}else if num_of_weapons = 2 {
		
		scr_Draw_Weapon_Description(xx1-12,yy,gun_1,1,true,global.all_weapon_costs[0]);
		scr_Draw_Weapon_Description(xx2+12,yy,gun_2,2,true,global.all_weapon_costs[1]);
		
		draw_sprite(spr_actives_swap,weapons_swap1,center_x+2,yy-17);
		if weapons_swap1 = true {
			//draw select button
			draw_set_font(global.lana);
			draw_set_halign(fa_center);
			if global.use_controller = true {
				draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[18][0]),2,center_x+2,yy+2);
			}else {
				var keyboard_array_value = global.keyboard_array[18][0];
				var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
				if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
					if is_string(keyboard_text) {
						scr_Draw_Text_Outlined(center_x+2,yy+2,string(keyboard_text),c_white);
					}else {
						draw_sprite(keyboard_text,0,center_x+2,yy+2);
					}
				}else {
					var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
					draw_sprite(mouse_sprite,0,center_x+2,yy+2);
				}
			}
		}
	}else if num_of_weapons = 3 {
		
		xx1 = center_x-172;
		scr_Draw_Weapon_Description(xx1-24,yy,gun_1,1,true,global.all_weapon_costs[0]);
		scr_Draw_Weapon_Description(center_x,yy,gun_2,2,true,global.all_weapon_costs[1]);
		scr_Draw_Weapon_Description(xx3+24,yy,gun_3,3,true,global.all_weapon_costs[2]);
		
		draw_sprite(spr_actives_swap,weapons_swap1,center_x-98+2,yy-17);
		draw_sprite(spr_actives_swap,weapons_swap2,center_x+98+2,yy-17);
		if weapons_swap1 = true {
			//draw select button
			draw_set_font(global.lana);
			draw_set_halign(fa_center);
			if global.use_controller = true {
				draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[18][0]),2,center_x-98+2,yy+2);
			}else {
				var keyboard_array_value = global.keyboard_array[18][0];
				var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
				if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
					if is_string(keyboard_text) {
						scr_Draw_Text_Outlined(center_x-98+2,yy+2,string(keyboard_text),c_white);
					}else {
						draw_sprite(keyboard_text,0,center_x-98+2,yy+2);
					}
				}else {
					var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
					draw_sprite(mouse_sprite,0,center_x-98+2,yy+2);
				}
			}
		}else if weapons_swap2 = true {
			//draw select button
			draw_set_font(global.lana);
			draw_set_halign(fa_center);
			if global.use_controller = true {
				draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[18][0]),2,center_x+98+2,yy+2);
			}else {
				var keyboard_array_value = global.keyboard_array[18][0];
				var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
				if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
					if is_string(keyboard_text) {
						scr_Draw_Text_Outlined(center_x+98+2,yy+2,string(keyboard_text),c_white);
					}else {
						draw_sprite(keyboard_text,0,center_x+98+2,yy+2);
					}
				}else {
					var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
					draw_sprite(mouse_sprite,0,center_x+98+2,yy+2);
				}
			}
		}
	}
	if num_of_weapons >= 1 {
		scr_Draw_Input_Prompt(center_x,yy+112,19,"返回",make_color_rgb(180,82,82));
	}
}