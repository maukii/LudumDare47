pointsToSpawn = 200;
scale = 0;
maxScale = 0.2;
bossActive = false;
bossHealth = 3;

image_speed = 0;
image_index = 4;
laughing = false;
laughFrames = 120;

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

ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 10]);

ds_list_add(waves, [2, objEnemyBox, 10]);
ds_list_add(waves, [2, objEnemyBox, 10]);
ds_list_add(waves, [2, objEnemyBox, 10]);
ds_list_add(waves, [2, objEnemyBox, 10]);
ds_list_add(waves, [2, objEnemyBox, 10]);
ds_list_add(waves, [2, objEnemyTriangle, 10]);
ds_list_add(waves, [2, objEnemyTriangle, 50]);
ds_list_add(waves, [2, objEnemyTriangle, 100]);

ds_list_add(waves, [3, objEnemyBox, 50]);
ds_list_add(waves, [3, objEnemyBox, 50]);
ds_list_add(waves, [3, objEnemyBox, 50]);
ds_list_add(waves, [3, objEnemyBox, 50]);
ds_list_add(waves, [3, objEnemyBox, 50]);
ds_list_add(waves, [3, objEnemyBox, 50]);
ds_list_add(waves, [3, objEnemyBox, 50]);
ds_list_add(waves, [3, objEnemyBox, 50]);
ds_list_add(waves, [3, objEnemyBox, 50]);
ds_list_add(waves, [3, objEnemyBox, 50]);
ds_list_add(waves, [3, objEnemyCircle, 10]);
ds_list_add(waves, [3, objEnemyCircle, 10]);
ds_list_add(waves, [3, objEnemyCircle, 10]);
ds_list_add(waves, [3, objEnemyCircle, 10]);
ds_list_add(waves, [3, objEnemyCircle, 10]);
ds_list_add(waves, [3, objEnemyCircle, 10]);
ds_list_add(waves, [3, objEnemyCircle, 10]);
ds_list_add(waves, [3, objEnemyCircle, 10]);


function StartBoss()
{
	bossActive = true;
	with (objEnemySpawner)
	{
		instance_destroy();	
	}
	
	with (objEnemyBase)
	{
		alarm[10] = 2;	
	}
	
	with(objPickup)
	{
		instance_destroy();	
	}
	
	laughing = true;
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
}
	
function SpecialAttack()
{
	wavesComplited = 0;
	instance_create_layer(screenCenterX, screenCenterY, "Enemies", objEnemyHeart);
}
	
function TakeDamage()
{
	bossHealth--;
	if(bossHealth <= 0)
	{
		// Jan dead boy here	
		spawningWave = false;
	}
	
	// animation
	// particles
	// angry jan
	// increase difficulty
	delayBetweenWaves -= 20;
	wavesPerPhase++;
}