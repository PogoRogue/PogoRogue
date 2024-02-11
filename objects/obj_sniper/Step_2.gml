/// @description follow player
//image_angle = obj_player.image_angle-90;
x = obj_player.x + laser_x;
y = obj_player.y + laser_y;
x = parent_obj.x+lengthdir_x(32*i,image_angle);
y = parent_obj.y+lengthdir_y(32*i,image_angle);

//change sprite after animation complete
if (floor(image_index) = sprite_get_number(sprite_index)-1) {
	sprite_index = full_sprite;
	mask_index = sprite_index;
}

//retract laser
if (floor(image_index) <= 1 and image_speed = -1) {
	instance_destroy();
}

//cant damage enemies if out of view
if instance_exists(obj_camera) {
	camera_width = camera_get_view_width(view_camera[0])/2;
	camera_height = camera_get_view_height(view_camera[0])/2;
	var padding = 128;

	if !(point_in_rectangle(x,y,obj_camera.x-camera_width-padding,obj_camera.y-camera_height-padding,obj_camera.x+camera_width+padding,obj_camera.y+camera_height+padding)) {
		damage = 0;
	}else {
		damage = init_damage;	
	}
}

with obj_player {
	if (state != state_free or gun != sniper_gun) {
		scr_Retract_Laser();
		other.laser_boost = false;
	}	
}

if laser_boost = true {
	laser_boost = false;
	scr_Retract_Laser();
	cut_sound = false;
}

//change sprite after animation complete
if (floor(image_index) = sprite_get_number(sprite_index)-1) {
	sprite_index = full_sprite;
	mask_index = sprite_index;
	laser_boost = true;
}
