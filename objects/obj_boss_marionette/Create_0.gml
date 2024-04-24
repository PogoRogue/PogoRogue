/// @description Initiate variables
// Inherit the parent event
event_inherited();

// Stats
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
despawn_timer = 2 * room_speed;
limb_alpha = 1.0;


enum BOSS3_ABILITIES {
	NONE,
	GROUND_POUND,
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
controller = instance_nearest(x, y, obj_boss_marionette_controller);

// HP
draw_hp = false;
hp = 500;
previous_hp = hp;
is_hurt = false;
hp_max = hp;
hp_percent = (hp / hp_max) * 100;

// Limbs
instance_create_depth(x + 40, y, depth - 5, obj_boss_marionette_arm, {arm_num: 1, length_diff: 35, angle_diff: 40});
instance_create_depth(x - 40, y, depth - 5, obj_boss_marionette_arm, {arm_num: 2, length_diff: 35, angle_diff: 140});

instance_create_depth(x + 40, y, depth - 5, obj_boss_marionette_thigh, {leg_num: 1, length_diff: 80, angle_diff: -77});
instance_create_depth(x - 40, y, depth - 5, obj_boss_marionette_thigh, {leg_num: 2, length_diff: 80, angle_diff: -103});

alarm_set(2, ability_cooldown*2); 