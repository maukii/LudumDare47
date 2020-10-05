//Despawn
if (x < -sprite_width || x > room_width + sprite_width) {
	instance_destroy();
}

if (y < -sprite_height || y > room_height + sprite_height) {
	instance_destroy();
}

moveSpeed = scrApproach(moveSpeed, 2, 0.01);
x += lengthdir_x(moveSpeed, dir);
y += lengthdir_y(moveSpeed, dir);

//Animation
size = scrApproach(size, maxSize, 0.001);
image_xscale = size;
image_yscale = size;