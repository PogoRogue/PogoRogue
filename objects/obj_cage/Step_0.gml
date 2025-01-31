key_interact = global.key_interact;

if global.skins_unlocked_array[skin_num-1] = true {
	image_alpha = 0;
	mask_index = spr_nothing;
}else {
	image_alpha = 1;
	mask_index = sprite_index;
}



if is_colliding = true and key_interact and !instance_exists(speechbubble_obj) {
	if skin_num = 1 {
		speechbubble_obj = instance_create_depth(x-1,y - 128,depth-1,obj_speechbubble,{text_color: make_color_rgb(184,181,185),
		text_array: ["要是你能把\n我们全都救\n出去, 我们\n就能一起让\n那些家伙吃\n律师函了！", "问题是, 我\n们想不起\n来是谁把\n我们关在这\n里的了..."],
		lines_of_text: 2,
		parent_index: instance_nearest(x,y+128,obj_cage),
		});
	}if skin_num = 2 {
		speechbubble_obj = instance_create_depth(x-1,y - 128,depth-1,obj_speechbubble,{text_color: make_color_rgb(184,181,185), 
		text_array: ["喵, 喵喵. \n喵喵, 喵喵\n喵喵喵?"],
		lines_of_text: 1, 
		parent_index: instance_nearest(x,y+128,obj_cage)});	
	}else if skin_num = 3 {
		speechbubble_obj = instance_create_depth(x-1,y - 128,depth-1,obj_speechbubble,{text_color: make_color_rgb(184,181,185), 
		text_array: ["什么样的神\n会允许自己\n的六个造物\n遭受如此残\n酷的命运？", "把一个人关\n在这么狭小\n的地方, 不\n仅禁锢了身体, \n还腐蚀了每\n一丝灵魂...", "哦...我是说, \n汪! 汪! 汪! \n汪! 汪! 汪! \n汪! 汪! 汪! ", "汪! 汪! 汪! \n汪! 汪! 汪! \n汪! 汪! 汪!"],
		lines_of_text: 4, 
		size2: false, //true
		chars_per_line: 22,
		parent_index: instance_nearest(x,y+128,obj_cage)});	
	}else if skin_num = 4 {
		speechbubble_obj = instance_create_depth(x-1,y - 128,depth-1,obj_speechbubble,{text_color: make_color_rgb(184,181,185), 
		text_array: ["错误: 无法提\n供更多对\n话内容"],
		lines_of_text: 1, 
		parent_index: instance_nearest(x,y+128,obj_cage)});	
	}else if skin_num = 5 {
		speechbubble_obj = instance_create_depth(x-1,y - 128,depth-1,obj_speechbubble,{text_color: make_color_rgb(184,181,185), 
		text_array: [".....","..........","................................","拜托伙计, 我\n正试图保持\n些神秘感呢."],
		lines_of_text: 4, 
		parent_index: instance_nearest(x,y+128,obj_cage)});	
	}else if skin_num = 6 {
		speechbubble_obj = instance_create_depth(x-1,y - 128,depth-1,obj_speechbubble,{text_color: make_color_rgb(184,181,185), 
		text_array: ["放我出去\n！！！"],
		lines_of_text: 1, 
		parent_index: instance_nearest(x,y+128,obj_cage)});	
	}
	
}else if distance_to_object(obj_player) > 128 and instance_exists(speechbubble_obj) and is_colliding = false {
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