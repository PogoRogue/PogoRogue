/// @description Player should bounce off shield

if(is_active) {
	with(obj_player) {
		hspeed = -2 * sign(hspeed);
		vspeed = 0;
		
		x += hspeed;
		y += vspeed;
	}
	image_alpha = 0.5;
	is_active = false;
}
