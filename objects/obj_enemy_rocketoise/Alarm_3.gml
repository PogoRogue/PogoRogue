/// @description Create projectile

if is_dead = false {
	instance_create_layer(x - (3 * sign(image_xscale)), y, "Instances", obj_missles_pattern);
}
