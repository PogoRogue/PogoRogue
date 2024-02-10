/// delete tar
// 你可以在此编辑器中写入代码 
	
if(place_meeting(x, y, obj_player)) {
	obj_player.vsp_basicjump = diminished_player_jump;
	is_touching_player = true;
	wobble = 0.4;
} else if(is_touching_player){
	obj_player.vsp_basicjump = initial_player_jump;
	is_touching_player = false;
}

// Cause wobble effect
wobble *= 0.95;
stretch += wobble;
image_yscale = 1.0 + (0.25 * sin(stretch));

if(is_despawning) {
	image_alpha *= 0.9;
}

