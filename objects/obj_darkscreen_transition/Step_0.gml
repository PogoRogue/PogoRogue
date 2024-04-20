if alpha_up = true {
	alpha += 0.025;	
	if alpha >= 1 {
		alpha_up = false;
		room = room_menu;
	}
}else {
	if alpha > 0 {
		alpha -= 0.01;	
	}else {
		instance_destroy()
	}
}