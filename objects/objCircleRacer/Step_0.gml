//Jank to get new path points every frame
path_start(objCircle.circlePath, 0, path_action_continue, true);

//Wrap around
if (pathLocation >= 1) {
	pathLocation = 0;
} else if (pathLocation <= 0) {
	pathLocation = 1;
}

//Move player
if (keyboard_check(ord("W"))) {
	pathLocation = scrApproach(pathLocation, 1, moveSpeed);
} else if (keyboard_check(ord("S"))) {
	pathLocation = scrApproach(pathLocation, 0, moveSpeed);
}

path_position = pathLocation;