/// @description Draw health cells either full or empty
draw_set_alpha(global.ui_alpha);
if obj_player.aspect_ratio = 1 {
	display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
}
if global.draw_ui = true {
for(var _i = 0; _i < max_hp; _i += 8) {
	if (_i < hp) {
		draw_sprite(spr_heart_ui, 0, 28 + (_i * 3), 32);
		if heart_gain_num > 0 and heart_gain_num-8 = _i {
			instance_create_depth(28 + (_i * 3), 32,depth-1,obj_heart_gain);
			heart_gain_num = 0;	
		}
	} else {
		draw_sprite(spr_heart_ui, 1, 28 + (_i * 3), 32);
		if heart_lost_num >= 0 and heart_lost_num = _i {
			instance_create_depth(28 + (_i * 3), 32,depth-1,obj_heart_lost);
			heart_lost_num = -0;	
		}
	}
}


//armor
for(var _j = 0; _j < armor_buff; _j += 1) {
	draw_sprite(spr_heart_shield_ui, 0, 28 + (max_hp/8 * 24) + (_j * 24), 32);
	if heart_shield_gain_num > 0 and heart_shield_gain_num-1 = _j {
		instance_create_depth(28 + (max_hp/8 * 24) + (_j * 24), 32,depth-1,obj_heart_shield_gain);
		show_debug_message("shield gained!");
		heart_shield_gain_num = 0;	
	}
	if heart_shield_lost_num > 0 and heart_shield_lost_num-1 = _j {
		instance_create_depth(28 + (max_hp/8 * 24) + (_j * 24), 32,depth-1,obj_heart_shield_lost);
		show_debug_message("shield lost!");
		heart_shield_lost_num = 0;	
	}
}


//energy

for(var _k = 0; _k < energy_buff; _k += 1) {
	//draw_sprite(spr_heart_energy_ui, 0, 28 + (max_hp/8 * 24) + (armor_buff*24) + (_k * 24), 32);
	/*if heart_energy_gain_num > 0 and heart_energy_gain_num-1 = _k {
		//instance_create_depth(28 + (max_hp/8 * 24) + (armor_buff*24) + (_k * 24), 32,depth-1,obj_heart_energy_gain);
		show_debug_message("energy gained!");
		heart_energy_gain_num = 0;	
	}*/
	/*if heart_energy_lost_num > 0 and heart_energy_lost_num-1 = _k {
		instance_create_depth(28 + (max_hp/8 * 24) + (armor_buff*24) + (_k * 24), 32,depth-1,obj_heart_energy_lost);
		show_debug_message("energy lost!");
		heart_energy_lost_num = 0;	
	}*/
}

if heart_shield_lost_num > 0  {
	instance_create_depth(28 + (max_hp/8 * 24) + (_j * 24), 32,depth-1,obj_heart_shield_lost);
	show_debug_message("shield lost!");
	heart_shield_lost_num = 0;	
}

if heart_energy_lost_num > 0  {
	//instance_create_depth(28 + (max_hp/8 * 24) + (armor_buff*24) + (_k * 24), 32,depth-1,obj_heart_energy_lost);
	show_debug_message("energy lost!");
	heart_energy_lost_num = 0;	
}

}
draw_set_alpha(1);