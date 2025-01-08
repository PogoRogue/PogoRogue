follow_player = true;
pickup = obj_player.pickup_tripleshot;
synergy_partner = obj_player.pickup_volleyball;
synergy_item = obj_player.pickup_wreckingball
item_name = "三重火力";
cooldown_text = "\n\n" + pickup.cooldown_text;
item_description = pickup.tagline + cooldown_text;
item_cost = 85;

image_index = 2;

if room = room_shop {
	image_index = 3;
	y -= 3;
}