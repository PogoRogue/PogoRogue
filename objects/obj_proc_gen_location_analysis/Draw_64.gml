/// @description Draw player location info to screen

if(display_player_chunk && instance_exists(current_tag_object))
{
	draw_text(display_get_gui_width()/2 - 20, 20, player_location_string);
}




