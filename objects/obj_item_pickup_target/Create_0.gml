follow_player = true;
pickup = obj_player.pickup_target;
synergy_partner = obj_player.pickup_airbag;
synergy_item = obj_player.pickup_launchpad;
item_name = "Targeted Assassination";
cooldown_text = "\n\n" + pickup.cooldown_text;
item_description = pickup.tagline + cooldown_text;
item_cost = 65;

image_index = 2;