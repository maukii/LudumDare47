//Set up quick reference
#macro view view_camera[0]

//Setup camera variables
camera_set_view_pos(view, 0, 0);
window_set_size(viewWidth * global.windowScale, viewHeight * global.windowScale);

//Center view
alarm[0] = 1;

//Apply camera
camera_set_view_size(view, room_width, room_height);
surface_resize(application_surface, viewWidth , viewHeight);

//Camera variables
xTo = 0;
yTo = 0;

//Camera shake variables
shakeDuration = 0;
shakeAmount = 0;
shakeX = 0;
shakeY = 0;

//Camera push variables
pushX = 0;
pushY = 0;

//Camera rotation
rot = 0;

function scrShake(){
	if (shakeDuration > 0)
	{
		var amount = irandom_range(-shakeAmount, shakeAmount);
		shakeX = amount;
		amount = irandom_range(-shakeAmount, shakeAmount);
		shakeY = amount;
	
		shakeDuration--;
	} else
	{
		shakeX = 0;
		shakeY = 0;
	}
}

function scrPush(){
	//Smoothly reset camera push
	pushX = scrApproach(pushX, 0, 1);
	pushY = scrApproach(pushY, 0, 1);
}

function scrRotate(){
	rot = lerp(rot, 0, 0.1);

	camera_set_view_angle(view, rot);
}