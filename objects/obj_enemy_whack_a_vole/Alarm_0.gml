/// @description Spawn a new worm enemy in a random hole

if(!vole_is_dead) {
	switch(irandom(2)) {
		case 0:
			current_position = hole_position_1;
			break;
		case 1:
			current_position = hole_position_2;
			break;
		case 2:
			current_position = hole_position_3;
			break;
	}
	
	var _vole = instance_create_layer(current_position.x, current_position.y, "enemies", obj_enemy_vole);
	_vole.parent = self;
	_vole.hp = vole_hp;
	
	alarm_set(0, room_speed * 8);
}
