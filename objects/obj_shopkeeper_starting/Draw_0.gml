draw_self();
var y_offset = 0;
switch(floor(image_index)) {
	case 0: y_offset = 0; break;	
	case 1: y_offset = 0; break;
	case 2: y_offset = 1; break;
	case 3: y_offset = 2; break;
	case 4: y_offset = 3; break;
	case 5: y_offset = 4; break;
	case 6: y_offset = 4; break;
	case 7: y_offset = 3; break;
	case 8: y_offset = 1; break;
}
if instance_exists(speechbubble_obj) {
	//if speechbubble_obj.bubble_index = 0 {
		draw_sprite(spr_shopkeeper_nametag,0,x,y-60+y_offset);
	//}
}else {
	draw_sprite(spr_shopkeeper_nametag,0,x,y-60+y_offset);
	
	if colliding {
		scr_Draw_Input_Prompt(x,y-76,6,"Talk",make_color_rgb(242,240,229));	
	}
}