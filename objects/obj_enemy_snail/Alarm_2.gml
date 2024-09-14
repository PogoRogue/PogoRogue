/// @description drop the tar vertically
// 你可以在此编辑器中写入代码 

if red = true {
	var slime_object = obj_enemy_snail_slime_red;
}else {
	var slime_object = obj_enemy_snail_slime;
}

if(state == SNAIL_STATES.VERTICAL_LEFT) {
	var _slime = instance_create_layer(x - 22, y, "enemies", slime_object);
	_slime.image_angle -= 90;
} else if(state == SNAIL_STATES.VERTICAL_RIGHT) {
	var _slime = instance_create_layer(x + 22, y, "enemies", slime_object);
	_slime.image_angle += 90;
}
