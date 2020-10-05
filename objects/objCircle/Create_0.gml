radius = 120;
points = array_create(360, 0);
size = array_length(points);

offset = {
	x : 0,
	y : 0
}

center = {
	x : room_width * 0.5,
	y : room_height * 0.5
}

prevPoints = {
	x : 0,
	y : 0
}

waves = {
	amplitude : 0,
	frequency : 10,
	shape : 1,
	amplitudeTarget : 0,
	noise : 0,
	noiseTarget : 0
}

circleColor = c_white;
circleColorTarget = c_white;

var noiseAmplitude = 0;

for(var i = 0; i < size; i++) {
	var angle = 2 * pi * (i / size);
	
	var randX = random_range(-noiseAmplitude, noiseAmplitude);
	var randY = random_range(-noiseAmplitude, noiseAmplitude);
	offset.x = lerp(offset.x, randX, 0.1);	
	offset.y = lerp(offset.y, randY, 0.1);
	
	points[i][0] = center.x + (radius + offset.x) * cos(angle);
	points[i][1] = center.y + (radius + offset.y) * sin(angle);
}

animatedPoints = array_create(size, 0);
array_copy(animatedPoints, 0, points, 0, size);