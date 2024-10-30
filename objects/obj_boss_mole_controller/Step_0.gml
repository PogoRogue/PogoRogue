if !instance_exists(obj_boss_mole_parent) and mole_defeated = false {
	if (room == room_boss_1B) {
		instance_create_layer(256, 336+56+6, "hazards", obj_shop_door); //544
		instance_create_layer(512-48, 336-56+6, "hazards", obj_boss_door); //436
	}

	if global.phase = 1 {
		global.phase = 2;
		global.area_2_reached += 1
		scr_Save_Real("area_2_reached",global.area_2_reached); 
	}else if global.phase = 2 {
		global.phase = 3;
		global.area_3_reached += 1
		scr_Save_Real("area_3_reached",global.area_3_reached); 
	}
	
	mole_defeated = true;
}