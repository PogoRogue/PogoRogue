/*for (i = 2; i < 48; i++) {
	instance_create_depth(x+lengthdir_x(32*i,image_angle+180),y+lengthdir_y(32*i,image_angle+180),depth,obj_laser, {
		image_angle: image_angle,
		damage: damage,
		parent_obj: other,
		i: i,
		destroy_on_impact: destroy_on_impact,
		full_sprite: spr_projectile_laser,
		mask_index: spr_nothing,
		rotation_speed: rotation_speed
	});
}