/// @description Insert description here
// You can write your code in this editor

if(!is_dead) {
	alpha = abs(cos(current_iframes / 5)) + 0.2;
}

draw_self();

if(draw_hp && hp < hp_max && hp > 0) {
	scr_Draw_Enemy_Health();
}

hp_percent = (hp / hp_max) * 100;

if(show_red = true) {
	draw_sprite(spr_enemy_tutorial,2,x,y);
}