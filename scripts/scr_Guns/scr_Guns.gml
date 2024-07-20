// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Guns(){
	default_gun = {
		_name: "Pistol",  //name of gun
		tagline: "Your starting weapon. It's pretty decent.", //short description of weapon
		sprite: spr_gun_default,   //gun sprite
		ammo: [default_bullet],//array of ammo
		inaccuracy: 0,        //random bullet angle inaccuracy
		kick: 2,              //kickback to position and angle
		sound: snd_defaultgun,    //sound effect
		spread_number: 1,     //number of bullets per shot
		spread_angle: 0,      //angle between bullets in spread shot
		full_auto: false,     //hold down mouse to shoot vs click for each shot
		burst_number: 1,      //number of bullets in burst
		burst_delay: 0,       //delay between bursts
		momentum_added: 1,    //0.9, percentage of vsp_basicjump to apply for each bullet, 1 = 100%
		reset_momentum: true, //reset player speed to 0 for each bullet (false), or just add to current speed (false)
		bullets_per_bounce: 4 + obj_player.max_ammo_buff,//Number of bullets per clip
		init_bullets_per_bounce: 4, //Initial number of bullets per clip (no ammo buff)
		current_bullets: 4 + obj_player.max_ammo_buff,   //current number of bullets left
		max_added_bullets: 5, //max number of bullets that can be added from the ammo powerup
		max_speed: -vsp_basicjump //player cant move faster than this if full_auto = true
	};
	
	empty_gun = {
		_name: "",
		tagline: "",
		sprite: spr_nothing,
		ammo: [empty_bullet],
		inaccuracy: 0,
		kick: 2,
		sound: snd_nothing,
		spread_number: 1,
		spread_angle: 0,
		full_auto: false,
		burst_number: 0,
		burst_delay: 0,
		momentum_added: 0,
		reset_momentum: false,
		bullets_per_bounce: 0,
		init_bullets_per_bounce: 0,
		current_bullets: 0,
		max_added_bullets: 0,
		max_speed: -vsp_basicjump
	};
	
	hat_gun = {
		_name: "Hat Gun",
		sprite: spr_nothing,
		ammo: [hatgun_bullet],
		inaccuracy: 0,
		kick: 2,
		sound: snd_hatgun,
		spread_number: 1,
		spread_angle: 0,
		full_auto: false,
		burst_number: 1,
		burst_delay: 0,
		momentum_added: 0,
		reset_momentum: false,
		bullets_per_bounce: 1,
		init_bullets_per_bounce: 1,
		current_bullets: 1,
		max_added_bullets: 0,
		max_speed: -vsp_basicjump
	};
	
	bulletblast_gun = {
		_name: "Bullet Blast",
		sprite: spr_nothing,
		ammo: [bulletblast_bullet],
		inaccuracy: 0,
		kick: 2,
		sound: snd_nothing,
		spread_number: 45,
		spread_angle: 8,
		full_auto: false,
		burst_number: 1,
		burst_delay: 0,
		momentum_added: 0,
		reset_momentum: false,
		bullets_per_bounce: 1,
		init_bullets_per_bounce: 1,
		current_bullets: 1,
		max_added_bullets: 0,
		max_speed: -vsp_basicjump
	};

	paintball_gun = {
		_name: "Paintball Gun",  
		tagline: "Fire colorful paintballs at a high speed with high control.",
		sprite: spr_gun_paintball,   
		ammo: [paintball_bullet],     
		inaccuracy: 5,     
		kick: 2,           
		sound: snd_paintball1, 
		spread_number: 1,     
		spread_angle: 0, 
		full_auto: true,    
		burst_number: 1,      
		burst_delay: 0,       
		momentum_added: 0.4,  
		reset_momentum: false, 
		bullets_per_bounce: 10 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 10,
		current_bullets: 10 + obj_player.max_ammo_buff,   
		max_added_bullets: 5,
		max_speed: -vsp_basicjump           
	};

	shotgun_gun = {
		_name: "Shotgun",  
		tagline: "Powerful, short-range blast spread of 5 shots.",
		sprite: spr_gun_shotgun,  
		ammo: [shotgun_bullet],
		inaccuracy: 0,       
		kick: 2,             
		sound: snd_shotgun,
		spread_number: 5,     
		spread_angle: 15,     
		full_auto: false,     
		burst_number: 1,    
		burst_delay: 0,     
		momentum_added: 1.25, 
		reset_momentum: true, 
		bullets_per_bounce: 2 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 2,
		current_bullets: 2 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: -vsp_basicjump          
	};

	bubble_gun = {
		_name: "Bubble Gun",  
		tagline: "Extremely fast, high-control bubble shooter. Bubbles pop after a short time.",
		sprite: spr_gun_bubble,   
		ammo: [bubble_bullet],
		inaccuracy: 35,       
		kick: 2,              
		sound: snd_bubble,
		spread_number: 1,    
		spread_angle: 15,    
		full_auto: true,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 0.2, 
		reset_momentum: false, 
		bullets_per_bounce: 24 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 24,
		current_bullets: 24 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: 8
	};

	burstfire_gun = {
		_name: "Burst Fire Gun",  
		tagline: "Fire quick bursts of 3 bullets.",
		sprite: spr_gun_burstfire,   
		ammo: [burstfire_bullet],
		inaccuracy: 10,       
		kick: 2,              
		sound: snd_burstfire,
		spread_number: 1,    
		spread_angle: 15,    
		full_auto: true,     
		burst_number: 3,     
		burst_delay: 6,     
		momentum_added: 1, 
		reset_momentum: false, 
		bullets_per_bounce: 9 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 9,
		current_bullets: 9 + obj_player.max_ammo_buff,  
		max_added_bullets: 15,
		max_speed: -vsp_basicjump
	};	
	
	grenade_gun = {
		_name: "Grenade Launcher",  
		tagline: "Fire oddly elastic grenades that explode after one bounce.",
		sprite: spr_gun_grenade,   
		ammo: [grenade_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_grenade,
		spread_number: 1,    
		spread_angle: 0,    
		full_auto: false,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 0.9, 
		reset_momentum: true, 
		bullets_per_bounce: 3 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 3,
		current_bullets: 3 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: -vsp_basicjump*0.9
	};	
	
	laser_gun = {
		_name: "Laser Gun",  
		tagline: "Create a massive, powerful laser that can cut through walls.",
		sprite: spr_gun_laser,   
		ammo: [laser_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_laser,
		spread_number: 1,    
		spread_angle: 0,    
		full_auto: false,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 0.075, 
		reset_momentum: false, 
		bullets_per_bounce: 100 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 100,
		current_bullets: 100 + obj_player.max_ammo_buff,  
		max_added_bullets: 0,
		max_speed: 5.25
	};	
	
	bouncyball_gun = {
		_name: "Bouncy Ball Blaster",  
		tagline: "Fire bouncy balls that bounce off of walls up to 3 times, doubling in damage after each bounce.",
		sprite: spr_gun_bouncyball,   
		ammo: [bouncyball_bullet],
		inaccuracy: 15,       
		kick: 2,              
		sound: snd_bbb1,
		spread_number: 1,    
		spread_angle: 0,    
		full_auto: true,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 1, 
		reset_momentum: false, 
		bullets_per_bounce: 5 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 5,
		current_bullets: 5 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: 7.25
	};	
	
	missile_gun = {
		_name: "Missile Launcher",  
		tagline: "Fire a heat-seeking missile that locks onto nearby enemies.",
		sprite: spr_gun_missile,   
		ammo: [missile_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_grenade,
		spread_number: 1,    
		spread_angle: 0,    
		full_auto: false,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 1.4, 
		reset_momentum: true, 
		bullets_per_bounce: 1 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 1,
		current_bullets: 1 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: 8
	};
	
	boomerang_gun = {
		_name: "Boomerangs",  
		tagline: "Can be immediately used again once they return to you, but won't reload on bounce/kills. Don't worry, they always come back.",
		sprite: spr_gun_boomerang,   
		ammo: [boomerang_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_nothing,
		spread_number: 1,    
		spread_angle: 0,    
		full_auto: false,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 1.2, 
		reset_momentum: true, 
		bullets_per_bounce: 2 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 2,
		current_bullets: 2 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: 8
	};
	
	starsucker_gun = {
		_name: "Star Sucker",  
		tagline: "Suck in a wide arc of 10 stars from afar. Stars give you a boost once when they make contact with you.",
		sprite: spr_gun_starsucker,  
		ammo: [starsucker_bullet],
		inaccuracy: 0,       
		kick: 2,             
		sound: snd_starsucker,
		spread_number: 10,     
		spread_angle: 15,     
		full_auto: true,     
		burst_number: 1,    
		burst_delay: 0,     
		momentum_added: 0, 
		reset_momentum: false, 
		bullets_per_bounce: 4 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 4,
		current_bullets: 4 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: -vsp_basicjump          
	};
	
	sniper_gun = {
		_name: "Sniper Rifle",  
		tagline: "Powerful, long-range hitscan blast.",
		sprite: spr_gun_sniper,
		ammo: [sniper_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_sniper,
		spread_number: 1,    
		spread_angle: 0,    
		full_auto: false,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 1.25, 
		reset_momentum: true, 
		bullets_per_bounce: 2 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 2,
		current_bullets: 2 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: 9
	};	
	
	slime_gun = {
		_name: "Slime Blaster",  
		tagline: "Unleash a wide blast of slime chunks onto enemies below.",
		sprite: spr_gun_slime,  
		ammo: [slime_bullet],
		inaccuracy: 15,       
		kick: 2,             
		sound: snd_slime,
		spread_number: 30,     
		spread_angle: 5,     
		full_auto: false,     
		burst_number: 1,    
		burst_delay: 0,     
		momentum_added: 1.15, 
		reset_momentum: true, 
		bullets_per_bounce: 3 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 3,
		current_bullets: 3 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: -vsp_basicjump          
	};
	
	yoyo_gun = {
		_name: "Yo-yo",  
		tagline: "Throw and hold a yo-yo that swings from below you, causing damage to enemies in its path. It can be reused when it retracts, giving you an additional boost when it makes contact.",
		sprite: spr_gun_yoyo,   
		ammo: [yoyo_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_nothing,
		spread_number: 1,    
		spread_angle: 0,    
		full_auto: false,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 1, 
		reset_momentum: true, 
		bullets_per_bounce: 1,
		init_bullets_per_bounce: 1,
		current_bullets: 1,  
		max_added_bullets: 0,
		max_speed: 16
	};
	
	javelin_gun = {
		_name: "Javelins",
		tagline: "Launch a javelin downwards. Charging your shot results in a faster, more powerful javelin.",
		sprite: spr_gun_javelins,
		ammo: [javelin_bullet],
		inaccuracy: 0,
		kick: 2,
		sound: snd_nothing,
		spread_number: 1,
		spread_angle: 0,
		full_auto: false,
		burst_number: 1,
		burst_delay: 0,
		momentum_added: 0,
		reset_momentum: false,
		bullets_per_bounce: 4 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 4,
		current_bullets: 4 + obj_player.max_ammo_buff,
		max_added_bullets: 5,
		max_speed: -vsp_basicjump
	};
	
	water_gun = {
		_name: "Water Gun",  
		tagline: "Shoot a stream of water that is slowly refilled when not being used. Don't ask where the water comes from.",
		sprite: spr_gun_water,   
		ammo: [water_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_bubble,
		spread_number: 1,    
		spread_angle: 0,    
		full_auto: true,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 0.115, 
		reset_momentum: false, 
		bullets_per_bounce: 30 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 30,
		current_bullets: 30 + obj_player.max_ammo_buff,  
		max_added_bullets: 0,
		max_speed: -vsp_basicjump
	};	
	
	grappling_gun = {
		_name: "Grappling Helmet",
		sprite: spr_nothing,
		ammo: [grappling_bullet],
		inaccuracy: 0,
		kick: 2,
		sound: snd_grappling,
		spread_number: 1,
		spread_angle: 0,
		full_auto: false,
		burst_number: 1,
		burst_delay: 0,
		momentum_added: 0,
		reset_momentum: false,
		bullets_per_bounce: 1,
		init_bullets_per_bounce: 1,
		current_bullets: 1,
		max_added_bullets: 0,
		max_speed: -vsp_basicjump
	}
	
	portal_gun = {
		_name: "The Portal",  
		tagline: "Launch an extremely bouncy portal projectile and shoot again to teleport to its exact location. Teleporting or hitting an enemy instantly reloads the weapon.",
		sprite: spr_gun_portal,   
		ammo: [portal_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_grenade,
		spread_number: 1,    
		spread_angle: 0,    
		full_auto: false,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 1.2, 
		reset_momentum: true, 
		bullets_per_bounce: 1,
		init_bullets_per_bounce: 1,
		current_bullets: 1 + obj_player.max_ammo_buff,  
		max_added_bullets: 0,
		max_speed: -vsp_basicjump*0.9
	};	
	
	machine_gun = {
		_name: "Machine Gun",  
		tagline: "Highly inaccurate but with a massive magazine. It takes a bit of time to reach its full firing speed, but c'mon, it's a machine gun!",
		sprite: spr_gun_machine,   
		ammo: [machine_bullet],
		inaccuracy: 20,       
		kick: 2,              
		sound: snd_defaultgun,
		spread_number: 1,    
		spread_angle: 15,    
		full_auto: true,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 0.8, 
		reset_momentum: false, 
		bullets_per_bounce: 40 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 40,
		current_bullets: 40 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: -vsp_basicjump
	};
	
	puncher_gun = {
		_name: "Puncher",  
		tagline: "Fire a large boxing glove that knocks out enemies in its path. It packs a punch! Sorry.",
		sprite: spr_gun_puncher,   
		ammo: [puncher_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_nothing,
		spread_number: 1,    
		spread_angle: 0,    
		full_auto: false,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 1.3, 
		reset_momentum: true, 
		bullets_per_bounce: 2 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 2,
		current_bullets: 2 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: 11
	};
}