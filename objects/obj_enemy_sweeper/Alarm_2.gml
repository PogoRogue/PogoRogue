/// @description drop the tar vertically


if(state == SWEEPER_STATES.VERTICAL_LEFT) {
	var _sweeper = instance_create_layer(x - 22, y, "enemies", obj_enemy_sweeper_mine);
	_sweeper.image_angle -= 90;
} else if(state == SWEEPER_STATES.VERTICAL_RIGHT) {
	var _sweeper = instance_create_layer(x + 22, y, "enemies", obj_enemy_sweeper_mine);
	_sweeper.image_angle += 90;
}
