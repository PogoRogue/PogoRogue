if still = true and !gamepad_button_check(0,gp_face3) {
	if y_add > -2 and y_up = true {
		y_add_spd = (2 - abs(y_add))/8 + 0.025;
		y_add -= y_add_spd;

	}else if y_up = true {
		y_up = false;
		y_add_spd = 0;
	}
	if y_add < 2 and y_up = false {
		y_add_spd = (2 - abs(y_add))/8 + 0.025;
		y_add += y_add_spd;
	}else if y_up = false {
		y_up = true;
		y_add_spd = 0;
	}
	y = init_y + y_add;
}

if point_distance(x,y,end_x, end_y+y_add) > 5 and still = false {
	if spd < 7 {
		spd += 1;	
	}
	var dist = point_distance(x,y,end_x, end_y+y_add);
	var speed_multiply = 1; 
	
	if(dist <= 100){
		speed_multiply = dist / 100;
	}
	
	move_towards_point(end_x, end_y, spd * speed_multiply);
}else if spd > 0 {
	speed = 0;
	init_x = x;
	init_y = y;
	spd = 0;
	still = true;
}

if changesprite = true {
	if changesprite_close = true {
		if changesprite_frame < sprite_get_number(spr_tutorial_off)-2 {
			changesprite_frame += 0.5;
		}else {
			changesprite_close = false;
			animation_sprite = next_sprite;
			if next_sprite = spr_tutorial_shoot {
				next_sprite = spr_tutorial_walljump;
				
				end_x = 416;
				end_y = 5056;
				still = false; 
				y_up = true; 
				y_add = 0;
				
				with obj_drone_tutorial {
					end_x = 216;
					end_y = 5232;
					still = false; 
					y_up = true; 
					y_add = 0;	
				}
			}else if next_sprite = spr_tutorial_walljump {
				next_sprite = spr_tutorial_switchweapons;
			}
		}
	}else if still = true {
		if changesprite_frame > 0 {
			changesprite_frame -= 1;
		}else {
			changesprite_close = true;
			changesprite = false;
		}
	}
}

if animation_sprite != spr_tutorial_walljump {
	animation_frame += 0.25;
}else {
	animation_frame += 0.36;
}