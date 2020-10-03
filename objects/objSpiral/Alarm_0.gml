amount += 0.1;

with (instance_create_layer(x,y,layer,objPoint)) {
	spinSpeed = 10;
	spinIncrementSpeed = 0.1;
	offset = other.amount;
	
	ds_list_add(other.pointList, id);
	
	if (other.iteration != 0) {
		var size = ds_list_size(other.pointList);
		lineEnd = ds_list_find_value(other.pointList, size - 2);
		shouldDraw = true;
	} else {
		lineEnd = noone;
		shouldDraw = false;
	}
}

iteration++;

alarm[0] = pointGenerationFrequency;