follow_player = true;
pickup = obj_player.pickup_jolt;
synergy_partner = obj_player.pickup_jolt;
synergy_item = obj_player.pickup_jolt;
item_name = "电流过载";
cooldown_text = "\n\n" + pickup.cooldown_text;
item_description = pickup.tagline + cooldown_text;
item_cost = 140;
synergy_child1 = obj_player.pickup_reload;
synergy_child2 = obj_player.pickup_emergency;

image_index = 2;

if room = room_shop {
	image_index = 3;
	y -= 3;
}