var size = array_length(points);

for(var i = 0; i < size; i++)
{	
	//var cx = points[i][0];
	//var cy = points[i][1];
	
	//var dir = point_direction(center.x, center.y, cx, cy);
	//cx += lengthdir_x(scrWave(-10, 10, 2, i / 360), dir);
	//cy += lengthdir_y(scrWave2(-10, 10, 2, i / 360), dir);
	
	//if(i == 0) 
	//{
	//	var prevPointX = points[size-1][0];
	//	var prevPointY = points[size-1][1];
	//}
	//else
	//{
	//	var prevPointX = points[i-1][0];
	//	var prevPointY = points[i-1][1];
	//}
		
	//dir = point_direction(center.x, center.y, prevPointX, prevPointY);
	//prevPointX += lengthdir_x(scrWave(-10, 10, 2, i / 360), dir);
	//prevPointY += lengthdir_y(scrWave2(-10, 10, 2, i / 360), dir);
	
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
	
	draw_line(animatedPoints[i][0], animatedPoints[i][1], prevPoints.x, prevPoints.y);
}
