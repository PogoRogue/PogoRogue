//image_index = 1;
alarm[0] = 10;
if other.destroy_on_impact = true and object_get_name(other.object_index) = "obj_projectile" {
	instance_destroy(other);	
}
red_frames = 10;