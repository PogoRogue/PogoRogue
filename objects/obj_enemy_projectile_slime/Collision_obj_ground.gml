/// @description Place floor slime

while(place_meeting(x, y, obj_ground)) {
	y--;
}

var _slime = instance_create_layer(x, y + 5, "enemies", obj_enemy_snail_slime,{parent_index: obj_player});
instance_create_layer(x+8, y + 5, "enemies", obj_enemy_snail_slime,{parent_index: obj_player});
instance_create_layer(x-4, y + 5, "enemies", obj_enemy_snail_slime,{parent_index: obj_player});

if !audio_is_playing(snd_splat) {
	audio_play_sound(snd_splat,0,false);
}
instance_destroy(self);
