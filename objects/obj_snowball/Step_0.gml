//destroy
if instance_exists(obj_camera) {
	if x < obj_camera.x - (obj_camera.view_w_half) - 32 {
		instance_destroy();	
	}
	if y > obj_camera.y + (obj_camera.view_w_half) + 32 {
		instance_destroy();	
	}
}else {
	instance_destroy();	
}

if !instance_exists(obj_blizzard) {
	hspeed = -10*1.5;
	vspeed = (10);
	x -= x_add;
	y += y_add;
}

if image_alpha < 0.5 {
	mask_index = spr_nothing;	
}else {
	mask_index = sprite_index;
}