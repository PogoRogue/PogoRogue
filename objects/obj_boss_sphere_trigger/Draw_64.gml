/// @description Draw boss cutin

draw_set_alpha(alpha);

var old_w = display_get_gui_width();
var old_h = display_get_gui_height();

//display_set_gui_size(screen_width, screen_height);

draw_sprite_ext(spr_sphere_cutin_nowords, 0, screen_width / 2, screen_height / 2, backdrop_scale, backdrop_scale, 0, c_white, alpha);
draw_sprite_ext(spr_cutin_words, 0, screen_width / 2, screen_height / 2, text_scale, text_scale, 0, c_white, alpha);
 
display_set_gui_size(old_w, old_h);

draw_set_alpha(1.0);

