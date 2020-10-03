var size = array_length(points);

for(var i = 0; i < size; i++)
{	
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
	
	draw_line(animatedPoints[i][0], animatedPoints[i][1], prevPoints.x, prevPoints.y);
}
