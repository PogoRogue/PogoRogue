/// @description Create projectile

switch(controller.current_state) {
	case BOSS3_STATES.CHASE_1:
		var _projectile = instance_create_layer(spawn_x, camera_get_view_y(view_camera[0]) - 20, "enemies", obj_boss_attack2);
		_projectile.track_player = false;
		_projectile.dir_central = -90;
		_projectile.spread = 30;
		_projectile.spd = 10;
		_projectile.lifetime = 27;
		scr_Screen_Shake(6,15,false);
		break;
	case BOSS3_STATES.CHASE_2:
		var _gun = instance_create_layer(spawn_x, camera_get_view_y(view_camera[0]) - 20, "enemies", obj_boss_attack3);
		_gun.dir_central = -90;
		scr_Screen_Shake(4,10,false);
		break;
	case BOSS3_STATES.CHASE_3:
		var _start_angle =  spawn_x > view_width / 2 ? -90 : -90;
		var _end_angle = spawn_x > view_width / 2 ? -100 : -80;
		instance_create_layer(spawn_x, camera_get_view_y(view_camera[0]) - 900, "enemies", obj_enemy_laser, {start_angle: _start_angle, end_angle: _end_angle, collide_with_walls: false});
		break;
}

alarm_set(0, projectile_delay);
