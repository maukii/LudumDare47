//Init colors
global.colBrown = make_color_rgb(120, 41, 34);
global.colPink = make_color_rgb(255, 78, 88);
global.colYellow = make_color_rgb(255, 255, 1);
global.colOrange = make_color_rgb(255, 61, 17);
global.colMagenta = make_color_rgb(255, 0, 254);
global.colPurple = make_color_rgb(64, 49, 142);

global.textHighlightColor = global.colPurple;

//Init particles
global.prtSys = part_system_create();
global.ambientPrtSys = part_system_create();

//Player particles
global.playerPart = part_type_create();
var p = global.playerPart;
part_type_color1(p, global.colPurple);
part_type_speed(p, 0.5, 1, -0.01, 0);
part_type_shape(p, pt_shape_disk);
part_type_life(p, 60, 60);
part_type_size(p, 0.02, 0.1, -0.001, 0);

global.playerDashPart = part_type_create();
p = global.playerDashPart;
part_type_color1(p, global.colPurple);
part_type_speed(p, 1, 2, -0.01, 0);
part_type_shape(p, pt_shape_disk);
part_type_life(p, 100, 120);
part_type_size(p, 0.1, 0.2, -0.002, 0);

global.playerDashCooldownPart = part_type_create();
p = global.playerDashCooldownPart;
part_type_color1(p, global.colPurple);
part_type_speed(p, 2, 4, -0.01, 0);
part_type_shape(p, pt_shape_disk);
part_type_life(p, 30, 60);
part_type_size(p, 0.1, 0.2, -0.002, 0);
part_type_direction(p, 0, 359, 5, 0);

//Enemy particles
//Circle
global.circleEnemyPart = part_type_create();
p = global.circleEnemyPart;
part_type_color1(p, global.colPink);
part_type_speed(p, 0.5, 1, -0.01, 0);
part_type_shape(p, pt_shape_disk);
part_type_life(p, 30, 30);
part_type_size(p, 0.02, 0.06, -0.001, 0);

//Circle explosion
global.circleEnemyExplosionPart = part_type_create();
p = global.circleEnemyExplosionPart;
part_type_color1(p, global.colPink);
part_type_speed(p, 4, 8, -0.01, 0);
part_type_shape(p, pt_shape_disk);
part_type_life(p, 80, 120);
part_type_size(p, 0.2, 0.4, -0.003, 0);

//Trongle
global.trongleEnemyPart = part_type_create();
p = global.trongleEnemyPart;
part_type_color1(p, global.colMagenta);
part_type_speed(p, 0.5, 1, -0.01, 0);
part_type_shape(p, pt_shape_line);
part_type_life(p, 30, 30);
part_type_size(p, 0.05, 0.1, -0.001, 0);
part_type_orientation(p, 0, 0, 0, 0, true);

//Trongle explosion
global.trongleEnemyExplosionPart = part_type_create();
p = global.trongleEnemyExplosionPart;
part_type_color1(p, global.colMagenta);
part_type_speed(p, 4, 8, -0.01, 0);
part_type_shape(p, pt_shape_line);
part_type_life(p, 80, 120);
part_type_size(p, 0.2, 0.4, -0.003, 0);
part_type_orientation(p, 0, 0, 0, 0, true);

//Box spawning
global.boxEnemyPart = part_type_create();
p = global.boxEnemyPart;
part_type_color1(p, global.colPink);
part_type_speed(p, 0.5, 1, -0.01, 0);
part_type_shape(p, pt_shape_square);
part_type_life(p, 30, 30);
part_type_size(p, 0.02, 0.06, -0.001, 0);
part_type_direction(p, 0, 359, 5, 0);

//Jan explosion
global.janEnemyExplosionPart = part_type_create();
p = global.janEnemyExplosionPart;
part_type_color1(p, global.colPink);
part_type_speed(p, 4, 8, -0.01, 0);
part_type_sprite(p, sprParticles, false, false, true);
part_type_life(p, 80, 120);
part_type_size(p, 0.2, 0.4, -0.003, 0);
part_type_gravity(p, 0.001 ,270);
part_type_direction(p, 0, 359, 1, 0);

//Jan damage
global.janEnemyDamagePart = part_type_create();
p = global.janEnemyDamagePart;
part_type_color1(p, global.colPurple);
part_type_speed(p, 2, 4, -0.01, 0);
part_type_sprite(p, sprTear, false, false, true);
part_type_life(p, 80, 120);
part_type_size(p, 0.2, 0.4, -0.003, 0);
part_type_gravity(p, 0.01 ,270);
part_type_direction(p, 180, 359, 1, 0);
part_type_orientation(p, 0, 0, 0, 0, true);

//Ambient particles
global.ambientPart = part_type_create();
var p = global.ambientPart;
part_type_color1(p, c_white);
part_type_speed(p, 0, 0, 0.01, 0);
part_type_sprite(p, sprParticles, false, false, true);
part_type_life(p, 720, 720);
part_type_size(p, 0, 0, 0.001, 0);
part_type_direction(p, 0, 359, 1, 0);
part_type_orientation(p, 0, 0, 5, 2, false);
part_type_alpha1(p, 0.1);
part_type_blend(p, false);

function scrFlash (alpha) {
	objFXController.flashAlpha = alpha;
}

function scrCircleExplosion (amount) {
	part_type_direction(global.circleEnemyExplosionPart, 0, 359, 0, 0);
	part_particles_create(global.prtSys, x, y, global.circleEnemyExplosionPart, amount);
	if (!audio_is_playing(sndCircleExplosion)) audio_play_sound(sndCircleExplosion, 10, false);
}	

function scrTrongleExplosion (amount) {
	part_type_direction(global.trongleEnemyExplosionPart, 0, 359, 0, 0);
	part_particles_create(global.prtSys, x, y, global.trongleEnemyExplosionPart, amount);
	if (!audio_is_playing(sndTrongleExplosion)) audio_play_sound(sndTrongleExplosion, 10, false);
}

function scrBoxExplosion (amount) {
	repeat (amount) instance_create_layer(x, y, "Enemies", objBoxGib);
	if (!audio_is_playing(sndBoxExplosion)) audio_play_sound(sndBoxExplosion, 10, false);
}

function scrHeartExplosion () {
	var heartPiece = instance_create_layer(x, y, "Enemies", objHeartPiece);
	heartPiece.hsp = -1;

	heartPiece = instance_create_layer(x, y, "Enemies", objHeartPiece);
	heartPiece.hsp = 1;
	heartPiece.image_index = 1;
	if (!audio_is_playing(sndHeartExplosion)) audio_play_sound(sndHeartExplosion, 10, false);
	scrFreeze(400);
}

function scrJanDeathParticles (amount) {
	part_type_color1(global.janEnemyExplosionPart, make_color_hsv(irandom(255), 255, 255));
	part_particles_create(global.ambientPrtSys, x, y, global.janEnemyExplosionPart, amount);
}

function scrJanDamageParticles (amount) {
	part_particles_create(global.ambientPrtSys, x, y, global.janEnemyDamagePart, amount);
}


function scrSpawnText(xx, yy, text) {
	var t = instance_create_layer(xx, yy, "Instances", objFloatingText);
	t.txt = text;
}

function scrFreeze(duration){
	///@desc Freeze game
	///@param duration

	objFXController.freezeDuration = duration;
	objFXController.alarm[0] = 1;
}

function scrFlashSpiralColor(r, g, b, brightness) {
	objBackground.white[0] = r * brightness;
	objBackground.white[1] = g * brightness;
	objBackground.white[2] = b * brightness;
}

function scrSetSpiralColor(r, g, b) {
	objBackground.rTarget = r;
	objBackground.gTarget = g;
	objBackground.bTarget = b;
}

function scrSetSpiralSpeed(multiplier) {
	objBackground.timeMultiplier = multiplier;
}

function scrFlashCircleColor(color) {
	objCircle.circleColor = color;
}

function scrSetCircleColor(color) {
	objCircle.circleColorTarget = color;
}