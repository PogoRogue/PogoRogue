/*var black = c_black;
draw_set_alpha(alpha);
draw_rectangle_color(0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),black,black,black,black,false);
draw_set_alpha(1);*/

if global.door_color = "purple" {
	draw_sprite(spr_door_transition_left,0,384-x_offset,0);
	draw_sprite(spr_door_transition_right,0,384+x_offset,0);
}else if global.door_color = "blue" {
	draw_sprite(spr_door_transition_left,0,384-x_offset,0);
	draw_sprite(spr_door_transition_right,0,384+x_offset,0);
}else if global.door_color = "grey" {
	draw_sprite(spr_door_transition_left,0,384-x_offset,0);
	draw_sprite(spr_door_transition_right,0,384+x_offset,0);
}

if global.show_tips_screen = true {
	var xx = 384+30+x_offset+26;
	var yy = 432-29-20;
	draw_sprite(spr_tipscreen,0,xx,yy);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_set_font(fnt_itemdescription2);
	var colo = make_color_rgb(237,225,158);	
	scr_Draw_Text_Outlined(xx,yy,scr_Linebreak("TIP:  " + global.current_tip,45,99),colo);
}