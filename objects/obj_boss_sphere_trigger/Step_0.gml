/// @description 

key_select1 = global.key_pickup_1_pressed;
key_select2 = global.key_pickup_2_pressed;
key_select3 = global.key_select;

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

if backdrop_scale > 0.8 and (key_select1 or key_select2 or key_select3) and draw_cutin = true {
	draw_cutin = false;
	alarm_set(1, 1 * room_speed);
}