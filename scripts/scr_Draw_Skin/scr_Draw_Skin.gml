// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Draw_Skin(normal,falling,charging,portal) {
	if sprite_index = player_sprite or sprite_index = spr_player_revive_animation {
		draw_sprite_ext(normal,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = falling_sprite {
		draw_sprite_ext(falling,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = charging_sprite or sprite_index = spr_player_zekai_charging_red {
		draw_sprite_ext(charging,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = spr_player_zekai_portal and image_xscale > 0.1 and abs(image_yscale > 0.1) {
		draw_sprite_ext(portal,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}
}