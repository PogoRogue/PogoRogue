image_speed = 0;
colliding = false;

if global.current_skin = 0 { //Rogo
	image_index = 1;
}else if global.current_skin = 3 { //Dogo
	image_index = 5;
}else if global.current_skin = 6 { //3D
	image_index = 3;
}else {
	image_index = sprite_get_number(sprite_index)-1;	
}

init_image_index = image_index;

item_equipped = 1;

item_changed = false;