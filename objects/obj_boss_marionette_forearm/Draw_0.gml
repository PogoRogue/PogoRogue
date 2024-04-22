/// @description Draw self

draw_line_width_color(boss.anchor_x, boss.anchor_y, x + lengthdir_x(32, image_angle), y + lengthdir_y(32, image_angle), 1, #ff0546, #ff0546);

if(boss.weapon != BOSS3_WEAPONS.NONE && draw_laser) {
	draw_line_width_color(weapon_x, weapon_y, weapon_x + lengthdir_x(room_width * 2, image_angle), weapon_y + lengthdir_y(room_width * 2, image_angle), 2, #B45252, #B45252);
}

draw_self();

switch(boss.weapon) {
	case BOSS3_WEAPONS.NONE:
		break;
	case BOSS3_WEAPONS.PISTOL:
		draw_sprite_ext(spr_gun_default, 0, weapon_x, weapon_y, 1, sign(weapon_x - x), image_angle, c_white, 1);
		break;
	case BOSS3_WEAPONS.SHOTGUN:
		draw_sprite_ext(spr_gun_shotgun, 0, weapon_x, weapon_y, 1, sign(weapon_x - x), image_angle, c_white, 1);
		break;
	case BOSS3_WEAPONS.MISSILE:
		draw_sprite_ext(spr_gun_missile, 0, weapon_x, weapon_y, 1, sign(weapon_x - x), image_angle, c_white, 1);
		break;
	case BOSS3_WEAPONS.LASER:
		draw_sprite_ext(spr_gun_laser, 0, weapon_x, weapon_y, 1, sign(weapon_x - x), image_angle, c_white, 1);
		break;
}
