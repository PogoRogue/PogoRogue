alpha = 3;
depth = -1000;
image_speed = 1;
image_index = 0;
fade_out = false;

draw = true;

move_off_screen = false;
y_subtract = 80;
move_spd = 4;
move_spd2 = 0;
spd_multiply = 1;

handle_frame = 0;
handle_done = false; //animate once
pull_handle = false;
spin = false;
spin_time = 7;
num_of_spins = 22;
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
item1_index = irandom_range(0,sprite_get_number(spr_slotmachine_slot_items)-1);
item2_index = irandom_range(0,sprite_get_number(spr_slotmachine_slot_items)-1);
item3_index = irandom_range(0,sprite_get_number(spr_slotmachine_slot_items)-1);
random_set_seed(global.seed);