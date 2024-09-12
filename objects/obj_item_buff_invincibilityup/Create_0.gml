follow_player = true;
buff = obj_player.buff_invincibilityup;
item_name = "Invincibility Up";
item_tagline = "Increase the duration of your invincibility by 0.75s after taking damage.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 25;
max_uses = 0;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}