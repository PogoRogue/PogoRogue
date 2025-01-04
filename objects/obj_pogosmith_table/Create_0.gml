table_num = instance_number(obj_pogosmith_table);
alarm[1] = 1;
sprite_index = spr_pogosmith_workbench;

colliding = false;
being_used = false;
select_x = obj_player.current_gun;
select_x_max = obj_player.num_of_weapons;
selected_x = false;
alarm2_time = 30;

angle = 0;
purchase_cost = 50;

upgrade_color = make_color_rgb(242,240,229);
cost_color = make_color_rgb(237,225,158);

test_mode = false;

gun_1_bought = false;
gun_2_bought = false;
gun_3_bought = false;

black_alpha_1 = 0;
black_alpha_2 = 0;
black_alpha_3 = 0;

init_gun_1  = obj_player.gun_1;
init_gun_2 = obj_player.gun_2;
init_gun_3 = obj_player.gun_3;
