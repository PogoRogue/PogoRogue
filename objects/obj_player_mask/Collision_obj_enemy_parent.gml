/// @description Get damaged

if(!other.is_dead && parent_index.current_iframes <= 0 && other.damage > 0) {
	scr_Player_Damaged(other.damage);
}