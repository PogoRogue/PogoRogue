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
	speechbubble_obj = instance_create_depth(x-1,bbox_top-16,depth-1,obj_speechbubble,{text_color: make_color_rgb(207,138,203), 
	text_array: ["不是我吹牛，但咱的\n店刚刚被《POGO\n精选》杂志评为年度\n最佳企业. 这已经是\n连续第117年了！", 
	"幸好《谢尔曼反垄断\n法》已经是历史了，\n不然咱早就关门大\n吉咯 :)",
	"现在我得去搞清楚\n那些弄丢的道具去\n哪了。这样，第118\n个奖杯就稳拿了！"],
	lines_of_text: 3, 
	size2: true,
	chars_per_line: 22,
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