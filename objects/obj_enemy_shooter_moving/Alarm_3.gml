
if(!is_dead) and scr_In_Camera_View(200) {
	instance_create_layer(x - (3 * sign(image_xscale)), y, "Instances", obj_enemy_projectile_lob);
	instance_create_layer(x - (3 * sign(image_xscale)), y, "Instances", obj_enemy_projectile_lob,{hspeed: -1});
	instance_create_layer(x - (3 * sign(image_xscale)), y, "Instances", obj_enemy_projectile_lob,{hspeed: 1});
}