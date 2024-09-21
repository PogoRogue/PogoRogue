/// @description Initialize variables
depth += 1;
colliding = false;
controller_sprite = spr_controller_button_top;
keyboard_sprite = spr_arrow_up;
shop_used = false;

if room = room_boss_1 or room = room_boss_2 {
	image_xscale = 0;
	image_yscale = 0;
}