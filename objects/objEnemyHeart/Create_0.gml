if(instance_exists(objCircleRacer))
{
	player = objCircleRacer;
}
else
{
	player = noone;	
}

scr = 100;
size = 10;
moveSpeed = 0;
dir = 0;
distanceFromCenter = 5;

width = room_width * 0.5;
height = room_height * 0.5;

if(instance_exists(objCircleRacer))
{
	dir = point_direction(x, y, player.x, player.y);
}
x = width + lengthdir_x(distanceFromCenter, dir);
y = height + lengthdir_y(distanceFromCenter, dir);

image_angle = 0;
size = 0;
maxSize = 0.05;
image_xscale = 0;
image_yscale = 0;

audio_play_sound(sndLaunchHeart, 10, false);

if (!audio_is_playing(sndMuah)) audio_play_sound(sndMuah, 10, false);