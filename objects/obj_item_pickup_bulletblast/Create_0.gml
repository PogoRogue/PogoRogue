follow_player = true;
pickup = obj_player.pickup_bulletblast;
synergy_partner = obj_player.pickup_freeze;
synergy_item = obj_player.pickup_blizzard;
item_name = "子弹风暴";
cooldown_text = "\n\n" + pickup.cooldown_text;
item_description = pickup.tagline + cooldown_text;
item_cost = 115;

image_index = 2;

if room = room_shop {
	image_index = 3;
	y -= 3;
}