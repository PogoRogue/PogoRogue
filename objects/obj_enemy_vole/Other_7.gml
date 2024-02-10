/// @description State transitions

// Handle transitions based off sprite animation length
switch(sprite_index) {
	case spr_enemy_vole_out_pipe:
		sprite_index = spr_enemy_vole_attack;
		break;
	case spr_enemy_vole_attack:
		sprite_index = spr_enemy_vole_idle;
		
		// Create projectile
		dist_to_player = distance_to_object(player);
		can_see_player = dist_to_player < range;
		if(can_see_player) {
			var _attack = instance_create_depth(x, y, self.depth + 1, obj_pattern_template);
			_attack.dir_central = point_direction(x, y, player.x, player.y);
		}
		break;
	case spr_enemy_vole_idle:
		sprite_index = spr_enemy_vole_into_pipe;
		break;
	case spr_enemy_vole_into_pipe:
		instance_destroy(self);
		break;
}
