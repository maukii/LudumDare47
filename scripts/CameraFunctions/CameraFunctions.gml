//Everything here will get ran once when the game is started
//Use it to initialize shit

#macro viewWidth 320
#macro viewHeight 320

global.windowScale = 3;

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