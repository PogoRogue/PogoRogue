if room_speed < 60 {
	draw_sprite_ext(spr_slowmo_front,front_frames,384+26,216+46,1,1,0,c_white,((60-room_speed)/20)-0.25);
	draw_sprite_ext(spr_slowmo_front,front_frames,384+26,216-46,1,-1,0,c_white,((60-room_speed)/20)-0.25);
	
	draw_sprite_ext(spr_slowmo_front,front_frames,384-26,216+46,-1,1,0,c_white,((60-room_speed)/20)-0.25);
	draw_sprite_ext(spr_slowmo_front,front_frames,384-26,216-46,-1,-1,0,c_white,((60-room_speed)/20)-0.25);
}