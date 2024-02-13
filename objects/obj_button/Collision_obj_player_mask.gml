/// @description Press

if(!is_pressed) {
	other.speed = 0;

	is_pressed = true;
	alarm_set(0, press_duration);
}