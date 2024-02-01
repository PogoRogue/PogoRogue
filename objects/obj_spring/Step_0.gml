state();

//snap to nearest ground
while(!place_meeting(x,y+1,obj_ground) and state = state_unsprung) {
	y++;	
}