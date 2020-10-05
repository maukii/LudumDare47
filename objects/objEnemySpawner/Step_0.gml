/// @description Spawn stuff
if(spawningWave)
{
	timer++;
	
	for (var i = 0; i < ds_list_size(waves); i++)
	{		
		var next = ds_list_find_value(waves, i);
		if(next[_WAVE] == spawningWaveIndex) && (next[_DELAY] == timer)
		{
			with(objJan)
			{
				SetFace(5, 30);	
			}
			
			switch(next[_TYPE])
			{
				case objEnemyCircle:
					instance_create_layer(screenCenterX, screenCenterY, layer, next[_TYPE]);
				break;
				
				case objEnemyTriangle:
					if(!instance_exists(objCircleRacer))
					{
						continue;
					}
					dir = point_direction(screenCenterX, screenCenterY, objCircleRacer.x, objCircleRacer.y);
					cx = screenCenterX + lengthdir_x(25, dir);
					cy = screenCenterY + lengthdir_y(25, dir);
					e = instance_create_layer(cx, cy, layer, next[_TYPE]);
					e.dir = dir;
					with(objJan)
					{
						alarm[2] = 120;
					}
				break;
				
				case objEnemyBox:
					instance_create_layer(screenCenterX, screenCenterY, layer, next[_TYPE]);
				break;
			}
			
			scrSetShake(10, 10);
		}
	}
	
	if(timer > maxDelay + delayBetweenWaves)
	{
		spawningWave = false;
		timer = 0;
		maxDelay = -1;
		spawningWave = false;
		
		var size = ds_list_size(waves);
		var maxWave = ds_list_find_value(waves, size-1);
		spawningWaveIndex = irandom_range(1, maxWave[_WAVE]);
		SpawnWave(spawningWaveIndex);
	}
}
