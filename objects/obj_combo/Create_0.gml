combo_decrease_speed = global.combo_max/(600+global.combo_time_added); //# of frames for each combo to last

if (instance_exists(obj_player)) {
	depth = obj_player.depth - 1;
}

low_combo_meter = false;
combometer_scale = 1;
increase_combometer_scale = false;
prev_combo = 0;

if !instance_exists(obj_coincounter) {
	instance_create_depth(x,y,depth,obj_coincounter);
}

red = 255;
green = 255;
blue = 255;
red2 = 255;
green2 = 255;
blue2 = 255;
meter_color = make_color_rgb(red,green,blue);
text_color = make_color_rgb(red2,green2,blue2);