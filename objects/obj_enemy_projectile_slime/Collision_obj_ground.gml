/// @description Place floor slime

while(place_meeting(x, y, obj_ground)) {
	y--;
}

var _slime = instance_create_layer(x, y + 5, "enemies", obj_enemy_snail_slime);

instance_destroy(self);
