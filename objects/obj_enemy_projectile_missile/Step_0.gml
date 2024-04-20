/// @description Pick sprite frame
// Inherit the parent event
event_inherited();


image_index = blink_frames > 0 ? 1 : 0;
blink_frames--;
