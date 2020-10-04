dir = irandom(359);
moveSpeed = 1;
radius = 0;


scr = 2;

if (!audio_is_playing(sndLaunchCircle)) audio_play_sound(sndLaunchCircle, 10, false);

image_angle = irandom(359);
rotSpeed = 5;
image_xscale = 0.05;
image_yscale = 0.05;