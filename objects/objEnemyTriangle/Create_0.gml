if(instance_exists(objCircleRacer))
{
	player = objCircleRacer;
}
else
{
	player = noone;	
}

loops = 0;
aimFrames = 100;
aimFactor = 2;
launchDelay = 120;
launched = false;
distanceFromCenter = 25;
moveSpeed = 0;
dir = 0;

width = room_width * 0.5;
height = room_height * 0.5;

alarm[0] = launchDelay;