/// @description draw UI when colliding
draw_self();
if (colliding) {
	//check if we should draw controller UI or keyboard UI
	if global.use_controller = true {
		draw_sprite(controller_sprite,0,x+50,y-40);	
	}else {
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_combo2);
		scr_Draw_Text_Outlined(x+50,y-40,"Press E",c_white);	
	}
}