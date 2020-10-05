//Apply movement
x += lengthdir_x(moveSpeed, dir);
y += lengthdir_y(moveSpeed, dir);

//Despawn
if (x < -sprite_width || x > room_width + sprite_width) {
	instance_destroy();
}

if (y < -sprite_height || y > room_height + sprite_height) {
	instance_destroy();
}

//Animation
size = scrApproach(size, maxSize, 0.001);
image_xscale = size;
image_yscale = size;
image_angle += rotSpeed;

//Particles
part_type_direction(global.circleEnemyPart, dir + 160, dir + 200, 0, 0);
part_particles_create(global.prtSys, x, y, global.circleEnemyPart, 1);