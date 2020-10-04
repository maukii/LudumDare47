var points = objCircle.animatedPoints;

// Move player
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var move = right - left;

var prevIndex = index;

var closestPoint = 100000;
var point;

for	(var i = 0; i < array_length(points)-1; i++)
{
	var distance = point_distance(points[i][0], points[i][1], mouse_x, mouse_y);
	if(distance < closestPoint)
	{
		closestPoint = distance;
		point = i;
	}
}

// Mouse movement
if(point > 270 && index < 90)
	index -= movementSpeed;
else if(point < 90 && index > 270)
	index += movementSpeed;
else
	index = scrApproach(index, point, movementSpeed);	

if (!dash.dashing) {
	index += move * movementSpeed;
	
	if (index > array_length(points)-1) index = 0;
	if (index < 0) index = array_length(points)-1;
	
	if ((keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) && dash.cooldown == 0) {
		dash.dashing = true;
				
		if(prevIndex < index)
			move = 1;
		else
			move = -1;
		if (move == 0) move = 1;
		dash.dir = move;
		dash.cooldown = dash.cooldownMax;
		dash.speed = dash.speedMax;
		radius = 12;
		
		//FX
		scrSetShake(20, 10);
	}
	
	dash.cooldown = scrApproach(dash.cooldown, 0, 1);
	if (dash.cooldown = 0) {
		color = c_lime;
	} else {
		color = merge_color(c_white, c_lime, scrWave(0, 1, 0.2, 0));
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
	scrSetPush(40, point_direction(enemy.x, enemy.y, x, y));
	
	if (dash.dashing) {
		switch (enemy.object_index) {
			case objEnemyCircle:
				//Particles
				scrCircleExplosion(50);
			break;
			
			case objEnemyTriangle:
				//Particles
				scrTrongleExplosion(50);
			break;
			
			case objEnemyBox:
				repeat (20) instance_create_layer(enemy.x, enemy.y, "Enemies", objBoxGib);
			break;
		}
		
		global.curScore += enemy.scr;
		scrSpawnText(enemy.x, enemy.y, "+" + string(enemy.scr));
		
		instance_destroy(enemy);
		scrFreeze(100);
	} else {
		instance_destroy(enemy);

		if (hp > 1 && iframes == 0) {
			hp--;
			iframes = iframesMax;
			flash = 3;
			scrSetShake(50, 10);
			scrSetRotation(10, true);
			scrSetZoom(0.8);
			scrFreeze(200);
			
			with (objEnemyBase) alarm[10] = 2;
		} else if (iframes == 0){
			objGameManager.state = game_states.over;
			scrSetShake(50, 30);
			scrSetRotation(10, true);
			scrSetZoom(0.8);
			scrFreeze(100);
			instance_destroy();
		}
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
			if (point > 359) point = abs(point - 359);
			if (point < 0) point = 359 + point;
			scrSpawnGoal(point);
	
			//Ramp up difficulty and fuck up the loop
			objCircle.waves.shape++;
			objCircle.waves.amplitudeTarget = irandom_range(10, 30);
			objCircle.waves.frequency = irandom_range(2, 4);
			scrSetShake(40, 5);
			scrFlash(0.2);
	
			//Destroy nearby enemies to avoid snapping into enemies
			with (objEnemyCircle) {
				if (distance_to_object(objCircleRacer) < other.enemyDestroyDistance) {
					alarm[10] = 2;
					scrFreeze(20);
					
					//Particles
					scrCircleExplosion(50);
					global.curScore += scr;
					scrSpawnText(x, y, "+" + string(scr));
				}
			}
			
			with (objEnemyTriangle) {
				if (distance_to_object(objCircleRacer) < other.enemyDestroyDistance) {
					alarm[10] = 2;
					scrFreeze(20);
					
					//Particles
					scrTrongleExplosion(50);
					global.curScore += scr;
					scrSpawnText(x, y, "+" + string(scr));
				}
			}
			
			//Start waves when picking up first thing
			if (global.curScore == 0) {
				with (objEnemySpawner) {
					SpawnWave(0);
				}
				
				var jan = instance_create_layer(room_width/2, room_height/2, "Pickups", objJan);
				jan.image_xscale = 0;
				jan.image_yscale = 0;
				
				objGameManager.state = game_states.playing;
			}
	
			//Increment score
			global.curScore  += pickup.goalScore;
			scrSpawnText(pickup.x, pickup.y, "+" + string(pickup.goalScore));
			
			//Maybe spawn untangle object when shape is fucked up
			if (objCircle.waves.shape >= 5 && !instance_exists(objUntangle) && random(1) > 0.5) {
				point = index + 180 * choose(1, -1);
				if (point > 359) point = abs(point - 359);
				if (point < 0) point = 359 + point;
				
				scrSpawnUntangle(point);
			}
			#endregion
		break;
		
		case objUntangle:
			#region
			//Reduce shape
			objCircle.waves.shape = clamp(objCircle.waves.shape - 2, 0, 360);
			objCircle.waves.amplitudeTarget = irandom_range(5, 10);
			objCircle.waves.frequency = irandom_range(4, 6);
			
			//FX
			scrFlash(0.2);
			scrSetShake(20, 10);
			objJan.scale -= .1;
			scrSpawnText(pickup.x, pickup.y, "UNTANGLE");
			#endregion
		break;
	}
	
	//Destroy pickup when colliding
	instance_destroy(pickup);
}

//Animation
radius = lerp(radius, 6, 0.1);

//Countdown iframes
iframes = scrApproach(iframes, 0, 1);
flash = scrApproach(flash, 0, 1);

//Constant particles
var moveDir = point_direction(x, y, xprevious, yprevious);
if (move != 0 || dash.dashing) {
	part_type_direction(global.playerPart, moveDir - 20, moveDir + 20, 0, 0);
} else {
	part_type_direction(global.playerPart, 70, 110, 0, 0);
}

if (dash.cooldown == 0) part_particles_create(global.prtSys, x, y, global.playerPart, 1);

//Dash particles
if (dash.dashing) {
	repeat (10) {
		part_type_direction(global.playerDashPart, moveDir - 20, moveDir + 20, 1, 5);
		part_particles_create(global.prtSys, x, y, global.playerDashPart, 1);
	}
}