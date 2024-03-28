if alpha > 0 {
	alpha -= 0.05;	
}
	
if alpha < 1 {

	if x_offset < 384 {
		x_offset += spd;
	}else {
		instance_destroy();	
	}

	if spd < 8 {
		spd += 0.25;	
	}
}