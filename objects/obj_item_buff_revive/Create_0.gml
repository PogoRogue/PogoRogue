image_speed = 0;
follow_player = true;
buff = obj_player.buff_revive;
item_name = "Revive";
item_tagline = "Come back to life at limited health after death. Can only be used once.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 50;
max_uses = 1;
item_stats = "";

if room = room_tutorial {
	item_name = "Revive (Tutorial)";
	item_tagline = "Come back to life at limited health after death.";
}

scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}