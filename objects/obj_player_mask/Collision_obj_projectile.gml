/// @description Get damaged
if(other.boss_projectile==true){                                                                                                                                                                                    
    if(parent_index.current_iframes <= 0) {
	    scr_Player_Damaged(other.damage);
	    instance_destroy(other);
    }
}
