/// @description Add coins for recycling item
with obj_coincounter {
	coin_alpha = 4;
	current_coins += round(other.new_item_cost/4);
}