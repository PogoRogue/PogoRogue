/// @description dont draw
var xx = camera_get_view_width(view_camera[0])/2;
var yy = camera_get_view_height(view_camera[0])/2;
draw_sprite(sprite_index,image_index,x,y);

//darken play button
if global.tutorial_completed = false {
	if select = 1 - options_decrease {
		draw_sprite(spr_menu_tutorial_darken,0,x,y);
	}else {
		draw_sprite(spr_menu_tutorial_darken,1,x,y);
	}
}