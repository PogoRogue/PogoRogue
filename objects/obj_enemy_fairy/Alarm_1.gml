/// @description Insert description here
// You can write your code in this editor

sprite_index = fairy_explosion;
image_index = 0;
spd = 0;
enemy_coin_bonus = 0;
alarm_set(0, room_speed/2);
audio_play_sound(snd_explosion,0,false);
mask_index = spr_nothing;

weapon_chance = 0;
pickup_chance = 0;