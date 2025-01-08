follow_player = true;
pickup = obj_player.pickup_megabounce;
synergy_partner = obj_player.pickup_megabounce;
synergy_item = obj_player.pickup_megabounce;
item_name = "震天撼地";
cooldown_text = "\n\n" + pickup.cooldown_text;
item_description = pickup.tagline + cooldown_text;
item_cost = 120;
synergy_child1 = obj_player.pickup_groundpound;
synergy_child2 = obj_player.pickup_chargejump;

image_index = 2;

if room = room_shop {
	image_index = 3;
	y -= 3;
}