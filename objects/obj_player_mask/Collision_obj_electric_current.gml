/// @description Get damaged

if parent_index.state != parent_index.state_portal and parent_index.state != parent_index.state_shop_portal
and parent_index.state != parent_index.state_revive {
	if(other.power_on && parent_index.current_iframes <= 0) {
		scr_Player_Damaged(other.damage);
	}
}