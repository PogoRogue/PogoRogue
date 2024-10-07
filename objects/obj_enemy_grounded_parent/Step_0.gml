/// @description Falling
// You can write your code in this editor



// Inherit the parent event
event_inherited();

if(!is_flying){
    is_grounded = instance_place(x, y, [obj_ground]);
	if (is_grounded <= 0) {
		vspeed = vspeed+grav;
		if !is_dead {
			mask_index = sprite_index;
		}else {
			hspeed = 0;
			vspeed = 0;
		}
		is_falling = instance_place(x, y+vspeed, [obj_ground_parent]);
		var is_falling2 = place_meeting(x, y+vspeed, obj_ground) or (place_meeting(x, y+vspeed, obj_ground_oneway) and !place_meeting(x, y-1, obj_ground_oneway)) and vspeed > 0;
		if (is_falling2 = true) {
			vspeed=0;
		}
	}
}