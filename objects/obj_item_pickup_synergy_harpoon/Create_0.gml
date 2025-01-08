follow_player = true;
pickup = obj_player.pickup_harpoon;
synergy_partner = obj_player.pickup_harpoon;
synergy_item = obj_player.pickup_harpoon;
item_name = "钩爪锐枪";
cooldown_text = "\n\n" + pickup.cooldown_text;
item_description = pickup.tagline + cooldown_text;
item_cost = 150;
synergy_child1 = obj_player.pickup_hatgun;
synergy_child2 = obj_player.pickup_grappling;

image_index = 2;

if room = room_shop {
	image_index = 3;
	y -= 3;
}