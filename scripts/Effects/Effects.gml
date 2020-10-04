//Init particles
global.prtSys = part_system_create();

//Player particles
global.playerPart = part_type_create();
var p = global.playerPart;
part_type_color1(p, c_lime);
part_type_speed(p, 0.5, 1, -0.01, 0);
part_type_shape(p, pt_shape_disk);
part_type_life(p, 60, 60);
part_type_size(p, 0.02, 0.1, -0.001, 0);

global.playerDashPart = part_type_create();
p = global.playerDashPart;
part_type_color1(p, c_lime);
part_type_speed(p, 1, 2, -0.01, 0);
part_type_shape(p, pt_shape_disk);
part_type_life(p, 100, 120);
part_type_size(p, 0.1, 0.2, -0.002, 0);

//Enemy particles
//Circle
global.circleEnemyPart = part_type_create();
p = global.circleEnemyPart;
part_type_color1(p, c_red);
part_type_speed(p, 0.5, 1, -0.01, 0);
part_type_shape(p, pt_shape_disk);
part_type_life(p, 30, 30);
part_type_size(p, 0.02, 0.06, -0.001, 0);

//Circle explosion
global.circleEnemyExplosionPart = part_type_create();
p = global.circleEnemyExplosionPart;
part_type_color1(p, c_red);
part_type_speed(p, 0.5, 1, -0.01, 0);
part_type_shape(p, pt_shape_disk);
part_type_life(p, 80, 120);
part_type_size(p, 0.1, 0.2, -0.002, 0);

//Trongle
global.trongleEnemyPart = part_type_create();
p = global.trongleEnemyPart;
part_type_color1(p, c_purple);
part_type_speed(p, 0.5, 1, -0.01, 0);
part_type_shape(p, pt_shape_line);
part_type_life(p, 30, 30);
part_type_size(p, 0.05, 0.1, -0.001, 0);
part_type_orientation(p, 0, 0, 0, 0, true);

//Trongle explosion
global.trongleEnemyExplosionPart = part_type_create();
p = global.trongleEnemyExplosionPart;
part_type_color1(p, c_purple);
part_type_speed(p, 0.5, 1, -0.01, 0);
part_type_shape(p, pt_shape_line);
part_type_life(p, 80, 120);
part_type_size(p, 0.1, 0.2, -0.002, 0);
part_type_orientation(p, 0, 0, 0, 0, true);

//Box spawning
global.boxEnemyPart = part_type_create();
p = global.boxEnemyPart;
part_type_color1(p, c_red);
part_type_speed(p, 0.5, 1, -0.01, 0);
part_type_shape(p, pt_shape_square);
part_type_life(p, 30, 30);
part_type_size(p, 0.02, 0.06, -0.001, 0);
part_type_direction(p, 0, 359, 0, 0);

function scrFlash (alpha) {
	objFXController.flashAlpha = alpha;
}

function scrCircleExplosion (amount) {
	part_type_direction(global.circleEnemyExplosionPart, 0, 359, 0, 0);
	part_particles_create(global.prtSys, x, y, global.circleEnemyExplosionPart, amount);
}	

function scrTrongleExplosion (amount) {
	part_type_direction(global.trongleEnemyExplosionPart, 0, 359, 0, 0);
	part_particles_create(global.prtSys, x, y, global.trongleEnemyExplosionPart, amount);
}


