global.curScore = 0;

function scrSpawnGoal (point) {
	//Goal spawns
	var xx = objCircle.animatedPoints[point][0];
	var yy = objCircle.animatedPoints[point][1];
	var goal = instance_create_layer(xx, yy, "Pickups", objGoal);
	goal.follow = point;
	goal.col = c_aqua;
	
	goal.sprite_index = sprCoin;
	goal.image_xscale = 0.05;
	goal.image_yscale = 0.05;
	
}

function scrSpawnUntangle (point) {
	//Goal spawns
	var xx = objCircle.animatedPoints[point][0];
	var yy = objCircle.animatedPoints[point][1];
	var goal = instance_create_layer(xx, yy, "Pickups", objUntangle);
	goal.follow = point;
	goal.col = c_yellow;
	
	goal.image_index = 0;
	goal.image_speed = 0;
	goal.image_xscale = 0.05;
	goal.image_yscale = 0.05;
}

function scrSpawnHealth (point) {
	//Goal spawns
	var xx = objCircle.animatedPoints[point][0];
	var yy = objCircle.animatedPoints[point][1];
	var goal = instance_create_layer(xx, yy, "Pickups", objHealth);
	goal.follow = point;
	goal.col = c_lime;
	
	goal.image_index = 2;
	goal.image_speed = 0;
	goal.image_xscale = 0.05;
	goal.image_yscale = 0.05;
}