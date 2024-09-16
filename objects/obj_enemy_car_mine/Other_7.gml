/// @description Create explosion
if scr_In_Camera_View(128) = true {
	instance_create_depth(x, y, 10, obj_explosion);
}

instance_destroy(self);