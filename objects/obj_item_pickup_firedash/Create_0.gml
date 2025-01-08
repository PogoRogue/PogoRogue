follow_player = true;
pickup = obj_player.pickup_firedash;
synergy_partner = obj_player.pickup_parachute;
synergy_item = obj_player.pickup_dragster;
item_name = "火焰冲撞";
cooldown_text = "\n\n" + pickup.cooldown_text;
item_description = pickup.tagline + cooldown_text;
item_cost = 80;

image_index = 2;

if room = room_shop {
	image_index = 3;
	y -= 3;
}