/// @description Get damaged

if parent_index.state != parent_index.state_portal and parent_index.state != parent_index.state_shop_portal {
	if(!other.is_dead && parent_index.current_iframes <= 0 && other.damage > 0) {
		scr_Player_Damaged(other.damage);
		show_debug_message(object_get_name(other.object_index));
	}
}