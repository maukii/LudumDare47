if(instance_exists(objCircleRacer))
{
	player = objCircleRacer;
}
else
{
	player = noone;	
}

size = 10;
moveSpeed = 0.5;
dir = 0;
distanceFromCenter = 5;

width = room_width * 0.5;
height = room_height * 0.5;

dir = point_direction(x, y, player.x, player.y);
x = width + lengthdir_x(distanceFromCenter, dir);
y = height + lengthdir_y(distanceFromCenter, dir);