scr_Save_Load_Variables();

restart_button = 0;
endgame_button = 0;
//alarm[0] = 300; //set fullscreen
window_set_cursor(spr_nothing);
cursor_sprite = spr_nothing;
depth = 1000;
global.draw_collision_walls = false;
global.allow_screenshake = true;
global.last_room = room;
global.player_spawn_x = 0;
global.player_spawn_y = 0;
global.player_spawn_x_prev = 0;
global.player_spawn_y_prev = 0;

if room = room_starting_area {
	global.num_of_coins = 0;
}else if room = room_test {
	global.num_of_coins = 200;
}else if room != room_boss_1 and room != room_boss_2 and room != room_boss_3 {
	global.num_of_coins = 0;
}

global.mute = false;
global.shop_index = 0;
global.num_of_ground_objects = 0;
global.tiles_left_to_draw = 0;

global.salesman_spawn_area = 2; //1 = last combat room, 3 = first
global.pogosmith_spawn_area = 1;


if !instance_exists(obj_controls_controller) {
	instance_create_depth(x,y,depth,obj_controls_controller);
}
if !instance_exists(obj_controls_keyboard) {
	instance_create_depth(x,y,depth,obj_controls_keyboard);
}
if !instance_exists(obj_runstats) {
	instance_create_depth(x,y,depth,obj_runstats);
}

//combo
global.combo = 0;
global.combo_length = 0;
global.combo_max = 32;
global.combo_max_coins = 5;
global.init_combo_highscore = global.best_combo;
global.init_coins_highscore = global.best_coins;
global.init_enemies_highscore = global.best_enemies;

//buffs
global.all_buff_sprites = []; //buffs equipped in side bar
global.all_buff_sprites_index = []; //image index of each buff sprite
global.all_buff_numbers = []; //how many of each buff you have
global.all_buff_names = []; //names of each buff currently equipped
global.all_buff_descriptions = []; //descriptions of each buff currently equipped
global.all_buff_stats = []; //stats (mainly stackability) of each buff currently equipped
global.all_buff_costs = []; //cost of each buff currently equipped

global.water_index = 0;
global.water_frenzy = 0;

//shop
global.shop_num = 1;
global.current_shop_num = 1;
global.refresh_cost = 25;
global.refreshes_used = 0;
global.prev_refresh_cost = 25;

global.all_pickup_costs = [0,0];
global.all_weapon_costs = [0,0,0];

global.damage_buff = 0;
global.luck = 0;
global.picky_buyer = 0;
global.bouncy_bullets = 0;
global.hot_shells = false;
global.combo_master = false;
global.sale = 1;
global.flaming_coins = false;
global.combo_time_added = 0;
global.sharpshooter = false;
global.added_coins = 0;
global.experimentation = 0;
global.experimentation_coins = 25;
global.aerial_assassin = false;
global.super_shield = false;
global.drilltipbullets = false;
global.dualwielder = false;
global.revive = false;
global.revived = false; //once the player has used their revive, set this to true
global.magicianstouch = false;
global.steadyhands = false;
global.tightspring = false;
global.impatience = false;
global.laststand = false;
global.psychicbullets = false;
global.righteousrevenge = false;
global.robbery = false;
global.recycling = 0;
global.juggler = false;
global.iron_proficiency = false;
global.fast_forward = 0;
global.airbag_number = 0;
global.win_odds = 25 + global.luck; //winner's mentality win odds 33
global.triplethreat = false;
global.critchance = 0;
global.crit_percentage = 0;
global.paparazzi = false;
global.bar_time_added = 1;
global.bartime = 25;
global.strong_muscles = false;
global.synergy_frame = 0;

//items unlockable in the shop

scr_All_Passives_Array();

scr_All_Weapons_Array();

scr_All_Actives_Array();

//surface_resize(application_surface,view_wport[0]*2,view_hport[0]*2);

if room = room_gameplay_video {
	//tiling layer
	global.ground_layer = layer_create(-1);
	global.tilemap_ground = layer_tilemap_create(global.ground_layer,-30000,-30000,global.tileset,30000,30000);
}



//stop music
if audio_is_playing(snd_music_menu) 
and room != room_menu and room != room_items 
and room != room_settings and room != room_stats {
	audio_stop_sound(snd_music_menu);
}

//global variables for random things 
global.chest_num = 0;
global.weapon_chest_num = 0;
global.active_chest_num = 0;
global.weapon_chest_num2 = 0;
global.sequence_num = 0;
global.chest_number = 0;
global.coin_chest_num = 0;
global.combat_room_num = 0;
global.shop_number = 0;
global.enemy_number = 0;
global.passive_number = 0;
global.salesman_number = 0;
global.fairy_amount = 0;

if room != room_proc_gen_test and room != room_shop
and room != room_boss_1 and room != room_boss_2 and room != room_boss_3 {
	//If you want to manually set the seed to a number, don't call randomize, and instead set seed = ######
	randomize();
	global.seed = random_get_seed();

	random_set_seed(global.seed);
	show_debug_message("Random seed: " + string(global.seed));
	global.seed_switched = false;
}

global.draw_ui = true;
global.room_width = 768;
global.room_height = 432;