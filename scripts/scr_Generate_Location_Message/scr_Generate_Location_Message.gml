// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Generate_Location_Message(location_tag_obj){
	loc_message = "";	
	with(location_tag_obj)
	{
	other.loc_message = designer_name + " " + chunk_type + " " + sprite_name + " " + string(frame_number)
	}
	return loc_message;
}