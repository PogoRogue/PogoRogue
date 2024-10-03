draw_self();
if instance_exists(speechbubble_obj) {
	//if speechbubble_obj.bubble_index = 0 {
		draw_sprite(spr_drone_nametag,0,x+4*image_xscale,y-27);
	//}
}else {
	draw_sprite(spr_drone_nametag,0,x+4*image_xscale,y-27);
	
	
	if colliding {
		scr_Draw_Input_Prompt(x+4*image_xscale,y-43,6,"Talk",make_color_rgb(242,240,229));	
	}
}
