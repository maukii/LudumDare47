points = objCircle.animatedPoints;

index = random_range(0, array_length(points)-1)
targetPointX = points[index][0];
targetPointY = points[index][1];

angle = random(359);
delay = 120;
expanding = false;
decaying = false;
alarm[0] = delay;

mask_index = -1;

maxImageScale = 10;
image_xscale = 0;
image_xscale = 0;
image_angle = angle;
x = targetPointX;
y = targetPointY;
