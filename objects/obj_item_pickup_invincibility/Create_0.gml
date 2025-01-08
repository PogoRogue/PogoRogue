follow_player = true;
pickup = obj_player.pickup_invincibility;
synergy_partner = obj_player.pickup_frenzy;
synergy_item = obj_player.pickup_pogomode;
item_name = "无敌时间";
cooldown_text = "\n\n" + pickup.cooldown_text;
item_description = pickup.tagline + cooldown_text;
item_cost = 100;

image_index = 2;

if room = room_shop {
	image_index = 3;
	y -= 3;
}