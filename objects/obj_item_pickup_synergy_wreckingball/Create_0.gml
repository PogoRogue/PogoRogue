follow_player = true;
pickup = obj_player.pickup_wreckingball;
synergy_partner = obj_player.pickup_wreckingball;
synergy_item = obj_player.pickup_wreckingball;
item_name = "流星锤";
cooldown_text = "\n\n" + pickup.cooldown_text;
item_description = pickup.tagline + cooldown_text;
item_cost = 155;
synergy_child1 = obj_player.pickup_volleyball;
synergy_child2 = obj_player.pickup_tripleshot;

image_index = 2;

if room = room_shop {
	image_index = 3;
	y -= 3;
}