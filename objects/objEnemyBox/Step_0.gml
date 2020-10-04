if(expanding)
{
	image_xscale = scrApproach(image_xscale, maxImageScale, 1);
	image_yscale = scrApproach(image_yscale, maxImageScale, 1);
	
	if(image_xscale >= maxImageScale || image_yscale >= maxImageScale)
	{
		alarm[1] = 180;
		expanding = false;
		
		if (!erect) {
			x = drawX;
			y = drawY;
		}
		
		erect = true;
	}
}

if(decaying)
{
	erect = false;
	image_xscale = scrApproach(image_xscale, 0, 1);
	image_yscale = scrApproach(image_yscale, 0, 1);
	
	if(image_xscale <= 0 || image_yscale <= 0)
	{
		instance_destroy();
	}
}

targetPointX = points[index][0];
targetPointY = points[index][1];

if (erect) {
	x = targetPointX;
	y = targetPointY;
} else {
	x = 9999;
	y = 9999;
}

drawX = targetPointX;
drawY = targetPointY;

//Animate boi
image_angle = point_direction(drawX, drawY, room_width/2, room_height/2) + scrWave(-20, 20, 3, 0);

//Warning particles
if (alarm[0] != -1) part_particles_create(global.prtSys, drawX, drawY, global.boxEnemyPart, 1);