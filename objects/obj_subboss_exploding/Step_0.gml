/// @description Insert description here
// You can write your code in this editor

//lets enemy drop before it moves
is_grounded = instance_place(x, y, [obj_ground_parent]);
if (is_grounded <= 0) {
	vspeed = vspeed + obj_player.grv;
	mask_index = sprite_index;
	is_falling = instance_place(x, y+vspeed, [obj_ground_parent]);
	if (is_falling > 0)
	{
		image_speed = 1;
		if(image_index == 4)
		{
			drop = true
		}
		vspeed=0;
	}
}

// Inherit the parent event
event_inherited();
if(is_dead!=true)
{
	sprite_index = spr_b1_explode_move;
}
if(is_dead) {
	spd = 0;
	if (sprite_index == spr_b1_explode_move)
	{
		image_index = 0;
		sprite_index = spr_b1_explode_fuse;
	}
}
