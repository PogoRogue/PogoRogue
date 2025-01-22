y_add = 0; //bob this amount of pixels
y_add_spd_start = 0.3; 
y_add_spd = y_add_spd_start; //bob at this spee
y_up = false; //bobbing up or down
init_x = x;
init_y = y;
end_x = 360;
end_y = 5392+96;
timer = 0;
global.salesman_number += 1;
depth = -5;

spd = 0;
still = false;
timer = 0;

retract_current_bubble = false;

delete_speech_bubble = false;

//create speech bubble
//speechbubble_obj = noone;

speechbubble_obj_1 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
	text_array: ["啊哈! 我们的新成员来了! \n欢迎来到训练中心!",
	"我的名字是安小飞，\n叫我小飞就好啦！",
	"我将教授你使用跳杆\n去战斗的方法.",
	"我们已经被困在这个工\n厂里好久了呢，现在是时\n候发动反击啦！没错！\n我们要反抗权威www",
	"等等, 你不会使用你的\n跳杆? 一点都不会吗？\nemmm…好吧.",
	"我想我有点太严格了, \n我去拿一下课件. 马上\n回来."],
	lines_of_text: 6, 
	parent_index: obj_drone_tutorial, 
	track_y: true,
	chars_per_line: 22,
	size2: true,
	retract_distance: 0,
	spawn_distance: 1000,
	constrain_player: true,
	bubble_num: 1,});
	
speechbubble_obj_2 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
	text_array: ["抱歉久等啦. 刚才有点事\n耽搁了.",
	"看一下这个课件你就明\n白如何转向和回正啦.",
	"现在请试着跳到那个蓝\n色的箱子上"],
	lines_of_text: 3, 
	parent_index: obj_drone_tutorial, 
	track_y: true,
	chars_per_line: 22,
	size2: true,
	retract_distance: 0,
	spawn_distance: 1000,
	bubble_num: 2,
	repeat_text: true,
	repeat_to_line: 2});

speechbubble_obj_3 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
	text_array: ["你捡到了一把手枪！\n它装在你的武器槽里很\n合适呢.",
	"武器不仅能帮你战斗，还\n能帮助你移动哦，你可\n以通过弹跳来为武器重\n新装填弹药！",
	"你可以先习惯一下, 我在\n下个房间等你哦"],
	lines_of_text: 3, 
	parent_index: obj_drone_tutorial, 
	track_y: true,
	chars_per_line: 22,
	size2: true,
	retract_distance: 0,
	spawn_distance: 1000,
	bubble_num: 3,
	repeat_text: true});
	
speechbubble_obj_4 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["下面我来教你蹭墙跳！\n这是大师与普通选手的\n分水岭！",
"可能会有点难度. 不要着\n急, 先仔细地看一下课件",
"我会在下一个房间等你\n进行战斗训练！"],
lines_of_text: 3, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 4,
repeat_text: true,
repeat_to_line: 1 });

speechbubble_obj_5 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["啊哈！你真的很有天赋诶！\n我们接着进行战斗训练吧！",
"敌人在被射击或弹跳击\n中时会受到伤害, 就和\n这个邪恶的人偶一样.",
"你可以从顶部或侧面踩\n到敌人身上，就像刚才\n的蹭墙跳那样",
"现在请试着击败这个人偶"],
lines_of_text: 4, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 5,
repeat_text: true,
repeat_to_line: 2 });

speechbubble_obj_6 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["对了, 告诉你个小秘密",
"你每击败一个敌人时，弹\n药也会自动回满哦！",
"你可以利用这些知识做\n出一些很酷的玩法.如果\n你喜欢速度，那就以后\n再谢我吧.",
"现在请试着利用那些敌\n人到达下一个房间吧.",
"别担心，我上方那些可\n爱的小粉东西会复活\n的。这算是道德的...吧？"],
lines_of_text: 5, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 6,
repeat_text: true,
repeat_to_line: 1 });

speechbubble_obj_7 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["接下来我将教你如何发\n动技能.",
"技能也可以装备进你的\n跳杆里，按下按键就能\n发动它们！",
"它们都有独特的效果,\n也能给你全新的移动\n方式.",
"发动技能需要很多能量, \n因此需要通过时间, 击杀\n或是弹跳来恢复！",
"现在请跳到绿色箱子那\n里领取你的第一个技\n能吧!"],
lines_of_text: 5, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 7,
repeat_text: true,
repeat_to_line: 2 });

speechbubble_obj_8 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["哇哦, 那是蓄力冲击！\n快按下技能槽上标出的\n按键试试看！",
"你还可以点击'物品信息'\n按钮来了解更多关于物\n品的内容！"],
lines_of_text: 2, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 8,
repeat_text: true,
repeat_to_line: 1 });

speechbubble_obj_9 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["哇! 你把那些家伙揍得落\n花流水！",
"快去打开那个箱子领取新\n武器！"],
lines_of_text: 2, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 9,
repeat_text: true,
repeat_to_line: 1 });

speechbubble_obj_10 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["你可以通过手柄的LB/RB\n和键盘的1,2键或Q 键\n切换武器.",
"弹跳时, 只有当前装备\n的武器会重新装填. 你需\n要两把武器都装满才\n能跳上去！",
"现在请试着利用两把\n武器一起跳到上面的\n房间吧!"],
lines_of_text: 3, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 10,
repeat_text: true,
repeat_to_line: 2 });

speechbubble_obj_11 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["好样的！最后要介绍的\n就是连击系统啦.",
"你的连击数越高, 击败敌\n人掉落的金币也就越多, \n你可以用金币来购买物品.",
"在你的连击条耗尽之前\n击败敌人可以获得更\n多连击数, 同时回满\n连击条.",
"在受伤时连击条会减少.",
"现在请试着达成5个连击\n吧！我还为你设置了几\n个道具箱子."],
lines_of_text: 5, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 11,
repeat_text: true,
repeat_to_line: 2 });

speechbubble_obj_12 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["你已经完成了训练! 恭喜\n毕业呀! 现在让我们出\n去浪起来吧！"],
lines_of_text: 1, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 12,
repeat_text: false,
repeat_to_line: 1 });

current_speechbubble = -1;
speechbubble_array = [speechbubble_obj_1,speechbubble_obj_2,speechbubble_obj_3,
speechbubble_obj_4,speechbubble_obj_5,speechbubble_obj_6,
speechbubble_obj_7,speechbubble_obj_8,speechbubble_obj_9,
speechbubble_obj_10,speechbubble_obj_11,speechbubble_obj_12];

for (i=0;i<array_length(speechbubble_array);i++) {
	with obj_speechbubble {
		if bubble_num != other.current_speechbubble+1 {
			awake = false;
		}
	}
}

current_bubble_exists = true;

depth = -15;