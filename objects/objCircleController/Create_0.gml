global.circleRadius = scrWave(124, 132, 2 , 0);

//Enemy spawns
enemyFrequency = 10;
alarm[0] = enemyFrequency;

//Goal spawns
var xx = room_width / 2 + lengthdir_x(global.circleRadius, 90);
var yy = room_height / 2 + lengthdir_y(global.circleRadius, 90);
var goal = instance_create_layer(xx, yy, layer, objGoal);
goal.dir = 90;