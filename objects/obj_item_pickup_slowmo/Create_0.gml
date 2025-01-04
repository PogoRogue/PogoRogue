follow_player = true;
pickup = obj_player.pickup_slowmo;
synergy_partner = obj_player.pickup_winners;
synergy_item = obj_player.pickup_hacker;
item_name = "Magic Stopwatch";
cooldown_text = "\n\n" + pickup.cooldown_text;
item_description = pickup.tagline + cooldown_text;
item_cost = 110;

image_index = 2;

if room = room_shop {
	image_index = 3;
	y -= 3;
}