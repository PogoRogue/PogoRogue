draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_item_popup);
draw_set_alpha(image_alpha);

x = (obj_camera.x - obj_camera.view_w_half) + player_x;
y = (obj_camera.y - obj_camera.view_h_half) + player_y-y_subtract;

player_x = (camera_get_view_width(view_camera[0])/2) + (obj_player.x - obj_camera.x) + lengthdir_x(22,obj_player.angle + 90);
player_y = (camera_get_view_height(view_camera[0])/2) + (obj_player.y - obj_camera.y) + lengthdir_y(22,obj_player.angle + 90);

//draw_self();

if draw = true {
	draw_sprite(spr_slotmachine_slots,0,x,y);
	//actual items
	draw_sprite(spr_slotmachine_slot_items,item1,x-12,y+item1_y);
	draw_sprite(spr_slotmachine_slot_items,item2,x,y+item2_y);
	draw_sprite(spr_slotmachine_slot_items,item3,x+12,y+item3_y);
	//next items
	draw_sprite(spr_slotmachine_slot_items,item1_next,x-12,y-(item_spacing-item1_y));
	draw_sprite(spr_slotmachine_slot_items,item2_next,x,y-(item_spacing-item2_y));
	draw_sprite(spr_slotmachine_slot_items,item3_next,x+12,y-(item_spacing-item3_y));

	draw_sprite(spr_slotmachine_handle,handle_frame,x,y);
	draw_sprite(sprite_index,image_index,x,y);
	if jackpot = true {
		draw_sprite(spr_slotmachine_jackpot,jackpot_index,x,y);
	}
	if tryagain = true {
		draw_sprite(spr_slotmachine_tryagain,tryagain_index,x,y);
	}
	draw_sprite(spr_slotmachine_propeller,propeller_frame,x,y);
}

draw_set_alpha(1);
draw_set_color(c_white);