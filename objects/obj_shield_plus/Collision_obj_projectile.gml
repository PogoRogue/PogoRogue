/// @description Deactivate shield

if other.destroy_on_impact = true {
	if(is_active) {
		is_active = false;
		instance_destroy(other);
		alarm_set(0, restore_duration);
		parent.current_iframes = 25;
		
		if(enhanced) {
			player = instance_nearest(x,y,obj_player);
			var _bullet = instance_create_layer(other.x, other.y, "Instances", obj_enemy_projectile_bullet);
			_bullet.direction = point_direction(other.x, other.y, player.x, player.y);
			_bullet.speed=7;
			_bullet.sprite_index = other.sprite_index;
		}
		if audio_is_playing(snd_shieldBubble_enemy) {
			audio_stop_sound(snd_shieldBubble_enemy);
		}
	}
}