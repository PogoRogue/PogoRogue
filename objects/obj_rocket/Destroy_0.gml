/// @description On destroy

//create bubble pop
if instance_exists(obj_camera) {
	with instance_create_depth(x,y,depth,obj_projectile_explosion) {
		damage = other.damage;
	}
	audio_stop_sound(sound);
}