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
	text_array: ["我们家的手艺都已\n经传承好几代了","我的曾祖母事实上就\n是跳杆锻造技术的\n发明人",
	"但很遗憾，她在一次\n悲惨的独轮车祸中\n去世了。我决定努\n力用我的工作来\n纪念她。", "我甚至报了独轮车的\n课程，为了确保自\n己不会落得同样的\n下场。"],
	lines_of_text: 4, 
	size2: true,
	chars_per_line: 22,
	parent_index: obj_pogosmith, 
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

