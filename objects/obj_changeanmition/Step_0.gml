// check if change to monster or chest
if (is_transforming_to_monster) {
    // last frame change to monster
    if (image_index >= sprite_get_number(sprite_index) - 1) {
        instance_change(obj_enemy_jackinthebox, true);
    }
} else {
	//reverse animation
	// last frame change to chest
    if (image_index >= sprite_get_number(sprite_index) - 1) {
        instance_create_layer(x, y, "Instances", obj_fakechest);
        instance_destroy(); 
    }
}








