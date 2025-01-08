follow_player = true;
pickup = obj_player.pickup_emergency;
synergy_partner = obj_player.pickup_reload;
synergy_item = obj_player.pickup_jolt;
item_name = "紧急抢救";
cooldown_text = "\n\n" + pickup.cooldown_text;
item_description = pickup.tagline + cooldown_text;
item_cost = 90;

image_index = 2;

if room = room_shop {
	image_index = 3;
	y -= 3;
}