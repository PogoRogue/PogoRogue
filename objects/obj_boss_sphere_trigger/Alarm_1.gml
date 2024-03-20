/// @description Despawn

instance_create_layer(272, 272, "enemies", obj_boss_sphere);

instance_create_layer(208, 304, "enemies", obj_subboss_fly_chasing);
instance_create_layer(576, 304, "enemies", obj_subboss_shield);
instance_create_layer(208, 447, "enemies", obj_subboss_exploding);
instance_create_layer(576, 447, "enemies", obj_subboss_tar);

instance_create_layer(336, 560, "ground", obj_ground, {image_xscale: 7, image_yscale: 13});

with(obj_player) {
	state = state_free;
}

room_height = 600;
		
instance_destroy(self);
