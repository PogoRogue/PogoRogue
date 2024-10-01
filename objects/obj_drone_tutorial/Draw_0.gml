draw_self();
if instance_exists(speechbubble_obj_1) {
	//if speechbubble_obj.bubble_index = 0 {
		draw_sprite(spr_drone_nametag,0,x+4*image_xscale,y-27);
	//}
}else {
	draw_sprite(spr_drone_nametag,0,x+4*image_xscale,y-27);
}