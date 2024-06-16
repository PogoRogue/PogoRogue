draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_item_popup);
draw_set_alpha(image_alpha);

player_x = (camera_get_view_width(view_camera[0])/2) + (obj_player.x - obj_camera.x) + lengthdir_x(22,obj_player.angle + 90);
player_y = (camera_get_view_height(view_camera[0])/2) + (obj_player.y - obj_camera.y) + lengthdir_y(22,obj_player.angle + 90);

x = (obj_camera.x - obj_camera.view_w_half) + player_x;
y = (obj_camera.y - obj_camera.view_h_half) + player_y-y_subtract;

draw_self();

if draw = true {
	draw_sprite(spr_slotmachine_slots,0,player_x,player_y-y_subtract);
	//actual items
	draw_sprite(spr_slotmachine_slot_items,item1,player_x-12,player_y-y_subtract+item1_y);
	draw_sprite(spr_slotmachine_slot_items,item2,player_x,player_y-y_subtract+item2_y);
	draw_sprite(spr_slotmachine_slot_items,item3,player_x+12,player_y-y_subtract+item3_y);
	//next items
	draw_sprite(spr_slotmachine_slot_items,item1_next,player_x-12,player_y-y_subtract-(item_spacing-item1_y));
	draw_sprite(spr_slotmachine_slot_items,item2_next,player_x,player_y-y_subtract-(item_spacing-item2_y));
	draw_sprite(spr_slotmachine_slot_items,item3_next,player_x+12,player_y-y_subtract-(item_spacing-item3_y));

	draw_sprite(spr_slotmachine_handle,handle_frame,player_x,player_y-y_subtract);
	draw_sprite(sprite_index,image_index,player_x,player_y-y_subtract);
	if jackpot = true {
		draw_sprite(spr_slotmachine_jackpot,jackpot_index,player_x,player_y-y_subtract);
	}
	if tryagain = true {
		draw_sprite(spr_slotmachine_tryagain,tryagain_index,player_x,player_y-y_subtract);
	}
	draw_sprite(spr_slotmachine_propeller,propeller_frame,player_x,player_y-y_subtract);
}

draw_set_alpha(1);
draw_set_color(c_white);