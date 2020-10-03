/// @description Spawn stuff
if(spawningWave)
{
	var wave = ds_list_find_value(waves, spawningWaveIndex);
	if(wave[_DELAY] == timer)
	{
		instance_create_layer(screenCenterX, screenCenterY, layer, wave[_TYPE]);	
	}
	
	timer++;	
}
else
{
	timer = 0;
}
