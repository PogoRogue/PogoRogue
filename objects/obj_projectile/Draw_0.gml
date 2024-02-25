//draw trail
if (gun_name = "Bouncy Ball Blaster") {
	draw_self();
	image_angle = direction;
	with instance_create_depth(x,y,depth+1,obj_bbb_trail) {
		image_index = other.num_of_bounces+2;
		image_alpha = 0.95;
	}
}else if (gun_name = "Yo-yo") {
	var yscale = (point_distance(x,y,obj_player.x,obj_player.y) / sprite_get_height(spr_projectile_yoyo_string));
	var dir = point_direction(x,y,obj_player.x,obj_player.y) - 90;
	draw_sprite_ext(spr_projectile_yoyo_string,0,x,y,obj_player.image_xscale,yscale,dir,c_white,1);
	draw_self();
}else {
	draw_self();
}