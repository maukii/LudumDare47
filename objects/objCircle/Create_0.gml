radius = 100;
points = array_create(360, 0);

offset = {
	x : 0,
	y : 0
}

center = {
	x : room_width * 0.5,
	y : room_height * 0.5
}

for(var i = 0; i < array_length(points); i++) {
	var angle = 2 * pi * (i / array_length(points));
	
	var randX = random_range(-10, 10);
	var randY = random_range(-10, 10);
	offset.x = lerp(offset.x, randX, 0.1);	
	offset.y = lerp(offset.y, randY, 0.1);
	
	points[i][0] = center.x + (radius + offset.x) * cos(angle);
	points[i][1] = center.y + (radius + offset.y) * sin(angle);
}

//Create path
circlePath = path_add();

for(var i = 0; i < array_length(points); i++) {
	path_add_point(circlePath, points[i][0], points[i][1], 100);
}
