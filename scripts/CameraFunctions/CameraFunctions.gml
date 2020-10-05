//Everything here will get ran once when the game is started
//Use it to initialize shit

#macro viewWidth 640
#macro viewHeight 360

global.windowScale = 3;

window_set_fullscreen(true);

function scrSetPush(amount, direction){
	///@desc Push camera
	///@param amount
	///@param direction

	objCamera.pushX = lengthdir_x(amount, direction);
	objCamera.pushY = lengthdir_y(amount, direction);
}

function scrSetRotation(rotation, randomized){
	///@desc Rotate camera
	///@param amount
	///@param randomized

	var setRot = rotation;
	var rand = randomized;
	if (rand) setRot *= choose(-1, 1);

	objCamera.rot = setRot;
}

function scrSetShake(amount, duration){
	///@desc Shake camera
	///@param amount
	///@param duration

	objCamera.shakeAmount = amount;
	objCamera.shakeDuration = duration;
}

function scrSetZoom(amount) {
	///@desc Zoom camera
	///@param amount

	objCamera.zoomMultiplier = amount;
}