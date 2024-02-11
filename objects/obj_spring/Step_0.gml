state();

//snap to nearest ground
while(!place_meeting(x,y+1,obj_ground) and !place_meeting(x,y+1,obj_ground_oneway) and state = state_unsprung) {
	y++;	
}