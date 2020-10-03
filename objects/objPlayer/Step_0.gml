if (isDead) exit;

if (follow != undefined) {
	x = lerp(x, follow.x, 0.3);
	y = lerp(y, follow.y, 0.3);
}

if (keyboard_check_pressed(ord("W"))) {
	point++;
	follow = ds_list_find_value(objSpiral.pointList, point);
} else if (keyboard_check_pressed(ord("S"))) {
	point--;
	follow = ds_list_find_value(objSpiral.pointList, point);
}