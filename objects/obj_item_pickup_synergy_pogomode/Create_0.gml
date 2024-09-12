follow_player = true;
pickup = obj_player.pickup_pogomode;
synergy_partner = obj_player.pickup_pogomode;
synergy_item = obj_player.pickup_pogomode;
item_name = "Pogo Mode";
cooldown_text = "\n\n" + pickup.cooldown_text;
item_description = pickup.tagline + cooldown_text;
item_cost = 190;
synergy_child1 = obj_player.pickup_frenzy;
synergy_child2 = obj_player.pickup_invincibility;

image_index = 2;