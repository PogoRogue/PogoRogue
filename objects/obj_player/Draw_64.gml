/// @description draw weapon text and ammo GUI and coins

//weapon text
display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
draw_set_font(fnt_combo2);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

//draw ammo UI
for (gun_num = 0; gun_num < weapons_equipped; gun_num++) {
	var ammo = gun_array[gun_num].ammo[bullet_index];
	var yy = 48 * gun_num; //add y for other weapons bullets
	var black_alpha = 0.5 * (gun != gun_array[gun_num]); //darkening for bottom ammo
	for(i = 0; i < gun_array[gun_num].bullets_per_bounce+max_ammo_buff; i++) {
		if (gun_array[gun_num] != paintball_gun) and (gun_array[gun_num] != laser_gun) and (gun_array[gun_num] != water_gun) {
			draw_sprite(ammo.gui_sprite,i+gun_array[gun_num].current_bullets<gun_array[gun_num].bullets_per_bounce+max_ammo_buff,(camera_get_view_width(view_camera[0])-16)-(i*(sprite_get_width(ammo.gui_sprite)+4)),36+yy); 
			//darkening
			draw_sprite_ext(ammo.gui_sprite,i+gun_array[gun_num].current_bullets<gun_array[gun_num].bullets_per_bounce+max_ammo_buff,(camera_get_view_width(view_camera[0])-16)-(i*(sprite_get_width(ammo.gui_sprite)+4)),36+yy,1,1,0,c_black,black_alpha);
		}else if (gun_array[gun_num] = paintball_gun) {
			draw_sprite(ammo.gui_sprite,((i+gun_array[gun_num].current_bullets<gun_array[gun_num].bullets_per_bounce+max_ammo_buff)*10)+((i+gun_array[gun_num].current_bullets>=gun_array[gun_num].bullets_per_bounce+max_ammo_buff)*i)-((i >= gun_array[gun_num].init_bullets_per_bounce and (i+gun_array[gun_num].current_bullets>=gun_array[gun_num].bullets_per_bounce+max_ammo_buff))*10),(camera_get_view_width(view_camera[0])-16)-(i*(sprite_get_width(ammo.gui_sprite)+4)),36+yy); 
			//darkening
			draw_sprite_ext(ammo.gui_sprite,((i+gun_array[gun_num].current_bullets<gun_array[gun_num].bullets_per_bounce+max_ammo_buff)*10)+((i+gun_array[gun_num].current_bullets>=gun_array[gun_num].bullets_per_bounce+max_ammo_buff)*i),(camera_get_view_width(view_camera[0])-16)-(i*(sprite_get_width(ammo.gui_sprite)+4)),36+yy,1,1,0,c_black,black_alpha);
		}
	}
	//laser/water
	if (gun_array[gun_num] = laser_gun) or (gun_array[gun_num] = water_gun) {
		value_ = gun_array[gun_num].current_bullets / (gun_array[gun_num].bullets_per_bounce+max_ammo_buff);
		draw_sprite(ammo.gui_sprite,0,(camera_get_view_width(view_camera[0])-16),36+yy);
		draw_sprite_part(ammo.gui_sprite,1,0,0,sprite_get_width(ammo.gui_sprite)*value_,sprite_height,(camera_get_view_width(view_camera[0])-16)-sprite_get_width(ammo.gui_sprite),36+yy);
		//darkening
		draw_sprite_ext(ammo.gui_sprite,0,(camera_get_view_width(view_camera[0])-16),36+yy,1,1,0,c_black,black_alpha);
		draw_sprite_part_ext(ammo.gui_sprite,1,0,0,sprite_get_width(ammo.gui_sprite)*value_,sprite_height,(camera_get_view_width(view_camera[0])-16)-sprite_get_width(ammo.gui_sprite),36+yy,1,1,c_black,black_alpha);
	}
	
	//text
	draw_text_color(camera_get_view_width(view_camera[0])-52,32+yy,gun_array[gun_num]._name,make_color_rgb(242,240,229),make_color_rgb(242,240,229),make_color_rgb(242,240,229),make_color_rgb(242,240,229),1);
	//text darkening
	draw_text_color(camera_get_view_width(view_camera[0])-52,32+yy,gun_array[gun_num]._name,c_black,c_black,c_black,c_black,black_alpha);
	
	//weapon sprites
	draw_sprite(gun_array[gun_num].sprite,1,camera_get_view_width(view_camera[0])-32,24+yy);
	//weapon darkening
	draw_sprite_ext(gun_array[gun_num].sprite,1,camera_get_view_width(view_camera[0])-32,24+yy,1,1,0,c_black,black_alpha);
	
}

//coins
coin_x = 32;
coin_y = 66;
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_sprite(spr_coingui,0,coin_x,coin_y);
draw_text_color(coin_x+1,coin_y+1,"x"+string(global.num_of_coins),make_color_rgb(242,240,229),make_color_rgb(242,240,229),make_color_rgb(242,240,229),make_color_rgb(242,240,229),1);

//coins
timer_x = 123;
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

if global.show_timer = true {
	draw_sprite(spr_timergui,0,timer_x,coin_y);
	draw_text_color(timer_x-1,coin_y+1,scr_Convert_Frames_To_Time(global.current_time_elapsed),make_color_rgb(242,240,229),make_color_rgb(242,240,229),make_color_rgb(242,240,229),make_color_rgb(242,240,229),1);
}

//PICKUPS
draw_set_font(fnt_combo);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

//cooldowns
if pickups_array[0].reload_on_bounce = false and pickups_array[0].enemies_count_max = 0 {
	if !(pickups_array[0].on_cooldown) {
		draw_sprite(pickups_array[0].gui_sprite,1,32,88);
		//shield bubble / slow mo darkening
		if pickups_array[0] = pickup_shieldbubble and instance_exists(obj_shieldbubble)
		or pickups_array[0] = pickup_slowmo and instance_exists(obj_slowmo)
		or pickups_array[0] = pickup_frenzy and frenzy = true 
		or pickups_array[0] = pickup_blink and instance_exists(obj_blink_box) 
		or pickups_array[0] = pickup_parachute and instance_exists(obj_parachute) {
			draw_sprite_ext(spr_pickup_empty,0,32,88,1,1,0,c_black,0.5);
		}
	}else {
		draw_sprite_ext(spr_pickup_empty,0,32,88,1,1,0,c_white,0.5);
		draw_sprite_part(pickups_array[0].gui_sprite,1,0,0,sprite_get_width(spr_pickup_empty)*(1-(pickups_array[0].cooldown_time/pickups_array[0].max_cooldown_time)),sprite_get_height(spr_pickup_empty),16,72);
		//darkening
		draw_sprite_ext(spr_pickup_empty,0,32,88,1,1,0,c_black,0.5);
		if pickups_array[0] != pickup_nothing {
			//draw seconds left
			draw_set_font(fnt_item_popup);
			scr_Draw_Text_Outlined(32,104,string(ceil((pickups_array[0].cooldown_time+6)/60)-1) + "." + string(ceil(pickups_array[0].cooldown_time/6)%10),c_white); 
		}
	}
}else if pickups_array[0].enemies_count_max = 0 {
	if !(pickups_array[0].on_cooldown) and pickups_array[0].max_cooldown_time < 0 {
		draw_sprite(pickups_array[0].gui_sprite,1,32,88);
	}else if pickups_array[0].max_cooldown_time < 0 and pickups_array[0].bounce_reset_max <= 1 {
		draw_sprite(pickups_array[0].gui_sprite,1,32,88);
		draw_sprite_ext(spr_pickup_empty,0,32,88,1,1,0,c_black,0.5);
	}
	if pickups_array[0].max_uses_per_bounce > 1 {
		//draw uses_left
		draw_set_font(fnt_combo);
		scr_Draw_Text_Outlined(46,104,pickups_array[0].uses_per_bounce,c_white);
	}else if pickups_array[0].max_cooldown_time > 0 { //jetpack
		//darkening
		draw_sprite_ext(spr_pickup_empty,0,32,88,1,1,0,c_white,0.5);
		draw_sprite_ext(spr_pickup_empty,0,32,88,1,1,0,c_black,0.5);
		//show fuel left
		draw_sprite_part(pickups_array[0].gui_sprite,1,0,0,sprite_get_width(spr_pickup_empty)*(pickups_array[0].cooldown_time/pickups_array[0].max_cooldown_time),sprite_get_height(spr_pickup_empty),16,72);
		//draw controls
		if (pickups_array[0].cooldown_time > 0) {
			scr_Draw_Input_UI(32,108,4,0,fnt_itemdescription2,fa_center,fa_middle);
		}
	}
	if pickups_array[0].bounce_reset_max > 1 { //freeze
		if pickups_array[0].on_cooldown = true {
			//darkening
			draw_sprite_ext(spr_pickup_empty,0,32,88,1,1,0,c_white,0.5);
			//show fuel left
			draw_sprite_part(pickups_array[0].gui_sprite,1,0,0,sprite_get_width(spr_pickup_empty)*((pickups_array[0].bounce_reset_max-pickups_array[0].bounce_reset)/pickups_array[0].bounce_reset_max),sprite_get_height(spr_pickup_empty),16,72);
			draw_sprite_ext(spr_pickup_empty,0,32,88,1,1,0,c_black,0.5);
			//draw bounces left
			draw_set_font(fnt_item_popup);
			scr_Draw_Text_Outlined(32,104,string(pickups_array[0].bounce_reset),make_color_rgb(207,138,203));
		}else if state = state_freeze {
			//darkening
			draw_sprite_ext(spr_pickup_empty,0,32,88,1,1,0,c_white,0.5);
			draw_sprite_ext(spr_pickup_empty,0,32,88,1,1,0,c_black,0.5);	
		}
	}
}else {
	if !(pickups_array[0].on_cooldown) and pickups_array[0].max_cooldown_time < 0 {
		draw_sprite(pickups_array[0].gui_sprite,1,32,88);
	}else if pickups_array[0].max_cooldown_time < 0 and pickups_array[0].enemies_count_max <= 1 {
		draw_sprite(pickups_array[0].gui_sprite,1,32,88);
		draw_sprite_ext(spr_pickup_empty,0,32,88,1,1,0,c_black,0.5);
	}
	if pickups_array[0].on_cooldown = true {
		//darkening
		draw_sprite_ext(spr_pickup_empty,0,32,88,1,1,0,c_white,0.5);
		//show fuel left
		draw_sprite_part(pickups_array[0].gui_sprite,1,0,0,sprite_get_width(spr_pickup_empty)*((pickups_array[0].enemies_count_max-pickups_array[0].enemies_count)/pickups_array[0].enemies_count_max),sprite_get_height(spr_pickup_empty),16,72);
		draw_sprite_ext(spr_pickup_empty,0,32,88,1,1,0,c_black,0.5);
		//draw bounces left
		draw_set_font(fnt_item_popup);
		scr_Draw_Text_Outlined(32,104,string(pickups_array[0].enemies_count),make_color_rgb(180,82,82));
	}
}

if pickups_array[1].reload_on_bounce = false and pickups_array[1].enemies_count_max = 0 {
	if !(pickups_array[1].on_cooldown) {
		draw_sprite(pickups_array[1].gui_sprite,1,68,88);
		//shield bubble / slow mo darkening
		if pickups_array[1] = pickup_shieldbubble and instance_exists(obj_shieldbubble) 
		or pickups_array[1] = pickup_slowmo and instance_exists(obj_slowmo)
		or pickups_array[1] = pickup_frenzy and frenzy = true 
		or pickups_array[1] = pickup_blink and instance_exists(obj_blink_box) 
		or pickups_array[1] = pickup_parachute and instance_exists(obj_parachute) {
			draw_sprite_ext(spr_pickup_empty,0,68,88,1,1,0,c_black,0.5);
		}
	}else {
		draw_sprite_ext(spr_pickup_empty,0,68,88,1,1,0,c_white,0.5);
		draw_sprite_part(pickups_array[1].gui_sprite,1,0,0,sprite_get_width(spr_pickup_empty)*(1-(pickups_array[1].cooldown_time/pickups_array[1].max_cooldown_time)),sprite_get_height(spr_pickup_empty),52,72);
		//darkening
		draw_sprite_ext(spr_pickup_empty,0,68,88,1,1,0,c_black,0.5);
	
		if pickups_array[1] != pickup_nothing {
			//draw seconds left
			draw_set_font(fnt_item_popup);
			scr_Draw_Text_Outlined(68,104,string(ceil((pickups_array[1].cooldown_time+6)/60)-1) + "." + string(ceil(pickups_array[1].cooldown_time/6)%10),c_white); 
		}
	}
}else if pickups_array[1].enemies_count_max = 0 {
	if !(pickups_array[1].on_cooldown) and pickups_array[1].max_cooldown_time < 0 {
		draw_sprite(pickups_array[1].gui_sprite,1,68,88);
	}else if pickups_array[1].max_cooldown_time < 0 and pickups_array[1].bounce_reset_max <= 1 {
		draw_sprite(pickups_array[1].gui_sprite,1,68,88);
		draw_sprite_ext(spr_pickup_empty,0,68,88,1,1,0,c_black,0.5);
	}
	if pickups_array[1].max_uses_per_bounce > 1 {
		//draw uses_left
		draw_set_font(fnt_combo);
		scr_Draw_Text_Outlined(82,104,pickups_array[1].uses_per_bounce,c_white); 
	}else if pickups_array[1].max_cooldown_time > 0 { //jetpack
		//darkening
		draw_sprite_ext(spr_pickup_empty,0,68,88,1,1,0,c_white,0.5);
		draw_sprite_ext(spr_pickup_empty,0,68,88,1,1,0,c_black,0.5);
		//show fuel left
		draw_sprite_part(pickups_array[1].gui_sprite,1,0,0,sprite_get_width(spr_pickup_empty)*(pickups_array[1].cooldown_time/pickups_array[1].max_cooldown_time),sprite_get_height(spr_pickup_empty),52,72);
		//draw controls
		if (pickups_array[1].cooldown_time > 0) {
			scr_Draw_Input_UI(68,108,5,0,fnt_itemdescription2,fa_center,fa_middle);
		}
	}
	
	if pickups_array[1].bounce_reset_max > 1 { //freeze
		if pickups_array[1].on_cooldown = true {
			//darkening
			draw_sprite_ext(spr_pickup_empty,0,68,88,1,1,0,c_white,0.5);
			//show fuel left
			draw_sprite_part(pickups_array[1].gui_sprite,1,0,0,sprite_get_width(spr_pickup_empty)*((pickups_array[1].bounce_reset_max-pickups_array[1].bounce_reset)/pickups_array[1].bounce_reset_max),sprite_get_height(spr_pickup_empty),52,72);
			draw_sprite_ext(spr_pickup_empty,0,68,88,1,1,0,c_black,0.5);
			//draw bounces left
			draw_set_font(fnt_item_popup);
			scr_Draw_Text_Outlined(68,104,string(pickups_array[1].bounce_reset),make_color_rgb(207,138,203));
		}else if state = state_freeze {
			//darkening
			draw_sprite_ext(spr_pickup_empty,0,68,88,1,1,0,c_white,0.5);
			draw_sprite_ext(spr_pickup_empty,0,68,88,1,1,0,c_black,0.5);
		}
	}
}else {
	if !(pickups_array[1].on_cooldown) and pickups_array[1].max_cooldown_time < 0 {
		draw_sprite(pickups_array[1].gui_sprite,1,68,88);
	}else if pickups_array[1].max_cooldown_time < 0 and pickups_array[1].enemies_count_max <= 1 {
		draw_sprite(pickups_array[1].gui_sprite,1,68,88);
		draw_sprite_ext(spr_pickup_empty,0,68,88,1,1,0,c_black,0.5);
	}
	if pickups_array[1].on_cooldown = true {
		//darkening
		draw_sprite_ext(spr_pickup_empty,0,68,88,1,1,0,c_white,0.5);
		//show fuel left
		draw_sprite_part(pickups_array[1].gui_sprite,1,0,0,sprite_get_width(spr_pickup_empty)*((pickups_array[1].enemies_count_max-pickups_array[1].enemies_count)/pickups_array[1].enemies_count_max),sprite_get_height(spr_pickup_empty),52,72);
		draw_sprite_ext(spr_pickup_empty,0,68,88,1,1,0,c_black,0.5);
		//draw bounces left
		draw_set_font(fnt_item_popup);
		scr_Draw_Text_Outlined(68,104,string(pickups_array[1].enemies_count),make_color_rgb(180,82,82));
	}
}

//button 1
if !(pickups_array[0].on_cooldown) and pickups_array[0] != pickup_nothing 
and !(pickups_array[0] = pickup_shieldbubble and instance_exists(obj_shieldbubble) 
or pickups_array[0] = pickup_frenzy and frenzy = true
or pickups_array[0] = pickup_parachute and instance_exists(obj_parachute)) {
	scr_Draw_Input_UI(32,108,4,0,fnt_itemdescription2,fa_center,fa_middle);
}
//button 2
if !(pickups_array[1].on_cooldown) and pickups_array[1] != pickup_nothing 
and !(pickups_array[1] = pickup_shieldbubble and instance_exists(obj_shieldbubble) 
or pickups_array[1] = pickup_frenzy and frenzy = true
or pickups_array[1] = pickup_parachute and instance_exists(obj_parachute)) {
	scr_Draw_Input_UI(68,108,5,0,fnt_itemdescription2,fa_center,fa_middle);
}

//all buffs
if (global.show_passives = true) {
	for (i = 0; i < array_length(global.all_buff_sprites); i++) {
		var xx = 24;
		var yy = camera_get_view_height(view_camera[0]) - 16;
		draw_sprite(global.all_buff_sprites[i],global.all_buff_sprites_index[i]+1,xx+i*20,yy);
		
		//items menu
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_set_font(fnt_combo2);
		draw_set_color(make_color_rgb(242,240,229));
		draw_text(16,yy-16,"Passive items: ");


		//numbers of each buff
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_itemdescription2);
		if global.all_buff_numbers[i] > 1 {
			scr_Draw_Text_Outlined(xx+i*20-6,yy+4,global.all_buff_numbers[i],c_white);
		}
	}
}

//items menu
draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_set_font(fnt_combo2);
draw_set_color(make_color_rgb(242,240,229));
draw_text(17,120,"Items menu: ");
if global.use_controller = true {
	draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[13][0]),2,91,120);
}else {
	var keyboard_array_value = global.keyboard_array[13][0];
	var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
	if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
		if is_string(keyboard_text) {
			draw_text(85,120,keyboard_text);
		}else {
			draw_sprite(keyboard_text,0,91,120);
		}
	}else {
		var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
		draw_sprite(mouse_sprite,0,91,120);	
	}
}

draw_set_color(c_white);