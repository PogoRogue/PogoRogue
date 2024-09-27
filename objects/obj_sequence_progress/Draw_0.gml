/// @description Insert description here
// You can write your code in this editor
draw_self();
if controller.current_state == BOSS2_STATES.ATTACKING {
	draw_sprite(spr_sequence_progress2,image_index,x,y);
}