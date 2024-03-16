/// @description add to enemy total
// Room kill counter
combat_tag = asset_get_tags(id, asset_object)
if (array_length_1d(combat_tag) > 0) {
	if (combat_tag[0] == "CombatRoom1" || combat_tag[0] == "CombatRoom2") {
		show_debug_message("enemy killed! +1");
		obj_player.enemies_killed_in_room += 1;
	}
}
else {
	show_debug_message("no combat tag");
}

global.current_enemies_killed += 1;
global.enemies_killed += 1;
scr_Save_Real("enemies_killed",global.enemies_killed);