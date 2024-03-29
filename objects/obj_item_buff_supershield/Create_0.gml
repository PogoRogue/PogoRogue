image_speed = 0;
follow_player = true;
buff = obj_player.buff_supershield;
item_name = "Super Shield";
item_tagline = "Armored hearts prevent the combo meter from going down when damaged.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 20;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}