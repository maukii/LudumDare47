/// @description Enemy spawner
// Choose random enemy type and initialize attack

difficulty = current_time / 60000;
screenCenterX = room_width * 0.5;
screenCenterY = room_height * 0.5;

enemies = array_create(3, 0)
enemies[0] = objEnemyCircle;
enemies[1] = objEnemyTriangle;
enemies[2] = objEnemyBox;

var enemy = enemies[random_range(0, array_length(enemies))]

//switch(enemy)
//{
//	case objEnemy: 
//		instance_create_layer(screenCenterX, screenCenterY, layer, objEnemy);
//		alarm[0] = attackFrequency;
//		break;
//}

posX = room_width * 0.5;
posY = room_height * 0.5;
instance_create_layer(posX, posY, layer, enemy);
alarm[0] = attackFrequency;