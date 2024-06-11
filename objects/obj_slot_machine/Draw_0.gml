draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_item_popup);
draw_set_alpha(image_alpha);

var player_x = obj_player.x + lengthdir_x(22,obj_player.angle + 90);
var player_y = obj_player.y + lengthdir_y(22,obj_player.angle + 90);

if draw = true {
	draw_sprite(spr_slotmachine_slots,0,player_x,player_y-y_subtract);
	draw_sprite(spr_slotmachine_slot_items,item1_index,player_x-12,player_y-y_subtract);
	draw_sprite(spr_slotmachine_slot_items,item2_index,player_x,player_y-y_subtract);
	draw_sprite(spr_slotmachine_slot_items,item3_index,player_x+12,player_y-y_subtract);
	draw_sprite(spr_slotmachine_handle,handle_frame,player_x,player_y-y_subtract);
	draw_sprite(sprite_index,image_index,player_x,player_y-y_subtract);
	if jackpot = true {
		draw_sprite(spr_slotmachine_jackpot,jackpot_index,player_x,player_y-y_subtract);
	}
	if tryagain = true {
		draw_sprite(spr_slotmachine_tryagain,tryagain_index,player_x,player_y-y_subtract);
	}
}

draw_set_alpha(1);
draw_set_color(c_white);