/// @description Instantiate variables

// Position and rotation variables
player = instance_find(obj_player, 0);
dist_to_player = distance_to_object(player);
can_see_player = false;
range = 300;

// Weapon variables
bullet_speed = 5;
cooldown_length = 1.5 * room_speed;
weapon_cooldown = cooldown_length;

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
image_angle = rotation;

// Inherit the parent event
event_inherited();

