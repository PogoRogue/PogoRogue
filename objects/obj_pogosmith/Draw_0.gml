draw_self();
var y_offset = 0;
switch(floor(image_index)) {
	case 0: y_offset = 0; break;	
	case 1: y_offset = 1; break;
	case 2: y_offset = 2; break;
	case 3: y_offset = 2; break;
	case 4: y_offset = 1; break;
	case 5: y_offset = 0; break;
}

if instance_exists(speechbubble_obj) {
	if speechbubble_obj.bubble_index = 0 {
		draw_sprite(spr_pogosmith_nametag,0,x+6,y-40+y_offset);
	}
}else {
	draw_sprite(spr_pogosmith_nametag,0,x+6,y-40+y_offset);
}