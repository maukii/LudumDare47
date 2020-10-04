draw_circle_color(x, y, radius, col, col, false);

enemyDestroyDistance = lerp(enemyDestroyDistance, enemyDestroyDistanceMax, 0.1);
draw_circle(x, y, enemyDestroyDistance, true);