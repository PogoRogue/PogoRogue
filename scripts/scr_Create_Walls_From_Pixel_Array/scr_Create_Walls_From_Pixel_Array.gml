// @description Takes in an array of pixels corresponding to a room, 
//and creates as few walls as needed for that room. This is to save on computing efficiency by
//*hopefully cutting the amount of wall objects created by proc gen considerably.
function scr_Create_Walls_From_Pixel_Array(pixel_array, x_offset, y_offset){
	var object_queue = ds_queue_create();
	for(var i = 0; i < array_length(pixel_array); i++)
	{
		for(var j = 0; j <  array_length(pixel_array[0]); j++)
		{
			var RGB = pixel_array[i][j];
			var object_to_create = scr_Get_Object_From_RGB(RGB[0], RGB[1], RGB[2], RGB[3]);
			if(object_to_create == obj_ground_outer) //Black is the color of ground pixels!
			{						
				var width = 0;
				var height = 0;
				//Loop until we find an adjacent grid which isn't a ground object
				for(var k = i; k < array_length(pixel_array); k++)
				{
					var currentRGB = pixel_array[k][j];
					object_to_create = scr_Get_Object_From_RGB(currentRGB[0], currentRGB[1], currentRGB[2], currentRGB[3]);
					if(object_to_create == obj_ground_outer)
					{
						var width = k - i + 1; 
					}
					else
					{
					break;
					}
				}
				//We have the width of the ground object to make, now see if we can extend it's height
				for(m = j; m < array_length(pixel_array[0]); m++)//Check as much height as possible
				{
					var row_is_ground = true;
					for(var k = i; k < i + width; k++)
					{
						var currentRGB = pixel_array[k][m];
						object_to_create = scr_Get_Object_From_RGB(currentRGB[0], currentRGB[1], currentRGB[2], currentRGB[3]);
						if(object_to_create != obj_ground_outer)
						{
							row_is_ground = false;
							break; //Exit this inner loop if any pixel in the row doesn't correlate to ground
						}
					}
					if(row_is_ground)
					{
						height += 1;
					}
					else
					{
						break;
					}
				}
				
				//At this point, we know the width and height of the object to make
				//We still need to remove the pixels that we're going to create a ground object for
				//by setting their alpha to 0.
				for(var m = i; m < width + i; m++)
				{
					for(var n = j; n <  height + j; n++)
					{
						pixel_array[m][n] = [0,0,0,0]; //Set pixel to clear
					}
				}
				
				var grid_size = 16;
				//Objects are placed within the pixel editor in 16 pixel increments, so offsets 
				//are the initial block offset + 16 * their grid location
				var object_x_offset = x_offset + grid_size * i;
				var object_y_offset = y_offset + grid_size * j;
				var new_object = instance_create_layer(object_x_offset, object_y_offset, "Instances", obj_ground_outer, 
				{	//Set the objects x and y scale to the width and height we got above					
					image_xscale : width,
					image_yscale : height
				});				
				global.debug_wall_count++;
				show_debug_message("Created wall object number " + string(global.debug_wall_count) + " with width: " + string(width) + ", height: " + string(height) + "\n");
				//Queue the object so we can return all the walls at the end of this script
				ds_queue_enqueue(object_queue, new_object);
			}
		}
	}
	return object_queue;
}