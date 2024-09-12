/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if shot_times < 10 {
	for(i = 0; i < 10; i++) {
		draw_sprite(spr_dummy_ui,(shot_times > i),x + (((i%10)-4.5)*12),bbox_top-32);
	}
}else {
	for(i = 0; i < 10; i++) {
		draw_sprite(spr_dummy_ui,4,x + (((i%10)-4.5)*12),bbox_top-32);
	}
}

if bounced_times < 5 {
	for(i = 0; i < 5; i++) {
		draw_sprite(spr_dummy_ui,(bounced_times > i)+2,x + (((i%5)-2)*12),bbox_top-20);
	}
}else {
	for(i = 0; i < 5; i++) {
		draw_sprite(spr_dummy_ui,4,x + (((i%5)-2)*12),bbox_top-20);
	}
}