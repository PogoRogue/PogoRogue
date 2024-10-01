// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Draw_Enemy_Health(){
	var prev_depth = depth;
	depth = -10
	var _num_segments = floor((hp / hp_max) * hp_max) * 4;
	var _x = x-((4*hp_max)/2);
	var _y = y - (sprite_get_height(sprite_index) / 2) - 12;
	
	if object_get_name(object_index) = "obj_enemy_turret" {
		if image_xscale = 1 and image_angle = 0 and image_yscale = 1 {
			
		}else {
			_x -= 2	
		}
	}
	
	
	for(_i = 0; _i < hp_max * 4; _i+=4) {
		
		draw_sprite(spr_enemy_health_outline, 0, _x+_i, _y);
	}
	
	for(_j = 0; _j < _num_segments; _j+=4) {
		draw_sprite(spr_enemy_health_segment, 0, _x+_j, _y);
	}
	
	if(_num_segments > 0 && hp < hp_max) {
		//draw_sprite(spr_enemy_health_segment_end, 0, _x+_i, _y);
	}
	depth = prev_depth;
}
