/// @description initialize variables

//feel free to make copies of this object to mess around with movement values

grv = 0.21; //gravity
h_grv = 0.0; //horizontal drag
rotation_speed = 2.5; //rotation speed
current_rotation_speed = rotation_speed;
rotation_delay = rotation_speed / 5; //0.5
vsp_basicjump = -6.6; //bounce height
angle = 0;
anglemax = 40; //maximum degrees added on either side
bouncing = false; //bouncing animation when true
animation_complete = false; //bounce animation before jumping
use_mouse = false; //use mouse to control instead of WASD/Arrow keys?
mouse_sensitivity = 150; //the lower the value, the more sensitive the player is to mouse movement and vice versa
mouse_reanglespeed = 4; //the lower the value, the faster the player will reangle itself and vice versa
invert = false;

//set controls variables
key_right = 0;
key_left = 0;
key_fire_projectile = 0;
key_right_pressed = 0;
key_left_pressed = 0;
key_fire_projectile_pressed = 0;

//weapons
mouse_angle = 0; //direction from gun to mouse
knockback_angle = 0; //angle of knockback

ox = x; //original x position
oy = y; //original y position

#region //bullets
default_bullet = {
	sprite: spr_projectile_nerfdart,//bullet sprite
	spd: 20,                        //speed of bullet
	firerate_start: 1,              //initial firerate, higher = slower
	firerate_end: 1,                //max firerate, higher = slower
	firerate_mult: 0,               //multiplication of firerate per shot
	firerate: 1,                    //current firerate, higher = slower
	destroy_on_impact: true         //destroy when touching ground or not
};

paintball_bullet = {
	sprite: spr_projectile_paintball1,//bullet sprite
	spd: 20,                          //speed of bullet
	firerate_start: 5,                //initial firerate, higher = slower
	firerate_end: 5,                  //max firerate, higher = slower
	firerate_mult: 0,                 //multiplication of firerate per shot
	firerate: 5,                      //current firerate, higher = slower
	destroy_on_impact: true           //destroy when touching ground or not
};
#endregion

#region //guns
default_gun = {
	name: "Default Gun",  //name of gun
	sprite: spr_player,   //gun sprite
	ammo: [default_bullet],//array of ammo
	inaccuracy: 0,        //random bullet angle inaccuracy
	kick: 2,              //kickback to position and angle
	//sound: snd_nothing, //sound effect
	spread_number: 1,     //number of bullets per shot
	spread_angle: 0,      //angle between bullets in spread shot
	full_auto: false,     //hold down mouse to shoot vs click for each shot
	burst_number: 1,      //number of bullets in burst
	burst_delay: 0,       //delay between bursts
	momentum_added: 0.9,  //percentage of vsp_basicjump to apply for each bullet, 1 = 100%
	reset_momentum: true, //reset player speed to 0 for each bullet (false), or just add to current speed (false)
	bullets_per_bounce: 3,//Number of bullets per clip
	current_bullets: 3,   //current number of bullets left
	max_speed: 5          //player cant move faster than this if full_auto = true
};

paintball_gun = {
	name: "Paintball Gun",  //name of gun
	sprite: spr_player,   //gun sprite
	ammo: [paintball_bullet],       //array of ammo
	inaccuracy: 5,        //random bullet angle inaccuracy
	kick: 2,              //kickback to position and angle
	//sound: snd_nothing, //sound effect
	spread_number: 1,     //number of bullets per shot
	spread_angle: 0,     //angle between bullets in spread shot
	full_auto: true,     //hold down mouse to shoot vs click for each shot
	burst_number: 1,      //number of bullets in burst
	burst_delay: 0,       //delay between bursts
	momentum_added: 0.4,  //percentage of vsp_basicjump to apply for each bullet, 1 = 100%
	reset_momentum: false, //reset player speed to 0 for each bullet (false), or just add to current speed (false)
	bullets_per_bounce: 10,//Number of bullets per clip
	current_bullets: 10,    //current number of bullets left
	max_speed: 6           //player cant move faster than this if full_auto = true
};

shotgun_gun = {
	name: "Shotgun",  //name of gun
	sprite: spr_player,   //gun sprite
	ammo: [default_bullet],//array of ammo
	inaccuracy: 0,        //random bullet angle inaccuracy
	kick: 2,              //kickback to position and angle
	//sound: snd_nothing, //sound effect
	spread_number: 5,     //number of bullets per shot
	spread_angle: 15,      //angle between bullets in spread shot
	full_auto: false,     //hold down mouse to shoot vs click for each shot
	burst_number: 1,      //number of bullets in burst
	burst_delay: 0,       //delay between bursts
	momentum_added: 1.25,  //percentage of vsp_basicjump to apply for each bullet, 1 = 100%
	reset_momentum: true, //reset player speed to 0 for each bullet (false), or just add to current speed (false)
	bullets_per_bounce: 2,//Number of bullets per clip
	current_bullets: 2,   //current number of bullets left
	max_speed: 6          //player cant move faster than this if full_auto = true
};

#endregion

canshoot = 0; //shooting timer
bullet_index = 0; //current bullet

gun_array = [default_gun,paintball_gun,shotgun_gun];
current_gun = 0;
gun = gun_array[current_gun];

player_sprite = spr_player;
falling_sprite = spr_player_falling;
falling_sprite2 = spr_player_falling2;

dead = false;

image_speed = 0;

depth = -10;

//we probably want 2 separate collision masks, one for the very bottom of the pogo stick, and the other for colliding with the sides/bottom of walls
with (instance_create_depth(x,y,depth-1,obj_player_mask)) {
	parent_index = other;
}
msk_index = instance_nearest(x,y,obj_player_mask); //references obj_playermask object

//item Code
has_item = false; // // Whether the player is equipped with a weapon
equipped_item = noone; // The weapon that initializes the equipment is none