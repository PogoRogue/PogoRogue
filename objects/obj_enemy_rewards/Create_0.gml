// Inherit the parent event
 
event_inherited();

x_spd = 1;
y_spd = 1;

image_xscale = x_spd;

hp = 20; 

hp_max = hp;

hp_percent = (hp / hp_max) * 100;


is_moving = false
found = false;

if (obj_player.x >= x)
	{
		image_xscale = -1;
	}
	if (obj_player.x <= x)
	{
		image_xscale = 1;
	}

target_x =0;
target_y =0;

