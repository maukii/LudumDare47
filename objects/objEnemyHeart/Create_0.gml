if(instance_exists(objCircleRacer))
{
	player = objCircleRacer;
}
else
{
	player = noone;	
}

scr = 100;
size = 10;
moveSpeed = 1;
dir = 0;
distanceFromCenter = 5;

width = room_width * 0.5;
height = room_height * 0.5;

if(instance_exists(objCircleRacer))
{
	dir = point_direction(x, y, player.x, player.y);
}
x = width + lengthdir_x(distanceFromCenter, dir);
y = height + lengthdir_y(distanceFromCenter, dir);