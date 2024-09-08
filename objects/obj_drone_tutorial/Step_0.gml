/// @description Bob up and down
if still = true {
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
}

if obj_player.x < x {
	image_xscale = 1;
}else {
	image_xscale = -1;
}


if distance_to_point(end_x, end_y+y_add) > 5 and still = false {
	if spd < 7 {
		spd += 1;	
	}
	var dist = distance_to_point(end_x, end_y);
	var speed_multiply = 1; 
	
	if(dist <= 100){
		speed_multiply = dist / 100;
	}
	
	move_towards_point(end_x, end_y, spd * speed_multiply);
}else if spd > 0 {
	speed = 0;
	init_x = x;
	init_y = y;
	spd = 0;
	still = true;
	if current_speechbubble = -1 {
		current_speechbubble = 0;	
		with speechbubble_obj_1 {
			awake = true;	
		}
	}
}

//create next speechbubble
current_bubble_exists = false;

for (i=0;i<array_length(speechbubble_array);i++) {
	with obj_speechbubble {
		if bubble_num = other.current_speechbubble+1 {
			other.current_bubble_exists = true;
		}
	}
}

if current_bubble_exists = false and current_speechbubble != -1 and still = true {
	current_speechbubble += 1;
	if current_speechbubble < array_length(speechbubble_array) {
		with speechbubble_array[current_speechbubble] {
			alarm[2] = 45;
		}
	}
}


//specific cases
if current_speechbubble = 10 and (global.combo >= 5) { //COMBO
	end_x = 528; end_y = 176; still = false; retract_current_bubble = true; y_up = true; y_add = 0;
}

if current_speechbubble = 1 and (obj_player.num_of_weapons != 0 or instance_exists(obj_item_weapon_default)) //PISTOL
or retract_current_bubble and current_speechbubble < array_length(speechbubble_array) {
	with speechbubble_array[current_speechbubble] {
		retract = true;
		destroy_on_retract = true;
		activated = false;
		type_text = false;
		animation_speed = 0.5;
		scrolling_text = "";
		current_character = 0;
	}
	retract_current_bubble = false;
}

if current_speechbubble = 6 and (obj_player.num_of_pickups != 0 or instance_exists(obj_item_pickup_firedash)) //FIRE DASH
or retract_current_bubble and current_speechbubble < array_length(speechbubble_array) {
	with speechbubble_array[current_speechbubble] {
		retract = true;
		destroy_on_retract = true;
		activated = false;
		type_text = false;
		animation_speed = 0.5;
		scrolling_text = "";
		current_character = 0;
	}
	retract_current_bubble = false;
}

if current_speechbubble = 8 and (obj_player.num_of_weapons != 1 or instance_exists(obj_item_weapon_paintball)) //PAINTBALL GUN
or retract_current_bubble and current_speechbubble < array_length(speechbubble_array) {
	with speechbubble_array[current_speechbubble] {
		retract = true;
		destroy_on_retract = true;
		activated = false;
		type_text = false;
		animation_speed = 0.5;
		scrolling_text = "";
		current_character = 0;
	}
	retract_current_bubble = false;
}

//delete speech bubble on quick transitions
if delete_speech_bubble = true and instance_exists(obj_speechbubble) {
	with speechbubble_array[current_speechbubble] {
		retract = true;
		destroy_on_retract = true;
		activated = false;
		type_text = false;
		animation_speed = 4;
		scrolling_text = "";
		current_character = 0;
	}
	delete_speech_bubble = false;
}
