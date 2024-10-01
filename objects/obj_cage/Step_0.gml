key_interact = global.key_interact;

if global.skins_unlocked_array[skin_num-1] = true {
	image_alpha = 0;
	mask_index = spr_nothing;
}else {
	image_alpha = 1;
	mask_index = sprite_index;
}



if is_colliding = true and key_interact and !instance_exists(speechbubble_obj) {
	if skin_num = 2 {
		speechbubble_obj = instance_create_depth(x-1,y - 128,depth-1,obj_speechbubble,{text_color: make_color_rgb(184,181,185), 
		text_array: ["Meow, meow \nmeow. Meow \nmeow, meow \nmeow meow?"],
		lines_of_text: 1, 
		parent_index: instance_nearest(x,y+128,obj_cage)});	
	}else if skin_num = 3 {
		speechbubble_obj = instance_create_depth(x-1,y - 128,depth-1,obj_speechbubble,{text_color: make_color_rgb(184,181,185), 
		text_array: ["What kind of \ngod would \nallow his creations to be subjected to \nsuch a cruel fate?", "To confine one \nto a space so \nrestrictive not only degrades the body, but corrodes \nthe very fiber \nof one's soul.", "I mean, bark!"],
		lines_of_text: 3, 
		size2: true,
		parent_index: instance_nearest(x,y+128,obj_cage)});	
	}else if skin_num = 4 {
		speechbubble_obj = instance_create_depth(x-1,y - 128,depth-1,obj_speechbubble,{text_color: make_color_rgb(184,181,185), 
		text_array: ["Beep Boop.","Boop Beep.", "ERROR: Out of dialogue options.", "Self-destructing in 10, 9, 8, 7, 6, 5..."],
		lines_of_text: 4, 
		parent_index: instance_nearest(x,y+128,obj_cage)});	
	}else if skin_num = 5 {
		speechbubble_obj = instance_create_depth(x-1,y - 128,depth-1,obj_speechbubble,{text_color: make_color_rgb(184,181,185), 
		text_array: [".....","..........","................................","C'mon dude, I'm trying to be mysterious \nover here."],
		lines_of_text: 4, 
		parent_index: instance_nearest(x,y+128,obj_cage)});	
	}else if skin_num = 6 {
		speechbubble_obj = instance_create_depth(x-1,y - 128,depth-1,obj_speechbubble,{text_color: make_color_rgb(184,181,185), 
		text_array: ["Get me out of here!!!"],
		lines_of_text: 1, 
		parent_index: instance_nearest(x,y+128,obj_cage)});	
	}
	
}else if distance_to_object(obj_player) > 128 and instance_exists(speechbubble_obj) and is_colliding = false {
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