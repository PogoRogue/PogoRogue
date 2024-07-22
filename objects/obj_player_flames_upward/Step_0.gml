/// @description delete
if (parent_index.vspeed >= 0 and despawnable) or (parent_index.speed < parent_index.min_flames_speed and despawnable) {
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

obj_player.angle = init_angle;