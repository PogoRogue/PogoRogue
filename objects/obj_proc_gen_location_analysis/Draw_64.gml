/// @description Draw player location info to screen

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_combo2);

if(display_player_chunk && instance_exists(current_tag_object))
{
	draw_text(display_get_gui_width()/2 - 20, 20, player_location_string);
}




