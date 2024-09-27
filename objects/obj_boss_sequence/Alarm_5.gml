/// @description Play door close sound

if(instance_exists(body)) {
	audio_play_sound(snd_door, 0, false);
}


sprite_index = spr_boss2_sequence_lights_unlocked;
image_index = 7;
image_speed = -1;
depth = obj_boss_sequence_slime.depth - 1;