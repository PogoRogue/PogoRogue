/// @description draw UI when colliding
draw_self();
if (colliding) and being_used = false and sprite_index != spr_pogosmith_workbench_animation {
	image_index = 1;
	
	//check if we should draw controller UI or keyboard UI
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_combo2);
	
	//check if we should draw controller UI or keyboard UI
	if global.use_controller = true {
		draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[6][0]),0,x,bbox_top+32);
	}else {
		var keyboard_array_value = global.keyboard_array[6][0];
		var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
		if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
			if is_string(keyboard_text) {
				scr_Draw_Text_Outlined(x,bbox_top+32,string(keyboard_text),c_white);
			}else {
				draw_sprite(keyboard_text,0,x,bbox_top+32);
			}
		}else {
			var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
			draw_sprite(mouse_sprite,0,x,bbox_top+32);
		}
	}
	scr_Draw_Text_Outlined(x,bbox_top+48,"Select Upgrade",c_white);
}else if sprite_index != spr_pogosmith_workbench_animation and !colliding and !being_used {
	image_index = 0;	
}

if being_used = true {
	obj_player.table = true;
	//draw back button
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_itemdescription2);
	if global.use_controller = true {
		draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[19][0]),0,x,bbox_top+40);
	}else {
		var keyboard_array_value = global.keyboard_array[19][0];
		var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
		if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
			if is_string(keyboard_text) {
				scr_Draw_Text_Outlined(x,bbox_top+44,string(keyboard_text),c_white);
			}else {
				draw_sprite(keyboard_text,0,x,bbox_top+40);
			}
		}else {
			var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
			draw_sprite(mouse_sprite,0,x,bbox_top+40);
		}
	}
	draw_set_font(fnt_combo2);
	scr_Draw_Text_Outlined(x,bbox_top+56,"Exit",c_white);
		
		
	if select_x_max = 1 {
		draw_sprite(obj_player.gun_1.sprite,0,x,bbox_top-8);
		draw_sprite_ext(obj_player.gun_1.sprite,0,x,bbox_top-8,1,1,0,c_black,black_alpha_1);
		draw_sprite(spr_pogosmith_arrow,0,x,bbox_top-18);
		var arrow_x = x;
	}else if select_x_max = 2 {
		draw_sprite(obj_player.gun_1.sprite,0,x-18,bbox_top-8);
		draw_sprite(obj_player.gun_2.sprite,0,x+18,bbox_top-8);
		draw_sprite_ext(obj_player.gun_1.sprite,0,x-18,bbox_top-8,1,1,0,c_black,black_alpha_1);
		draw_sprite_ext(obj_player.gun_2.sprite,0,x+18,bbox_top-8,1,1,0,c_black,black_alpha_2);
		if select_x = 0 {
			var arrow_x = x-18;
		}else {
			var arrow_x = x+18;	
		}
		draw_sprite(spr_pogosmith_arrow,0,arrow_x,bbox_top-18);
	}else if select_x_max = 3 {
		draw_sprite(obj_player.gun_1.sprite,0,x-36,bbox_top-8);
		draw_sprite(obj_player.gun_2.sprite,0,x,bbox_top-8);
		draw_sprite(obj_player.gun_3.sprite,0,x+36,bbox_top-8);
		draw_sprite_ext(obj_player.gun_1.sprite,0,x-36,bbox_top-8,1,1,0,c_black,black_alpha_1);
		draw_sprite_ext(obj_player.gun_2.sprite,0,x,bbox_top-8,1,1,0,c_black,black_alpha_2);
		draw_sprite_ext(obj_player.gun_3.sprite,0,x-36,bbox_top-8,1,1,0,c_black,black_alpha_3);
		if select_x = 0 {
			var arrow_x = x-36;
		}else if select_x = 1 {
			var arrow_x = x;	
		}else {
			var arrow_x = x+36;	
		}
		draw_sprite(spr_pogosmith_arrow,0,arrow_x,bbox_top-18);
	}else {
		var arrow_x = x;	
	}
	if !(select_x = 0 and gun_1_bought = true) and !(select_x = 1 and gun_2_bought = true) and !(select_x = 2 and gun_3_bought = true)  {
		scr_Draw_Input_UI(arrow_x,bbox_top+4,18,0,fnt_itemdescription2,fa_center,fa_middle);
	}
	draw_set_font(fnt_itemdescription2);
	
	if !(select_x = 0 and gun_1_bought = true) and !(select_x = 1 and gun_2_bought = true) and !(select_x = 2 and gun_3_bought = true)  {
		scr_Draw_Text_Outlined(arrow_x,bbox_top+16,"Upgrade",upgrade_color);
		scr_Draw_Text_Outlined(arrow_x,bbox_top+26,"(" + string(purchase_cost * obj_player.gun_array[other.select_x].level) + ")",cost_color);
	}
}