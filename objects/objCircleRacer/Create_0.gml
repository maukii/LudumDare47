index = 270;
movementSpeed = 2;
radius = 0;
enemyDestroyDistance = 64;

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
iframes = 0;
iframesMax = 180;

flash = 0;

usingMouse = false;
lastMouseX = device_mouse_raw_x(0);
lastMouseY = device_mouse_raw_y(0);