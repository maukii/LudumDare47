flashAlpha = scrApproach(flashAlpha, 0, 0.05);

//Ambient particles
if (random(1) > 0.8 ) part_particles_create(global.ambientPrtSys, room_width/2, room_height/2, global.ambientPart, 1);

if (keyboard_check_pressed(ord("M"))) {
	musicToggle = !musicToggle;
	audio_sound_gain(sndMusic, musicToggle * musicVolume, 1000);
}