amount += 0.1;

with (instance_create_layer(x,y,layer,objPoint)) {
	spinSpeed = 1;
	spinIncrementSpeed = 0.1;
	offset = other.amount;
	
	ds_list_add(other.pointList, id);
	
	if (other.iteration != 0) {
		lineEnd = ds_list_find_value(other.pointList, other.iteration - 1);
	} else
	{
		lineEnd = noone;
	}
}

iteration++;

alarm[0] = pointGenerationFrequency;