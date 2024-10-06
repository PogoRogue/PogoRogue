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

if obj_player.x < x {
	image_xscale = 1;
}else {
	image_xscale = -1;
}

if distance_to_object(obj_player) < 100 {
	colliding = true;	
}else {
	colliding = false;
}

if colliding and key_interact and !instance_exists(speechbubble_obj) {
	speechbubble_obj = instance_create_depth(x,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
	text_array: ["Good timing dude! \nI just finished \ninstalling the \nbasketball hoops.", 
	"We should play a game of P.O.G.O. sometime!", 
	"Oh dear, I didn't \nconsider that being \na drone might give \nme a bit of an \nadvantage..."],
	lines_of_text: 3, 
	parent_index: obj_drone, 
	track_y: true,
	size2: true,
	chars_per_line: 22});
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