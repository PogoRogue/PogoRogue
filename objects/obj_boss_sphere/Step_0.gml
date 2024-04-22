/// @description Handle movement
if spawned = true {

if(!is_dead) {
	hspeed = spd * sign(hspeed);
	vspeed = spd * sign(vspeed);
} else {
	hspeed = 0;
	vspeed = 0;
}

image_angle -= rotation_spd;

// If surrounded, brick cannot be damaged
if(instance_place_list(x, y, obj_boss_brick, ds_list_create(), false) >= 9) {
	hp = hp_max;
	is_dead = false;
}

// Inherit the parent event
//event_inherited();

hp_percent = (hp / hp_max) * 100;

if hp <= 0 {
	explode = true;
	
	with obj_boss_brick {
		explode = true;
		speed = 0;
		mask_index = spr_nothing;
		image_speed = 0;
	}
	
	// Destroy all deached bricks
	
	with obj_subboss_exploding {
		explode = true;
		speed = 0;
		mask_index = spr_nothing;
		image_speed = 0;
	}
	with obj_subboss_fly_chasing {
		explode = true;
		speed = 0;
		mask_index = spr_nothing;
		image_speed = 0;
	}
	with obj_subboss_shield {
		explode = true;
		speed = 0;
		mask_index = spr_nothing;
		image_speed = 0;
	}
	with obj_subboss_shield_isolated {
		explode = true;
		speed = 0;
		mask_index = spr_nothing;
		image_speed = 0;
	}
}

if explode = true {
	mask_index = spr_nothing;
	speed = 0;
	if red_alpha < 1.25 {
		red_alpha += 0.025;
	}else {
		instance_destroy();
	}
}

// Update iframes
current_iframes = max(current_iframes - 1, 0);

// Update red shader frames
red_frames = max(red_frames - 1, 0);

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
		vspeed = spd;
		hspeed = spd;
	}
}