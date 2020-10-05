flashAlpha = scrApproach(flashAlpha, 0, 0.05);

//Ambient particles
if (random(1) > 0.8 ) part_particles_create(global.ambientPrtSys, room_width/2, room_height/2, global.ambientPart, 1);