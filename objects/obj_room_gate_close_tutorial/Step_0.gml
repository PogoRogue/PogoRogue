/// @description Don't inherit event
if destroy = true {
	if text_created = false {
		if !instance_exists(obj_fade_in) {
			with instance_create_depth(x,y,depth,obj_gate_unlocked) {
				gate_obj = instance_nearest(x,y,obj_room_gate_close_tutorial);	
			}
		}	
		text_created = true;
	}
	if scr_Animation_Complete() {
		instance_create_depth(x,y,depth+1,obj_room_gate_open);
		instance_destroy();		
	}
}