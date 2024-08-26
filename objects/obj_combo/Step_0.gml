if global.combo_length > 0 and room != room_boss_1 and room != room_boss_2 and room != room_boss_3 and obj_player.table = false {
	if global.combo > 0 and global.enemy_killed = true {
		global.combo_length -= combo_decrease_speed;
	}else if global.enemy_killed = true {
		global.combo_length = 0;
	}else {
		global.combo_length = global.combo_max;
	}
}else if room != room_boss_1 and room != room_boss_2 and room != room_boss_3 and obj_player.table = false {
	global.combo = 0;
}else if obj_player.table = false {
	global.combo_length = global.combo_max;
}

combo_decrease_speed = global.combo_max/(600+global.combo_time_added); //# of frames for each combo to last

//increase combo meter size
if increase_combometer_scale = false and global.combo > prev_combo {
	prev_combo = global.combo;
	increase_combometer_scale = true;
	var temp_combo = global.combo;
	if temp_combo > 10 {
		temp_combo = 10;	
	}
	temp_combo /= 10;
	temp_combo -= 0.7;
	combometer_scale = 1.8 + temp_combo;
	/*
	red = 237;
	green = 225;
	blue = 158;
	red2 = 237;
	green2 = 225;
	blue2 = 158;
	*/
}

if combometer_scale > 1 {
	combometer_scale -= 0.04;
	increase_combometer_scale = true;
}else {
	combometer_scale = 1;
	increase_combometer_scale = false;
}

if global.combo = 0 {
	prev_combo = global.combo;
	if room = room_tutorial {
		with obj_enemy_tutorial {
			if image_index = 1 and init_add_to_combo = true {
				instance_destroy();
				with instance_create_layer(self.x,self.y,"Instances",obj_enemy_tutorial) {
					add_to_combo = other.init_add_to_combo;
					init_add_to_combo = other.init_add_to_combo;
				}	
			}
		}
	}
}

//check if combo is new best
if global.combo > global.best_combo { //best combo across all runs
	global.best_combo = global.combo;
	scr_Save_Real("best_combo",global.best_combo);
}

if global.combo > global.current_best_combo {
	global.current_best_combo =  global.combo;	
}

//tutorial unlock gate
if room = room_tutorial and global.combo >= 5 {
	with obj_room_gate_close_tutorial {
		//instance_create_depth(x,y,depth,obj_room_gate_open);
		//instance_destroy(self);	
		destroy = true;
		sprite_index = spr_gate_open_new;
		//image_index = 1;
		image_speed = 1;
	}
}

//reset meter color back to white
if red < 255 {
	red += 2;	
}else {
	red = 255;	
}

if green < 255 {
	green += 2;	
}else {
	green = 255;	
}

if blue < 255 {
	blue += 4;	
}else {
	blue = 255;	
}

if red2 < 242 {
	red2 += 2;	
}else {
	red2 = 242;	
}

if green2 < 240 {
	green2 += 2;	
}else {
	green2 = 240;	
}

if blue2 < 229 {
	blue2 += 4;	
}else {
	blue2 = 229;	
}


meter_color = make_color_rgb(red,green,blue);
text_color = make_color_rgb(red2,green2,blue2);