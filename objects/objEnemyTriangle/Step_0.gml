//Despawn
if (x < -sprite_width || x > room_width + sprite_width) {
	instance_destroy();
}

if (y < -sprite_height || y > room_height + sprite_height) {
	instance_destroy();
}

if(!launched && instance_exists(objCircleRacer))
{
	dir = point_direction(x, y, player.x, player.y);
	x = width + lengthdir_x(distanceFromCenter, dir);
	y = height + lengthdir_y(distanceFromCenter, dir);
}

x += lengthdir_x(moveSpeed, dir);
y += lengthdir_y(moveSpeed, dir);
