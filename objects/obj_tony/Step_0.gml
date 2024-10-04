/// @description Bob up and down
key_interact = global.key_interact;

if obj_player.x < x {
	image_xscale = 1;
}else {
	image_xscale = -1;
}

if room = room_starting_area {
	if distance_to_object(obj_player) < 100 {
		colliding = true;	
	}else {
		colliding = false;
	}
}

if colliding and key_interact and !instance_exists(speechbubble_obj) {
	speechbubble_obj = instance_create_depth(x-1,bbox_top-16,depth-1,obj_speechbubble,{text_color: make_color_rgb(104,194,211), 
	text_array: ["It's tough \nbeing the less \nsuccessful twin.", 
	"Sometimes I \nreally hate \nnominative \ndeterminism..."],
	lines_of_text: 2, 
	parent_index: obj_tony});
}else if distance_to_object(obj_player) > 240 {
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