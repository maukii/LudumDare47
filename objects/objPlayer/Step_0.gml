if (follow != undefined) {
	x = lerp(x, follow.x, 0.2);
	y = lerp(y, follow.y, 0.2);
}

if (keyboard_check_pressed(vk_space)) {
	follow = ds_list_find_value(objSpiral.pointList, point);
	point++;
}