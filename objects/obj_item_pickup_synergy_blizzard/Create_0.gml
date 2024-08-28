follow_player = true;
pickup = obj_player.pickup_blizzard;
synergy_partner = obj_player.pickup_blizzard;
synergy_item = obj_player.pickup_blizzard;
item_name = "Blizzard";
cooldown_text = "\n\n" + pickup.cooldown_text;
item_description = pickup.tagline + cooldown_text;
item_cost = 155;
synergy_child1 = obj_player.pickup_freeze;
synergy_child2 = obj_player.pickup_bulletblast;

image_index = 3;