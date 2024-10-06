/// @description Override
if room = room_proc_gen_test {
	if place_meeting(x-1,y,obj_crate1) and !place_meeting(x+1,y,obj_crate1) {
		depth += 5;
		x -= 24;
	}
	if !place_meeting(x-1,y,obj_crate1) and !place_meeting(x+1,y,obj_crate1) and place_meeting(x,y+1,obj_crate1) {
		depth += 5;
		x -= 12;
	}
}