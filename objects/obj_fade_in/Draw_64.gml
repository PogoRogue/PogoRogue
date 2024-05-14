/*var black = c_black;
draw_set_alpha(alpha);
draw_rectangle_color(0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),black,black,black,black,false);
draw_set_alpha(1);*/

if global.door_color = "purple" {
	draw_sprite(spr_door_transition_left,0,384-x_offset,0);
	draw_sprite(spr_door_transition_right,0,384+x_offset,0);
}else if global.door_color = "blue" {
	draw_sprite(spr_door_transition_left,0,384-x_offset,0);
	draw_sprite(spr_door_transition_right,0,384+x_offset,0);
}else if global.door_color = "grey" {
	draw_sprite(spr_door_transition_left,0,384-x_offset,0);
	draw_sprite(spr_door_transition_right,0,384+x_offset,0);
}