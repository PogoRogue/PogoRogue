state();

//snap to nearest ground
while(!place_meeting(x,y+1,obj_ground) and !place_meeting(x,y+1,obj_ground_oneway) and state = state_unsprung) {
	y++;	
}

if adjusted = false and place_meeting(x,y+1,obj_ground) or adjusted = false and place_meeting(x,y+1,obj_ground_oneway){
	//adjust to platform 
	if !position_meeting(bbox_left+1,y+1,obj_ground) and !position_meeting(bbox_left+1,y+1,obj_ground_oneway) {
		x += 16;
		adjusted = true;
	}else if !position_meeting(bbox_right-1,y+1,obj_ground) and !position_meeting(bbox_right-1,y+1,obj_ground_oneway) {
		x -= 16;
		adjusted = true;
	}	
}