/// @description Create projectile

if(!is_dead) {
	instance_create_layer(x - (3 * sign(image_xscale)), y, "Instances", obj_enemy_projectile_lob);
}
