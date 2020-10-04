#macro _WAVE 0
#macro _TYPE 1
#macro _DELAY 2

screenCenterX = room_width * 0.5;
screenCenterY = room_height * 0.5;

delayBetweenWaves = 120;
maxDelay = -1;
timer = 0;
spawningWave = false;
spawningWaveIndex = -1;
waves = ds_list_create(); 

// [type, delay]
ds_list_add(waves, [1, objEnemyCircle, 0]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 20]);
ds_list_add(waves, [1, objEnemyCircle, 30]);
ds_list_add(waves, [1, objEnemyCircle, 40]);
ds_list_add(waves, [1, objEnemyCircle, 50]);
ds_list_add(waves, [1, objEnemyCircle, 60]);
ds_list_add(waves, [1, objEnemyCircle, 70]);
ds_list_add(waves, [1, objEnemyCircle, 80]);
ds_list_add(waves, [1, objEnemyCircle, 90]);
ds_list_add(waves, [1, objEnemyCircle, 100]);
ds_list_add(waves, [1, objEnemyCircle, 100]);
ds_list_add(waves, [1, objEnemyCircle, 100]);
ds_list_add(waves, [1, objEnemyCircle, 100]);
ds_list_add(waves, [1, objEnemyCircle, 100]);
ds_list_add(waves, [1, objEnemyCircle, 100]);
ds_list_add(waves, [1, objEnemyCircle, 100]);
ds_list_add(waves, [1, objEnemyCircle, 100]);
ds_list_add(waves, [1, objEnemyCircle, 100]);
ds_list_add(waves, [1, objEnemyCircle, 100]);
ds_list_add(waves, [1, objEnemyCircle, 100]);
ds_list_add(waves, [1, objEnemyCircle, 100]);
ds_list_add(waves, [1, objEnemyCircle, 100]);
ds_list_add(waves, [1, objEnemyCircle, 100]);
ds_list_add(waves, [1, objEnemyCircle, 100]);
ds_list_add(waves, [1, objEnemyCircle, 100]);


ds_list_add(waves, [2, objEnemyTriangle, 10]);
ds_list_add(waves, [2, objEnemyCircle, 10]);
ds_list_add(waves, [2, objEnemyCircle, 10]);
ds_list_add(waves, [2, objEnemyCircle, 10]);
ds_list_add(waves, [2, objEnemyCircle, 30]);
ds_list_add(waves, [2, objEnemyCircle, 30]);
ds_list_add(waves, [2, objEnemyCircle, 30]);
ds_list_add(waves, [2, objEnemyTriangle, 60]);
ds_list_add(waves, [2, objEnemyCircle, 60]);
ds_list_add(waves, [2, objEnemyCircle, 60]);
ds_list_add(waves, [2, objEnemyCircle, 60]);
ds_list_add(waves, [2, objEnemyCircle, 90]);
ds_list_add(waves, [2, objEnemyCircle, 90]);
ds_list_add(waves, [2, objEnemyCircle, 90]);
ds_list_add(waves, [2, objEnemyTriangle, 120]);
ds_list_add(waves, [2, objEnemyCircle, 120]);
ds_list_add(waves, [2, objEnemyCircle, 120]);
ds_list_add(waves, [2, objEnemyCircle, 120]);
ds_list_add(waves, [2, objEnemyCircle, 150]);
ds_list_add(waves, [2, objEnemyCircle, 150]);
ds_list_add(waves, [2, objEnemyCircle, 150]);

ds_list_add(waves, [3, objEnemyTriangle, 0]);
ds_list_add(waves, [3, objEnemyCircle, 10]);
ds_list_add(waves, [3, objEnemyCircle, 10]);
ds_list_add(waves, [3, objEnemyCircle, 10]);
ds_list_add(waves, [3, objEnemyCircle, 10]);
ds_list_add(waves, [3, objEnemyCircle, 10]);
ds_list_add(waves, [3, objEnemyCircle, 10]);
ds_list_add(waves, [3, objEnemyCircle, 10]);
ds_list_add(waves, [3, objEnemyBox, 10]);
ds_list_add(waves, [3, objEnemyBox, 10]);
ds_list_add(waves, [3, objEnemyBox, 10]);
ds_list_add(waves, [3, objEnemyBox, 10]);
ds_list_add(waves, [3, objEnemyBox, 10]);
ds_list_add(waves, [3, objEnemyTriangle, 50]);
ds_list_add(waves, [3, objEnemyCircle, 100]);
ds_list_add(waves, [3, objEnemyCircle, 100]);
ds_list_add(waves, [3, objEnemyCircle, 100]);
ds_list_add(waves, [3, objEnemyCircle, 100]);
ds_list_add(waves, [3, objEnemyCircle, 100]);
ds_list_add(waves, [3, objEnemyCircle, 100]);
ds_list_add(waves, [3, objEnemyCircle, 100]);


function SpawnWave(waveIndex)
{		
	for (var i = 0; i < ds_list_size(waves); i++)
	{		
		var next = ds_list_find_value(waves, i);
		if(next[_WAVE] == waveIndex) && (next[_DELAY] > maxDelay)
		{
			maxDelay = next[_DELAY];
		}
	}
	
	spawningWaveIndex = waveIndex;
	spawningWave = true;
}

SpawnWave(1);
