follow_player = true;
pickup = obj_player.pickup_dragster;
synergy_partner = obj_player.pickup_dragster;
synergy_item = obj_player.pickup_dragster;
item_name = "Dragster";
cooldown_text = "\n\n" + pickup.cooldown_text;
item_description = pickup.tagline + cooldown_text;
item_cost = 115;
synergy_child1 = obj_player.pickup_parachute;
synergy_child2 = obj_player.pickup_firedash;

image_index = 3;