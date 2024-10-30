// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Move_To_Pipe(mole_to_move,pipe_num) {
	with obj_pipe {
		if pipe_number = pipe_num {
			mole_to_move.x = x;
			mole_to_move.y = y;
			switch (pipe_number) {
				case 1: mole_to_move.poke_direction = "up"; break;
				case 2: mole_to_move.poke_direction = "up"; break;
				case 3: mole_to_move.poke_direction = "up"; break;
				case 4: mole_to_move.poke_direction = "right"; break;
				case 5: mole_to_move.poke_direction = "right"; break;
				case 6: mole_to_move.poke_direction = "down"; break;
				case 7: mole_to_move.poke_direction = "down"; break;
				case 8: mole_to_move.poke_direction = "down"; break;
				case 9: mole_to_move.poke_direction = "left"; break;
				case 10: mole_to_move.poke_direction = "left"; break;
			}
		}
	}
}