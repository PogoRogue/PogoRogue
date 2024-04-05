follow_player = true;
buff = obj_player.buff_hotshells;
item_name = "Hot Shells";
item_tagline = "Bullet casings have a 5% chance of exploding, 25% chance on enemy contact.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 20;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}