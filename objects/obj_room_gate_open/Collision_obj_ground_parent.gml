/// @description Create width fitting gate
if mask_index != spr_gate_open_mask {
	instance_create_depth(x,y,depth,obj_room_gate_open_width_fitting);
	instance_destroy(self);
}