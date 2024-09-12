/// @description Instantiate varaibles

// Stats
hp = 8; 
hp_max = hp;
hp_percent = (hp / hp_max) * 100;
draw_hp = true;
damage = 8;
spd = 0;
despawn_timer = room_speed;

stomp_defense = 1; // This is a scalar that gets applied to stomp damage
bullet_defense = 1; // This is a scalar that gets applied to bullet damage
explosion_defense = 1; // This is a scalar that gets applied to bullet damage

// State
is_dead = false;
num_iframes = room_speed / 2;
current_iframes = 0;
red_frames = 0;

//drop chances
if room != room_boss_1 and room != room_boss_2 and room != room_boss_3 and room != room_tutorial {
	heart_chance = 5 + (global.luck/2); //percent
	buff_chance = 2 + (global.luck/2); //percent
	pickup_chance = (global.luck/2); //percent
	weapon_chance = (global.luck/2); //percent
}else {
	heart_chance = 0;
	buff_chance = 0;
	pickup_chance = 0;
	weapon_chance = 0;
}

created_items = false;
created_items2 = false;

drop_coins = true;

num_of_coins = global.combo;
enemy_coin_bonus = 0;
//when invinsible, can't take damage
invinsible=false;

random_set_seed(global.seed+global.enemy_number);
random_items = scr_Random_Item_Drops();
global.enemy_number += 1;
random_set_seed(global.seed);

shaded = false;
locked_onto = false;

megabounce_freeze = false; //dont despawn right away if killed by megabounce
freeze_x = x;
freeze_y = y;
freeze_frame = 0;

center_x_sprite = bbox_left + ((bbox_right - bbox_left)/2);
center_y_sprite = bbox_top + ((bbox_top - bbox_top)/2);

bounced_times = 0;