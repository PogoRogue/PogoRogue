/// @description create gate unlocked text
if !instance_exists(obj_fade_in) {
	with instance_create_depth(x,y,depth,obj_gate_unlocked) {
		gate_obj = instance_nearest(x,y,obj_room_gate_open);	
	}
}