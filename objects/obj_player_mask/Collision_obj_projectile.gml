/// @description Get damaged
if(other.boss_projectile==true) and parent_index.state != parent_index.state_revive {                                                                                                                                                                                    
    if(parent_index.current_iframes <= 0) {
	    scr_Player_Damaged(other.damage);
	    instance_destroy(other);
    }
}
