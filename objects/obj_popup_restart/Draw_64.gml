/// @description draw self
draw_set_alpha(image_alpha);
var xx = camera_get_view_width(view_camera[0])/2;
var yy = camera_get_view_height(view_camera[0])/2;
draw_sprite(sprite_index,image_index,xx,yy);
draw_set_alpha(1);