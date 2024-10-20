/// @description On destroy

//create bubble pop
if (gun_name = "Bubble Gun") {
	instance_create_depth(x,y,depth,obj_projectile_bubble_pop);
	audio_play_sound(snd_bubblepop,0,false);
}

//create explosion
if (gun_name = "Grenade Launcher") or (gun_name = "Missile Launcher") {
	if instance_exists(obj_camera) {
		with instance_create_depth(x,y,depth,obj_projectile_explosion) {
			damage = other.damage;
		}
		audio_stop_sound(sound);
	}
}

//give player a boost
if (gun_name = "Star Sucker") {
	with obj_player {
		if state != state_freeze {
			speed = 0;
			motion_add(angle - 90, vsp_basicjump*1.1);
		}
	}
	//screen shake
	scr_Screen_Shake(5, 10, true);
	if (global.allow_screenshake) {
		var controller_vibration = global.controller_vibration/100;
		//gamepad_set_vibration(0, 1*controller_vibration, 1*controller_vibration);
	}
}

if (gun_name = "Yo-yo") {
	with obj_player {
		if gun_1._name = "Yo-yo" {
			if gun_1.current_bullets < gun_1.bullets_per_bounce+obj_player.max_ammo_buff {
				gun_1.current_bullets += 1;
			}
			//add momentum
			if state != state_freeze {
				speed = 0;
				motion_add(angle - 90, vsp_basicjump * gun_1.momentum_added);
			}
		}else if gun_2._name = "Yo-yo" {
			if gun_2.current_bullets < gun_2.bullets_per_bounce+obj_player.max_ammo_buff {
				gun_2.current_bullets += 1;
			}
			//add momentum
			if state != state_freeze {
				speed = 0;
				motion_add(angle - 90, vsp_basicjump * gun_2.momentum_added);
			}
		}else if gun_3._name = "Yo-yo" {
			if gun_3.current_bullets < gun_3.bullets_per_bounce+obj_player.max_ammo_buff {
				gun_3.current_bullets += 1;
			}
			//add momentum
			if state != state_freeze {
				speed = 0;
				motion_add(angle - 90, vsp_basicjump * gun_3.momentum_added);
			}
		}
	}
	//screen shake
	scr_Screen_Shake(5, 8, true);
	if (global.allow_screenshake) {
		var controller_vibration = global.controller_vibration/100;
	}
}

if (gun_name = "Water Gun") {
	for(i = 0; i < 360; i += 45) {
		with instance_create_depth(x,y,depth-1,obj_water_droplet) {
			speed = other.spd/1.5;
			direction = other.i;
			randomize();
			direction += irandom_range(-45,45);
			random_set_seed(global.seed);
		}
	}
	with obj_water_outline {
		if parent_obj = other or parent_obj = other.closest_water_object {
			instance_destroy();	
		}
	}
}

if (gun_name = "Paintball Gun") {
	for(i = 0; i < 360; i += 45) {
		with instance_create_depth(x,y,depth-1,obj_paintball_droplet) {
			speed = other.spd/3;
			direction = other.i;
			randomize();
			direction += irandom_range(-45,45);
			random_set_seed(global.seed);
			color_index = other.image_index;
		}
	}
}

if (gun_name = "Javelins") {
	if place_meeting(x,y,obj_ground) {
		with instance_create_depth(x,y,depth,obj_javelin_animation)	{
			other_depth = other.depth;
			depth = 100;
			image_angle = other.image_angle;
			damage = other.damage;
		}
	}
}

if gun_name = "Boomerangs" {
	if audio_is_playing(sound) {
		audio_stop_sound(sound);
	}
}

if gun_name = "Grappling Helmet" or gun_name = "Harpoon Helmet" {
	obj_player.grappling_hook = noone;	
	if audio_is_playing(snd_grappling_pull) {
		audio_stop_sound(snd_grappling_pull);
	}
	if audio_is_playing(snd_grappling_rope) {
		audio_stop_sound(snd_grappling_rope);
	}
	audio_play_sound(snd_reload,0,false);
	
	//reload
	with obj_player {
		if other.gun_name = "Grappling Helmet" {
			grappling_gun.current_bullets = 1;
			pickup_grappling.uses_per_bounce = pickup_grappling.max_uses_per_bounce;
			pickup_grappling.on_cooldown = false;
		}else if other.gun_name = "Harpoon Helmet" {
			harpoon_gun.current_bullets = 1;
			pickup_harpoon.uses_per_bounce = pickup_grappling.max_uses_per_bounce;
			pickup_harpoon.on_cooldown = false;
		}
	}
}

if (gun_name = "The Portal") {
	obj_player.portal_gun.current_bullets = 1;
}