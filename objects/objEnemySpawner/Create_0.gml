#macro _WAVE 0
#macro _TYPE 1
#macro _DELAY 2

screenCenterX = room_width * 0.5;
screenCenterY = room_height * 0.5;

maxDelay = 5000;
timer = 0;
spawningWave = false;
spawningWaveIndex = -1;
waves = ds_list_create(); 

// [type, delay]
ds_list_add(waves, [1, objEnemyCircle, 0]);
ds_list_add(waves, [1, objEnemyCircle, 50]);
ds_list_add(waves, [1, objEnemyCircle, 100]);
ds_list_add(waves, [1, objEnemyCircle, 0]);
ds_list_add(waves, [1, objEnemyCircle, 50]);
ds_list_add(waves, [1, objEnemyCircle, 100]);

ds_list_add(waves, [2, objEnemyCircle, 10]);
ds_list_add(waves, [2, objEnemyCircle, 20]);
ds_list_add(waves, [2, objEnemyCircle, 30]);
ds_list_add(waves, [2, objEnemyCircle, 40]);
ds_list_add(waves, [2, objEnemyCircle, 50]);
ds_list_add(waves, [2, objEnemyCircle, 60]);

ds_list_add(waves, [3, objEnemyCircle, 10]);
ds_list_add(waves, [3, objEnemyBox, 20]);
ds_list_add(waves, [3, objEnemyTriangle, 30]);
ds_list_add(waves, [3, objEnemyCircle, 40]);
ds_list_add(waves, [3, objEnemyBox, 50]);
ds_list_add(waves, [3, objEnemyTriangle, 60]);

function SpawnWave(waveIndex)
{
	spawningWaveIndex = waveIndex;
	spawningWave = true;
}

SpawnWave(1);
