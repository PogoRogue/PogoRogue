/// @description draw self
display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
var xx = camera_get_view_width(view_camera[0])/2;
var yy = camera_get_view_height(view_camera[0])/2;
draw_sprite(sprite_index,image_index,x,y);