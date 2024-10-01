if image_alpha = 1 {
	draw_self();

	is_colliding = false;
	with obj_player_skin {
		if skin_num = other.skin_num {
			if colliding = true {
				other.is_colliding = true;
			}	
		}
	}

	if is_colliding and !instance_exists(speechbubble_obj) {
	
		image_index = 1;
	
		draw_set_halign(fa_center);
		draw_set_valign(fa_bottom);
		draw_set_font(fnt_itemdescription2);
	
		scr_Draw_Text_Outlined(other.x,other.y-sprite_get_height(spr_cage)-16,scr_Linebreak(global.howtounlock_array[skin_num-1],15,99),c_white);
		scr_Draw_Input_Prompt(other.x,other.y-sprite_get_height(spr_cage)-3,6,"Talk",make_color_rgb(237,225,158));
	}else {
		image_index = 0;	
	}
}