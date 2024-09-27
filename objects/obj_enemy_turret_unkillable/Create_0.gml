/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

bullet_defense = 0.5; // Half damage from projectiles

is_active = true;
draw_hp = false;
range = 400;
pattern = obj_slime_pattern;

default_sprite = spr_slime_turret_head;
body_sprite = spr_slime_turret_body;
shooting_sprite = spr_slime_turret_shoot;
depth = 450;