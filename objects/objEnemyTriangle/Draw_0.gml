var dirOffset = 0;
var size = 8;

var x1 = x + lengthdir_x(size, dir + dirOffset);
var y1 = y + lengthdir_y(size, dir + dirOffset);
dirOffset += 120;

var x2 = x + lengthdir_x(size, dir + dirOffset);
var y2 = y + lengthdir_y(size, dir + dirOffset);
dirOffset += 120;

var x3 = x + lengthdir_x(size, dir + dirOffset);
var y3 = y + lengthdir_y(size, dir + dirOffset);

var c = c_purple;
draw_triangle_color(x1, y1, x2, y2, x3, y3, c, c, c, false);

if (alarm[10] != -1) draw_line_width(x, y, objCircleRacer.x, objCircleRacer.y, 10);