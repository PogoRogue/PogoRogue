/// @description Bob up and down
key_interact = global.key_interact;

if y_add > -4 and y_up = true {
	y_add_spd = (4 - abs(y_add))/8 + 0.025;
	y_add -= y_add_spd;

}else if y_up = true {
	y_up = false;
	y_add_spd = 0;
}
if y_add < 4 and y_up = false {
	y_add_spd = (4 - abs(y_add))/8 + 0.025;
	y_add += y_add_spd;
}else if y_up = false {
	y_up = true;
	y_add_spd = 0;
}

y = init_y + y_add;

if distance_to_object(obj_player) < 128 {
	if obj_player.x < x {
		image_xscale = 1;
	}else {
		image_xscale = -1;
	}
}

if room = room_starting_area {
	if distance_to_object(obj_player) < 100 {
		colliding = true;	
	}else {
		colliding = false;
	}
}

if colliding and key_interact and !instance_exists(speechbubble_obj) {
	speechbubble_obj = instance_create_depth(x-1,bbox_top-40,depth-1,obj_speechbubble,{text_color: make_color_rgb(138,176,96), 
	text_array: ["hey dude. you \nshould totally \nstop by my shop later or \nsomething.","you don't have to though... \nwhatever \nworks best for \nyou man.", "it's totally \ncool either \nway..."],
	lines_of_text: 3, 
	
	parent_index: obj_salesman, 
	track_y: true});
}else if distance_to_object(obj_player) > 240 and room = room_starting_area {
	with (speechbubble_obj) {	
		if retract = false {
			retract = true;
			audio_play_sound(snd_speechbubble_close,0,false);
		}
		destroy_on_retract = true;
		activated = false;
		type_text = false;
		animation_speed = 0.5;
		scrolling_text = "";
		current_character = 0;
	}
}