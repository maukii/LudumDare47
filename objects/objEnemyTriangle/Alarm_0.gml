// Launch triangle

launched = true;
moveSpeed = 1.2;

audio_play_sound(sndLaunchTrongle, 10, false);
if (!audio_is_playing(sndSpit)) audio_play_sound(sndSpit, 10, false);
scrSetShake(10, 10);