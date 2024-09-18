/// @description 

lerp_destination = draw_cutin ? 1.0 : 0.0;

alpha = lerp(backdrop_scale, lerp_destination, alpha_lerp_speed*2);
backdrop_scale = lerp(backdrop_scale, lerp_destination, backdrop_lerp_speed*2);
text_scale = lerp(text_scale, lerp_destination, text_lerp_speed*2);

if(triggered) {
	with(obj_player) {
		state = state_immobile;
	}
	room_height = lerp(room_height, 600, 0.02);
}

