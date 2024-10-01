draw_self();
if instance_exists(speechbubble_obj) {
	//if speechbubble_obj.bubble_index = 0 {
		draw_sprite(spr_salesman_nametag,0,x,y-23);
	//}
}else {
	draw_sprite(spr_salesman_nametag,0,x,y-23);
}