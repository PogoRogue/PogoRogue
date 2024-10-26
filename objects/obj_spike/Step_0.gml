if object_get_name(object_index) = "obj_spike" {
	if global.cactusmode_on = true  {
		damage = 0;
	} else if global.cactusmode_on = false {
		damage = 8;
	}
}