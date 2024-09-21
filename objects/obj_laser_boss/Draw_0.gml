if spawned2 = true and instance_exists(parent_index) {
	draw_self();
	//draw_sprite_ext(spr_laser_start_animation,image_index,start_x,start_y,1,1,image_angle,c_white,1);
	if sprite_index = spr_laser {
		draw_sprite_ext(spr_laserside,image_index,start_x,start_y,sign(image_xscale),1,parent_index.image_angle+90,c_white,1);
		//draw_sprite_ext(spr_laserside,image_index,bbox_right,start_y,-1,1,image_angle,c_white,1);
	}else {
		draw_sprite_ext(spr_laser_start_animation,image_index,start_x,start_y,sign(image_xscale),1,parent_index.image_angle+90,c_white,1);	
		//draw_sprite_ext(spr_laser_start_animation,image_index,bbox_right,start_y,-1,1,image_angle,c_white,1);
	}
}