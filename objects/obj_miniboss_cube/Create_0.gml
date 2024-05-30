
/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();


depth = -5;
spd = 1;
rotation_spd = 1;
hp = 32;
hp_max = hp;
enemy_coin_bonus = 15;


instance_create_layer(x + 16, y + 16, "enemies", obj_boss_brick_black, {parent: obj_miniboss_cube});
instance_create_layer(x - 16, y + 16, "enemies", obj_boss_brick_blue, {parent: obj_miniboss_cube});
instance_create_layer(x + 16, y - 16, "enemies", obj_boss_brick_red, {parent: obj_miniboss_cube});
instance_create_layer(x - 16, y - 16, "enemies", obj_boss_brick_yellow, {parent: obj_miniboss_cube});
