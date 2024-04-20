/// @description Create projectile

switch(controller.current_state) {
	case BOSS3_STATES.CHASE_1:
		var _projectile = instance_create_layer(spawn_x, camera_get_view_y(view_camera[0]) - 20, "enemies", obj_boss_attack2);
		_projectile.track_player = false;
		_projectile.dir_central = -90;
		_projectile.spread = 30;
		_projectile.spd = 10;
		break;
	case BOSS3_STATES.CHASE_2:
		var _gun = instance_create_layer(spawn_x, camera_get_view_y(view_camera[0]) - 20, "enemies", obj_boss_attack3);
		_gun.dir_central = -90;
		break;
	case BOSS3_STATES.CHASE_3:
		var _start_angle = spawn_x > view_width / 2 ? -85 : -95;
		var _end_angle = spawn_x > view_width / 2 ? -95 : -85;
		instance_create_layer(spawn_x, camera_get_view_y(view_camera[0]) - 900, "enemies", obj_enemy_laser, {start_angle: _start_angle, end_angle: _end_angle, collide_with_walls: false});
		break;
}

alarm_set(0, projectile_delay);
