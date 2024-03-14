//draw trail
if (gun_name = "Bouncy Ball Blaster") {
	draw_self();
	image_angle = direction;
	with instance_create_depth(x,y,depth+1,obj_bbb_trail) {
		image_index = other.num_of_bounces+2;
		image_alpha = 0.95;
	}
}else if (gun_name = "Yo-yo") {
	var yscale = (point_distance(x,y,obj_player.x,obj_player.y) / sprite_get_height(spr_projectile_yoyo_string));
	var dir = point_direction(x,y,obj_player.x,obj_player.y) - 90;
	draw_sprite_ext(spr_projectile_yoyo_string,0,x,y,sign(obj_player.image_xscale),yscale,dir,c_white,1);
	draw_self();
}else if (gun_name = "Water Gun") {
	
	if image_index = 0 {
		draw_sprite_ext(sprite_index,3,x,y,1,1,angle2,c_white,1);
	}
	if instance_exists(closest_water_object) {
		with closest_water_object {
			angle2 = point_direction(x,y,other.x,other.y);
			image_angle = angle2;
			for (i = 0; i < point_distance(x,y,other.x,other.y); i+=4) {
				draw_sprite_ext(sprite_index,1,x+lengthdir_x(i,angle2),y+lengthdir_y(i,angle2),1,1,angle2,c_white,1);	
				if image_index = 1 {
					draw_sprite_ext(sprite_index,0,x+lengthdir_x(i,angle2),y+lengthdir_y(i,angle2),1,1,angle2,c_white,1);	
				}
			}
		}
	}
	
}else {
	draw_self();
}