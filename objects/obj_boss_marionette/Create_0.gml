/// @description Initiate variables
// Inherit the parent event
event_inherited();

distance = 700;
angle_accelerration = 0;
angle_velocity = 0;
angle = -67;
anchor_x = x;
anchor_y = y - distance;
swingspeed = -0.02;
oscillation = 0;
spring_force = 0;
damping = 0.99;
hsp = 0;
vsp = 0;
collision_detected = false;


enum BOSS3_ABILITIES {
	NONE,
	GROUND_POUND,
	GROUND_POUND_SHOCKWAVE,
	SHIELD,
	BULLET_BLAST,
}

enum BOSS3_WEAPONS {
	NONE,
	PISTOL,
	SHOTGUN,
	MISSILE,
	LASER,
}

ability = BOSS3_ABILITIES.NONE;
weapon = BOSS3_WEAPONS.PISTOL;
ability_cooldown =  8 * room_speed;

// HP
draw_hp = false;
hp = 50//0;
previous_hp = hp;
is_hurt = false;
hp_max = hp;
hp_percent = (hp / hp_max) * 100;

// Healthbar dimensions
view_width = camera_get_view_width(view_camera[0]);
view_height = camera_get_view_height(view_camera[0]);
top_border = view_height - 20;
boss_name = "Rogo Puppet";

// Limbs
instance_create_depth(x + 40, y, depth - 1, obj_boss_marionette_arm, {arm_num: 1, length_diff: 35, angle_diff: 40});
instance_create_depth(x - 40, y, depth - 1, obj_boss_marionette_arm, {arm_num: 2, length_diff: 35, angle_diff: 140});

instance_create_depth(x, y, -20, obj_boss_marionette_health);

alarm_set(2, ability_cooldown);
