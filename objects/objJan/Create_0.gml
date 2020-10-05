pointsToSpawn = 4000;
scale = 0;
maxScale = 0.2;
bossActive = false;
bossHealth = 5;
destroy = false;

flash = 0;

image_speed = 0;
image_index = 4;
laughing = false;
laughFrames = 120;
lastLaugh = false;

#macro _WAVE 0
#macro _TYPE 1
#macro _DELAY 2

screenCenterX = room_width * 0.5;
screenCenterY = room_height * 0.5;

delayBetweenWaves = 150;
maxDelay = -1;
timer = 0;
spawningWave = false;
waveIndex = -1;
wavesComplited = 0;
wavesPerPhase = 5;

waves = ds_list_create(); 

ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 1]);

ds_list_add(waves, [2, objEnemyBox, 1]);
ds_list_add(waves, [2, objEnemyBox, 1]);
ds_list_add(waves, [2, objEnemyBox, 1]);
ds_list_add(waves, [2, objEnemyBox, 1]);
ds_list_add(waves, [2, objEnemyBox, 1]);
ds_list_add(waves, [2, objEnemyTriangle, 1]);
ds_list_add(waves, [2, objEnemyTriangle, 130]);

ds_list_add(waves, [3, objEnemyBox, 1]);
ds_list_add(waves, [3, objEnemyBox, 1]);
ds_list_add(waves, [3, objEnemyBox, 1]);
ds_list_add(waves, [3, objEnemyBox, 1]);
ds_list_add(waves, [3, objEnemyBox, 1]);
ds_list_add(waves, [3, objEnemyBox, 1]);
ds_list_add(waves, [3, objEnemyBox, 1]);
ds_list_add(waves, [3, objEnemyBox, 1]);
ds_list_add(waves, [3, objEnemyBox, 1]);
ds_list_add(waves, [3, objEnemyBox, 1]);
ds_list_add(waves, [3, objEnemyCircle, 1]);
ds_list_add(waves, [3, objEnemyCircle, 1]);
ds_list_add(waves, [3, objEnemyCircle, 1]);
ds_list_add(waves, [3, objEnemyCircle, 1]);
ds_list_add(waves, [3, objEnemyCircle, 1]);
ds_list_add(waves, [3, objEnemyCircle, 1]);
ds_list_add(waves, [3, objEnemyCircle, 1]);
ds_list_add(waves, [3, objEnemyCircle, 1]);

ds_list_add(waves, [4, objEnemyTriangle, 1]);
ds_list_add(waves, [4, objEnemyTriangle, 130]);
ds_list_add(waves, [4, objEnemyBox, 1]);
ds_list_add(waves, [4, objEnemyBox, 1]);
ds_list_add(waves, [4, objEnemyBox, 1]);
ds_list_add(waves, [4, objEnemyCircle, 65]);
ds_list_add(waves, [4, objEnemyCircle, 65]);
ds_list_add(waves, [4, objEnemyCircle, 65]);
ds_list_add(waves, [4, objEnemyCircle, 65]);
ds_list_add(waves, [4, objEnemyCircle, 65]);
ds_list_add(waves, [4, objEnemyCircle, 65]);
ds_list_add(waves, [4, objEnemyCircle, 65]);

ds_list_add(waves, [5, objEnemyBox, 1]);
ds_list_add(waves, [5, objEnemyBox, 1]);
ds_list_add(waves, [5, objEnemyBox, 1]);
ds_list_add(waves, [5, objEnemyBox, 1]);
ds_list_add(waves, [5, objEnemyTriangle, 1]);
ds_list_add(waves, [5, objEnemyTriangle, 30]);
ds_list_add(waves, [5, objEnemyTriangle, 60]);
ds_list_add(waves, [5, objEnemyTriangle, 90]);
ds_list_add(waves, [5, objEnemyTriangle, 120]);
ds_list_add(waves, [5, objEnemyTriangle, 150]);

ds_list_add(waves, [6, objEnemyCircle, 1]);
ds_list_add(waves, [6, objEnemyCircle, 1]);
ds_list_add(waves, [6, objEnemyCircle, 1]);
ds_list_add(waves, [6, objEnemyCircle, 1]);
ds_list_add(waves, [6, objEnemyCircle, 1]);
ds_list_add(waves, [6, objEnemyCircle, 1]);
ds_list_add(waves, [6, objEnemyCircle, 1]);
ds_list_add(waves, [6, objEnemyCircle, 1]);
ds_list_add(waves, [6, objEnemyCircle, 1]);
ds_list_add(waves, [6, objEnemyCircle, 1]);
ds_list_add(waves, [6, objEnemyCircle, 30]);
ds_list_add(waves, [6, objEnemyCircle, 30]);
ds_list_add(waves, [6, objEnemyCircle, 30]);
ds_list_add(waves, [6, objEnemyCircle, 30]);
ds_list_add(waves, [6, objEnemyCircle, 30]);
ds_list_add(waves, [6, objEnemyCircle, 30]);
ds_list_add(waves, [6, objEnemyCircle, 30]);
ds_list_add(waves, [6, objEnemyCircle, 30]);
ds_list_add(waves, [6, objEnemyCircle, 30]);
ds_list_add(waves, [6, objEnemyCircle, 30]);
ds_list_add(waves, [6, objEnemyCircle, 60]);
ds_list_add(waves, [6, objEnemyCircle, 65]);
ds_list_add(waves, [6, objEnemyCircle, 70]);
ds_list_add(waves, [6, objEnemyCircle, 75]);
ds_list_add(waves, [6, objEnemyCircle, 80]);
ds_list_add(waves, [6, objEnemyCircle, 85]);
ds_list_add(waves, [6, objEnemyCircle, 90]);
ds_list_add(waves, [6, objEnemyCircle, 95]);
ds_list_add(waves, [6, objEnemyCircle, 100]);
ds_list_add(waves, [6, objEnemyCircle, 105]);


function StartBoss()
{
	alarm[0] = -1;
	alarm[1] = -1;
	alarm[2] = -1;
	alarm[3] = -1;
	alarm[10] = -1;
	
	bossActive = true;
	with (objEnemySpawner)
	{
		instance_destroy();	
	}
	
	with (objEnemyBase)
	{
		alarm[10] = 2;
		switch (object_index) {
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
	}
	
	with(objPickup)
	{
		instance_destroy();	
	}
	
	laughing = true;
	
	objCircle.waves.amplitudeTarget = 20;
	objCircle.waves.frequency = 2;
}

function SpawnWave(index)
{
	spawningWave = true;
	waveIndex = index;
	for (var i = 0; i < ds_list_size(waves); i++)
	{		
		var next = ds_list_find_value(waves, i);
		if(next[_WAVE] == waveIndex) && (next[_DELAY] > maxDelay)
		{
			maxDelay = next[_DELAY];
		}
	}
	
	SetFace(2, 30);
}
	
function SpecialAttack()
{
	wavesComplited = 0;
	instance_create_layer(screenCenterX, screenCenterY, "Enemies", objEnemyHeart);
	SetFace(0, 60);
	
	if(!instance_exists(objHealth))
	{
		if (objCircleRacer.hp < 3) {
			var index = objCircleRacer.index;
			var point = index + irandom_range(90, 120) * choose(1, -1);
			if (point > 359) point = abs(point - 359);
			if (point < 0) point = 359 + point;
			scrSpawnHealth(point);
		}
	}
}
	
function TakeDamage()
{
	bossHealth--;
	if(bossHealth <= 0)
	{
		spawningWave = false;
		destroy = true;
		audio_play_sound(sndDeathCry, 10, false);
		alarm[4] = 300;
	}
	
	delayBetweenWaves -= 20;
	wavesPerPhase++;
	alarm[3] = 1;
	SetFace(6, 60);
	
	scrJanDamageParticles(50);
	scrSetShake(50, 60);
	scrSetZoom(0.8);
	audio_play_sound(choose(sndDamage, sndDamage2, sndDamage3, sndDamage4), 10, false);
	flash = 5;
}

function SetFace(id, resetDelay)
{
	image_index = id;
	alarm[10] = resetDelay;	
}
	
function LastLaugh()
{
	alarm[1] = -1;
	alarm[2] = -1;
	alarm[3] = -1;
	alarm[10] = -1;
	alarm[0] = 1;
	lastLaugh = true;
}