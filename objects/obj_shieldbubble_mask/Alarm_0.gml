/// @description pop
if instance_exists(parent_obj) {
	if parent_obj.bouncing = false and parent_obj.not_colliding = true {
		instance_destroy(parent_obj);	
		instance_destroy();	
		obj_player.invincible = true;
	}
}