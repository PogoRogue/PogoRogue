draw_self();

if opening = true and obj_player.angle = 0 {
	draw_sprite_ext(spr_parachute_arrows,0,obj_player.x,obj_player.y-22,obj_player.image_xscale,1,0,c_white,arrows_alpha);
}