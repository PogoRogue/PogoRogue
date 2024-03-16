event_inherited();
follow_player = false;

random_buff_drop = scr_Get_Rand_Buff_Object();

buff = obj_player.buff_nothing;
item_name = "";
item_tagline = "";
item_stats = "";
item_description = item_tagline;
add_sprite_to_list = true;
max_uses = 0; //how many times this buff can be picked up, 0 = infinite
item_stats = "";