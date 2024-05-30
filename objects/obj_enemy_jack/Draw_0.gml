/// @description Insert description here
// You can write your code in this editor

event_inherited();

if(is_open) {
	var _xx = x + sin(body_pos_x) * 20;
	var _yy = y + sin(body_pos_y) * 20;
	if(!is_dead) {
		draw_sprite_pos(spr_enemy_jack_spring, 0, _xx - 8, _yy - 36, _xx + 8, _yy - 36, x + 8, y + 12, x - 8, y + 12, 1);
	}
	var _body_angle = point_direction(x, y + 12, _xx, _yy - 36) - 100;
	draw_sprite_ext(spr_enemy_jack_body, body_subimg, _xx, _yy - 36, 1, 1, _body_angle, c_white, image_alpha);
}
