/// @description draw UI when colliding
<<<<<<< Updated upstream
if(showup = true) {
draw_self();
if (colliding) {
	//check if we should draw controller UI or keyboard UI
	if global.use_controller = true {
		draw_sprite(controller_sprite,0,x+45,y+10);	
=======
if(is_active = true){
	draw_self();
if (colliding) {
	//check if we should draw controller UI or keyboard UI
	if global.use_controller = true {
		draw_sprite(controller_sprite,0,x+50,y-10);	
>>>>>>> Stashed changes
	}else {
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_combo2);
<<<<<<< Updated upstream
		scr_Draw_Text_Outlined(x+45,y+10,"Press E",c_white);	
	}
}
}
=======
		scr_Draw_Text_Outlined(x+50,y-10,"Press E",c_white);	
	}
}
}
>>>>>>> Stashed changes
