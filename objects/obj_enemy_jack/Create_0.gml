/// @description Instantiate variables

// Inherit the parent event
event_inherited();

hp = 24;
hp_max = hp;
hp_percent = (hp / hp_max) * 100;
draw_hp = true;
is_open = false;
damage = 0;

sprite_index = spr_enemy_jack_normal;
open_sprite = spr_enemy_jack_normal_open;

// Clown animation variables
body_pos_x = 0;
body_pos_y = 0;
body_subimg = 0;

random_set_seed(global.seed + global.enemy_number);
heart_chance = 50 - global.luck;
buff_chance = 90;
weapon_chance = 60 + global.luck;
pickup_chance = 60 + global.luck;

random_items = scr_Random_Item_Drops();
random_set_seed(global.seed);
