index = 270;
movementSpeed = 1;
maxMovementSpeed = 2;
radius = 0;
enemyDestroyDistance = 64;
enemyDashDestroyDistance = 16;

dash = {
	cooldown : 0,
	cooldownMax : 60,
	dashing : false,
	speed : 0,
	speedMax : 8,
	dir : 0
}

color = c_lime;

hp = 3;
iframes = 180;
dashIFramesMax = 30;
iframesMax = 180;
cooldownPart = false;
flash = 0;

usingMouse = false;
lastMouseX = device_mouse_raw_x(0);
lastMouseY = device_mouse_raw_y(0);

scorePitch = 1;
dashPitch = 1;

image_xscale = 0.05;
image_yscale = 0.05;
image_speed = 0;