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
radius = lerp(radius, 8, 0.02);