//Animate loop points
var size = array_length(points);

for(var i = 0; i < array_length(points); i++) {
	var dir = point_direction(center.x, center.y, points[i][0], points[i][1]);
	
	animatedPoints[i][0] = points[i][0] + lengthdir_x(scrWave(-10, 10, 2, i / 360), dir);
	animatedPoints[i][1] = points[i][1] + lengthdir_y(scrWave2(-10, 10, 2, i / 360), dir);
	
	if(i == 0) 
	{
		prevPoints.x = animatedPoints[size-1][0];
		prevPoints.y = animatedPoints[size-1][1];
	}
	else
	{
		prevPoints.x = animatedPoints[i-1][0];
		prevPoints.y = animatedPoints[i-1][1];
	}
		
	dir = point_direction(center.x, center.y, prevPoints.x, prevPoints.y);
	prevPoints.x += lengthdir_x(scrWave(-10, 10, 2, i / 360), dir);
	prevPoints.y += lengthdir_y(scrWave2(-10, 10, 2, i / 360), dir);
}


//Update path nodes
for(var i = 0; i < array_length(points); i++) {
	path_change_point(circlePath, i, points[i][0], points[i][1], 100);
}