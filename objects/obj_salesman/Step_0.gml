/// @description Bob up and down
if y_add > -4 and y_up = true {
	y_add_spd = (4 - abs(y_add))/8 + 0.025;
	y_add -= y_add_spd;

}else if y_up = true {
	y_up = false;
	y_add_spd = 0;
}
if y_add < 4 and y_up = false {
	y_add_spd = (4 - abs(y_add))/8 + 0.025;
	y_add += y_add_spd;
}else if y_up = false {
	y_up = true;
	y_add_spd = 0;
}

y = init_y + y_add;

if distance_to_object(obj_player) < 128 {
	if obj_player.x < x {
		image_xscale = 1;
	}else {
		image_xscale = -1;
	}
}