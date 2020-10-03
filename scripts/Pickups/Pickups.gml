global.curScore = 0;

function scrSpawnGoal (point) {
	//Goal spawns
	var xx = objCircle.animatedPoints[point][0];
	var yy = objCircle.animatedPoints[point][1];
	var goal = instance_create_layer(xx, yy, "Pickups", objGoal);
	goal.follow = point;
	goal.col = c_lime;
	image_xscale = 2;
	image_yscale = 2;
}

function scrSpawnUntangle (point) {
	//Goal spawns
	var xx = objCircle.animatedPoints[point][0];
	var yy = objCircle.animatedPoints[point][1];
	var goal = instance_create_layer(xx, yy, "Pickups", objUntangle);
	goal.follow = point;
	goal.col = c_yellow;
	image_xscale = 2;
	image_yscale = 2;
}