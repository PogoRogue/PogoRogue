draw_self();
if instance_exists(speechbubble_obj) {
	//if speechbubble_obj.bubble_index = 0 {
		draw_sprite(spr_tony_nametag,0,x,y-27);
	//}
}else {
	draw_sprite(spr_tony_nametag,0,x,y-27);
	
	if colliding {
		scr_Draw_Input_Prompt(x,y-47,6,"Talk",make_color_rgb(242,240,229));	
	}
}