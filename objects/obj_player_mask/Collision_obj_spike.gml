if parent_index.state != parent_index.state_portal and parent_index.state != parent_index.state_shop_portal {
	temp_damage = other.damage;
	with parent_index {
		if (current_iframes <= 0) {
			var temp_hspeed = hspeed;
			var temp_vspeed = vspeed;
			scr_Player_Damaged(other.temp_damage);
			hspeed = temp_hspeed;
			vspeed = temp_vspeed;
		}
	}
}