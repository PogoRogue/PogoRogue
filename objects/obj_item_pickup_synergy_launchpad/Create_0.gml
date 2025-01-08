follow_player = true;
pickup = obj_player.pickup_launchpad;
synergy_partner = obj_player.pickup_launchpad;
synergy_item = obj_player.pickup_launchpad;
item_name = "导弹平台";
cooldown_text = "\n\n" + pickup.cooldown_text;
item_description = pickup.tagline + cooldown_text;
item_cost = 115;
synergy_child1 = obj_player.pickup_airbag;
synergy_child2 = obj_player.pickup_target;

image_index = 2;

if room = room_shop {
	image_index = 3;
	y -= 3;
}