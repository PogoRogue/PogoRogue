if obj_player.pickup_1 = obj_player.pickup_wreckingball {  
	key_retract = global.key_pickup_1_pressed;
}else if obj_player.pickup_2 = obj_player.pickup_wreckingball {  
	key_retract = global.key_pickup_2_pressed;
}else {
	key_retract = 0;
	if retract = false {
		audio_play_sound(snd_wreckingball_retract,0,false);	
		retract = true;
	}
}

grapple_x = obj_player.x;
grapple_y = obj_player.y;

if rope_angle < 0 {
	rope_angle = 360 - abs(rope_angle)
}

//show_debug_message(rope_angle % 360);

var rope_angle_acceleration = -0.1 * dcos(rope_angle);


//rotate player
if rope_angle % 360 > 180 and rope_angle % 360 < 360 {
	
	rope_angle_velocity += rope_angle_acceleration;
	if obj_player.key_left and !obj_player.key_right  {
		rope_angle_velocity += 0.3 + (rope_angle_acceleration);
		moved = true;
	}else if obj_player.key_right and !obj_player.key_left {
		rope_angle_velocity -= 0.3 - (rope_angle_acceleration);
		moved = true;
	}else {
		rope_angle_velocity *= 0.99;
		rope_angle_velocity += rope_angle_acceleration;
	}
	
	if  sound_playable = true {
		randomize();
		var woosh = audio_play_sound(choose(snd_wreckingball_woosh,snd_wreckingball_woosh2,snd_wreckingball_woosh3),0,false);
		audio_sound_gain(woosh, abs(rope_angle_velocity)/6, 100);
		sound_playable = false;
		random_set_seed(global.seed);
	}

}else {
	rope_angle_velocity += rope_angle_acceleration*3;
	sound_playable = true;
}	
if rope_angle_velocity < 0 {
	
}

rope_angle += added_spd;

//rope_angle_velocity = min(3,rope_angle_velocity);
//rope_angle_velocity = max(-3,rope_angle_velocity);

//show_debug_message(rope_angle_velocity);

rope_angle += rope_angle_velocity;

rope_angle_velocity = min(7,rope_angle_velocity);
rope_angle_velocity = max(-7,rope_angle_velocity);

if rope_length < rope_length_max and !retract {
	rope_length += 8;
}

if obj_player.state = obj_player.state_portal or obj_player.state = obj_player.state_shop_portal 
or obj_player.table = true or obj_player.state = obj_player.state_pogosmith {
	retract = true;	
}

if (key_retract or instance_exists(obj_blink_box) or instance_exists(obj_blink_box_strike)) and can_retract = true 
or instance_exists(obj_deathscreen) and can_retract = true {
	if retract = false {
		audio_play_sound(snd_wreckingball_retract,0,false);	
		retract = true;
	}
}else if !key_retract {
	can_retract = true;	
}

if retract {
	if rope_length > 32-(abs(rope_angle_velocity)*4) {
		rope_length -= 8;
	}else {
		instance_destroy();	
	}
	if place_meeting(x,y,obj_player_mask) {
		instance_destroy();	
	}
}
	
rope_x = grapple_x + lengthdir_x(rope_length+(abs(rope_angle_velocity)*2),rope_angle);
rope_y = grapple_y + lengthdir_y(rope_length+(abs(rope_angle_velocity)*2),rope_angle);

if distance_to_point(obj_player.x,obj_player.y) <= rope_length+(abs(rope_angle_velocity)*4) {
	vspd += grav;
}else{
	
}



y += vspd;

x = rope_x;
y = rope_y;

if !place_meeting(x,y,obj_enemy_parent) {
	enemies_array = [];
}

image_angle += rope_angle_velocity/2;

//alpha
if (arrows_alpha > 0 and moved = true) {
	arrows_alpha -= 0.05;	
}