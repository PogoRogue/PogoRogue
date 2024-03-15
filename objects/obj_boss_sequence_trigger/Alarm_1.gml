/// @description Create objects and despawn

var _controller = instance_nearest(x, y, obj_boss_sequence); // instance_create_layer(496, 272, "enemies", obj_boss_sequence);
_controller.fight_started = true;
instance_create_layer(560, 560, "enemies", obj_boss_sequence_slime);
var _body = instance_create_layer(560, 464, "enemies", obj_boss_sequence_body, {image_xscale: 3, image_yscale: 3});
_body.controller = _controller;
_controller.body = _body;
instance_create_layer(560, 560, "enemies", obj_invisible_floor, {image_xscale: 4, image_yscale: 9});

with(obj_sequence_progress) {
	controller = _controller;
}

with(obj_player) {
	state = state_free;
}

room_height = 600;

instance_destroy(obj_boss_sequence_trigger);
instance_destroy(self);
