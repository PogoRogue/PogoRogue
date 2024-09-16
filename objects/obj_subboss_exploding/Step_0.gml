/// @description Insert description here
// You can write your code in this editor

//lets enemy drop before it moves
is_grounded = place_meeting(x, y+1, obj_ground)
or place_meeting(x, y+1, obj_ground_oneway) and !place_meeting(x, y-1, obj_ground_oneway);
if (is_grounded <= 0) {
	vspeed = vspeed + obj_player.grv;
	mask_index = sprite_index;
	is_falling = place_meeting(x, y+vspeed, [obj_ground]) or place_meeting(x, y+vspeed, [obj_ground_oneway]) and !place_meeting(x, y-1, obj_ground_oneway);
	if (is_falling > 0)
	{
		image_speed = 1;
		if(image_index == 4)
		{
			drop = true;
		}
		vspeed=0;
	}
}

// Inherit the parent event
event_inherited();
if(is_dead!=true)
{
	sprite_index = spr_B1_Explode_Move;
}
if(is_dead) {
	spd = 0;
	if (sprite_index == spr_B1_Explode_Move)
	{
		image_index = 0;
		sprite_index = spr_B1_Explode_Fuse;
	}
}


if explode = true {
	image_speed = 0;
	speed = 0;
	mask_index = spr_nothing;
	if red_alpha < 1.2 {
		red_alpha += 0.025;
	}else {
		instance_destroy();
		instance_create_layer(x, y, "enemies", obj_explosion);
	}
}

// Update iframes
current_iframes = max(current_iframes - 1, 0);

// Update red shader frames
red_frames = max(red_frames - 1, 0);

if instance_exists(obj_boss_sphere) {
	depth = obj_boss_sphere.depth + 10;
}	

if is_dead = true {
	speed = 0;	
}