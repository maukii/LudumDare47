if(objGameManager.state == game_states.over && !lastLaugh)
{
	LastLaugh();	
}

if(laughing)
{	
	alarm[0] = 1;
	alarm[1] = laughFrames;
}

image_angle = scrWave(-10, 10, 4, 0);

if (!destroy) scale = clamp(scale + 0.05, 0, maxScale);

image_xscale = scale + scrWave(-0.05, 0.05, 3, 0);
image_yscale = scale + scrWave(-0.05, 0.05, 5, 0);

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
					
					alarm[2] = 120;
				break;
				
				case objEnemyBox:
					instance_create_layer(screenCenterX, screenCenterY, "Enemies", next[_TYPE]);
				break;
			}
			
			scrSetShake(10, 10);
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
			waveIndex = irandom_range(1, 6);
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

if (bossActive) {
	scrSetSpiralColor(scrWave(0.1, 0.3, 2, 0), 0., 0.);
}

if (destroy) {
	image_blend = make_color_hsv(scrWave(0, 255, 2, 0), 255, 255);
	x = lerp(x, x + random_range(-20, 20), 0.2);
	y = lerp(y, y + random_range(-20, 20), 0.2);
	
	image_xscale = scale + scrWave(-0.1, 0.2, 0.6, 0);
	image_yscale = scale + scrWave(-0.1, 0.2, 1, 0);
	
	scale = scrApproach(scale, 0, 0.001);
	
	scrJanDeathParticles(10);
	scrFlashSpiralColor(scrWave(0, 1, 0.5, 0), scrWave(0, 1, 0.5, 0.1), scrWave(0, 1, 0.5, 0.3), 0.5);
	scrFlashCircleColor(make_color_hsv(scrWave(0, 255, 1.2, 0), 255, 255));
	
	scrSetShake(40, 10);
}