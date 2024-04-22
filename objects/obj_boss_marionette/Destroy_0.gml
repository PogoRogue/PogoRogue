/// @description Create coins

// Inherit the parent event
event_inherited();

instance_destroy(obj_boss_gate_close);
instance_destroy(obj_boss_marionette_health);

// Switch to win screen
if obj_player.dead = false {
	if !instance_exists(obj_deathscreen) {
		with instance_create_depth(x,y,depth-1000,obj_deathscreen) {
			win = true;	
			global.num_of_wins += 1;
			scr_Save_Real("num_of_wins",global.num_of_wins);
		}
		with obj_player {
			state = state_immobile;	
			mask_index = spr_nothing;
		}
		with obj_player_mask {
			mask_index = spr_nothing;
		}
	}
}
