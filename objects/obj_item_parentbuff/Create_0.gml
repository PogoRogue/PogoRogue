event_inherited();
follow_player = false;

list_of_possible_buffs = [obj_item_buff_lasersight, obj_item_buff_planetarybullets, obj_item_buff_dmg, 
							obj_item_buff_max_ammo, obj_item_buff_luck, obj_item_buff_pickybuyer, 
							obj_item_buff_rubberbullets, obj_item_buff_hotshells, obj_item_buff_combomaster, 
							obj_item_buff_blackfriday, obj_item_buff_triplethreat, obj_item_buff_flamingcoins, 
							obj_item_buff_combotime, obj_item_buff_sharpshooter, obj_item_buff_coinsup, 
							obj_item_buff_sharptip, obj_item_buff_experimentation, obj_item_buff_aerialassassin,
							obj_item_buff_supershield, obj_item_buff_revive, obj_item_buff_drilltipbullets,
							obj_item_buff_dualwielder];
random_buff_drop = list_of_possible_buffs[irandom_range(0,array_length(list_of_possible_buffs)-1)];

buff = obj_player.buff_nothing;
item_name = "";
item_tagline = "";
item_stats = "";
item_description = item_tagline;
add_sprite_to_list = true;
max_uses = 0; //how many times this buff can be picked up, 0 = infinite
item_stats = "";