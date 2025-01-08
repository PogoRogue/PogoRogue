// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Buff_Stats(){
	if max_uses > 1 {
		item_stats = "可叠加: 是" + " (最大 " + string(max_uses) + ")";
	}else if max_uses = 1 {
		item_stats = "可叠加: 否";
	}else if max_uses = 0 {
		item_stats = "可叠加: 是";
	}
	item_description = item_description + "\n\n" + item_stats;
}