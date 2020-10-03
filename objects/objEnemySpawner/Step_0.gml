/// @description Spawn stuff
if(spawningWave)
{
	for (var i = 0; i < ds_list_size(waves); i++)
	{		
		var next = ds_list_find_value(waves, i);
		if(next[_WAVE] == spawningWaveIndex) && (next[_DELAY] == timer)
		{
			instance_create_layer(screenCenterX, screenCenterY, layer, next[_TYPE]);
		}
	}
	
	timer++;
	
	if(timer > maxDelay)
	{
		spawningWave = false;
		timer = 0;
	}
}
