//Despawn
if (x < -sprite_width || x > room_width + sprite_width) {
	instance_destroy();
}

if (y < -sprite_height || y > room_height + sprite_height) {
	instance_destroy();
}

if(expanding)
{
	image_xscale = scrApproach(image_xscale, maxImageScale, 1);
	image_yscale = scrApproach(image_yscale, maxImageScale, 1);
	
	if(image_xscale >= maxImageScale || image_yscale >= maxImageScale)
	{
		mask_index = sprite_index;
		alarm[1] = 60;
		expanding = false;
	}
}

if(decaying)
{
	mask_index = -1;
	
	image_xscale = scrApproach(image_xscale, 0, 1);
	image_yscale = scrApproach(image_yscale, 0, 1);
	
	if(image_xscale <= 0 || image_yscale <= 0)
	{
		instance_destroy();
	}
}

targetPointX = points[index][0];
targetPointY = points[index][1];
x = targetPointX;
y = targetPointY;