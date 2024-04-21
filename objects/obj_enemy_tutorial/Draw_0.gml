/// @description Insert description here
// You can write your code in this editor

if(image_index = 1) {
	shader_set(sh_tint_red);
}

if(!is_dead) {
	image_alpha = abs(cos(current_iframes / 5)) + 0.2;
}

draw_self();
shader_reset();

if(draw_hp && hp < hp_max && hp > 0) {
	scr_Draw_Enemy_Health();
}

hp_percent = (hp / hp_max) * 100;
