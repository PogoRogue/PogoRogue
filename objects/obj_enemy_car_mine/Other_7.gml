/// @description Create explosion

instance_create_depth(x, y, depth - 1, obj_explosion);
instance_destroy(self);
