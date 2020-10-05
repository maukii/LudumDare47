var points = objCircle.animatedPoints;

// Move player
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var move = right - left;
if (move != 0) {
	movementSpeed = scrApproach(movementSpeed, maxMovementSpeed, 0.1);
	round(movementSpeed);
} else {
	movementSpeed = 1;
}

if ((move != 0  || keyboard_check_pressed(vk_space)) && usingMouse) {
	usingMouse = false;
	lastMouseX = device_mouse_raw_x(0);
	lastMouseY = device_mouse_raw_y(0);
	window_set_cursor(cr_none);
}

if (!usingMouse && device_mouse_raw_x(0) != lastMouseX && device_mouse_raw_y(0) != lastMouseY) {
	usingMouse = true;
	window_set_cursor(cr_default);
}

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
if (usingMouse) {
	movementSpeed = maxMovementSpeed;
	if(point > 270 && index < 90)
		index -= movementSpeed;
	else if(point < 90 && index > 270)
		index += movementSpeed;
	else
		index = scrApproach(index, point, movementSpeed);	
}

if (!dash.dashing) {
	index += move * movementSpeed;
	
	if (index > array_length(points)-1) index = 0;
	if (index < 0) index = array_length(points)-1;
	
	if ((keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) && dash.cooldown == 0) {
		dash.dashing = true;
		cooldownPart = true;
				
		if(prevIndex < index)
			move = 1;
		else
			move = -1;
		if (move == 0) move = 1;
		dash.dir = move;
		dash.cooldown = dash.cooldownMax;
		dash.speed = dash.speedMax;
		radius = 12;
		image_index = 2;
		
		//FX
		scrSetShake(20, 10);
		audio_play_sound(sndDash, 10, false);
	}
	
	dash.cooldown = scrApproach(dash.cooldown, 0, 1);
	if (dash.cooldown = 0) {
		color = c_lime;
	} else {
		color = merge_color(c_white, c_lime, scrWave(0, 1, 0.2, 0));
	}
} else if (dash.dashing) {
	index += dash.dir * dash.speed;
	dash.speed = scrApproach(dash.speed, movementSpeed, 1);
	
	if (dash.speed == movementSpeed) {
		dash.dashing = false;
		dashPitch = 1;
		iframes = dashIFramesMax;
		image_index = 1;
		
		//Destroy nearby enemies to avoid snapping into enemies
			with (objEnemyCircle) {
				if (distance_to_object(objCircleRacer) < other.enemyDashDestroyDistance) {
					alarm[10] = 2;
					scrFreeze(20);
					
					//Particles
					scrCircleExplosion(50);
					global.curScore += scr;
					scrSpawnText(x, y, "+" + string(scr));
				}
			}
			
			with (objEnemyTriangle) {
				if (distance_to_object(objCircleRacer) < other.enemyDashDestroyDistance) {
					alarm[10] = 2;
					scrFreeze(20);
					
					//Particles
					scrTrongleExplosion(50);
					global.curScore += scr;
					scrSpawnText(x, y, "+" + string(scr));
				}
			}
			
			with (objEnemyBox) {
				if (distance_to_object(objCircleRacer) < other.enemyDashDestroyDistance) {
					alarm[10] = 2;
					scrFreeze(20);
					
					//Particles
					scrBoxExplosion(20);
					global.curScore += scr;
					scrSpawnText(x, y, "+" + string(scr));
				}
			}
	}
	
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
				//Particles
				scrBoxExplosion(20);
			break;
			case objEnemyHeart:
				//Particles
				scrHeartExplosion();
				with(objJan)
				{
					TakeDamage();
				}
			break;
		}
		
		global.curScore += enemy.scr;
		scrSpawnText(enemy.x, enemy.y, "+" + string(enemy.scr));
		
		instance_destroy(enemy);
		scrFreeze(100);
		audio_play_sound(sndDashHit, 10, false);
		audio_play_sound(sndDashHitDing, 10, false);
		audio_sound_pitch(sndDashHitDing, dashPitch);
		dashPitch += 0.1;
	} else {
		
		if (enemy.object_index == objEnemyHeart && iframes != 0) {
			with (objJan) TakeDamage();
		}
		
		instance_destroy(enemy);
		
		if (iframes == 0) {
			scrSetShake(50, 10);
			scrSetRotation(10, true);
			scrSetZoom(0.8);
			scrFreeze(200);
			objCircle.waves.noise = 20;
			audio_play_sound(sndHurt, 100, false);
			scrFlashSpiralColor(1.0, 0.24, 0.07, 0.5);
			scrSetSpiralSpeed(3);
			scrFlashCircleColor(c_red);
			flash = 5;
		}
		
		audio_play_sound(sndDashHit, 10, false);
		image_index = 1;

		if (hp > 1 && iframes == 0) {
			hp--;
			iframes = iframesMax;
			flash = 3;
			
			//Destroy all enemies onscreen
			with (objEnemyBase) {
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
				//Particles
				scrBoxExplosion(20);
			break;
			case objEnemyHeart:
				//Particles
				scrCircleExplosion(50);
			break;
		}
				
				alarm[10] = 2;
			}
		} else if (iframes == 0) {
			objGameManager.state = game_states.over;
			scrSetShake(50, 30);

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
			audio_sound_pitch(sndScoreGet, scorePitch);
			audio_play_sound(sndScoreGet, 10, false);
			scorePitch += 0.01;
			scrFlashSpiralColor(1.0, 1.0, 0., 0.5);
	
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
			
			with (objEnemyBox) {
				if (distance_to_object(objCircleRacer) < other.enemyDestroyDistance) {
					alarm[10] = 2;
					scrFreeze(20);
					
					//Particles
					scrBoxExplosion(20);
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
			scrSpawnText(pickup.x, pickup.y, "+" + string(pickup.goalScore) + "\n+TANGLE");
			
			//Maybe spawn untangle object when shape is fucked up
			if (objCircle.waves.shape >= 5 && !instance_exists(objUntangle) && random(1) + objCircle.waves.shape / 50 > 0.5) {
				point = index + 130 * choose(1, -1);
				if (point > 359) point = abs(point - 359);
				if (point < 0) point = 359 + point;
				
				scrSpawnUntangle(point);
			}
			
			//Maybe spawn health when player is low
			if (!instance_exists(objHealth) && random(2.1 / hp) > 1) {
				point = index + 200 * choose(1, -1);
				if (point > 359) point = abs(point - 359);
				if (point < 0) point = 359 + point;
				scrSpawnHealth(point);
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
			scrSpawnText(pickup.x, pickup.y, "UNTANGLE");
			audio_play_sound(sndUntangle, 10, false);
			scrFlashSpiralColor(1., 0.31, 0.35, 0.5);
			#endregion
		break;
		
		case objHealth:
			hp++;
			scrFlash(0.2);
			scrSpawnText(pickup.x, pickup.y, "+1 HP");
			audio_play_sound(sndHPGet, 10, false);
			scrFlashSpiralColor(1., 0.31, 0.35, 0.5);
		break;
	}
	
	//Destroy pickup when colliding
	instance_destroy(pickup);
}

//Animation
radius = lerp(radius, 6, 0.1);
image_angle = scrWave(-10, 10, 2, 0);

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

if (cooldownPart && dash.cooldown == 0) {
	part_particles_create(global.prtSys, x, y, global.playerDashCooldownPart, 20);
	audio_play_sound(sndDashEnd, 10, false);
	flash = 5;
	cooldownPart = false;
}