points = objCircle.animatedPoints;

index = random_range(0, array_length(points)-1)
targetPointX = points[index][0];
targetPointY = points[index][1];

angle = random(359);
delay = 120;
expanding = false;
decaying = false;
erect = false;
alarm[0] = delay;

maxImageScale = 10;
image_xscale = 0;
image_xscale = 0;
image_angle = angle;

drawX = targetPointX;
drawY = targetPointY;
x = 9999;
y = 9999;

scr = 10;