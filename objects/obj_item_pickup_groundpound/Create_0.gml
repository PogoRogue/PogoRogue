follow_player = true;
pickup = obj_player.pickup_groundpound;
synergy_partner = obj_player.pickup_chargejump;
synergy_item = obj_player.pickup_megabounce;
item_name = "Ground Pound";
cooldown_text = "\n\n" + pickup.cooldown_text;
item_description = pickup.tagline + cooldown_text;
item_cost = 60;

image_index = 2;