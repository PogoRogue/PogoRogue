// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Draw_Enemy_Health(){
	var _num_segments = floor((hp / hp_max) * 32);
	var _x = x - 16;
	var _y = y - (sprite_height / 2) - 16;
	
	draw_sprite(spr_enemy_health_outline, 0, _x, _y);
	
	for(var _i = _x; _i < _x + _num_segments; _i++) {
		draw_sprite(spr_enemy_health_segment, 0, _i, _y);
	}
}