/// @description delete
if (parent_index.vspeed > 0 and despawnable) or (abs(parent_index.speed) < parent_index.min_flames_speed and despawnable) {
	despawn = true;
}

//alpha
if (despawn = false) {
	obj_player.invincible = true;
}else if despawn = true {
	image_alpha -= 0.2;
	//destroy
	if image_alpha <= 0 {
		instance_destroy();	
		obj_player.invincible = false;
	}
}

if megabounce = false {
	obj_player.angle = init_angle;
}else if despawn = false {
	damage = 16;
	obj_player.rotation_speed = obj_player.original_rotation_speed*1;
	//obj_player.direction = obj_player.angle + 90;	
}

if global.key_fire_projectile_released and released = false {
	obj_player.can_shoot = true;	
	released = true;
}else if released = false {
	obj_player.can_shoot = false;	
}

show_debug_message(obj_player.speed);