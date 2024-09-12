if instance_exists(gate_obj) {
	with gate_obj {
		if obj_player.y < y and room != room_tutorial {
			instance_destroy(other);	
		}
	}
}else {
	instance_destroy();
}