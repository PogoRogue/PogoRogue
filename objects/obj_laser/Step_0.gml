/// @description follow player
//image_angle = obj_player.image_angle-90;
//x = obj_player.x + laser_x;
//y = obj_player.y + laser_y;
/*
x = parent_obj.x+lengthdir_x(32*instance,obj_player.image_angle-90);
y = parent_obj.y+lengthdir_y(32*instance,obj_player.image_angle-90);

//image_angle = obj_player.image_angle-90;
//x = obj_player.x +laser_x+lengthdir_x(32*instance,obj_player.image_angle-90);
//y = obj_player.y +laser_y+lengthdir_y(32*instance,obj_player.image_angle-90);

if (gun_name = "Laser Gun" ) {
	
	//image_angle = obj_player.image_angle-90;
	x = obj_player.x +laser_x + (lengthdir_x(32*instance,obj_player.image_angle-90));
	y = obj_player.y +laser_y + (lengthdir_y(32*instance,obj_player.image_angle-90));
	
}


/*
with obj_player {
	//retract laser if not firing
	if !(key_fire_projectile) or gun != laser_gun {
		scr_Retract_Laser();
	}
	
	//delete if out of ammo
	if (gun.current_bullets = 0) {
		scr_Retract_Laser();
	}
	
	//delete if not free
	if (state != state_free and state != state_freeze) {
		scr_Retract_Laser();
	}
}*/
	


