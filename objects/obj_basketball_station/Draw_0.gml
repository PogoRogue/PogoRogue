/// @description draw UI when colliding
draw_self();
if (colliding) {
	image_index = 1;
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_itemdescription2);
	scr_Draw_Input_UI(x,bbox_top+16+4,6,0,fnt_itemdescription2,fa_center,fa_middle);
	scr_Draw_Text_Outlined(x,bbox_top+16+16,"Reset",c_white);
}else {
	image_index = 0;
}