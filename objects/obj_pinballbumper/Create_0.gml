activated = false;
spawned = true;
airbag = false;
not_meeting = false;

while position_meeting(bbox_left,y,obj_ground) and !position_meeting(bbox_right,y,obj_ground) {
	x += 1;
}

while !position_meeting(bbox_left,y,obj_ground) and position_meeting(bbox_right,y,obj_ground) {
	x -= 1;
}