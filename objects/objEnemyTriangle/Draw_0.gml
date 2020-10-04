//var dirOffset = 0;

//var x1 = x + lengthdir_x(size, dir + dirOffset);
//var y1 = y + lengthdir_y(size, dir + dirOffset);
//dirOffset += 120;

//var x2 = x + lengthdir_x(size, dir + dirOffset);
//var y2 = y + lengthdir_y(size, dir + dirOffset);
//dirOffset += 120;

//var x3 = x + lengthdir_x(size, dir + dirOffset);
//var y3 = y + lengthdir_y(size, dir + dirOffset);

//var c = c_purple;

//if(!launched)
//{
//	var randX = random_range(-2, 2) * (launchDelay - alarm[0]) / 20;
//	var randY = random_range(-2, 2) * (launchDelay - alarm[0]) / 20;
//	x1 = lerp(x1, x1 + randX, 0.5);	
//	x2 = lerp(x2, x2 + randX, 0.5);
//	x3 = lerp(x3, x3 + randX, 0.5);
//	y1 = lerp(y1, y1 + randY, 0.5);	
//	y2 = lerp(y2, y2 + randY, 0.5);
//	y3 = lerp(y3, y3 + randY, 0.5);
//}

//draw_triangle_color(x1, y1, x2, y2, x3, y3, c, c, c, false);

draw_self();

if (alarm[10] != -1 && instance_exists(objCircleRacer)) draw_line_width(x, y, objCircleRacer.x, objCircleRacer.y, 2);