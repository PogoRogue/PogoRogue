show_debug_message("Created width adapting gate")

depth = -9;

left_emitter_pos_x = x;
right_emmiter_pos_x = x + sprite_width - sprite_get_width(spr_gate_open_right);

while(position_meeting(left_emitter_pos_x, y + 16, obj_ground_outer))
{
	left_emitter_pos_x = left_emitter_pos_x + 16; //Move over a grid square to determine where to draw the left emitter
}

while(position_meeting(right_emmiter_pos_x + sprite_get_width(spr_gate_open_right) - 1, y + 16, obj_ground_outer))
{
	right_emmiter_pos_x = right_emmiter_pos_x - 16; //Move over a grid square to determine where to draw the right emitter
}

//Now that both the right and left emmiter locations have been chosen, choose the middle symbol location
//Symbol should be drawn at centered on the halfway between the left side of left emitter,
//and right side of right emitter. Since the anchor is the top left, offset x by half the sprite width
middle_symbol_pos_x = (left_emitter_pos_x + (right_emmiter_pos_x + sprite_get_width(spr_gate_open_right)))/2 - sprite_get_width(spr_gate_open_middle)/2;

//Adjust beam width to match :)

image_xscale = (right_emmiter_pos_x - left_emitter_pos_x + 32)/sprite_width;
x = left_emitter_pos_x;

closed = false;
created_walls = false;
gate_width = 0;
gate_width_half = 0;
close_distance = 0;

mask_index = spr_nothing;
depth = 10;