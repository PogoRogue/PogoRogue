/// @description Rotate around boss

if immune = true {
	mask_index = spr_nothing;
}else {
	mask_index = sprite_index;	
}

// Inherit the parent event
event_inherited();

vspeed = 1.2 * sin(spd);

spd += 0.05;

if explode = true {
	image_speed = 0;
	speed = 0;
	mask_index = spr_nothing;
	if red_alpha < 1.2 {
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

if instance_exists(shield) {
	if shield.is_active = true {
		shield.image_alpha = image_alpha;	
	}
}

if is_dead = true {
	speed = 0;	
}