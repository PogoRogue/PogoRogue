/// @description Draw shaking chest

if (is_shaking) {
    var shake_amount = 2;
    draw_sprite_ext(sprite_index, image_index, x + irandom_range(-shake_amount, shake_amount), y + irandom_range(-shake_amount, shake_amount), 1, 1, 0, c_white, 1);
} else {
    event_inherited();
}

if(open) {
	var _xx = x + sin(body_pos_x) * 20;
	var _yy = y + sin(body_pos_y) * 20;
	if(!is_dead) {
		draw_sprite_pos(spr_enemy_jack_spring, 0, _xx - 8, _yy - 36, _xx + 8, _yy - 36, x + 8, y + 12, x - 8, y + 12, 1);
	}
	var _body_angle = point_direction(x, y + 12, _xx, _yy - 36) - 90;
	draw_sprite_ext(spr_enemy_jack_body, body_subimg, _xx, _yy - 36, 1, 1, _body_angle, c_white, image_alpha);
}
