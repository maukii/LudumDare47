if(laughing)
{	
	alarm[0] = 1;
	alarm[1] = laughFrames;
}

image_angle = scrWave(-10, 10, 4, 0);

scale = clamp(scale + 0.05, 0, maxScale);

image_xscale = scale + scrWave(-0.1, 0.1, 3, 0);
image_yscale = scale + scrWave(-0.1, 0.1, 5, 0);

x = xstart + scrWave(-5, 5, 5, 0);
y = ystart + scrWave(-5, 5, 3, 2);
		
if(scale >= maxScale)
{	
	if(!bossActive && global.curScore > pointsToSpawn)
		StartBoss();
}

if(spawningWave)
{
	timer++;
	
	for (var i = 0; i < ds_list_size(waves); i++)
	{		
		var next = ds_list_find_value(waves, i);
		if(next[_WAVE] == waveIndex) && (next[_DELAY] == timer)
		{
			switch(next[_TYPE])
			{
				case objEnemyCircle:
					instance_create_layer(screenCenterX, screenCenterY, "Enemies", next[_TYPE]);
				break;
				
				case objEnemyTriangle:
					if(!instance_exists(objCircleRacer))
					{
						continue;
					}
					dir = point_direction(screenCenterX, screenCenterY, objCircleRacer.x, objCircleRacer.y);
					cx = screenCenterX + lengthdir_x(25, dir);
					cy = screenCenterY + lengthdir_y(25, dir);
					e = instance_create_layer(cx, cy, "Enemies", next[_TYPE]);
					e.dir = dir;
				break;
				
				case objEnemyBox:
					instance_create_layer(screenCenterX, screenCenterY, "Enemies", next[_TYPE]);
				break;
			}
		}
	}
	
	if(timer > maxDelay + delayBetweenWaves)
	{
		wavesComplited++;
		
		spawningWave = false;
		timer = 0;
		maxDelay = -1;
		spawningWave = false;
		var lastIndex = waveIndex;
		for(var i = 0; i < 10; i++)
		{
			waveIndex = irandom_range(1, 3);
			if(waveIndex != lastIndex)
				break;
		}
		
		if(wavesComplited >= wavesPerPhase)
		{	
			SpecialAttack();
			return;
		}
		else
		{
			SpawnWave(waveIndex);
		}
	}
}