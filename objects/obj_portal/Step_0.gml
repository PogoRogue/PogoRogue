if place_meeting(x,y,obj_shop_door) {
	instance_destroy();
	obj_player.state = obj_player.state_free;
	obj_player.image_xscale = 1;
	obj_player.image_yscale = 1;
}

if obj_player.state != obj_player.state_spawn {
	if scale > 0 {
		scale -= 0.05;
	}
	if scale <= 1 {
		image_xscale = scale;	
		image_yscale = scale;	
	}
}