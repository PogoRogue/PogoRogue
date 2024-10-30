/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state();

switch poke_direction {
	case "up": image_xscale = 1; image_yscale = 1; image_angle = 0; break;
	case "down": image_xscale = 1; image_yscale = -1; image_angle = 0; break;	
	case "left": image_xscale = 1; image_yscale = -1; image_angle = 90; break;	
	case "right": image_xscale = 1; image_yscale = 1; image_angle = 90; break;	
}