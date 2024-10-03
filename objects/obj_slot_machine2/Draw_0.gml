draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_item_popup);
draw_set_alpha(image_alpha);

x = (obj_camera.x - obj_camera.view_w_half) + player_x;
y = (obj_camera.y - obj_camera.view_h_half) + player_y-y_subtract;

player_x = (768/2) + (obj_player.x - obj_camera.x) + lengthdir_x(22,obj_player.angle + 90);
player_y = (432/2) + (obj_player.y - obj_camera.y) + lengthdir_y(22,obj_player.angle + 90);

//draw_self();

if draw = true {
	draw_sprite(spr_slotmachine_slots,0,x,y);
	//actual items
	draw_sprite(spr_slotmachine_slot_items2,item1,x-12,y+item1_y);
	draw_sprite(spr_slotmachine_slot_items2,item2,x,y+item2_y);
	draw_sprite(spr_slotmachine_slot_items2,item3,x+12,y+item3_y);
	//next items
	draw_sprite(spr_slotmachine_slot_items2,item1_next,x-12,y-(item_spacing-item1_y));
	draw_sprite(spr_slotmachine_slot_items2,item2_next,x,y-(item_spacing-item2_y));
	draw_sprite(spr_slotmachine_slot_items2,item3_next,x+12,y-(item_spacing-item3_y));

	draw_sprite(spr_slotmachine_handle,handle_frame,x,y);
	draw_sprite(sprite_index,image_index,x,y);
	if jackpot = true {
		draw_sprite(spr_slotmachine_jackpot,jackpot_index,x,y);
	}
	if tryagain = true {
		draw_sprite(spr_slotmachine_tryagain,tryagain_index,x,y);
	}
	draw_sprite(spr_slotmachine_propeller,propeller_frame,x,y);
	
	if current_slot_hacking <= 3 {
		if spin = true {
			draw_sprite(spr_slotmachine_arrows,current_slot_hacking-1,x,y);
		}
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_itemdescription2);
		if global.use_controller = true {
			draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[button_num][0]),0,x,y-60);
		}else {
			var keyboard_array_value = global.keyboard_array[button_num][0];
			var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
			if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
				if is_string(keyboard_text) {
					scr_Draw_Text_Outlined(x,y-56,string(keyboard_text),c_white);
				}else {
					draw_sprite(keyboard_text,0,x,y-60);
				}
			}else {
				var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
				draw_sprite(mouse_sprite,0,x,y-60);
			}
		}
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_itemdescription2);
		scr_Draw_Text_Outlined(x,y-46,"Stop Reel",c_white);
	}
}

draw_set_alpha(1);
draw_set_color(c_white);