var black = make_color_rgb(33,33,35);
//draw_line_width_color(obj_player.x,obj_player.y,rope_x,rope_y,3,black,black);
//if rope_length < rope_length_max {
	for (i = 0; i <= rope_length+(abs(rope_angle_velocity)*2); i+= sprite_get_height(spr_wreckingball_chain_link)) {
		var remainder = (rope_length+(abs(rope_angle_velocity)*2)) % sprite_get_height(spr_wreckingball_chain_link);
		draw_sprite_ext(spr_wreckingball_chain_link,0,x+lengthdir_x(i,rope_angle+180)+lengthdir_x(remainder,rope_angle+180),y+lengthdir_y(i,rope_angle+180)+lengthdir_y(remainder,rope_angle+180),1,1,rope_angle+90,c_white,image_alpha);
	}
/*}else {
	var yscale = (point_distance(x,y,obj_player.x,obj_player.y) / sprite_get_height(spr_wreckingball_chain));
	var dir = point_direction(x,y,obj_player.x,obj_player.y) - 90;
	draw_sprite_ext(spr_wreckingball_chain,0,obj_player.x,obj_player.y,sign(obj_player.image_xscale),yscale,dir,c_white,1);
}*/
draw_sprite_ext(spr_wreckingball_arrows,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,arrows_alpha);
draw_self();