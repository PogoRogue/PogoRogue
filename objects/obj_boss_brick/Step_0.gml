/// @description Track parent's movement

// Update position and angle based off boss

if spawned = true {

	image_angle = boss.image_angle;
	rad = degtorad(image_angle);

	if(is_dead) {
		wobble++;
		image_angle += 8 * sin(wobble);
	}

	x = boss.x + (cos(rad - boss_dir) * dist);
	y = boss.y - (sin(rad - boss_dir) * dist);


	// Damage boss slightly when piece gets knocked off
	if(hp <= 0 && damage != 0) {
		boss.hp--;
		damage = 0;
	}

	// If surrounded, brick cannot be damaged
	if(collision_point(x + 32, y, obj_boss_brick, true, true)) {
		if(collision_point(x - 32, y, obj_boss_brick, true, true)) {
			if(collision_point(x, y + 32, obj_boss_brick, true, true)) {
				if(collision_point(x, y - 32, obj_boss_brick, true, true)) {
					hp = hp_max;
					is_dead = false;
				}
			}
		}
	}




	if explode = true {
		speed = 0;
		mask_index = spr_nothing;
		if red_alpha < 1.2 {
			red_alpha += 0.025;
		}else {
			instance_destroy();
			instance_create_layer(x, y, "enemies", obj_explosion);
		}
	}else {
		// Inherit the parent event
		event_inherited();	
	
		draw_hp = hp < hp_max;

		mask_index = sprite_index;
	}
	
	if white_alpha > 0 {
		white_alpha -= 0.05;
	}
}else {
	speed = 0;
	image_speed = 0;
	if white_alpha < 1 {
		white_alpha += 0.05;
	}else {
		spawned = true;
	}
}