#macro _WAVE 0
#macro _TYPE 1
#macro _DELAY 2

screenCenterX = room_width * 0.5;
screenCenterY = room_height * 0.5;

delayBetweenWaves = 140;
minDelayBetweenWaves = 30;

maxDelay = -1;
timer = 0;
spawningWave = false;
spawningWaveIndex = -1;
waves = ds_list_create(); 

// [type, delay]
ds_list_add(waves, [0, objEnemyCircle, 120]);
ds_list_add(waves, [0, objEnemyCircle, 170]);
ds_list_add(waves, [0, objEnemyCircle, 170]);
ds_list_add(waves, [0, objEnemyCircle, 170]);
ds_list_add(waves, [0, objEnemyCircle, 170]);
ds_list_add(waves, [0, objEnemyCircle, 220]);
ds_list_add(waves, [0, objEnemyCircle, 220]);
ds_list_add(waves, [0, objEnemyCircle, 220]);
ds_list_add(waves, [0, objEnemyCircle, 270]);
ds_list_add(waves, [0, objEnemyCircle, 270]);
ds_list_add(waves, [0, objEnemyCircle, 270]);
ds_list_add(waves, [0, objEnemyCircle, 420]);
ds_list_add(waves, [0, objEnemyCircle, 420]);
ds_list_add(waves, [0, objEnemyCircle, 420]);
ds_list_add(waves, [0, objEnemyCircle, 420]);
ds_list_add(waves, [0, objEnemyCircle, 420]);
ds_list_add(waves, [0, objEnemyCircle, 420]);
ds_list_add(waves, [0, objEnemyCircle, 420]);
ds_list_add(waves, [0, objEnemyCircle, 420]);
ds_list_add(waves, [0, objEnemyCircle, 420]);
ds_list_add(waves, [0, objEnemyCircle, 420]);
ds_list_add(waves, [0, objEnemyTriangle, 520]);
ds_list_add(waves, [0, objEnemyTriangle, 570]);
ds_list_add(waves, [0, objEnemyTriangle, 620]);
ds_list_add(waves, [0, objEnemyBox, 720]);
ds_list_add(waves, [0, objEnemyBox, 720]);
ds_list_add(waves, [0, objEnemyBox, 720]);
ds_list_add(waves, [0, objEnemyBox, 720]);
ds_list_add(waves, [0, objEnemyBox, 720]);

ds_list_add(waves, [1, objEnemyCircle, 1]);
ds_list_add(waves, [1, objEnemyCircle, 10]);
ds_list_add(waves, [1, objEnemyCircle, 20]);
ds_list_add(waves, [1, objEnemyCircle, 30]);
ds_list_add(waves, [1, objEnemyCircle, 40]);
ds_list_add(waves, [1, objEnemyCircle, 50]);
ds_list_add(waves, [1, objEnemyCircle, 60]);
ds_list_add(waves, [1, objEnemyCircle, 70]);
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
ds_list_add(waves, [2, objEnemyCircle, 30]);
ds_list_add(waves, [2, objEnemyCircle, 30]);
ds_list_add(waves, [2, objEnemyCircle, 60]);
ds_list_add(waves, [2, objEnemyCircle, 60]);
ds_list_add(waves, [2, objEnemyCircle, 90]);
ds_list_add(waves, [2, objEnemyCircle, 90]);
ds_list_add(waves, [2, objEnemyTriangle, 120]);
ds_list_add(waves, [2, objEnemyCircle, 120]);
ds_list_add(waves, [2, objEnemyCircle, 120]);
ds_list_add(waves, [2, objEnemyCircle, 150]);
ds_list_add(waves, [2, objEnemyCircle, 150]);
ds_list_add(waves, [2, objEnemyCircle, 150]);
ds_list_add(waves, [2, objEnemyCircle, 150]);
ds_list_add(waves, [2, objEnemyCircle, 150]);

ds_list_add(waves, [3, objEnemyTriangle, 1]);
ds_list_add(waves, [3, objEnemyCircle, 10]);
ds_list_add(waves, [3, objEnemyCircle, 10]);
ds_list_add(waves, [3, objEnemyCircle, 10]);
ds_list_add(waves, [3, objEnemyCircle, 10]);
ds_list_add(waves, [3, objEnemyCircle, 10]);
ds_list_add(waves, [3, objEnemyBox, 10]);
ds_list_add(waves, [3, objEnemyBox, 10]);
ds_list_add(waves, [3, objEnemyBox, 10]);
ds_list_add(waves, [3, objEnemyCircle, 100]);
ds_list_add(waves, [3, objEnemyCircle, 100]);
ds_list_add(waves, [3, objEnemyCircle, 100]);
ds_list_add(waves, [3, objEnemyCircle, 100]);
ds_list_add(waves, [3, objEnemyCircle, 100]);

ds_list_add(waves, [4, objEnemyTriangle, 1]);
ds_list_add(waves, [4, objEnemyTriangle, 10]);
ds_list_add(waves, [4, objEnemyTriangle, 20]);
ds_list_add(waves, [4, objEnemyTriangle, 30]);
ds_list_add(waves, [4, objEnemyTriangle, 40]);
ds_list_add(waves, [4, objEnemyTriangle, 50]);
ds_list_add(waves, [4, objEnemyBox, 60]);
ds_list_add(waves, [4, objEnemyBox, 60]);
ds_list_add(waves, [4, objEnemyTriangle, 100]);
ds_list_add(waves, [4, objEnemyTriangle, 110]);
ds_list_add(waves, [4, objEnemyTriangle, 120]);
ds_list_add(waves, [4, objEnemyTriangle, 130]);
ds_list_add(waves, [4, objEnemyTriangle, 140]);
ds_list_add(waves, [4, objEnemyTriangle, 150]);
ds_list_add(waves, [4, objEnemyBox, 160]);
ds_list_add(waves, [4, objEnemyBox, 160]);
ds_list_add(waves, [4, objEnemyCircle, 200]);
ds_list_add(waves, [4, objEnemyCircle, 200]);
ds_list_add(waves, [4, objEnemyCircle, 200]);
ds_list_add(waves, [4, objEnemyCircle, 200]);
ds_list_add(waves, [4, objEnemyCircle, 200]);
ds_list_add(waves, [4, objEnemyCircle, 200]);
ds_list_add(waves, [4, objEnemyCircle, 200]);
ds_list_add(waves, [4, objEnemyCircle, 200]);

ds_list_add(waves, [5, objEnemyCircle, 1]);
ds_list_add(waves, [5, objEnemyCircle, 1]);
ds_list_add(waves, [5, objEnemyCircle, 1]);
ds_list_add(waves, [5, objEnemyCircle, 1]);
ds_list_add(waves, [5, objEnemyCircle, 1]);
ds_list_add(waves, [5, objEnemyCircle, 1]);
ds_list_add(waves, [5, objEnemyCircle, 1]);
ds_list_add(waves, [5, objEnemyCircle, 1]);
ds_list_add(waves, [5, objEnemyCircle, 1]);
ds_list_add(waves, [5, objEnemyCircle, 1]);
ds_list_add(waves, [5, objEnemyBox, 60]);
ds_list_add(waves, [5, objEnemyBox, 60]);
ds_list_add(waves, [5, objEnemyBox, 60]);
ds_list_add(waves, [5, objEnemyCircle, 60]);
ds_list_add(waves, [5, objEnemyCircle, 60]);
ds_list_add(waves, [5, objEnemyCircle, 60]);
ds_list_add(waves, [5, objEnemyCircle, 60]);
ds_list_add(waves, [5, objEnemyCircle, 60]);
ds_list_add(waves, [5, objEnemyCircle, 60]);
ds_list_add(waves, [5, objEnemyCircle, 60]);
ds_list_add(waves, [5, objEnemyCircle, 60]);
ds_list_add(waves, [5, objEnemyCircle, 60]);
ds_list_add(waves, [5, objEnemyCircle, 60]);
ds_list_add(waves, [5, objEnemyCircle, 120]);
ds_list_add(waves, [5, objEnemyCircle, 120]);
ds_list_add(waves, [5, objEnemyCircle, 120]);
ds_list_add(waves, [5, objEnemyCircle, 120]);
ds_list_add(waves, [5, objEnemyCircle, 120]);
ds_list_add(waves, [5, objEnemyCircle, 120]);
ds_list_add(waves, [5, objEnemyCircle, 120]);
ds_list_add(waves, [5, objEnemyCircle, 120]);
ds_list_add(waves, [5, objEnemyCircle, 120]);
ds_list_add(waves, [5, objEnemyCircle, 120]);

ds_list_add(waves, [6, objEnemyBox, 1]);
ds_list_add(waves, [6, objEnemyBox, 1]);
ds_list_add(waves, [6, objEnemyBox, 1]);
ds_list_add(waves, [6, objEnemyBox, 1]);
ds_list_add(waves, [6, objEnemyBox, 1]);
ds_list_add(waves, [6, objEnemyBox, 1]);
ds_list_add(waves, [6, objEnemyBox, 1]);
ds_list_add(waves, [6, objEnemyBox, 1]);
ds_list_add(waves, [6, objEnemyBox, 1]);
ds_list_add(waves, [6, objEnemyBox, 1]);
ds_list_add(waves, [6, objEnemyBox, 1]);
ds_list_add(waves, [6, objEnemyCircle, 180]);
ds_list_add(waves, [6, objEnemyCircle, 180]);
ds_list_add(waves, [6, objEnemyCircle, 180]);
ds_list_add(waves, [6, objEnemyCircle, 180]);
ds_list_add(waves, [6, objEnemyCircle, 180]);
ds_list_add(waves, [6, objEnemyCircle, 180]);
ds_list_add(waves, [6, objEnemyCircle, 180]);
ds_list_add(waves, [6, objEnemyCircle, 180]);
ds_list_add(waves, [6, objEnemyCircle, 180]);
ds_list_add(waves, [6, objEnemyCircle, 180]);
ds_list_add(waves, [6, objEnemyCircle, 180]);
ds_list_add(waves, [6, objEnemyCircle, 180]);
ds_list_add(waves, [6, objEnemyCircle, 180]);
ds_list_add(waves, [6, objEnemyCircle, 180]);
ds_list_add(waves, [6, objEnemyCircle, 180]);
ds_list_add(waves, [6, objEnemyCircle, 180]);
ds_list_add(waves, [6, objEnemyCircle, 180]);
ds_list_add(waves, [6, objEnemyCircle, 180]);
ds_list_add(waves, [6, objEnemyCircle, 180]);
ds_list_add(waves, [6, objEnemyCircle, 180]);
ds_list_add(waves, [6, objEnemyTriangle, 200]);
ds_list_add(waves, [6, objEnemyTriangle, 210]);
ds_list_add(waves, [6, objEnemyTriangle, 220]);
ds_list_add(waves, [6, objEnemyTriangle, 230]);
ds_list_add(waves, [6, objEnemyTriangle, 240]);
ds_list_add(waves, [6, objEnemyTriangle, 250]);
ds_list_add(waves, [6, objEnemyTriangle, 260]);
ds_list_add(waves, [6, objEnemyTriangle, 270]);
ds_list_add(waves, [6, objEnemyTriangle, 280]);
ds_list_add(waves, [6, objEnemyTriangle, 290]);
ds_list_add(waves, [6, objEnemyTriangle, 300]);

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
	
	delayBetweenWaves = scrApproach(delayBetweenWaves, minDelayBetweenWaves, 2);
}