/// @description Set despawn timer
// You can write your code in this editor

// Inherit the parent event
event_inherited();
damage = 8;
alarm_set(1, room_speed);
launched = false;

// Play explosion sound if in view
var _player = instance_nearest(x, y, obj_player);
if(distance_to_object(_player) < (camera_get_view_width(view_camera[0]) * 1.5)) {
	if room != room_boss_1 {
		audio_play_sound(snd_explosion, 0, false);
	}else if !audio_is_playing(snd_explosion) {
		if !instance_exists(obj_boss_sphere) {
			audio_play_sound(snd_explosion, 0, false);	
		}else {
			if obj_boss_sphere.hp > 0 {
				audio_play_sound(snd_explosion, 0, false);	
			}
		}
	}
}
