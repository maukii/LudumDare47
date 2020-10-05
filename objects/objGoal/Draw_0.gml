draw_sprite_ext(sprite_index, image_index, x, y + scrWave(-4, 4, 2, 0), image_xscale, image_yscale, 0, c_white, 1);

enemyDestroyDistance = lerp(enemyDestroyDistance, enemyDestroyDistanceMax, 0.1);
draw_circle(x, y, enemyDestroyDistance + scrWave(-2, 2, 1, 0), true);