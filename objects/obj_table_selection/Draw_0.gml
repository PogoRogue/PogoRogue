draw_self();
if colliding and image_index != sprite_get_number(sprite_index)-1 {
	if global.current_skin = 6 {
		scr_Draw_Input_Prompt(x,y - 60,6,"Swap",make_color_rgb(242,240,229));
	}else {
		scr_Draw_Input_Prompt(x,y - 48,6,"Swap",make_color_rgb(242,240,229));
	}
}	