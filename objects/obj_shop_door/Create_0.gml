/// @description Initialize variables
depth += 1;
colliding = false;
controller_sprite = spr_controller_button_top;
keyboard_sprite = spr_arrow_up;
shop_used = false;

if scr_In_Array(global.boss_rooms,room) {
	image_xscale = 0;
	image_yscale = 0;
	y -= 60;
}

angle = 0;