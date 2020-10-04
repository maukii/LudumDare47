//Animate loop points
var size = array_length(points);

for(var i = 0; i < size; i++) {
	var dir = point_direction(center.x, center.y, points[i][0], points[i][1]);
	
	animatedPoints[i][0] = points[i][0] + lengthdir_x(scrWave(-waves.amplitude, waves.amplitude, waves.frequency, i / size * waves.shape), dir);
	animatedPoints[i][1] = points[i][1] + lengthdir_y(scrWave2(-waves.amplitude, waves.amplitude, waves.frequency, i / size * waves.shape), dir);
}

//Blend amplitude seamlessly
waves.amplitude = scrApproach(waves.amplitude, waves.amplitudeTarget, 0.1);

//Ambient particles
if (random(1) > 0.8 ) part_particles_create(global.ambientPrtSys, center.x, center.y, global.ambientPart, 1);