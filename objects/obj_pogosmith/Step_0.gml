/// @description Insert description here
key_interact = global.key_interact;

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
	speechbubble_obj = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(211,160,104), 
	text_array: ["The Smith family legacy goes back for generations.","My great grandmother is actually known as the great grandmother of Pogosmithing.",
	"It's a shame that she died in a tragic unicycling accident. I try to honor her with my work.", "I've even begun taking unicycling lessons to make sure I don't meet the same fate."],
	lines_of_text: 4, 
	size2: true,
	chars_per_line: 22,
	parent_index: obj_pogosmith, 
	track_y: true});
}else if distance_to_object(obj_player) > 240 and room = room_starting_area {
	with (speechbubble_obj) {	
		retract = true;
		destroy_on_retract = true;
		activated = false;
		type_text = false;
		animation_speed = 0.5;
		scrolling_text = "";
		current_character = 0;
	}
}

