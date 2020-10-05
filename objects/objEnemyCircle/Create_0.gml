dir = irandom(359);
moveSpeed = 1;
radius = 0;


scr = 2;

if (!audio_is_playing(sndLaunchCircle)) audio_play_sound(sndLaunchCircle, 10, false);
if (!audio_is_playing(sndSpit)) audio_play_sound(sndSpit, 10, false);

image_angle = irandom(359);
rotSpeed = 5;
size = 0;
maxSize = 0.05;
image_xscale = 0;
image_yscale = 0;