/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

//enemy path doesn't start until it "drops"
if (drop == false)
{
	if (image_index==6)
	{
		image_index=1
		sprite_index=spr_B1_Fly_Move
		//follow_path = path_add();
		alarm[1]=1;
		drop=true
	}
}

//enemy faces player
if (drop == true)
{
	if (obj_player.x >= x)
	{
		image_xscale = 1;
	}
	if (obj_player.x <= x)
	{
		image_xscale = -1;
	}
	
}

if explode = true {
	path_end();
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

if is_dead = true {
	speed = 0;	
}