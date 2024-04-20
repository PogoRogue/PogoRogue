/// @description Destroy self

if(collide_with_walls) {
	if(bounce) {
		 if (place_meeting(x + hspeed, y, obj_ground)) {
			 hspeed=-hspeed*bounce_mod;
		 } if (place_meeting(x, y+vspeed, obj_ground)) {
			 vspeed=-vspeed*bounce_mod;
		 }
	} else {
	    instance_destroy(self);
	}
}

