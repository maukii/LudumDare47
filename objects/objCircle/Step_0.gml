//Animate loop points
var size = array_length(points);

for(var i = 0; i < size; i++) {
	var dir = point_direction(center.x, center.y, points[i][0], points[i][1]);
	
	animatedPoints[i][0] = points[i][0] + lengthdir_x(scrWave(-10, 10, 2, i / 360), dir);
	animatedPoints[i][1] = points[i][1] + lengthdir_y(scrWave2(-10, 10, 2, i / 360), dir);
}


//Update path nodes
for(var i = 0; i < size; i++) {
	path_change_point(circlePath, i, animatedPoints[i][0], animatedPoints[i][1], 100);
}