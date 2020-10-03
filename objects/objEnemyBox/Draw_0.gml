var thickness = 16;
for (var i = thickness; i > 0; --i) {
	var c = merge_color(c_white, c_black, i / 18);
    draw_sprite_ext(sprPixel, 0, drawX, drawY+i, image_xscale, image_yscale, image_angle, c, 1);
}


if (!erect) draw_sprite_ext(sprPixel, 0, drawX, drawY, maxImageScale, maxImageScale, image_angle, c_red, scrWave(0.1, 0.5, 1, 0));