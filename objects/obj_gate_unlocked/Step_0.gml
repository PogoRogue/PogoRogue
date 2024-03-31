if instance_exists(gate_obj) {
	with gate_obj {
		if obj_player.y < bbox_top {
			instance_destroy(other);	
		}
	}
}