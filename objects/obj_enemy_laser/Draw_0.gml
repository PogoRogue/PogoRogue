/// @description Insert description here
// You can write your code in this editor

draw_line_width_color(x, y, end_x, end_y, 16 * width_percent, color_1, color_1);
draw_line_width_color(x, y, end_x, end_y, 15 * width_percent, color_2, color_2);
draw_line_width_color(x, y, end_x, end_y, 10 * width_percent, color_3, color_3);
draw_line_width_color(x, y, end_x, end_y, 8 * width_percent, color_4, color_4);
draw_line_width_color(x, y, end_x, end_y, 6 * width_percent, color_5, color_5);

draw_self();

draw_sprite(spr_enemy_laser, image_index, end_x, end_y);
