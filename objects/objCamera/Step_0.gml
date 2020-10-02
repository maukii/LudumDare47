//Apply effects
scrShake();
scrPush();
scrRotate();

var spd = 0.1;

xTo = lerp(xTo, shakeX + pushX, spd);
yTo = lerp(yTo, shakeY + pushY, spd);

camera_set_view_pos(view, xTo, yTo);