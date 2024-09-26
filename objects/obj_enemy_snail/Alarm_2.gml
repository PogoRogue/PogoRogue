/// @description drop the tar vertically
// 你可以在此编辑器中写入代码 

if red = true {
	var slime_object = obj_enemy_snail_slime_red;
}else if pink = true {
	var slime_object = obj_enemy_snail_slime_pink;
}else {
	var slime_object = obj_enemy_snail_slime;
}

if(state == SNAIL_STATES.VERTICAL_LEFT) {
	var _slime = instance_create_layer(x - 22, y+(14*image_xscale), "enemies", slime_object,{parent_index: self});
	_slime.image_angle -= 90;
} else if(state == SNAIL_STATES.VERTICAL_RIGHT) {
	var _slime = instance_create_layer(x + 22, y+(14*image_xscale), "enemies", slime_object,{parent_index: self});
	_slime.image_angle += 90;
}