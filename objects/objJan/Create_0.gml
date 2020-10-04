pointsToSpawn = 3000;
scale = 0;
maxScale = 2;
bossActive = false;


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

waves = ds_list_create(); 
ds_list_add(waves, [0, objEnemyCircle, 0]);

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
ds_list_add(waves, [2, objEnemyTriangle, 10]);
ds_list_add(waves, [2, objEnemyTriangle, 20]);
ds_list_add(waves, [2, objEnemyTriangle, 30]);
ds_list_add(waves, [2, objEnemyTriangle, 40]);
ds_list_add(waves, [2, objEnemyTriangle, 50]);
ds_list_add(waves, [2, objEnemyTriangle, 60]);
ds_list_add(waves, [2, objEnemyTriangle, 70]);
ds_list_add(waves, [2, objEnemyTriangle, 80]);
ds_list_add(waves, [2, objEnemyTriangle, 90]);
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


function StartBoss(index)
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
	
	SpawnWave(index);
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