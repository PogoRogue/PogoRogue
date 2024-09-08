follow_player = true;
pickup = obj_player.pickup_hacker;
synergy_partner = obj_player.pickup_hacker;
synergy_item = obj_player.pickup_hacker;
item_name = "Hacker";
cooldown_text = "\n\n" + pickup.cooldown_text;
item_description = pickup.tagline + cooldown_text;
item_cost = 185;
synergy_child1 = obj_player.pickup_winners;
synergy_child2 = obj_player.pickup_slowmo;

image_index = 2;