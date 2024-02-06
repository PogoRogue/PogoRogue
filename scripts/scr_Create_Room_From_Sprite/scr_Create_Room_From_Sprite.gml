//Functions needed to read proc gen room sprites
//ONLY CALL THESE FUNCTIONS IN THE DRAW EVENT

///@description Creates a 1024x1024 proc gen room from sprite data whose top left corner is located at x_offset, y_offset
/// @param spriteIndex
/// @param x_offset
/// @param y_offset
function scr_Create_Room_From_Sprite(spriteIndex, sprite_sub_image, x_offset, y_offset, mirror){
	//Read the sprite into an array
	var pixel_array = Read_Sprite_To_Array(spriteIndex, sprite_sub_image);
	
	//Create all objects corresponding to the pixel data with matching offsets
	return Generate_Block_From_Pixel_Array(pixel_array, x_offset, y_offset, mirror)	
}


function Read_Sprite_To_Array(spriteIndex, sprite_sub_image){
	
	var width = sprite_get_width(spriteIndex);
	var height = sprite_get_height(spriteIndex);
	
	//Create a surface. NOTE: should only do this in the draw event for technical reasons
	var surface = surface_create(width, height)
	
	//Apply the sprite to it
	surface_set_target(surface);
	draw_sprite(spriteIndex, sprite_sub_image,0,0);
	surface_reset_target();
	
	//Read it into a buffer
	var buffer = Buffer_Get_Pixel_Begin(surface)
	var total = 0;
	var pixel_data = 0;
	//Create Array to store pixel data for easy access
	for(var i = 0; i < width; i++)
	{
		for(var j = 0; j < height; j++)
		{
			//Store pixel data in a 2D array containing an array with [R,G,B] values
			pixel_data[i][j] = 
			[Buffer_Get_Pixel_R(buffer, i, j, width, height),
			Buffer_Get_Pixel_G(buffer, i, j, width, height),
			Buffer_Get_Pixel_B(buffer, i, j, width, height),
			Buffer_Get_Pixel_A(buffer, i, j, width, height)];
			total++;
		}
	}
	return pixel_data;
}

function Generate_Block_From_Pixel_Array(pixel_array, x_offset, y_offset, mirror)
{
	var object_queue = ds_queue_create();
	for(var i = 0; i < array_length(pixel_array); i++)
	{
		for(var j = 0; j <  array_length(pixel_array[0]); j++)
		{
			var RGB = pixel_array[i][j]
			var grid_size = 16;	
			
			var object_x_offset = x_offset + grid_size * i;
				var object_y_offset = y_offset + grid_size * j;
			
			/*
			if(!mirror)
			{
				//Objects are placed within the pixel editor in 16 pixel increments, so offsets 
				//are the initial block offset + 16 * their grid location
				var object_x_offset = x_offset + grid_size * i;
				var object_y_offset = y_offset + grid_size * j;
			}
			else
			{
				//For mirrored rooms, place them on the opposite side
				var object_x_offset = x_offset + grid_size * (array_length(pixel_array) - i - 1);
				var object_y_offset = y_offset + grid_size * j;
			}*/
			
			var new_object = Create_Instance_From_RGB(RGB, object_x_offset, object_y_offset)
			if(new_object != -1)
			{
			ds_queue_enqueue(object_queue, new_object);
			}
		}
	}
	var wall_queue = scr_Create_Walls_From_Pixel_Array(pixel_array, x_offset, y_offset)
	return object_queue;
}


// @description Given an RGB value, x and y position, creates the corresponding object in that location.
// Does NOT create obj_ground_outer, this is saved for scr_Create_Walls_From_Pixel_Array
function Create_Instance_From_RGB(RGB, x_offset, y_offset)
{
	var object_to_create = scr_Get_Object_From_RGB(RGB[0], RGB[1], RGB[2], RGB[3]);
	
	if(object_to_create != -1 && object_to_create != obj_ground_outer) //Optimization to minimize ground objects being created
	//(We create ground objects in the scr_Create_Walls_From_Pixel_Array script)
	{
	return instance_create_layer(x_offset, y_offset, "Instances", object_to_create);
	}
	else
	{
	return -1;
	}
}