/// @description Draw tiles
draw_self();


xx = 0;

if image_xscale = 1 {
	while !position_meeting(x+xx+1,y,obj_ground) {
		xx += 16;
	}
}else {
	while !position_meeting(x-1+xx,y+1,obj_ground) {
		xx -= 16;
	}
}



with laser_obj {
	
	if sprite_index = spr_laser_middle_animation {
		draw_sprite_ext(spr_laser_start_animation,image_index,other.x+other.xx-(6*other.image_xscale),start_y,-other.image_xscale,1,image_angle,c_white,1);	
	}else {
		draw_sprite_ext(spr_laserside,image_index,other.x+other.xx-(6*other.image_xscale),start_y,-other.image_xscale,1,image_angle,c_white,1);		
	}
	xxx = other.xx-(42*other.image_xscale);
}

draw_sprite_ext(sprite_index,image_index,x+xx,y,-image_xscale,1,image_angle,c_white,1);

