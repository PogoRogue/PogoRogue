if (gun_name = "Water Gun") {
	
	if image_index = 0 {
		draw_sprite_ext(sprite_index,3,x,y,1,1,angle2,c_white,image_alpha);
	}
	if instance_exists(closest_water_object) {
		with closest_water_object {
			angle2 = point_direction(x,y,other.x,other.y);
			image_angle = angle2;
			for (i = 0; i < point_distance(x,y,other.x,other.y); i+=4) {
				if !place_meeting(x+lengthdir_x(i,angle2),y+lengthdir_y(i,angle2),obj_ground) or global.drilltipbullets = true {
					draw_sprite_ext(sprite_index,1,x+lengthdir_x(i,angle2),y+lengthdir_y(i,angle2),1,1,angle2,c_white,image_alpha);	
					if image_index = 1 {
						draw_sprite_ext(sprite_index,0,x+lengthdir_x(i,angle2),y+lengthdir_y(i,angle2),1,1,angle2,c_white,image_alpha);	
					}
				}
			}
		}
	}
	
	if draw_fill = true {
		draw_sprite_ext(sprite_index,1,x,y,1,1,angle2,c_white,image_alpha);
	}
	
	if image_index = 0 or used_as_closest_object = false {
		draw_sprite_ext(sprite_index,4,x,y,1,1,angle2+180,c_white,image_alpha);
	}
	if first_object = false {
		draw_sprite_ext(sprite_index,4,x,y,1,1,angle2,c_white,image_alpha);
	}
	
}