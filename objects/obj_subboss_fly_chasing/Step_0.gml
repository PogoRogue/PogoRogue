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
		sprite_index=spr_b1_fly_move
		follow_path = path_add();
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