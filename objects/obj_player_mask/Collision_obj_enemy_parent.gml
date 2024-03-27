/// @description Get damaged

if(!other.is_dead && parent_index.current_iframes <= 0) {
	scr_Player_Damaged(other.damage);
	show_debug_message(object_get_name(other.object_index));
}