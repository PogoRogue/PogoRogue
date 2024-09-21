/// @description Rotate around boss

if immune = true {
	mask_index = spr_nothing;
}else {
	mask_index = sprite_index;	
}

// Inherit the parent event
if (drop == false) {
	if (image_index == 4) {
		sprite_index=spr_B1_Shield_Move;
		drop = true;
	}
}

if (drop == true) {
	event_inherited();

	if(instance_exists(boss)) and is_dead = false {
		// Update position and angle based off boss
		image_angle = point_direction(boss.x, boss.y, x, y)-90;
		boss_dir += rot_spd;

		new_x = boss.x - (cos(boss_dir) * dist);
		new_y = boss.y + (sin(boss_dir) * dist);

		direction = point_direction(x, y, new_x, new_y);
		if speed < min(4.0, distance_to_point(new_x, new_y))  * spd_mult {
			speed += 0.1;
		}else {
			speed = min(4.0, distance_to_point(new_x, new_y))  * spd_mult;
		}
		
	} else {
		image_angle = lerp(image_angle, 0, 0.01);
		hspeed = lerp(image_angle, 0, 0.01);
		vspeed = 1.2 * sin(spd);
		spd += 0.05;
	}
}

if explode = true {
	image_speed = 0;
	speed = 0;
	mask_index = spr_nothing;
	if red_alpha < 0.75 {
		red_alpha += 0.025;
	}else {
		instance_destroy();
		instance_create_layer(x, y, "enemies", obj_explosion);
	}
}

// Update iframes
current_iframes = max(current_iframes - 1, 0);

// Update red shader frames
red_frames = max(red_frames - 1, 0);
/*
if instance_exists(shield) {
	if shield.is_active = true {
		shield.image_alpha = image_alpha;	
	}
}*/

if is_dead = true {
	speed = 0;	
}

//laser
if laser_up = true {
	if laser_alpha < 1 {
		laser_alpha += 1/room_speed;
	}else {
		laser_up = false;
	}
}else {
	laser_alpha = 0;
}