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

if(launched && instance_exists(objCircleRacer))
{	
	if(loops <= aimFrames)
	{
		var pd = point_direction(x, y, player.x, player.y);
		var dd = angle_difference(dir, pd);
		dir -= min(abs(dd), aimFactor) * sign(dd);
		loops++;
	}
}

x += lengthdir_x(moveSpeed, dir);
y += lengthdir_y(moveSpeed, dir);

//Particles
part_type_direction(global.trongleEnemyPart, dir + 160, dir + 200, 0, 0);
if (launched) part_particles_create(global.prtSys, x, y, global.trongleEnemyPart, 1);

//Animation
size = lerp(size, maxSize, 0.1);
image_angle = dir - 90;
