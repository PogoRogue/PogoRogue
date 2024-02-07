if pause = true {
	gamepad_set_vibration(0,0,0);
	
	if instance_exists(obj_pausemenu) {
		depth = obj_pausemenu.depth+5;
	}
	if instance_exists(obj_items) {
		depth = obj_items.depth+5;
	}
	
	//darken screen
	draw_set_color(make_color_rgb(33,33,35));
	draw_set_alpha(0.75);
	draw_rectangle(0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),false);
	draw_set_alpha(1);
	
	//draw pause button
	draw_sprite(spr_pause,0,16,camera_get_view_height(view_camera[0])-16);
	
	if instance_exists(obj_pausemenu) {
		depth = obj_pausemenu.depth+5;
	}
	if instance_exists(obj_items) {
		depth = obj_items.depth+5;
	}
}
draw_set_color(c_white);