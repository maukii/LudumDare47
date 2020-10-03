//Movement
if (keyboard_check(ord("W"))) dir += moveSpeed;
if (keyboard_check(ord("S"))) dir -= moveSpeed;

//Apply position
x = room_width / 2 + lengthdir_x(global.circleRadius, dir);
y = room_height / 2 + lengthdir_y(global.circleRadius, dir);

//Check for enemies
var enemy = instance_place(x, y, objEnemy);
if (enemy != noone) {
	scrSetShake(40, 10);
	scrSetPush(40, point_direction(enemy.x, enemy.y, x, y));
	instance_destroy();
}

//Check for goals
var goal = instance_place(x, y, objGoal);
if (goal != noone) {
	//Spawn new goal
	var xx = room_width / 2 + lengthdir_x(global.circleRadius, goal.dir + 90);
	var yy = room_height / 2 + lengthdir_y(global.circleRadius, goal.dir + 90);
	var newGoal = instance_create_layer(xx, yy, layer, objGoal);
	newGoal.dir = goal.dir + 90;
	
	instance_destroy(goal);
}