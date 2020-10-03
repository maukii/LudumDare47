var size = array_length(points);

for(var i = 0; i < size; i++)
{	
	var cx = points[i][0];
	var cy = points[i][1];
	
	var dir = point_direction(center.x, center.y, cx, cy);
	cx += lengthdir_x(scrWave(-10, 10, 2, i / 360), dir);
	cy += lengthdir_y(scrWave2(-10, 10, 2, i / 360), dir);
	
	if(i == 0) 
	{
		var prevPointX = points[size-1][0];
		var prevPointY = points[size-1][1];
	}
	else
	{
		var prevPointX = points[i-1][0];
		var prevPointY = points[i-1][1];
	}
		
	dir = point_direction(center.x, center.y, prevPointX, prevPointY);
	prevPointX += lengthdir_x(scrWave(-10, 10, 2, i / 360), dir);
	prevPointY += lengthdir_y(scrWave2(-10, 10, 2, i / 360), dir);
	
	draw_line(cx, cy, prevPointX, prevPointY);
}
