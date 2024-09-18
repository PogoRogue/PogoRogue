/// @description Instantiate variables

// Position and rotation variables
player = instance_find(obj_player, 0);
dist_to_player = distance_to_object(player);
can_see_player = false;
range = 360;

// Weapon variables
bullet_speed = 5;
cooldown_length = room_speed*1.5;
weapon_cooldown = cooldown_length;
pattern = obj_enemy_projectile_bullet; // For more complicated projectile patterns

// Determine which surface the turret is on
rotation = 0;
is_vertical = true;
alarm[1] = 1;
windup = true;
w_alarm_cd = false;

// Animation variables
default_sprite = spr_turret_head;
body_sprite = spr_turret_body;
shooting_sprite = spr_turret_shoot;
angle = rotation;
target_angle = 0;
rot_speed = 0;
depth = 10;
angle_offset = 0;
can_shoot = false;

// Inherit the parent event
event_inherited();

