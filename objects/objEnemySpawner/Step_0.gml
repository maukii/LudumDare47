/// @description Spawn stuff
if(spawningWave)
{
	timer++;
	
	for (var i = 0; i < ds_list_size(waves); i++)
	{		
		var next = ds_list_find_value(waves, i);
		if(next[_WAVE] == spawningWaveIndex) && (next[_DELAY] == timer)
		{
			instance_create_layer(screenCenterX, screenCenterY, layer, next[_TYPE]);
		}
	}
	
	if(timer > maxDelay)
	{
		spawningWave = false;
	}
}
else
{
	timer = 0;
	maxDelay = -1;
	spawningWave = false;
	SpawnWave(spawningWaveIndex++);
}
