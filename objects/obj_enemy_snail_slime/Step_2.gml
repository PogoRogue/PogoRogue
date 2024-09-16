/// delete tar
// 你可以在此编辑器中写入代码 
	/*
if(place_meeting(x, y, obj_player)) {
	obj_player.vsp_basicjump = diminished_player_jump;
	is_touching_player = true;
	wobble = 0.4;
} else if(is_touching_player){
	obj_player.vsp_ basicjump = initial_player_jump;
	is_touching_player = false;
}*/
if (is_touching_player) {
	//depth = obj_player.depth - 1;
	if !(place_meeting(x, y, obj_player)) {
		obj_player.vsp_basicjump = initial_player_jump;
		is_touching_player = false;
	}
}else {
	//depth = 6;
}

// Cause wobble effect
if wobble > 0 {
	wobble *= 0.95;
	stretch += wobble;
	image_yscale = 1.0 + (0.25 * sin(stretch));
}

if(is_despawning) {
	//image_alpha *= 0.9;
}

if distance_to_object(obj_player) > 2000 and !obj_player.dead {
	instance_destroy();	
}

/*
if place_meeting(x,y,obj_player) {
	depth = obj_player.depth - 10;
}else {
	depth = 10;	
}
