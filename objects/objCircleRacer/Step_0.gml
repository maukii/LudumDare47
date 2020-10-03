var points = objCircle.animatedPoints;

// Move player
if (keyboard_check(ord("A"))) 
{
	index -= movementSpeed;
	if(index < 0)
	{
		index = array_length(points)-1;
	}
} 
else if (keyboard_check(ord("D"))) 
{
	index += movementSpeed;
	if(index > array_length(points)-1)
	{
		index = 0;
	}
}

cx = points[index][0];
cy = points[index][1];

// Apply location
x = lerp(x, cx, 0.5);
y = lerp(y, cy, 0.5);

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
	var rand = irandom(360);
	var xx = objCircle.animatedPoints[rand][0];
	var yy = objCircle.animatedPoints[rand][1];
	var newGoal = instance_create_layer(xx, yy, layer, objGoal);
	newGoal.follow = rand;
	
	instance_destroy(goal);
}

//Animation
radius = lerp(radius, 4, 0.1);