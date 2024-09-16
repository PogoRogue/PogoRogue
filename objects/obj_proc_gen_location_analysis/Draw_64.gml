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
	//draw_text(display_get_gui_width()/2 - 20, 20, previous_tag_message);
}

if(display_minimap && instance_exists(current_tag_object))
{
	var frame = current_tag_object.proc_gen_region;
	
	if(global.phase == 1)
	{
		if(frame >= 1)
		{
		frame = frame - 1; //Adjust frame for phase 1 level structure difference
		//Need to display both the "start room" and hallway as the same region, and then every other region 
		//will be off by one
		}
		if in_shop = true or above_shop = true {
			frame = frame + 1;	
		}
		draw_sprite(spr_minimap_phase1, frame, display_get_gui_width() - 48, display_get_gui_height()/2);
	}
	else
	{
		if in_shop = true or above_shop = true {
			frame = frame + 1;	
		}
		draw_sprite(spr_minimap, frame, display_get_gui_width() - 48, display_get_gui_height()/2+8);
	}
	previous_region = frame;
}
else
{
	draw_sprite(spr_minimap, previous_region, display_get_gui_width() - 48, display_get_gui_height()/2+8)
}

if(display_progress_bar)
{
	var progress_sprite = spr_crosshair_cursor;
	var display_center_x = display_get_gui_width()/2;
	var symbols_per_row = 5;	
	if(kills_left > 10)
	{
		symbols_per_row = 10;
	}
	var total_rows = 2;
	var start_x = display_center_x - sprite_get_width(progress_sprite)*floor(symbols_per_row/2);
	var start_y = display_get_gui_height() - sprite_get_height(progress_sprite)*(total_rows + 0.5);
	
	if(kills_left != 0)
	{
		if kills_left > 1 {
			var str_kills = "Kills Remaining";
		}else {
			var str_kills = "Kill Remaining";
		}
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_item_popup);
		if obj_player.dead = false {
			scr_Draw_Text_Outlined(392-(string_width("  " + str_kills)/2),96,string(kills_left),make_color_rgb(180,82,82));
			scr_Draw_Text_Outlined(390,96,"  " + str_kills,c_white);
		}
		/*for(var i = 0; i < kills_left; i++)
		{
			var floor_term = floor(i/(symbols_per_row - 0.01))
			var curr_x = start_x + (i * sprite_get_width(progress_sprite)) - (floor_term * sprite_get_width(progress_sprite) * symbols_per_row);
			var curr_y = start_y + floor_term * sprite_get_height(progress_sprite);
			draw_sprite(progress_sprite, 0, curr_x, curr_y)
		}*/
	}
}
