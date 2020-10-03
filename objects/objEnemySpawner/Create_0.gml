#macro _TYPE 1
#macro _DELAY 2

screenCenterX = room_width * 0.5;
screenCenterY = room_height * 0.5;

timer = 0;
spawningWave = false;
spawningWaveIndex = -1;
waves = ds_list_create(); 

// [wave, type, spawnpoint, delay]
ds_list_add(waves, [objEnemyCircle, 0]);
ds_list_add(waves, [objEnemyCircle, 50]);
ds_list_add(waves, [objEnemyCircle, 100]);
ds_list_add(waves, [objEnemyCircle, 0]);
ds_list_add(waves, [objEnemyCircle, 50]);
ds_list_add(waves, [objEnemyCircle, 100]);

ds_list_add(waves, [objEnemyCircle, 10]);
ds_list_add(waves, [objEnemyCircle, 20]);
ds_list_add(waves, [objEnemyCircle, 30]);
ds_list_add(waves, [objEnemyCircle, 40]);
ds_list_add(waves, [objEnemyCircle, 50]);
ds_list_add(waves, [objEnemyCircle, 60]);

ds_list_add(waves, [objEnemyCircle, 10]);
ds_list_add(waves, [objEnemyBox, 20]);
ds_list_add(waves, [objEnemyTriangle, 30]);
ds_list_add(waves, [objEnemyCircle, 40]);
ds_list_add(waves, [objEnemyBox, 50]);
ds_list_add(waves, [objEnemyTriangle, 60]);

function SpawnWave(waveIndex)
{
	spawningWaveIndex = waveIndex;
	spawningWave = true;
}

SpawnWave(0);
