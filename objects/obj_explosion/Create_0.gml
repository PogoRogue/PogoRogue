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
	audio_play_sound(snd_explosion, 0, false);
}
