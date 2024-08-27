alpha = 3;
depth = -1000;
image_speed = 0;
image_index = 0;
fade_out = false;

draw = true;

move_off_screen = false;
retreat_speed = 0;
y_subtract = 400;
spd_multiply = 1;
move_spd = 4;
move_spd2 = 0;
spd_multiply = 1;
yy = 0;
player_x = 0;
player_y = 0;

propeller_frame = 0;
handle_frame = 0;
handle_done = false; //animate once
pull_handle = false;
spin = false;
spin_time = 12; //7
num_of_spins = 30;
jackpot_index = 1;
jackpot = false;
tryagain_index = 1;
tryagain = false;

randomize();
win = false;
win_number = irandom_range(1,100);
if win_number <= global.win_odds {
	win = true;
}
twoinarow = false;
twoinarow_number = irandom_range(1,100);
twoinarow_odds = 40;
if twoinarow_number <= twoinarow_odds {
	twoinarow = true;
}

//item arrays
item1_array = [0,1,2,3,4];
item2_array = [0,1,2,3,4];
item3_array = [0,1,2,3,4];
item1_array = array_shuffle(item1_array); //random order for each array
item2_array = array_shuffle(item2_array);
item3_array = array_shuffle(item3_array);
//number in array
item1_index = irandom_range(0,sprite_get_number(spr_slotmachine_slot_items)-1);
item2_index = irandom_range(0,sprite_get_number(spr_slotmachine_slot_items)-1);
item3_index = irandom_range(0,sprite_get_number(spr_slotmachine_slot_items)-1);
//actual item frame
item1 = 0;
item2 = 0;
item3 = 0;
//for animation purposes only
item1_next = item1_array[1];
item2_next = item2_array[1];
item3_next = item3_array[1];

item1_locked = false;
item2_locked = false;
item3_locked = false;
//y offset for spinning items
item1_y = 0;
item2_y = 0;
item3_y = 0;
item_spacing = 14;
random_set_seed(global.seed);

heart_chance = 0;
buff_chance = 0;
weapon_chance = 0;
pickup_chance = 0;
random_weapon = true;
random_pickup = true;
created_items = false;
//create_coins = false;
num_of_coins = irandom_range(25,25); //created in variable definitions tab

random_items = scr_Random_Item_Drops();

blink_max = 6.9;
coin_spawner = noone;
current_slot_hacking = 1;
button_num = 0;

jackpot_sound = audio_play_sound(snd_nothing,0,false);
propeller_sound = audio_play_sound(snd_slotmachine_propeller,0,true);
audio_sound_gain(propeller_sound, 0, 0);
audio_sound_gain(propeller_sound, 1, 750);