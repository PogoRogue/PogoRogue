/// @description Despawn

instance_create_layer(272, 272, "enemies", obj_boss_sphere);

with(obj_player) {
	state = state_free;
}
		
instance_destroy(self);


