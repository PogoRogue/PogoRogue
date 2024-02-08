/// @description drop the tar vertically
// 你可以在此编辑器中写入代码 

if(which_wall = "left"){

instance_create_layer(x - 16 , y- (18 * sign(image_xscale)), "Instances", obj_enemy_snail_tar);
}
else if(which_wall = "right"){

instance_create_layer(x + 16 , y- (18 * sign(image_xscale)), "Instances", obj_enemy_snail_tar);
}





