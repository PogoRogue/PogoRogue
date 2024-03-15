vspeed += obj_player.grv;

if place_meeting(x,y,obj_ground) or (place_meeting(x,y+vspeed,obj_ground_oneway) and vspeed > 0) {
	instance_destroy();
}

if scr_Animation_Complete() {
	instance_destroy();	
}