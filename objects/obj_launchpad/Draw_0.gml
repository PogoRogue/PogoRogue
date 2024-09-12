var y_add_range = y_add;
if y_add_range < -4 {
	y_add_range = -4;
}
if y_add_range > 4 {
	y_add_range = 4;
}
draw_sprite_ext(sprite_index,image_index,x,y+y_add,scale,scale,image_angle,image_blend,alpha);
if sprite_index != spr_launchpad_white {
	draw_sprite(spr_launchpad_flames,flames_index,x,y+y_add);
}

with rocket_1 {
	if launched = false {
		x = other.x-56;
		y = y_init + other.y_add;
	}
}
with rocket_2 {
	if launched = false {
		x = other.x+55;
		y = y_init + other.y_add;
	}
}

if mask_index = spr_launchpad_mask {
	//draw_sprite_ext(spr_launchpad_mask,image_index,x,y,scale,scale,image_angle,image_blend,alpha);
}