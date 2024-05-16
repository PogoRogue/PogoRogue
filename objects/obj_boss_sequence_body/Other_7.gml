/// @description Handle animation transitions

switch(sprite_index) {
	case spr_sequence_entrance:
		sprite_index = spr_sequence_open_door;
		break;
	case spr_sequence_open_door:
		sprite_index = spr_sequence_immune;
		break;
	case spr_sequence_close_door:
		sprite_index = spr_sequence_vulnerable;
		break;
}
