gate_obj = instance_nearest(x,y,obj_room_gate_open);

for (i = 0; i < 64; i++) {
	if place_meeting(x+16*i,y+16,obj_ground) and !place_meeting(x+16*i,y+16,obj_room_gate_open_width_fitting) 
	and !place_meeting(x+16*i,y+16,obj_room_gate_open) {
		instance_create_depth(x+16*i,y+16,depth,obj_camera_constrain_y_top);
	}
}