// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Get_Player_Sprites(){
	if current_iframes > 0 and bubble = false || dead {
		if hp >= 8 * 4 { //4 or more hearts left
			player_sprite = spr_player_zekai_hurt1;
			falling_sprite = spr_player_zekai_falling_hurt1;
			charging_sprite = spr_player_zekai_charging_hurt1;	
		}else if hp >= 8 * 3 { //3 hearts left
			player_sprite = spr_player_zekai_hurt2;
			falling_sprite = spr_player_zekai_falling_hurt2;
			charging_sprite = spr_player_zekai_charging_hurt2;	
		}else if hp >= 8 * 2 { //2 hearts left
			player_sprite = spr_player_zekai_hurt3;
			falling_sprite = spr_player_zekai_falling_hurt3;
			charging_sprite = spr_player_zekai_charging_hurt3;	
		}else { //1 or fewer hearts left
			player_sprite = spr_player_zekai_hurt4;
			falling_sprite = spr_player_zekai_falling_hurt4;
			charging_sprite = spr_player_zekai_charging_hurt4;	
		}
	}else {
		player_sprite = spr_player_zekai;
		falling_sprite = spr_player_zekai_falling;
		charging_sprite = spr_player_zekai_charging;
	}
	
	if current_iframes <= 0 {
		bubble = false;	
	}
}