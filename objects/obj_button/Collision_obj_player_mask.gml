/// @description Press

if(!is_pressed) {
	other.speed = 0;

	is_pressed = true;
	sprite_index = pressed_sprite;
	alarm_set(0, press_duration);
}