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
		if (gun_array[gun_num] != paintball_gun) and (gun_array[gun_num] != machine_gun and gun_array[gun_num] != bubble_gun) and (gun_array[gun_num] != laser_gun) and (gun_array[gun_num] != water_gun) and (gun_array[gun_num] != plasma_gun) {
			draw_sprite(ammo.gui_sprite,i+gun_array[gun_num].current_bullets<gun_array[gun_num].bullets_per_bounce+max_ammo_buff,(camera_get_view_width(view_camera[0])-16)-(i*(sprite_get_width(ammo.gui_sprite)+4))-((gun_array[gun_num].burst_number>1)*(floor(i/gun_array[gun_num].burst_number)*4)),36+yy); 
			//darkening
			draw_sprite_ext(ammo.gui_sprite,i+gun_array[gun_num].current_bullets<gun_array[gun_num].bullets_per_bounce+max_ammo_buff,(camera_get_view_width(view_camera[0])-16)-(i*(sprite_get_width(ammo.gui_sprite)+4))-((gun_array[gun_num].burst_number>1)*(floor(i/gun_array[gun_num].burst_number)*4)),36+yy,1,1,0,c_black,black_alpha);
		}else if (gun_array[gun_num] = paintball_gun) {
			draw_sprite(ammo.gui_sprite,((i+gun_array[gun_num].current_bullets<gun_array[gun_num].bullets_per_bounce+max_ammo_buff)*10)+((i+gun_array[gun_num].current_bullets>=gun_array[gun_num].bullets_per_bounce+max_ammo_buff)*i)-((i >= gun_array[gun_num].init_bullets_per_bounce and (i+gun_array[gun_num].current_bullets>=gun_array[gun_num].bullets_per_bounce+max_ammo_buff))*10),(camera_get_view_width(view_camera[0])-16)-(i*(sprite_get_width(ammo.gui_sprite)+4)),36+yy); 
			//darkening
			draw_sprite_ext(ammo.gui_sprite,((i+gun_array[gun_num].current_bullets<gun_array[gun_num].bullets_per_bounce+max_ammo_buff)*10)+((i+gun_array[gun_num].current_bullets>=gun_array[gun_num].bullets_per_bounce+max_ammo_buff)*i),(camera_get_view_width(view_camera[0])-16)-(i*(sprite_get_width(ammo.gui_sprite)+4)),36+yy,1,1,0,c_black,black_alpha);
		}else if (gun_array[gun_num] = machine_gun or gun_array[gun_num] = bubble_gun) {
			if (gun_array[gun_num] = machine_gun) {
				var row_size = 20;
				var y_row_add = 0;
			}else  {
				var row_size = 12;
				if bubble_gun.bullets_per_bounce >= row_size * 3 {
					var y_row_add = 8;	
				}else {
					var y_row_add = 0;	
				}
			}
			if i < row_size {
				draw_sprite(ammo.gui_sprite,i+gun_array[gun_num].current_bullets<gun_array[gun_num].bullets_per_bounce+max_ammo_buff,(camera_get_view_width(view_camera[0])-16)-(i*(sprite_get_width(ammo.gui_sprite)+4))-((gun_array[gun_num].burst_number>1)*(floor(i/gun_array[gun_num].burst_number)*4)),36+yy+8+y_row_add); 
				//darkening
				draw_sprite_ext(ammo.gui_sprite,i+gun_array[gun_num].current_bullets<gun_array[gun_num].bullets_per_bounce+max_ammo_buff,(camera_get_view_width(view_camera[0])-16)-(i*(sprite_get_width(ammo.gui_sprite)+4))-((gun_array[gun_num].burst_number>1)*(floor(i/gun_array[gun_num].burst_number)*4)),36+yy+8+y_row_add,1,1,0,c_black,black_alpha);
			}else if i < row_size * 2 {
				draw_sprite(ammo.gui_sprite,i+gun_array[gun_num].current_bullets<gun_array[gun_num].bullets_per_bounce+max_ammo_buff,(camera_get_view_width(view_camera[0])-16)-((i-row_size)*(sprite_get_width(ammo.gui_sprite)+4))-((gun_array[gun_num].burst_number>1)*(floor((i-row_size)/gun_array[gun_num].burst_number)*4)),36+yy+y_row_add); 
				//darkening
				draw_sprite_ext(ammo.gui_sprite,i+gun_array[gun_num].current_bullets<gun_array[gun_num].bullets_per_bounce+max_ammo_buff,(camera_get_view_width(view_camera[0])-16)-((i-row_size)*(sprite_get_width(ammo.gui_sprite)+4))-((gun_array[gun_num].burst_number>1)*(floor((i-row_size)/gun_array[gun_num].burst_number)*4)),36+yy+y_row_add,1,1,0,c_black,black_alpha);
			}else {
				draw_sprite(ammo.gui_sprite,i+gun_array[gun_num].current_bullets<gun_array[gun_num].bullets_per_bounce+max_ammo_buff,(camera_get_view_width(view_camera[0])-16)-((i-row_size*2)*(sprite_get_width(ammo.gui_sprite)+4))-((gun_array[gun_num].burst_number>1)*(floor((i-row_size*2)/gun_array[gun_num].burst_number)*4)),36+yy-8+y_row_add); 
				//darkening
				draw_sprite_ext(ammo.gui_sprite,i+gun_array[gun_num].current_bullets<gun_array[gun_num].bullets_per_bounce+max_ammo_buff,(camera_get_view_width(view_camera[0])-16)-((i-row_size*2)*(sprite_get_width(ammo.gui_sprite)+4))-((gun_array[gun_num].burst_number>1)*(floor((i-row_size*2)/gun_array[gun_num].burst_number)*4)),36+yy-8+y_row_add,1,1,0,c_black,black_alpha);
			}
		}
	}
	//laser/water/plasma
	if (gun_array[gun_num] = laser_gun) or (gun_array[gun_num] = water_gun) or (gun_array[gun_num] = plasma_gun) {
		value_ = gun_array[gun_num].current_bullets / (gun_array[gun_num].bullets_per_bounce+max_ammo_buff);
		draw_sprite(ammo.gui_sprite,0,(camera_get_view_width(view_camera[0])-16),36+yy);
		draw_sprite_part(ammo.gui_sprite,1,0,0,sprite_get_width(ammo.gui_sprite)*value_,sprite_height,(camera_get_view_width(view_camera[0])-16)-sprite_get_width(ammo.gui_sprite),36+yy);
		//darkening
		draw_sprite_ext(ammo.gui_sprite,0,(camera_get_view_width(view_camera[0])-16),36+yy,1,1,0,c_black,black_alpha);
		draw_sprite_part_ext(ammo.gui_sprite,1,0,0,sprite_get_width(ammo.gui_sprite)*value_,sprite_height,(camera_get_view_width(view_camera[0])-16)-sprite_get_width(ammo.gui_sprite),36+yy,1,1,c_black,black_alpha);
	}
	
	//text
	if gun_array[gun_num].level = 1 {
		scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])-52,32+yy,gun_array[gun_num]._name,c_white);
	}else if gun_array[gun_num].level = 2 {
		scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])-52,32+yy,gun_array[gun_num]._name + "+",c_white);
	}else if gun_array[gun_num].level = 3 {
		scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])-52,32+yy,gun_array[gun_num]._name + "++",c_white);
	}else if gun_array[gun_num].level >= 4 {
		scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])-52,32+yy,gun_array[gun_num]._name + "+++",c_white);
	}
	
	//text darkening
	
	
	if gun_array[gun_num].level = 1 {
		draw_text_color(camera_get_view_width(view_camera[0])-52,32+yy,gun_array[gun_num]._name,c_black,c_black,c_black,c_black,black_alpha);
	}else if gun_array[gun_num].level = 2 {
		draw_text_color(camera_get_view_width(view_camera[0])-52,32+yy,gun_array[gun_num]._name + "+",c_black,c_black,c_black,c_black,black_alpha);
	}else if gun_array[gun_num].level = 3 {
		draw_text_color(camera_get_view_width(view_camera[0])-52,32+yy,gun_array[gun_num]._name + "++",c_black,c_black,c_black,c_black,black_alpha);
	}else if gun_array[gun_num].level >= 4 {
		draw_text_color(camera_get_view_width(view_camera[0])-52,32+yy,gun_array[gun_num]._name + "+++",c_black,c_black,c_black,c_black,black_alpha);
	}
	
	//arrow
	if current_gun = gun_num and num_of_weapons > 0 {
		draw_sprite(spr_weapon_arrow,weapon_arrow_index,camera_get_view_width(view_camera[0])-56-string_width(gun_array[gun_num]._name)-((gun_array[gun_num].level-1) * 7),24+yy)
	}
	
	//weapon sprites
	draw_sprite(gun_array[gun_num].sprite,1,camera_get_view_width(view_camera[0])-32,24+yy);
	//weapon darkening
	draw_sprite_ext(gun_array[gun_num].sprite,1,camera_get_view_width(view_camera[0])-32,24+yy,1,1,0,c_black,black_alpha);
	
}


if pogomode_time > 0 {
	draw_set_color(make_color_rgb(242,240,229));
	draw_set_font(fnt_combo2);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])-16-(sprite_get_width(spr_pogomodemeter)/2),29+(48 * gun_num),"POGO MODE",pickup_pogomode.text_color);
	draw_set_color(c_white);
	draw_sprite(spr_pogomodemeter,0,camera_get_view_width(view_camera[0])-16,36+(48 * gun_num));
	draw_sprite_part(spr_pogomodemeter,1,0,0,sprite_get_width(spr_pogomodemeter)*(pogomode_time / (420 * global.bar_time_added)),sprite_get_height(spr_pogomodemeter),camera_get_view_width(view_camera[0])-16-sprite_get_width(spr_pogomodemeter),36+(48 * gun_num)-4);
	
	//2x damage buffs
	if (global.laststand and hp <= 8 and hp > 0) {
		scr_2x_Damage_Meter(36+(48 * gun_num)+48,false);
	}else if global.righteousrevenge = true and damage_boost_active and damage_boost_timer > 0 and hp > 0 {
		scr_2x_Damage_Meter(36+(48 * gun_num)+48,true);
	}
}else if frenzy_time > 0 { //draw frenzy meter
	draw_set_color(make_color_rgb(242,240,229));
	draw_set_font(fnt_combo2);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])-16-(sprite_get_width(spr_frenzymeter)/2),29+(48 * gun_num),"Frenzy",pickup_frenzy.text_color);
	draw_set_color(c_white);
	draw_sprite(spr_frenzymeter,0,camera_get_view_width(view_camera[0])-16,36+(48 * gun_num));
	draw_sprite_part(spr_frenzymeter,1,0,0,sprite_get_width(spr_frenzymeter)*(frenzy_time / (300 * global.bar_time_added)),sprite_get_height(spr_frenzymeter),camera_get_view_width(view_camera[0])-16-sprite_get_width(spr_frenzymeter),36+(48 * gun_num)-4);
	
	//2x damage buffs
	if (global.laststand and hp <= 8 and hp > 0) {
		scr_2x_Damage_Meter(36+(48 * gun_num)+48,false);
	}else if global.righteousrevenge = true and damage_boost_active and damage_boost_timer > 0 and hp > 0 {
		scr_2x_Damage_Meter(36+(48 * gun_num)+48,true);
	}
}else if aerial_assassin_frenzy_count > 0 {
	draw_set_color(make_color_rgb(242,240,229));
	draw_set_font(fnt_combo2);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])-16-(sprite_get_width(spr_frenzymeter)/2),29+(48 * gun_num),"Frenzy",pickup_frenzy.text_color);
	draw_set_color(c_white);
	draw_sprite(spr_frenzymeter,0,camera_get_view_width(view_camera[0])-16,36+(48 * gun_num));
	draw_sprite_part(spr_frenzymeter,1,0,0,sprite_get_width(spr_frenzymeter)*(aerial_assassin_frenzy_count / (120 * global.bar_time_added)),sprite_get_height(spr_frenzymeter),camera_get_view_width(view_camera[0])-16-sprite_get_width(spr_frenzymeter),36+(48 * gun_num)-4);
	
	//2x damage buffs
	if (global.laststand and hp <= 8 and hp > 0) {
		scr_2x_Damage_Meter(36+(48 * gun_num)+48,false);
	}else if global.righteousrevenge = true and damage_boost_active and damage_boost_timer > 0 and hp > 0 {
		scr_2x_Damage_Meter(36+(48 * gun_num)+48,true);
	}
}else if frenzy_time > 0 { //draw frenzy meter
	draw_set_color(make_color_rgb(242,240,229));
	draw_set_font(fnt_combo2);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])-16-(sprite_get_width(spr_frenzymeter)/2),29+(48 * gun_num),"Frenzy",pickup_frenzy.text_color);
	draw_set_color(c_white);
	draw_sprite(spr_frenzymeter,0,camera_get_view_width(view_camera[0])-16,36+(48 * gun_num));
	draw_sprite_part(spr_frenzymeter,1,0,0,sprite_get_width(spr_frenzymeter)*(frenzy_time / (300 * global.bar_time_added)),sprite_get_height(spr_frenzymeter),camera_get_view_width(view_camera[0])-16-sprite_get_width(spr_frenzymeter),36+(48 * gun_num)-4);
	
	//2x damage buffs
	if (global.laststand and hp <= 8 and hp > 0) {
		scr_2x_Damage_Meter(36+(48 * gun_num)+48,false);
	}else if global.righteousrevenge = true and damage_boost_active and damage_boost_timer > 0 and hp > 0 {
		scr_2x_Damage_Meter(36+(48 * gun_num)+48,true);
	}
}else if tripleshot_time > 0 { //draw frenzy meter
	draw_set_color(make_color_rgb(242,240,229));
	draw_set_font(fnt_combo2);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])-16-(sprite_get_width(spr_tripleshotmeter)/2),29+(48 * gun_num),"Triple Shot",pickup_tripleshot.text_color);
	draw_set_color(c_white);
	draw_sprite(spr_tripleshotmeter,0,camera_get_view_width(view_camera[0])-16,36+(48 * gun_num));
	draw_sprite_part(spr_tripleshotmeter,1,0,0,sprite_get_width(spr_tripleshotmeter)*(tripleshot_time / (480 * global.bar_time_added)),sprite_get_height(spr_tripleshotmeter),camera_get_view_width(view_camera[0])-16-sprite_get_width(spr_tripleshotmeter),36+(48 * gun_num)-4);

	//2x damage buffs
	if (global.laststand and hp <= 8 and hp > 0) {
		scr_2x_Damage_Meter(36+(48 * gun_num)+48,false);
	}else if global.righteousrevenge = true and damage_boost_active and damage_boost_timer > 0 and hp > 0 {
		scr_2x_Damage_Meter(36+(48 * gun_num)+48,true);
	}
} else {
	//2x damage buffs
	if (global.laststand and hp <= 8 and hp > 0) {
		scr_2x_Damage_Meter(36+(48 * gun_num),false);
	}else if global.righteousrevenge = true and damage_boost_active and damage_boost_timer > 0 and hp > 0 {
		scr_2x_Damage_Meter(36+(48 * gun_num),true);
	}
}

//coins
coin_x = 32;
coin_y = 66;
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_sprite(spr_coingui,0,coin_x,coin_y);
scr_Draw_Text_Outlined(coin_x+1,coin_y+1,"x"+string(global.num_of_coins),c_white);

//coins
timer_x = 123;
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

if global.show_timer = true {
	draw_sprite(spr_timergui,0,timer_x,coin_y);
	scr_Draw_Text_Outlined(timer_x-1,coin_y+1,scr_Convert_Frames_To_Time(global.current_time_elapsed),c_white);
}

//PICKUPS
draw_set_font(fnt_combo);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

//cooldowns
if pickups_array[0].reload_on_bounce = false and pickups_array[0].enemies_count_max = 0 { //time cooldown
	if !(pickups_array[0].on_cooldown) {
		if pickups_array[0].is_synergy = true {
			draw_sprite(spr_synergy_animation,synergy_frame,48,88);
		}
		draw_sprite(pickups_array[0].gui_sprite,1,48,88);
		//darkening
		if pickups_array[0] = pickup_shieldbubble and instance_exists(obj_shieldbubble)
		or pickups_array[0] = pickup_slowmo and instance_exists(obj_slowmo)
		or pickups_array[0] = pickup_frenzy and frenzy = true 
		or pickups_array[0] = pickup_pogomode and pogomode = true 
		or pickups_array[0] = pickup_invincibility and invincibility = true 
		or pickups_array[0] = pickup_tripleshot and tripleshot = true 
		or pickups_array[0] = pickup_jolt and energy_buff > 0 
		or pickups_array[0] = pickup_blink and instance_exists(obj_blink_box) 
		or pickups_array[0] = pickup_parachute and instance_exists(obj_parachute)
		or (pickups_array[0] = pickup_winners) and instance_exists(obj_slot_machine) 
		or pickups_array[0] = pickup_winners and global.num_of_coins < pickup_winners.cost 
		or (pickups_array[0] = pickup_hacker) and (instance_exists(obj_slot_machine2) or instance_exists(obj_slowmo))
		or pickups_array[0] = pickup_hacker and global.num_of_coins < pickup_hacker.cost 
		or pickups_array[0] = pickup_chargejump and state = state_chargejump
		or pickups_array[0] = pickup_groundpound and state = state_groundpound
		or pickups_array[0] = pickup_bulletblast and state = state_bulletblast
		or pickups_array[0] = pickup_grappling and pickup_grappling.uses_per_bounce = 0
		or pickups_array[0] = pickup_harpoon and pickup_harpoon.uses_per_bounce = 0
		or pickups_array[0] = pickup_megabounce and (state = state_megabounce or state = state_megabounce_charge)
		or pickups_array[0] = pickup_blizzard and instance_exists(obj_blizzard)
		or pickups_array[0] = pickup_dragster and instance_exists(obj_parachute_dragster)
		or pickups_array[0] = pickup_wreckingball and instance_exists(obj_wreckingball)
		{
			draw_sprite_ext(spr_pickup_empty,1,48,88,1,1,0,c_black,0.5);
		}
	}else if pickups_array[0].cost <= 0 {
		draw_sprite_ext(spr_pickup_empty,0,48,88,1,1,0,c_white,1);
		if pickups_array[0].is_synergy = true {
			draw_sprite_part(spr_synergy_animation,synergy_frame,0,0,sprite_get_width(spr_pickup_empty)*(1-(pickups_array[0].cooldown_time/pickups_array[0].max_cooldown_time)),sprite_get_height(spr_pickup_empty),32,72);
		}
		draw_sprite_part(pickups_array[0].gui_sprite,1,0,0,sprite_get_width(spr_pickup_empty)*(1-(pickups_array[0].cooldown_time/pickups_array[0].max_cooldown_time)),sprite_get_height(spr_pickup_empty),32,72);
		//darkening
		draw_sprite_general(spr_pickup_empty,1,0,0,sprite_get_width(spr_pickup_empty)*(1-(pickups_array[0].cooldown_time/pickups_array[0].max_cooldown_time)),sprite_get_height(spr_pickup_empty),32,72,1,1,0,c_white,c_white,c_white,c_white,0.5);
		//draw_sprite_ext(spr_pickup_empty,1,48,88,1,1,0,c_black,0.5);
		if pickups_array[0] != pickup_nothing {
			//draw seconds left
			draw_set_font(fnt_item_popup);
			scr_Draw_Text_Outlined(48,104,string(ceil((pickups_array[0].cooldown_time+6)/60)-1) + "." + string(ceil(pickups_array[0].cooldown_time/6)%10),c_white); 
		}
	}
}else if pickups_array[0].enemies_count_max = 0 { //reload on bounce
	if !(pickups_array[0].on_cooldown) and pickups_array[0].max_cooldown_time < 0 {
		if pickups_array[0].is_synergy = true {
			draw_sprite(spr_synergy_animation,synergy_frame,48,88);
		}
		draw_sprite(pickups_array[0].gui_sprite,1,48,88);
	}else if pickups_array[0].max_cooldown_time < 0 and pickups_array[0].bounce_reset_max <= 1 {
		if pickups_array[0].is_synergy = true {
			draw_sprite(spr_synergy_animation,synergy_frame,48,88);
		}
		draw_sprite(pickups_array[0].gui_sprite,1,48,88);
		draw_sprite_ext(spr_pickup_empty,1,48,88,1,1,0,c_black,0.5);
	}
	if pickups_array[0].max_uses_per_bounce > 1 {
		//draw uses_left
		draw_set_font(fnt_combo);
		scr_Draw_Text_Outlined(46+16,104,pickups_array[0].uses_per_bounce,c_white);
	}else if pickups_array[0].max_cooldown_time > 0 { //jetpack
		//darkening
		draw_sprite_ext(spr_pickup_empty,0,48,88,1,1,0,c_white,1);
		
		draw_sprite_general(spr_pickup_empty,1,0,0,sprite_get_width(spr_pickup_empty)*(pickups_array[0].cooldown_time/pickups_array[0].max_cooldown_time),sprite_get_height(spr_pickup_empty),32,72,1,1,0,c_white,c_white,c_white,c_white,0.5);
		//draw_sprite_ext(spr_pickup_empty,1,48,88,1,1,0,c_black,0.5);
		//show fuel left
		if pickups_array[0].is_synergy = true {
			draw_sprite_part(spr_synergy_animation,synergy_frame,0,0,sprite_get_width(spr_pickup_empty)*(pickups_array[0].cooldown_time/pickups_array[0].max_cooldown_time),sprite_get_height(spr_pickup_empty),32,72);
		}
		draw_sprite_part(pickups_array[0].gui_sprite,1,0,0,sprite_get_width(spr_pickup_empty)*(pickups_array[0].cooldown_time/pickups_array[0].max_cooldown_time),sprite_get_height(spr_pickup_empty),32,72);
		//draw controls
		if (pickups_array[0].cooldown_time > 0) {
			scr_Draw_Input_UI(48,108,4,0,fnt_itemdescription2,fa_center,fa_middle);
		}
	}
	if pickups_array[0].bounce_reset_max > 1 { //freeze
		if pickups_array[0].on_cooldown = true {
			//darkening
			draw_sprite_ext(spr_pickup_empty,0,48,88,1,1,0,c_white,1);
			//show fuel left
			if pickups_array[0].is_synergy = true {
				draw_sprite_part(spr_synergy_animation,synergy_frame,0,0,sprite_get_width(spr_pickup_empty)*((pickups_array[0].bounce_reset_max-pickups_array[0].bounce_reset)/pickups_array[0].bounce_reset_max),sprite_get_height(spr_pickup_empty),32,72);
			}
			draw_sprite_part(pickups_array[0].gui_sprite,1,0,0,sprite_get_width(spr_pickup_empty)*((pickups_array[0].bounce_reset_max-pickups_array[0].bounce_reset)/pickups_array[0].bounce_reset_max),sprite_get_height(spr_pickup_empty),32,72);
			
			draw_sprite_general(spr_pickup_empty,1,0,0,sprite_get_width(spr_pickup_empty)*((pickups_array[0].bounce_reset_max-pickups_array[0].bounce_reset)/pickups_array[0].bounce_reset_max),sprite_get_height(spr_pickup_empty),32,72,1,1,0,c_white,c_white,c_white,c_white,0.5);
			//draw_sprite_ext(spr_pickup_empty,1,48,88,1,1,0,c_black,0.5);
			//draw bounces left
			draw_set_font(fnt_item_popup);
			scr_Draw_Text_Outlined(48,104,string(pickups_array[0].bounce_reset),make_color_rgb(207,138,203));
		}else if state = state_freeze {
			//darkening
			draw_sprite_ext(spr_pickup_empty,0,48,88,1,1,0,c_white,0.5);
			draw_sprite_ext(spr_pickup_empty,1,48,88,1,1,0,c_black,0.5);	
		}
	}
}else { //enemies count
	if !(pickups_array[0].on_cooldown) and pickups_array[0].max_cooldown_time < 0 {
		if pickups_array[0].is_synergy = true {
			draw_sprite(spr_synergy_animation,synergy_frame,48,88);
		}
		draw_sprite(pickups_array[0].gui_sprite,1,48,88);
	}else if pickups_array[0].max_cooldown_time < 0 and pickups_array[0].enemies_count_max <= 1 {
		if pickups_array[0].is_synergy = true {
			draw_sprite(spr_synergy_animation,synergy_frame,48,88);
		}
		draw_sprite(pickups_array[0].gui_sprite,1,48,88);
		draw_sprite_ext(spr_pickup_empty,1,48,88,1,1,0,c_black,0.5);
	}
	if pickups_array[0].on_cooldown = true {
		//darkening
		draw_sprite_ext(spr_pickup_empty,0,48,88,1,1,0,c_white,1);
		//show fuel left
		if pickups_array[0].is_synergy = true {
			draw_sprite_part(spr_synergy_animation,synergy_frame,0,0,sprite_get_width(spr_pickup_empty)*((pickups_array[0].enemies_count_max-pickups_array[0].enemies_count)/pickups_array[0].enemies_count_max),sprite_get_height(spr_pickup_empty),32,72);
		}
		draw_sprite_part(pickups_array[0].gui_sprite,1,0,0,sprite_get_width(spr_pickup_empty)*((pickups_array[0].enemies_count_max-pickups_array[0].enemies_count)/pickups_array[0].enemies_count_max),sprite_get_height(spr_pickup_empty),32,72);
		
		draw_sprite_general(spr_pickup_empty,1,0,0,sprite_get_width(spr_pickup_empty)*((pickups_array[0].enemies_count_max-pickups_array[0].enemies_count)/pickups_array[0].enemies_count_max),sprite_get_height(spr_pickup_empty),32,72,1,1,0,c_white,c_white,c_white,c_white,0.5);
		
		//draw_sprite_ext(spr_pickup_empty,1,48,88,1,1,0,c_black,0.5);
		//draw bounces left
		draw_set_font(fnt_item_popup);
		scr_Draw_Text_Outlined(48,104,string(pickups_array[0].enemies_count),make_color_rgb(180,82,82));
	}
	if pickups_array[0] = pickup_tacticalstrike and instance_exists(obj_blink_box_strike)  {
		draw_sprite_ext(spr_pickup_empty,1,48,88,1,1,0,c_black,0.5);
	}
}

if pickups_array[1].reload_on_bounce = false and pickups_array[1].enemies_count_max = 0 { //time
	if !(pickups_array[1].on_cooldown) {
		if pickups_array[1].is_synergy = true {
			draw_sprite(spr_synergy_animation,synergy_frame,103,88);
		}
		draw_sprite(pickups_array[1].gui_sprite,1,103,88);
		//shield bubble / slow mo darkening
		if pickups_array[1] = pickup_shieldbubble and instance_exists(obj_shieldbubble) 
		or pickups_array[1] = pickup_slowmo and instance_exists(obj_slowmo)
		or pickups_array[1] = pickup_frenzy and frenzy = true 
		or pickups_array[1] = pickup_pogomode and pogomode = true 
		or pickups_array[1] = pickup_invincibility and invincibility = true 
		or pickups_array[1] = pickup_tripleshot and tripleshot = true 
		or pickups_array[1] = pickup_jolt and energy_buff > 0 
		or pickups_array[1] = pickup_blink and instance_exists(obj_blink_box) 
		or pickups_array[1] = pickup_parachute and instance_exists(obj_parachute) 
		or (pickups_array[1] = pickup_winners) and instance_exists(obj_slot_machine) 
		or pickups_array[1] = pickup_winners and global.num_of_coins < pickup_winners.cost 
		or (pickups_array[1] = pickup_hacker) and (instance_exists(obj_slot_machine2) or instance_exists(obj_slowmo))
		or pickups_array[1] = pickup_hacker and global.num_of_coins < pickup_hacker.cost 
		or pickups_array[1] = pickup_chargejump and state = state_chargejump
		or pickups_array[1] = pickup_groundpound and state = state_groundpound
		or pickups_array[1] = pickup_bulletblast and state = state_bulletblast
		or pickups_array[1] = pickup_grappling and pickup_grappling.uses_per_bounce = 0
		or pickups_array[1] = pickup_harpoon and pickup_harpoon.uses_per_bounce = 0
		or pickups_array[1] = pickup_megabounce and (state = state_megabounce or state = state_megabounce_charge)
		or pickups_array[1] = pickup_blizzard and instance_exists(obj_blizzard)
		or pickups_array[1] = pickup_dragster and instance_exists(obj_parachute_dragster)
		or pickups_array[1] = pickup_wreckingball and instance_exists(obj_wreckingball)
		{
			draw_sprite_ext(spr_pickup_empty,1,103,88,1,1,0,c_black,0.5);
		}
	}else {
		draw_sprite_ext(spr_pickup_empty,0,103,88,1,1,0,c_white,1);
		if pickups_array[1].is_synergy = true {
			draw_sprite_part(spr_synergy_animation,synergy_frame,0,0,sprite_get_width(spr_pickup_empty)*(1-(pickups_array[1].cooldown_time/pickups_array[1].max_cooldown_time)),sprite_get_height(spr_pickup_empty),87,72);
		}
		draw_sprite_part(pickups_array[1].gui_sprite,1,0,0,sprite_get_width(spr_pickup_empty)*(1-(pickups_array[1].cooldown_time/pickups_array[1].max_cooldown_time)),sprite_get_height(spr_pickup_empty),87,72);
		//darkening
		
		draw_sprite_general(spr_pickup_empty,1,0,0,sprite_get_width(spr_pickup_empty)*(1-(pickups_array[1].cooldown_time/pickups_array[1].max_cooldown_time)),sprite_get_height(spr_pickup_empty),87,72,1,1,0,c_white,c_white,c_white,c_white,0.5);
		//draw_sprite_ext(spr_pickup_empty,1,103,88,1,1,0,c_black,0.5);
	
		if pickups_array[1] != pickup_nothing {
			//draw seconds left
			draw_set_font(fnt_item_popup);
			scr_Draw_Text_Outlined(103,104,string(ceil((pickups_array[1].cooldown_time+6)/60)-1) + "." + string(ceil(pickups_array[1].cooldown_time/6)%10),c_white); 
		}
	}
}else if pickups_array[1].enemies_count_max = 0 { //bounce cooldown
	if !(pickups_array[1].on_cooldown) and pickups_array[1].max_cooldown_time < 0 {
		if pickups_array[1].is_synergy = true {
			draw_sprite(spr_synergy_animation,synergy_frame,103,88);
		}
		draw_sprite(pickups_array[1].gui_sprite,1,103,88);
	}else if pickups_array[1].max_cooldown_time < 0 and pickups_array[1].bounce_reset_max <= 1 {
		if pickups_array[1].is_synergy = true {
			draw_sprite(spr_synergy_animation,synergy_frame,103,88);
		}
		draw_sprite(pickups_array[1].gui_sprite,1,103,88);
		draw_sprite_ext(spr_pickup_empty,1,103,88,1,1,0,c_black,0.5);
	}
	if pickups_array[1].max_uses_per_bounce > 1 {
		//draw uses_left
		draw_set_font(fnt_combo);
		scr_Draw_Text_Outlined(103+16,104,pickups_array[1].uses_per_bounce,c_white); 
	}else if pickups_array[1].max_cooldown_time > 0 { //jetpack
		//darkening
		draw_sprite_ext(spr_pickup_empty,0,103,88,1,1,0,c_white,1);
		
		draw_sprite_general(spr_pickup_empty,1,0,0,sprite_get_width(spr_pickup_empty)*(pickups_array[1].cooldown_time/pickups_array[1].max_cooldown_time),sprite_get_height(spr_pickup_empty),87,72,1,1,0,c_white,c_white,c_white,c_white,0.5);
		//draw_sprite_ext(spr_pickup_empty,1,103,88,1,1,0,c_black,0.5);
		//show fuel left
		if pickups_array[1].is_synergy = true {
			draw_sprite_part(spr_synergy_animation,synergy_frame,0,0,sprite_get_width(spr_pickup_empty)*(pickups_array[1].cooldown_time/pickups_array[1].max_cooldown_time),sprite_get_height(spr_pickup_empty),87,72);
		}
		draw_sprite_part(pickups_array[1].gui_sprite,1,0,0,sprite_get_width(spr_pickup_empty)*(pickups_array[1].cooldown_time/pickups_array[1].max_cooldown_time),sprite_get_height(spr_pickup_empty),87,72);
		//draw controls
		if (pickups_array[1].cooldown_time > 0) {
			scr_Draw_Input_UI(103,108,5,0,fnt_itemdescription2,fa_center,fa_middle);
		}
	}
	
	if pickups_array[1].bounce_reset_max > 1 { //freeze
		if pickups_array[1].on_cooldown = true {
			//darkening
			draw_sprite_ext(spr_pickup_empty,0,103,88,1,1,0,c_white,1);
			//show fuel left
			if pickups_array[1].is_synergy = true {
				draw_sprite_part(spr_synergy_animation,synergy_frame,0,0,sprite_get_width(spr_pickup_empty)*((pickups_array[1].bounce_reset_max-pickups_array[1].bounce_reset)/pickups_array[1].bounce_reset_max),sprite_get_height(spr_pickup_empty),87,72);
			}
			draw_sprite_part(pickups_array[1].gui_sprite,1,0,0,sprite_get_width(spr_pickup_empty)*((pickups_array[1].bounce_reset_max-pickups_array[1].bounce_reset)/pickups_array[1].bounce_reset_max),sprite_get_height(spr_pickup_empty),87,72);
			
			draw_sprite_general(spr_pickup_empty,1,0,0,sprite_get_width(spr_pickup_empty)*((pickups_array[1].bounce_reset_max-pickups_array[1].bounce_reset)/pickups_array[1].bounce_reset_max),sprite_get_height(spr_pickup_empty),87,72,1,1,0,c_white,c_white,c_white,c_white,0.5);
			//draw_sprite_ext(spr_pickup_empty,1,103,88,1,1,0,c_black,0.5);
			//draw bounces left
			draw_set_font(fnt_item_popup);
			scr_Draw_Text_Outlined(103,104,string(pickups_array[1].bounce_reset),make_color_rgb(207,138,203));
		}else if state = state_freeze {
			//darkening
			draw_sprite_ext(spr_pickup_empty,0,103,88,1,1,0,c_white,0.5);
			draw_sprite_ext(spr_pickup_empty,1,103,88,1,1,0,c_black,0.5);
		}
	}
}else { //enemies cooldown	
	if !(pickups_array[1].on_cooldown) and pickups_array[1].max_cooldown_time < 0 {
		if pickups_array[1].is_synergy = true {
			draw_sprite(spr_synergy_animation,synergy_frame,103,88);
		}
		draw_sprite(pickups_array[1].gui_sprite,1,103,88);
	}else if pickups_array[1].max_cooldown_time < 0 and pickups_array[1].enemies_count_max <= 1 {
		if pickups_array[1].is_synergy = true {
			draw_sprite(spr_synergy_animation,synergy_frame,103,88);
		}
		draw_sprite(pickups_array[1].gui_sprite,1,103,88);
		draw_sprite_ext(spr_pickup_empty,1,103,88,1,1,0,c_black,0.5);
	}
	if pickups_array[1].on_cooldown = true {
		//darkening
		draw_sprite_ext(spr_pickup_empty,0,103,88,1,1,0,c_white,1);
		//show fuel left
		if pickups_array[1].is_synergy = true {
			draw_sprite_part(spr_synergy_animation,synergy_frame,0,0,sprite_get_width(spr_pickup_empty)*((pickups_array[1].enemies_count_max-pickups_array[1].enemies_count)/pickups_array[1].enemies_count_max),sprite_get_height(spr_pickup_empty),87,72);
		}
		draw_sprite_part(pickups_array[1].gui_sprite,1,0,0,sprite_get_width(spr_pickup_empty)*((pickups_array[1].enemies_count_max-pickups_array[1].enemies_count)/pickups_array[1].enemies_count_max),sprite_get_height(spr_pickup_empty),87,72);
		
		draw_sprite_general(spr_pickup_empty,1,0,0,sprite_get_width(spr_pickup_empty)*((pickups_array[1].enemies_count_max-pickups_array[1].enemies_count)/pickups_array[1].enemies_count_max),sprite_get_height(spr_pickup_empty),87,72,1,1,0,c_white,c_white,c_white,c_white,0.5);
		
		//draw_sprite_ext(spr_pickup_empty,1,103,88,1,1,0,c_black,0.5);
		//draw bounces left
		draw_set_font(fnt_item_popup);
		scr_Draw_Text_Outlined(103,104,string(pickups_array[1].enemies_count),make_color_rgb(180,82,82));
	}
	
	if pickups_array[1] = pickup_tacticalstrike and instance_exists(obj_blink_box_strike)  {
		draw_sprite_ext(spr_pickup_empty,1,103,88,1,1,0,c_black,0.5);
	}
}

if pickups_array[0] = pickup_nothing {
	draw_sprite_ext(spr_pickup_empty,0,48,88,1,1,0,c_white,1);
}

if pickups_array[1] = pickup_nothing {
	draw_sprite_ext(spr_pickup_empty,0,103,88,1,1,0,c_white,1);
}

if pickups_array[0] != pickup_nothing {
	draw_set_font(fnt_itemdescription2);
	scr_Draw_Text_Outlined(48,88-13,scr_Linebreak(pickups_array[0]._name,12,99),pickups_array[0].text_color);
}

if pickups_array[1] != pickup_nothing {
	draw_set_font(fnt_itemdescription2);
	scr_Draw_Text_Outlined(103,88-13,scr_Linebreak(pickups_array[1]._name,12,99),pickups_array[1].text_color);
}


//button 1
if !(pickups_array[0].on_cooldown) and pickups_array[0] != pickup_nothing 
and !(pickups_array[0] = pickup_shieldbubble and instance_exists(obj_shieldbubble) 
or (pickups_array[0] = pickup_winners and global.num_of_coins < pickup_winners.cost)
or (pickups_array[0] = pickup_winners and instance_exists(obj_slot_machine))
or (pickups_array[0] = pickup_hacker and global.num_of_coins < pickup_hacker.cost)
or (pickups_array[0] = pickup_hacker) and instance_exists(obj_slot_machine2)
or pickups_array[0] = pickup_frenzy and frenzy = true
or pickups_array[0] = pickup_invincibility and invincibility = true
or pickups_array[0] = pickup_tripleshot and tripleshot = true 
or pickups_array[0] = pickup_jolt and energy_buff > 0 
or pickups_array[0] = pickup_pogomode and pogomode = true
or pickups_array[0] = pickup_parachute and instance_exists(obj_parachute)
or pickups_array[0] = pickup_chargejump and state = state_chargejump
or pickups_array[0] = pickup_groundpound and state = state_groundpound
or pickups_array[0] = pickup_bulletblast and state = state_bulletblast
or pickups_array[0] = pickup_grappling and pickup_grappling.uses_per_bounce = 0
or pickups_array[0] = pickup_harpoon and pickup_harpoon.uses_per_bounce = 0
or pickups_array[0] = pickup_megabounce and (state = state_megabounce or state = state_megabounce_charge)
or pickups_array[0] = pickup_blizzard and instance_exists(obj_blizzard)) {
	scr_Draw_Input_UI(48,108,4,0,fnt_itemdescription2,fa_center,fa_middle);
}
//button 2
if !(pickups_array[1].on_cooldown) and pickups_array[1] != pickup_nothing 
and !(pickups_array[1] = pickup_shieldbubble and instance_exists(obj_shieldbubble) 
or (pickups_array[1] = pickup_winners and global.num_of_coins < pickup_winners.cost)
or (pickups_array[1] = pickup_winners and instance_exists(obj_slot_machine))
or (pickups_array[1] = pickup_hacker and global.num_of_coins < pickup_hacker.cost)
or pickups_array[1] = pickup_hacker and  instance_exists(obj_slot_machine2)
or pickups_array[1] = pickup_frenzy and frenzy = true
or pickups_array[1] = pickup_invincibility and invincibility = true
or pickups_array[1] = pickup_tripleshot and tripleshot = true 
or pickups_array[1] = pickup_jolt and energy_buff > 0 
or pickups_array[1] = pickup_pogomode and pogomode = true
or pickups_array[1] = pickup_parachute and instance_exists(obj_parachute)
or pickups_array[1] = pickup_chargejump and state = state_chargejump
or pickups_array[1] = pickup_groundpound and state = state_groundpound
or pickups_array[1] = pickup_bulletblast and state = state_bulletblast
or pickups_array[1] = pickup_grappling and pickup_grappling.uses_per_bounce = 0
or pickups_array[1] = pickup_harpoon and pickup_harpoon.uses_per_bounce = 0
or pickups_array[1] = pickup_megabounce and (state = state_megabounce or state = state_megabounce_charge)
or pickups_array[1] = pickup_blizzard and instance_exists(obj_blizzard)) {
	scr_Draw_Input_UI(103,108,5,0,fnt_itemdescription2,fa_center,fa_middle);
}

//all buffs
if (global.show_passives = true) {
	for (i = 0; i < array_length(global.all_buff_sprites); i++) {
		var xx = 24;
		var yy = 186;//camera_get_view_height(view_camera[0]) - 16;
		draw_sprite(global.all_buff_sprites[i],global.all_buff_sprites_index[i]+1,xx+(i%4)*20,yy+(18*(floor(i/4))));
		
		//items menu
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_set_font(fnt_combo2);
		draw_set_color(make_color_rgb(242,240,229));
		scr_Draw_Text_Outlined(16,yy-16,"Passive items: ",c_white);


		//numbers of each buff
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_itemdescription2);
		if global.all_buff_numbers[i] > 1 {
			scr_Draw_Text_Outlined(xx+(i%4)*20-6,yy+4+(18*(floor(i/4))),global.all_buff_numbers[i],c_white);
		}
	}
}

//items menu
draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_set_font(fnt_combo2);
draw_set_color(make_color_rgb(242,240,229));
scr_Draw_Text_Outlined(17,124,"Items info: ",c_white);
if global.use_controller = true {
	draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[13][0]),2,83,124);
}else {
	var keyboard_array_value = global.keyboard_array[13][0];
	var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
	if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
		if is_string(keyboard_text) {
			draw_text(78,124,keyboard_text);
		}else {
			draw_sprite(keyboard_text,0,79,124);
		}
	}else {
		var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
		draw_sprite(mouse_sprite,0,83,124);	
	}
}

draw_set_color(c_white);

//shield bubble timer
if instance_exists(obj_shieldbubble) and invincibility_time <= 0 {
	draw_set_color(make_color_rgb(242,240,229));
	draw_set_font(fnt_combo2);
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	if obj_shieldbubble.destroy_time_live > 0 {
		scr_Draw_Text_Outlined(17,156-7,"Shield Bubble",pickup_shieldbubble.text_color);
		draw_set_color(c_white);
		draw_sprite(spr_shieldbubblemeter,0,17,156);
		draw_sprite_part(spr_shieldbubblemeter,1,0,0,sprite_get_width(spr_shieldbubblemeter)*(obj_shieldbubble.destroy_time_live / (obj_shieldbubble.destroy_time * global.bar_time_added)),sprite_get_height(spr_shieldbubblemeter),17,156-4);
	}
}

//invincibility timer
if invincibility_time > 0 {
	draw_set_color(make_color_rgb(242,240,229));
	draw_set_font(fnt_combo2);
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	scr_Draw_Text_Outlined(17,156-7,"Invincibility",pickup_invincibility.text_color);
	draw_set_color(c_white);
	draw_sprite(spr_invincibilitymeter,0,17,156);
	draw_sprite_part(spr_invincibilitymeter,1,0,0,sprite_get_width(spr_invincibilitymeter)*(invincibility_time / (invincibility_time_max * global.bar_time_added)),sprite_get_height(spr_invincibilitymeter),17,156-4);
}

//slot machine
//draw_sprite(spr_slotmachine,0,384,100);