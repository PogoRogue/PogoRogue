follow_player = true;
pickup = obj_player.pickup_freeze;
synergy_partner = obj_player.pickup_bulletblast;
synergy_item = obj_player.pickup_blizzard;
item_name = "Freeze";
cooldown_text = "\n\n" + pickup.cooldown_text;
item_description = pickup.tagline + cooldown_text;
item_cost = 40;

image_index = 2;

if room = room_shop {
	image_index = 3;
	y -= 3;
}