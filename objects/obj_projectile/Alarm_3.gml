with closest_water_object {
	angle2 = point_direction(x,y,other.x,other.y);
	for (i = 0; i < point_distance(x,y,other.x,other.y); i+=4) {
		with instance_create_depth(x+lengthdir_x(i,angle2),y+lengthdir_y(i,angle2),depth,obj_projectile) {
			image_angle = other.image_angle;
			sprite_index = other.sprite_index;
			spd = other.spd;
			destroy_on_impact = other.destroy_on_impact;
			destroy_time = other.destroy_time;
			flash_frame = other.flash_frame;
			gun_name = other.gun_name;
			grav_affected = other.grav_affected;
			grv = other.grv;
			num_of_bounces = other.num_of_bounces;
			bounce_amount = other.bounce_amount;
			damage = 0;
			water_index = other.water_index;
		}
	}
}