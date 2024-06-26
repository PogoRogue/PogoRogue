function scr_Convert_Layout_To_Rooms(layout_grid){
	random_set_seed(global.seed);
	var test_room_sprite = spr_u1;
	var block_grid_size  = sprite_get_width(test_room_sprite); //assumes square blocks
	var block_room_size = block_grid_size * 16;
	
	for(var j = ds_grid_height(layout_grid) - 1; j >= 0; j--)
	{
		for(var i = 0; i < ds_grid_width(layout_grid); i++)
		{
			var x_offset = block_room_size * i;
			var y_offset = -1 * block_room_size * j; //Negative since gamemaker y coords decrease upwards
			if(ds_grid_get(layout_grid, i, j) != 0)
			{	
				if(ds_grid_get(layout_grid, i, j) == "w")
				{
					//Generate large wall to fill block
					//Don't need to fill the entire grid this way, only the borders of the rooms
					var wall = instance_create_depth(x_offset, y_offset, depth, obj_ground_outer, 
					{
						image_xscale : block_grid_size,
						image_yscale : block_grid_size
					});
					
					//Place camera constraints around block
					if(j < ds_grid_height(layout_grid) - 1 && ds_grid_get(layout_grid, i, j + 1) != 0 && ds_grid_get(layout_grid, i, j + 1) != "w")
					{
					//Generate camera constraint objects in the same place as the 32x32 block
					top_camera_constraint = instance_create_layer(x_offset, y_offset, "TilesGround", obj_camera_constrain_y_bottom,
					{
						image_xscale : block_grid_size,
						depth : -10000
					});
					}
					
					if(j > 0 && ds_grid_get(layout_grid, i, j - 1) != 0 && ds_grid_get(layout_grid, i, j - 1) != "w")
					{
					bottom_camera_constraint = instance_create_layer(x_offset, y_offset + block_room_size, "TilesGround", obj_camera_constrain_y_top,
					{
						image_xscale : block_grid_size,
						depth : -10000
					});
					}
					
					if(i > 0 && ds_grid_get(layout_grid, i - 1, j) != 0 && ds_grid_get(layout_grid, i - 1, j) != "w")
					{
					left_camera_constraint = instance_create_layer(x_offset, y_offset, "TilesGround", obj_camera_constrain_x_right,
					{
						image_yscale : block_grid_size,
						depth : -10000
					});
					}
					
					if(i < ds_grid_width(layout_grid) - 1 && ds_grid_get(layout_grid, i + 1, j) != 0 && ds_grid_get(layout_grid, i + 1, j) != "w")
					{
					right_camera_constraint = instance_create_layer(x_offset + block_room_size, y_offset, "TilesGround", obj_camera_constrain_x_left,
					{
						image_yscale : block_grid_size,
						depth : -10000
					});
					}
					
				}
				else
				{
					//Create each block with the proper offset
					var block_to_generate = scr_Choose_Block_To_Generate(layout_grid, i, j);
					if(block_to_generate != -1)
					{
						if(block_to_generate == 0)
						{
							//Move the player to the start block location or the room's custom location
							if(instance_exists(obj_player))
							{
								var player = instance_nearest(x,y,obj_player);
								if(instance_exists(obj_player_start))
								{
									var player_start_location = instance_nearest(x_offset + block_room_size/2,
																				 y_offset + block_room_size/2,obj_player_start);
									//Check to make sure this player start object is the one inside the first room 
									//(We don't want to throw the player into the middle of the level)
									if(point_distance(x_offset + block_room_size/2, y_offset + block_room_size/2, 
													  player_start_location.x, player_start_location.y) < 2 * block_room_size)
									{
									player.x = player_start_location.x;
									player.y = player_start_location.y;
									}
									else
									{
										player.x = x_offset + block_room_size/2;
										player.y = y_offset + block_room_size/2;
									}
								}
								else
								{
								player.x = x_offset + block_room_size/2;
								player.y = y_offset + block_room_size/2;
								}
								with obj_camera {
									x = player.x;
									y = player.y - 32;
								}								
								show_debug_message("Moved player!")
								
								/* //Debug code for gates to make sure they're actually being placed and visible/interactable
								if(instance_exists(obj_room_gate_close))
								{
									var nearestDoor = instance_nearest(player.x, player.y, obj_room_gate_close);
									nearestDoor.x = player.x;
									nearestDoor.y = player.y + 100;
									show_debug_message("Moved gate")
								} */
								
							}
							else
							{
								show_debug_message("Didn't move player!")
							}
						}
						else
						{
							random_set_seed(global.seed + global.combat_room_num);
							var sub_image_num = sprite_get_number(block_to_generate);
							var sub_image_to_make = irandom_range(0,sub_image_num - 1);
							
							//Need to decide if the room we're making should be mirrored.
							var mirror = false;
							if(string_count("f", ds_grid_get(layout_grid, i, j)) > 0) //rooms labeled with an f are mirrored
							{
								mirror = true;
							}
							
							scr_Create_Room_From_Sprite(block_to_generate, sub_image_to_make, x_offset, y_offset, mirror);
							global.combat_room_num += 1;
							random_set_seed(global.seed);
						}
					}	
				}
			}
		}
	}
	
	//After creating all of the room objects, also add gates between hallways and rooms
	scr_Create_Gate_Objects_From_Grid(layout_grid);
}