/// @description Draw player location info to screen

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_combo2);

if(display_player_chunk && instance_exists(current_tag_object))
{
	draw_text(display_get_gui_width()/2 - 20, 20, player_location_string);
	previous_tag_message = player_location_string;
}
else
{
	draw_text(display_get_gui_width()/2 - 20, 20, previous_tag_message);
}

if(display_minimap && instance_exists(current_tag_object))
{
	var frame = current_tag_object.proc_gen_region;
	draw_sprite(spr_minimap, frame, display_get_gui_width() - 48, display_get_gui_height()/2);
	previous_region = frame;
}
else
{
	draw_sprite(spr_minimap, previous_region, display_get_gui_width() - 48, display_get_gui_height()/2)
}
