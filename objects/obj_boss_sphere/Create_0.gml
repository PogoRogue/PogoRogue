/// @description Instantiate variables

// Inherit the parent event
event_inherited();

heart_chance = 0; //percent
buff_chance = 0; //percent
pickup_chance = 0; //percent
weapon_chance = 0; //percent

depth = -7;
spd = 0; //0.3
prev_spd = spd;
prev_hspd = spd;
prev_vspd = spd;
rotation_spd = 0.5;
rotation_spd_init = rotation_spd;
hp = 128;
hp_max = hp;
draw_hp = false;

vspeed = spd;
hspeed = spd;

// Healthbar dimensions
view_width = camera_get_view_width(view_camera[0]);
view_height = camera_get_view_height(view_camera[0]);
top_border = view_height - 20;
hp_percent = (hp / hp_max) * 100;

// Spawn pieces
dist_from_center = 0;
type = irandom(3);
type_index = noone;
for(var _i = -3; _i < 4; _i++) {
	for(var _j = -3; _j < 4; _j++) {
		dist_from_center = abs(_i) + abs(_j);
		if(dist_from_center < 5) {
			switch(type) {
				case 0: 
					type_index = obj_boss_brick_black;
					break;
				case 1: 
					type_index = obj_boss_brick_blue;
					break;
				case 2:
					type_index = obj_boss_brick_red;
					break;
				case 3:
					type_index = obj_boss_brick_yellow;
					break;
			}
			
			if(_i == 0 && _j == 0) {
				type_index = obj_boss_brick_gap;
			}
			
			//instance_create_depth(x + (_i * 32), y + (_j * 32), depth-1, type_index);
			instance_create_layer(x + (_i * 32), y + (_j * 32), "enemies", type_index, {parent: obj_boss_sphere});
			randomize();
			type = irandom(3);
			random_set_seed(global.seed);
		}
	}
}

drop_coins = false;

instance_create_depth(x, y, -20, obj_boss_sphere_health);

explode = false;
red_alpha = 0;

spawned = false;
white_alpha = 0.5;

init_x = x;
init_y = y;

num_of_bounces = 0;