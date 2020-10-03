var points = objCircle.animatedPoints;

// Move player
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var move = right - left;

if (!dash.dashing) {
	index += move * movementSpeed;
	
	if (index > array_length(points)-1) index = 0;
	if (index < 0) index = array_length(points)-1;
	
	if (keyboard_check_pressed(vk_space) && dash.cooldown == 0) {
		dash.dashing = true;
		if (move == 0) move = 1;
		dash.dir = move;
		dash.cooldown = dash.cooldownMax;
		dash.speed = dash.speedMax;
		radius = 12;
	}
	
	dash.cooldown = scrApproach(dash.cooldown, 0, 1);
	if (dash.cooldown = 0) {
		color = c_lime;
	} else {
		color = c_green;
	}
} else if (dash.dashing) {
	index += dash.dir * dash.speed;
	dash.speed = scrApproach(dash.speed, movementSpeed, 0.5);
	if (dash.speed == movementSpeed) dash.dashing = false;
	
	if (index > array_length(points)-1) index = 0;
	if (index < 0) index = array_length(points)-1;
	
	dash.cooldown = dash.cooldownMax;
}

cx = points[index][0];
cy = points[index][1];

// Apply location
x = cx;
y = cy;

//Check for enemies
var enemy = instance_place(x, y, objEnemyBase);
if (enemy != noone) {
	scrSetShake(50, 10);
	scrSetPush(40, point_direction(enemy.x, enemy.y, x, y));
	
	if (dash.dashing) {
		instance_destroy(enemy);
		scrFreeze(100);
	} else {
		instance_destroy();
		objGameManager.state = game_states.over;
	}
}

//Check for pickups
var pickup = instance_place(x, y, objPickup);

if (pickup != noone) {
	switch (pickup.object_index) {
		case objGoal:
			#region Get score object
			//Spawn new goal
			var point = index + irandom_range(90, 120) * choose(1, -1);
			if (point > 360) point = abs(point - 360);
			if (point < 0) point = 360 + point;
			scrSpawnGoal(point);
	
			//Ramp up difficulty and fuck up the loop
			objCircle.waves.shape++;
			objCircle.waves.amplitude = irandom_range(5, 20);
			objCircle.waves.frequency = irandom_range(2, 6);
			scrSetShake(40, 5);
	
			//Destroy nearby enemies to avoid snapping into enemies
			with (objEnemyBase) {
				if (distance_to_object(objCircleRacer) < other.enemyDestroyDistance) instance_destroy();
			}
	
			//Increment score
			global.curScore++;
			
			//Maybe spawn untangle object when shape is fucked up
			if (objCircle.waves.shape >= 5 && !instance_exists(objUntangle)) {
				point = index + 180 * choose(1, -1);
				if (point > 360) point = abs(point - 360);
				if (point < 0) point = 360 + point;
				
				scrSpawnUntangle(point);
			}
			#endregion
		break;
		
		case objUntangle:
			#region
			//Reduce shape
			objCircle.waves.shape = clamp(objCircle.waves.shape - 2, 0, 360);
			objCircle.waves.amplitude = irandom_range(5, 10);
			objCircle.waves.frequency = irandom_range(1, 3);
			scrFlash(0.3);
			scrSetShake(20, 10);
			#endregion
		break;
	}
	
	//Destroy pickup when colliding
	instance_destroy(pickup);
}

//Animation
radius = lerp(radius, 4, 0.1);