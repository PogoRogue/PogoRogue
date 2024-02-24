draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_item_popup);
draw_set_alpha(1); //alpha
scr_Draw_Text_Outlined(center_x,center_y-140,"Choose your starting active item:", c_white);

draw_set_font(fnt_itemdescription2);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
	
//item sprites
for (i = 0; i < array_length(actives_array); i++) {
	var xx = (center_x - ((x_gap*select_x_max-x_gap)/2)) + (i % select_x_max) * x_gap;
	var yy = 156 + floor(i / select_x_max) * y_gap;

	//ACTIVES
	if i < array_length(actives_array) {
		
		draw_sprite(select_sprite,2 + (select = i + 1),xx,yy-27);
		draw_sprite(all_actives[i].gui_sprite,1,xx,yy-27);
	
		if (i < array_length(all_actives)) {
			scr_Draw_Text_Outlined(xx,yy-56,scr_Linebreak(all_actives[i]._name,12,99),c_white);
		}
	}
}

//buttons
for (i = 0; i < array_length(actives_array); i++) {
	var xx = (center_x - ((x_gap*select_x_max-x_gap)/2)) + (i % select_x_max) * x_gap;
	var yy = 156 + floor(i / select_x_max) * y_gap;
	
	if (select = i + 1) {
		if global.use_controller = true {
			draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[18][0]),0,xx,yy+4);
		}else {
			var keyboard_array_value = global.keyboard_array[18][0];
			var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
			if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
				if is_string(keyboard_text) {
					draw_set_font(fnt_combo2);
					scr_Draw_Text_Outlined(xx,yy+2,keyboard_text,c_white);
					draw_set_font(fnt_itemdescription2);
				}else {
					draw_sprite(keyboard_text,0,xx,yy+4);
				}
			}else {
				var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
				draw_sprite(mouse_sprite,0,xx,yy+4);	
			}
		}	
	}
}

//descriptions
for (i = 0; i < array_length(all_actives); i++) {
	var xx = (center_x - ((x_gap*select_x_max-x_gap)/2)) + (i % select_x_max) * x_gap;
	var yy = 226 + floor(i / select_x_max) * y_gap;
	if (i = select-1) {
		var x_offset = 154 + (((select_x_max-4)*(-x_gap))/2);
		if select_x <= select_x_max/2 {
			var xx = (center_x-384) + x_offset;
		}else {
			var xx = (center_x+384) - x_offset;
		}
			
		if select_y > 3 {
			var y_offset = -y_gap * (select_y-3);
		}else {
			var y_offset = 0;
		}
			
		scr_Draw_Pickup_Description(xx,yy+y_offset,all_actives[i],0,true);
	}
}