/// @description Insert description here
// You can write your code in this editor
event_inherited();
if (is_shaking) {
    var shake_amount = 2;
    draw_sprite_ext(sprite_index, image_index, x + irandom_range(-shake_amount, shake_amount), y + irandom_range(-shake_amount, shake_amount), 1, 1, 0, c_white, 1);
} else {
    draw_self();
}








