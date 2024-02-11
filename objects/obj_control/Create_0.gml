scr_Save_Load_Variables();

restart_button = 0;
endgame_button = 0;
//alarm[0] = 300; //set fullscreen
window_set_cursor(spr_nothing);
cursor_sprite = spr_nothing;
global.draw_collision_walls = false;
global.allow_screenshake = true;
global.last_room = room;
global.player_spawn_x = 0;
global.player_spawn_y = 0;
global.player_spawn_x_prev = 0;
global.player_spawn_y_prev = 0;
if room = room_gameplay_video {
	global.num_of_coins = 2000;
}else {
	global.num_of_coins = 0;	
}
global.mute = false;
global.shop_index = 0;
global.num_of_ground_objects = 0;
global.tiles_left_to_draw = 0;

if !instance_exists(obj_controls_controller) {
	instance_create_depth(x,y,depth,obj_controls_controller);
}
if !instance_exists(obj_controls_keyboard) {
	instance_create_depth(x,y,depth,obj_controls_keyboard);
}
if !instance_exists(obj_runstats) {
	instance_create_depth(x,y,depth,obj_runstats);
}


//music test
if !audio_is_playing(snd_music) {
	audio_play_sound(snd_music,0,true);
}

//combo
global.combo = 0;
global.combo_length = 0;
global.combo_max = 32;
global.combo_max_coins = 5;
global.init_combo_highscore = global.best_combo;

//buffs
global.all_buff_sprites = []; //buffs equipped in side bar
global.all_buff_sprites_index = []; //image index of each buff sprite
global.all_buff_numbers = []; //how many of each buff you have
global.all_buff_names = []; //names of each buff currently equipped
global.all_buff_descriptions = []; //descriptions of each buff currently equipped
global.all_buff_stats = []; //stats (mainly stackability) of each buff currently equipped

global.damage_buff = 0;
global.luck = 0;
global.picky_buyer = false;
global.bouncy_bullets = 0;
global.hot_shells = false;
global.combo_master = false;
global.sale = 1;
global.flaming_coins = false;
global.combo_time_added = 0;
global.sharpshooter = false;
global.added_coins = 0;
global.experimentation = false;
global.experimentation_coins = 25;
global.aerial_assassin = false;
global.super_shield = false;
global.drilltipbullets = false;
global.dualwielder = false;
global.revive = false;
global.revived = false; //once the player has used their revive, set this to true


//items unlockable in the shop
global.all_buffs = [obj_item_buff_lasersight, obj_item_buff_planetarybullets,obj_item_buff_dmg,
					obj_item_buff_max_ammo, obj_item_buff_luck, obj_item_buff_pickybuyer,
					obj_item_buff_rubberbullets, obj_item_buff_hotshells, obj_item_buff_combomaster,
					obj_item_buff_blackfriday, obj_item_buff_triplethreat, obj_item_buff_flamingcoins,
					obj_item_buff_combotime, obj_item_buff_sharpshooter, obj_item_buff_coinsup,
					obj_item_buff_sharptip, obj_item_buff_experimentation, obj_item_buff_aerialassassin,
					obj_item_buff_supershield, obj_item_buff_revive, obj_item_buff_drilltipbullets, 
					obj_item_buff_dualwielder];
					
global.all_weapons = [obj_item_weapon_default, obj_item_weapon_paintball, obj_item_weapon_shotgun, 
					obj_item_weapon_bubble, obj_item_weapon_burstfire, obj_item_weapon_grenade, 
					obj_item_weapon_laser, obj_item_weapon_bouncyball, obj_item_weapon_missile,
					obj_item_weapon_boomerang, obj_item_weapon_starsucker, obj_item_weapon_sniper,
					obj_item_weapon_slime];
					
global.all_pickups = [obj_item_pickup_chargejump, obj_item_pickup_groundpound, obj_item_pickup_hatgun, 
					obj_item_pickup_shieldbubble, obj_item_pickup_firedash, obj_item_pickup_jetpack,
					obj_item_pickup_slowmo, obj_item_pickup_bulletblast, obj_item_pickup_reload,
					obj_item_pickup_camera, obj_item_pickup_freeze];


surface_resize(application_surface,view_wport[0]*2,view_hport[0]*2);

if room = room_gameplay_video {
	//tiling layer
	global.ground_layer = layer_create(-1);
	global.tilemap_ground = layer_tilemap_create(global.ground_layer,0,0,tl_ground,20000,20000);	
}