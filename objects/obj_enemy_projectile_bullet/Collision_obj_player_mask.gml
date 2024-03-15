/// @description Destroy self
if(bounce){
	 if (place_meeting(x + hspeed, y, obj_ground)){
		 hspeed=-hspeed;
	 } if (place_meeting(x, y+vspeed, obj_ground)){
		 vspeed=-vspeed;
	 }
}else{	
    instance_destroy(self);
}


