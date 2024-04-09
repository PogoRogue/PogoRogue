/// @description Deactivate shield

if other.destroy_on_impact = true {
	if(is_active){
		is_active = false;
		instance_destroy(other);
		alarm_set(0, restore_duration);
		parent.current_iframes = 25;
		if(boss.phase==2){
			player=instance_nearest(x,y,obj_player);
			var _bullet = instance_create_layer(other.x, other.y, "Instances", obj_enemy_projectile_bullet);
			_bullet.direction = point_direction(other.x, other.y, player.x, player.y);
		}
	}
}
