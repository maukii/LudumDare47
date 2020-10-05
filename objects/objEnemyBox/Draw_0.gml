var thickness = 16;
for (var i = thickness; i > 0; --i) {
	var c = merge_color(global.colBrown, c_black, i / 18);
    draw_sprite_ext(sprPixel, 0, drawX, drawY+i, image_xscale, image_yscale, image_angle, c, 1);
}


if (!erect && !decaying) draw_sprite_ext(sprPixel, 0, drawX, drawY, maxImageScale, maxImageScale, image_angle, global.colOrange, scrWave(0.1, 0.5, 1, 0));

if (alarm[10] != -1 && instance_exists(objCircleRacer)) draw_line_width(x, y, objCircleRacer.x, objCircleRacer.y, 2);