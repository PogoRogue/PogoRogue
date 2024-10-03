key_left = global.key_left_menu;
key_right = global.key_right_menu;
key_up = global.key_up_menu;
key_down = global.key_down_menu;

if obj_player.pickup_1 = obj_player.pickup_tacticalstrike {  
	key_select = global.key_pickup_1_pressed;
	key_fire = global.key_fire_projectile_pressed;
}else if obj_player.pickup_2 = obj_player.pickup_tacticalstrike {  
	key_select = global.key_pickup_2_pressed;
	key_fire = global.key_fire_projectile_pressed;
}else {
	key_select = 0;
	key_fire = 0;
}

if key_left or key_right or key_up or key_down {
	moved = true;	
}

if draw_respawn = false and obj_player.image_yscale = 0 {
	if (place_meeting(x-move_speed,y,obj_ground)) and key_left {
		while !place_meeting(x-1,y,obj_ground){
			x -= 1;
		}
		key_left = 0;
	}
	if (place_meeting(x+move_speed,y,obj_ground)) and key_right {
		while !place_meeting(x+1,y,obj_ground) {
			x += 1;
		}
		key_right = 0;
	}
	if ( place_meeting(x,y-move_speed,obj_ground)) and key_up {
		while !place_meeting(x,y-1,obj_ground) {
			y -= 1;
		}
		key_up = 0;
	}
	if (place_meeting(x,y+move_speed,obj_ground)) and key_down {
		while !place_meeting(x,y+1,obj_ground){
			y += 1;
		}
		key_down = 0;
	}
	x += (-key_left + key_right) * move_speed;
	y += (-key_up + key_down) * move_speed;
}

//view restraints
sprite_half = sprite_get_width(sprite_index)/2;
x = min(x,camera_get_view_x(view_camera[0])+(camera_get_view_width(view_camera[0])-sprite_half));
x = max(x,camera_get_view_x(view_camera[0])+sprite_half);
y = min(y,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])-sprite_half));
y = max(y,camera_get_view_y(view_camera[0])+sprite_half);

//check gates
for(i = 0; i < 1536; i+=16) {
	if place_meeting(x+i,y,obj_room_gate_close) {
		gate_object = instance_place(x+i,y,obj_room_gate_close);
		outside_gates = true;
	}else if place_meeting(x-i,y,obj_room_gate_close) {
		gate_object = instance_place(x-i,y,obj_room_gate_close);
		outside_gates = true;
	}
	//boss gates
	if place_meeting(x+i,y,obj_boss_gate_close) {
		gate_object = instance_place(x+i,y,obj_boss_gate_close);
		outside_gates = true;
	}else if place_meeting(x-i,y,obj_boss_gate_close) {
		gate_object = instance_place(x-i,y,obj_boss_gate_close);
		outside_gates = true;
	}
}

for(j = 0; j < 512; j+=16) {
	//shop gates
	if place_meeting(x+j,y,obj_room_gate_open_shop) {
		if init_y < instance_place(x+j,y,obj_room_gate_open_shop).y {
			gate_object = instance_place(x+j,y,obj_room_gate_open_shop);
			outside_gates = true;
		}
	}else if place_meeting(x-j,y,obj_room_gate_open_shop) {
		if init_y < instance_place(x-j,y,obj_room_gate_open_shop).y {
			gate_object = instance_place(x-j,y,obj_room_gate_open_shop);
			outside_gates = true;
		}
	}
}

//check boss gates
with(obj_boss_gate_close) {
	if(self.y > other.y) {
		other.gate_object = self;
		other.outside_gates = true;
	}
}

if place_meeting(x+i,y,obj_room_gate_close) {
	gate_object = instance_place(x+i,y,obj_room_gate_close);
	outside_gates = true;
}

if outside_gates = true {
	if !instance_exists(gate_object) {
		outside_gates = false;
		gate_object = noone;
	}else if gate_object.object_index != obj_room_gate_open_shop {
		if bbox_top > gate_object.bbox_bottom {
			outside_gates = false;
			gate_object = noone;
		}
	}else {
		if bbox_bottom < gate_object.bbox_top {
			outside_gates = false;
			gate_object = noone;
		}
	}
}

var not_free = place_meeting(x,y,obj_ground) or place_meeting(x,y,obj_ground_tiles) or place_meeting(x,y,obj_ground_tiles_outer) or place_meeting(x,y,obj_pinballbumper) or place_meeting(x,y,obj_spike) or outside_gates = true;
//check if area is open
if  not_free {
	free = false;
	image_index = 1;
	if place_meeting(x,y,obj_enemy_parent) and shots_left > 0 {
		image_index = 2;
	}
}else if place_meeting(x,y,obj_enemy_parent) and shots_left > 0 {
	image_index = 2;
	free = true;
}else {
	image_index = 0;
	free = true;	
}

//timer
if time_left > 0 {
	time_left -= 1;	
}else {
	time_end = true;
}

if free = true {
	if key_select or time_end = true {
		draw_respawn = true;
		with obj_player {
			x = other.x+other.x_diff;
			y = other.y+other.y_diff;
		}
	}
	//fire nuke
	if key_fire and shots_left > 0 {
		scr_Screen_Shake(10,8,true);
		instance_create_depth(x,y,depth+1,obj_strike_placed);
		shots_left -= 1;
		flash = true;
		alarm[0] = 5;
	}
}else {
	if key_select {
		audio_play_sound(snd_unavailable,0,false);
	}
	if time_end = true and draw_respawn = false {
		draw_respawn = true;
		audio_play_sound(snd_unavailable,0,false);
	}
	
	//on enemy
	if image_index = 2 {
		//fire nuke
		if key_fire and shots_left > 0 {
			scr_Screen_Shake(10,8,true);
			instance_create_depth(x,y,depth+1,obj_strike_placed);
			shots_left -= 1;
			flash = true;
			alarm[0] = 5;
		}
	}
}
obj_camera.follow = self;

if draw_respawn = true {
	
	if new_xscale != init_xscale {
		new_xscale += 0.1 * sign(init_xscale);
	}
	if new_yscale != init_yscale {
		new_yscale += 0.1 * sign(init_yscale);
	}else {
		//finish code here	
		with obj_player {
			audio_play_sound(snd_blink_respawn,0,false);
			state = state_free;	
			can_rotate = true;
			can_shoot = true;
			pickup_tacticalstrike.on_cooldown = true;
			pickup_tacticalstrike.enemies_count = pickup_tacticalstrike.enemies_count_max;
			pickup_tacticalstrike.cooldown_time = pickup_tacticalstrike.max_cooldown_time;
			mask_index = sprite_index;
			with obj_player_mask {
				mask_index = sprite_index;
			}
			image_xscale = other.init_xscale;
			image_yscale = other.init_yscale;
		}
		obj_camera.follow = obj_player;
		instance_destroy();
	}
}

//alpha
if (arrows_alpha > 0 and moved = true and obj_player.image_yscale = 0) {
	arrows_alpha -= 0.05;	
}

if flash = true {
	image_index=3;	
}