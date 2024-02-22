usable = true;
select = 1; //1 = passives, 2 = actives, 3 = weapons
select_max = 3; //max # of rows
select_x = 1; //passives only
select_x_max = 4; //number of columns
select_y = 0;
select_y_max = 4; //number of rows
select_y_added = 0; //bindings menu scrolling
passive_rows = 8;

selected_x = false;
selected_y = false;

x_gap = 56;
y_gap = 56;

select_sprite = spr_item_slot_shop;

alarm2_time = 30;
alarm3_time = 30;

with obj_pause {
	if pause = false {
		paused_outside = true;	
	}
}

passives_array = [spr_buffitem_lasersight, spr_buffitem_planetarybullets,spr_buffitem_damage,
				spr_buffitem_ammo, spr_buffitem_luck, spr_buffitem_pickybuyer,
				spr_buffitem_bouncybullets, spr_buffitem_hotshells, spr_buffitem_combomaster,
				spr_buffitem_blackfriday, spr_buffitem_triplethreat,spr_buffitem_flamingcoins,
				spr_buffitem_combotime, spr_buffitem_sharpshooter, spr_buffitem_coinsup,
				spr_buffitem_sharptip, spr_buffitem_experimentation, spr_buffitem_aerialassassin,
				spr_buffitem_supershield, spr_buffitem_revive, spr_buffitem_drilltipbullets, 
				spr_buffitem_dualwielder, spr_buffitem_steadyhands, spr_buffitem_tightspring,
				spr_buffitem_magicianstouch,spr_nothing,spr_nothing,
				spr_nothing,spr_nothing,spr_nothing,
				spr_nothing,spr_nothing];
				
actives_array = [spr_pickup_chargejump, spr_pickup_groundpound, spr_pickup_hatgun, 
				spr_pickup_shieldbubble, spr_pickup_firedash, spr_pickup_jetpack,
				spr_pickup_slowmo, spr_pickup_bulletblast, spr_pickup_reload,
				spr_pickup_camera, spr_pickup_freeze, spr_pickup_frenzy,
				spr_pickup_target,spr_nothing,spr_nothing,
				spr_nothing];
				
weapons_array = [spr_gun_default, spr_gun_paintball, spr_gun_shotgun, 
				spr_gun_bubble, spr_gun_burstfire, spr_gun_grenade, 
				spr_gun_laser, spr_gun_bouncyball, spr_gun_missile,
				spr_gun_boomerang, spr_gun_starsucker, spr_gun_sniper,
				spr_gun_slime,spr_nothing,spr_nothing,
				spr_nothing];
				
current_array = passives_array;


scr_All_Passives_Array();
scr_All_Actives_Array();
scr_All_Weapons_Array();

instance_create_depth(x,y,depth,obj_control);
audio_stop_sound(snd_music);
instance_create_depth(x,y,depth,obj_player);

//get passive info
//buffs
all_buff_sprites = []; //buffs equipped in side bar
all_buff_sprites_index = []; //image index of each buff sprite
all_buff_names = []; //names of each buff currently equipped
all_buff_descriptions = []; //descriptions of each buff currently equipped
all_buff_stats = []; //stats (mainly stackability) of each buff currently equipped

all_weapons = [];
all_pickups = [];

for (i = 0; i < array_length(global.all_buffs); i++) {
	with instance_create_depth(x,y,depth,global.all_buffs[i]) {
		other.all_buff_sprites[other.i] = sprite_index; //buffs equipped in side bar
		other.all_buff_sprites_index[other.i] = image_index+1; //image index of each buff sprite
		other.all_buff_names[other.i] = item_name; //names of each buff currently equipped
		other.all_buff_descriptions[other.i] = item_tagline; //descriptions of each buff currently equipped
		other.all_buff_stats[other.i] = item_stats; //stats (mainly stackability) of each buff currently equipped
		instance_destroy();
	}
}

for (i = 0; i < array_length(global.all_pickups); i++) {
	with instance_create_depth(x,y,depth,global.all_pickups[i]) {
		other.all_pickups[other.i] = pickup;
		instance_destroy();
	}
}

for (i = 0; i < array_length(global.all_weapons); i++) {
	with instance_create_depth(x,y,depth,global.all_weapons[i]) {
		other.all_weapons[other.i] = weapon;
		instance_destroy();
	}
}

instance_destroy(obj_control);
instance_destroy(obj_player_mask);
instance_destroy(obj_player);