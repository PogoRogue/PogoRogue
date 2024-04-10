if room_speed < 60 {
	draw_sprite_ext(spr_slowmo_front,front_frames,384+26,216+46,1,1,0,c_white,((60-room_speed)/20)-0.25);
	draw_sprite_ext(spr_slowmo_front,front_frames,384+26,216-46,1,-1,0,c_white,((60-room_speed)/20)-0.25);
	
	draw_sprite_ext(spr_slowmo_front,front_frames,384-26,216+46,-1,1,0,c_white,((60-room_speed)/20)-0.25);
	draw_sprite_ext(spr_slowmo_front,front_frames,384-26,216-46,-1,-1,0,c_white,((60-room_speed)/20)-0.25);
	
	//draw slow mo meter
	if time_left > 0 {
		draw_set_color(make_color_rgb(242,240,229));
		draw_set_font(fnt_combo2);
		draw_set_halign(fa_left);
		draw_set_valign(fa_bottom);
		draw_text(17,156-7,"Magic Stopwatch");
		draw_set_color(c_white);
		draw_sprite(spr_slowmometer,0,17,156);
		draw_sprite_part(spr_slowmometer,1,0,0,sprite_get_width(spr_slowmometer)*(time_left / time),sprite_get_height(spr_slowmometer),17,156-4);
	}
}