/// @description drop the tar horizontally
if red = true {
	var slime_object = obj_enemy_snail_slime_red;
}else {
	var slime_object = obj_enemy_snail_slime;
}
instance_create_layer(x+(14*image_xscale), y + 22, "enemies", slime_object);
