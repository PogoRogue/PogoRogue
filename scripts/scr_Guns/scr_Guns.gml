// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Guns(){
	default_gun = { //Pistol
		_name: "手枪",  //name of gun
		tagline: "如此狂野的武器", //short description of weapon
		sprite: spr_gun_default,   //gun sprite
		ammo: [default_bullet],//array of ammo
		inaccuracy: 0,        //random bullet angle inaccuracy
		kick: 2,              //kickback to position and angle
		sound: snd_defaultgun,    //sound effect
		spread_number: 1,     //number of bullets per shot
		spread_angle: 20,      //angle between bullets in spread shot
		full_auto: false,     //hold down mouse to shoot vs click for each shot
		burst_number: 1,      //number of bullets in burst
		burst_delay: 0,       //delay between bursts
		momentum_added: 1,    //0.9, percentage of vsp_basicjump to apply for each bullet, 1 = 100%
		reset_momentum: true, //reset player speed to 0 for each bullet (false), or just add to current speed (false)
		bullets_per_bounce: 4 + obj_player.max_ammo_buff,//Number of bullets per clip
		init_bullets_per_bounce: 4, //Initial number of bullets per clip (no ammo buff)
		current_bullets: 4 + obj_player.max_ammo_buff,   //current number of bullets left
		max_added_bullets: 5, //max number of bullets that can be added from the ammo powerup
		max_speed: -vsp_basicjump, //player cant move faster than this if full_auto = true
		level: 1
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
		max_speed: -vsp_basicjump,
		level: 1
	};
	
	hat_gun = {
		_name: "Hat Gun",
		sprite: spr_nothing,
		ammo: [hatgun_bullet],
		inaccuracy: 0,
		kick: 2,
		sound: snd_hatgun,
		spread_number: 1,
		spread_angle: 20,
		full_auto: false,
		burst_number: 1,
		burst_delay: 0,
		momentum_added: 0,
		reset_momentum: false,
		bullets_per_bounce: 1,
		init_bullets_per_bounce: 1,
		current_bullets: 1,
		max_added_bullets: 0,
		max_speed: -vsp_basicjump,
		level: 1
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
		max_speed: -vsp_basicjump,
		level: 1
	};

	paintball_gun = {
		_name: "彩弹枪",  
		tagline: "战斗可是门艺术",
		sprite: spr_gun_paintball,   
		ammo: [paintball_bullet],     
		inaccuracy: 5,     
		kick: 2,           
		sound: snd_paintball1, 
		spread_number: 1,     
		spread_angle: 25, 
		full_auto: true,    
		burst_number: 1,      
		burst_delay: 0,       
		momentum_added: 0.4,  
		reset_momentum: false, 
		bullets_per_bounce: 10 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 10,
		current_bullets: 10 + obj_player.max_ammo_buff,   
		max_added_bullets: 5,
		max_speed: -vsp_basicjump,
		level: 1
	};

	shotgun_gun = {
		_name: "霰弹枪",  
		tagline: "足以胜任",
		sprite: spr_gun_shotgun,  
		ammo: [shotgun_bullet],
		inaccuracy: 5,       
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
		max_speed: -vsp_basicjump,
		level: 1
	};

	bubble_gun = {
		_name: "泡泡枪",  
		tagline: "啵",
		sprite: spr_gun_bubble,   
		ammo: [bubble_bullet],
		inaccuracy: 35,       
		kick: 2,              
		sound: snd_bubble,
		spread_number: 1,    
		spread_angle: 45,   
		full_auto: true,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 0.2, 
		reset_momentum: false, 
		bullets_per_bounce: 24 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 24,
		current_bullets: 24 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: 8,
		level: 1
	};

	burstfire_gun = {
		_name: "脉冲步枪",  
		tagline: "它充满了爆发的能量！",
		sprite: spr_gun_burstfire,   
		ammo: [burstfire_bullet],
		inaccuracy: 10,       
		kick: 2,              
		sound: snd_burstfire,
		spread_number: 1,    
		spread_angle: 30,    
		full_auto: true,     
		burst_number: 3,     
		burst_delay: 6,     
		momentum_added: 1, 
		reset_momentum: false, 
		bullets_per_bounce: 9 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 9,
		current_bullets: 9 + obj_player.max_ammo_buff,  
		max_added_bullets: 15,
		max_speed: -vsp_basicjump,
		level: 1
	};	
	
	grenade_gun = {
		_name: "手雷发射器",  
		tagline: "全都可以炸完~",
		sprite: spr_gun_grenade,   
		ammo: [grenade_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_grenade,
		spread_number: 1,    
		spread_angle: 45,    
		full_auto: false,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 0.9, 
		reset_momentum: true, 
		bullets_per_bounce: 3 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 3,
		current_bullets: 3 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: -vsp_basicjump*0.9,
		level: 1
	};	
	
	laser_gun = {
		_name: "量子冲天炮",  
		tagline: "势不可挡！",
		sprite: spr_gun_laser,   
		ammo: [laser_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_laser,
		spread_number: 1,    
		spread_angle: 30,    
		full_auto: false,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 0.075, 
		reset_momentum: false, 
		bullets_per_bounce: 100 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 100,
		current_bullets: 100 + obj_player.max_ammo_buff,  
		max_added_bullets: 0,
		max_speed: 5.25,
		level: 1
	};	
	
	bouncyball_gun = {
		_name: "弹球枪",  
		tagline: "橡胶弹？",
		sprite: spr_gun_bouncyball,   
		ammo: [bouncyball_bullet],
		inaccuracy: 15,       
		kick: 2,              
		sound: snd_bbb1,
		spread_number: 1,    
		spread_angle: 45,
		full_auto: true,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 1, 
		reset_momentum: false, 
		bullets_per_bounce: 5 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 5,
		current_bullets: 5 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: 7.25,
		level: 1
	};	
	
	missile_gun = {
		_name: "导弹发射器",  
		tagline: "让敌人飞起来！",
		sprite: spr_gun_missile,   
		ammo: [missile_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_grenade,
		spread_number: 1,    
		spread_angle: 45,    
		full_auto: false,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 1.4, 
		reset_momentum: true, 
		bullets_per_bounce: 1 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 1,
		current_bullets: 1 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: 8,
		level: 1
	};
	
	boomerang_gun = {
		_name: "回旋镖",  
		tagline: "出来混迟早要还，你知道的",
		sprite: spr_gun_boomerang,   
		ammo: [boomerang_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_nothing,
		spread_number: 1,    
		spread_angle: 30,    
		full_auto: false,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 1.2, 
		reset_momentum: true, 
		bullets_per_bounce: 2 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 2,
		current_bullets: 2 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: 8,
		level: 1
	};
	
	starsucker_gun = {
		_name: "吸星者",  
		tagline: "暴风吸入！",
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
		max_speed: -vsp_basicjump,
		level: 1
	};
	
	sniper_gun = {
		_name: "狙击枪", 
		tagline: "该去露营了",
		sprite: spr_gun_sniper,
		ammo: [sniper_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_sniper,
		spread_number: 1,    
		spread_angle: 30,    
		full_auto: false,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 1.25, 
		reset_momentum: true, 
		bullets_per_bounce: 3 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 3,
		current_bullets: 3 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: 9,
		level: 1
	};	
	
	slime_gun = {
		_name: "史莱姆发射器",  
		tagline: "糊你一脸！",
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
		max_speed: -vsp_basicjump,
		level: 1
	};
	
	yoyo_gun = {
		_name: "悠悠球",  
		tagline: "恒久的运动, 充满智慧意义",
		sprite: spr_gun_yoyo,   
		ammo: [yoyo_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_nothing,
		spread_number: 1,    
		spread_angle: 35,    
		full_auto: false,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 1, 
		reset_momentum: true, 
		bullets_per_bounce: 1,
		init_bullets_per_bounce: 1,
		current_bullets: 1,  
		max_added_bullets: 0,
		max_speed: 16,
		level: 1
	};
	
	javelin_gun = {
		_name: "标枪",
		tagline: "做一个标记……和一个洞",
		sprite: spr_gun_javelins,
		ammo: [javelin_bullet],
		inaccuracy: 0,
		kick: 2,
		sound: snd_nothing,
		spread_number: 1,
		spread_angle: 25,
		full_auto: false,
		burst_number: 1,
		burst_delay: 0,
		momentum_added: 0,
		reset_momentum: false,
		bullets_per_bounce: 4 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 4,
		current_bullets: 4 + obj_player.max_ammo_buff,
		max_added_bullets: 5,
		max_speed: -vsp_basicjump,
		level: 1
	};
	
	water_gun = {
		_name: "小黄鸭水枪",  
		tagline: "被水淹没, 不知所措",
		sprite: spr_gun_water,   
		ammo: [water_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_nothing,
		spread_number: 1,    
		spread_angle: 45,    
		full_auto: true,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 0.115, 
		reset_momentum: false, 
		bullets_per_bounce: 30 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 30,
		current_bullets: 30 + obj_player.max_ammo_buff,  
		max_added_bullets: 0,
		max_speed: -vsp_basicjump,
		level: 1
	};	
	
	grappling_gun = {
		_name: "Grappling Helmet",
		sprite: spr_nothing,
		ammo: [grappling_bullet],
		inaccuracy: 0,
		kick: 2,
		sound: snd_grappling_shoot,
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
		max_speed: -vsp_basicjump,
		level: 1
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
		max_speed: -vsp_basicjump*0.9,
		level: 1
	};	
	
	machine_gun = {
		_name: "机关枪",  
		tagline: "信仰射击",
		sprite: spr_gun_machine,   
		ammo: [machine_bullet],
		inaccuracy: 20,       
		kick: 2,              
		sound: snd_machinegun,
		spread_number: 1,    
		spread_angle: 35,    
		full_auto: true,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 0.8, 
		reset_momentum: false, 
		bullets_per_bounce: 40 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 40,
		current_bullets: 40 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: -vsp_basicjump,
		level: 1
	};
	
	puncher_gun = {
		_name: "拳头枪",  
		tagline: "给你一拳",
		sprite: spr_gun_puncher,   
		ammo: [puncher_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_nothing,
		spread_number: 1,    
		spread_angle: 35,    
		full_auto: false,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 1.3, 
		reset_momentum: true, 
		bullets_per_bounce: 2 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 2,
		current_bullets: 2 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: 11,
		level: 1
	};
	
	sixshooter_gun = {
		_name: "维和者",
		tagline: "刻有浪客的标记",
		sprite: spr_gun_sixshooter,
		ammo: [sixshooter_bullet],
		inaccuracy: 10,
		kick: 2,
		sound: snd_nothing,
		spread_number: 1,
		spread_angle: 25,
		full_auto: true,
		burst_number: 1,
		burst_delay: 0,
		momentum_added: 2,
		reset_momentum: false,
		bullets_per_bounce: 6 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 6,
		current_bullets: 6 + obj_player.max_ammo_buff,
		max_added_bullets: 5,
		max_speed: -vsp_basicjump,
		level: 1
	};
	
	plasma_gun = {
		_name: "等离子炮",
		tagline: "物质的第四形态",
		sprite: spr_gun_plasma,
		ammo: [plasma_bullet],
		inaccuracy: 0,
		kick: 2,
		sound: snd_nothing,
		spread_number: 1,
		spread_angle: 35,
		full_auto: false,
		burst_number: 1,
		burst_delay: 0,
		momentum_added: 0,
		reset_momentum: false,
		bullets_per_bounce: 140 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 140,
		current_bullets: 140 + obj_player.max_ammo_buff,
		max_added_bullets: 5,
		max_speed: 7.5,
		level: 1
	};
	
	harpoon_gun = {
		_name: "Harpoon Helmet",
		sprite: spr_nothing,
		ammo: [harpoon_bullet],
		inaccuracy: 0,
		kick: 2,
		sound: snd_grappling_shoot,
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
		max_speed: -vsp_basicjump,
		level: 1
	}
	
	wreckingball_gun = {
		_name: "Wrecking Ball",  
		tagline: "",
		sprite: spr_nothing,   
		ammo: [wreckingball_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_nothing,
		spread_number: 1,    
		spread_angle: 45,    
		full_auto: false,   
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 1, 
		reset_momentum: true, 
		bullets_per_bounce: 1,
		init_bullets_per_bounce: 1,
		current_bullets: 1,  
		max_added_bullets: 0,
		max_speed: 16,
		level: 1
	};
	
	snow_gun = {
		_name: "雪球加农炮",  
		tagline: "来打雪仗吧！",
		sprite: spr_gun_snow,   
		ammo: [snow_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_nothing,
		spread_number: 1,    
		spread_angle: 45,    
		full_auto: false,     
		burst_number: 1,     
		burst_delay: 5,     
		momentum_added: 1.15, 
		reset_momentum: true, 
		bullets_per_bounce: 4 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 4,
		current_bullets: 4 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: -vsp_basicjump*1.15,
		level: 1
	};	
	
	balloon_gun = {
		_name: "气球枪",
		tagline: "敌人'啵'的一声就无啦",
		sprite: spr_gun_balloon,
		ammo: [balloon_bullet],
		inaccuracy: 0,
		kick: 2,
		sound: snd_balloon_inflate,
		spread_number: 1,
		spread_angle: 35,
		full_auto: false,
		burst_number: 1,
		burst_delay: 0,
		momentum_added: 0,
		reset_momentum: false,
		bullets_per_bounce: 60,
		init_bullets_per_bounce: 60,
		current_bullets: 60,
		max_added_bullets: 0,
		max_speed: 7.5,
		level: 1
	};
	
	frisbee_gun = {
		_name: "磁力飞轮",  
		tagline: "以气御轮！",
		sprite: spr_gun_frisbees,   
		ammo: [frisbee_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_disk_throw,
		spread_number: 1,    
		spread_angle: 60,    
		full_auto: false,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 1.1, 
		reset_momentum: true, 
		bullets_per_bounce: 2 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 2,
		current_bullets: 2 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: 8,
		level: 1
	};
	
	dart_gun = {
		_name: "追踪飞镖",  
		tagline: "这玩意带自瞄的",
		sprite: spr_gun_darts,   
		ammo: [dart_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_dart_throw,
		spread_number: 1,    
		spread_angle: 90,    
		full_auto: false,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 1, 
		reset_momentum: true, 
		bullets_per_bounce: 3 + obj_player.max_ammo_buff,
		init_bullets_per_bounce: 3,
		current_bullets: 3 + obj_player.max_ammo_buff,  
		max_added_bullets: 5,
		max_speed: 5,
		level: 1
	};
}