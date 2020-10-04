//Animate loop points
var size = array_length(points);

for(var i = 0; i < size; i++) {
	var randX = random_range(-waves.noise, waves.noise);
	var randY = random_range(-waves.noise, waves.noise);
	offset.x = lerp(offset.x, randX, 0.1);	
	offset.y = lerp(offset.y, randY, 0.1);
	var dir = point_direction(center.x, center.y, points[i][0], points[i][1]);
	
	animatedPoints[i][0] = points[i][0] + lengthdir_x(scrWave(-waves.amplitude, waves.amplitude, waves.frequency, i / size * waves.shape), dir) + randX;
	animatedPoints[i][1] = points[i][1] + lengthdir_y(scrWave2(-waves.amplitude, waves.amplitude, waves.frequency, i / size * waves.shape), dir) + randY;
}

//Blend amplitude seamlessly
waves.amplitude = scrApproach(waves.amplitude, waves.amplitudeTarget, 0.1);
waves.noise = scrApproach(waves.noise, waves.noiseTarget, 1);

//Ambient particles
if (random(1) > 0.8 ) part_particles_create(global.ambientPrtSys, center.x, center.y, global.ambientPart, 1);