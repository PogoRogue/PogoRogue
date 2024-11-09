view_width = camera_get_view_width(view_camera[0]);
view_height = camera_get_view_height(view_camera[0]);
top_border = view_height - 20;
mole_defeated = false;
current_moles_left = 0;
bomb_max_odds = 4;

instance_create_depth(x, y, -20, obj_boss_mole_health);


mole_1 = instance_create_depth(0,0,501,obj_boss_mole1);
mole_2 = instance_create_depth(0,0,501,obj_boss_mole2);
mole_3 = instance_create_depth(0,0,501,obj_boss_mole3);

next_state = "poke";
next_state_array = [];
times_in_a_row = 0;
shoot_vertical = false;

next_pipe1 = 1;
next_pipe2 = 1;
next_pipe3 = 1;

poke_odds = 3;
jump_odds = 1;
shoot_odds = 1;

alarm[0] = 1;

time_between_attacks = 240;