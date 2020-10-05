flashAlpha = 0;
freezeDuration = 0;

part_system_layer(global.prtSys, "Pickups");
part_system_layer(global.ambientPrtSys, "Circle");

if (!audio_is_playing(sndMusic)) audio_play_sound(sndMusic, 10, true);