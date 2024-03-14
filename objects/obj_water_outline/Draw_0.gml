if instance_exists(parent_obj) {
	
	if instance_exists(parent_obj.closest_water_object) {
		with parent_obj.closest_water_object {
			var angle2 = point_direction(x,y,other.parent_obj.x,other.parent_obj.y);
			for (i = 0; i < point_distance(x,y,other.parent_obj.x,other.parent_obj.y); i+=4) {
				draw_sprite_ext(sprite_index,2,x+lengthdir_x(i,angle2),y+lengthdir_y(i,angle2),1,1,image_angle,c_white,1);	
			}
		}
	}
	draw_self();
}