/// @description Enemy spawner
// Create enemy

posX = room_width * 0.5;
posY = room_height * 0.5;
instance_create_layer(posX, posY, layer, objEnemy);
alarm[0] = spawnFrequency;