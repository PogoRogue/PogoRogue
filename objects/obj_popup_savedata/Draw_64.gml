/// @description draw self

var xx = camera_get_view_width(view_camera[0])/2;
var yy = camera_get_view_height(view_camera[0])/2;
draw_sprite_ext(sprite_index,image_index,xx,yy,1,1,0,c_white,alpha);